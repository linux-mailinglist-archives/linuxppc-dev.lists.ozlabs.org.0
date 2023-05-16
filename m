Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF4370422A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:16:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxbp1Jyvz3fN9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:16:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OTo7QkO6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OTo7QkO6;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH055pgz3f67
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZVrAmSPHUFAvoclZ5pk9lbde9kItuAo11KB8n0STqne3u1KrtJ66oWeGw2IWuuP0yIqWjjokKKxpb+9H5AGo3SDGSuTjBnON1WhdLtRAdwX64QEtO3Utr3j5Bj20wcwwXokPPiffNuXfT7+ea50UzcyeaOPrc19I3KZlKu18Hdmo4JUMHohQnyr8HYskupyT03nUry77jQsDE6Rj8TnESCrfLG8y3cOkI11Qgy5b/6JIf6JMPz/1+zNqNJXHzJz12CsbX7SCbUfoPooEH5RwxoTLNRc0je7x8Q9yIppjp9rpIiFqqE+czzmopK6F0tEQQYYTQ3msPuigtG+vVPrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTCY5wYW8HuNpNfJuNLCRC9bCGdZvfkHbQtUVXMSfuc=;
 b=Y325QH+pJTYjpyS3JAAcbN+L1gYt6RYzRrDsvqBY63/tDVpPZM5bPWHgILVXdWG+7qEbT0tltbdk9s9nt3LcmFOfGIBF0m2LbfHHFI8kOJAQLl+aeMXREYF9VkuENB/BioGImSB2qpBXWtNLU56d+nhJ/CkESovna7bIe/B9NqFBLJ4+7vfE3+a/zUriQw7xaoUj86ahad0GtF/l6TS+FxypFUdtIF9RGQmRO8fQEqQl9M9sXkO/k28GcjOOKHA+XOmLWF3pZzd+VIiO+RXfvW9KLlhZaVbNHtduwhT62vSRUFTpyKMVXkKFr476dTsEe45ipdUME/wNDLWajqAhYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTCY5wYW8HuNpNfJuNLCRC9bCGdZvfkHbQtUVXMSfuc=;
 b=OTo7QkO6e2Fh7SURXQxi35qB/WGWRCt1XL6jlmrAOs4U8pfcfOcxrcy4vr6HVFgbZbQ82u+pYtwz062fgKJ7SHsgTse5+z+eG87+jVrxOiK0OrayNDFJyDkIPeIVGr6GTF2jnLXq189dETqJzpoEMFqmUehSGKm2bhh4aDUOkU+/HmRdovjCpsxd+ZoizmivOrPLR3p4wofjK+zRyRdDCwedFsY/PlIpUx5f5E9/ZjMceH7NdmkWEBSX1kFh6LqMBgCsEuqfLQZM4VNf2SxOGfqqilI2bUOX9iAmbKFiQSEcWXDWqwfd83gPTLUn57qxHshz3XhvxLIsutEpKI4LdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:14 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v2 05/25] iommu/tegra-gart: Remove tegra-gart
