Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E79DD785DE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:52:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s4Dt09if;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC1V5dwPz3dS6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:52:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s4Dt09if;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwh6Khwz3bZM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5uIAJmPEFlWO8hDj2gBBW4TyGETQhHE8mu52gBstUm9x6+6PEvgo2kd1sq+XyiWEbc8efuiFQhR9qF68eeFBBTTS/jv/1LAwnr9HyumurDBGXjsbxruwInawhs713HkkNPUNyHCbs4txN7yiqZmrLC+drEzFrHkajGIxAF1QLSU94RlS03Cn7DR6Pda6w2iQ9ZSagUClfSaj6uAiGTlkIZOzOY0Ab/pJbkMrgyyzHum9lru9hzZlq0XnLybATcbmIf3AKwuJvo1ScS4gvJdGlFyaCeDTUIO+4Tyg/Xoav7QuclkQA7B27IxwMo3C3sVoMsWCcRPlwl2n8RNVwaomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6M9n/VjC1eTk+y9VT9i+RBTlxuxYFMfXiM2LaimdaA=;
 b=WNswjAkaV7uNomhLEwT6sE/4WSbG12QyCcKWEd5JBLOJ6mlSvq2ZGKQvbwJC7ZM88NruFiLhf+1m+VbrFMkQu3T4/V+b43WeU6ZfvAcRh59OlnWfmr39AftSkLHgXoywvpYBu7At3Fn7aqpmI/unL3aBJ+PcyLNrCYpRrz+wUiinb+EPvsRY8F8JjdyxQX94Mp2aCPIlqOU3TUU3sB/d6UPRkT7sJKBcHzTvmhfpAXB9m59r9HzhaXJ7ScrapVhFxgC4YBm/PAL5aYywv6e632fGiJAyhVslYsPX6VxmJG2vCLPtOPkDMk8JP0sjSDPEDjWkN9sqG+4T0ndG3CbaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6M9n/VjC1eTk+y9VT9i+RBTlxuxYFMfXiM2LaimdaA=;
 b=s4Dt09ifkGr9NO1YkVzKrevMSCp0frrVDKHDBA48e7C0o8JgrGCV+/mosPZgBI2hM4E/tzY15TSZmErsNkiRrJ3xcn83UgspIec/jM6+wGnWtPc0g3AR26C6cvbo1cFyK5lUisjkj5024P1pnYlZgZgTT83TerqsMaNQAaDKrdgBph15ztnk2z5L7knCZ84+esJFg+01XJP7jwVqOQqoPVGaBsiGpNtkMS1OVMcJipbQIjMOV4ph/CaDlk7bBXyR3vj5q2yag3stAh1p/886lZ+Z4CzzvygGK3UbYWWthVc6+zjEj3vbLca90jZ1eo46F4OZLmh1YpwJa3u2qDmR8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:47 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:46 +0000
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
Subject: [PATCH v7 05/24] iommu/fsl_pamu: Implement a PLATFORM domain
Date: Wed, 23 Aug 2023 13:47:19 -0300
Message-ID: <5-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:610:11a::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 95187253-e506-46dc-80e5-08dba3f8ab4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	j/lmfd0Wy6FDMKu37PmaIwaphdEfiLFlUsoFoFcUiZBo8PKJVsjCMBZpg37Q0/k/hGlMRSzYcEcEUpVMhpsqO9fWgZDxhuJIdhGSxlgJEY38rUE6Ev3bTpKmW5SRd+G19TEokEb+pzvGy2guAkwQjkk1LeLA8KZwShGkwZCUh5GTGyuvOCdcD2IO1PnW0glc8dN2ZTYog1TUvPJOvsVOWUa4KZyIuSRScANqYGjxeNPgymmXEskzffD0nEBf1kZOTOlHPjXyZlpjPm142QGcUn20WSnnrYRQ8PjPcFe5UPiAWsM8pro9V1v0h/oOJnvTRxRBf+v7uIZ+q3ylZcr0hytnsb2AEGVks40U52oy3G+qROLupmjgqJYZV6liJecqArjIl2qdGxj4NVzHZpW+lsd2EQblFGOQo+aU7Nn79PX6EOmBmr0K01nfq6o2O/iJP54Wl5xt85sUjxC8etBInFefG1ekfb2eyFKQ0GwYxvMRkxYldcs3Ch2p9yJ83u5Ecd6LIAb845J2L+BdfJBi+d/6EgCa34/1U5V3hMIc/e7UdNZFm61+QOVSS7BeFa1AD6P1t+nRhNmVZTnFyIbABtEwMDgsvBBm2EfF4gcoLI07OZ0Vj5A2qb1FnnKD2m0u
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?s/tFuWUF70RgeCfabqkq/n7tt2KOCASJl1KABd+fmUDAdT6Ty2vipmFcyO7a?=
 =?us-ascii?Q?VpxAwa3a5i86G84fGvPJHPVf+W0UJI4DQKloGcMuyYZQ/Tn/NoiAcGAElOl+?=
 =?us-ascii?Q?RnngKEGCwhioKckrfrgwutVjdi5/u9ghzW750twGsLPGpzrkNgGrM7Z2ekVG?=
 =?us-ascii?Q?xy4XFCzpjMUctHGsNuGWe0TtJBR8L2ArjrMo3oWoWwkdTPcuvo19hebIBwV/?=
 =?us-ascii?Q?m83PiYA28vhtw0L0IEP0/T/6E3hO+Cu7JB4aVjTqA7OfvQmARmVyZj+DBAHs?=
 =?us-ascii?Q?uXfqIXly4nhsUSqd+SxEU+L/npGMsRU/IX6K6S13Fk45GjfboSbSziWcXF7P?=
 =?us-ascii?Q?qynbwKLY8+Hnz9hrGO5ah9IHyv52yFW0b6BczB//meXwCeRVnYghRGLCw6Wa?=
 =?us-ascii?Q?VV8saS1CAMDDz8NXBSPcU7yULq3Am6Lmg90e/IazKc+f4Os7w1TnXn13Kr02?=
 =?us-ascii?Q?78k07UiuVP6q8oB0QfEPwFrVyWfuwglyFbVrEhcXNHsdtxcVNSchav0/w3/5?=
 =?us-ascii?Q?AramKfhcAsTtVkQtYs+JDMV+vimz03cWfj+UT+k/r0gx6g9ehHJYSCsejJ6K?=
 =?us-ascii?Q?NRvymaEQ8K/wfwFGo7V7j4yPG01UUQO0eMFzOqVqGsCpqJelBLwSkHgsgM4h?=
 =?us-ascii?Q?FqIt3d4/O2vXIA/CbaqJRvh10IuqPjIOcaQwHoLCAeGRVLgAMd61hbHMqIvJ?=
 =?us-ascii?Q?8G05u36RHAA9i3V84FH9S+UaWWCaDcM2PQNxs1ZgC6bLKcADDJVv1CgG16hq?=
 =?us-ascii?Q?z4WXnZ5oniJpCUbCQKaKgDeBRrYc09NEVNLwqtwAZi1eKj0sMr+ivubrz3KG?=
 =?us-ascii?Q?lFEYOC6eNBs+VbGpBz+sFdQ5X/FYiXA5HvgDpaDK0M2EslB4vmZNej84hNT4?=
 =?us-ascii?Q?8FcAxPfUA8VPsQlHeGOAWVBmfymB8dtKQVGOI2aLh2zqlhxpyquH1iakE2vv?=
 =?us-ascii?Q?e16yiWoc+f+TKm/jyiurcZSfdIHmcHVxXymJBp+xjLuZUhgWEQDOo8Ob30Gt?=
 =?us-ascii?Q?CZIA1fjk2h7VYK7ueiVcyOootAdBhXEnJnDaGNVYcpKHOJ1f5k/6ykiSy/bB?=
 =?us-ascii?Q?HNj7E5DsKTo6Du1uPLiqJHtY4tQH/8xKXc2EGrzMRO+xKZ6DHqmh9XjPCXed?=
 =?us-ascii?Q?RANnQ8y9kmfeY8Coj9MGQ6K+cT67TasblasPmcV8fQPVZWwvC/e8PM+lSpa9?=
 =?us-ascii?Q?ajnFTMyW6knsy0fJRPJIuCfaCTBT4NwOHl5cU4ssTSg/6AyaE3HIZlldUDjZ?=
 =?us-ascii?Q?Aidyz5e1Ofxo5BYhtFWFHV3zyMTBrPgcrGS12GE2oiZdzHBbn091v32fx5ll?=
 =?us-ascii?Q?8f4OUEWqm+XeatB23dTnfGygfrZvBuLKnc+PYIq7D0+9MUT/bzdq6Oa/AjIy?=
 =?us-ascii?Q?yIQdeMzQ79MUCIcaC3k3g277St7zNDinvgR5rPuLV8KbubLucX3WgxYbhQyB?=
 =?us-ascii?Q?NoMk5hOH+IQKHSnwgyWn4en14B+2YThMMQuFBRZslyg9/7en3NCNZYerVpCn?=
 =?us-ascii?Q?Nn7pUBLKAXtKKSfqnCu6iuB0eIwTN+h4xVakCnOuYvepka27FQ9TWrwNHwCB?=
 =?us-ascii?Q?ctx2fg11MOEAPn22/fGk+j+ULGRgnXZubxnzrhqz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95187253-e506-46dc-80e5-08dba3f8ab4e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:42.7931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7MrcuwEjDq+RDZtWmfgVqkqH1PDu6CQbDc93paJKYcctz7uUEnUvB3tPcV6W6M2
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

This driver is nonsensical. To not block migrating the core API away from
NULL default_domains give it a hacky of a PLATFORM domain that keeps it
working exactly as it always did.

Leave some comments around to warn away any future people looking at this.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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

