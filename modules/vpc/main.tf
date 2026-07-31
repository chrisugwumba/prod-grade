
/***
# VPC Provisioning Using variables definitions
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = merge(
    var.tags,
    {
      Name = "dev-vpc"
    }
  )
}




# Subnets Declarations
resource "aws_subnet" "subnets" {
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets_cidr[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]
  }
}


#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}


#Route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" # Public
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "MyRouteTB"
  }
}

***/


#VPC Resource declaration using locals declaration foor your variables
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-vpc"
    }
  )
}

# Subnets Declarations
resource "aws_subnet" "subnets" {
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets_cidr[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-${var.subnet_names[count.index]}"
    }
  )
}


#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-igw"
    }
  )
}


#Route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" # Public
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-public-rt"
    }
  )
}


# Route Table Associations
resource "aws_route_table_association" "example" {
  count          = length(var.subnets_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id
}