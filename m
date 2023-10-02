Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B57B5D7E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 01:01:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=i6maXPEX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzxJw6nKcz3vn3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 10:01:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=i6maXPEX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::602; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzxHz6XgSz2xdf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 10:00:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uz599iE/7wKB1HA8QEUcbA7TT4PIHiqbsSL3yAbl3jyDO4bmAz8HfCAhSxN9iWdnSjFGoBT+DC3w0yuONIK8YL10056XWX62qDPRAHBucAqe252gt8CDHNzhNI47Gl2R1hoRmED44rKcS88BIiIAD9Z4moixXw3gQs9MX/MciLemHo6DCctYMAcRZBrMy0a40OXGFYQj9UYpQID972uoxjyZW5lGeMC4xeTclbyHZ91Mt1/Kv7xpFAU8qdPP07gPiNgOZiMOO/ioOK+v34VyQNKiuk8DzZuQspW8Db/mtQ0Sh5izp836RQ+1uNoBsVGRQTeKkvt83cRhWbLZO5PDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITaCYUNALMWVaAVcLTQ369nMoHjnK0zjR9y32nDX2+k=;
 b=ZUacWl1ze/4RX/8XH9zPOobqgtA7Ji8Ca4bDlmZaIH717lZam+vrxPBSQwb00DePl+/N44aqHx3/ukaZLBjUyK8bn8c+Jb+G7DiiYESA5kDqj9a4Rn8kDHrgkYqO5gppESZZJd/dJAL2KCC5Y95R7b+M2ydh9wTPSQrl68A3gtdWTm1IdLRX5bbHg/td/mSL/UpKqjRJAFkWKT2HxcdcJb/4+DTlmv1n9gST4BrWEdH8XqvkGUKVkySr5Tq5RhFG494Wy54+jhWQzafY4BM3AsaykJoCT4UC8Db8RGLYPqOWuagGqPFf3DDDK1nzJGLlGYqyi/vWteZQIRDgVXUz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITaCYUNALMWVaAVcLTQ369nMoHjnK0zjR9y32nDX2+k=;
 b=i6maXPEXzMGJIJ6EkXx08I4R3gK3dWZBUnNAe4YSpA6c3MzAoC43N9Vnnh5fkul+E6MtgKZO2aVcgjMC/3ggE5PWQWIu183AoqdEQVACbjcKedOj0v1Xpz/gQ6rHVnOQknDlFC4CG3kn68sTb5J7nkjttwYGv6fofHDnFX+JHuWhz7AfXakMUh2e3BEfYeeZQ6QE+P3skHtY4YlnGeQIuXWIFbpGjy9IwX24JvHqbIhgL05vAlAf3HE0B5y4ds1r6J/f5dnWee6cAkKUuGr53Cl3GXiA89RVnNQwOmgSkZDpY7xsk1P0ugeO1VHzUjcy4bO1YO/63vErxXZYACmb2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Mon, 2 Oct
 2023 23:00:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 23:00:03 +0000
Date: Mon, 2 Oct 2023 20:00:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 20/24] iommu: Require a default_domain for all iommu
 drivers
