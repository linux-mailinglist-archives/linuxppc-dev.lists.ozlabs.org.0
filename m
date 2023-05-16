Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B4704244
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxlj1b2Wz3ffC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:22:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Udp1Bk2R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Udp1Bk2R;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH549WXz3f87
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey/8wJs8d9bBtVXEHnIo6jf2A8LEZYDEIlN6yIWq950BNsiN0KOss8Cz2UdOSfOgDUgR4qemLIdkJ0+wBJSBsRjjo6ZeVk5lez/AD8A+yK3Jr+mR/rHnOSO3STx7TIC7ggQrl4pCSHmBOi8wuBoUSg8jsveQO8RgEawG9qjiiSB9ndFiJCfhIiN3qRolh7cNjXdwma4kD+dcgAbYRWYOR7cPwzOparJFRrjMEi3+dTQ5VpyY11OxVu8cvjvF58/7gjb7EyCrMtr0yjlCZdED4Y3DghJEKyHaq5tvcbHcgo3bcGzHozPhQBkaJXB62v1AEgxd0+5uPwKbD1Q4XINjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUlj6QNPQM0PqEL9xSVjB1E/CR1+r9b80cHMZDuRDV8=;
 b=nHULWi2wOqWWVHY01hmKvT8CLDyrKEVekKjaCGidQjAhunDN7Mf9w0+qitmq0Z707CEjyOHc44qf1nnF71DKziEk13lnb5pnVU9CQbHMEBXkrXgM0wR8ZcgM1sfTLG+xXeq0ag3awjnzAAIxhgcUo6dR7gKZPVT6ZMvnChimKAEK5k3VaZ9Ux/3HFMpNi3h5LHzPHR8RQIX8e2FFlBvEaqKLGKv2xXMi7IbPPOJoDHpulbBepg97Gzd8UgQFabX9vIEdEcoT4lME0FgwI+jrLvnd3/tgk+fFNbg1AasnVJ5Ii7k6THfNaqnVNTp6mJSqbpgcUfTaxHpZ4HJqsa9hiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUlj6QNPQM0PqEL9xSVjB1E/CR1+r9b80cHMZDuRDV8=;
 b=Udp1Bk2RQoyQDQX1iKNZg5mCf2b7i3tBR495U+lypuTRse5zATE+n1Gb6FNrPxAfx11x98tct3VL6TbndUf8NMQAxB+HG/i7LcaIXFanrd0N8G1fwz+u1+noQyThkaOAzUKCgji1I8S1gqXsrukjWGpNcTk+SR2LFfbdSvl2eUkDsZyMELiMY0+JfH2mm1UAkf6MFXbwsGP/frmTqTB1uvOwyhLMNlV6+xDJvDfYK60lZ8gmNWObs9Ui5uSVK3jLUCtmaElkfX/vsqirnL1iuzMha5BcUZ84EZsHF9V5cyfS1X5ZCjAKHhqsR0j1Q7r4Hqz9+gISDlouw4X+9MePOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:18 +0000
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
Subject: [PATCH v2 16/25] iommu: Remove ops->set_platform_dma_ops()
Date: Mon, 15 May 2023 21:00:49 -0300
Message-Id: <16-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:208:15e::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 340c12a3-5866-4fa1-5ecc-08db55a0a469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ueIjFHLS6RNNIHznFVfmIJHl77/oHIT3qO+2UC984+IPK1XfZRcAE7bqkTkBP8G6KcpnWOyPsCtZspYFJhThsB+Fx8RxN/YfcLjFNHi7z3xyW8JiGq62iBlbFXLimmujDBWaa6uMcknMyCDmuG5gcvgvcl4ORW7c43EljcKeFQRcqzdlytx9AKbJC5Yx7jCZjq/s0vM/cJd5QpQYJq6V+e8Omt7WMMp0tGJDGA2oCBq21FG4kZRj96dq6Ig6+BDuikZVm6dY8WbLYQOCMVdgC4+v6bd2cOIn3aoll2caZtJ3NnN3aFwIjhvP/QU1g568HA28mDdrRsEQohHrVPB9nZiursafjpCQQgrkQcYDyz4dbD099v3Y0iPbxrrW6+Nc5SppkMSdx7+D9zIsiLXObntZVu6naRS4F3+wz6q2kanOFFXO6GyOHH5pnw+h7xBApZOHOs+TAoVUbspte6iJeigPBW8G9cD9BOd+n8ziBIIkEjrJd3cUQnNBRrjdTLuNWljIiJ/tOvBfuyCt0lo/+eGgUUlamfqcUcP4tyRe8LRLp6+uu/PBFIrZquNGiqjY1rfc/Cxb7g9vU48p19fcFgtsaMrzAyXaGG0orZvPESE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ByLo6Q6HtMnsssJJxzfofWKM9dJUvjGNnQKArzO2pCpZ76GLCUQFRCBtYRkg?=
 =?us-ascii?Q?htyJN/H22/XhO5LjhB9EYk+f6tZGwrx6b5iebjzdVLTuHidKZqrdtRAZn3DN?=
 =?us-ascii?Q?1m1xQw8EJVR1f0y2FUkYD00x8/rDVIeAhS8Iq990uGDwEoNF/TtN+GKSfiFB?=
 =?us-ascii?Q?PKI8vUG507EcCtcfSSAHIk5JEhSM3i1vLWD31wb5LjY319fideb57ry/0Whl?=
 =?us-ascii?Q?l6w+xkZ5vAt7nz7ZaLVSoe27Kk4yhgu7k/SkG+xF12X9BpN5l6zYmkzf7UGH?=
 =?us-ascii?Q?H3JQAU8JVa6F3z9C0hsv88uCQjnFi2f5xdlJsVUnr49BwXhAF1fpNFYtVtcM?=
 =?us-ascii?Q?Xnuk+qHouF4w/G0xZVR+fYEDv7q0rHQXNuHga5rgeJh0edcqHzFk8q5NyPey?=
 =?us-ascii?Q?YSxvbzticd3KA1Nc6K0Btb/VWtfzEmFeP9BsANEaczFbWybV2kVe7p9ARd7E?=
 =?us-ascii?Q?9iKtTOPVnuGFmopu5+yAN/iR1XnjjwvFAUaoYqoMfrTDjKVXeIfuNVr8IrCw?=
 =?us-ascii?Q?ZIT4h1J1GFUU+bH2GsvB7N32iohvrQwkbaKOQ7BhaEgp3+GJACmtujZKnomR?=
 =?us-ascii?Q?3+llOjXHgPfcX7O9pqZeiqkvHl833NjbKRx0JrDEbCTJjTO0Gk9BgN3AtlZ6?=
 =?us-ascii?Q?6IDIL3uBBsLp4yL2c5ZwxCrHSqh9dHhb5pCAHRFK0aQE1/4/ljyRa2I9u3U6?=
 =?us-ascii?Q?mJrsUIwrMtbZnmf0wNzodBHeIbVhMXStFRarkAf2IjHx7AcE3xl1f0h+HQjT?=
 =?us-ascii?Q?8S56AdW5FqB49+FPOyfiHfQJHaNE/Mur4NT57MZ7Yn6itGAbM3Lvtg/9Bzpb?=
 =?us-ascii?Q?DPw8FTRlBClmYA8KhH6+eOm+Tbbm9hINsRITu2l/3BnIp1p2j8EfF9lxlM9V?=
 =?us-ascii?Q?iacueQ2qsdgw8MQdf48vFsV3iAvcBukRckHn7f3bsJAmK9jmxlizkvXdwzaH?=
 =?us-ascii?Q?GeMhXDRSZYjQbk9Q5AtX1DgjxDcQNOSUhq3jT8o00Bo/opjp4QVaV8d9PTXk?=
 =?us-ascii?Q?uqa2ym04ovdhFEtJjR/6/FPibbtIH/sGtLUYLMSCDq+Q5BTXvskws+uDl2tS?=
 =?us-ascii?Q?wjJ6ImE74WeickoxfH9Vx4FRkMrrTanPDeQB7fLIpXRZBRk2wN/8mqRXm4hw?=
 =?us-ascii?Q?rDZ+Txj8bgnrk0nnIntWNdqCxbzcj/NMoF+DFbSvxHtvDMGbFz1izith1Ekc?=
 =?us-ascii?Q?q87kXPGecpf6+ZCbKowpADZPsfGL9tDCuSubWBLcG8XEYunTEtd5HZrn+/rY?=
 =?us-ascii?Q?M5fYaLTO5kMdrFoeTzO2U6fw9kLi/+5XiaA+7rVdsXKtcycRFxqLHKmztOPt?=
 =?us-ascii?Q?U5g4nhGXnFtLLZ8BcEPs5nXZOQo+O8JLDvnfj8dV5JrWGDtTsB8l3wGfsiZF?=
 =?us-ascii?Q?qKgc4PhVzW+ZIJpESgpXO9EOJVAICOBocKEaodDDnoUsE2GNvAnc8U/KGcDC?=
 =?us-ascii?Q?UvngndOJuQZayYG1nGxy9IDGanWSrjlLQ8ucFAgvY3/INZeWnm5A7YLc4xwZ?=
 =?us-ascii?Q?5JWgaRwFPkfPNrX6TR2uX3OWslXqDtUJypigQldEMPWI3OdB+u6Dg1RIwrKx?=
 =?us-ascii?Q?fyyLUbjD0OmFbSjYyPzpjGNSnqCPewPt199aYg45?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340c12a3-5866-4fa1-5ecc-08db55a0a469
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:05.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMcARWPa541VsuyjVtnOckCCrXqKGo/hnn1JO8L6BHjAQMiXZOHfxyKYaGObrrtO
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

