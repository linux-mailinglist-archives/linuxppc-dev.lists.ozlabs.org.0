Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AD77BA4E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 15:41:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kpueiVgK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPbBz1kDpz3cMW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 23:40:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kpueiVgK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPbB31x3Pz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 23:40:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfSazDkjwugY+3J8piymJxr2EkQaCcF6cS+P3Lda3fzSLsQDsqhexySuW1FeAD1jjbxOO2xAjOYyPkRZlMrk6td7quVNsFN7fctzN6JMdggmVl1WZubEOZYMKQU/hULLj8e7xaEFWaPh3ryha2drkMKa7Y0pLY81o1KcSKHir86+ly9r3v/LYB7Ydy0BDPnmH773nOdf9kSwrgPhPlFcA4soyBnJvUYzRjkqySlzFHHK7wpjiGsVzx+h9eTCV9GYWRnRTZxAZbHoixfu4Z45hHBLDSf2CWVCypoR2ZmWi2cVbThPtNDonbSAFNgAbbN5Svup+mULYX2sZ8N2rb1Q0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH/EiR/7/dMx3IdUzoJUZPWvel357IgLlLB7cSskzsU=;
 b=PnykiKfPINhU6owdHmzaCxogSNAwGJusotaL7paRuG8hn7o7FVLtzNDcOIRYbZuvke8BQh3mirHaWsqPGb2o7tR3PZ/22wSBdUGMGm2pvdvKf1Fq4651C1POwSgqyEAmxYI+Rcgzx7v/9PD2F6uRJ3CHZcz23STQzrEZQf7FRfKQpBHApQppIuVe5pac4h6MDs5ApsUxw5mhXbN3f22ul1L0aXQQQaa/vux54PXAU4wLioAsJkGjgu/tOjo2+kxWygcrFqujQdP4ikWjv/ZLoHeN80OaNAmCJJXX3xDEuoQEtqfwVakBMWgPiUWllAQ2K7MJa1qySXxXOVMXbJgk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH/EiR/7/dMx3IdUzoJUZPWvel357IgLlLB7cSskzsU=;
 b=kpueiVgKNiMaWoMfCG443AVTtaTh3dkP7rNWRtFjaoJe5AT2kiQPOsMmyIpYmRGViQBT/lkwUoUMBMRcPkJbvGyxgiLIfpUygmlhnzJoHC3EbTjF2mexMvkYLpCu8+GsYCA577XKLIlJxEsciglMpUyk3lp6WuaHI+qk7dJL0dN7Nok02WHgLrEzSnEZpHTdmPZT4ra4uyoRO6WS9bpNK9NxnviiSz9zqLB8F7u3X/PkU/IyOBNFY9QKxSPJOkXjuNxZrs0tRj60CiqFt4tJgI0fUBaLIxpZ3IXn0HzMHhVZLHcwfyTUMtph8ytDT0+/jnGccxATLtNMTEI+9qUfmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 13:39:49 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 13:39:49 +0000
