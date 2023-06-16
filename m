Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1A733951
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:16:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R6I2cXDn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTRL48d4z3dBD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:16:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R6I2cXDn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8D3kpDz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD0zS4K2sVuyELWL3hRonA2MHNgWezjEQSxmDwmjmv+berYiVbLikiW7pPYMO3vT78bzs6yS/+ftytBfz6fxoqa3jjGioteUINZZV3gm+GblFxbEHFUQ3p2BQ/yT8VFWBsnbsUrHeKwE1I9tDKUgvu8U8I7x9pIZmI3gSZT8+a/x0vPnpDkJEQtNbRoF7p7iR/vjv284Ap8icfjfN/wCOuHDopeYA/UywB5A0VYPP3bhKULPZQJuljn/qydHtiEhBBuL8SK74c9fI5GkOIyKcL5vxQHpxjuoqR7qVJA7ZPy8hQrPeB6Z9K9il5Eb/rh9Xz1TI8gS7oul1iWvXfJw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMhb/bqTdUCpbXJCspFn2zl/ilrxq2bDon6W8QDV/+g=;
 b=blZFmr6lfF2wHhhQ5jeqim4fOgEVmjHJtOOIr2hxOvjEa36DJA1C+sBtdf46iGRZg1FVG0b0d6nfP2u87qAL9gBFXqmkBUZVp9xX+g01/EtMmFMugnVusVpRZdB+w7zGdKOcaLLx4Wy9TnVNISiSaDNknEXz+OMxhh4P0jq2U1nAGz19pC7INb5jbqj2UCUJKTjrSe7dZ9myN4wDw+Pl1TaqlUiLXJLUhtGXVBIsujIlH4czf842a2Y/1KoLMXzfuFqEQBIC0N6/CGuxzXpCVTYxA0+vrnPeS9s3S0lozc46eSVqpc8zvrCg4FPh2uyVSf2aFi67dPhtMXrB/sJh0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMhb/bqTdUCpbXJCspFn2zl/ilrxq2bDon6W8QDV/+g=;
 b=R6I2cXDndKw+KeHvPFc7L1I619RqdH0S89sIVgR2sGLrsxTFuTae/hv+a8ksoe6Heux6UeJ0tYuDtihRf+Gjz+rOXZg/RtSUOjbOgaUN0otJ8dgN8pfwxS3DoyYeQF7xzolznRT+SaT0oFHfDea+UUKztt0voqAhYNaCPu846iPCrJLfZ4dX2GV+zN9saONiz8qhbyNfz7AZPOdO6bCdoiS8o8XyJdWfsBNEdHNXUVUuJMvtXJZ21zlp5nH7spd500ZngM2hJ63i8aobdeSS0pDi+tA3SxTE0FfyNEXWayJBy6VtZLcMqLQWI2+m6CIQ1QkZ5W/DxOim1D/K3XdDWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:04 +0000
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
Subject: [PATCH v4 18/25] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Fri, 16 Jun 2023 16:02:47 -0300
Message-Id: <18-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0066.namprd20.prod.outlook.com
 (2603:10b6:208:235::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5521ff-d650-4346-696f-08db6e9c4ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bZn5cnTWJDJlrabgJ0rhSoyddOG9zJp3Je/B7LxGj0rOuhx+Mnt/EWb3FlHGqpNNnZfcxNmkyG4CV7mrLr5aDjPKdfJcbFW9yLjujiurECZ0bIyHvgQg/Apla7KDcRFbw29daLUgkrjOtbm5KG96XqL0ZMg5aYrnBBimKJIKdqnH79OwhF2UmT4OcbdXGi0GapHszD7F0sVcorDxY53Lg0sAbDXkqOiGdZf8bm5/0Jje0lhEY+9RUUCTr8PV6rM+E1lFVuGBcF8wmmlcXnVNnqLO29ZP5vnUAky5kah0eg/kfCZJluUd/P5EysmThedMd/qdKiKn/eT9KtNVkbk289K8xaKRt6LZI89y5JXbP4+382f+E2YsgiKFit/3X8gFnO75iLDc8w6jq9TPC3PWSmEoOkAxZYeoVyVJ8C0abyRwj4Y8Z49j+oo/xLHDyVhYcPKCyWXs91zEo0zdgFPe5S9ySLu/8FGnL4OXwLsVk7dylELywv9Sok3r/jvgQ/QQTg/Xicy+/Lvc0yPNzGr+XvNLq2MC+Xi8py/Hm6v4FbLTn0uvEoZ7/yZN4UpA6PHPFlHOHyq7uGtyypIQqy+bSI5xbip07Rt7nZJqR5jX6z4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GXD7G2z5GYJOQSMDizAjxSxIOcU68V/jvY0vZN+0OD0kMh4GvgbHYtOBLJzq?=
 =?us-ascii?Q?8DZBKYjIYIT/xIXzZb594y9ws6FicoaC5iWtOotcLpGV704IXRCvir4JTPX0?=
 =?us-ascii?Q?ggUy+usvs7vkF1grYa59tZ4JHu4eK259g07OwKwD5Kpm8eD4Za4M2zBx8g+H?=
 =?us-ascii?Q?7c4r9yTKpBXvooijo6D97TMnFNc9oic0I3yjAeKeQJsUAIyRkfQZwQY+5uvr?=
 =?us-ascii?Q?rKVL8obThTOs6JCv2nqPW0vX0EXxtaWvf1CJz0XIc7Y22/IjU162BbCb10dE?=
 =?us-ascii?Q?T0J8+6MwFehKKaKgcPyBCnG0YoeI9NOgH8qRbbas51e637L3stnY+e1x1h4Z?=
 =?us-ascii?Q?uVf1kTuk8erzeDGT0y9f2Idfk9Uign8oV+BebLtQR84bxL8468BXTRBXIREW?=
 =?us-ascii?Q?g6R8NHGnfI7RFWgmyFKGUcPWYF6AmjGY/i3Ma/2zVtfgeIeZXtwpAByaHsUE?=
 =?us-ascii?Q?xS/BEJ+vveEDuZTJ2GrBKAWjMwL716hnEXgq8LybyB9t+If2psZ7dnmgGVU/?=
 =?us-ascii?Q?JadDla1e32Bq2YhZ6GnGxoJkuiFIP1+8cTCqJ+enCJDfyoIIYLBLXPk5rs5v?=
 =?us-ascii?Q?Vl6r2IZWgm6qs/Ntm52Us6pHSihg09l8ymQzKOFIGCcAI/Kvb5GXEMNj9ub0?=
 =?us-ascii?Q?Pnylp2ClnDEPIzBlshUkj/o9zCJmIy1XuKrgW2xZNLQcrZbW/LvakRxvU+Sw?=
 =?us-ascii?Q?o0qh5sqNdIxHjSK7D3RnpxSlvauvkgTIariVNKKEcXUjiVIsb0yemSmuQiWi?=
 =?us-ascii?Q?Y9/ev06fyFh78jhnCaTCU4N8d/sf9/S1hZSFSyLHRzhRKtdC44ZzSQ6TjKcu?=
 =?us-ascii?Q?3Uz0qYpI9ZEhVjeiqxwmSdRMfYW8GrrMyH7ySi2wLZLsMSGz3U5h5KIzXyGL?=
 =?us-ascii?Q?eLAd2E8Zazy9FNKDgsyKWQHgAc5Pi9r1xJ3YeEOZ1zcIppbhIjaYokLEdlwn?=
 =?us-ascii?Q?BCQ+CvTmTvNdKuGeAkpjdAo1V70mTrAK4WpMa4xk55THg4gyRCPdjRMNdV+I?=
 =?us-ascii?Q?kojQHhpLh5EmPvPVy7XXwX5rw5LhvJcXv0/MiMxBHUc1Ho2lp5Vnyuw+tyaG?=
 =?us-ascii?Q?wPid3bMjWUFebBeet/D6JaKnZcNrHbrlfyQdM3+W6Rc7PU/9IRsTDPXLn3nL?=
 =?us-ascii?Q?h52yOQYsK3v+IMXI+JeK1ZyFX21v5r9m3G6NXfXBlA2M7zujWRSyXM1zQqpy?=
 =?us-ascii?Q?Ez7RJ898UvIxNAmFNDZcG4MTqK2rzYppeCv60EvWC0iPkQxL+MXO7SZ7U6tG?=
 =?us-ascii?Q?ObVXCS013da+v13cCPhFBBkanXsSVYAMKIswOSerSDB33dRV7g9eRGEKO0fg?=
 =?us-ascii?Q?pilD8K8OHAPFQCER+fB+f91n0mx1U9sMLZz6wrnOb4bNOkgyWP1QS7ZiLjV5?=
 =?us-ascii?Q?RCM4wAcCcGsj4St7Fs1O9rHhPbfDIHh/JHofSdPo+2hkVZF46iB5OgLlcU1a?=
 =?us-ascii?Q?zsSKjt0JnTURvgQqhZFlt0mHCRcr8ySllZwpQ1JHpD3rvoUhD7p8t3vU5Ud3?=
 =?us-ascii?Q?WPxbpYjIHmJKUHwXIJis55GEsQP/wBEHyMb4gdmlpw/kKjJGLxzGnKITxsu4?=
 =?us-ascii?Q?xeMdc3SQM3rzXfoM0nKBrDFkynWFscMSazWY21oo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5521ff-d650-4346-696f-08db6e9c4ba4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:56.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNuzraxebkN9dWjZ06vF/yWaQS9qiY8lvzjEKypJ/IAzbJ81unqhkIf64+3xF8Vc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Also reverts commit 584d334b1393 ("iommu/ipmmu-vmsa: Remove
ipmmu_utlb_disable()")

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/ipmmu-vmsa.c | 43 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f64c5c9f5b90a..de958e411a92e0 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -298,6 +298,18 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
 	mmu->utlb_ctx[utlb] = domain->context_id;
 }
 
+/*
+ * Disable MMU translation for the microTLB.
+ */
+static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
+			       unsigned int utlb)
+{
+	struct ipmmu_vmsa_device *mmu = domain->mmu;
+
+	ipmmu_imuctr_write(mmu, utlb, 0);
+	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
+}
+
 static void ipmmu_tlb_flush_all(void *cookie)
 {
 	struct ipmmu_vmsa_domain *domain = cookie;
@@ -630,6 +642,36 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 	return 0;
 }
 