Date: Mon, 15 May 2023 21:00:38 -0300
Message-Id: <5-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0004.namprd17.prod.outlook.com
 (2603:10b6:208:15e::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: d168f128-bbf4-4ff2-766e-08db55a0a371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	B2oRDtIemHjUd2/RtbfVAYA6IgtyU3InspbS7GDWuTiGI52y1zDN11stJaB4MLbvuvb/VY6DEzNmdHX2ejvpQQmAbAGobfjLpS7QUyIGBpb3/GuDwbbX4eu7am3dBt3HTiTcvpcui52j2dgzxnGjB+5+odxyUDKDwAVJ8HJqX4aslp1a9zbSLxUHVODeCc2alNPreHjAq4Fas0ZbAOh97Gpe3ecTTniwwzcAQlLJHhiwj1MWE3ApcdY6M2U5GmLOh6/T1m7xW8JxOC3QfKiHIZ36GEJuwptZkFNYHrbj3tpYpOpO8NtkLzpmJqX3CFoJazasDvYX+o84EbXD0mkmC+Ja+dUiY7BFQeYG4jnkQAoUgc+cAn9xri64TCeV0kdmdtvmjETLyrcV44/fQaRwn8E1xLfsR0hICofk/cVJUqEhm5JlAaIRXYA4h9F+uEL+30I1zvb3nvBj9/n/BwVv5tespA2V399MpogmaXGHJt+7PgOSCrvFMqauWjXllR3lXr26f8nY5/Jk58AnlHxcJ5RV647x9Qmbdq10yl3q59gjuuEM2jAyUqkMfW+qsoIwUGBXg658UYmYddyownlfpssimLYl1f/+2DAufvIptfBY8mVC+wGxt5HYhIZSsfg6
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(30864003)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ABCqp/Ulc1Uax1F0LPumwiAjUm7z1eyUOmxg8VwwseOhf5prSwBEgLbT74Mc?=
 =?us-ascii?Q?D1mUlEZyqRNNUVoFBLXbWQVKOMjCIEiBTyqrPJLYTboIKji1/qI8AVw7xnfu?=
 =?us-ascii?Q?AUli0TXEbc3ois9OgrCZ+xHcXVJ3GiTLpnA5NpCKEHLia3O9hnQhOrhLzz9w?=
 =?us-ascii?Q?eGsNt43SixLZ0o1nVa5lKprW+U78CW8+XN7cKPE+8xN9MeiUmGaPSvz3AIuD?=
 =?us-ascii?Q?Bwm74YAGfTLIFwSqOFC/pzzV+/LOWGI5/A7roQkJbnA+SG1rCA9zh2e1/Pdm?=
 =?us-ascii?Q?vMZw3S4iGLvY6q364vdXKHLgTiyss5dmILr43gzBOUHvf3g8vgB2x7rClJX/?=
 =?us-ascii?Q?eIedo8XyyA8NV2EgYo24CQpEU2xruYXdUzCQehVaYs7clOf6XuI9l6+ja/OU?=
 =?us-ascii?Q?HF3PdEB8SFGqCk1S9JQNJTcuMYrm/wh/4gE+m4o2v2F7RhnWnxFXl3pQX32q?=
 =?us-ascii?Q?fx5svuXkWo/MLnRzXZ+kIg0ps5KDfr3wEd+Ka50qjkUujgrb5uNQz3dVTPma?=
 =?us-ascii?Q?f4jS2JxzUbLU6/bVRpzIJA8yfrUfgnaO3hOEQmKx+9R3yBPB/jEdC6DXMmZT?=
 =?us-ascii?Q?l9sJQ87PeWNy5HGuz+/gxqSeZ54RAA1ClVPe9w2fnKBRC0shLYH/w35c2Cgd?=
 =?us-ascii?Q?hmamkjBiRxEVA6tAyt3CdfP7TPvRVitjXiekKrafYmExcV4yfiBn+J/BXuLP?=
 =?us-ascii?Q?wBaox4Y0vagHyjAOYcJhzjQYOhPqLIJzolGLua6UYf/DNHI/Kd+aO/FR+nRk?=
 =?us-ascii?Q?1ju3H5XFomsInYGtqhWVrDVPtxVfdOcpg+uLpkQFCScaljiSbA59EB+U93kp?=
 =?us-ascii?Q?FKPg483Wcdz78IFIfp+dJ5RtS3jBDOCV5ICY/x8FECD8mMhIloobme//Wu1Z?=
 =?us-ascii?Q?o0FgpDLK2PMe38hlHLgMQl6yoLAOCsRZes6J6E1hRbrg32X2EPaQFSyqHKXA?=
 =?us-ascii?Q?/Vp7jpewXY0lpwTbXpZfcpX0Ezq9LlAYJii56oa1g5e+mFgs/V5eZ4knmlAb?=
 =?us-ascii?Q?hS7LcUT2dQU1ebX1U7QILSc2Widt9WywKicEylt3uDbxZOSCgw6HocvDFhzD?=
 =?us-ascii?Q?crISV2OW9NGaHtbRKjUuFEHMYBw2JZ7Dv9bWxIrDEsNkHeTm7PjJ1hBjTH78?=
 =?us-ascii?Q?1IdJtFPnT/lZU2zRiHUmYbmedPR54jv4hDyk7fjSrO4ABzSY4mzmNl2EFKFs?=
 =?us-ascii?Q?4ZBDe/4SoKhmGUBzrMlRPZS2zQhCxfZAQYqvFgoYm7dtn4D3VYurDsYzT0tj?=
 =?us-ascii?Q?yaLr4mrZ4UI2yncFzaUgS64NiN/MIDsERmSVYjJKp6n2HHvJrVy/wguke5YR?=
 =?us-ascii?Q?AkQ6kPtsnevzQygsgEBoKLNVdZd0uqmuhqCLUCzwAUkeNLEzFNOCXvfUMvsG?=
 =?us-ascii?Q?MHbw2rdAfNr5OiULME0IR9HWxLmiwZdFROZJx5rPvmvjDFYFq6n3FxaDY2zj?=
 =?us-ascii?Q?MCvftPzEM3WwCIIF/dKXUK7gfP1wiotjALquAhccdK3B9nznwOXeZCiY/Lk/?=
 =?us-ascii?Q?HuDUaBTf6pH95WQXXey41taCiZQ1OHfmSaFDtMsELwCmrN6SNTi2DuATKocz?=
 =?us-ascii?Q?RAQLIxZLYSol16EmGl7vwYZ0FauPFvg130w2gXHM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d168f128-bbf4-4ff2-766e-08db55a0a371
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:03.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnNqQp8YKAeTSUoJN0G8BbNoNY7ZZNeHRQ5u0r3/kKSyOs4lcsBWel4ma72kP89+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thierry says this is not used anymore, and doesn't think it ever will
be. The HW it supports is about 10 years old now and newer HW uses
different IOMMU drivers.

As this is the only driver with a GART approach, and it doesn't really
meet the driver expectations from the IOMMU core, let's just remove it
so we don't have to think about how to make it fit in.

It has a number of identified problems:
 - The assignment of iommu_groups doesn't match the HW behavior

 - It claims to have an UNMANAGED domain but it is really an IDENTITY
   domain with a translation aperture. This is inconsistent with the core
   expectation for security sensitive operations

 - It doesn't implement a SW page table under struct iommu_domain so
   * It can't accept a map until the domain is attached
   * It forgets about all maps after the domain is detached
   * It doesn't clear the HW of maps once the domain is detached
     (made worse by having the wrong groups)

Cc: Thierry Reding <treding@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/arm/configs/multi_v7_defconfig |   1 -
 arch/arm/configs/tegra_defconfig    |   1 -
 drivers/iommu/Kconfig               |  11 -
 drivers/iommu/Makefile              |   1 -
 drivers/iommu/tegra-gart.c          | 371 ----------------------------
 drivers/memory/tegra/mc.c           |  34 ---
 drivers/memory/tegra/tegra20.c      |  28 ---
 include/soc/tegra/mc.h              |  26 --
 8 files changed, 473 deletions(-)
 delete mode 100644 drivers/iommu/tegra-gart.c

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 871fffe92187bf..daba1afdbd1100 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1063,7 +1063,6 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_QCOM_IPCC=y
 CONFIG_ROCKCHIP_IOMMU=y
-CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_EXYNOS_IOMMU=y
 CONFIG_QCOM_IOMMU=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index f32047e24b633e..ad31b9322911ce 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -293,7 +293,6 @@ CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
-CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index db98c3f86e8c8b..79e5b69c6b7647 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -235,17 +235,6 @@ config SUN50I_IOMMU
 	help
 	  Support for the IOMMU introduced in the Allwinner H6 SoCs.
 
-config TEGRA_IOMMU_GART
-	bool "Tegra GART IOMMU Support"
-	depends on ARCH_TEGRA_2x_SOC
-	depends on TEGRA_MC
-	select IOMMU_API
-	help
-	  Enables support for remapping discontiguous physical memory
-	  shared with the operating system into contiguous I/O virtual
-	  space through the GART (Graphics Address Relocation Table)
-	  hardware included on Tegra SoCs.
-
 config TEGRA_IOMMU_SMMU
 	bool "NVIDIA Tegra SMMU Support"
 	depends on ARCH_TEGRA
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 769e43d780ce89..95ad9dbfbda022 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_OMAP_IOMMU) += omap-iommu.o
 obj-$(CONFIG_OMAP_IOMMU_DEBUG) += omap-iommu-debug.o
 obj-$(CONFIG_ROCKCHIP_IOMMU) += rockchip-iommu.o
 obj-$(CONFIG_SUN50I_IOMMU) += sun50i-iommu.o
