Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D831572A416
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBwG4Vtjz3gBY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:08:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OmmG09se;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::608; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OmmG09se;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfz3LqZz3f8h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnhJ+ww3gfnAYhPXWYaYPcNkSTkbqsq9+FjUzMEncSgGLOqszyv8TwE4WGzwhbTgd9gay/IvLOKyX1sNgPDNftq1wm+7LSjstAe6FXL9KzuivSrQCEEuiDzBBicl0Je+5pUIuTOvdUmbHOtIWAyN9zOJwAZQ0zXyHM33iNejPRen07sEKsJEIuJzrxwBzMClMcInP7aYOaTu9PeCAEjerCf4cF7Uc73aqqIZ563X0oWeX1O5rhEVOH4RObhdz7CAodWSqUAtmgHNDtFStfLPxtPS0tVxucLxQtoKqR1bFB+h++Vx8et686L9b/LCyUxV5tk7hLx3YXDBBv+PGh/J7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWXa5iPUsdOK6aga88CkdY8DnvSE5VOlKfKrBPcpAvo=;
 b=QKCTZPhf/3RuogQ5ynIeAHSWsxs5RcgCalxuIzf83kwTW/v+Shz878MawDSNOI+eytFUyvdc9bNETtio7eq4bDmeM7lMgAAB7s1vJM+BgGRs14Tg+P07WGhcSHCtfj5GvMvLhCW/kxKMf7TEAQEuLPes98jr548wY2Pr4px2MZ0UlzUuDfkgc6AT9J/Gd8JG/5HlDEkIX8mpci58W17OprsR8fsE3XYSk4TGXWJIgQs0hXRbZ6PdrkEdoBtXNFG5RfRJuFxY+HahDw2yJMoSOjdv6HyRefXLRCSajpH9CHVsjOu/y+TfgZ//LwD83/Cs+aRfXyx5I71qJatg1dbCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWXa5iPUsdOK6aga88CkdY8DnvSE5VOlKfKrBPcpAvo=;
 b=OmmG09seABBlZ3CAvMtZ+S/5CY+xrWFEHqTNlLhsW9m6A5sbVH2bdCAqwR1EvtvY9yVrEh8m4HR2nqcGJsSx6m6ppBKjwsWI0yZd8wN+467bbmCTdxPmrGtLBQ9+xIqkRrNmfBxYTmj1GKlryr32Eb20pnBCxZBVShPNc+S48Th2yC23eYtCZneq9/E2xHwWieSjCm1o0BUBo+9rqlz6r5nYM+chfQANkkOOXBsjncO5FzfOIjeh0SrscJdleco8t+Mwm2fVqxa0YEvuVYdUygtRISXWvZl1fFi3wEEdZpF8kjT2+ElKtSrctgNJASgAfhuP8fxJngqhknFTgI1LnQ==
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
Subject: [PATCH v3 04/25] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Date: Fri,  9 Jun 2023 16:55:52 -0300
Message-Id: <4-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c88ff9f-9d05-4f32-8017-08db69239808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yqSmH0lkCQnRDiwjA+WKYvosNvm1u0aBlaGEZ09NIIiAm+oap5zbQRpVDSJhaRhP97ft2TEhlJs/siioXPTG3qTMemgv2jO9forf9urLdxBwqe5WW1gWpEZa50tCCEOGVRHnlrdNhwTxJNhznOVkYfv+C0+LRnTIBstMDA0ftg2sKpbcq0tUvhctJ3Zlw029gvG4NbHcmJPBapAgTydM7fTUf7HjfYjY52YHSB8TUx97q+Vgv8NWpz8n/cpED1Hm6hGIQdq/HqNWkVCCOlANHstFkW58cz/+AkSG47If8WEwCe9F+T8DbomrfolFoJHg46J1IasWwNlnndyytrtV8e0LFJUreAZY40iYU6NAL/YSmdtu+S2BqrQiCv26Anp2ov+xU0Zk7Ct23XG3UglptOmSyrHStMQlFsH21MFhx4TVDAWpXlfzcOmt7K00M7no7Jw52ic7pztUZANX8K7bML4Vo1mkxJI8JtRek4oYR7661LXxwRivmjpqagI+z/zzbWB7mPtt1zAa9tn71evOGhh9lcUoG95eOPM4WsWen6QlWA95pTOmLvtHyxyi/1+CPWGxPf5115joWSRtpzfWG+vIUsEIjP4eq+9hdPU+6DTbQn6NTAQeC48NTjDiVux5
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Fm5guM/jQCYXfnb4Ib6epEV52+co2E+brZeKoCkU+Kju7c32GffilVlcWx6h?=
 =?us-ascii?Q?9GtmONjGdDLB3/vKW1tn4/0p6Kd9LS9P65lDVqfmKtrYonGbmAWPh7il+98b?=
 =?us-ascii?Q?xa9sUDI5/xYVozKaWTyYObiSKRhRAjcPcDybIlLDMsWV4MEs3jBtumiAIBmU?=
 =?us-ascii?Q?CFD11nt0v1cbS46e278fqPwdmyvY2uoXsyem2yhPzDyKwZYrUJ+y0xaVg7fE?=
 =?us-ascii?Q?nIc9t9bp2ReoUzkhHH7c2XuUFEpgneo9GjMYsxtB/II4K+WB1ooPcsjhP32m?=
 =?us-ascii?Q?OdTz+xFdl5LQiSIsi9PrtNJUa5fUv7Jad7Wq/CY1a/KPNyk/GnEIGPdQvBZz?=
 =?us-ascii?Q?yHORXDu6bGq5JkTaE2fs0LEBBWTD1vwA5fEyg4SmWxbhlw6P54rofWM8ZQmJ?=
 =?us-ascii?Q?0fUQLKxRnNsQoR7nPC7b7GUPChm0QHlb9SIJW+SWnx6jX8qLezCjUnUD1Syx?=
 =?us-ascii?Q?SRg4sXEt2K762NATTXXZuYwypFXisPeVcfC3Fo7h66s1P7bvOtiLKapn2lw5?=
 =?us-ascii?Q?7CAXPcPdQqX99pUjklzXKCQVsqMS+HuCNO7uOYvVcirh0756ieZrwC4i023K?=
 =?us-ascii?Q?j0cfHlhUO8N2KWhU8rp7gPl7BIYuHlidHdQEN9EhNmyfFPQ2aakMuyXKYNmj?=
 =?us-ascii?Q?LvJEoDO4kUX6mhzZjDZpreXTWRuxCvVTFFejybPT5f9Bhmzt+JlmyIG4Ksot?=
 =?us-ascii?Q?zSZbMCBRg11ljQA846ZlGuwwOvYIZt8Yc4MaeuI4UUjVuS1+wZEkCGHGzTx6?=
 =?us-ascii?Q?EwlRWEaJ9eRMB0Vh+7v0ovyrfFY9PiJD2+Nupw6yDfE7BURCjnpZf0R9tjjh?=
 =?us-ascii?Q?6niOqQF67hZPU54ZBwfwfswChGi+vmBv9dImbEW245rruoUExocMutm8/U4c?=
 =?us-ascii?Q?laA2ZfNUWbzFNKQ8vxzmsIzm8iM6lwBfP13c/FwOluOJXeqB1jUHEsZKEvyk?=
 =?us-ascii?Q?oDk6lxUVBhEoxf/Wf/uxjZSGOY8KVOlQGpZ7wSeFWnk0mtU9ue3sbbvNKfGE?=
 =?us-ascii?Q?5a0/UECK4bK1W0jRID/v4Ys/b7um5VGfxXgDXENfIuTmMtHY6cNCcPUpzZ67?=
 =?us-ascii?Q?hmutGXMhll/TOI2YT4xJvjWqIxAawgBjZ/sU1djC6pHppCuSRn2KgZczRq57?=
 =?us-ascii?Q?YwbrwWFpLrxPkz5XYYoOhstxYg39WkIIlbDtgVCVVbBvM4wjOlEHFNjp7DZT?=
 =?us-ascii?Q?UFyV95vtFCL4YvG8r1pH+it6y6ICAZzekoS9QI4fgMSUIIwhGyD/1R41CU2t?=
 =?us-ascii?Q?tcUo7mbztLYLPYWqqtz/Wqh2tilpIkWZLbNA2qu6tcQWx7+qmEWeQ78s6hxx?=
 =?us-ascii?Q?aql42+XI9+PpdS340LYn4qsRmJ5MLF0iZDGJFcsMq8y/9JN0SrHMnPrEzCBe?=
 =?us-ascii?Q?xA9sSJk3BeX/ahObNWcae2XkhdPkLHOvIk1PYAgMHFg9qUN7yZvnjuV4fYFI?=
 =?us-ascii?Q?vafjfiAxmAX3YZO/CcJT3e5X8sllYRNyrFrEKeEVBIaF2p68IOQSfA6IV9su?=
 =?us-ascii?Q?7VcSvyQHzFqCMSrnxAOgGjkGag3i9WZGX4ZNUPM7VgjDDzbfI44rw+Zwh/u9?=
 =?us-ascii?Q?gkSSfVDrz6gnxSB1EfzXxId3Le46eGw+DF9oVYVz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c88ff9f-9d05-4f32-8017-08db69239808
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:20.1257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwPPtq3DYZl0SFNSqWiUrp7gprT6EUjAh7aikFMAQCYhvy6uPH1bweqRjLlnQCMz
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

