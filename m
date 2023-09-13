Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF379EA17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:52:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UuK0yG0U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm22V2xSGz3fD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:52:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UuK0yG0U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::60a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s51V3hz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POnSTl7cE+xGVjmPozNoTOH233XZ1bguGhwpBl0h4tQnkbfPcuQu6+nv4dcfjFYT20oahPCQL4WyNSlFSi0ORmYiU5LVwk9ZSVK364stZsH5nmwClGu4m6nbCIqhlGoQwTuIKxqxiqIy+qDzoiI/+28KLhuQFYCFg73aeCFVDK7Pnf8gEqoZgceqvWHy1xxVgrU+K7Vl2iv7rF2nJzEnyR1m89dBTWDeLHQ37oWkg7aPHb8H2GwJnbovTSFLaZM0bkhMqfk7KPNG/I7cY1Ap/y7NYZ/4WBw4BEyfPrVtvebRWWkmkzmNawXhdVwSP5A6m2Prza2SPbew4HPnhPsuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sr9TKebtUGnVuxmRqO5v4cGoJ7TiKfrrkqpbqV9z9TA=;
 b=d1jAvaN0+tur1NKGMJywUpwZtpqCJDW/gccHxM9G+LlOrM8GvoUIfVKBOCR1OEbOodmc14j9OsPktCausheY0sAEoR1fvZqYw0Kw1IhSZb8fGKs46kfD3QJBzMDF0t7ZeHbWltwgR9KhuApWZzhquiJ5J0B2U6Juc1Tu+QDlMo7Uqi4tPlP2/ftjb4xWOJf/N8X6JpoWkRHbgBlGLlVoUumPr0DByiGc9rwvf3qCGs04M81ipkd7Bjp9WlMflyM6WQ4MMNu+RsyN/cey9EHJwaWsOFcZdE3KPtiq739jkaNBXgGUUxc8bbD7p0cXizwkYZqP67sO5SCZw6AoUQI2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sr9TKebtUGnVuxmRqO5v4cGoJ7TiKfrrkqpbqV9z9TA=;
 b=UuK0yG0U9bKf6jAVofHKqPXIseQpjCa1ZlsbR5ezjla1yEMFw+V5npOzJ3UW1+4UADX58/Usdrzw2rhAwEJGFqr49WhdbqdMiXgDzoa2E+kOj+Aa0I579G3GhHt9D9TD4Dhz5p7AMmU1wjNIkSJ7exJEt+s4DwaidFK5gf2C0vwrMqS7AimanmUjqZ0vy+LlEf2v7chms68FeftPhNBjpdRTEZs9bE5w0a36T5Q5EmbHKugtqiyfITDzbiUFSYnwyL2uu+8z1TPFFBiLFXUmKGdkyKsERZKgQZChZryMCcrwZ1mPfSBCXkd4eZWkN7rkKfT9HVBp7yPjBmGFOpOozg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:44:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:01 +0000
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
Subject: [PATCH v8 14/24] iommu/msm: Implement an IDENTITY domain
Date: Wed, 13 Sep 2023 10:43:47 -0300
Message-ID: <14-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:208:e8::37) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4622b39f-d66c-4805-a832-08dbb45f7b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	85DGjEO3IMgl5r7QXJ79Wi7YgymKKnRobJTYJXk/mO+1cSKN4NPUpuUcyN9KIP90yijo/9MOu+lBe8ShMxMxaD90Jw1+5iSd58OxAshzPFoWpAo1bdFbmg8D9R+fbQQARmNbck/HkQEGRYezJhS6g5rITGJBfsntXKJi6JtedOt+8KcPDNTEen/r5TIbJCgWFq+dRd+4zz03HljdAqSaqG0CYF4P/tq7h8Wsw0vMNiXL2/AJgifUxmKyuDAIoga5PAiFOI2RakMHqZNU+BmVJoRV4UWo1Y3/VCMMif4jRpx2APGUtfZXymsepDFrNkKbxT8J4nz7rqeQBVhWLFU8zGB8wB5bHMo7woQTKs72Qqey7e0+2s30GM/mj1M/b9SGkIT/6jtBFZsQ+p5q5LCck2Lu2/gQ0jTx/6mL+wNHt548VR8oBOnGaATJI3KRpHShXSD9C1/CQRG8qmbtoelxONDAkRzHFuNKEXpBly4mjeK4kRnPEZ8BWeml5Wt44oY8mxQ4MdmTLi/DtQv6/1jYHN6KnVWwgR9YpPxlOPmXrH5U43YkElVM0kQ21DHeIvnGrSiLxaCCGGJMR71uTJ/R7X9fSy9dmN4BrHtRQyZ6FTk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?RLDCS94FEm7Cb6643LreoG/Jxc9R72rd649hJGqPYtY1obJhXHk0XWEM/W+P?=
 =?us-ascii?Q?nnsZ1+r4TOGd31DK35SN6JUGWZxQ+Ytvhu6T/Ji3YKofwc91W31UAuLbvUka?=
 =?us-ascii?Q?xExJnk6efQOA2UBTb36StKtu/iBNf5eG2FrolYADLf9AozgWNeUNg7J5XgSe?=
 =?us-ascii?Q?MWxF9aPiGzWTKbGUU+ac1KCuqqqL66y8E3uHgSBee9yjwfXBsuMFFwP1OKWa?=
 =?us-ascii?Q?EJFXUNuK4tXDlAs7Pqb2iFP/FAHDbZiy87HPDWoJAoGuc6M2a7yxX8mzTRLC?=
 =?us-ascii?Q?v63dkY8C1QxsEJZPU0VX06Gr2nnvufyRuqmNRzALVQfvH498Do/jkI7o4gVm?=
 =?us-ascii?Q?JszTCYEqbTHZQemc6VR/Y5HEpUe8vvNFVlHvjbqHXX7T5DWwzUY5D1GJ8c6m?=
 =?us-ascii?Q?Km8GGMQnjfTatI5bYZ2FsLnGZJIoVj6hv578p+32LfdUD0FiBJGM/9+gfLpR?=
 =?us-ascii?Q?F5EI4VXbdyH5Omq2o4hb1vjFzM1JCk5VPZ0tu1Lw4UYYLwsWkzuqKLE/YSzB?=
 =?us-ascii?Q?zaCUpv75fNF9RKl6oI6LBfgaZxu9Hjl9G7Ref0EctHPxXRwA5Jcwjq36Khgx?=
 =?us-ascii?Q?lPH3A94JuorsTvAJvouykLWe2TQ5VTpMUU21YvPQA5KvQih+wLCKxn8swovE?=
 =?us-ascii?Q?Q0/LiZEXNfR/MYR2W1AxIVaujUd0OUA/45UZ/0uWiM2FErOFEd+ptexSh+KS?=
 =?us-ascii?Q?Svw5A7bglp9lkCNjzhJ7OmfBLX4em0JqBilScjq0WCDRhb2eiNqrtPikoaQc?=
 =?us-ascii?Q?9zbtJu7NQwSP0KTglgcaPUG3XmAGWd6NhJL5qcD3I8uFOUzDWYkTi3shqwaV?=
 =?us-ascii?Q?2ZWSHImC9LW80zib5weixG0KJ6MCoGoCRFbfQTQQL5s8Kz1QdURS682b8yeG?=
 =?us-ascii?Q?GvaGGMOzbq7vFzJ7RrgKjsMcr/3UKVdQjv/DmKD/e+pggLi7F5gS+qRoMqny?=
 =?us-ascii?Q?HHwZ6Nm14MZlY2l/OW5taBC0Rwi+BwGr//9rKdU+HpBMjJJzBL71oSvWWzSA?=
 =?us-ascii?Q?VTKzLClVvZOf0Nj6P8lB6wA9nCRmZsJdZ+e/l4bPak+gN9uz0o6zEkjGhXTg?=
 =?us-ascii?Q?63m1R1aZgvVvGX2uHow+rXemUz06JvC+xmMQoeEB9KOqhIboW4zWZN+34znw?=
 =?us-ascii?Q?MMxpF//J9CGEaMOsOwR6KyUuTJsyGC6bYuBmhIvCUg20qFuo4H7/WA7/mYd9?=
 =?us-ascii?Q?ZaYDYbOU11/up3HWTHKd3qBJvKE40Lkrya6UYbLYzTCuUx58i9SQ9b2EHbew?=
 =?us-ascii?Q?gZsBcnZb4xsz3F1j+tHPdtH9aNeMieqtSzcrJf0zBIKavFytANaiPgzJTfi1?=
 =?us-ascii?Q?GIPPAIo3QLI6EWcbfoNZYtNsomW76go1AuLrOgqiK2YzfTGOK8b/zV98DyBt?=
 =?us-ascii?Q?/mFANDnRjsTCrcrcY/o8eWspy6ivTRc6krg0lEKSpX6uelMeXSofLuK1WJ77?=
 =?us-ascii?Q?mrYlTDufRnRglhxg2fGBiSpbMe5M4tI2VQgr3zeyeyFsqPXR7QauUzLRoRqY?=
 =?us-ascii?Q?rQjXUnZogedIX/IEAgEJlbYNC/nu2jUgOik/gbbftBlAth0tRTy1hD42HATG?=
 =?us-ascii?Q?ViNIpDSU/MJG6VSHhu/+d1BMmIbRj1BSPb1d7Nf8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4622b39f-d66c-4805-a832-08dbb45f7b8d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:59.2280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WumwTfe8F0B4d60TjBhx9S2eNZ/rbvPcMb1UfTYARb8EsGwQkHd/COoDnNuznul7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
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

