Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9576E77BEE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 19:27:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tSUWVeq4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPhCz256vz3cNZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 03:27:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tSUWVeq4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPhBy02Pgz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 03:26:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONOBX8x33JhkpuuRVqH2QO6FUismRBkKze9mEShk0iVLMzE/G68L7ztK8qunBQQwBzbc5DCZDBCzzCHsfgHNGpNOMw8SMy9Ua+JptgXMrKQNoy5It609WErEAhckRZYCz71jGL4Qaa1FIi+msGFfECTz0g14dCgv+0JZo9NLGp4FdwTRWlEsLunMEjyKkAD2Qxki5ghybZbKXLsvlzsiw399Ol8aNi88F/ZiJXrINBbCXNcVDCc53JlZKlWULLqQwnECZo04nYA80SBIkbnpWYinuCuwedta4V7AT2DlI3Jmp29I6pLH9bcYYPD6st5QoE23jGDuPlWzYblZZEwGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRdWcrVrO5K4Cnl59kCdf6u9FhKq1ZKUkKsYZJqc26s=;
 b=F83xAcPCp4+xnHhbVzPbLnbAfos77HzLJ1WOwv8+a+VGGr2skFIMNv6poXUs9tlPkm6Z5tkP9UoqKekskCjgVqnlYLfXJTAM2RBcpLKjMJ43r/qK1zC9JRhkpv+H3WjftO4Y+c1QifKGHjqKZx21ugWAFWWetb3HPTKRl/oCt4497Vtj/BnJRPPo9Oy4zrpHpHs/9yEg6dfInaHjfeazyVCqrsm3sLBjlCz5qR7estO3w/6+EKwlO5woXQdx/f8Wb6svYhoHnjFJCksFKlqOZX4AZKDezu01ft9UM64ZR9femdi7ENmK8AdrLUv7b1lleA3iFhlXnAMshP9dgjq0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRdWcrVrO5K4Cnl59kCdf6u9FhKq1ZKUkKsYZJqc26s=;
 b=tSUWVeq4VlAq0Ox3sMkGC1xOoZrCwJjTDKnRFHrU4opwTxIcBxGyWxJcmXIIf2xS6GeUVGUowB2VwcwJtzbyXs2cpDLqjpdtuDdofZw6A8sC52EnfX9SPFo/dSbUSYEFZJ6oON+6Hc1dKf5qyNAijqHlEs9DompiidObNcdYTqRnlZibhIMymfgtzhMsutloAxGe/QyHy8qIIMJHWpHKAEmLuIL/TSfg8KDyI2TZmYyaavbKaXbYxOMwMurYvLcQCE4JIjf6xWTtf8NAI0scXQZBpVPIZ+WSuEATw5mgA325GkRupkitGnSk45ZTmHxBubvcHWVG8nlvex2vSfs1zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 17:25:51 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 17:25:50 +0000