The PLATFORM domain will be set as the default domain and attached as
normal during probe. The driver will ignore the initial attach from a NULL
domain to the PLATFORM domain.

After this, the PLATFORM domain's attach_dev will be called whenever we
detach from an UNMANAGED domain (eg for VFIO). This is the same time the
original design would have called op->detach_dev().

This is temporary until the S390 dma-iommu.c conversion is merged.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index fbf59a8db29b11..f0c867c57a5b9b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 	return 0;
 }
 
-static void s390_iommu_set_platform_dma(struct device *dev)
+/*
+ * Switch control over the IOMMU to S390's internal dma_api ops
+ */
+static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
+				      struct device *dev)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 
+	if (!zdev->s390_domain)
+		return 0;
+
 	__s390_iommu_detach_device(zdev);
 	zpci_dma_init_device(zdev);
+	return 0;
 }
 
+static struct iommu_domain_ops s390_iommu_platform_ops = {
+	.attach_dev = s390_iommu_platform_attach,
+};
+
+static struct iommu_domain s390_iommu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &s390_iommu_platform_ops,
+};
+
 static void s390_iommu_get_resv_regions(struct device *dev,
 					struct list_head *list)
 {
@@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 }
 
 static const struct iommu_ops s390_iommu_ops = {
+	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
 	.domain_alloc = s390_domain_alloc,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = s390_iommu_set_platform_dma,
 	.pgsize_bitmap = SZ_4K,
 	.get_resv_regions = s390_iommu_get_resv_regions,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.1

