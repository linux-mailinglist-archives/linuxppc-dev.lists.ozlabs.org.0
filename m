Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16BF72A41B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:09:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdByB6Hx2z3fvy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:09:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z0W4mTbv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::610; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z0W4mTbv;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfz6R8rz3f8h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwNZqiyx3+AACSL8goNHnRHGcCmq+AuTGUw+c/xwtYYzNmIUmd/3Zfv9vxj1ZBJYAiT46s1bho1OqyDm2XzbecGqAqAM7EUcVTjrbnz1I2AZvgn/qnFnLJ6SzYg4ajXqoGM9BaDH6vg60IOH5w9dy3FvckTETZiU8QRlYbRRXFx/FPwHLym5oDPlpS1/MYzr55M+bIWSSJ5asM9zKeAeFvz2022qSVtR8/2nnmVEG8VIyQKTTFUCMhrHV6Flhq+n+GsTz6mkGCRic9xGJWeSQzVnd3A2iJx2ZmDNUCw++9IYEU63/sK4aW/dLnBAUUuika8bwlQ1t0zK0+xCCOCuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMhb/bqTdUCpbXJCspFn2zl/ilrxq2bDon6W8QDV/+g=;
 b=W2ickmq9vMkgQBN/OeCZj4vUhQtSIpgLo9FvyQ4PlwL0toaxt8+l1eiRFxRBSzPY9HcYtcj22ntmaU12stzSFw02vbBlC6tXr22AZr2iQgylvzg0y39R9HZjgAEHQ1Lv86qoFWzZZBSQBP/ka6gQGQhM7re6w7LHpZlXRgBIrMTjyD8tRaVqU5MHGjq+QyYD/XEjVSe3S7FBXXMp1wKjb6r57u2kBEaMsEaspZJWx5MIIyULhyPJs9OczsxykESe6WzKObo/yUKL6mCJ01sKchcDMkm29/dM2clE5KKVeK37IgHh9mehP9lvNonz20SfdZnUfh0C3HnM0LP1KYHk3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMhb/bqTdUCpbXJCspFn2zl/ilrxq2bDon6W8QDV/+g=;
 b=Z0W4mTbvbjt3geEbmJ/kJVf1mShzLNatf4SrLHFSpIpswgRd/0PE1QIZurA7/vmg1eXZXwuU6tSx24CDxPpsRGY7O8Xr9j6Qu7lJhTY66YJpMYlICz/s8reX7GFpz2It+GB8NSvnE7AiuShxT+mpllvBQ37dxWluqPAChtwsqCAJ0HtUjnWZjncguc8RQsUeE1SIaXWAdXU/RoQfgQSG45npMvnn5OnXkRBSSWbE58JsOWR4iSWZph+U+cx1KRXvOfNlawPNXrY6tlzdbQvuNU5lHi6cRK6++hGH5BeAXVTounKY81fRsFcwHT5AnGjcHraS9FCqMXtrEHHmBautOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:22 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:22 +0000
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
Subject: [PATCH v3 18/25] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Fri,  9 Jun 2023 16:56:06 -0300
Message-Id: <18-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a133a7-08b3-400d-8ee8-08db6923983a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+YZY3m5Dwfq4XrUFQIq9fV1kecI3ZJ0blf/YsGEvsmTXzGXKQ2wyFsVSQsxwIwj4FiGJ3ms0L2cDOtNUOhJf/Zq8olYDHN1qilKvZmN9yzdUB11cH7dlUUogp3GO7PPOhzWGIbvmFCyHUAMxtgGN7SiXdKsljC6UdX+2uIP49ebHFIB/k9LSFOR7g29havfPud5hiK3zGppZPgd/WkGFIOg+jIaeB1mc9k2y5AV3bdIq+VOwBE4xFLpZzuWONmDdjItVu930iA4AHwXAyWq7shQka/Jn4laJ/+FBnE16OCv5VP5vfFxXFAbH0WCDxlrDwGlptvFrwaOl2ENWY7f20OAjxF3XatVdMqoKB/c3CzLZYvuJEkan1TFF9BpS4vUHAu0lPTaEMqLFAKSh78QiTtJccI1s+SIm5iQjhEaGNCJ/WYyh15qMRyMBNqhA3/rToWxkGf59BuR5W6fYJr6s4VfYCohU2YVjTxa6svv5pAlok9ADfc9C7aBLFJ1tS3eONZCo9n4ROb+PZZciBH2xJAREAMYJqfIWC2AHLTdiffD+evyEKuMNz1qWQJoxwWZ9JrbET0MwfIfe5eaba853KZPkZ52i3CwxXvyn0kVmR4Q=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?SexksoK0BptygzWxHp9VJ2ULjO4P8A/pSp3hDh9fMkhsdlbSPbN9atvLgStL?=
 =?us-ascii?Q?gdQM0RoeKLsSd3+klCQn925TC2Y0AknAyUPPqUUfQQIiy9JeY5CI2LXkKzyX?=
 =?us-ascii?Q?DzSmoaSXrYOU8sFwPJNVdTgoHzoDlQ6f9pNRdzZxRKkUXESfmMQvNZdwKdXS?=
 =?us-ascii?Q?5Ky4fuoLjIjDxmDz2KYBx7cTLtJ+FeT9JDYUAOTmu6gIhf5n2xFmax+n/dgm?=
 =?us-ascii?Q?jAFVBBZPKayR37bWJV6fQWfyPPA/+C6F8wHr3HHihv3p0zuh+hX7JgmsWzzE?=
 =?us-ascii?Q?QrhNyj3L/ckcIu7jD6ZXSh1FlVVcttYT2vA86p2tetwxjWGR/C2+788o/yUk?=
 =?us-ascii?Q?m5x7PBR3Q1qj2NchhNX6VBp0leqPNWGkm4Qz91rHEeZ/bGy6vl8VdnfKjzJ0?=
 =?us-ascii?Q?iaC3oueevKa+3CnE94/OEr+2O3nZ9Mc4eKQyvcaUewGFm9suBwyv7PUnbsNT?=
 =?us-ascii?Q?IAJt2/mTKemsGmgZlE13fjqn7bsWQmAbKKD5j96zE2g/V4/WOQbU6M+3oSee?=
 =?us-ascii?Q?rOVp5mQLSgJFRqVc5sbL3kYZHX2nYOxwPB0Eah2jT95OLOF4uOKfrXvsnegX?=
 =?us-ascii?Q?C61b/azoFTmw7SJ4N6cuQnCM1xRz8RB6r0Bu+82iT2SqIDJdxVgVoaZtF2EA?=
 =?us-ascii?Q?NV9EQGubpflWt4EMpKYfNkSX2gw7PySXysP98lG7vEINmtvOXwR8PJo5WCgG?=
 =?us-ascii?Q?QmCVyJ62mETNs7jZkNByCxQwuZE2vwmcGHvwJwVlAdKW96x/J6IYQpjGvaED?=
 =?us-ascii?Q?AmWTD+PkcfXNysYqB5JJEH9sIKQLETz5zMOYLriARr1WXOizm5qvx8ym/DG9?=
 =?us-ascii?Q?DYkXDD714jR/mq/KprR89yOq6i0Slrfjz7kutwrl0wH8vz+CX62Ty3lKrQXq?=
 =?us-ascii?Q?+H2hauls+5Nuqvm/qbdnfMJL/CCURc73Nr3gSV2IThEbbCoCkG297dIUvXdb?=
 =?us-ascii?Q?UsjP8uU7sG+ZGfvvYdJC03Pl+4kk07++J7N3QBcnCs791FlN0tMhOnjRLI3K?=
 =?us-ascii?Q?DkdXRPvT9Q8L2bIMDwSwjUXstReSuvJFViXPEMcb+LPHgQj/Z1opP+T9S3wP?=
 =?us-ascii?Q?Zb55yaALeQGCFAYvvHSEBlVGNPt2xCl/DE/VHIhhgOjdNnX5KaShpDRoTZiQ?=
 =?us-ascii?Q?TGSLRrIiwgtpngukOPCtybrMNoQhWQIL1FJU+4tKUxodGhqlgGuQqb46Ej1Y?=
 =?us-ascii?Q?x03YqEcfxsdV55RmHCXdyJCsVTkCTH5V0BoYw/uVe1mB4CtLDX6AOMzA9nN2?=
 =?us-ascii?Q?Kber6EX7vJ962cKFGjUkZUUJXaMWXY6cbJxn5UPDKBc31GWW+EroEKQG6CMX?=
 =?us-ascii?Q?9vep2fbPVjcS0f/NEHnkwHrDjChlXrCxEtzKX7CVWK5ZaKxUvqnAM2A6vQ0w?=
 =?us-ascii?Q?Md0oDxmJtR0oDlU5COahJ6ot74zyguST0+GMPBNrcBmcJdLWTlBn6BBUCU2x?=
 =?us-ascii?Q?ubWDzrKwX1KVd8PWH5d60jukS+N+praUU/uNaxfPp3n+lmBTDNGw4WOkrLAj?=
 =?us-ascii?Q?eVkI67fhcGEszCqJlvJLAPPwBc8n+52nvul+bJolRdskz/7p9zMKVJsZ+yLP?=
 =?us-ascii?Q?7Rk/gEY4ec0nnQmQt1P/oqbAN9L+MeYne6VQbJ0/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a133a7-08b3-400d-8ee8-08db6923983a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:20.3274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrVHvI8lowtzjvgkzi23QK67hwRNz1upJSCM3Lxk1WVrOoweg1fRt0V2nI4D0FXv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5264
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

