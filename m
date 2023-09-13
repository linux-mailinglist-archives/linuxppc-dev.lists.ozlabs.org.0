Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C54079EA57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:01:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nzdXGt5B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm2Dn1LMkz3gvf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:01:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nzdXGt5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sH63jCz3c1Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLxnavlV5bxb7vUArqfyM5S+JzkLuQqgkQo20B2pTqDwTbqBAEis0nOvCxKdJ7HgzBVAZ9pFlJvwRjyEVNobn1CeVM+7c6fZb75aThuq158HgCS78g7P16C3aaIsKyxSrBm/B39bqcbITFc+FlEo3xjwvhRUTmTz9CiQ8odX26jJK9Y5KY7TD5TbJEY3S2JJDY76l0WhCEnyqxdhPi13TOF975lrI6fwpYs0VJJW1yTbgSveFBLJhbeHunumdXUGf9Q/JiljjeCeAY6QVk/qyjXn/LiRoAtTFLLEYJRWYJjvT+vPKcwjZJ5ASYRNiI9OcTKTa9eFDvb1miiLgPvbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyBZs19eo0b293YxJzU3W9NoQ5cfh4N5lonYgZF4pnQ=;
 b=UQ8Cp4cSOfrTqlWL3PXUh4KjIi95D7GDisXCBLCLCCzrNhrJPtWLjf15SK4XeDIvhg2YBgdCPJ5wAfncOI43PMfmB7ssCCgfG2Z5ipK1xWn0Pz0G+/h4JYZEoJ1BbtYgYXY6ZfbDHjLBC5ZWxd2sttSK1dy7rIVSnW3d7GHr06q5pOtehgo8+bsnCnPmslf32y+pj/VrAR6ZoaZ4XIYZC5gIB1lRisBHkf9Nrd5ieh3+vXwCg6IGYCXgF6EbV06l9QoIKPqIezEUc6KnM3rsCixlI/STfT9VsRA/8nLa1gJDqatQZRyRR4Noh0DHQF3u8SYOaLqQeUqt2HPXEY0Gqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyBZs19eo0b293YxJzU3W9NoQ5cfh4N5lonYgZF4pnQ=;
 b=nzdXGt5B4Qm0FDfVwJsBHZFunftLgFLayxEJ+r+77Rf18rXhjK8uzU7Kjy5wlG+LqV079EYeR2LvstqZQuOiJYnIERorLb51LU6g3ZMIwppSOhtwocgKuoQW9K8mWgVnITXlUP8zWTI74eH+NF2bNxo9paITbcG5vV61oYsPbfaJPAqt2EqHUQHCnmEbdSKjxA/KU2UXFf+EKNe7T2IZqt4FQrk/PNPfLMpP5Mo5SpOaUZpzWP8pKkdJuXW0t9f8lNPTcn0+0L/0vb+SqhQxUIqMW8WhG5hWFNP2G6C3LHuojpZtdeaL9IknVw3P5+P474eGb4DbT0HyMffjSSNlew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:14 +0000
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
Subject: [PATCH v8 17/24] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed, 13 Sep 2023 10:43:50 -0300
Message-ID: <17-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: c54f2fc9-c944-4eef-e6d0-08dbb45f8457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BOkR9XcaqzD9LcBss2JKy5ye0QqUrI+v1hvYIvp/V9CwG333eegzOpY2dO50Tj7d5izmC8uKywgH6JNM5b5n9ztva3Z/uHJPRyM4ytCWUGRgJ/I927+p2vMnJiTtlrwj8XdaVRVPvre9AiybQyYI+kxmR9QQ39xjaG9ybJfGuCAAQMNwH7RO9f9PorSAm/vpO6I2QHcHjMXccB3+rfwvNjiy6W6y7fFqneUz0i1b8D23DjA7f9xdWAR/2rq/KB6l3VHcQcbW19oqhxdM/16q9lvuv/E5UgGFpLNA8uAaAPs9uesi0C/bB0cuJywt9eFxK3yAq/A85IfZ2jUyEWBtFdcHEnLJID9zpT0f1plp3VRYwqS8nnmJwUy+KZDD7+rvJcCcClGuXyUy4mV0d34osFe5Qc3fHj2KY9BMFzhGbNlYKYb+AvK7OyFPi2gKsDIzqnrZZlKZr4ZXa5hKlh3/wEx2wPOqu06YzKunbUUWKPRQCJlTotrtJZgD/kGo8qVTDCmPFSPiabUUWsWopbpThKSgxIOXWJISTxiZRwnl29mCYpFqohGUSzEcY+d1Uo0hoXQmxaPtPtr6qSIkQDVF/2x/SvyITTNz0XaT1GLpOQw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YebB62na13L8rYKGVWXCeFt7rZeq8hOUJEmHECC6Y9fDES4hvl31AVdxBg20?=
 =?us-ascii?Q?7cGKrO8q9atCTrlXQvDC58WBcnyD7RcFiFuKcjExHXzNyJlQMmGUhjAdkVr/?=
 =?us-ascii?Q?J7NWWt/bDhQFHG4JiwEK3LjUq5a1+qAXZqQtaFCFBRk1ocGlsxb99J0vMqSh?=
 =?us-ascii?Q?M8PT60M8lBS/I4SsYdYEVZf/nt21Q7SOIbIdF5YAYNY8CWRHBmIhLvYGq/j7?=
 =?us-ascii?Q?ySRmuyfGeWZIwOR9qqZ4v2q7qWfVz9rPrOvIKoBPEHsnoyS2/LiDmpKk5LsC?=
 =?us-ascii?Q?JYgMayQ4MoKhxUkpRmQtU8RCARFBRWyX75xtK8oyL8D3GbkfqMvUs2IGhZ/r?=
 =?us-ascii?Q?dynLVx1ySng3X0tcVaxdIMMk5vAIKnoMQVqvOiXexwSLEB1cdcWl/4mvAk4C?=
 =?us-ascii?Q?UGEo+/+oSDGeewkrceyTAjSX88vY5wmoHZ/bPeD7wFSeAAro23in+D19dR5g?=
 =?us-ascii?Q?6Qk5DMqYI6qJaGwm/InaI3e+1zSxuCNGNFvP6bWE43XuPsPjaX2TyuhUcfFf?=
 =?us-ascii?Q?jz/CkSQZZh0jVhTPck4xPf4h/JXkgArWifakZeze+Oa4XM3b4OnYmVqFmCTM?=
 =?us-ascii?Q?QbiZS1xGClCLNuT2b2DYl/nGDRTM+aUmF+SRSKfTsiOg+UGzz97dieCF77rt?=
 =?us-ascii?Q?Om9I1bh3BZKFjme0BMcRT3eePsSlGcZUyD+nPuofRQfm0NdY6rkcl7luuNHv?=
 =?us-ascii?Q?SuHHWfNuv/nburQRb3skYLe/jUGt2XMn7vYVXYyK+nUnT1wjwdVGHukL8XPQ?=
 =?us-ascii?Q?Vv1/22oqSFpmTMM4pKHF9lcaBmiTLVLvjsYf7XAE2FGtgwZm3m9PRGfUIHqS?=
 =?us-ascii?Q?mMEFw44Pxu8gs8t+w5FaHrfaF/jctMVzpYW6jeIUHfHVTEZ000fYdnvOsPJp?=
 =?us-ascii?Q?meSMBDre7qdBtjCgKkWgvPIus7MzIes+0OTjsIeUGEs4dG3Tbf4WTqBZEUUl?=
 =?us-ascii?Q?+e/69wHFT+wkZuRIn9m7zm+dAROnSXo3nweYE2ENEI6to9/bFx6ODVkdwG6V?=
 =?us-ascii?Q?5HlgxaOun0J3Zt2GikceGHn3H9EOHlZHpFP5n0NuTdSDR50gIhzIHu+jTUzc?=
 =?us-ascii?Q?MSmEEkvqyfhGq0Ri3TX7T/7cH09Wq5oWngGRD2UBB3i4IN3mN6F16l/fazAK?=
 =?us-ascii?Q?sjFjy1OFVtbnPuxqvdYyua28Jqzq2iovC9S7IpxlHZDiL5XOdjWRRCshkOmS?=
 =?us-ascii?Q?ocWbHmFh4uyiqRvJ7X4nGGM17qdb/qCVVn23YnT4ouhchBcWUq4rPOSz9OAJ?=
 =?us-ascii?Q?z3+QwxtubblrDXA5n1ABoBTXBMtvC/r5CVtAAtw721QgCf1ZAFBeCFYb4HCn?=
 =?us-ascii?Q?mhCxksGFfnTlRExxrFNpJOgxOf5Y2bLPPWzw39zEM++H7v9lfEBSgwXMJFm7?=
 =?us-ascii?Q?5c+XC1MMSgqFiFMvSIzQH6LCUB+8gFVWxEg7x9bt5heqNFqAJGnkMiy3xxNw?=
 =?us-ascii?Q?mrR+v8PYXYgjkB3z+Pqs/Ok3ll8IYhHd5rQe4xfJFuLJiizgBKDS3uF8toFs?=
 =?us-ascii?Q?2tZrWmPtxUru3xpq7jI6ZzJb86EaJe05BO4GpXzTQTFia2/JLF0iBlGl1CL9?=
 =?us-ascii?Q?ns1uzEHk6nogCI/9ijUYqIY0WKUYfK5NvA98kldf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54f2fc9-c944-4eef-e6d0-08dbb45f8457
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:13.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2scoyhghANimNrzCG2HmbIZZO7VyGw3CUkFF3l45r3wIS6LPz05aqZ6nGr+sOE9i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Also reverts commit 584d334b1393 ("iommu/ipmmu-vmsa: Remove
ipmmu_utlb_disable()")

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
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
2.42.0