+static int ipmmu_iommu_identity_attach(struct iommu_domain *identity_domain,
+				       struct device *dev)
+{
+	struct iommu_domain *io_domain = iommu_get_domain_for_dev(dev);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct ipmmu_vmsa_domain *domain;
+	unsigned int i;
+
+	if (io_domain == identity_domain || !io_domain)
+		return 0;
+
+	domain = to_vmsa_domain(io_domain);
+	for (i = 0; i < fwspec->num_ids; ++i)
+		ipmmu_utlb_disable(domain, fwspec->ids[i]);
+
+	/*
+	 * TODO: Optimize by disabling the context when no device is attached.
+	 */
+	return 0;
+}
+
+static struct iommu_domain_ops ipmmu_iommu_identity_ops = {
+	.attach_dev = ipmmu_iommu_identity_attach,
+};
+
+static struct iommu_domain ipmmu_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &ipmmu_iommu_identity_ops,
+};
+
 static int ipmmu_map(struct iommu_domain *io_domain, unsigned long iova,
 		     phys_addr_t paddr, size_t pgsize, size_t pgcount,
 		     int prot, gfp_t gfp, size_t *mapped)
@@ -848,6 +890,7 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 }
 
 static const struct iommu_ops ipmmu_ops = {
+	.identity_domain = &ipmmu_iommu_identity_domain,
 	.domain_alloc = ipmmu_domain_alloc,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
-- 
2.40.1

