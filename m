Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDEA75FDCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:33:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HuDQdcoT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nLq2Kzxz3dL2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:33:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HuDQdcoT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::627; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Z6YCTz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUUpB4XTP9QHd3jVPkksmfF8hjtbkt7LHzBNmY7kACVPfKc24JMr6lgy/3SfbREu96KSS+hnffKVhAB7AuZGGLj7YdWAm74KLI3EVWEFfBoHNfFRLlkHDNhL26aJhfPA1SzZku0l7IrjYj+Ve3LuNLh/5Woedkx3m63fI1o5J47A9wfIBIH8viLXusND+hqvOSzXR9FjQdtA8g710QR0FE8tzOaMyHe8W43WRURSJoYg6WEmZ+j1VeEDc6LpxSMhWVpidQk8zF4i1SAsA9Q5gPIIrXg1Vf8HBDEsoHEJ7v4YMOdgLv74K1E2dMEx7q2yyOGG7H/d69LQQLvEn/vmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iicdSxsir2rkaQf9mbpPeHY1W6j/41BNr0dR/m/Hx+U=;
 b=EsWCM/5ZIEUKEtbk5SbvkW4z7WAUQwoMXkmIkvvnR6eU6LLIGuFS36fgfdC34TbUJPkIdnkMACqATfIXTeRQiz7iDHSVSRnUTClVT/BAW21nFsoE4Fjyztai0D5tE0ZnWRH4vedA5KxU+Nd6QNInwipZphaTOFG35ES85n30UJoz0IxRCtCSr05PHOSHVBZbqxnRSRCTjx5ASHCSMGKc3IVcTAIWJIlvbNnm5KDSE79SliSD43CD6dWk834yjSLdXJnk4PlT4yz+rpYiZOIdyc9SXMvmSFSgsUXnypHuwJeL+/PHEcdx52Yjnhu4idw5WQTZcmDEgUVl0F6QaQpzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iicdSxsir2rkaQf9mbpPeHY1W6j/41BNr0dR/m/Hx+U=;
 b=HuDQdcoT/Fsw1qNw0zhqr+50gbjZBIWqgudXNfbAoDdLY7e75Abi/Yk6vtwmjsUfum6WuS2IkBxtkOIfi6rTRGnktMF096rBD9r4fve+l9s6R078aPcgtIcNMH6kGdVNWIDsFtBRVdiwCZkaYSRVnyHddG/D5wyPN6/zy88GjpDF7OANBm5BMnnBytzCkOi2tq4939m5JJyP7T6Q9Mb/V92MdoXXyYBl60Ei2yngWEfF24UExy5Rl7jknsImck1R7xoC2GkfNWSbQWI/325o6PDXfENK0EUCzA+sTtygFoZwDMKUrZzEBOmquPiYSgoGkmpCmFLXoMRBnUyORLmnNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:21 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:21 +0000
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
Subject: [PATCH v5 08/25] iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()
Date: Mon, 24 Jul 2023 14:21:58 -0300
Message-ID: <8-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fd4656-c17c-415b-d4be-08db8c6a87e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Rr3pAV9WYASHt+PiRJ6Tbb6hshVnm+RKtI5VUmnpuvlK5odWdWeX+uFPCFN6cwmp+qcTthSF7QR4P8TXWPCR8i0km0kQjJY+TLigfnuX3yuwCFkNJmsU6bwzt0PtMRGIrP1EchyUsRdNHEnfo2/SLjZimJDKuYbZ1Tpz3dFi7iZSZID+yiZOGnCTpdvD2/55g7xV6Jot4hgeG/a8b8UHrKDJ2RaiP+EB6KwryWk6ziThoVoSk3H23bGctxHZi4EpdA8q7WHmZnAIp7jFMkFDv6rf1LeWvxODAiOgwk1ZnOl5X+enqGpBCrol74fL/MtTfa4bs3ZmlLejcvsFXCssnIS+SI7dNuC+JXx70G99FUGVD2z0ZJtADmbtGbOc4f7Q7VBNh3C8U1ftI6mM93Q7kXH1tlBe1aPmfuVuKMMUsIIPjY714S73DSP9yYmZejV0IB/Z6FxWyt3o4DddSYWljODWqJDeMzpwg93VqsA6tZXFOAO8Nr1QqALuIxHFkIubMYCcPY37G0M5wyW3GJycr3WAqapdC1lzkc0fFfP2rgSZJ5XE0SH21r77FvxSARx2A03fkhag7MOoPiLeA34t9xgFnt5GQwhTWYo7fOwhYKt8VsOqBQc/xYLLChYgvYBm
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Cdve05S02Q3k5jMx68wGohZ6C2NzylTOU4/HazBu7HmILebiM83u0YI6iNny?=
 =?us-ascii?Q?cE2iGilzhYqTWFILK3bqD2l3VwM3aKc9V/7jwZ5F4aziba8/t+x8O5cr4KC8?=
 =?us-ascii?Q?Np0+cHVA0g6hOdMZdpNpG7HZiOaekAVQ98pUWvOY3gfbtGygThFcW+sAHDjp?=
 =?us-ascii?Q?C25moXaBSkyqyRhlp6vpz4hzhQvxflvDoFOViXQmxbHoiWe3YnmfwRKyuGba?=
 =?us-ascii?Q?4EhDRR/nIDy+CLfzvo1Ian6URKCaRRqi47sDhf6SMpQhM8B2/Ra4zGUzcMT5?=
 =?us-ascii?Q?DXDPJ0TRy34LRomrw1sOQ99RLInV0yJjNaxme01AGSPf7dziIjUiR7vnXABk?=
 =?us-ascii?Q?bmCUl1CcpPZCfU7lelmVyqjcRTNE2g2Cm5/VCwAcySUJ/ZK+Fd+fY/Q7EDo7?=
 =?us-ascii?Q?5fA0gLB7aeXsf+ju8rY/rnVfP7CIlmag2zMfkYEUlvlBu9KYTijArbVyjgVW?=
 =?us-ascii?Q?BNWqP57VGv4Qm83bCLidggcqqFSwogjULPVAah47bM1x1B8dOg1k2qNgAeE9?=
 =?us-ascii?Q?Xsxsq6IgMjr+6G1Nqcq4sK1kXr9JOzdsP4U4rL5ev5wQhLEh1wICsHXrVSDo?=
 =?us-ascii?Q?0zN2VHEYjobmvgZ4kJIs32scWVs/IbZqcdwoJ4g2tnBtWDudM6Mw7Y8L/xBG?=
 =?us-ascii?Q?r/S+itQEuazzCUMhKEvPTaMBow2JMnRkJSvuThflt+uxMun/aNTk8AQjfzs7?=
 =?us-ascii?Q?9qBhP1ATRCWq7w8PMcln27Q8+udLWnp7BE77iYcDJ4Vp5kqKtbZiVj8D+Vdp?=
 =?us-ascii?Q?lClAO4Sy2D/7WUvMNnEW+bog5HvvDCleGfPJUQHZwBu1bdeUWeNxAt1eCPJ0?=
 =?us-ascii?Q?viGCnodlgbUWguwP7mQ135lmRUqjRVSxbnHof5s/M5BzujAfBXoPvRLPW5OU?=
 =?us-ascii?Q?/oAGKOnlYP4b//8x9eXkDCk3fSOEftDJn+Ok362Zb8V9O8i10W/djHvqHd/W?=
 =?us-ascii?Q?Z0x7KWvpMaAzvaK3BVi5cSSayFUgKAsrjRFAypLGZGL4H/LZqHggXAgkoRTg?=
 =?us-ascii?Q?5DXOjU5GxUG5B3oeGUEAL+qGCd5RBj2FycX2uA/UEGPBExoYghrq1hddBMl2?=
 =?us-ascii?Q?gucIUB4L1/TTCIcQfrPJnkDpzdBkMtJwnZtxMWMiwrHd0BPVHDm+nedVbfiG?=
 =?us-ascii?Q?2gu4UCjSEZSaw3q2YWChqCT65Qt78deUv7fLxogVxA488/G7Vrbh3jp80Vug?=
 =?us-ascii?Q?8LUjrdA0eR1sPvwg/ExAqBkK0NSkLqRYVgCd0Wr45LmOS6/wgjSFwOwqRldI?=
 =?us-ascii?Q?/xjju+IXqPouU8Hl2DE9iWS1AH38dzjfDq10zKWd87pBqP11qcKYeYkpNgGW?=
 =?us-ascii?Q?2E5y7hVzMtzrDlZ70VpV36ugSCCi8PRFyUbFlrvutcYYEyIHafeSkXli6W+8?=
 =?us-ascii?Q?CyVlyeZF5HrrI+Weotlbk324kpO4HHFmox3HivAv1W5HwLbVnuj4RPux/WP9?=
 =?us-ascii?Q?ZyUBsUjvx+KWLqXvyllcOpK/T1frmf1Y0Hvrnc2ZZieweT/62S0NErv2/DIK?=
 =?us-ascii?Q?0fCeazwrQiJJlSBtrkH+1te8EG38YJbr7WGeaZpGdIZ3mbBnlZfN0I76pMif?=
 =?us-ascii?Q?TRg2BZrxevWYOuQx+JgAgvRF3yTZVjf/pFLEpwy1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fd4656-c17c-415b-d4be-08db8c6a87e7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:17.9125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MchAPG6svzbwQRLqs1CvZu0nuR4Co12JdfbvG6PoNU8XiMFWakJhOOwnGz39Wj4+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