All drivers are now using IDENTITY or PLATFORM domains for what this did,
we can remove it now. It is no longer possible to attach to a NULL domain.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 30 +++++-------------------------
 include/linux/iommu.h |  4 ----
 2 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index f9f11ad918f673..af8b91d15462f3 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2259,21 +2259,8 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	if (group->domain == new_domain)
 		return 0;
 
-	/*
-	 * New drivers should support default domains, so set_platform_dma()
-	 * op will never be called. Otherwise the NULL domain represents some
-	 * platform specific behavior.
-	 */
-	if (!new_domain) {
-		for_each_group_device(group, gdev) {
-			const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
-
-			if (!WARN_ON(!ops->set_platform_dma_ops))
-				ops->set_platform_dma_ops(gdev->dev);
-		}
-		group->domain = NULL;
-		return 0;
-	}
+	if (WARN_ON(!new_domain))
+		return -EINVAL;
 
 	/*
 	 * Changing the domain is done by calling attach_dev() on the new
@@ -2309,19 +2296,15 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	 */
 	last_gdev = gdev;
 	for_each_group_device(group, gdev) {
-		const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
-
 		/*
-		 * If set_platform_dma_ops is not present a NULL domain can
-		 * happen only for first probe, in which case we leave
-		 * group->domain as NULL and let release clean everything up.
+		 * A NULL domain can happen only for first probe, in which case
+		 * we leave group->domain as NULL and let release clean
+		 * everything up.
 		 */
 		if (group->domain)
 			WARN_ON(__iommu_device_set_domain(
 				group, gdev->dev, group->domain,
 				IOMMU_SET_DOMAIN_MUST_SUCCEED));
-		else if (ops->set_platform_dma_ops)
-			ops->set_platform_dma_ops(gdev->dev);
 		if (gdev == last_gdev)
 			break;
 	}
@@ -2935,9 +2918,6 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	/*
 	 * There are still some drivers which don't support default domains, so
 	 * we ignore the failure and leave group->default_domain NULL.
-	 *
-	 * We assume that the iommu driver starts up the device in
-	 * 'set_platform_dma_ops' mode if it does not support default domains.
 	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
 	if (!dom) {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ddd284f8e5b768..387746f8273c99 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -231,9 +231,6 @@ struct iommu_iotlb_gather {
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
- * @set_platform_dma_ops: Returning control back to the platform DMA ops. This op
- *                        is to support old IOMMU drivers, new drivers should use
- *                        default domains, and the common IOMMU DMA ops.
  * @device_group: find iommu group for a particular device
  * @get_resv_regions: Request list of reserved regions for a device
  * @of_xlate: add OF master IDs to iommu grouping
@@ -265,7 +262,6 @@ struct iommu_ops {
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
-	void (*set_platform_dma_ops)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
 
 	/* Request/Free a list of reserved regions for a device */
-- 
2.40.1

