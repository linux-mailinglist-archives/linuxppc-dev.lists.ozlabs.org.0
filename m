Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD071F42B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 22:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXJBC6vchz3dyr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 06:48:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nlHrJP2I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::619; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nlHrJP2I;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXJ9J1Ypsz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 06:47:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhOrcF03KmIscARw5Wh06SmtkTV4UPjdxq4eOOGkVkvFLFlhN0atFqgMACMGT1WlJT+YE1mu2RJ0tbKDrPYPBOtRb6Md9Rgwhm0nDGtLu/3FJyMIAfyZ8lHSwJ/REG4xm9QF3P8CKHKcxgqIZT0YYTd3zvX8+k1K7cu0TeFua5EfW2AD1dcoNlVv0C3MvFfrMUujnFFiO9a8UdusYXqOKKHkblA3TdfaTGarqFO2Gzj1Sh2IZWFlJOdMxO03wYkfFdB8sbO/+1mwz86Uoap0HtzKewEYcjXkKLU+Wq3gH/5YtHS8d/nUnfq+UjQiXNqIIEkZDcbk4ZquycVQoQHuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k743byxuD2wT+TpNb/EB9MtEMFk0NC984MpixMsBONA=;
 b=S9g+e6QLvpNdpP2exJAJKz7ECWV+Etkixh7R6eIaLrtxmnXuP1fgani28Ok4mE0rx1AfkZP2+4vn18tiqTONnvhwrU4qXUUR1DxhpnlivpLS3Yeon8mwY+bcPqLqYvO1JGd7cajLxBjhCJLe5aDU2YR5DM6e5ielKb12OsTZsg5ePrXqjpMBPxt3SD52dya3RMw5PDoDNfW6ZkrP0U5OqYHZHFJHmT7jO4rt90RYBs0qt6aJk9FinTLzRcfQ47igY8E9Z/bPMtBVU8fFQvN7oZ5qn438FjEPHi4KUHqKPeD4MMX8sb6KHoApTB4FIbvKALNsU9M3glKkp1mNN+bK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k743byxuD2wT+TpNb/EB9MtEMFk0NC984MpixMsBONA=;
 b=nlHrJP2IDSY+ejaUXqrGjdM8jZILN8jLeIyLq5tAPbVqR3n9UHHJDAzPi1709wKixbbV4A2oL3yqThwX+kBJ9SqYllPa4H/SMPEr8KbbPEMIJYYfWPg7aKQVL95wdSxlBQ59Q26OWHo9h2veMWfEoqdYYCZUdjI29Zht3FjxO9YTmDTfHMho1R0iDP5kcHqgzEEBu5zxK6C45HmWVpwObblaYaTlsoZOCA8RGRbOAEYAXA9nxxYnmDq922CtCXS78QNGZ03GMeIEzZ4WgH+1iJf3VdttXZCzlLQm3YX/S8rtbBX/UNBKgMoAjfL8b3zLMSt/GC0duZ0NcqSbIKRAwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 1 Jun
 2023 20:47:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 20:47:04 +0000
Date: Thu, 1 Jun 2023 17:47:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 23/25] iommu: Add ops->domain_alloc_paging()
Message-ID: <ZHkDxgoKndFA6ixY@nvidia.com>
References: <23-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
 <13fb6807-d8b9-9808-c528-6df6ae9ca78a@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13fb6807-d8b9-9808-c528-6df6ae9ca78a@arm.com>
