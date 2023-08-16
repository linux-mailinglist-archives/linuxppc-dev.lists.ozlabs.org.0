Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCBD77E1D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 14:45:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MvUcAMIq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQntX4ffWz3byX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 22:45:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MvUcAMIq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::61b; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQnsZ4BBjz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 22:45:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWb9Q+f2EXppGaziNP28OUnaeQjMXy4c/b9vVVTlK6KKfHtX92XfP1H9noW6h15v8BeBYAOHbsa+Pgw5y+I/VF1jQRVaSntwQIGuhvqozmS/bFCGIvsOnKSapQjAtTkJq7oXseGNPdabVGpsznLHaka8Nerxf8DICVC7MMuSZftGXvl1O0Jgu2a5dJ2CY9RKqOcQPbLHtOxK3Jme4x7SMFsVrp7dFJvIjVwIAZ1XmMbtdiwDZ6rg2+hEAGUKZ2mC+KNu4xL5EyIUO9+K3qtijyCDgA03D2WvhpKzJm678Uihrbb70JSkwaZjnzCgzYbPq9uEEHxB9TZCN8Aq1t6FAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTIS3tL6o8HXFow2YwPQlHE6eJ8x2zeA+YIsj9Z+Vbg=;
 b=K6+bLeOXOBBTbqjHoDEzbM8EcvtWgnkJ2F4fCPdXSxZefTQJ/Tv2DSZRFILp5OQMxplw4LE0p5dOnpeAW5mpq9JN3DD+3f3tvzhX7VrpkCd9u7uUJLTWyaxqAtxJSSs3f3yxc3zqIl/UTZJIMDHYSVv9oXCPAEnYyRGprfTqPl83NuNisKZDbYKtKbfa2f6GsN3xg2oE/Uejs/FF/FeBR602WGirKo7V7RLGAA36znHvC+rVG2HswV/Q7pdpllxgvwyRu5BTBosmKMVjgxQWQAD/2veQJZDSiPuixSOL5lDa2m5Zf/Ppf8ENB3QrfjoT+pJfUYkuL7voEL3lp7rhog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTIS3tL6o8HXFow2YwPQlHE6eJ8x2zeA+YIsj9Z+Vbg=;
 b=MvUcAMIqiNrh/5CBIMIilz1XobwuGwolomHxiVTgo2wex2AdsHvE9g4a1rIC/VIxVrqa4wVmYQ2vbVBXjYTTYQ2wY9yiYVIbO+nee49m0BHoS0g+SvOjQcLvSsRaqrRvfAihXK/slbWnAh5dxEXIMIeyytb/oLM2fHn8pcZFFRYXi41aY5aLhiS9wLIr5N+4+nmtoch9tV5lafCu5TscvtcmuEeJhCoICkui6Xp/3cDlI6xzcAX8bFe5tm0BO4cqC3Q7LEdPZ8qGCaSrz/HnOp9vMmmJHZS9GVgOLkWM9dCvJoLVoJNejXoRGDNzs23+70ImH5AWQn2kc+KWVWVisA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB7445.namprd12.prod.outlook.com (2603:10b6:510:217::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 12:44:43 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 12:44:43 +0000
Date: Wed, 16 Aug 2023 09:44:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 08/25] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
Message-ID: <ZNzEubbluKrz6lWs@nvidia.com>
References: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <b50a464a-fa28-e359-1bc5-4f2b105326ad@linux.intel.com>
 <ZNpjmiBLneBC9oWe@nvidia.com>
 <c24e7eff-b28c-8152-6022-325ca89c8074@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c24e7eff-b28c-8152-6022-325ca89c8074@linux.intel.com>