Message-ID: <20231002230000.GA682044@nvidia.com>
References: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
 <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
 <CAA8EJprz7VVmBG68U9zLuqPd0UdSRHYoLDJSP6tCj6H6qanuTQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprz7VVmBG68U9zLuqPd0UdSRHYoLDJSP6tCj6H6qanuTQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fc316d-8065-465f-1ad3-08dbc39b5004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ETyZfUzTy+ZRAM5mFJahdax8DYJeII0b8ycrVYNGXWecQh7b4Y1WORPyE1iF1wzFlPERMtV6hXdNkprF6JCQNrn5xyb9EuLvkn4f085i/PywnmClluL7keWo8q8oMqEdoe52XyH6Q75V2KpYa7KaJKkjhjUDDhlpcnD6qqsb8gAg9rsY9NA0MGoY4aGON5hFoi6GeE0L2rTFwWT9MUFS2s11y0XUoL1xUZYY4fIA9ccMoz6gclIUhKsvM9kf53NiWE5HDdg1UKp+CKckY8dANI3DfrunLQ8ABWJI1D4eqRgcPJkWEXS9gomJnzM4t7ZmdrnWQBO8rbepRa9bGBMXdbrW2JI8bqkpI5d5vM8kJJSV+9NxM8NCYOxtOxRsTmKmOXrU52b5bVgCr7qlvbb3K7bR7eaFS9TNY4boGtIl/l2sxaRjvf+o18pY52RsS5kiD/4viRQJSix/R52BrHykWgiIFmUI0JcwYRLcrF/EZUTuQSexwJX9YJv9rWANsGFAGtMOCaYZijSKAWpoI3SM36WLMm4njxd6eKfQc3v8UTOyN6qQxrUmkq7kV+X7vk0kkuZ8Kq5dTy8JTPoeC1pyRCKlbFpcSyoRi0+dYwJ1zuh87qa7iUUYHUj81Idz+bGm
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6506007)(6512007)(66476007)(54906003)(6916009)(8936002)(316002)(41300700001)(66946007)(66556008)(38100700002)(5660300002)(478600001)(6486002)(26005)(107886003)(2616005)(1076003)(7416002)(7406005)(2906002)(4326008)(33656002)(36756003)(86362001)(8676002)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?szCItTDzYFJfPhSoINBTPzvd4s0FDI7o4owfkBngVPfxdgGKH4bsdd4lhLqB?=
 =?us-ascii?Q?nXX120aijFhLmu8f3x8BhG4woSgFengJKZDZdi06RWxpy6GWybCCopWS2xzI?=
 =?us-ascii?Q?dIeZtDRb3T6j2zdN3iWpYsVHDB9zyP2d1bp4ko2e9ARLgqw4DiypL6kytfuv?=
 =?us-ascii?Q?2NExIL5ufkXKoeReJx2OR3q47Jzo8MwbxVDAMhg9ymnjqpqKUP5FSLVBG9Rq?=
 =?us-ascii?Q?Mji3aaazgyuorfuhjzFRRmtkagfI4KG4EnmFJ/F9T8Wx9zaT3VYjr6qvtR4G?=
 =?us-ascii?Q?yPMvmRqdJNJHYn2FA0jIu2XYqtO0yBwBP+UL6LsAwyr2PlmjsY69CDQhaVff?=
 =?us-ascii?Q?yReUertYTu+PeFmSym9fCXJPEf1k0iu9/U8epPKC+v6YaKErNxn0z9I6UIg1?=
 =?us-ascii?Q?bEITJ6ravpJdOG/dX1e5eszRblvgVr7rpKwY1IFvQxhXSHRQFbzEJ4146BCQ?=
 =?us-ascii?Q?D7I8MjMRmgPaUG7SW4c1mI8+SGz9UdKT7H8tu0eot7i9zzJZT/8dwBgNQpjx?=
 =?us-ascii?Q?8AW8Pj68rTIspt/xhMSQ1dLWg72DhzDRqu9/dhs5VzJTVqTTx79ZaZ86u1qY?=
 =?us-ascii?Q?6i4x2CoaG+/Xn/LXPqGSYYqB83IIzangP/kSSnwxYlisZIx2Gwhuu/SBa4+V?=
 =?us-ascii?Q?IOySyDqAirFVc3d6966JAoYdnD+4Gj9bvL+dU9U5NrOMxw/1EQ4Pcsqbx9OJ?=
 =?us-ascii?Q?85ZW8cj+oS7ADtzQuW/ePh1fbz1naL85XaBhnyemxL5SEq4QeWQN9xNb4ZQS?=
 =?us-ascii?Q?qW/o27Q3Zcprav/NXFxA67V63aRDijQteX6FJpXa+h9tP2eXTjljypj6UalJ?=
 =?us-ascii?Q?B5w63r4eudbmT2CTlzQ6ALKfZ9cXtWm67LvvBWYXWUoJ/04WrBgAxwtYOV0g?=
 =?us-ascii?Q?kwfHahGNLj7wycPfEn1G3oOWDMgip3z7tsSMd4rWyWAmhke0R/Xn1yYsvLu5?=
 =?us-ascii?Q?5plMEsqIEcS/Agov37Tn3GG4QroIAJHN0j7U6wTbhhkXpOsbuvsVhvE/p7mB?=
 =?us-ascii?Q?VnEttA0ij5Bgm9473Pzxm2Y3NYDbcrV8Hs/ZJcXJNhVn3+nz8zOriFZEqca7?=
 =?us-ascii?Q?2zou4Tt4qwbCU7ml19zlmjDhT+dz1ARZ+7kcKgnTa+MjaJtVunM368c2bYWX?=
 =?us-ascii?Q?OmvJeDJqYrwCcMT/hOFrSHG//cXUC2FZ/uFUhZHigjR0+FUvqDUANYiwWVld?=
 =?us-ascii?Q?MgqUOstC42O7nORvzWkUXL5h8ppOjZZ6R/2U+eEnKcuSsXWpOQSaimLaHRxB?=
 =?us-ascii?Q?/hT+xGSUJwYC3bt70hiSHplLwAciF3bdDAP1E7eWIi5D7lHcyxmDkF1TkUDg?=
 =?us-ascii?Q?FvwgsAFyMzUEsygYjXS1RBvErhKZMIMuaTq+K/dlbKL3VfUN0bBFwvtj/jec?=
 =?us-ascii?Q?eM+s7590p5UG17uFY2T5/V5VsQnwCqUPFwBMsuVhQPFwgEmzliOQtCWxdO+k?=
 =?us-ascii?Q?Ac6oWTRpVQyzzv34buDOYFhgm/o0JBrJ4y1yBuKuRyZrLxDeXrv4H/VKz4m+?=
 =?us-ascii?Q?T5M3q0pCUTOWfrx33VhJTg38xfqJ6Z71x7bjRh+9WffkyC+f5A1qck8u7jly?=
 =?us-ascii?Q?U3FIcJPmcnKW9TyxuChzy2E71U7d+uhC9pEfUGb0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fc316d-8065-465f-1ad3-08dbc39b5004
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 23:00:03.5628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFKLxlBkwa4Opc3wfrZMcGk1Xaxuq2Kzf2hNFxqB/9f8U6TYl9TWSAl/toFCupWk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Kevin Tian
  <kevin.tian@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023 at 12:21:59AM +0300, Dmitry Baryshkov wrote:
