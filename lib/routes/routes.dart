const RootRoute = "/";

const OverViewPageDisplayName = "Overview";
const OverViewPageRoute = "/overview";

const DriverPageDisplayName = "Drivers";
const DriverPageRoute = "/drivers";

const ClientsPageDisplayName = "Clients";
const ClientsPageRoute = "/clients";

const AuthinticationPageDisplayName = "Log Out";
const AuthinticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(OverViewPageDisplayName, OverViewPageRoute),
  MenuItem(DriverPageDisplayName, DriverPageRoute),
  MenuItem(ClientsPageDisplayName, ClientsPageRoute),
  MenuItem(AuthinticationPageDisplayName, AuthinticationPageRoute),
];
