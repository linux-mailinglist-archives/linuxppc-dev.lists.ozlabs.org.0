Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894479EA69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:05:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n4pMyQyY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm2Js0S4dz3hfC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:05:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n4pMyQyY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sL0Y7Vz3cNK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyvfTdTRyVWhiaFUbTmwZ36WrJmFQVn8wtIdPLOQYK3PwI6Dzc7DTytmR7XhLUcaIlcwh6m9VIOY/UInGysm0P5wjA06LzAV2lx28scEFQe82DDPd3qc5vzmfNM1G2rh5uhZOmp0slrFWnFgkTFf7IlfUwpB/1Ev0LYi42aJfWKg3ncO6e0AKpzghk+yiO6+EFQC12aZEx+cLc0re+SzcKZNXDoCagRTHoFbvpChrXy/U0nWus8FlZlur/w17vvUnUWBFTZW66Hx/f5K1UyhPRBvU71bisLq7722PCfuzzIA6D6nmT5UG6sqdpd3tzCUJa8sRexi9ABfEBqG21z7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr2I0TIpB0gmJPN1HAFvIuCkmdVjxqXYxCn4tomUX0Q=;
 b=SOme/eGLMT1uksdlJ//UFEI9tbOGbGF4u5KGwrXGGODvqvCW4UNdXQsMAKXG/yuwUG3//6CV7AaHnDQl4VegCCmQX3xFISpOKCxAcrRGCfRaBR1+f7Oz3eQE/uIN+ySoyYigQuF0DRom9urGGyfxb01KU1g9o9gVDzamfm6lzgaUPEt1sBI+XRgWAr9XhWp8tc7HABOlJaH50AJolhfICkHX94Na5CBz6OG2XcWStE2cl9y4uQ+6w64ShpSJp4mgO7hGNTZomYEWI2i5aYCR3WM70ADkBguVwB9MEoUpm9jLK7FD/FlsFpK+6P+Q8UjUQ1DaDL2G4NeVAJCdVoUFBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr2I0TIpB0gmJPN1HAFvIuCkmdVjxqXYxCn4tomUX0Q=;
 b=n4pMyQyYwvz93wcKPLLeWYxiUTgjI5HRfYsjD4hh/sm0u1JgmF6lrOldH5jFKK8oMrmp31nxGMy0uSMvLMx4Dzi34nm2Xit463y+ydN43OHCRyZYoLw3QzjewDUTFCLckKLzN7Bh+10dZGxTFpQ4yZOlQhjYucswzmmBehVu7tK7a1RzSeDwkqY5GVIFdT1g901q1OnAu04xd/1uwfEWrayWjhGGKHXmtM7jdxmTvtmo2pkO3Gckwz/Y39Jz/GeZqCIjEd15GcrbTY/sAc6Qn6ovyrBCi6+Z8bzmrv3iXst9oStFoc5pSUd8dpsb+s28eHdT4HX0MOYU0x2LyhJAWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:13 +0000
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
Subject: [PATCH v8 24/24] iommu: Convert remaining simple drivers to domain_alloc_paging()
Date: Wed, 13 Sep 2023 10:43:57 -0300
Message-ID: <24-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:23a::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afb146c-b9b7-483e-932e-08dbb45f83ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WcE+dLFtvuS4hFxqmo9htcT7zZzCDMysyztGRAOiZWTjzXxDx/jABFvUOYqR4phLWIoF/RrdfAsNxhWx+U4L1wDXOl1HV3Sj8fNU2Ng9QdSk8SELQoasfT8DnGtOPV1sqsySLzruaYvoki6slqUNJiBAOyakgrw2YMRea9IJ+Ix9+fuA8yoxryAvLb7sX8IcwZ3qhLESJCT0+xUf3OQCCG2//8SArYqA6ppjA5SLQqi6VIGtgBcFwvnADGdttKKk/OjKZGcO2Tl+ZMskkpvR1tKWQ+++44IqK6vhcnkbqjgUxeYvOI/ZWV7NA5O1EyDOeEAqNBZlrRAZVCC/qh5n/y7F9gKk9XzUPP7tjxIkYsQRxLuhl7tC9guKJJgnyUnWV2H1MciW9e/wFH3okDb5VM+7Tv/fvCTTfrcH4qSx2UMdNpVGSauzwyHRAhDLmLv6VDVCJcreVfcKd5nWcpa6JkE+OSA7ihO9KvxuZqI0ucya8LQfcazVp1TKDRsdZ3+28+OjmqUmfxgK85MJCRhswKt2owzpa50Uol0hG88UUiscnxsuo4gfZOYWYskPG7qU7nyof/6gtJi8IQebNVr/t7rObY582DWv2gyXn2obR1g=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?hlFslOM12hNkUkCB1fbrTqtnKiIjW9Uez7CJAwN+aVgP5pz2M+HJTRQl4Wlh?=
 =?us-ascii?Q?n2Bes85llJtDDweoHDsS6WNc+3svvEAs/sVu92aTFAtCyxqgXYNdOf/DbNsH?=
 =?us-ascii?Q?cNWwgqitheeUxepWGx8/kY4YGc/f372qsRpXHiY6jDy5LbYOvzkW2SzELqIy?=
 =?us-ascii?Q?Nu3kFC/tcv74gu7tEKwZN1I920DCqqj9hrQOjiNgET5jVYhh5d/hmZBXJRw6?=
 =?us-ascii?Q?pmualx9lBJfHvKBYHZYcCm5tyKrBacVpIvpjmJLx/B4p9JqQyEe+AFU1RUDf?=
 =?us-ascii?Q?7wEbqBi68g7Dr+cDIipTCX7MR4bypZLQJpOdrTWklhxO3jCvqHDmjl9HiaIF?=
 =?us-ascii?Q?RiyyXh1Slpyh/swiVzIWTLjqQ+JfLolNO269b5IriyAkj6SlyQ55FcnbbfRA?=
 =?us-ascii?Q?K4BVDCkK5ihbLFr8OlI/KGrXVbxoyw3T8cw4kKaIj6RZu+OXnJ34QN4sFl4w?=
 =?us-ascii?Q?CnfK4BIX8wnAArF21OasPlwHiaRCQQBjuR2ydV3/oPhRL9JJL350mEh6/33K?=
 =?us-ascii?Q?Vzzz2x6pP0R9hhFRIlDQzEG3sIxP6mGkPnvBqvnuab94FRx0oH23Ihk6Sauw?=
 =?us-ascii?Q?sLeJwtLwQNJrAkRfFaNpv+HPqLgTDWwy0qf6S6IKFinChiucUDTSPLQdWH59?=
 =?us-ascii?Q?ez8kvSVtqGhlYgWNXi4xnasCLGMinwdDuNmxVCnLnxeLphCrkEeRaC9Zeafd?=
 =?us-ascii?Q?Gopg12kzsv1ehfjXBSa0O6CnK6KPQcRtxIbnkMD3e2TmT/SBw/UMXPD8avye?=
 =?us-ascii?Q?yXOzXOTwrcX1VIc8C+CYDAwlJ6c+6kBwrhvYuqQpVGcwAhZI4N4Ly/S/V+Ql?=
 =?us-ascii?Q?oq2Arh4oz/BDIWZEmfwKF4p8A/QFLmT8yzmliGGtjj0b5gqJwq9CWdHOiEWa?=
 =?us-ascii?Q?n2lpqcredTXr8AA0p5ElagMN/6cCl0PTZhBR2jbjMb9mwaQyT1sWHvFbH6/H?=
 =?us-ascii?Q?wKPxKgptkGrJMTlE5DzF+Zux8bKBxtPHyhAmhD7wWnEWjGN3hBNlZ1rWnqOB?=
 =?us-ascii?Q?5EdcJaAbn1xjk9klXcyUiAt9OivewQIQe2EnQLxlqHNP0QWa6jZAq+vNLEOt?=
 =?us-ascii?Q?MdRcQzOosNnjbOmMgKPseaz8/o4PFqBA7wRsVBun618H4uFS6WFfIxq8Ooq/?=
 =?us-ascii?Q?jW4MbmGb+5tkPdNtXOn0zq7P6ltechGFU6hvLEYIr7doVUTLEf3b4faoYHCA?=
 =?us-ascii?Q?XybmYHg7QqHlJwXguAbnoDG1D2AlYaboGroIGz3TZr9cHfEITDFTZUNOv8rt?=
 =?us-ascii?Q?BiE5za6FCo9VHZSxhXYuQ+aN/dVNMscmuT84CHjIidKVWaqDFFYQlgbM+h+J?=
 =?us-ascii?Q?U6go3fuK+kkVdmO4QpkY0gp44MRkgf7aW3iZqGHT7+Qx38B/OGvEYJ1CZijA?=
 =?us-ascii?Q?QgInZOaFvRnM4EsM2JEmaS6jyDgKzrz3Ow6XCDPojvhR8CECNUL+B9L8FMrD?=
 =?us-ascii?Q?zJ5PXuF7x/qZTtw+T3/nlgRGYMoExLayUKp0aC/EuHrnNtiL3b0/XnupFDL9?=
 =?us-ascii?Q?DItU+eh4P8dffx7STv+fL9mpSmdXBHpzvuMEtp3jahWTehTPC8mqFYtIvMrq?=
 =?us-ascii?Q?J2Hw0NY6TJGVL+zujKcOYwEv8k7xnpvJon1tvhE8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afb146c-b9b7-483e-932e-08dbb45f83ba
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:12.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a00zGjIF5Fncb6OOVGrLqIFX2lC5kPQ3efl2rd6C77xFS5H+SfeUCWL3LZvZQ0Qd
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

