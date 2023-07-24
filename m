Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C814975FDE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:38:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TSHVYNN5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nSV4rQpz3dmb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:38:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TSHVYNN5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6c4xlcz2ytd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhYs/8b96xyC+8uDyCe0ZqNEkMDRc9M0AoUZn9XKPt2Kg6jz3nU24dS+Jm5j7ct1/RACyN82vUsrpuDikzigwWb4b2gLT19YcVVDtB91QQleKZ5q5GHHekCP2Xqy6B3yKjPI8T7QqvBK0E8lXRdazU8qNjFoMfAkDXC5RMwDXViP/KQHyfm0JJlZe+XFbWjxROEqZX0N78KH0mLXMH8pBMSrwW6wXycY2z1mn78ZgEYIli2qNM9iWaq0JamVnJZbql8DPMEPlfAQP2wvIxNcfJomI75FQ7cKG6mASUAu0UdlbD2HMoJAsmXacUXRM6oYCPFy/+S6zJMg7X1170FvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5SXREaZAfh1crklz/cC4OCLXkXky2FC9P9De7EhA9Y=;
 b=aEPymStfVG1WOQ1PyAcyFkHffa5Urvymnk4O+NhdbGcStIcl7mYbydkR+SIxcMc6HVK3OoNa3DpfKs/ofZktceDn23sTayC9Eot/3+xvnXEq4MPK62fBzvM/jlj8G9re1mBVsv829Y7AwKZMbcmdnQgDe4wiA2TtOIEIMI9NRgaG4yvJyoifDIzkonwmozPh22KKG5BtHTxkIzuF9T1Ph5Z45MGI3nfL7sxumjdiI/sxjoQce3X6sA3jla3aTTnEGzibWqDvnXmLLwFNFKeBqpFxY+VVHDuDY7S9KFcgY2tw4yXC5KmYhVNC2kqSBM7tLR3DL+byD3CVO5bTUG+2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5SXREaZAfh1crklz/cC4OCLXkXky2FC9P9De7EhA9Y=;
 b=TSHVYNN5qxZK9w4WeYeLQu5fjGvY0rcsVjsqXSu/7p8OTpeYRP0XAB6UnPmlDF0t5swWHdB32YY6mPpHSOQqLRcwCBtlwdcfoCX4H7Uc5MdLY6cR0kE1B0jAFU9zh11aMR0+Y/ejql8vAnaWByV1+Q1OH/bjvUvETJRz16alRWZKV9QBgg44k2VfHVjtlUOeoLjvfxiRVFXW4BjqqB2NuWZRyddTAj1c7uf180K4kYHrLPvm2ok5Rj+enLruylVMkqpt/PsWqIriH/9IQLdWoawYC04/x46KjJ7XipOu05SnC8uDz0/J8DTp8vmRUUa8C20A7GGGRYlaeGYtKyLj4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:26 +0000
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
Subject: [PATCH v5 05/25] iommu/fsl_pamu: Implement a PLATFORM domain
Date: Mon, 24 Jul 2023 14:21:55 -0300
Message-ID: <5-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 8172ae11-65ec-4618-a87a-08db8c6a88eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9KQIPFjtCqbp0IHbRY/H6AsCxZVTnwJhVkWKgJZwZ5c52jpfB5I63hDhUaZcBR4nWiBiaeguydT+o6kzO8XxzhjJfZY3dpRJRQ/iOEaaAhiurQXHLCN62xyX8MyCR9GDc7yiZx1FTTWIxaea1sMcND413EQ94m5rK0kf26f5p7pHu9u9m+P6RZkMcr4SYtdK+VDy7mL8gRwX9BAr4p41LeKDaK24+B5wj/0R7ylCJFGrU4+qaSlBdl0dMthQCjfFTKWUOxqkL3sKs7n6B+mFZH9xK8TNSBLmn/I64hQ7mft32NPHjj+WzauTKJ4MrSvzGRJHmbVSELM20NH8FiI29awStWgzgEqUtJr1/FljQOPDLeCCiEXrLA2LFN28F6qpuLvJ8WB4A2LNKp24rZuT4YMZrfHRCeAc3CPtxl3UuY455mWQH5Q8gBY0AO0KACGR8ow++J9xze5qW9tQ6IWFViBHz1pH26zUnMRtO48dWeg+5GthvCck9Na8EedNVbcZRTr9gxjpRnSMx7wWBLafDSeCTxPtXyho5/m/+jZLASiZKLXUwhTEwlvSK3U9S8FYH3RX4COj8HPPoHdPKrAvvCgRye5Nc20W0qBoqq7k6Zy0aP4ljXreCnpkROwYn7Kp
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YUyyTX8fkbQzjJDW8cG335s4WIrEgtCZ4ZpNrdio4EZp4dfvdnX/wTtdp40u?=
 =?us-ascii?Q?XIrbPhXAyyXtPuET00RDQ+1/DaWoO2KlpnVH2DIcnZR+Dv5V9OI0vglxBA6j?=
 =?us-ascii?Q?UDSThqCYKBcTOZAXI/ycUQBwx/VyX6GigQ2gyQKsYXDa02Gj9lTJdu5XdryB?=
 =?us-ascii?Q?vbe4sYQOIzubSGVb9twC1ZBOpIoPbl40nPS7XJZn30GAC+akdsPC18OJVJy0?=
 =?us-ascii?Q?Uyjf8tGJwKJu41zkpsReZau6bzSZDdZYN++ZEJ/rDQiu3Ge683Av975jZxTx?=
 =?us-ascii?Q?is6pXqpQENH7OhfF+/+jHRy89xiZH3k2fQ7HsZRJHILg7AP/ScuYElG0gkky?=
 =?us-ascii?Q?/WPUfCm6mOr38As+qliAjukwnOGQUNHsaDnkiuZWnxOtHSw5VYoQmBZ8xfI0?=
 =?us-ascii?Q?iGhpNIIYyyiTfZHWHyWybaTwMZKdB+CYz3ly9mk+8aIIdtUsfKRChsQCyV/I?=
 =?us-ascii?Q?KSIDARwn1bo8k/IHXH2ePSHcA0MlXEIMBxUugcMnvslmFmntjgvgpjMm/OKR?=
 =?us-ascii?Q?oMr0t/ebsENowGBQIG9lpP4jD+wD0S8LjHL1W99a2tkAj3+uu1pf6w1ZcoXD?=
 =?us-ascii?Q?HRWd1f24h6ck48c2gOu7UX2G5o/wZ5Q6RczhQQ8WisnBN4qHydoxue0ktqZS?=
 =?us-ascii?Q?Kcg04ww4myDKV7315ZHh9swvzaA8Z4ZYMq5FWSXYBjGozrAkWol/re3MhLxR?=
 =?us-ascii?Q?uGdfxxiJOMDJBhbJQJ/AvyB/9EMV+ugeJ/8qmWyPelFKcXmZEAy+N3b6RDaf?=
 =?us-ascii?Q?Oi9sN3LOnmDCqqJ++L5pLda8FxMf7KH8Li+cut72iNrh8FukTtcAo/itetPD?=
 =?us-ascii?Q?I5WSX5/B93pTsgnGBHi7oHl9gbp0w6JMFiUUB5VRmxU4udxUh0Eq+s5b93dc?=
 =?us-ascii?Q?Rxns7rRjLU8uVjjbU1r7jmMIkZQ4q57zlqAHYd2GjII2d+23MJvYsFTxr/wR?=
 =?us-ascii?Q?pf/4CpxvgN7GB75pFbhYWLv7QOwbwmOyMkSYWsW04/mmj9nvIkoPVFlMXb51?=
 =?us-ascii?Q?T2kkl8IIDJBU1Zkn+PDs8uVCjX3/xR+VuFGCnrcxvDBxSwoF23no9tyC/bC+?=
 =?us-ascii?Q?2XTuKlX+COJzPAgbh3RRNPjeZi6R3obofZy+Vo8bunyUrUI9puTR5Ygh9UOn?=
 =?us-ascii?Q?cSVjnpiy0k3rsXNlAGceCdhj0PneH8jZDEsA1Wc+5IwHS5lUnuOdnFWRYIqv?=
 =?us-ascii?Q?Wx8Mh9/u1haswqiqf/c9/d9pOh4HAV7yS85XoiEiRkmFm7tPho4lHeuEtLYf?=
 =?us-ascii?Q?bQCKts0Y71Rize0a2xdzIlr4s2Ls9HESLVsDc2SMaavHQiraZ0FpCDN2rjm5?=
 =?us-ascii?Q?l7BotHGNg9z3YdyhPAYf0gildn7XhOAfFqSEe28jSGDoBdCK342l8oSANutK?=
 =?us-ascii?Q?1DdvhzfqR7ihZvYEe28wfDjOA/aun5et0qoLoyzpKg7p/YJGZNu6C4U783ln?=
 =?us-ascii?Q?DVxm85e6yGJ0HXI2YIuZ4nZaMS0cth6gy/LQaGYikiaDRp/IPxDOsFWclDDi?=
 =?us-ascii?Q?r7/74miTr15tGl62VB+d453OUTXOHng4ctjBlxMo7amEUHmApNXkN9aL12LE?=
 =?us-ascii?Q?g+GZ4XQrQTPdsaiFZ/i/WMKdxtfLn0NiyWYI2Eqd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8172ae11-65ec-4618-a87a-08db8c6a88eb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:19.6174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZoyZoZTmLEiFSLJZhWTrez+KBlqIVRiAIHD2cl2YYOqgDyq5zqDbKtNs9g/8bCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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

