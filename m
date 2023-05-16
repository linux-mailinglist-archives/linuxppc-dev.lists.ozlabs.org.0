Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9BD704217
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:11:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxVm33tPz3fn2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:11:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M4mA5bXE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M4mA5bXE;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGy5B69z3chm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkdWSzvBj44M4287GCtGMaLlHOGifCPt8knvrnHgNrbfDFfPvZ8yXBejUWcRqClqXq7MAWGTXgyIvoBNuG4MNqgKJojaVsvEdj1STAPUHeg1h0d2UT2vhV/t+l7mI1jk1CHTAXtwFiii8B9oWClqYA6xuucxRtYp/PlKrJcBvAs5xU38sTUq+3HfP//FV79/jEtgb+F4nNiFcS3ymt+XdANyQvetmEuiHEggzAAqcb0LZY76oyPpKLIgeAaLrfVJqCb7d9slY7AGVg2ZPAAwS6lzMrSVbWd9fVhPejojzc87ic3lzBx9Pttz9IgWOmaNNvQasZ2wNfMGhX2eE0lKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMhb/bqTdUCpbXJCspFn2zl/ilrxq2bDon6W8QDV/+g=;
 b=cFOEGWsAQT5AaDa2VJQMVOsnw9mvIGECfe8qxNf88bh8+0ft3+FQ4eZxE2RLciWCHSUMhiVORVqltBtEX4o90bAENWOIG4aI0jn1V2XkDXBo05t68p+Xi4qZBXDM+/m/1lYmb0w7LhJu/FrsAl1Zhxqiq+ir9Po4gPXNpLaJdXelevwQZSowofDYfKE8QOjTpNlzord8CCtSV17KssfQqG8Wka6HlXtrByBg8EczltREqZygIbQkLfW4aIIYYe5xIk8/uUfAgclHCbA38nLlikbvJUuarNemH81j3Vb26fqojz/+x8sG85ZVbsVw3MfdHu6k3t7SQV33Q3wzzmneUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMhb/bqTdUCpbXJCspFn2zl/ilrxq2bDon6W8QDV/+g=;
 b=M4mA5bXEGWlaZwhG6WmH/odk+ABfd2iI9iDJCRpOcYUG+7f94BhMsSVRc8mateBOsmDiIM5ZfoBEVfv92i3QQLXd2QsezhA+qqdWHForHVWudlaXUhywN/T8Xp+u8Ofee1SChj96NRW/2y9nIOpfxgxkaQvN29/CdHPj5xP/semTXwg/oyp7YymwzF0dISQJWHQ+P/VWjfEyBG7l0DvWNbiDxKzx5OReqVGhxiNwuIelJPSmcMvkdinOe2oqIL0KdcM5KolEaTVZm3a4qnv752lrhGKZRydNPRyB8zCprYDPjzVlvjNBkLNzjkkHN8TGiZnbpJVgYCDADy9QjNL6MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:08 +0000
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
Subject: [PATCH v2 18/25] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Mon, 15 May 2023 21:00:51 -0300
Message-Id: <18-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:208:239::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 463e09ec-cd71-4246-abe4-08db55a0a2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rxI1C4LKN5Nag/o2eX+5nmQ0lUokEe07jVXKhvR3p49N+ifc0pg6f8j12bDebHZHtTWOeMsm8cFmJTrNAX7EesbvcaSqBbZyQBTrnLOJ8SrKs4LSO+dtaluzr+G8uUq3epK3f5gUF0dZdBfo40lQKK2J9TsiqMvV2J1ED7CES9cp0DInMhFdtayc/iFZ0U9XGVHZQnQ8AYRROm6SLFcIekEfLwSEN0pIHhYrZUTfExiaOM5RfVAbh0BfPrmYf2x4wApA+2JqsibYVC5m1kLKPCm+uNXpr1WQJeNEj9kFY5MklVa9fBieGYhJa0k/jqixf3S4wG2YoIUyJxngY40xTSYRbfDBfPLQaXUEZr/YkH5pPEaOiPAQleiOzoBP62EIxl9dmki2Oy0jgdbhyiOFbpkhustFcPsNYM/AJy2cRD6RIPgpuu+HHMlp7c8JdglBcq+qwzhCI3B7xJDlGGLddX34bCctZsau8XWVUc4AXyWN9HNHuOdpbl5CNdMBx3h+IAAx9nXUPWz0557cXbsOcP3jGZ7pgi9pm4kZPh//0Krfb2F2sgAmx6ojGMe6jkqsPuYNkrrOOFrB/lvz8U2IhtxZ+99+F4g2J9V0kILJpKE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?+BfdkRey9v1M1I1iYSiqYShtDvVb6yaHfF5kP2O0961DNjhbNRuZZhr1+ZCC?=
 =?us-ascii?Q?J2vQVSmSD0++yQ30zPln5DB0VuiXp+zZqfEXyMNdldUO7SimkKU5jq+OYvbP?=
 =?us-ascii?Q?Au5bETTILQMxSjcrd5xbbl52v7muHbB8lcA6mwd+d4+WEx2AAVkmxAZkkQYN?=
 =?us-ascii?Q?aWoy9eN3o8EWRizmPmqbIGq2xBszC7d8Qkjk9bm+tPcrOVhAsaDANcKr2dZl?=
 =?us-ascii?Q?Q9iI2Fi+nuB2WjM3BUNel5H4mTIb+d5ewJ0LtFF39qWP/1AB6/JVOS6CoIjR?=
 =?us-ascii?Q?Exws8KCVfQzND57Pqupzdz/PtWXh2kAoGNxAMKN9//qyp3LYexd6A4V12vuX?=
 =?us-ascii?Q?YfgpJEmsyQ/aJazrVEi0zVumipY7wjsKEtf3j7hlEbq+6yfbKYihElsmS3uz?=
 =?us-ascii?Q?3u1aY6RlrMWqF4LNg+Fke82GdT7GAFtsygrsUCJOJy8abYzTTjowoEL7TGkd?=
 =?us-ascii?Q?8DPCIMaaQ8ANHdF/X9ZGRxbMGsu0B5lG4r9q0crndyci0kVWQR/CRPbrop9a?=
 =?us-ascii?Q?wQ6h9x61cx/Hp1QNV6qsZTA1JQqqgKjDDMI3Gnqxe0V/7yVgwQuUCksLk08h?=
 =?us-ascii?Q?iJcMYbGtYL+XaezvVaaI0418jwVZOQbyEE9ar94MCSZFbsnnmtL7e+57uSVf?=
 =?us-ascii?Q?4cxkAqrPPjMLyuET+ueSX8KDEbSXuLRf+EuFO2ZqbcBlz25v3Ujz05GE5NbS?=
 =?us-ascii?Q?/RwZPqaqfZ0Z89v1T/Nuz+9GZOrMPd3hRtXVINGWPS/LpCMOZv0GBond/Pii?=
 =?us-ascii?Q?tP9pxz09OSVGPNThNZ0lnXoSqh7k1GeLa4eLeTDnqKLpIV2/RQNN1RcNoR1B?=
 =?us-ascii?Q?ntjmOPBkW/lIeWIvxkIXfO2pkSKWobg9zTZoMSAkLr+safNLjoVvR2sUA3Ni?=
 =?us-ascii?Q?wgBsq99SSOBbuyw3h3Tbx1p4x+cT97O7bk5sMjNrgCgJhJzRws3uV8tPRG3o?=
 =?us-ascii?Q?3oLmtc+udGd22zRYd2BgLxq9X5x0iCYVI0PT4V2BehKYrtj/PV9HCLI6JA4L?=
 =?us-ascii?Q?b9kn+TiKKg78OuNKJ0seZqYGG5f17LIKNAROE15ImeiX528Gz6DKygyk+fTw?=
 =?us-ascii?Q?akcezuhKJyPPIOb6TyuwQosegR9tjLbUzAJjJnslGQHcTgeZ8zKbBADd3+oy?=
 =?us-ascii?Q?WYXT2ZWU2lCeFEbJq8V8esLosX2k2RwgHU6pl53AtuZ2Zt5MfymMoA4lOMYA?=
 =?us-ascii?Q?+PoKb5etdPUG7c1V3YHpPiOCD8ZzLteYYQc24PnHKoMFr1Mz9PqzZng1oTNv?=
 =?us-ascii?Q?1pEDaRZbLuErpM90XF+IfnAXg66lU1/VqUqg5g4z401f2FLFkO1LtRs8Qb/7?=
 =?us-ascii?Q?J6UdUbZlvuhvVAhQniUWTCO95NqjsPakoHBHGr89EPqWF2U/H5yTgBBA/w7i?=
 =?us-ascii?Q?98aRxaQRBwAe461a6ORxL7ObMgCXa3wDZvIwUmzbvb8Pz4SsV3sB9Hca/sNH?=
 =?us-ascii?Q?lmO7VAqrAqpkyXrJ1wl5+TEWVt9Pw4NSgHuuxfGmgb4CiXueNcPuF2KOirL+?=
 =?us-ascii?Q?9OONq7Zerc6T6GOY7JQyrsCxRN26IsDHP4Hf9h+GRparv+B94QIDcWPaacDL?=
 =?us-ascii?Q?8s+1vv4OAY2TykldZyvucNaNj4MOlOFU66iHpJ6e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463e09ec-cd71-4246-abe4-08db55a0a2dd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:02.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XllhvPrrulrEnSmwHE/eIC2Qy6uqnpa/5w41skUZ1R68ERbIS44c7Nq0+pWuUCAS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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