X-ClientProxiedBy: CH0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:610:b3::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 908fc0c2-9966-41bf-7aef-08db62e15b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vcHTKpxidrs7QW53DiiF0qICELUbi3TGT57FJuabKrx5EEAEx1I8LZKO0GvKQscJWB27SnLyqcUBl5TF9rbmwGkJpk8854k7xltrpzav1J2SVc4cFql+8Qv4TxxA46VXknQz15pIbjIaYG00OjAnghJgnxUkkda9PxCrVTHFS0z6nRxPApd+ZdlA/tLT14giQY92wFdGuKCfuAKlwbWcIh+ZTefLJrhTCKXnpqzMRY23IpZWo9HvW9jgZxRa2bbLZ4ytmwUK/4ucx0edexRoayYfu1eC7/80LKzvJrMnvb+8A1mKoaAhi5FqOBosXpcKnnx2JCXf15nn0p0gzfSpCyWYkYyjf1vPy5t6Zo7HalviDX7E3B1yTi+BYP2Yq7YxLhNwWixAYaFSkUDmypSeIQXikhpbl3Ja4C1pEwLdKSZO3uvbzRJ4v3wCpXDmnPvZORh/PNYGqg3IcItv4+Jmy9IOTCoZT7TFOIDQt3VfbTlpVTxEyjrjjv0sgfuB3W7Rt39RKQdfAdSm7NmTP6Gr9k5349PQ3R6zj3d4M4gaVmC9mzW0WVC7J6UOF1XZH42N
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(36756003)(54906003)(86362001)(66476007)(66946007)(66556008)(316002)(478600001)(6916009)(4326008)(8936002)(7416002)(6486002)(5660300002)(41300700001)(26005)(8676002)(38100700002)(186003)(107886003)(6512007)(6506007)(83380400001)(53546011)(7406005)(2616005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UAR9S+2rU9YUgz2ZGQB7oxvAtwZ5+9UouIDM12l3v09J3vSjlQwF1YsyJOmD?=
 =?us-ascii?Q?ugPR2X19LXwT9ruaPTFiQoYpZ8MFW7PZ6CKYRUpxXIBeTosCkLNz3jkPTzyV?=
 =?us-ascii?Q?O2AzS1IpSxuamR9R6zyJM9sOfhlIzkir26WnNE/YL/F+GBXh72ONl70YbLbT?=
 =?us-ascii?Q?H280pOzpApQh94vl1nDb0LqVKEFJk1pZnecUSBN2zBZNBl4GVw57k59aZod9?=
 =?us-ascii?Q?iVmEoMKN8adhT7gWx9vi99UOzrwfQ9gfIlZ6WjhjolPogW+YWshFmuAw4/W3?=
 =?us-ascii?Q?/xG+mtBZjo6wrXr67o65JHgP0fNqNNqxX8exD+mgludygS1TZiUakAKUKsjM?=
 =?us-ascii?Q?4SDhOQSMF4S8EnRQMkJ9Z6h5WBMsl6T0Iy/3SjTHgmW1Xlv2eC1tX+yR+nax?=
 =?us-ascii?Q?Uuw25pSJaZAO0J20tX0YUHJ8GkBWIvo73iW9Z8zCpQ4fvlGYIUQwaoG9sjsi?=
 =?us-ascii?Q?/zpC5e7pIBXQ6EmleeAX3I5oCN3c43BsQVtFqqaPJSLcY1dTb4nNW+ei6Z9h?=
 =?us-ascii?Q?HqdUrZj5p9j9VWyTFJtLv7WE3fW/PpqjcNEL1mo2Eq89+pJjnBY+snxq8kzd?=
 =?us-ascii?Q?S1yDi9t/jl4Dlsa+pw9g2CN9jUh6Rq3MMcsS7izBo4qISDRSvzaDIPe5TPJ8?=
 =?us-ascii?Q?ZMweBujVPS3B/zoodzgACam/1es78dSSvBbM7GSc+MAbTnqxMPiR7dz/HWmx?=
 =?us-ascii?Q?+OWDv9EISkS/0/QOxonSX4E+dozpNxTOMlYn8HinBiHarLpTQlkSNEDXAULk?=
 =?us-ascii?Q?pWx91PfCpOJ89rWpCYzLfVj8/8VkN/kNAcb71wId/eFYonwOWu1RuMiUtwZz?=
 =?us-ascii?Q?3eQMvRxbC0YmUgQrb9P4c6Bb4RERrf9goGqfCeP97QaOXv2Dj21VodhP30Yy?=
 =?us-ascii?Q?g/c2le5yTwh8Gd79h4wSoMFOy2e+1kNDv8jMck8IWID/i1VVuUUO5OOj7stY?=
 =?us-ascii?Q?I696aVuVmlWqaLpOb7lu9TZnoGVJbKAaNfhPz3QcQ5JcqGjJGGUM7I2CASF5?=
 =?us-ascii?Q?BXpyI57uRPnHX2/AS2Iy8N+9PByXEpXTKVFj665NwqsxjYrM7YfbgyuMIZ+v?=
 =?us-ascii?Q?kwKncve2SDPyySeQ2hcqe4Yqn/t8LsCwRsGDD3HplLzXL5EUMu79ScU5gtFE?=
 =?us-ascii?Q?2UVcifsinE3HzCBqFbE04ONDqeyL/NZUjzQe2F/6dDe29o1e4qkZz13NBapO?=
 =?us-ascii?Q?akV9npqbPVyuPkXpn7Lv4Ole1oO0l4aanjDceGdmdyEdVpw1Xfr6fvycCQA2?=
 =?us-ascii?Q?Q3ee74TJMRFaLrZkn5x/L0q+si5898Q9mJQm84TjdVXncE0MYxz4qgdvGuOH?=
 =?us-ascii?Q?joiaruPvTUnnXSpzSC9Jnx1iGYbJmGlsLx5tBU31S6Y4QM+qCAk/fBniZHu7?=
 =?us-ascii?Q?mxMnC1KGqKWlhjMBPtioX+cOa9GOGhIaotCYr6JAWOJWFt7gPrG5d8TAu5MZ?=
 =?us-ascii?Q?zLsKwExVNxfimDLrwb40rfuVyLgVVsIFDCXAN9GrDXaKzfdz0fcIrtosvX1K?=
 =?us-ascii?Q?NmOsS8Oz0PQ2qZq6AZ1cJ42dGJ/v+NP3tSTpSljBUrjNzQRyJEDJHo4Eu5EY?=
 =?us-ascii?Q?u5RNf9sZJJPh5QrhvOyDT/IlxT9uKeopfSAJ9bNs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908fc0c2-9966-41bf-7aef-08db62e15b11
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:47:04.0568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XIJCEqsupTawgyNlxcOjn7kuC1shHMtmucmEhEhDQQ+La+56Tlg1mm8BcLWnxzL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877
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
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 08:17:56PM +0100, Robin Murphy wrote:
> On 2023-05-16 01:00, Jason Gunthorpe wrote:
> > This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
> > domain, so it saves a few lines in a lot of drivers needlessly checking
> > the type.
> > 
> > More critically, this allows us to sweep out all the
> > IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
> > drivers, simplifying what is going on in the code and ultimately removing
> > the now-unused special cases in drivers where they did not support
> > IOMMU_DOMAIN_DMA.
> > 
> > domain_alloc_paging() should return a struct iommu_domain that is
> > functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.
> > 
> > Be forwards looking and pass in a 'struct device *' argument. We can
> > provide this when allocating the default_domain. No drivers will look at
> > this.
> 
> As mentioned before, we already know we're going to need additional flags
> (and possibly data) to cover the existing set_pgtable_quirks use-case plus
> new stuff like the proposed dirty-tracking enable, so I'd be inclined to
> either add an extensible structure argument now to avoid future
> churn,

I think I said this doesn't really work out because you still have to
go into every driver and code up a 'does not support' check and fail
if any new extension is added. Basically the same churn as adding a
function argument.

Adding more ops is a possible smoother way to support this. Keep
alloc_paging() for these simple drivers and we can add an op with a
big signature and structure or whatever for the fewer fully featured
drivers.

This way the core code can do the 'do not support' checks in one place
based on the set ops and we keep boiler plate code out of alot of
drivers.

> or just not bother adding the device argument either until drivers
> can actually use it.

I debated this, I figured we'd use it pretty quickly, but certainly it
can be taken out.

> > @@ -1995,14 +1995,25 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
> >   EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
> >   static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
> > +						 struct device *dev,
> >   						 unsigned int type)
> >   {
> >   	struct iommu_domain *domain;
> >   	if (type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
> >   		return ops->identity_domain;
> > +	else if ((type == IOMMU_DOMAIN_UNMANAGED || type == IOMMU_DOMAIN_DMA) &&
> > +		 ops->domain_alloc_paging) {
> > +		/*
> > +		 * For now exclude DMA_FQ since it is still a driver policy
> > +		 * decision through domain_alloc() if we can use FQ mode.
> > +		 */
> 
> That's sorted now, so the type test can neatly collapse down to "type &
> __IOMMU_DOMAIN_PAGING".

Thanks, I rebase it on Joerg's tree with that series and fix it up

Jason