-obj-$(CONFIG_TEGRA_IOMMU_GART) += tegra-gart.o
 obj-$(CONFIG_TEGRA_IOMMU_SMMU) += tegra-smmu.o
 obj-$(CONFIG_EXYNOS_IOMMU) += exynos-iommu.o
 obj-$(CONFIG_FSL_PAMU) += fsl_pamu.o fsl_pamu_domain.o
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
deleted file mode 100644
index a482ff838b5331..00000000000000
--- a/drivers/iommu/tegra-gart.c
+++ /dev/null
@@ -1,371 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * IOMMU API for Graphics Address Relocation Table on Tegra20
- *
- * Copyright (c) 2010-2012, NVIDIA CORPORATION.  All rights reserved.
- *
- * Author: Hiroshi DOYU <hdoyu@nvidia.com>
- */
-
-#define dev_fmt(fmt)	"gart: " fmt
-
-#include <linux/io.h>
-#include <linux/iommu.h>
-#include <linux/moduleparam.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/vmalloc.h>
-
-#include <soc/tegra/mc.h>
-
-#define GART_REG_BASE		0x24
-#define GART_CONFIG		(0x24 - GART_REG_BASE)
-#define GART_ENTRY_ADDR		(0x28 - GART_REG_BASE)
-#define GART_ENTRY_DATA		(0x2c - GART_REG_BASE)
-
-#define GART_ENTRY_PHYS_ADDR_VALID	BIT(31)
-
-#define GART_PAGE_SHIFT		12
-#define GART_PAGE_SIZE		(1 << GART_PAGE_SHIFT)
-#define GART_PAGE_MASK		GENMASK(30, GART_PAGE_SHIFT)
-
-/* bitmap of the page sizes currently supported */
-#define GART_IOMMU_PGSIZES	(GART_PAGE_SIZE)
-
-struct gart_device {
-	void __iomem		*regs;
-	u32			*savedata;
-	unsigned long		iovmm_base;	/* offset to vmm_area start */
-	unsigned long		iovmm_end;	/* offset to vmm_area end */
-	spinlock_t		pte_lock;	/* for pagetable */
-	spinlock_t		dom_lock;	/* for active domain */
-	unsigned int		active_devices;	/* number of active devices */
-	struct iommu_domain	*active_domain;	/* current active domain */
-	struct iommu_device	iommu;		/* IOMMU Core handle */
-	struct device		*dev;
-};
-
-static struct gart_device *gart_handle; /* unique for a system */
-
-static bool gart_debug;
-
-/*
- * Any interaction between any block on PPSB and a block on APB or AHB
- * must have these read-back to ensure the APB/AHB bus transaction is
- * complete before initiating activity on the PPSB block.
- */
-#define FLUSH_GART_REGS(gart)	readl_relaxed((gart)->regs + GART_CONFIG)
-
-#define for_each_gart_pte(gart, iova)					\
-	for (iova = gart->iovmm_base;					\
-	     iova < gart->iovmm_end;					\
-	     iova += GART_PAGE_SIZE)
-
-static inline void gart_set_pte(struct gart_device *gart,
-				unsigned long iova, unsigned long pte)
-{
-	writel_relaxed(iova, gart->regs + GART_ENTRY_ADDR);
-	writel_relaxed(pte, gart->regs + GART_ENTRY_DATA);
-}
-
-static inline unsigned long gart_read_pte(struct gart_device *gart,
-					  unsigned long iova)
-{
-	unsigned long pte;
-
-	writel_relaxed(iova, gart->regs + GART_ENTRY_ADDR);
-	pte = readl_relaxed(gart->regs + GART_ENTRY_DATA);
-
-	return pte;
-}
-
-static void do_gart_setup(struct gart_device *gart, const u32 *data)
-{
-	unsigned long iova;
-
-	for_each_gart_pte(gart, iova)
-		gart_set_pte(gart, iova, data ? *(data++) : 0);
-
-	writel_relaxed(1, gart->regs + GART_CONFIG);
-	FLUSH_GART_REGS(gart);
-}
-
-static inline bool gart_iova_range_invalid(struct gart_device *gart,
-					   unsigned long iova, size_t bytes)
-{
-	return unlikely(iova < gart->iovmm_base || bytes != GART_PAGE_SIZE ||
-			iova + bytes > gart->iovmm_end);
-}
-
-static inline bool gart_pte_valid(struct gart_device *gart, unsigned long iova)
-{
-	return !!(gart_read_pte(gart, iova) & GART_ENTRY_PHYS_ADDR_VALID);
-}
-
-static int gart_iommu_attach_dev(struct iommu_domain *domain,
-				 struct device *dev)
-{
-	struct gart_device *gart = gart_handle;
-	int ret = 0;
-
-	spin_lock(&gart->dom_lock);
-
-	if (gart->active_domain && gart->active_domain != domain) {
-		ret = -EINVAL;
-	} else if (dev_iommu_priv_get(dev) != domain) {
-		dev_iommu_priv_set(dev, domain);
-		gart->active_domain = domain;
-		gart->active_devices++;
-	}
-
-	spin_unlock(&gart->dom_lock);
-
-	return ret;
-}
-
-static void gart_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct gart_device *gart = gart_handle;
-
-	spin_lock(&gart->dom_lock);
-
-	if (dev_iommu_priv_get(dev) == domain) {
-		dev_iommu_priv_set(dev, NULL);
-
-		if (--gart->active_devices == 0)
-			gart->active_domain = NULL;
-	}
-
-	spin_unlock(&gart->dom_lock);
-}
-
-static struct iommu_domain *gart_iommu_domain_alloc(unsigned type)
-{
-	struct iommu_domain *domain;
-
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
-	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
-	if (domain) {
-		domain->geometry.aperture_start = gart_handle->iovmm_base;
-		domain->geometry.aperture_end = gart_handle->iovmm_end - 1;
-		domain->geometry.force_aperture = true;
-	}
-
-	return domain;
-}
-
-static void gart_iommu_domain_free(struct iommu_domain *domain)
-{
-	WARN_ON(gart_handle->active_domain == domain);
-	kfree(domain);
-}
-
-static inline int __gart_iommu_map(struct gart_device *gart, unsigned long iova,
-				   unsigned long pa)
-{
-	if (unlikely(gart_debug && gart_pte_valid(gart, iova))) {
-		dev_err(gart->dev, "Page entry is in-use\n");
-		return -EINVAL;
-	}
-
-	gart_set_pte(gart, iova, GART_ENTRY_PHYS_ADDR_VALID | pa);
-
-	return 0;
-}
-
-static int gart_iommu_map(struct iommu_domain *domain, unsigned long iova,
-			  phys_addr_t pa, size_t bytes, int prot, gfp_t gfp)
-{
-	struct gart_device *gart = gart_handle;
-	int ret;
-
-	if (gart_iova_range_invalid(gart, iova, bytes))
-		return -EINVAL;
-
-	spin_lock(&gart->pte_lock);
-	ret = __gart_iommu_map(gart, iova, (unsigned long)pa);
-	spin_unlock(&gart->pte_lock);
-
-	return ret;
-}
-
-static inline int __gart_iommu_unmap(struct gart_device *gart,
-				     unsigned long iova)
-{
-	if (unlikely(gart_debug && !gart_pte_valid(gart, iova))) {
-		dev_err(gart->dev, "Page entry is invalid\n");
-		return -EINVAL;
-	}
-
-	gart_set_pte(gart, iova, 0);
-
-	return 0;
-}
-
-static size_t gart_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
-			       size_t bytes, struct iommu_iotlb_gather *gather)
-{
-	struct gart_device *gart = gart_handle;
-	int err;
-
-	if (gart_iova_range_invalid(gart, iova, bytes))
-		return 0;
-
-	spin_lock(&gart->pte_lock);
-	err = __gart_iommu_unmap(gart, iova);
-	spin_unlock(&gart->pte_lock);
-
-	return err ? 0 : bytes;
-}
-
-static phys_addr_t gart_iommu_iova_to_phys(struct iommu_domain *domain,
-					   dma_addr_t iova)
-{
-	struct gart_device *gart = gart_handle;
-	unsigned long pte;
-
-	if (gart_iova_range_invalid(gart, iova, GART_PAGE_SIZE))
-		return -EINVAL;
-
-	spin_lock(&gart->pte_lock);
-	pte = gart_read_pte(gart, iova);
-	spin_unlock(&gart->pte_lock);
-
-	return pte & GART_PAGE_MASK;
-}
-
-static struct iommu_device *gart_iommu_probe_device(struct device *dev)
-{
-	if (!dev_iommu_fwspec_get(dev))
-		return ERR_PTR(-ENODEV);
-
-	return &gart_handle->iommu;
-}
-
-static int gart_iommu_of_xlate(struct device *dev,
-			       struct of_phandle_args *args)
-{
-	return 0;
-}
-
-static void gart_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
-				size_t size)
-{
-	FLUSH_GART_REGS(gart_handle);
-}
-
-static void gart_iommu_sync(struct iommu_domain *domain,
-			    struct iommu_iotlb_gather *gather)
-{
-	size_t length = gather->end - gather->start + 1;
-
-	gart_iommu_sync_map(domain, gather->start, length);
-}
-
-static const struct iommu_ops gart_iommu_ops = {
-	.domain_alloc	= gart_iommu_domain_alloc,
-	.probe_device	= gart_iommu_probe_device,
-	.device_group	= generic_device_group,
-	.set_platform_dma_ops = gart_iommu_set_platform_dma,
-	.pgsize_bitmap	= GART_IOMMU_PGSIZES,
-	.of_xlate	= gart_iommu_of_xlate,
-	.default_domain_ops = &(const struct iommu_domain_ops) {
-		.attach_dev	= gart_iommu_attach_dev,
-		.map		= gart_iommu_map,
-		.unmap		= gart_iommu_unmap,
-		.iova_to_phys	= gart_iommu_iova_to_phys,
-		.iotlb_sync_map	= gart_iommu_sync_map,
-		.iotlb_sync	= gart_iommu_sync,
-		.free		= gart_iommu_domain_free,
-	}
-};
-
-int tegra_gart_suspend(struct gart_device *gart)
-{
-	u32 *data = gart->savedata;
-	unsigned long iova;
-
-	/*
-	 * All GART users shall be suspended at this point. Disable
-	 * address translation to trap all GART accesses as invalid
-	 * memory accesses.
-	 */
-	writel_relaxed(0, gart->regs + GART_CONFIG);
-	FLUSH_GART_REGS(gart);
-
-	for_each_gart_pte(gart, iova)
-		*(data++) = gart_read_pte(gart, iova);
-
-	return 0;
-}
-
-int tegra_gart_resume(struct gart_device *gart)
-{
-	do_gart_setup(gart, gart->savedata);
-
-	return 0;
-}
-
-struct gart_device *tegra_gart_probe(struct device *dev, struct tegra_mc *mc)
-{
-	struct gart_device *gart;
-	struct resource *res;
-	int err;
-
-	BUILD_BUG_ON(PAGE_SHIFT != GART_PAGE_SHIFT);
-
-	/* the GART memory aperture is required */
-	res = platform_get_resource(to_platform_device(dev), IORESOURCE_MEM, 1);
-	if (!res) {
-		dev_err(dev, "Memory aperture resource unavailable\n");
-		return ERR_PTR(-ENXIO);
-	}
-
-	gart = kzalloc(sizeof(*gart), GFP_KERNEL);
-	if (!gart)
-		return ERR_PTR(-ENOMEM);
-
-	gart_handle = gart;
-
-	gart->dev = dev;
-	gart->regs = mc->regs + GART_REG_BASE;
-	gart->iovmm_base = res->start;
-	gart->iovmm_end = res->end + 1;
-	spin_lock_init(&gart->pte_lock);
-	spin_lock_init(&gart->dom_lock);
-
-	do_gart_setup(gart, NULL);
-
-	err = iommu_device_sysfs_add(&gart->iommu, dev, NULL, "gart");
-	if (err)
-		goto free_gart;
-
-	err = iommu_device_register(&gart->iommu, &gart_iommu_ops, dev);
-	if (err)
-		goto remove_sysfs;
-
-	gart->savedata = vmalloc(resource_size(res) / GART_PAGE_SIZE *
-				 sizeof(u32));
-	if (!gart->savedata) {
-		err = -ENOMEM;
-		goto unregister_iommu;
-	}
-
-	return gart;
-
-unregister_iommu:
-	iommu_device_unregister(&gart->iommu);
-remove_sysfs:
-	iommu_device_sysfs_remove(&gart->iommu);
-free_gart:
-	kfree(gart);
-
-	return ERR_PTR(err);
-}
-
-module_param(gart_debug, bool, 0644);
-MODULE_PARM_DESC(gart_debug, "Enable GART debugging");
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 9082b6c3763dcc..e4d75c96bacec8 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -918,35 +918,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && !mc->soc->smmu) {
-		mc->gart = tegra_gart_probe(&pdev->dev, mc);
-		if (IS_ERR(mc->gart)) {
-			dev_err(&pdev->dev, "failed to probe GART: %ld\n",
-				PTR_ERR(mc->gart));
-			mc->gart = NULL;
-		}
-	}
-
-	return 0;
-}
-
-static int __maybe_unused tegra_mc_suspend(struct device *dev)
-{
-	struct tegra_mc *mc = dev_get_drvdata(dev);
-
-	if (mc->soc->ops && mc->soc->ops->suspend)
-		return mc->soc->ops->suspend(mc);
-
-	return 0;
-}
-
-static int __maybe_unused tegra_mc_resume(struct device *dev)
-{
-	struct tegra_mc *mc = dev_get_drvdata(dev);
-
-	if (mc->soc->ops && mc->soc->ops->resume)
-		return mc->soc->ops->resume(mc);
-
 	return 0;
 }
 
