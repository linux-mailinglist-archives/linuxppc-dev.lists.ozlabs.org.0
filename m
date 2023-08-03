Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4571C76DCA2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:27:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I1k1wEmF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV5v0XjQz3dl4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:26:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I1k1wEmF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGTht4CrDz2yDh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3oOGDlLXL58cy+he1x7joLO5GfBMEgQgZZFFrVEbymqO07fxQdRlSGPADBOtCYJVYTP2XB32bJUVXt+tl7tdPnoZZOdNz9KsvXyh81i0kQRHGJ3Jfd4CVTY2uwKcNKn//3qmgyuGntJuR0ZfaLAMlcm+xHkndVkT11LHTgIIzg4hFge+/wofevpiIpaz5WfJ4jpil8fj8o9gz4vE11PbfwN1B9fdnbketxgc4PvS4aDEUVT90clKARZKIPNtZX/gq5TQvZ/B6CMba4jh+IQ7WrUc3nJyoic0YlHN8xxJbz8N5kzRkkNJVLjSb5QtUpu9hmLxHlpB+wMo/DfCr4iQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfJ6ICB72K6t00cBPpindOpXfpiLBikEFBz63TmJMzE=;
 b=AJbNh/LDvBeNEPImBJfTIuiWL4FTZgR/4paFWQZxm1WiA1I5hFQ9Y005EKj1V77VSQrkpw3LKUUhX9q5iJHAXaEXJBxrlE8+XbhNfeWv4jkOnphy3cbrvUYP54m/1xy3IoLsIb4AN/SdgUgutbtexbkxyzx/oIksF/Sf0F4vXY+pzFc3POTLcPpI4nJ1Ct7Fndeo/QvAD1knrlaMS674zGWKqhNrHV3RwernXwqiyd6ijaK7r0DNfbkH0YJigYlTgJ2WLW+djrZOwdJvlEUPqMK665YlRUXaHfLnOAccX5G1dp34I+TiCHtaLI7tzqSsCGy1uz+HtonZNVpK1t4IDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfJ6ICB72K6t00cBPpindOpXfpiLBikEFBz63TmJMzE=;
 b=I1k1wEmFUVM1hBLBS+4C/UVghQ0xJRBYUquahP4XlnMZekGuH98YFuOEmYMmOODcgYb3oDWr8ZlYVWf/w3XyjiJYHBs8St9zCiALQDCl4hdX49h7jtHcKpivEG7hSWXdTCw8cWH0lR/vefdFJMeXBbGbEKJ5B7Lmv1cPmOozmp908gf/V0E5UWRw1MSC4SfGViZPVe+no71VTlAozArv5MmpUUKymRgof8Mi3lhRgH+cWLzIOfiD/hb6rPo0v9n8GteuGqtlEOzHJzTfD2acP3vN9sJDOr1MiVzF712GTYid7JcKnk3qsK7VAjVCVP/18WF9ONm2wJERLpeMXS88Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 00:08:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:25 +0000
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
Subject: [PATCH v6 21/25] iommu: Require a default_domain for all iommu drivers
Date: Wed,  2 Aug 2023 21:08:08 -0300
Message-ID: <21-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0060.namprd15.prod.outlook.com
 (2603:10b6:208:237::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: cbfdc969-30c6-4631-8dd1-08db93b5bca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aiVErruFiib4aZLQiZr6dtyUcedyeH0/bUZOErJvxuYfhdEmArDv5sD6oEdUmY9is8KqhLlUBBWltTYZMOSZ91aukUjFNwvsWG2apmPr+Xij3rEMLBvK4fgQEQtWtX70WiAIOHwdhWEYi0yhmf5NtGlMwVKGjMO1HtWvhnff+a7ApBbzeg/2YsbqxVeCKbMJDcvCsP/0JGGZ8xNPuuSu6/wQeGVMPQpHMIPvk7n22KhEiHg8viCKFnozr/Yi/FtuMPDswwIJs5WG6VNELZ58odDoCJViwfy/wvfKb1tWAAEay6H8r2aHyoKT3mMqeOtysuEmpeVRHCkFOokgBcq3gyI0FXTj5H7FHwa8IYzuvVB43gt4r6CaN/AKa3n2XWmUqHp6dkWZI5V7MpmOiadU8ODuPCCc/84he8NhtECxF/Tyjdk9ju+7qjvupHWNhXHBG0qQVm+/75SbiWtEIbMEAFUMO1TCWvYwXuYjLgSIj4Bgiy6/4IuVVhgj+Z2osnwF9KNuMEN8FQ2/CVIw2biMF2gD9CKE2RHv3TphP8Sm3JRGJVdo+CGeKurVSgv6nE/Jd030AfDgPOzRBm17b50GpvSVXz3Ih4i+6pKRgWPJoX354j9HWTxC8KeazavrGZ9iES0PguPNhhbjlR9KCfT97Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(7416002)(36756003)(86362001)(7406005)(54906003)(478600001)(110136005)(38100700002)(921005)(83380400001)(186003)(2616005)(6506007)(107886003)(26005)(41300700001)(8676002)(8936002)(6512007)(6666004)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?p3O3sZLp0XC6vhq3e7aJ13nuVx/6ULMXQiiPUb4QWnsRgdO3Y0guxcQDE1Zz?=
 =?us-ascii?Q?suezQ2wa/4kp2zv9r21wZXfGs7VP7ARFSQlXvoTrEQ8wSVLPhTBVn9fdk/O9?=
 =?us-ascii?Q?uX5xY/QLN7a8W+W0M0OkuvMpOAV9ETJLIDy7l+wKIK9DHkwf38/7L8SIB9p/?=
 =?us-ascii?Q?QoOdMoXH3IIDCxBm8U1M7/T6l5Dm8u/DgwPtUfRJZWR8k7HltLv6gD3yaHWM?=
 =?us-ascii?Q?PPw7Mnf7eDrUXVP9vM+CG1bPPlwynsyERxWCwcnrSVgY11m6j4UEGVJ7R12e?=
 =?us-ascii?Q?yhOEaPDdUOY8+zqA1eKZGZfTLIK5gzi7uUg+BP2D+YnQhNEO2a4xngCHVzFw?=
 =?us-ascii?Q?3l3fzXlSaIjkUYQWbadCArFVSgLTT6DKG8BqWxssn23pUpjdW2/mvrrtY6OF?=
 =?us-ascii?Q?Dm0F2ptPA23SHd5ytFkI1EjQ93Us0FGw7l08S0lH4zAVc4iQo6/dUS0X8/Z2?=
 =?us-ascii?Q?mz1rgOzhZZVTl66e856uzuEDcB3ly9We5LmW9AFfFnkJ/PAzZGvflTxzHz00?=
 =?us-ascii?Q?9/ppcHUJyFo4/UAoJzQD5evVf/7yFTdH3dJ/2K0Ju3zJX6621megN/cIlQGg?=
 =?us-ascii?Q?XaelHouGgKVehEgfXjvYvQM1xoXkKY/MAVQiA9Z3ZLeE6ZyCiITtl6UIxeKr?=
 =?us-ascii?Q?Sr2iA9gjWAQrhHC4mmfA1BQ8+yHu6mOWLAlP91h8pPi94/89Niz5UWTUj8i0?=
 =?us-ascii?Q?DSNjJNc+PGLb9pBpaM/uXTyiAf9xGeZjmB+2/Tx80fZISqvqADkQZDHNn0n0?=
 =?us-ascii?Q?vxtKFF8h6fDJUA0yonpyETPlPXMdX1lfq7RU+r7gNcJ/tsaQ2BRQtpUWfh+p?=
 =?us-ascii?Q?3EJBDbQ7fVl2vkZjIaPXcFnJc2SCDFmJIH/0UmtVhV8UyiYqLHh1Pv+cuZl8?=
 =?us-ascii?Q?rsUSKjwH/Stfv9HpBsmJ0xa5tjmz9XItk2qnNrORJcGvDrp9JkForST0vrjR?=
 =?us-ascii?Q?NE0Yh+SVRoqBPZh2cKo1sTI4NWA6aeebIMTLDvlNjOVvgviTvmDxNqwVPwjQ?=
 =?us-ascii?Q?S6qgh5qsPMzy4CirC+Qh5nin/Jv/2QRiJn0BrWp3Gkvamtwxj1R04KE6JPR0?=
 =?us-ascii?Q?H3/UX7WNQ7lvpayd2AGWxp3sTYIj3w4EyUqiTMukA4j4IHPB1AMs/XJxYXzh?=
 =?us-ascii?Q?rUmtELvCBa//1y+1PJc4rm+WoiVzSMYlkQ4fQ9hzcoypJ4iJLKPFXUCWYtti?=
 =?us-ascii?Q?xuPYsBy+H/oEhn/W82Nh3iHJrjDR53YMImTMs2yElTGCAjmAFyUizF52CMDG?=
 =?us-ascii?Q?4Y8ON/yvj2AXdEwkK4wl64YBOXKNND5ttl7rhK/XuSJo/My4tUuLGhJIOiz2?=
 =?us-ascii?Q?rf04WZZzLcpC0wlIhYPnddaUAWgFo0bfpGo4BxqVCux5uNPRluxUzXnH2/F+?=
 =?us-ascii?Q?CSbatMgi7UqqcKglZ41QVGTIF8cvISZMLl0i1oNPOG2MBkZs2Ml4ogEIrD4J?=
 =?us-ascii?Q?H9blbto+rri/b0qPEi40U6325/y4Looz9qmwtzhaIMF/ndXWxpgj9M3NdSOd?=
 =?us-ascii?Q?LW9zZd5jRDngsDMdmi9QnlciHo+9nIT2rOEwij5VMGlc1AywmkVLnOxvzPjP?=
 =?us-ascii?Q?7Fy3xrjtfTz0Y15J08UzNjR0sKaUxetW7hS5wl8P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfdc969-30c6-4631-8dd1-08db93b5bca0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:16.9873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RJFJlX5DE9eXyH3+F6e/oMh6mi1Mxnikj2ZJjbXb1UlaCF340vK2J/0QvtMCtUz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6085
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

At this point every iommu driver will cause a default_domain to be
selected, so we can finally remove this gap from the core code.

The following table explains what each driver supports and what the
resulting default_domain will be:

                                        ops->defaut_domain
                    IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
amd/iommu.c             Y       Y                       N/A             either
apple-dart.c            Y       Y                       N/A             either
arm-smmu.c              Y       Y                       IDENTITY        either
qcom_iommu.c            G       Y                       IDENTITY        either
arm-smmu-v3.c           Y       Y                       N/A             either
exynos-iommu.c          G       Y                       IDENTITY        either
fsl_pamu_domain.c       Y                               N/A             N/A     PLATFORM
intel/iommu.c           Y       Y                       N/A             either
ipmmu-vmsa.c            G       Y                       IDENTITY        either
msm_iommu.c             G                               IDENTITY        N/A
mtk_iommu.c             G       Y                       IDENTITY        either
mtk_iommu_v1.c          G                               IDENTITY        N/A
omap-iommu.c            G                               IDENTITY        N/A
rockchip-iommu.c        G       Y                       IDENTITY        either
s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
sprd-iommu.c                    Y                       N/A             DMA
sun50i-iommu.c          G       Y                       IDENTITY        either
tegra-smmu.c            G       Y                       IDENTITY        IDENTITY
virtio-iommu.c          Y       Y                       N/A             either
spapr                                   Y       Y       N/A             N/A     PLATFORM
 * G means ops->identity_domain is used
 * N/A means the driver will not compile in this configuration

ARM32 drivers select an IDENTITY default domain through either the
ops->identity_domain or directly requesting an IDENTIY domain through
alloc_domain().

In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
forces an IDENTITY domain.

S390 uses a PLATFORM domain to represent when the dma_ops are set to the
s390 iommu code.

fsl_pamu uses an IDENTITY domain.

POWER SPAPR uses PLATFORM and blocking to enable its weird VFIO mode.

The x86 drivers continue unchanged.

After this patch group->default_domain is only NULL for a short period
during bus iommu probing while all the groups are constituted. Otherwise
it is always !NULL.

This completes changing the iommu subsystem driver contract to a system
where the current iommu_domain always represents some form of translation
and the driver is continuously asserting a definable translation mode.

It resolves the confusion that the original ops->detach_dev() caused
around what translation, exactly, is the IOMMU performing after
detach. There were at least three different answers to that question in
the tree, they are all now clearly named with domain types.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index dada2c00d78ca4..1533e65d075bce 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1819,10 +1819,12 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
 	 * identity_domain and it will automatically become their default
 	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
-	 * Override the selection to IDENTITY if we are sure the driver supports
-	 * it.
+	 * Override the selection to IDENTITY.
 	 */
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
+				IS_ENABLED(CONFIG_IOMMU_DMA)));
+
 		type = IOMMU_DOMAIN_IDENTITY;
 		if (best_type && type && best_type != type)
 			return -1;
@@ -2920,18 +2922,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	if (req_type < 0)
 		return -EINVAL;
 
-	/*
-	 * There are still some drivers which don't support default domains, so
-	 * we ignore the failure and leave group->default_domain NULL.
-	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
-	if (!dom) {
-		/* Once in default_domain mode we never leave */
-		if (group->default_domain)
-			return -ENODEV;
-		group->default_domain = NULL;
-		return 0;
-	}
+	if (!dom)
+		return -ENODEV;
 
 	if (group->default_domain == dom)
 		return 0;
-- 
2.41.0

