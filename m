Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E213076DC8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:24:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=InJMJuwZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV2n5Cv3z3cWM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:24:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=InJMJuwZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThr6hVtz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLmxoR9qdLRJACBD3IiAZ8SO3clcxIpClq2RimiCXzEIFrTjQCyk+AtskiShK1D36vZ9U7fwWmNtootMDUuApXEJBSebAw4CWS42lUM69rHa8EYMrISbB8m3t8Ayp+NwAqsaEKMJ/vG2J01TvwSLRXF/YdDlWjTbcycNI6SeveKxUB+cfqDbFG99dJs774mQyzBOU2tMXGzVT8N+xUwA6p+nXbGu6iCGoAY8aA34APh24Zm/gzW+Jz19Q53DtskK24aHFw2iHFF9we/lU56r0NYmuvj/Zc3H5cXIW2MEQyYW9mRQqjWHAaACYfXKuDqtDrib6gX00LJse9VfnI2CLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYlxcy3yMGsIVIlD8LPwPMp6KhU7POD+Z4J27TYymUI=;
 b=jQzsIO2AQVMHlc8rI616fY1lIgTXKd01iNM3H7iZdwY3xhFOsesDBQDkFn6y5Ck4OrsfSJCUCx0BIYrHklyRcdH9SmfjMpNi2rpv9snfQvT+jx1QDBlHimemlGi0c9c9U3nnrytmdpcWXwlvoAYiOrmxCQi/YWFfVJtHQ/xV8qAyfW+FYa023FSFMpVMzaLw/OLMMuXxIK8bmCjzW4UFwAvrT9ttTDZ1Orau0Trk2vUOBkE1eSDH0b3llg4yBFjbs/TvbXmOQ6DqZt5iUTXyjW1VUBjZmclENW9yjdKUGX3a3BVPi8n2WRzufG/iiN/g0TteymKHtWscR03Ba1Kg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYlxcy3yMGsIVIlD8LPwPMp6KhU7POD+Z4J27TYymUI=;
 b=InJMJuwZ5x4LznhvxYlbecOQzPy//NhoZXatN+SlsFW5/Z+/bc1i6BHEafvHxoavO22+Qj0jj/bSaXFHagJyOzE8r92ll0IsA+hpQbM0N6LAWSA+LrYZoQG1t3KwDZOghzQyNYhjEGXsqVetiTu0pGjhzkjxk5jCk9XYopw/3weI4YdAg5VjM0pxhft10HxzmD7PoJxs/IHaJXWH0ZjPPn6vRQ8M4tkUNDfRNF8JUZKRZEj1G2PlWZVhDJNjOxH6yRUjX9j/xerCS1VcSiOQCFqG3E3bFUgdYu2twp+//MCe3aBlmTKTOKwqivVmVqclboyK+p0Ub9Mc3pkJqem4kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 00:08:24 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:24 +0000
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
Subject: [PATCH v6 18/25] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed,  2 Aug 2023 21:08:05 -0300
Message-ID: <18-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0288.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe6910a-1d2c-46be-a29c-08db93b5bc94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2k/Mb8MAGvsSZQPzM6hvd0iai9TOz4JAyC5WCBQ1fIui8q5cyUt6psQv/aokD4TkHqQQ89WUva1Anv36nxhjtXY2DkZbeDKh7sMTNT7HnZlAs1Osrha2TceEqk2EJ0RFwE8rNB/mNwUIwJ8lpvwgLzmN93aEqtsuMOPoqG1WSg+stLM6mqs/2J6JUfEzNHV2r2TAqXFqYx6JrDflefU25Ykb4rInz/K/q8QX6B68+LetFNUWf3jnDW5fsKxcLrNabY6CG855LIhqMxeBgcqaZAna1tBW/RojGKmgf/wzVsdYvS+PH7zLbGzxpD8ftfu7+/yKNXPZ31cK31RA318/DfRalk0Zqbz505Woi54XMv2HrgJFRPrUwA/4YGSKTJqNDUxLbwrPGlqr9XTYkdAOo6P5xQFjiHOZXcvOrFpboetZCUSetGA6QFMqOHiJLo2mcqFniGdK9Eerb/55MB0DGswYf/nETNQ6sGi/aLpNWgVlfmm2G2pvduDwBLdSdnHKYZU2lwI0c/rIhlyActjOYj7PNH3mDpnAfSXbTIz3B1j1vUybND/JtUjpIbe8UV3hUhNFw13MhsC+yECB9BS4XOZtgz3GWzkX0CzWzs9hUgW5R4MoMZFT3LvibfBV4zn/YKYHqxlZlNRAeVz2Kpeu6Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(7416002)(36756003)(86362001)(7406005)(54906003)(478600001)(110136005)(38100700002)(921005)(83380400001)(186003)(2616005)(6506007)(107886003)(26005)(41300700001)(8676002)(8936002)(6512007)(6666004)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8wHAPJPd1wYonnnX4mYqXIMiub4u0sLyapbqJgdYO4OkZ4aPYZbfwu356xrS?=
 =?us-ascii?Q?xsDYZiFj09pfI8CndGmiG2cg+709s4Bo/q+P2A8pVx96yuhIHLhGUablgkFk?=
 =?us-ascii?Q?5HUzCUwnRb7K4inWlOz+JDbChA/WoiPTgneJeql0CuQOvvhyk+3qggQ2drXg?=
 =?us-ascii?Q?WkADphjj00yFhqSBN9FZaoqc5rcpRzOWzN2l4SJOgpWGQaY3dvO6LLur2onR?=
 =?us-ascii?Q?pZb4UbKrfpTxLP7QVGnayfW6JBginnBCvfeUYcPhYgZ2+oJpqHF1/50PHIz0?=
 =?us-ascii?Q?wQ7qW0rnik2eAnC8V3XRFKGyucCedzQpprZjryWcFWDC2s+uefyuotnS0K+s?=
 =?us-ascii?Q?/+vKbS83n0KC6HZQ9PWTAq6hbB5RtzgTH0hAnPDoCPiasLLp065UdNxVrl+s?=
 =?us-ascii?Q?D4QNhfWWQkFFZ0MnmMRtK4VkIwb/LTTRl2F8E939eB42/HjrdpPmwFgSKU6z?=
 =?us-ascii?Q?DORUjsXmQVzgc8EHS5yCoS1UPml6Fpf9OxWQuKVjqE9lMnQfXiPe8Fqoq0pZ?=
 =?us-ascii?Q?MkxA/W0eRNRm7/74m2nBEYB3plFlVmbMNRfXujH9kUs2b6yRPOPCGwlZcbmU?=
 =?us-ascii?Q?CMD2Fn4HEM4kOXh30ImG2MQtMuZ0THAETvPoFfNrsXByf2h3EYHYV435+OS9?=
 =?us-ascii?Q?CMaOi8Y9UqDJ7cvBXMAiBqyqb3Q9GU8VPOboym0xWPwuTuMl8VH5iU/356Lj?=
 =?us-ascii?Q?n7+TdqY0OUmT9yYZTkBqty/uylNIfXm0Zl6B458E33X21hNh1HMU4xpilz2b?=
 =?us-ascii?Q?ylHeXyBFpnye5s5p/6O7f4EsFceHZ3mnOhmkA+xaH2KqMaP0aGR50nu0aFf+?=
 =?us-ascii?Q?0HxQQQpCT6AaeZVEMl/+jkimKZy1er3rzowhcsQyrfpLwsZQrIv0xfQ7Y5AH?=
 =?us-ascii?Q?T8xRCRkQ5o8QaKDnGJbHv9KAYrPJbG0jZYcdO4/JCyHgjPmOMqoEcDh6+7GU?=
 =?us-ascii?Q?UV29DgaRtlarsvypEVH1INwfKpKo5RKQ055Z6vYI0LazaZrJJIldr75oGkHK?=
 =?us-ascii?Q?EhOZcBGNMCz1cIWz0CdLvkiXir/k62KGIs9ayeaTqaEVYhrY0yQvqFFRUVZb?=
 =?us-ascii?Q?stAE/IhfQfVbUvo6IDxLIRapFcRMOH+N6+mpPK0E8IgUiUJ1f9NGZts1g367?=
 =?us-ascii?Q?IOh/AxewAH2vp8TKK0p0aMS4DyfcsJZuTT4ujp44f8VlouN1iM1YJPDfpXKY?=
 =?us-ascii?Q?4lLuQXsVIo3+Ki9mJhGLCCvwOMYWGE3subgC+01cJDGHWGuMLg4CyuiGpr1L?=
 =?us-ascii?Q?+Tbhnas3KXbLwf6X6JU/fFJ5qZk0g2i++8CkXYHnXkKtIvuGRtKl/YowlQl6?=
 =?us-ascii?Q?NoqNFaSj1uXCsx4uJpcJGw9yTf7Fw5WqKB8OXZYkrO6/Ju4bt9Bgvb3p6SPp?=
 =?us-ascii?Q?J0r6/CuLKvYzxeu5hQQLwdry59XAsb3bl9/DOxpbxelYUsjsg3GrYlxoOUGe?=
 =?us-ascii?Q?C5qrN57Sv/382bydGdjq7ugW+C9ovMVAj9IXI5Yd2WAsXAIAsxZyIOrqZz9G?=
 =?us-ascii?Q?m+DCcf6Wov29RYe05dZSVRIwllcUHfTuYR0Q3ZZr5l4wYzTpcC08XyKsmCL/?=
 =?us-ascii?Q?mJl7ijf3zZz0IeCFK+fLT+TNReOr4OlnUISd3/Uy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe6910a-1d2c-46be-a29c-08db93b5bc94
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:16.8512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZacjBHNmJxYEKgIy2zcdLuj8Rd4HOAJ1UbbFanp+k1UsD3eJ11gnWKymc2oX61c
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
2.41.0