Except for dart every driver returns 0 or IDENTITY from def_domain_type().

The drivers that return IDENTITY have some kind of good reason, typically
that quirky hardware really can't support anything other than IDENTITY.

Arrange things so that if the driver says it needs IDENTITY then
iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
never reject the driver's override to IDENTITY.

The only real functional difference is that the PCI untrusted flag is now
ignored for quirky HW instead of overriding the IOMMU driver.

This makes the next patch cleaner that wants to force IDENTITY always for
ARM_IOMMU because there is no support for DMA.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c64365169b678d..53174179102d17 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1669,19 +1669,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
-static int iommu_get_def_domain_type(struct device *dev)
-{
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-
-	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
-		return IOMMU_DOMAIN_DMA;
-
-	if (ops->def_domain_type)
-		return ops->def_domain_type(dev);
-
-	return 0;
-}
-
 static struct iommu_domain *
 __iommu_group_alloc_default_domain(const struct bus_type *bus,
 				   struct iommu_group *group, int req_type)
@@ -1775,36 +1762,49 @@ static int iommu_bus_notifier(struct notifier_block *nb,
 static int iommu_get_default_domain_type(struct iommu_group *group,
 					 int target_type)
 {
+	const struct iommu_ops *ops = dev_iommu_ops(
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev);
 	int best_type = target_type;
 	struct group_device *gdev;
 	struct device *last_dev;
+	int type;
 
 	lockdep_assert_held(&group->mutex);
-
 	for_each_group_device(group, gdev) {
-		unsigned int type = iommu_get_def_domain_type(gdev->dev);
-
-		if (best_type && type && best_type != type) {
-			if (target_type) {
-				dev_err_ratelimited(
-					gdev->dev,
-					"Device cannot be in %s domain\n",
-					iommu_domain_type_str(target_type));
-				return -1;
-			}
-
-			dev_warn(
-				gdev->dev,
-				"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
-				iommu_domain_type_str(type), dev_name(last_dev),
-				iommu_domain_type_str(best_type));
-			return 0;
+		type = best_type;
+		if (ops->def_domain_type) {
+			type = ops->def_domain_type(gdev->dev);
+			if (best_type && type && best_type != type)
+				goto err;
 		}
-		if (!best_type)
-			best_type = type;
+
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+			type = IOMMU_DOMAIN_DMA;
+			if (best_type && type && best_type != type)
+				goto err;
+		}
+		best_type = type;
 		last_dev = gdev->dev;
 	}
 	return best_type;
+
+err:
+	if (target_type) {
+		dev_err_ratelimited(
+			gdev->dev,
+			"Device cannot be in %s domain - it is forcing %s\n",
+			iommu_domain_type_str(target_type),
+			iommu_domain_type_str(type));
+		return -1;
+	}
+
+	dev_warn(
+		gdev->dev,
+		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
+		iommu_domain_type_str(type), dev_name(last_dev),
+		iommu_domain_type_str(best_type));
+	return 0;
 }
 
 static void iommu_group_do_probe_finalize(struct device *dev)
-- 
2.41.0

