A fork that extends Visual Subnet Calculator from:
- https://github.com/nickromney/visualsubnetcalc
- https://github.com/ckabalan/visualsubnetcalc/pull/33
- https://github.com/ckabalan/visualsubnetcalc/pull/40

# Visual Subnet Calculator - [visualsubnetcalc.com](https://visualsubnetcalc.com)

![demo.gif](src%2Fdemo.gif)

Visual Subnet Calculator is a modernized tool based on the original work by [davidc](https://github.com/davidc/subnets).
It strives to be a tool for quickly designing networks and collaborating on that design with others. It focuses on
expediting the work of network administrators, not academic subnetting math.

## Key Features

- **Visual Subnet Design** - Split and join subnets with a single click
- **Auto-allocation** - Automatically allocate subnets based on size requirements
- **Network Analysis** - Validate alignment, detect gaps, and check utilization
- **Mirror Networks** - Generate mirror networks for blue-green deployments or DR sites
- **Multi-cloud Support** - AWS, Azure, and OCI subnet modes with proper address reservations
- **Additional Columns** - Toggle IP, CIDR, Mask, and Type columns for detailed views
- **Export Options** - Copy tables to Excel/Confluence, share via URL, or print
- **Color Coding** - Visually organize subnets with colors and notes

### Smart Clipboard Integration

Visual Subnet Calculator uses modern clipboard APIs to provide seamless integration with different applications. When you copy a table using the "Copy Table" button, the clipboard receives the data in multiple formats simultaneously:

- **Plain Text Format (TSV)** - Tab-separated values for Excel and similar spreadsheet applications
- **HTML Table Format** - Properly structured HTML tables for Confluence, Word, and other rich-text applications

This dual-format approach means you copy once and paste anywhere - each application automatically selects the format it prefers. Excel will use the TSV format to create proper cells and columns, while Confluence will use the HTML format to create a formatted table. This eliminates the need for manual reformatting after pasting.

## Design Tenets

The following tenets are the most important values that drive the design of the tool. New features, pull requests, etc
should align to these tenets, or propose an adjustment to the tenets.

- **Simplicity is king.** Network admins are busy and Visual Subnet Calculator should always be easy for FIRST TIME USERS to
  quickly and intuitively use.
- **Subnetting is design work.** Promote features that enhance visual clarity and easy mental processing of even the most
  complex architectures.
- **Users control the data.** We store nothing, but provide convenient ways for users to save and share their designs.
- **Embrace community contributions.** Consider and respond to all feedback and pull requests in the context of these
  tenets.

## Cloud Subnet Notes

### Standard mode:

- Smallest subnet: /32
- Two reserved addresses per subnet of size <= 30:
  - Network Address (network + 0)
  - Broadcast Address (last network address)

### AWS mode ([docs](https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html)):

- Smallest subnet: /28
- Five reserved addresses per subnet:
  - Network Address (network + 0)
  - AWS Reserved - VPC Router
  - AWS Reserved - VPC DNS
  - AWS Reserved - Future Use
  - Broadcast Address (last network address)

### Azure mode ([docs](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-faq#are-there-any-restrictions-on-using-ip-addresses-within-these-subnets)):

- Smallest subnet: /29
- Five reserved addresses per subnet:
  - Network Address (network + 0)
  - Azure Reserved - Default Gateway
  - Azure Reserved - DNS Mapping
  - Azure Reserved - DNS Mapping
  - Broadcast Address (last network address)

### GCP mode ([docs](https://cloud.google.com/vpc/docs/subnets#unusable-ip-addresses-in-every-subnet)):

- Smallest subnet: /29
- Four reserved addresses per subnet:
  - Network Address (network + 0)
  - GCP Reserved - Default Gateway (network + 1)
  - GCP Reserved - Future Use (second-to-last address)
  - Broadcast Address (last network address)

### OCI mode ([docs](https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/overview.htm#Reserved__reserved_subnet)):

- Smallest subnet: /30
- Three reserved addresses per subnet:
  - Network Address (network + 0)
  - OCI Reserved - Default Gateway Address (network + 1)
  - Broadcast Address (last network address)

## Building From Source

If you have a more opinionated best-practice way to lay out this repository please open an issue.

Build prerequisites:

- (Optional but recommended) NVM to manage node version
- node.js (version 20) and associated NPM.
- sass (Globally installed, following instructions below.)

Compile from source:

```shell
# Clone the repository
git clone https://github.com/sharevb/visualsubnetcalc
# Change to the repository directory
cd visualsubnetcalc
# Use recommended NVM version
nvm use
# Install Bootstrap
npm install
# Compile Bootstrap (Also install sass command line globally)
npm run build
# Run the local webserver
npm start
```

The full application should then be available within `./dist/`, open `./dist/index.html` in a browser.

### Run with certificates (Optional)

**_NB:_** _required for testing clipboard.writeText() in the browser. Feature is only available in secure (https) mode._

```shell
#Install mkcert
brew install mkcert
# generate CA Certs to be trusted by local browsers
mkcert install
# generate certs for local development
cd visualsubnetcalc
# generate certs for local development
npm run setup:certs
# run the local webserver with https
npm run local-secure-start
```

## Running in a container

The application is also available as a container from https://hub.docker.com/r/sharevb/visualsubnetcalc.
The container is built automatically and pushed to dockerhub on pushes to the main branch and when when a new git tag is created.

### Available Image Tags

| Image Tag | Description                                                                                           |
| --------- | ----------------------------------------------------------------------------------------------------- |
| latest    | The latest container image that points to the most recent semantic version built from the main branch |

### Running locally

```bash
# Unprivilged container exposes port 8080 and runs as a non root user.
docker run -d -p8080:8080 --name visualsubnetcalc sharevb/visualsubnetcalc:latest
```

## Credits

Split icon made by [Freepik](https://www.flaticon.com/authors/freepik) from [Flaticon](https://www.flaticon.com/).

## License

Visual Subnet Calculator is released under the [MIT License](https://opensource.org/licenses/MIT)
