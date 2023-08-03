Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB1676DC85
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:19:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lmArX2IE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTxl1nvFz3cRN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lmArX2IE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThn2WScz3bnN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHisLxSi+4jLMD7MkiOHDeaihslrWy6c6RCzgUZojd0e/8TAY46rg+y1E/kPp83s1It030eBRZAYh1BMI6vIrPm9rVDGXXLcf1QL2dSomBTLxvX/y80HthYJ0CmFDXuGbJe+45fRfUMPcNqIugr/LP+YLElVgDbPj6c7JdF/hlYiZu8phaHPb8ImBVrq23FuFzmPZqkID5Nf4DipSoj5Gc7tqNny3O0y3daNPTESOiwUOXII/WTWY+J/7SBDY6yB7lh7sDNllx2350gMPYkv6jHDBkDLE2D5ZB6gBvhkM51C4hwCp1nmresXVxkIWk9119KYj1QRpYZ4v712UaonkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmN8wx0ZcwrsXaWrD4Fv2q50YdIFx6jmaYZV5yW4VDs=;
 b=ijXWaITT4m/k+U8RItHeH7lQhWnOoN9e+dYhROgBC7kaX6a+Si2NZ1Swdlat6QhKwWUx8An6PBdyZ0DEVpw6qIShUDdJ4p+M/44L2YxgpUShZvqv08kAuwQJGfCABuMbB/k0DL408vRzDtRILeliotkprcvrb8e/wWEhFAxMZOf+5wGlpJ5cSV0rUyyQ89tjfzQIT6XNoDSQPDT8Bx6012EhE9wZjijrnGtWB04MQf2HoamWomH9r5/oX7AUA6yvAg/6834ZbOHPnJozx73UUTJSdVRj21xNUyUelIBu6eQQLSkautMH2ujlYKbKOoCFS/erYm0Wnccp9WnYCfgLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmN8wx0ZcwrsXaWrD4Fv2q50YdIFx6jmaYZV5yW4VDs=;
 b=lmArX2IETs3KDYjkejFRDvWq6eOortul75dZtslAVOEKu4fuihckB4Zr5xI8aBiAdzuo9e8mBtx4XesPbKUuVvaACsFeE2AjylyUNiJ4+NQ2PyARa0Hc5ARhC683k9elXBXAOGwgx7/KNxXh7e+ZL5/2FLB7WpzpjvX7fibyUW8aOmVT6gNYvToGWKbSROAGMaHuP/MrWjnjDt7HN5hgwb75+n2IrhBSQIhtOg2rxTuf79rvggJWwB/LedxPH/ZIe+nL4ROz3iBsD1CSBVe8sqLvdUcPK3pviTQhD2Vh8mpFwtIQvLDXOt8uBQRw6JJguDw+u3uxKFGc1thV/nKNjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:19 +0000
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
Subject: [PATCH v6 12/25] iommu/tegra-smmu: Support DMA domains in tegra
Date: Wed,  2 Aug 2023 21:07:59 -0300
Message-ID: <12-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0058.namprd15.prod.outlook.com
 (2603:10b6:208:237::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5fc274-ff7e-4a03-60d8-08db93b5bc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QfhU6sPo5NHqygwmcbXxZe0VHlJUMsGlov8K/oNrXFamb8RKp3iW4K8B6HyiaZKpsR8a8gOFQgwdlyp1C7L6dXNDokGPHiV353j3+Enu2sT0d0lHy73tdn9nAxtEM6t9JPTtQy6IXDAi2VBR5QX3jk+xBrH9Hzl0uleIbxeXsA/pOwdF4FL8AQzqgo2yki90HNenT2vACJePq7ICBIrYOyB7esMBE2CsHr88vV7/u7Mxw2nT6ZjWAM0x3fAQkyzLIeTNgB//z7Awf5ofe6zeK2cdpD2eS81QE8T1GN13HE9nkZZtMHv236SCNn17WRAkzHYoPK8W8VDz/4y02pkwBKVB/Ntarb47bfSoCLovcLnZI7impf8Dtf/0oWLCT/hJu1MaNjWzeUqQ8aD/L5CPmqfGlclOp1CXVpRf8yUUGYKoHigAXYsz9BWCJaBY7184usDaPM8AsU670T6QwR/Uug8y6RSuA5KY7KT1uS7YMOCiGvdR5lKaiXelo3E8aNYvS36YqK10IEXVYZt+jTj0K08+COB3zvUey8oLcenPo6wl8OzzJh7IyWMlksVj94ygBo5dnwMNpdNpkg+P4qa2W51JjxgILU47vXrLzy5Syh8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?aRh9/Z6xMjQOOB72bsMdpCOH67ZStuyPOosUNm8aHFuBW/eU/CBPhO37VTG9?=
 =?us-ascii?Q?9Sql5lmS3KcRgPacypXWk4ke48EsWOX8qdlUm5koYzXZu/I2ZLBRuV1RE82o?=
 =?us-ascii?Q?ulpVIUqIlyf5PwUlUyHn0irfd1Ujzfy34kdTV+xkCeUBejwEX5dZr841pYX/?=
 =?us-ascii?Q?njXF+e0V2sYBWqQsO40RKrKSJx4xnbbGTQ+ze55TAR0OCLyAuUvfmJXvVrfI?=
 =?us-ascii?Q?zqvzL5YZxWiTAHGsW1w4YcE1esfOb1sN+AKrcZlRsiS2Nq1jHwL4fUKAO20f?=
 =?us-ascii?Q?DIY2flGDeeb17wAvP5CCIkm28ABjJRAw3RoYWJRgjjf/O4OLd+vZZBsGOmS2?=
 =?us-ascii?Q?T75nBHUpY0/BvQq16p570chwmh5bXHTjKCbA/TxuP3O5+pMlr0AK5GX27xny?=
 =?us-ascii?Q?aLJpJWDz1L33l5ezEi8k+alDba24zONRMBqUkkKq6GjaJEEDDTohoHxpItWD?=
 =?us-ascii?Q?G8qtW/X6O8j8FpfHZu+mQlO6XRgq+9YwBjQlL/IrBOjsbTZZLVGS0RnzhxUA?=
 =?us-ascii?Q?Qs+H/OyM+apH7A/ny4pJAf6ykT+e5SYcenmHfHqfh/xi9x70Ow2BmKviHVYH?=
 =?us-ascii?Q?P+tl+fSJq6L9DxPHpDBwPUdDv3SzJmw32QR05j/fGR0Avt/wmVqIjbkwlp5e?=
 =?us-ascii?Q?w8hJf6V8f1+8o2IVH6IPL9YPNrx+a9DawdscxGxJk3GEJ/RuXsJENN3PxMY/?=
 =?us-ascii?Q?1gSnCKinL8vnSyz5hgOVFmvP77V7ZwVWr+t5K2bmnA9Tuujth+bFh8RgbElv?=
 =?us-ascii?Q?OIXJGyqdNcaPlZAs+Q0gPqQrkIZngwH6BeA9eV2eyqjPnHCZENal8Es+zHjr?=
 =?us-ascii?Q?8HB5YlhL60D1qZrfxk3tJbJFzvoXBNNwuMwjEZ7Y3yBcP6HizIxQOKydxBYG?=
 =?us-ascii?Q?GdRnMSUuycYTubjDqUq/QjQFWm9j0k5AtQ2jUOxn5iOSTCOQ3JBvNcBDIVyM?=
 =?us-ascii?Q?dO5RK89rb50c5wNF2QG0Ml6Tos8UtcPKWQIN3mfdPJyKYs+uKlytSu3VdRsC?=
 =?us-ascii?Q?lpwUPUBLbm3tFuRptxhYBdroGGP2U29C81bKToNjwL+BsBdAt/KkiwiIU92D?=
 =?us-ascii?Q?BlssDJszLEKGUWqTDLvYugW3x7qWXr+3sKpijwh92M2WHMcto0YCbJ9VJxri?=
 =?us-ascii?Q?NQNvww1dTkGQs1nOMwtn9gcmWBOwlmFvHjKT58Ue8/lD9LxOaWRs4mMhbw+t?=
 =?us-ascii?Q?PwzQRVRXKk79Opo4v6oiHXtpWygHBksJnAj8CXNK4KtuJ08CclbPEjr80RpH?=
 =?us-ascii?Q?57Dst3j+wfertavXemxFA8p66ZFRtlw1xLAf21sMKZa+GGE5I3D3EI9gpeSy?=
 =?us-ascii?Q?bDv+jASJOVqSqVcwS4r2KBwifHAAfpNlOLux+Ke5PXr7Jx37XO41wcyrm7Il?=
 =?us-ascii?Q?rO4VdelNlH6itndFLYGrZUFMeYKFceV+m2d0OWYDqc8B1CmTMtcSvEimj/xd?=
 =?us-ascii?Q?43P/Amtzx4bSwdB9jT3Kq8Qo+pNJqFcbPS9L/1pxAFT3lw8YxPrgjkMf1Wra?=
 =?us-ascii?Q?D+Ie2sgH+zzcH4iokXw1IaE9sb6bLFBvVGNvdiF0s95gwmvN9q/eNoPBpAGZ?=
 =?us-ascii?Q?NHx2nUWeaprPCUs4j5HesYkqPB4xBvmL+9VPrFuQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5fc274-ff7e-4a03-60d8-08db93b5bc0a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:15.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qM+gGfVuC2f0PmK/NtUb+v5Hs0/bxJ0LyNhbgRWdT0Qelu27Ve3R5UgWHTPkADOL
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

All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
dma-iommu.c.

tegra is blocking dma-iommu usage, and also default_domain's, because it
wants an identity translation. This is needed for some device quirk. The
correct way to do this is to support IDENTITY domains and use
ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
devices.

Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
everything so no behavior changes.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index f63f1d4f0bd10f..6cba034905edbf 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -276,7 +276,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -989,6 +989,12 @@ static int tegra_smmu_def_domain_type(struct device *dev)
 }
 
 static const struct iommu_ops tegra_smmu_ops = {
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode,
+	 * better would be to have a def_domain_type op do this for just the
+	 * quirky device.
+	 */
+	.default_domain = &tegra_smmu_identity_domain,
 	.identity_domain = &tegra_smmu_identity_domain,
 	.def_domain_type = &tegra_smmu_def_domain_type,
 	.domain_alloc = tegra_smmu_domain_alloc,
-- 
2.41.0