Date: Mon, 14 Aug 2023 14:25:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 08/25] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
Message-ID: <ZNpjmiBLneBC9oWe@nvidia.com>
References: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <b50a464a-fa28-e359-1bc5-4f2b105326ad@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b50a464a-fa28-e359-1bc5-4f2b105326ad@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:180::39) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2d936a-2130-4f75-9cce-08db9ceb8155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cIaFfaNHJEVnZqUbN1qVuIzrntN9GzO6BQgOtohs0Hhk/9bslKwclXrCIRquy85NgoZUhfJYfWxuRMtRfY9TK1miDvhhemPqzKHIvzXU4XvY3x5zWmFvCg8r7acUBS/6lH/mH4PggaOX0sBsx+asZOlA+bvx4HzJBElCFm6ZlwN8y8aHtAdxmbZPdXjGYEj+rp5GBoMwPdiR+uchqAS0ChIj2ayw+mWDqgA7VieMnyUhutOGr3oaSjAymsFqkn9YonSRnzXnBOlW2NhvEN5688QWgoE776RBBB+eDfYBXZwl+pd++g8QJUDDz0ZE+mWoh4O2AKHEOFgZD9m06iIN1m6DOmf2cCcL6yivdQnsG2H7ntmgEbmhP3noFaZY7QSuiLQNtU1N+F8B9+bW5cVH7Uv+i4ivK94r1r93+Y935gC8Jmol3okSAjxV3zi994S6CZrhNF7GyIn5kDblHeiUe14ZOOCaQZgglwNUc0AExWc2+EEs+C7Vig68jiZt/tPrnbYYdnklwQ5d5oxC1voIxyJlA3csdGuJh6F2lY2e5uziufi1shlUxMQ9pai3j6R2
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199021)(186006)(1800799006)(6486002)(6666004)(6512007)(54906003)(478600001)(2616005)(6506007)(107886003)(26005)(2906002)(4326008)(316002)(6916009)(66556008)(5660300002)(8936002)(66946007)(41300700001)(8676002)(7416002)(7406005)(66476007)(38100700002)(86362001)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?c+/g/xt34sQWbo9mIU+AZNFDu/9DYO0fTG4RPszvun2uflEN7/kyAHYPiArd?=
 =?us-ascii?Q?2JB0LA+sYDvulbzX5KuArCPU+fUoaer3sKKyW74CH0gHhk/EGphHHA5ZrjGw?=
 =?us-ascii?Q?TwdNRVUz0e/ldDpKWjJI9qE17W33HNykLvCnAk/Aem1m7gX6Hnfq6YWgeBs0?=
 =?us-ascii?Q?/mg8k2FZINsQr9g1qSr9Ws31Zq3pXzdQbXEdiMcgbt2JzZxnk6uW0X5D9MhE?=
 =?us-ascii?Q?iNnH63RzaeekxEcZFdZYczsnLbo/EgNJMl4kQPhsoEjfMGAsP4CtAYA4ffqh?=
 =?us-ascii?Q?WhAG+EGZ8NLYzHVo45wUYrYVNv5cjmrSvrNstzuEtYJU4ljPOdfMSf0mw4vN?=
 =?us-ascii?Q?qguZxCPItl7+yIaF68new4HAdmMWxeUGyAa83KEBl1aBBmB/OVKlmOg3R74K?=
 =?us-ascii?Q?d+t5yd+8xptV3Tv0nMMZQYcXqP/RmVDfZm2GB1PI6cnAFke5+pV4A8jNGrzG?=
 =?us-ascii?Q?iLd7BVhdt2HYXR6cHjGGVfIwaphjJlsfj+Akxugq9u79xzjqmFkbWvWUb3nV?=
 =?us-ascii?Q?EsbJYBouKDluzLk2ogKfwCZ+6NwhLe1xUKzC7SS5d2Bm6kZm8FB/Rifg0p/W?=
 =?us-ascii?Q?0lUQpPxF41HWmSWWhGkvbIW7OypqJKMxhpkbQzixKzWfxvBag9P2RgxoyaW2?=
 =?us-ascii?Q?f1/cu3kx9x4WaOw3a6DAH+WklSP7ZKVUdLMrYOUdiABM40Pn6xkwqeU60YiD?=
 =?us-ascii?Q?DKDpJUUkOYBWhKRg/jAA7c5oLX+Z6O5QfeMTJJ52ZeA6Wc1s6BbvGswUYit/?=
 =?us-ascii?Q?i1xG5VZ4vrVfZK+DcowkdUxohxcoiXhqZjlfDKcII210K/jRMTnsVdKCZZIa?=
 =?us-ascii?Q?sosL4idBiaFl7ClpKvui/7Iw+W9pO+GtHqCTYtqMgdFMMuqJJiW55V6Hq3cJ?=
 =?us-ascii?Q?dEja1QlfkpRejZpOz+E8rd6yAmzNUEYZES04ZRJvNANkXbqdGagWyl60uNn9?=
 =?us-ascii?Q?P4h4Kqzv7ryisz1AZiyezlaOLSlYxRPgOwb8S+W6cSwQl3swuWoGMpstpntJ?=
 =?us-ascii?Q?VpIImCxZK3BijtXLyC1Ax8HJ5Z4TS8ILHKhIRRfe7GmO5a+6fUES3J2E7Z78?=
 =?us-ascii?Q?7v5jskYp8EsiKr+sT6Hmr+OE+OE1+hBAQkdaFZNLlX6ovUDyS9QyckWgLerW?=
 =?us-ascii?Q?+L6vQ371TN4IezNuDmoiGOBiZJudbHDHtWGHDBsY2rDzPlPWptCVBm4hahds?=
 =?us-ascii?Q?0FAFeT3gCcAE5DZZaPjRa11Xwee1xPrEKGqYKKSaesQClGdykJFLfMmf3r8E?=
 =?us-ascii?Q?baQMcxq08ZiYh6sTC55yi30yPMqQwWUmHRh6yDO4FGwa9jiDwbY/u8Tl6tnk?=
 =?us-ascii?Q?AifYz9EWHLxBONOzF03LtqhksFuHyanRzTQRdLTdE2p65Z3UWRc8KxtzoUCS?=
 =?us-ascii?Q?4YVOpkMfxNANleWQjwvoFTcM4um2XwDz6LyAxb5mmQODbSKVAKS39MEIwysi?=
 =?us-ascii?Q?t48fyjZz0vgtBLFrQORJPnp8FhAp8W6ip+CeNihEEtqLlLbEJpoM3kXwpTcm?=
 =?us-ascii?Q?svx+ONoJzmKjphd9RaEc6itk1LsS6EsC0ciYMXpcpEKyNUvk0TF98/rppq9U?=
 =?us-ascii?Q?E4LSXrqzyadfmI8AREH23eV9sPp+FlY9j1UzjyGq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2d936a-2130-4f75-9cce-08db9ceb8155
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 17:25:50.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiYWSivwYMRmVvxd68EQ2MGuJuA5NGT3bWhsUTqYhlkELP5Z9cSfhQTSs4ZzZhG4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144
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