These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
allows them to support that mode.

The prior work to require default_domains makes this safe because every
one of these drivers is either compilation incompatible with dma-iommu.c,
or already establishing a default_domain. In both cases alloc_domain()
will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
to drop the test.

Removing these tests clarifies that the domain allocation path is only
about the functionality of a paging domain and has nothing to do with
policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.

Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c    | 7 ++-----
 drivers/iommu/mtk_iommu_v1.c | 7 ++-----
 drivers/iommu/omap-iommu.c   | 7 ++-----
 drivers/iommu/s390-iommu.c   | 7 ++-----
 4 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 26ed81cfeee897..a163cee0b7242d 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -302,13 +302,10 @@ static void __program_context(void __iomem *base, int ctx,
 	SET_M(base, ctx, 1);
 }
 
-static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
@@ -691,7 +688,7 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
-	.domain_alloc = msm_iommu_domain_alloc,
+	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 7c0c1d50df5f75..67e044c1a7d93b 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -270,13 +270,10 @@ static int mtk_iommu_v1_domain_finalise(struct mtk_iommu_v1_data *data)
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_v1_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_v1_domain *dom;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -585,7 +582,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
 	.identity_domain = &mtk_iommu_v1_identity_domain,
-	.domain_alloc	= mtk_iommu_v1_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 34340ef15241bc..fcf99bd195b32e 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1580,13 +1580,10 @@ static struct iommu_domain omap_iommu_identity_domain = {
 	.ops = &omap_iommu_identity_ops,
 };
 
-static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
@@ -1748,7 +1745,7 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
-	.domain_alloc	= omap_iommu_domain_alloc,
+	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f0c867c57a5b9b..5695ad71d60e24 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -39,13 +39,10 @@ static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
+static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
 {
 	struct s390_domain *s390_domain;
 
-	if (domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	s390_domain = kzalloc(sizeof(*s390_domain), GFP_KERNEL);
 	if (!s390_domain)
 		return NULL;
@@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 static const struct iommu_ops s390_iommu_ops = {
 	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
-	.domain_alloc = s390_domain_alloc,
+	.domain_alloc_paging = s390_domain_alloc_paging,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-- 
2.42.0

