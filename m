Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E077339C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:23:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QRznYFwu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTbb5pBRz3bmZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QRznYFwu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::615; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8M44VQz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgOTRIFmaQWbuvdM+Yv2hcPi4DGkWUBqiQFysiw3G9FLN+4MuCWGhfJrANLpOgjlF/lHymaITwOfHL+SukChyYQyW8Bbyg1+7Ro/e75cXR57SQOkl0eZ//T1mbG45hG5ovn7H0T6EOwlzfwYNFZT9kPBCy5+dzhzp9k22FkHqStdKykuxMm6ApKjzgeaKY0yshvXpInnRXIFNt7qnVZeYGqcvqxvqHhxob4993r7tJuyG0tIcerWKCXN0eJBeB3a6/wxiV/z8UIRXT8H7caQ3hDUWQ1MsbCHP4tHcc67OWL1O5NjO1ndD/b0+BGqQmv1vrOBLceiTQoAS2X7HAes0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JplaZHxMiUJROKD+qTnd9x2wQ0YQIobZhUNJsZ+z69o=;
 b=TslVR7pJ2gqGuj8PMNq8nzTuWaEIG9qlmU60ON/1qQB+JnpzHjCDk/GEw7ll87IS2YXa3c/dt7sMWsNTcscYK2BlmdpOacR2cG5lD7oujC/pZ9mc0shxpZHuFJCiqOEovNfws5Wd7HUQCt2c6Uh2dJcKPbnZLXF6tnnE3sekZfDiwmnzR6F6ti29UAURwghdCk2c3S1puxoPc6CKZIUsMuirRhGrXEYQS/blDIZDWWmP3e0oOe/WrQeRfNnQOVNBmDh4CJUhK0RgzNTyEs8qSJV3tMxPqGYI4HJrNpBjuYIy4Idf9Ccz1vmxYWg5pxykL31+Z0Ujp0JXwwJt3M0Eog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JplaZHxMiUJROKD+qTnd9x2wQ0YQIobZhUNJsZ+z69o=;
 b=QRznYFwus6PCopc1qnLso6vsRVDhssJbrFoBW7BcqUCDCzuckUeiOB6L25c40gDQFpn0GfDsQ2WZnrvhh3MTPZgsqiKUvUQ8GO3mFfsXtMcasLobE005KyV5yzsRBl2SPpFIqLvy/ayaLRh/TwohOU8zJD7lsudaPMzMYVbipC2XetNPxThWe9+xD4O7vAQF7NHKuk2CkzKGnp6Ir6S+p33JKcnQJpKhrj2dQ4cOonbdNfvE+kNuWGdDisQJabj7QmiK9gKCzQoVdmL31+LLj3yRKiCCUtiA4Y/sUvcFCB7qyxYzr2svXF89scIRZVtCshdkscjr63bAMA73i6rVgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:02:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:02:59 +0000
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
Subject: [PATCH v4 17/25] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Fri, 16 Jun 2023 16:02:46 -0300
Message-Id: <17-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0054.namprd20.prod.outlook.com
 (2603:10b6:208:235::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f61003-6088-4c58-3c5f-08db6e9c4b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mbpUyd5bj5mRBJ1CWromeW25uppkt8W7LHUch1TCM9X1t7OBxf/qGQSpTBF+3OvPz6djlT390zKuMA0hlWOtgnLvXRM1jFYIaP5uVXZC1hIWrrweWcZYO2MFsenSl9gbkibExeSIsj7bji3OpKOHqWdwLzC/+6IZVMnnV18Tut4qUeAyhOZhVPY5IKGEVqACNN/VfHREQ3EuFI/8B788hd6FFfgQkKdNO8r7k2oQfcj2EWh+h1spUjZZRYZ7XIsQyXf4AINFADU9c5SfUMW25SsZ862EUhURSH6fbuig3ZxPYeoJVmvwaJx4X9d/WpfpmrdGNU5ZDrQK1fWCxg2TP4H0BGV959TabkOjVyt/jPLHzISPkz3z7afXnF4LDSYfkkcanoMV65xOv49p8KcHx6+fNGmA29qvum00CpdWw66LWfmedHMmzUgMAMmuBQwhL9OvYwoZl14dweRVyxIY4zDrTLLg3o0rumyl7eVeAiMkeI0knZYfQp4lT7R2WXPtQV+fpt1s1YhtuJMqHs21AW7ohnRVWp9q0IwQilcXZVfkr//fdsyGfTsezy2PrvWSkkdq5xOqrXEhi92SIIjXzj/Xpt6Z7XmmqR4EO48Aj8E=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?PKCEE4valAP33d4nw3GQMpAVppM2vKSKObW2xRijtBqlxijqMsndDNmdbPUd?=
 =?us-ascii?Q?lS22eNSXnq98RZEXPxzSAhxENlP6A2mhltrwxWRoEOcHEykB5j1m4rkEra/0?=
 =?us-ascii?Q?/iWOXatwnhc6v7XX17tIl2RVLgCTiUHg8QuhSQbZ6BePp6ha0l5eH/SBtAuO?=
 =?us-ascii?Q?OhqM+w1kc9MpegqTN2NlCrbwpDJvbcMwk1isLS2yJ2zVNfut/g/bSGzIIS78?=
 =?us-ascii?Q?USX71IcF0wS58KHUxkn5JQ0fii8Bmmh/SPVEBQwx5wfGrRtLRTiA6iJ68iDC?=
 =?us-ascii?Q?EgCF/MN0sh3xdPptj3CfDXaEYgeQnhkccP7Y/WzkAQEkQV8acoea1p5bL+Sm?=
 =?us-ascii?Q?sfMjzETsE8nYcOEvgdKtK3820vYNgi9nPq+A7vpd2LGp+E/ErUIsGFlMirW5?=
 =?us-ascii?Q?3yAMr5EcKCn4TfW600oc4sm0KLSteclZl1qDkZ7syDywKbr48cQ3C5815IBF?=
 =?us-ascii?Q?FFaYwUVyalYjdfBFFDklOEwRLVLByqSxgDmpfJt6fbjhQ/IngAVYjonJG1xV?=
 =?us-ascii?Q?vc0/4YWAeDfN5u9fdffoL6FpiR4p3sbWERksqLNXJp8dFjneVgFcmk1WZMRY?=
 =?us-ascii?Q?ZCylfxTB2JJ0//dvhQWJY7p9zd55xYU88e++BT5hXHfCJCw7qzwktU37sETi?=
 =?us-ascii?Q?IR5Vp8cAWbPGhePo4zFp7J1HOWLLtVjlC9wyrs245RNaH/Ev6jjrqkc3HEye?=
 =?us-ascii?Q?ZrOYeKXuv721aGdLo/PZSxnzLC799Gk7GMoEOjB9XOzhr0ID25KtC0sCVYlB?=
 =?us-ascii?Q?qsHZa/UK3fg4YKHkxWCxiSGnNG5mJEmLKlJcq4z+ZubRtsI+QFImz+G1p9gQ?=
 =?us-ascii?Q?VrzT1P0zK2Wvj5dDDO5XDQSnxcXFNUNzuY3XDRIKHxzIAE4x6XmrDQdni55j?=
 =?us-ascii?Q?f5whh1Uq3wTdxvK4+OE9uPpmDwMdzP3cFQoHeDIt7cUdLqjRsLS78YZ8dewJ?=
 =?us-ascii?Q?ixoQG5mlR16d0wARc9GqSF6N810oVXHqxcATnIj3XuIxTkwRnpG2HVIMvwqE?=
 =?us-ascii?Q?c/502P+RAJjW4+oOk0BY6NUsosojRwDtsQw6+OP5teQnALDDIcPrNXPoVpLT?=
 =?us-ascii?Q?r/4FHoOxxMiwdm35s5ZZzXD9A3x3fT3PUJjEpHN4+lbnWN0GOunS3ak6DjnC?=
 =?us-ascii?Q?9LedvEHt6Uj+jplnZKcONAwfc0HTJBpyEu9pfphBmCM7/2yYRgUf+gwfuD4g?=
 =?us-ascii?Q?2fgWKSgRLt47cj7MEBjVUwEl+x3mTeUDk1/Tzd/4sm6StFLwKXMw5RNMSTIh?=
 =?us-ascii?Q?JbJxBOAO//17hcOJjziewN70khosBFubFxzDZwIDJKECi0kiKVb1ZhEIsOZa?=
 =?us-ascii?Q?l3wuZm6uq1Lz/LcDP3+5dAnJo/Y4ICDyulCqp7Dt33TnXQIyJa4fAssfdwf1?=
 =?us-ascii?Q?iAiDrZ9WS1lds+uYmTC14QkIWYVWtIk9fCLwauMa6GjLe+LWUqjTSNTZtii/?=
 =?us-ascii?Q?dI6ZTTSdJB+vWEDhzCjI2krjUTLuA1+64KAy5VjvpI5o3ac7WVHhrct0Twcg?=
 =?us-ascii?Q?LZj5AKs2RLTYIbjsfWctHPbx8REINIe0RhBaUYV1QESX+N2s8I3V24FKLxtU?=
 =?us-ascii?Q?n8vxWTGobY3jSTC6CJ3L7FcmH/A3YUfAt9nClDft?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f61003-6088-4c58-3c5f-08db6e9c4b0e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:55.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: it+Nk831SPDoQ4rSqGeUUoaboc6VOf4zj56+vJBJY8/zib/sdrwMxDtXeuJi31Cn
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

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index a503ed758ec302..9d7b9d8b4386d4 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -387,6 +387,44 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 	return 0;
 }
 
+static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct qcom_iommu_domain *qcom_domain;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
+	unsigned int i;
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	qcom_domain = to_qcom_iommu_domain(domain);
+	if (WARN_ON(!qcom_domain->iommu))
+		return -EINVAL;
+
+	pm_runtime_get_sync(qcom_iommu->dev);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
+
+		/* Disable the context bank: */
+		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+
+		ctx->domain = NULL;
+	}
+	pm_runtime_put_sync(qcom_iommu->dev);
+	return 0;
+}
+
+static struct iommu_domain_ops qcom_iommu_identity_ops = {
+	.attach_dev = qcom_iommu_identity_attach,
+};
+
+static struct iommu_domain qcom_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &qcom_iommu_identity_ops,
+};
+
 static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			  phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			  int prot, gfp_t gfp, size_t *mapped)
@@ -553,6 +591,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 }
 
 static const struct iommu_ops qcom_iommu_ops = {
+	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
 	.domain_alloc	= qcom_iommu_domain_alloc,
 	.probe_device	= qcom_iommu_probe_device,
-- 
2.40.1