On Sat, Aug 12, 2023 at 10:15:42AM +0800, Baolu Lu wrote:

> 
> How about consolidating above into a single helper?
> 
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1787,6 +1787,21 @@ __iommu_group_alloc_default_domain(struct iommu_group
> *group, int req_type)
>  	return __iommu_group_domain_alloc(group, req_type);
>  }
> 
> +/*
> + * Returns the iommu_ops for the devices in an iommu group.
> + *
> + * It is assumed that all devices in an iommu group are managed by a single
> + * IOMMU unit. Therefore, this returns the dev_iommu_ops of the first
> device
> + * in the group.
> + */
> +static const struct iommu_ops *group_iommu_ops(struct iommu_group *group)
> +{
> +	struct group_device *device;
> +
> +	device = list_first_entry(&group->devices, struct group_device, list);
> +	return dev_iommu_ops(device->dev);
> +}

Okay I did this, but it doesn't help as much..

> @@ -2124,13 +2134,9 @@ static struct iommu_domain
> *__iommu_domain_alloc(const struct iommu_ops *ops,
>  static struct iommu_domain *
>  __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
>  {
> -	struct device *dev =
> -		list_first_entry(&group->devices, struct group_device, list)
> -			->dev;
> -
>  	lockdep_assert_held(&group->mutex);
> 
> -	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
> +	return __iommu_domain_alloc(group_iommu_ops(group), dev, type);
>  }

Since this is all still needed to calculate dev

> > +err:
> > +	if (target_type) {
> > +		dev_err_ratelimited(
> > +			gdev->dev,
> > +			"Device cannot be in %s domain - it is forcing %s\n",
> > +			iommu_domain_type_str(target_type),
> > +			iommu_domain_type_str(type));
> > +		return -1;
> > +	}
> > +
> > +	dev_warn(
> > +		gdev->dev,
> > +		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
> > +		iommu_domain_type_str(type), dev_name(last_dev),
> > +		iommu_domain_type_str(best_type));
> > +	return 0;
> 
> This doesn't match the commit message, where it states:
> 
> "Arrange things so that if the driver says it needs IDENTITY then
>  iommu_get_default_domain_type() either fails or returns IDENTITY.
> "
> 
> I saw that this change was made in the sequential patch. It is probably
> better to put that here?

Ah, I went over all this again and decided to try again, it is too
complicated. This patch can do what the commit message says and the
following patches are even simpler:

/*
 * Combine the driver's choosen def_domain_type across all the devices in a
 * group. Drivers must give a consistent result.
 */
static int iommu_get_def_domain_type(struct iommu_group *group,
				     struct device *dev, int cur_type)
{
	const struct iommu_ops *ops = group_iommu_ops(group);
	int type;

	if (!ops->def_domain_type)
		return cur_type;

	type = ops->def_domain_type(dev);
	if (!type || cur_type == type)
		return cur_type;
	if (!cur_type)
		return type;

	dev_err_ratelimited(
		dev,
		"IOMMU driver error, requesting conflicting def_domain_type, %s and %s, for devices in group %u.\n",
		iommu_domain_type_str(cur_type), iommu_domain_type_str(type),
		group->id);

	/*
	 * Try to recover, drivers are allowed to force IDENITY or DMA, IDENTITY
	 * takes precedence.
	 */
	if (cur_type || type == IOMMU_DOMAIN_IDENTITY)
		return IOMMU_DOMAIN_IDENTITY;
	return cur_type;
}

/*
 * A target_type of 0 will select the best domain type. 0 can be returned in
 * this case meaning the global default should be used.
 */
static int iommu_get_default_domain_type(struct iommu_group *group,
					 int target_type)
{
	struct device *untrusted = NULL;
	struct group_device *gdev;
	int driver_type = 0;

	lockdep_assert_held(&group->mutex);

	/*
	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
	 * identity_domain and it will automatically become their default
	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
	 * Override the selection to IDENTITY.
	 */
	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
				IS_ENABLED(CONFIG_IOMMU_DMA)));
		driver_type = IOMMU_DOMAIN_IDENTITY;
	}

	for_each_group_device(group, gdev) {
		driver_type = iommu_get_def_domain_type(group, gdev->dev,
							driver_type);

		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
			/*
			 * No ARM32 using systems will set untrusted, it cannot
			 * work.
			 */
			if (WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)))
				return -1;
			untrusted = gdev->dev;
		}
	}

	if (untrusted) {
		if (driver_type && driver_type != IOMMU_DOMAIN_DMA) {
			dev_err_ratelimited(
				untrusted,
				"Device is not trusted, but driver is overriding group %u to %s, refusing to probe.\n",
				group->id, iommu_domain_type_str(driver_type));
			return -1;
		}
		driver_type = IOMMU_DOMAIN_DMA;
	}

	if (target_type) {
		if (driver_type && target_type != driver_type)
			return -1;
		return target_type;
	}
	return driver_type;
}

Thanks,
Jason