@@ -959,15 +930,10 @@ static void tegra_mc_sync_state(struct device *dev)
 		icc_sync_state(dev);
 }
 
-static const struct dev_pm_ops tegra_mc_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_mc_suspend, tegra_mc_resume)
-};
-
 static struct platform_driver tegra_mc_driver = {
 	.driver = {
 		.name = "tegra-mc",
 		.of_match_table = tegra_mc_of_match,
-		.pm = &tegra_mc_pm_ops,
 		.suppress_bind_attrs = true,
 		.sync_state = tegra_mc_sync_state,
 	},
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index fcd7738fcb536c..6f367f743587db 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -687,32 +687,6 @@ static int tegra20_mc_probe(struct tegra_mc *mc)
 	return 0;
 }
 
-static int tegra20_mc_suspend(struct tegra_mc *mc)
-{
-	int err;
-
-	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
-		err = tegra_gart_suspend(mc->gart);
-		if (err < 0)
-			return err;
-	}
-
-	return 0;
-}
-
-static int tegra20_mc_resume(struct tegra_mc *mc)
-{
-	int err;
-
-	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
-		err = tegra_gart_resume(mc->gart);
-		if (err < 0)
-			return err;
-	}
-
-	return 0;
-}
-
 static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 {
 	struct tegra_mc *mc = data;
@@ -788,8 +762,6 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 
 static const struct tegra_mc_ops tegra20_mc_ops = {
 	.probe = tegra20_mc_probe,
-	.suspend = tegra20_mc_suspend,
-	.resume = tegra20_mc_resume,
 	.handle_irq = tegra20_mc_handle_irq,
 };
 
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 51a2263e1bc59d..a46f9d290682f1 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -93,7 +93,6 @@ struct tegra_smmu_soc {
 
 struct tegra_mc;
 struct tegra_smmu;
-struct gart_device;
 
 #ifdef CONFIG_TEGRA_IOMMU_SMMU
 struct tegra_smmu *tegra_smmu_probe(struct device *dev,
@@ -113,28 +112,6 @@ static inline void tegra_smmu_remove(struct tegra_smmu *smmu)
 }
 #endif
 
-#ifdef CONFIG_TEGRA_IOMMU_GART
-struct gart_device *tegra_gart_probe(struct device *dev, struct tegra_mc *mc);
-int tegra_gart_suspend(struct gart_device *gart);
-int tegra_gart_resume(struct gart_device *gart);
-#else
-static inline struct gart_device *
-tegra_gart_probe(struct device *dev, struct tegra_mc *mc)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-static inline int tegra_gart_suspend(struct gart_device *gart)
-{
-	return -ENODEV;
-}
-
-static inline int tegra_gart_resume(struct gart_device *gart)
-{
-	return -ENODEV;
-}
-#endif
-
 struct tegra_mc_reset {
 	const char *name;
 	unsigned long id;
@@ -177,8 +154,6 @@ struct tegra_mc_ops {
 	 */
 	int (*probe)(struct tegra_mc *mc);
 	void (*remove)(struct tegra_mc *mc);
-	int (*suspend)(struct tegra_mc *mc);
-	int (*resume)(struct tegra_mc *mc);
 	irqreturn_t (*handle_irq)(int irq, void *data);
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
@@ -216,7 +191,6 @@ struct tegra_mc_soc {
 struct tegra_mc {
 	struct device *dev;
 	struct tegra_smmu *smmu;
-	struct gart_device *gart;
 	void __iomem *regs;
 	void __iomem *bcast_ch_regs;
 	void __iomem **ch_regs;
-- 
2.40.1