> On Wed, 13 Sept 2023 at 16:45, Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > At this point every iommu driver will cause a default_domain to be
> > selected, so we can finally remove this gap from the core code.
> >
> > The following table explains what each driver supports and what the
> > resulting default_domain will be:
> >
> >                                         ops->defaut_domain
> >                     IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
> > amd/iommu.c             Y       Y                       N/A             either
> > apple-dart.c            Y       Y                       N/A             either
> > arm-smmu.c              Y       Y                       IDENTITY        either
> > qcom_iommu.c            G       Y                       IDENTITY        either
> > arm-smmu-v3.c           Y       Y                       N/A             either
> > exynos-iommu.c          G       Y                       IDENTITY        either
> > fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
> > intel/iommu.c           Y       Y                       N/A             either
> > ipmmu-vmsa.c            G       Y                       IDENTITY        either
> > msm_iommu.c             G                               IDENTITY        N/A
> 
> Unfortunately this patch breaks msm_iommu platforms. This driver
> doesn't select ARM_DMA_USE_IOMMU, so iommu_get_default_domain_type()
> returns 0, bus_iommu_probe() fails with -ENODEV.
> If I make MSM_IOMMU select ARM_DMA_USE_IOMMU, then GPU probing fails
> with -EBUSY.

Oh, OK.

Does this fix it?

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index cdc7b730192a35..f7ef081c33dcb2 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -685,10 +685,16 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 	return 0;
 }
 
+static int msm_iommu_def_domain_type(struct device *dev)
+{
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
 	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
+	.def_domain_type = msm_iommu_def_domain_type,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
