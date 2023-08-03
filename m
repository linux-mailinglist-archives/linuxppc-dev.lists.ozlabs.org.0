Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5C76DC6A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:11:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AmHTjuW0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTlS6L3lz3cMj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:11:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AmHTjuW0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThj00ybz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GN6roJRXBz3EJWYSc2DeqtrCyu3HlO5KtopIWBzwhPIy6N+8t7Zd1QQpbWIaGc+afa2FC+RhktcjoJ9RSgrmghw5cyw44kgZjRVxWv5LyEoAaw1O4OcMNZr6aldFVWE3+13X+Ay1+d0bdegbglB3tq7uJPeURdmM5tC5MLbiFvJBgCkzIpuEUfl3odfHuVY2aHGn/76fUnuvhMItkVGbvgEWK81W790s87y4dHrIpMII5oFQ/M9a4iviJ8ERQUUVCYzqiNkwOol3Kj+EwR6Elxe0V1D+IncwN5KFQO6qhxoPsKPwZ+tBc+Q4MnbR/7VFIky162FqGXPXN4dIFB/Hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHy+FLjmdhFTEOw6A6iVV5wE9YQwHt2f1Cn4G7HuhKY=;
 b=UNj32EVP73jVozn1pWVN2wmyHMHKxrBeP4greetUw/+Hu/ZW6c3SNZJwrive7PXEEpH3qOP6NXZILIS4aItHTM2umI4bKy85vYEXRjLnle6b0V6DQNsBQaB5kIWByv7i+eq04/VGWiiMgm5ZocxnkXnWc7KjrHis3XtAdLj1X9oWIlLbcv15gFFiS9yic94m6q5py1oKwBA2irCO2GvLfIJa/MuVH664B2us6dW0j8QTRBP2B7pqs5pUynN5LExhtiWjO6a5uHH3qCuFSwWzZ2E5+z4p61TcfTa8icb3z72Dz+SR4uwpTzOoEjRznTQ74j30VKzTUyijTPIt0gOwtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHy+FLjmdhFTEOw6A6iVV5wE9YQwHt2f1Cn4G7HuhKY=;
 b=AmHTjuW0lEAKsFKSxrGfhDMLvmPHLUHFXYcgEzwb1d5EKGMPlnDxmd8mvuaJqU8Sw5Ow/4ZZ73dl91oUFN2lVAFgDqrzUsjHR80OUF4qQQH3RELDTwCUv0ZU+lxUP51vuO3+VOP0iPb1Dmnwo5BmIE2PQq0mG38lN7xlBZlE5VzDQyfjzSHn47S11pXbq3UQltM5IzAn9nV2j5srtb5Z9UppEs/pMMhwGAxR6OGHSSlAT28L+yRb7evRotB4HPB2GvKNJ4MGR+qMHTv+RQUwlDSi7XS/K3cj400v3IC3dfmHKTNjJRD0FIowK+KPbYClFKZuL45JU0E9j2zlg5qmZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:16 +0000
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
Subject: [PATCH v6 06/25] iommu/tegra-gart: Remove tegra-gart
Date: Wed,  2 Aug 2023 21:07:53 -0300
Message-ID: <6-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:208:32e::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e9297f-4b85-4591-7820-08db93b5bb12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kXsjX/JD2Muuwe0lbtHnCMf8p3SPbnjH3QBSjI6Sg9Dz+AywnV7fbKtq5YFlXcRobGPdG9/bkHT2Ncyf9RmsrdrnUKYukGfACUvTSJjwQnmLGSkGcNt/RyFNoIjXVcLcAPiMYyIU0AnPSPxSaBfM5c2LQuc/y71+nmeZlqGNmsODqJ76tASk1LWcnxmHdQvoCabeFCa2mufvEL4jpGYV79MDao6cLUSQFd9lhuhPqMRNWWQhocr1OrA8sFnzcQ4Ma9PE63mCkDSAjj9DU70PVyV2kPN/3wOoSyYc9s537FdOoM+I71nA6nwGg61fagx9tB3Z75RySjWbxSidfKhtB7jiKY+USEBdZcY1x/BzLjo6Os2T0EpXv4QqZMsdl1rIQVpnfyvYvr3jMDYJWlokgHRtobVq5obcXI/eSWffJazA1FpGxT6GV5E03B6tN2crls+ssIbbXBXXmLERnE6jC6dko4LgEaIQpXzqux5DSHqz9uzxK6yR6FfHJWeFzR9Hp7loakAU/F1l1Suc+jk5BQz2sNDRxAmBxaHt+D1njc4A5J5+/aTHBcX+MZsegNHcCbKPyj2ycAdP0iLXR6BKenPWWHggeeYqItMuJ8cYqcKCzxj+9bd0fT1tfBZTlGwt
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002)(30864003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eLelCB6DJ0Mh85AmC1xjvb6572mr0REMwv7iCWGhr4yVXun79g5f+5dUaUSD?=
 =?us-ascii?Q?vipNAXPlv+/VylAYm7ElUoP0MoxsHVzhBr+ZOiValUmxNBk57ejFNFliMPFp?=
 =?us-ascii?Q?bU11jRSl/p43U8AlhN7i75qbl9yBN3P71rn8SaVF6ZRRRtucYMm0Ld3uZ0xM?=
 =?us-ascii?Q?hSzsrBll1o54hT2U+K2hAR7/s68ha4qQpwER8q3w0e6fEmUDRbdEwix7uvhY?=
 =?us-ascii?Q?pFIsC+2TwEpudhHzJ0F7q8WCIOe2DAkhUz4nXmYNb2Sevmr3wG5nGxjx26Bj?=
 =?us-ascii?Q?xBDfTfg02OzV5qeN//5J2E412VKyH02z5BniXISzpLpxnpjUCyFkQa4BIve/?=
 =?us-ascii?Q?b+ERFIHJfoPaKVgNBIoko0hPkmlAyWZQug9UhhnIvF60+wNIOeZdxAhn3Pu1?=
 =?us-ascii?Q?1ILsjSWAsZdEBKnJeILDPge2g8jkRfcD2P6bx9HZonKQrrk5fhr2aDIe7zad?=
 =?us-ascii?Q?+FgzjmTaGprMPIbaCv5Jf8OGXBqnguxjyARtTssGoSzuMRgfjL355lqavBnX?=
 =?us-ascii?Q?AkHcqkOHdkbPRdyqwCIyQZi2om/wxlTmR0OwkcArEyGHrKShinA6TPDEuyOG?=
 =?us-ascii?Q?0qBDWO+9gLIz//MvcOKUaEJGNe9GgrciwGNdtOEC/8H1oKACfo6/kkFcNwgz?=
 =?us-ascii?Q?5pFEEco0sBN1LM8LF5+10Dw7lhRqN9B4N5oPEeATs9+J8e0esht9ahA97ypZ?=
 =?us-ascii?Q?ghBZY3Qxq0JPCkt7e64r+gJ/yj0PBqE0HfSnVpekyLHBfaDVcJVlON9Gtm8C?=
 =?us-ascii?Q?CNz2I24Ibh5ThMsQbQTbvjHxvKVrvEEuNVfL1NnqNyAbh1pMjjZaHenUrrkG?=
 =?us-ascii?Q?3kyQUmX/WmZzFo44kcDmlAMz8zgWnI19rJ8eeuN0+xUu0cZ7Bfv0EXNSfsT7?=
 =?us-ascii?Q?n46H3jSE2SJsobV2qjcuj+HBHjC9MMvbNtSLxv4vdfiYPX3rwU20RTBrgLhF?=
 =?us-ascii?Q?S7gB0PKCga7B2IiAF6r0Q/WOI7WAWjPILt0OZ5fynsi8quTDWo8L6eEVQMgi?=
 =?us-ascii?Q?MyOsmY/RCt/GApHADasSFPjYFF5BTaXDAam8xgn2k0SJHAdqqhFDla+9TPra?=
 =?us-ascii?Q?Zm/z0Z6fG+H7IeN3cr+b7YvhD+F/mWehOZVf0WLlapYlx5tO29xlmf61c2Jm?=
 =?us-ascii?Q?aZz3VL4WPq2+4tTn3KVTUsh4cVMrxRPLMR/J2eJIkKCUGuk3TE66gQLtN/Yc?=
 =?us-ascii?Q?l0KvB7E5Oj+lnssXm23/9t5+Hgf0qA9MrJYKkbHFNaVpY8oQqRIzlQGPFlBV?=
 =?us-ascii?Q?P7KgUNow6pHV45EsIVJOC3ScW+qPbpK2YEReLhj6pESt/Pc0dZ6j9xwcJ3Az?=
 =?us-ascii?Q?Sjz3iZXyh3VN7i+FLwatZiGvczJGyKrY4ZYGzorD0PT6VCPRZDUdZ6Nt9lnt?=
 =?us-ascii?Q?hBpczVxcbsIb4hph/B586OFGvObUTIBNKJsvbZSbJ4k2GC6NNXrUyi4H/DMT?=
 =?us-ascii?Q?tmC7o+61+s8ZkyULY7vH71TDHTfclDUTZljSdOawIcn6vDTJeZITH96MzIpg?=
 =?us-ascii?Q?mHSs+V7qwKAggMx6247/HyWvDDUECZ1yBC53rULO21tffwdzdJ10SfoSfcUF?=
 =?us-ascii?Q?LN/+wkaEa5CJ7JgukiV6Z6v+yxm/97eiKC0M4k3a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e9297f-4b85-4591-7820-08db93b5bb12
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:14.4381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shbW1dAVcjvegNLuDuPkLqXaSKP1Zya/DhIZWZ1urTkGVedyMwwVN3IsrHGklYwy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809
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
index f0800f806b5f62..c7e63e54a400e9 100644
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
index 4a750da1c12aae..8b5ad290db56f2 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -942,35 +942,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
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
 
@@ -983,15 +954,10 @@ static void tegra_mc_sync_state(struct device *dev)
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
index fc3001483e6242..fedddedd2c9d33 100644
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
@@ -182,8 +159,6 @@ struct tegra_mc_ops {
 	 */
 	int (*probe)(struct tegra_mc *mc);
 	void (*remove)(struct tegra_mc *mc);
-	int (*suspend)(struct tegra_mc *mc);
-	int (*resume)(struct tegra_mc *mc);
 	irqreturn_t (*handle_irq)(int irq, void *data);
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
@@ -222,7 +197,6 @@ struct tegra_mc {
 	struct tegra_bpmp *bpmp;
 	struct device *dev;
 	struct tegra_smmu *smmu;
-	struct gart_device *gart;
 	void __iomem *regs;
 	void __iomem *bcast_ch_regs;
 	void __iomem **ch_regs;
-- 
2.41.0

