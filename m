Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B5785DF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:56:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TLtG2C5B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC6N54x5z3cnW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:56:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TLtG2C5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwk5Xskz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJrfoqtpy+XWYNIh+NkH0L1ORuD8OkmhNBlb7GvaQSbcvxcSMwXmzUSkAsTNRg33ONsu/rCloR2TOpGWtx0qT3u0mzlSdS3ORyOJXDwlSCEIliWJStRpTJVW77l89iV9cTx4fr9wwhjLdsLmDWZoD5ITvisq2Kw9vyIAlM2w8IlbmOk4kJsYPc6dLiWPt4+IjPoqmLUd9fTOoCcvpr31N7EUtM02JHsPvtXizLemtRFM7i8FjCUfe3+bCN9HMWl9WFC0UAn5hPJ/DmI1dtDebDN38uJv/3vgBK4DRgMoO1ARR4pdckyc8GZ0sAYwadm3yOMF5Xk+R3JC326HzNTrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bQTaN5b+qgoSyEQwOCYPGzeYBlCGBqHAqDsYdB9PPg=;
 b=MVJH3CVBfFS/WvUToHLMfw1x2NFcAedB+Z6/besK9LFCr7KIRVmJLd2LeGpayOw2td5NM0wi2y/QH1tHCZ9LAn3W5x/kmcBB31DQOygQhGn2394OBt4u5EQPBTbYVf4xsnhaWCbDzPH/wHtVTHqj4Vmh1cw83ensdn1pX91hbhXwbaNiduV/R78EMgJe6RvOAtQc+mE6hh/6Kz5XQecSwMNsf/sbxlD5jutyX9hqW0kHUR9r77oNn2ZiykIdUtyJAKI9Vu4IwzOMHijGM59nv2j2UgEQV8jt2nMbR8kqNLoXGOTVtso/mngt1OALr208eZPXGV+ml2xyx8sWDoLOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bQTaN5b+qgoSyEQwOCYPGzeYBlCGBqHAqDsYdB9PPg=;
 b=TLtG2C5BC97ZvUjPJEK/YrSbZJjJjn0k6O1FE3k9Tfid/qiErC750s7vICz/nfq61VIbEYUlZOwISSr4dRXG/TiCAIywwibYxOp8KmO7THWoUjDNERFYB46HwYeptuympQ8v+pH9frt0L+u+N9k4a2sl3O4osd7R7gbApJZyoccbAGNmMEpcZi0q6VyyOO7lIhX/qSPoR++kUlFTYbptf+KekCT2bXQH6hk+zCPaLkAYKUeBJMbcUj2N4WA0HqtgybUkB21kJTGTgJpBbKCPqfxNJ2Y0fUENjjGuPKPlpKvOFB/hUZK1bOfBUDaev1fRpZGuVci4nw6a7elrLhqx8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:50 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:50 +0000
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
Subject: [PATCH v7 17/24] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed, 23 Aug 2023 13:47:31 -0300
Message-ID: <17-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:610:58::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ece3239-a17c-4cc7-6634-08dba3f8ab98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Pc9xJ/IhEaugfqaEPBecSHVIKZWE+Mrzu1NIUexm79tDRUaVjeDqN4rtI7TVV2LoGu234fFC+KcGjckLUTS0Rg3kjpZmtu/j1A/wMMaJJqwXz6UVlFe7oNL94KC+Qv1XRkg0BmxvF9DvNhbaunyk8TPlqIyAsU071sf+rM0dXC0ocd++ZjZi25vKCCSHP+kLadBc89E1RwRqBil6ERSdVwPHeG7HSbPHtEzxQCdIr72EKVdJFjaxpqk5BoZRUF+sH1fE42THBvwCVJcFN7F35MsY2YY8dU1K5GWE05lxshWHejg4d7kS10UkqbIwwuUbyGTSKoX/pdYMJzqBVjgL0+C1VeMMlHrbufr6a5V6GetcJMC2MMTAwOPuMOTQo1/ZufHJn7IdBGcB5zqm9gjinm/Qi1CCFQDVIAPytx4kDIF10YgH2w7DqnWFlf4mAQJrr1fHent7n0+6AMOjaMdDkFeob5fHtLM3TL/y65wDWcAHzrQN+DI/pvpAwX3k6+ChicO2qmJn0YH1pbVeUztAVJpS4RMI4Zp65b7C/dN66nJEnFsQRfCmBCO1gAG/hREtigKQFPZx3iXqm6DaeZUDQyzpSa+pQvbBjl3GZC31YwM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ulibByqR9kfBqGCRoqGqusa4rUuuGFsRwV4yoGDFpFjHUNuwX8rF85q9X4p6?=
 =?us-ascii?Q?bdiA1pX2T3CTXlw1OD9mZaNFP8Ci7zghpuQPzWSOxPne8XnpwectgV8bvmVW?=
 =?us-ascii?Q?fnIa8GQ3iPJcOKWDcI9u5iKaJ5ZLy9eBfog4pk3nmWlR4SV7HXa0eW/Nsv4V?=
 =?us-ascii?Q?HO7IPFThpdhZTOM/+xmUFzf0Qz/x5JAYsREF50MyWebY2uRxjx6DMxSGIm08?=
 =?us-ascii?Q?4WLuTW1Dul7rRIWOj3gBQKKLRasq5bEMEJiPUchzm/xe5ynDl2B2K7R7LtCJ?=
 =?us-ascii?Q?CHdU0rAOFTCsOJm5SOK+COy+PBmJELURimKGT9HbVsdt2NsNj33Ke80q8cif?=
 =?us-ascii?Q?ZOjK+2MuysSywAqGN/bejONa7cW00x8cf8igoKx2lTSqeZcPwVtNiG9ASPbb?=
 =?us-ascii?Q?WJryi1PZaOJq1XK0WwbbJdEx+k8cE+/5KQuT3cZNoXyDSndZLLO8G6qM5mh1?=
 =?us-ascii?Q?h55unqAxXVxcv6IYhfcAv0foorH8T520ibl09qe09NnRU/6bTNmouuTDmM8Q?=
 =?us-ascii?Q?L5Yeb8JwRdKvJSblhXC27oBAYbWWRhDPPk9QG2OYjase1PTkqSgPcIhoRbdI?=
 =?us-ascii?Q?7pPDavMH2ehnb5YY5yRF4qejHnGuMx8ulj7G5Gi89F3rw+CKSb1100gF64h+?=
 =?us-ascii?Q?fDYGQfVmsHzIOxXcpyQ4kHR3JmFwir0u0BZzZdj3zZyF+NooBYS+jK7YAAcX?=
 =?us-ascii?Q?fsW+hOgUbb0rZyPrWmaFILKI8YgAMhO3wackcafkt3Jt+0o2RQzv7cw7wk/G?=
 =?us-ascii?Q?cdBNt0Rso1BxVyuLvSCWHJNJrgevhH5k46BM5F1vCEqPSN1pLcGMWCYVPMUG?=
 =?us-ascii?Q?dndIjzBR/r5fVNoCpB91Ta/Iv6PTWX3zCBy2XTtrTS63x61Rb4O+0+uS37x6?=
 =?us-ascii?Q?hD84KnmbeW8gteH3Lu0z1IrTWlODJ5E3VZGDwvAZRjz25dZaKrTdR0wIB1XI?=
 =?us-ascii?Q?iseZ1rfV3pYPBShK1kODeUbSxD8mmk7XzatkniaDmOH8QBKjlGJ94LkRS7DN?=
 =?us-ascii?Q?YIU3yk+3wx+a7or3PkZ7xAGYzxW66GigC1mp0skKiikqc6JYqwHbpXl0+tjj?=
 =?us-ascii?Q?33U5KBOnXEhejH2VeO6oNKEGu3BbypmPZsYfbkQhthXKil/R1aHKvb23fsUq?=
 =?us-ascii?Q?LYneg/rnOKp/om8wrACVAwovN1I2/5CssElL85OCgbCp58qhyMgC/SM/wjrg?=
 =?us-ascii?Q?3BArxzdORbGQnl8KxfXLBHDqMSM9CZknWnDSnp8D6yrje20tDCKpbefWwReJ?=
 =?us-ascii?Q?ewb3gQ5nc5Lz4LaZhlZ3wGXKqn/5XOkX0oMfQJT37iP8cMIYNeeRiUK3Uhfs?=
 =?us-ascii?Q?el271Z44+whN78x623wXjujq5upKpbBzIqpGyjse6jf4M57QSi6aJnZ5vtoa?=
 =?us-ascii?Q?bZ48DYwKFUXLA81OZtYMB8NlN+ep8ON9SfzwDGI9jJe8l+/wSvdd8pL2bHJ7?=
 =?us-ascii?Q?PisQy8//SFpzYxN2jKBl0GwIT4P1vbmg7+VlRvASL72drzTYC2HLonzNSIOn?=
 =?us-ascii?Q?/aCfx3OdlhPPowWMGiZ+CfRfach2zZ0J4IWY2kLPPmcuBBcloS33nNga0rm2?=
 =?us-ascii?Q?s2KG4KrTy1Nn3aXBjY2UDU7KaLfBtPbgmIBBZqWI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ece3239-a17c-4cc7-6634-08dba3f8ab98
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:43.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E63CjxhqA0km6CBQtVd5ENlexCsuEHgcwRzFDqFPloPRZXgCdJ+dJ8qQHvlKC3Cl
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Also reverts commit 584d334b1393 ("iommu/ipmmu-vmsa: Remove
ipmmu_utlb_disable()")

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/ipmmu-vmsa.c | 43 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 65ff69477c43e4..04830d3931d239 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -295,6 +295,18 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
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
@@ -627,6 +639,36 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
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
@@ -849,6 +891,7 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 }
 
 static const struct iommu_ops ipmmu_ops = {
+	.identity_domain = &ipmmu_iommu_identity_domain,
 	.domain_alloc = ipmmu_domain_alloc,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
-- 
2.41.0