This driver is nonsensical. To not block migrating the core API away from
NULL default_domains give it a hacky of a PLATFORM domain that keeps it
working exactly as it always did.

Leave some comments around to warn away any future people looking at this.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 41 ++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 4ac0e247ec2b51..e9d2bff4659b7c 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -196,6 +196,13 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
 {
 	struct fsl_dma_domain *dma_domain;
 
+	/*
+	 * FIXME: This isn't creating an unmanaged domain since the
+	 * default_domain_ops do not have any map/unmap function it doesn't meet
+	 * the requirements for __IOMMU_DOMAIN_PAGING. The only purpose seems to
+	 * allow drivers/soc/fsl/qbman/qman_portal.c to do
+	 * fsl_pamu_configure_l1_stash()
+	 */
 	if (type != IOMMU_DOMAIN_UNMANAGED)
 		return NULL;
 
@@ -283,15 +290,33 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
-static void fsl_pamu_set_platform_dma(struct device *dev)
+/*
+ * FIXME: fsl/pamu is completely broken in terms of how it works with the iommu
+ * API. Immediately after probe the HW is left in an IDENTITY translation and
+ * the driver provides a non-working UNMANAGED domain that it can switch over
+ * to. However it cannot switch back to an IDENTITY translation, instead it
+ * switches to what looks like BLOCKING.
+ */
+static int fsl_pamu_platform_attach(struct iommu_domain *platform_domain,
+				    struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
+	struct fsl_dma_domain *dma_domain;
 	const u32 *prop;
 	int len;
 	struct pci_dev *pdev = NULL;
 	struct pci_controller *pci_ctl;
 
+	/*
+	 * Hack to keep things working as they always have, only leaving an
+	 * UNMANAGED domain makes it BLOCKING.
+	 */
+	if (domain == platform_domain || !domain ||
+	    domain->type != IOMMU_DOMAIN_UNMANAGED)
+		return 0;
+
+	dma_domain = to_fsl_dma_domain(domain);
+
 	/*
 	 * Use LIODN of the PCI controller while detaching a
 	 * PCI device.
@@ -312,8 +337,18 @@ static void fsl_pamu_set_platform_dma(struct device *dev)
 		detach_device(dev, dma_domain);
 	else
 		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
+	return 0;
 }
 
+static struct iommu_domain_ops fsl_pamu_platform_ops = {
+	.attach_dev = fsl_pamu_platform_attach,
+};
+
+static struct iommu_domain fsl_pamu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &fsl_pamu_platform_ops,
+};
+
 /* Set the domain stash attribute */
 int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
 {
@@ -395,11 +430,11 @@ static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
 }
 
 static const struct iommu_ops fsl_pamu_ops = {
+	.default_domain = &fsl_pamu_platform_domain,
 	.capable	= fsl_pamu_capable,
 	.domain_alloc	= fsl_pamu_domain_alloc,
 	.probe_device	= fsl_pamu_probe_device,
 	.device_group   = fsl_pamu_device_group,
-	.set_platform_dma_ops = fsl_pamu_set_platform_dma,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= fsl_pamu_attach_device,
 		.iova_to_phys	= fsl_pamu_iova_to_phys,
-- 
2.41.0