X-ClientProxiedBy: CH2PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:610:58::38) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f25203-f6e6-48bf-b6da-08db9e56907a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EfcWWQv83+YJofu3dlHUx8ZSpBkFv+ou/rL0iku77GS2fpxFKJtHuYR99H88r7YwTu7XWtnYrVa7lO3DUS5jg8ypZ5J5cSAszyEHisZ2Ql15iOhOOwYX4OYSwYRFr6SzYX2xJkWqUXxN4QOEu5M+ugzcIukpqYLhd0N55391j8MEKrRJpoj44nMcYUiJEyprP79yToyix806bmGZmcqoMC0PPTB2ZtYN7NVzjuPBkU1Z0UQ1QGxzD3vpWvDzCGOo7fW/BHqdKnAfJrljMMEeCkltKXUpO0jm1Yv1N8rkNczIkAz4+BuW2J8u1P5TQEQAY9EILDskOEqhHZvuOp30v1Q+9H7VPoNsMOCUmuOIugcvm8TMshmI4n3G+ra/ndrZ4+74bx0rry+eFS1uKCmesG0rNKFlztzqpkeDIKnqLQlASrnmEv1cbz4w/r8w7ZhVqBVSXivNgEsUks5HI7IPm90r4Cc60V5zAV9vfIDnigyGapjuDfh0weyR6ZDbXrUzEimM5qMo+fNiSgD3QEWqKJt2rWdMm6KPDmEG9cUbM+8A27/LkG7pe8FMpc3Dr0Dh
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(7416002)(7406005)(86362001)(6512007)(107886003)(6506007)(36756003)(2616005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YEFh7EViI9sw9XM5u/anGA7DFEO/4ik18m+UjLV1E9owrdDWtGikl4IJ5704?=
 =?us-ascii?Q?dQyxu5DpSr6jRzjPV2KGWSR4FPc/c5FqbYwMR8J3CMxQz+b/mqlMHGFxj8aC?=
 =?us-ascii?Q?P4li1BDiqm0fq3p1efavgYUFkoiMr37jkQljLO04ORJnT3spTfwBlOqFOM2A?=
 =?us-ascii?Q?4buifHbEKKiLvdjs/1vocGVQtEguGC6EFVmG0ge+urssgvEgM197Jde7ePEX?=
 =?us-ascii?Q?MdOVaf106dyKRxZ1EPg0Cqt30L380Qnbi4YaG0NsbFjbJ7NrivR9kGZjq4dM?=
 =?us-ascii?Q?9ZuDJVmYXJKxkrO7FAl33onaEIZ/LjiIXcvuRk4y5rWg0fV806ybq99CpIci?=
 =?us-ascii?Q?sxrSB7e3ztnsteXYqu8kGh7Y+aRa68Q+AVlEQLoMVTqDNaicNcj7Hd6yaNv4?=
 =?us-ascii?Q?u4Ht219ivTAciyo/iRW8mVGZyrf2rhDmaDHhc3WYrqkAaIIj2YOO4uSDzZnV?=
 =?us-ascii?Q?BcseGP7Tvo3D4/UZkFaC88C+8TDmGF2LilWRGjyME+8YqCZU3AxLr69SqGrD?=
 =?us-ascii?Q?YBiG+r9xt+FNt3ojTb+iRlwpZdtXgEPMAg6YcTXNhdgrqBI1xTQAveBt3wS7?=
 =?us-ascii?Q?Zr9OZO3ueeEsYFKyoW4/lZB/RNHCEb3y/ricMnhP+/9AofCy0X537zkZWfwG?=
 =?us-ascii?Q?4bn1eS8k/l8jS+zXDLsB3ib68rZGWyNSQLyDaz93DYY4ZkUojd75vL2k8rSs?=
 =?us-ascii?Q?cTDLG38jq2MFi7F1bjG+5hJjQqroY0Wf7HzaisqMg5rG9dp4bKzSkvhYbyum?=
 =?us-ascii?Q?bhU+cPcgJUKqiQhpQ3C/EVZ5qN6fURT2otcjzN9UMCOfDsQBQH7tbuq/jg0A?=
 =?us-ascii?Q?XK3xEpMUhOyGtThZB3nwjdNULwjSG+sg/CmdIBanIGXa+jOb02sXL5uF6SHP?=
 =?us-ascii?Q?6oDb6O/8JA2YO3nX0eD6UKFqXACI9zoBHqTYXKnoy7qnaw4H4ph2M2gMNqt3?=
 =?us-ascii?Q?4z30ETvBrpEDly3/IcbDsDVZiVxAJCeXgX2PykNr5HHNPQ1ZtWxDBS89xCXN?=
 =?us-ascii?Q?841P9DveR/c+7NC9GLPFK2ROlIlqi6MRIf98v0nLSDC6nuJccvy47qahrcgG?=
 =?us-ascii?Q?zHbee8pyTwwfd+FBYOxMlOEVO14KHpz86vDuwTd9PJgOtiYQ4f7SNDHWR1jZ?=
 =?us-ascii?Q?VBii4Um7hAvjsLMSlBHiqg4a4iM+8O7YcevYHOdK1nslrW1OUm1Jq4EQY38/?=
 =?us-ascii?Q?/U/FVZ2dUZEtfmhIkGqMtw42FiFJgclG8xr7Hf/4V2kECpuyifT0twKz6reH?=
 =?us-ascii?Q?h4G2DnoiMf8Fd9VUdY/dzhKXIec8gfUPgOyTooVBXZ289X+mQDuVbUTvRB5w?=
 =?us-ascii?Q?0wkv+mNBb40+M/42WeZt1Px0ym5qbRNNo8iOE6QQ/Dz3gapl2HAHA9OAzTkv?=
 =?us-ascii?Q?hosqrRJ+FWq/rz+6Q+B4zHDGYCB+f61uc+N3h4fa/WeWiiwdKZEHRpwLs7/N?=
 =?us-ascii?Q?oNg5tchl0zBvCNRhLXVUO9rpuw/nYzY6JZRLnXFZQta52wkLa0dJmQmEQXv/?=
 =?us-ascii?Q?ywrktU8BJFXMyxj3Q/RY4bcNrA4t4HbuaVUIR5evMLlZneiQ0ycageRlNG0Z?=
 =?us-ascii?Q?HTFhFvUEy7GB1qQ9XoExhL/bV2n6oknOx66RMf51?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f25203-f6e6-48bf-b6da-08db9e56907a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 12:44:43.4838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvkAla3FxciIfevCAI0JAvhgNXpBl1AUzC0EBX68AI1S/+CGyZcR9y9L1Hw0cA0m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7445
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

On Tue, Aug 15, 2023 at 09:18:59AM +0800, Baolu Lu wrote:

> > 	/*
> > 	 * Try to recover, drivers are allowed to force IDENITY or DMA, IDENTITY
> > 	 * takes precedence.
> > 	 */
> > 	if (cur_type || type == IOMMU_DOMAIN_IDENTITY)
> > 		return IOMMU_DOMAIN_IDENTITY;
> 
> No need to check cur_type. It already returned if cur_type is 0.

Yep
 
> > 	return cur_type;
> > }
> > 
> > /*
> >   * A target_type of 0 will select the best domain type. 0 can be returned in
> >   * this case meaning the global default should be used.
> >   */
> > static int iommu_get_default_domain_type(struct iommu_group *group,
> > 					 int target_type)
> > {
> > 	struct device *untrusted = NULL;
> > 	struct group_device *gdev;
> > 	int driver_type = 0;
> > 
> > 	lockdep_assert_held(&group->mutex);
> > 
> > 	/*
> > 	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
> > 	 * identity_domain and it will automatically become their default
> > 	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> > 	 * Override the selection to IDENTITY.
> > 	 */
> > 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> > 		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
> > 				IS_ENABLED(CONFIG_IOMMU_DMA)));
> 
> IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) is duplicate with the condition in the
> if statement. So only
> 		static_assert(!IS_ENABLED(CONFIG_IOMMU_DMA));
> ?

static_assert doesn't work that way, it ignores its calling context
and always checks during compilation, so the duplication is required

> > 
> > 	for_each_group_device(group, gdev) {
> > 		driver_type = iommu_get_def_domain_type(group, gdev->dev,
> > 							driver_type);
> 
> No need to call this in the loop body?

Do need it, this only gets the def_domain_type of a single device so
we have to iterate over all the devices in the group to 'reduce' the
type for the group.

Thanks,
Jason
