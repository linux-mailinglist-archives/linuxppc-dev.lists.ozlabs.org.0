Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3738785E17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:08:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cspIGCsF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCNT5Lcjz3c26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cspIGCsF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::61d; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBx26V3rz3cBQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjS/s97c/GhA+gKyR/rPOMvf3NV/rr5Ft7boYuOtaRd/RtxMQzYeO4RyTuQemA9kUSJt0xu4pMDVtxsKejPv6g/pkWkp3ibhv/aEjGaQWa37QYPPOROzCrsq+NGF/g1O+lTNe24ffc1yPb/5gBGeyPKVHe9EfKgy3TOuX2bT6qElu7+8UU44Z/efaSykw/qMtx5cPd5QEhsrud9yxKm0IVex0v1QtaJIAzzYcu5r7caETh7OLsvrQaJWLL/HndyM3tBd3oXxwLAP4EVao4QpwSuBGLTdZM5hZzLPT65kyY/4x38z1fX5D7h2ZwpXKdkp4jznIeU618Siy0QsqqbbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8cvW84AteYGsHkKJoxDmgX1gvmm/kLqlAnWOZtGp1s=;
 b=Bd0QjWCt+MAy5xSV7RyptE3xXY1szeF//fvOJoqc3s/Jl+OJMLMa5HknbfFEjDi2KDARcZm6z78W4PaV3P5zvX++llalcrZTX4iovUBq4Q9s8Yjvca1PxkSFnB9KlpFFX/nfOqzTnsOejQQ3gEE6CUgxpkFjW3TbYxNh1HZvHKNyXczqZMrAKIK9GlAXpDPK/fg1piPahmx/98TVUmi/M0LKQuE9indmoSDfbVP4mZ4gr1x4qGb9JV9EkQxR2ReaGmo9uaBv10tdd7ObHdR9h0+MUrfEtank0rJONqUtw3Y22vP2UECJvp1YFIaPtllXGAkydNuP2P514XSPxH9rnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8cvW84AteYGsHkKJoxDmgX1gvmm/kLqlAnWOZtGp1s=;
 b=cspIGCsFzxi/J8TTwRA1r4A1eZ0Vg6rJf5sYltxhGYi17f8FxDaGVj/yr12FXlUr1mzWWT14hamLLQ0lOR1YtazrIL+hZWRkm+CZkJoz0WOKN0YTShBDml021KIc6SUaYGQLuOdQv2MSAsH/b1aKBBq2na53P3/w6ZzhHW4F//Fw9Szmf9USTcTkNn4LrmioS6lGhfB55DjilLzNido9ui5t922WbibnOZ0HRV5HU1F3j8h2pkrmN5BsRPOCJTp7N2MzPf099aMxnR3PMqjZFuY3el+dIllYWt1c0utoHBPVwrAolmS59WOUSInuBvCgv69mjnP3TPXjYe6ItYm3Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5044.namprd12.prod.outlook.com (2603:10b6:610:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 16:48:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:48:02 +0000
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
Subject: [PATCH v7 19/24] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed, 23 Aug 2023 13:47:33 -0300
Message-ID: <19-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0417.namprd03.prod.outlook.com
 (2603:10b6:610:11b::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: b87e2f5f-dc1b-42ac-2e70-08dba3f8ade5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	q8MxGlR7ENx/1dVqVQoS/EnSLFVvuIvbKPU8/41HFtDdoXOnnAE3LaoAiDr1CjAVyMI0uN/dKDhVDkZUryi4obToTBE28AbmGB6YskJfYxa2LjpEyO4ESB35lbzEoN1cDNySKj+EOByOlk8/u9BUZ9JUnzyzxc4bLkauCJM087k3hdOhAhYOAIq+tE7pobGqDwU74lLWpnhMlv1oo3LK6gdp6+S1RDcxXf3gOj/wsORLU4co85aHzPRlpixuOsOB5Y8RRwpCvhr5JDah0wAiVEtMnQMy65rLr3kEgBxtAHmSY21EocuFF8fB0aNsOR4o/ZxlMPEILSbSiZdba+vw8j4xWz7AQ+hFhJBbZtRdoPa+9cN/rU6ekxnfb1Mgbd7cwuE3WTGYACDRu8R73qF9MQ0lHT5RPBwxxhnml8BQe5PByl/b2KeI2PNhMDKLF8qDSDuKB0dusPlADGws3btwkSuAtbryr4U0chr0ewL7tQBogQkVfFa0oJ+tLfpeHhsrxZ51CqJVKAjY0B+lwlPQhvUmU8LFidywJyTBTtWXphEIMnG09evroWb5dFY3Y6fpiFSfSjGeKCF7iwluVfkDg+zCyIfsc4NvCnuQE7e3fzE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(1800799009)(186009)(451199024)(83380400001)(2906002)(921005)(38100700002)(86362001)(36756003)(41300700001)(6512007)(110136005)(66946007)(66556008)(54906003)(66476007)(6486002)(6506007)(316002)(5660300002)(2616005)(4326008)(8936002)(8676002)(478600001)(6666004)(26005)(7416002)(7406005)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?+WCm69P7cBxiIVe5NaB6YSOEkEhtQueJ7h4asP0CJ+4ybMOfep6v0kiW3uxE?=
 =?us-ascii?Q?LQSxySKyCwEypfnbf+sriK5sl2WAdOQK6kpBX03ey/WtOFoPL7+8YImKk+Lw?=
 =?us-ascii?Q?EfhJnW+CZ+9cmp061qkuWyhlSrdS19o1jkuCKcDEQb1H1766fqNYZC/2Bf4J?=
 =?us-ascii?Q?fo+W1zoWtOy+pOD+zArXVb7TbwyK5spqKm0SKJBR8ssrjnLdW1EGqCfKMRQ5?=
 =?us-ascii?Q?udW35aFzHSN8GobcT2A9YZtedIY4sQ4VB21pKhPTpXsWW0fYLkjL2LKF31sI?=
 =?us-ascii?Q?6hHOCmdI2HVk2y+SJCbocRH90FBMDx/mSS5miZOTI5QTUDaf8JAMvRKtMmkI?=
 =?us-ascii?Q?JjlSjaDZaJhEVmWizK2CJp+GWX95IMaP+s9S2Uk3b+RAE8D/D+a5zduHBYGq?=
 =?us-ascii?Q?TPv1XX05q8eIU0FJa8kEX0i5gWEa8W4y9ss8yYzcsS7Xkycs24AaFWrGKr9y?=
 =?us-ascii?Q?l/yhXIkoxeYxDemakf9ToVGWS2ZkRA3C5ThXLGO1vNoanvwYApoU9U/4qu/X?=
 =?us-ascii?Q?WjKflX729pzCMTfWysCu9PuqPCAIWoGd7VloM2M0oJfLutyKnZim2NuK7gA7?=
 =?us-ascii?Q?OCoBthKaunVpSHQJ61GOmjNdAOb+quMSgftSJRKfF4K0mJCZZm7nnI8qdmqu?=
 =?us-ascii?Q?QthvzfFGIMQICL7/YOZTKt5a8xQEsHFepNsIGU4iOIowIm/O+C/haCajbVVw?=
 =?us-ascii?Q?+XcxBoX/5yH/RKQXd/ZJVU8ch56xSPQfBHOzZ01Da03gsGutSV0aIWldo0GJ?=
 =?us-ascii?Q?InRqZuW7DuJ1BkAeCfcS3F5sjmk6nrXo1/bTA88OzeVBp2DeZTSId3HWPwHC?=
 =?us-ascii?Q?p1Fp9YE0+wHCgcXHhcD83Vn99RYL6hk7TPGQX+yqoRhtHARfrRNVBP17ppZz?=
 =?us-ascii?Q?vGj+Zqo4HsWjWRGbiN0UNkD5sMJgyx7ZDdSaLSxgrgdztBsN4xRkB0BHCXg+?=
 =?us-ascii?Q?SSLDM6MU+6J/L/q/uuXXBkEI8xtB9ovrNI3rd36I9qKLDlgQtpoTfgve9m1k?=
 =?us-ascii?Q?ZKMdU75mndzyNhCvBFC7YmBJQAdX6nRCXzh+0m9+UPg0/kNvGyPuIHBwIVLY?=
 =?us-ascii?Q?UV10WRmnFb3uDXVFqyHc4BSV8DWzIHqyeDog9wFcr/5oNqq+8ci8edYF0Axv?=
 =?us-ascii?Q?z2/KB2j3NZerRDt4R2tyT4hwoE5KO3tTznhRJ6DGa6lv/ll0RKE2dfAHUIrv?=
 =?us-ascii?Q?KeiovfrZmqOLf+dj1igrXFErOf/H02wmIy+lHt/eN/ozMx4sRH1tLa0T+ob4?=
 =?us-ascii?Q?CF6DMFCQ+IjWL6KAdMpE34QjxajJ5cS84M7AtWQYz4B8D7vxAWK8PFcGuaMy?=
 =?us-ascii?Q?h8ameoEM1XLjZXxy1WceQSwzgCz8uOAiXlBKgU4GryfcSPpDekXLwLbBCp3L?=
 =?us-ascii?Q?/yvSQbLzWVQwZZwOufnkQ/T/UQ6HAxb4AKLES13+oU6VSUsXXiijugm6/rpN?=
 =?us-ascii?Q?eJGsHorQjkBKZw1uTcmxkOv8OubcUyNO57+6ZGLOHEg8WvC2RZ42Lb/3/Dxj?=
 =?us-ascii?Q?nMCzxqYJ8Q05Dxly7dDoc1zxRzaRVg91Mg08toe8RjjOMEhRXQNxOlXiVbQT?=
 =?us-ascii?Q?apLzH2YlpMNzYkxmIk1E9opfTNz4MosNzGkVLdK0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87e2f5f-dc1b-42ac-2e70-08dba3f8ade5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:47.1404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbCj4GviW22psL2M4n564UbHizyCnuT7OyC4dY5W92YLahDxtg4EgaGLBZWPAiu3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5044
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

Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
sun50i_iommu_detach_device() function was being called by
ops->detach_dev().

This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
back up the same was as the old ops->detach_dev().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 74c5cb93e90027..0bf08b120cf105 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -757,21 +757,32 @@ static void sun50i_iommu_detach_domain(struct sun50i_iommu *iommu,
 	iommu->domain = NULL;
 }
 
-static void sun50i_iommu_detach_device(struct iommu_domain *domain,
-				       struct device *dev)
+static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
-	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
+	struct sun50i_iommu_domain *sun50i_domain;
 
 	dev_dbg(dev, "Detaching from IOMMU domain\n");
 
-	if (iommu->domain != domain)
-		return;
+	if (iommu->domain == identity_domain)
+		return 0;
 
+	sun50i_domain = to_sun50i_domain(iommu->domain);
 	if (refcount_dec_and_test(&sun50i_domain->refcnt))
 		sun50i_iommu_detach_domain(iommu, sun50i_domain);
+	return 0;
 }
 
+static struct iommu_domain_ops sun50i_iommu_identity_ops = {
+	.attach_dev = sun50i_iommu_identity_attach,
+};
+
+static struct iommu_domain sun50i_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &sun50i_iommu_identity_ops,
+};
+
 static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 				      struct device *dev)
 {
@@ -789,8 +800,7 @@ static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 	if (iommu->domain == domain)
 		return 0;
 
-	if (iommu->domain)
-		sun50i_iommu_detach_device(iommu->domain, dev);
+	sun50i_iommu_identity_attach(&sun50i_iommu_identity_domain, dev);
 
 	sun50i_iommu_attach_domain(iommu, sun50i_domain);
 
@@ -827,6 +837,7 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops sun50i_iommu_ops = {
+	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
 	.domain_alloc	= sun50i_iommu_domain_alloc,
@@ -985,6 +996,7 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 	if (!iommu)
 		return -ENOMEM;
 	spin_lock_init(&iommu->iommu_lock);
+	iommu->domain = &sun50i_iommu_identity_domain;
 	platform_set_drvdata(pdev, iommu);
 	iommu->dev = &pdev->dev;
 
-- 
2.41.0