Date: Mon, 14 Aug 2023 10:39:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
Message-ID: <ZNouotwtRcSmb/fZ@nvidia.com>
References: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <dde32ea5-2b1a-1148-c329-3c52ffcb71a7@linux.intel.com>
 <ZNds4kejneylOYBE@nvidia.com>
 <a9651d96-dbfb-aece-0811-2b36c4eb0a07@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9651d96-dbfb-aece-0811-2b36c4eb0a07@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c34923-7112-46c0-d3be-08db9ccbee1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MnhxjkcX3N0aoi5olrnnsQIC/mqREBKuI0cS3PFmJIxWYl6Z4wSIJzGjfMOQgtdd07/Z6dfYOs7D8Oq7SR/SpLd02Yd2l+91pC93y+8rHqm1o5G4enrbrpLGu1irLXZodEU5TGpTRLTh1M7COIzDcOTC7yaJfN1yjwFJlKvBGDig31GSwTbxmP0iuUhfVbzpsDeZUx7kUpOykof+yHoimiCv4x5xlV7UZx7O1YWgXS8Dj/c/i8J79kErPb0EMjSCy3/oAaW3vFma6rWIopmpi9JFmM7ON+xiBecQ0HK1dTzk1Cdsup8HzNhBhOk8q8ROogZEmsoWjzbeAo1EJDc5KCBarXYLsiuSOq1s4b2JOsER3VLUsrPCENfJ8YeUZDohhfietvhmvJSsxQzQTFfeVMszBVVAz1Z3ykfVb44xgkd5m3tlnhOaL3tJbMb8AU8hgRkOBj26ZagjjonUuyHiSALiIJxpZbPa0Ow+dvyJ/Dp9Nra9c8C2eWGFZ6WihrmehA/bUJutpQ8GH3D0pl8oilNKraUI7WSCYBTq6KahBx6G+sHZTeqTlNDJ1L4z4XPr
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(186006)(1800799006)(36756003)(5660300002)(7416002)(7406005)(2906002)(86362001)(83380400001)(66946007)(54906003)(66556008)(6916009)(4326008)(66476007)(38100700002)(316002)(41300700001)(107886003)(26005)(2616005)(6512007)(53546011)(6486002)(6506007)(6666004)(8936002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?63C6Z9Em/AYoZKMuXf8lDX5/YpErwpKNgQct1QVcUNZ9exV7SaXumg/o1LYS?=
 =?us-ascii?Q?Z/6otMZHelpUOHsNKw3JCxWAasGnkkXbKl5Qirxg7F+DNO49t+cy04iA/Tec?=
 =?us-ascii?Q?2ALSJa+aCkEQA3Kpk/9GoV9/kdMWOqzRgLAisc0SYJRWFVGHncRj0TJOoTMT?=
 =?us-ascii?Q?YX0gcN+zYIf1QOfrexksfSX/irY0q02p0/pBXx+F+QrYNFdW/lSd6mx5UakX?=
 =?us-ascii?Q?bufxnAN3P/VNIpjC+EtbwAQbSZKhgLHSvJIOSnm91deRlTUNBrhHye6IP6zU?=
 =?us-ascii?Q?j8/Vko0yG8mw3iVf9mTTN1XgZB5p9JQu4Ok7ay3HPtKaw14S5xrHKFgUUKNK?=
 =?us-ascii?Q?Oor+gHnDQFZVQk+m9DqYB+GF12HYU0zeBuuDTcsmz+yuY/y6/H2twmxRFXmk?=
 =?us-ascii?Q?ajsjQfMQ9isDiGunCp0KBraCKjAGWhUkPLJtC3R872ed+FFodBdDUZriOj/T?=
 =?us-ascii?Q?vzhjz2aNjPj7dfZUeM2lbTXkAxbH0U4IBOrFMqzsU4IhH7mPHfttok0J9FSu?=
 =?us-ascii?Q?LFWXF9wrRZ7SDE8xIFezv9yWrvTtXmshQuyLXoqQSmmCcCeu5XMJtBh6oKp8?=
 =?us-ascii?Q?dDuvs0JTgmLCv/kzPBb6BVt8v3b4Z0XCDoQmwXU7LUikTtWYcICTpnHw7avT?=
 =?us-ascii?Q?A6bYPyLjL47bABUihqKFlWGzyaU+NQkq/MPcoibR6fYh9RI1wxXLB2Q/MUkt?=
 =?us-ascii?Q?lMF9OMkSrG9duVS1PXV45+1rTn/hBtXa0Gytbq7o4MI+Q2wKWRG68g5B9dCP?=
 =?us-ascii?Q?UZLdjztY91NCF0GMJfemNA0xsyzghhBH8s2UshF2WNgnbk7SIyNPrqEDxetZ?=
 =?us-ascii?Q?3xCKhHIoDvyiOFywp7V9w5Aimn9D44QL43xYg/hkEBXqRAuGCfsWlIt9XyNh?=
 =?us-ascii?Q?yyV4TniV+zaNlH2z0HAMjtRszXpr3wZO1Wm/ZoYjM6rjnjv57zZyr0yu+w0q?=
 =?us-ascii?Q?TCTzbrO0+XzX4uzINUWsMmdRxV9nK0gUBFNuDgyUc/Y3L/8TMLkZqvnOPyMJ?=
 =?us-ascii?Q?VaKOlOEjXEYaovRCVWZ0jnc7Mll7rOadS3D9bCGnVLIQaqBohG8w0iltzPeu?=
 =?us-ascii?Q?FTeySUFlRHcJpfDTcFTswe12zkExrsJ+HVP6u+lkIJg5PGM4nf3YX+bwQjcV?=
 =?us-ascii?Q?RdWocDe/+tf8oOWu/ENPT+dLCeBcIgg6OcZqrnqI0NNZrl9GIgQvxpTuQZI8?=
 =?us-ascii?Q?M0gQWBSbe0ZMiFd4+MQps3l06MxbNm4ongDwX4MJJC1xNSkhInED111/VCMM?=
 =?us-ascii?Q?YhfZuQnuYnFM6o82kOmAXzjDV0cGPTFN2HOYsnf8CmnNRdkd5iwtHe3lDc5o?=
 =?us-ascii?Q?i9NIbeONPINZrFDjEJLCfojO4KFdA2+BZq8YInQUAEl8ErBxk1fTowwWXBjy?=
 =?us-ascii?Q?R56sOrPbPIcuWx3UlsJZJnVu+hPk2ROET/ul9YX4Bp3ywG+YlmvlMlZa02NG?=
 =?us-ascii?Q?Zz47DqwMbg8WE+ntuHUzplSfEcMKr4PxRt21Abfa5urInWNsmkyP5Qby6gXE?=
 =?us-ascii?Q?68UU4x8BqeED2ztmYF3BN9bkn56hVsSc4OsyxQSKtr9VrkhY5q2SM7/VrxBA?=
 =?us-ascii?Q?XnZGwOFXvXMYQz4HDKYPVFv5YF4zrjaqy28SufZl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c34923-7112-46c0-d3be-08db9ccbee1e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 13:39:49.2595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixQGGgBIxQ/Og3ProklgIU1MF+HcrYPTbWvphk/RyhPrsobVbOg5I5lC9CfrsgW9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas Schnelle
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 13, 2023 at 08:11:30PM +0800, Baolu Lu wrote:
> On 2023/8/12 19:28, Jason Gunthorpe wrote:
> > On Sat, Aug 12, 2023 at 09:36:33AM +0800, Baolu Lu wrote:
> > > > @@ -290,6 +295,7 @@ struct iommu_ops {
> > > >    	unsigned long pgsize_bitmap;
> > > >    	struct module *owner;
> > > >    	struct iommu_domain *identity_domain;
> > > > +	struct iommu_domain *default_domain;
> > > 
> > > I am imaging whether we can merge above two pointers into a single one.
> > > It is either an IDENTITY or PLATFORM domain and the core will choose it
> > > as the default domain of a group if iommu_group_alloc_default_domain()
> > > fails to allocate one through the iommu dev_ops.
> > 
> > I think that would be the wrong direction..
> > 
> > identity_domain is a pointer that is always, ALWAYS an identity
> > domain. It is the shortcut for drivers (and all drivers should do
> > this) that implement a global static identity domain.
> 
> I see. I originally thought this was special for arm32.

No, everything should use it eventually. Eg you would convert the
Intel driver too. It makes the function always available in all error
unwind paths.

> > default_domain is a shortcut to avoid implementing the entire flow
> > around def_domain_type/domain_alloc for special cases. For this patch
> > the specialc ase is the IOMMU_DOMAIN_PLATFORM.
> 
> I think this is special for drivers like s390. You don't want it to be
> used beyond those special drivers, right?

It ended up here:

arch/powerpc/kernel/iommu.c:    .default_domain = &spapr_tce_platform_domain,
drivers/iommu/fsl_pamu_domain.c:        .default_domain = &fsl_pamu_platform_domain,
drivers/iommu/iommufd/selftest.c:       .default_domain = &mock_blocking_domain,
drivers/iommu/s390-iommu.c:     .default_domain = &s390_iommu_platform_domain,
drivers/iommu/tegra-smmu.c:     .default_domain = &tegra_smmu_identity_domain,

And I have to try to remember why tegra-smmu had it.. So yes special
places only.

> If so, the naming of default_domain seems to be a bit generic. I can't
> think of a better one, hence I am fine if you keep as it-is. After all,
> the comment for this field has already explained it very clearly.

Me too

Thanks,
Jason