What msm does during msm_iommu_set_platform_dma() is actually putting the
iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 79d89bad5132b7..26ed81cfeee897 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -443,15 +443,20 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	return ret;
 }
 
-static void msm_iommu_set_platform_dma(struct device *dev)
+static int msm_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct msm_priv *priv = to_msm_priv(domain);
+	struct msm_priv *priv;
 	unsigned long flags;
 	struct msm_iommu_dev *iommu;
 	struct msm_iommu_ctx_dev *master;
-	int ret;
+	int ret = 0;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	priv = to_msm_priv(domain);
 	free_io_pgtable_ops(priv->iop);
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
@@ -468,8 +473,18 @@ static void msm_iommu_set_platform_dma(struct device *dev)
 	}
 fail:
 	spin_unlock_irqrestore(&msm_iommu_lock, flags);
+	return ret;
 }
 
+static struct iommu_domain_ops msm_iommu_identity_ops = {
+	.attach_dev = msm_iommu_identity_attach,
+};
+
+static struct iommu_domain msm_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &msm_iommu_identity_ops,
+};
+
 static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t pa, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -675,10 +690,10 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 }
 
 static struct iommu_ops msm_iommu_ops = {
+	.identity_domain = &msm_iommu_identity_domain,
 	.domain_alloc = msm_iommu_domain_alloc,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = msm_iommu_set_platform_dma,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.42.0

