import 'package:datagrid/models/project.dart';

List<Project> getProjects() {
  
  return [
    Project(
      projectId: "proj001",
      name: "Projeto Alpha",
      shortDescription: "Primeiro projeto de teste",
      startDate: "2023-10-01",
      status: "Em andamento",
      updatedAt: "2023-10-10",
      logoImageUrl: "https://exemplo.com/logo_alpha.png",
      endDate: "2023-12-31",
      hashtag: "#ProjetoAlpha",
      type: "Tecnologia",
      address: Address(
        city: "São Paulo",
        state: "SP",
        number: "123",
        street: "Av. Paulista",
        country: "Brasil",
        complement: "Apto 45",
        postalCode: "01311-200",
        neighborhood: "Bela Vista",
      ),
      targetBudget: "100000",
      organization: Organization(
        tradeName: "Empresa Exemplo 1",
        organizationId: "org001",
        type: "ONG",
        logoImageUrl: "https://exemplo.com/logo1.png",
        address: Address(
          city: "São Paulo",
          state: "SP",
          number: "123",
          street: "Av. Paulista",
          country: "Brasil",
          complement: "Apto 45",
          postalCode: "01311-200",
          neighborhood: "Bela Vista",
        ),
      ),
      wallet: Wallet(
        walletId: "wallet001",
        status: "Ativa",
      ),
    ),
    Project(
      projectId: "proj002",
      name: "Projeto Beta",
      shortDescription: "Segundo projeto de teste",
      startDate: "2023-09-01",
      status: "Concluído",
      updatedAt: "2023-10-02",
      logoImageUrl: "https://exemplo.com/logo_beta.png",
      endDate: "2023-11-30",
      hashtag: "#ProjetoBeta",
      type: "Educação",
      address: Address(
        city: "Rio de Janeiro",
        state: "RJ",
        number: "456",
        street: "Rua do Ouvidor",
        country: "Brasil",
        complement: "Sala 301",
        postalCode: "20040-030",
        neighborhood: "Centro",
      ),
      targetBudget: "200000",
      organization: Organization(
        tradeName: "Empresa Exemplo 2",
        organizationId: "org002",
        type: "Empresa Privada",
        logoImageUrl: "https://exemplo.com/logo2.png",
        address: Address(
          city: "Rio de Janeiro",
          state: "RJ",
          number: "456",
          street: "Rua do Ouvidor",
          country: "Brasil",
          complement: "Sala 301",
          postalCode: "20040-030",
          neighborhood: "Centro",
        ),
      ),
      wallet: Wallet(
        walletId: "wallet002",
        status: "Inativa",
      ),
    ),
    Project(
      projectId: "proj003",
      name: "Projeto Gama",
      shortDescription: "Terceiro projeto de simulação",
      startDate: "2023-07-15",
      status: "Em planejamento",
      updatedAt: "2023-09-15",
      logoImageUrl: "https://exemplo.com/logo_gama.png",
      endDate: "2023-12-15",
      hashtag: "#ProjetoGama",
      type: "Saúde",
      address: Address(
        city: "São Paulo",
        state: "SP",
        number: "123",
        street: "Av. Paulista",
        country: "Brasil",
        complement: "Apto 45",
        postalCode: "01311-200",
        neighborhood: "Bela Vista",
      ),
      targetBudget: "150000",
      organization: Organization(
        tradeName: "Empresa Exemplo 1",
        organizationId: "org001",
        type: "ONG",
        logoImageUrl: "https://exemplo.com/logo1.png",
        address: Address(
          city: "São Paulo",
          state: "SP",
          number: "123",
          street: "Av. Paulista",
          country: "Brasil",
          complement: "Apto 45",
          postalCode: "01311-200",
          neighborhood: "Bela Vista",
        ),
      ),
      wallet: Wallet(
        walletId: "wallet001",
        status: "Ativa",
      ),
    ),
    Project(
      projectId: "proj004",
      name: "Projeto Delta",
      shortDescription: "Quarto projeto em desenvolvimento",
      startDate: "2023-08-01",
      status: "Em desenvolvimento",
      updatedAt: "2023-09-10",
      logoImageUrl: "https://exemplo.com/logo_delta.png",
      endDate: "2023-10-31",
      hashtag: "#ProjetoDelta",
      type: "Energia",
      address: Address(
        city: "Rio de Janeiro",
        state: "RJ",
        number: "456",
        street: "Rua do Ouvidor",
        country: "Brasil",
        complement: "Sala 301",
        postalCode: "20040-030",
        neighborhood: "Centro",
      ),
      targetBudget: "500000",
      organization: Organization(
        tradeName: "Empresa Exemplo 2",
        organizationId: "org002",
        type: "Empresa Privada",
        logoImageUrl: "https://exemplo.com/logo2.png",
        address: Address(
          city: "Rio de Janeiro",
          state: "RJ",
          number: "456",
          street: "Rua do Ouvidor",
          country: "Brasil",
          complement: "Sala 301",
          postalCode: "20040-030",
          neighborhood: "Centro",
        ),
      ),
      wallet: Wallet(
        walletId: "wallet002",
        status: "Inativa",
      ),
    ),
  ];
}
