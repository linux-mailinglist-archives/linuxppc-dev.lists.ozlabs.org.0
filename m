Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5091C785E04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:02:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y5SWNUFg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCFB0vtBz3f0k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:02:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y5SWNUFg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwp5WFxz3c8v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eISxXRgwoasRjNbsISjuo1/S1d/N5CpJkAJVqmfwtZvrBFKHfKfCy0sMxKWO483EcqE64quA3sDPmCiH/pDzL2F7AhUDedap4VeAGp2FVDDj8tBNbWx1WPpky8xmMnpACHFGy6uX+dFiJLKIpmbc/I5TEbaHAazMVh8iCQmA9yK6MsP4QBUkZXdJ56ke6DskEiTL9w0HT1oIq+ELGIWGmLVZVTqlY2k96NnQ9PEExF7Z8BAbMZrBdqA2DYQcfCh0UJhdH3XImp/477aOCrsJyRd8qpopH99et7GPUI12jVQ3PFST+YHtgc6i5VjQNjmlKZZh/2qf//SSzvEO9qA6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf7z7F/nhgRrk0WDknI0VsDttQMiOO7a/Yqh+b6nonQ=;
 b=Bv4n8lUEDlGW0UXbjll9s6yHZbJxFHFMecfuS7E3WIG6d5KNbWe0fRLOtCQ3XGKFIBw8FrRYg8ARZrmLZORWZcANu0OqUIet60Pizku0VBYI4BkLlQaI43Z5eZnsAgXoYRBC6kN3IwzbqMsCLNHfPlE0JEZ+g9qg6uP4g1j6YRCOBNqECbFSRc1RMoMlyT6sItUKUJ0yu7XiCtRqP5fKRianc5uoLTBrZ9zUq7Vr8gpCBCyZPRs1X6MDRX7dCAre9wOuNCtVqiZmzesFZsWIs0xWRs3eMbTon7vysH8hPleeSLbwgyLUlHPP/bDXyjg18O3yqO5LP7ntz4t+4FBzaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf7z7F/nhgRrk0WDknI0VsDttQMiOO7a/Yqh+b6nonQ=;
 b=Y5SWNUFgyS8O6HZugmxDSPiIiDSw2gAGUwRGmAjRC/Fta/vqmi3YSBjFYfR+NTKq8DInqsLy+fP0MbvO6/eUArEO3b1o4x8Ab06vnkHSPYk1HrLiQxJ40o5qqIghxH/T5Ex8tIhz5mB4Lx0aXwxZbvJo8q2b7UGZqVM03TgI/9mMfIkUS8lGqh61RusHvuL8bLhQfG3Y4rWGkEAbqQPwvU9wVIYTdGl7NBgFxGo3gYQiTiXl1Sh0wW/X//ONhW7j6bmR/9eh3WM+2ij36+P+Sae42s0QUk582E2jYGCyhaPGQF6EfRgFu5+HCH2o/MZHRgNQ6G8vN5e3YU5UmJmr1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:56 +0000
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
Subject: [PATCH v7 06/24] iommu/tegra-gart: Remove tegra-gart
Date: Wed, 23 Aug 2023 13:47:20 -0300
Message-ID: <6-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0001.namprd20.prod.outlook.com
 (2603:10b6:610:58::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: e6081292-fafd-4e6e-6397-08dba3f8ac84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UGQzpdfXfTHy9slbZOFQEApReeXDYgGQV2vdwBF85aJGTADDVYBgQk8fT0ELw4r0DngENdPe5ywBfj4DZTKRpD4RXSZuCcBesoD2lJcQR7bDdF2fQTkLmfw10kL8JMIpsRs021c4mmc3L8oTS8sqVcnNjKt+vXQYPWC0XjhXXUZEo2hYgy9gJbxgs9N2oLxzDl5puH7TfwjIzafZhuAqw69/wTXkZeXWs/L572dhnqV2ywWdmG0IsOG79A01aX7o7xc7v9T3Eu2/LFnX+NMYYywUBkG20yYrv6AxnmCZlYIkKT+njxUuvtBogdN75ro0rd4LCkOiIZpaUOkPb+7+CKYLbJCGIpvPC2czvbSn6savTPXpmtXFvnyYiunZhtstdFqNkVjvnZZYcw5OmL/0r0kn0qUxMFOFAXBjxJPpWDmkxgB6rRo9Zms6eL0EkwhbirMuS8rDC5+6QhKY+RgywWznpbrYLrLnb9hR4WAu4pqzUMMuN1jDvxNfGDO0Cq1mlGGTUXTpGhJ6QlKXid8Ni0dUvKVDjGO/zTq2zDUM7jd/YU9zzeRz9lMh7pmWQYNAqBgOYR3aiviWEtxm8Hhwym8qa67rGthD5mDHgqdPsPO2iw8r043SWb3FUULH1JbR
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(30864003)(2906002)(7406005)(86362001)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BYbesqW51pYPVKZjRCFr892jOWd/ejC+wV8rdX4xRfwIPrrT1MpmdvMqStgz?=
 =?us-ascii?Q?ucbn+H/bzUPKLUYvS1K/3ZMqF0bVaJWPvvPuECHE2ti3Y9qn1EkJmZt8Nj79?=
 =?us-ascii?Q?BgFl2OUCkyBGR24Ub9DR1UFMYBJKz2hAtsA+NBgKT5Qe1c8L0HRdE8l3N4f0?=
 =?us-ascii?Q?hA+BLBgvRxmrYZW9CNdxBrFnRC3vdg+NIOTSTpPQAghLFHihycojYxTMff+d?=
 =?us-ascii?Q?sWcLoUpyW6TJA5ESDRVauolla5CLGrYhGOH6fOTz3cFLRGzTwYcBf4DFwNUG?=
 =?us-ascii?Q?FMiz+8lWZ56N0jjVytRkFgsb8Gx2LeWqrU5hb3bKRKei9SHGxtvNWGKPLay9?=
 =?us-ascii?Q?stK6Uku5CndlWtQ+CYkpPXwiaXPY4WYUe7FVRKP8LCgZKCSlyn9fY+JLDhFR?=
 =?us-ascii?Q?SynsWe5+fjn6rCUM2ra2jl+syv0cyc1ofmWRblLylNx59J/Az6SzLH0AnxXr?=
 =?us-ascii?Q?BQafegrrx1/PNRcjkdbUeDNjLzq+x8mwlMmcmENDPEzvNkb5BV9Vo0d0dUkj?=
 =?us-ascii?Q?IMBdyKOIoPbeySRZur0stf61jD/mFeR7eC+CiyCTmxaZ/zBJVKLoG33N2uKl?=
 =?us-ascii?Q?iRwyIqwcYYodeiK9qdek9KqlVW81MNrCJCYB+0ylRupFotHksvZ8ecnVYsHB?=
 =?us-ascii?Q?ag0Dkv/+/quvprS7/0j+kRwXB/3cpvBz7GGtNHbgQlYmb4Bp21ty0zYwpFEP?=
 =?us-ascii?Q?HUwNtMGhTNrnpa6I9usi+a7lL6kYfbcsgUxB4Ho/94MmXFof5bS6E9apvCUz?=
 =?us-ascii?Q?5ED+fjy0VzE/vR9GVpyjHHiMXeRr7DZZ3Y6opu4Xd46AHuyybqAekvfQtXhM?=
 =?us-ascii?Q?MWnw4tMgXtoDrKXx9gop3/atjn0LEsqGofTpyLu+aaxXIA9hyJEkVGbK2iSw?=
 =?us-ascii?Q?TSQ14us8tw9U1Lq37RPjVL6LYX3/qvmC1YN1Bd4mtFM9OrlNw4WntrAzkXpm?=
 =?us-ascii?Q?UWnuckLtPWReZvDY/OdKlCCLYJ3qtwiOjq630/ax7whH+kZCnEELwxNcbkWl?=
 =?us-ascii?Q?ZgkJiTu2W6Q0ojnqyPkR082lVEMqZFqtI38V5dcZGhIHG9LOBhm3XftcNGVc?=
 =?us-ascii?Q?FN9RBAUKl0aiW9FvBg0CKcn4H/La6vhMhLlT1uGH42i8mFeKk7M3tKRzwmim?=
 =?us-ascii?Q?DevJS4W/pivYyyVPUnRObZ0Juioexas/lI2Bew91aYfC5r18PUOL/aloSoqc?=
 =?us-ascii?Q?JclDYyClrnzlnn5THAMJA/X3lie/EQbzbXgPxGGpFgiFHQrLNo1EDHGxHFQi?=
 =?us-ascii?Q?9HwVx3Q7D/PRe7MNUw1FJLY4IxUnQvrMbkJ1sXZ6Th/bmntiiGYlTuiHTCGY?=
 =?us-ascii?Q?CArLi2jqUVm/q/NfZlx6uZqLNk46BTJaxDIgaCU6bUWjjgJk2jR2dEaazOln?=
 =?us-ascii?Q?rugMTyC1sAZgb3GLtUChvUd+RyRaMQI3ZUSIZze1/zO0ShBQoYI/GA5Tquo7?=
 =?us-ascii?Q?FFyJNJmVC/HNn7msatQhZcPM+/HyNxoG1HpOnVJVTYUEqa2ZDQA3j4uM14ke?=
 =?us-ascii?Q?5tGbPYRohyW5pByVuElBksojvxFZgz6sNJu4hFWrqm0CI4jf/ZqvTPmZ7RcQ?=
 =?us-ascii?Q?RSwglW6PTsHjBG6X0p2JoynZdGubLHEIGnZ6mA7c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6081292-fafd-4e6e-6397-08dba3f8ac84
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:44.9518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBJmeSxDP5xugQUlZfvyoIpWfGbNOiYkYuCpUKSWdIh2bcq8YtZeWanbmTgxT0QM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thierry says this is not used anymore, and doesn't think it makes sense as
an iommu driver. The HW it supports is about 10 years old now and newer HW
uses different IOMMU drivers.

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
Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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
index c7b2550d706cac..ae1aa32c30b25e 100644
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
index 3c6af935e9328a..79141dddb037a9 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -292,7 +292,6 @@ CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
-CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 2b12b583ef4b1e..cd6727898b1175 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -236,17 +236,6 @@ config SUN50I_IOMMU
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
index deb6e65b59afc4..5641324c9a2c28 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -979,35 +979,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
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
 
@@ -1020,15 +991,10 @@ static void tegra_mc_sync_state(struct device *dev)
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
index a5ef84944a0680..71ae37d3bedd76 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -96,7 +96,6 @@ struct tegra_smmu_soc {
 
 struct tegra_mc;
 struct tegra_smmu;
-struct gart_device;
 
 #ifdef CONFIG_TEGRA_IOMMU_SMMU
 struct tegra_smmu *tegra_smmu_probe(struct device *dev,
@@ -116,28 +115,6 @@ static inline void tegra_smmu_remove(struct tegra_smmu *smmu)
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
@@ -185,8 +162,6 @@ struct tegra_mc_ops {
 	 */
 	int (*probe)(struct tegra_mc *mc);
 	void (*remove)(struct tegra_mc *mc);
-	int (*suspend)(struct tegra_mc *mc);
-	int (*resume)(struct tegra_mc *mc);
 	irqreturn_t (*handle_irq)(int irq, void *data);
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
@@ -225,7 +200,6 @@ struct tegra_mc {
 	struct tegra_bpmp *bpmp;
 	struct device *dev;
 	struct tegra_smmu *smmu;
-	struct gart_device *gart;
 	void __iomem *regs;
 	void __iomem *bcast_ch_regs;
 	void __iomem **ch_regs;
-- 
2.41.0

