Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2871F3FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 22:38:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXHyk3CXBz3dyD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 06:38:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YQ8uDC2h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YQ8uDC2h;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXHxr58TZz3drj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 06:37:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkejH3e9tqbgeKqOYzejn1+8hyOyMiJnrj6C79oS6BKVrOMifitdXHJ/Xi2eTpsQABwQplLRC1bpK0IXwoLTaeZz+wDUhFbl48UKW9GRNUHPVNsX5n/3ccs2WWrgM3d2uOgXZrKv3Rv2Op6GHDHhZBESTzEgawMvAUGJ6/BidrRvMBXn/qvlu1hv/h6EPa5XiNO4mkVt4sAlpYoR3OFRGrHpmm48Wamxid2Kjniwid9tYGXzyMD2YUIAkzwX5bTODdEJLF5oc8n8XTFb8AyR6uLU0fd/BdRS58ybvCvV7DEAAhI1h+tpsXCjDD8EuEMzWaMpv2HLjlmq0sITMNLk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6dWiqQPRYkABvOQ14ZxJPoOdGBkmWDBI71qbQBp8qM=;
 b=hBgN4a9HaJQsMw/egtUwApjC9pfOAybFUGGZDBXJo/T+moi+YMa68poX1Pmht5BV5/uv4Mwp+Dh8eaRMnoLxrdCp5df5WuIHe4yTpoejV/NhWJWG+sDFv6Ck1sNSqJIo7GhOqX20D4+e2PJQmyBqOlzWJ4y2C84txsU3V2ahdiY06BxpENFwOs3iThwiYriP3gZe73m7DI6QZgX9ezG0OuxcwG2T7l54QOQHVP2M+s30Tj6I2NPkUghkzBPWWPy1R/xNeyMHVvc7VU0wxlPl9K/dpcVGF6SvI5zthkMNlZjzdvO9oEir4n17ZLmP9V8bGNfgnH3f+KJQ54JOgny/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6dWiqQPRYkABvOQ14ZxJPoOdGBkmWDBI71qbQBp8qM=;
 b=YQ8uDC2hjHWjG0WFXAIMCD0Xe0Q2YX6pLxvEAmpubiAchC8niL/S8i/MYM46aro4+/MfOhptMkfF9yoNv85I9GaZ69vhT2foyazzypPPFxBA38DJ8EENckYXpQaj9o6390G9Sn7D/HYv1yNc0IVf9ueM0D6uObvy9SL0t52rUpxrkVs3+ki8R5bm0RYjKRRZzGu6rhPtCbRS/MG5ofmZzSAVTPaWcFnCBkLJ6KFD5RGxZixKc6eGsOE78HJTFS+iqx1xmrIESI9/52+sNxPkLTNEtNc97J7If+Ibv7OuBTYSQYmlRdvv2O2gZAujjMH6rY7ZiXsBxxUqSiUwjkVifw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7297.namprd12.prod.outlook.com (2603:10b6:806:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 20:37:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 20:37:14 +0000
Date: Thu, 1 Jun 2023 17:37:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 25/25] iommu: Convert remaining simple drivers to
 domain_alloc_paging()
Message-ID: <ZHkBeKDbztA6gFzn@nvidia.com>
References: <25-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
 <67a01c3f-9495-d586-1fee-4fd6161cadd9@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a01c3f-9495-d586-1fee-4fd6161cadd9@arm.com>
X-ClientProxiedBy: CH0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:610:e7::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: e94d4b22-9866-4047-962b-08db62dffb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WKjpADsojeH3cce27dkJ8k6NNQqQGW8nXZD3nCUEqYyUlZtiJRjzU6fJ3F9cuWAxXpmzaDvbpujc8gSs3y+gF7FIP45tuAZ51MrWDn5itCBWTIOGbYo4WMz+jv0TebfjAz/8rJlt/oLesfDFSESxzjvJWYiZ9OVC90e31qO/+JU08PXZ5mHosQWKf0m/17WYZU3iqQsV82rJjnlzxF8/sRF8rb3qljoZxMq3zuCYGwFYkiLe/v06ASMO5glTt5dumXyI01K5ncw/DDbYUfS6LpEl8DHW47gkAgIIILyKxXIuB7WA0t517ZWPGOJSqiED3+Xj9t5708n4nrR/LnT7V6iSLawqUVwa57sBFQMDfgQX7vAWygG2fxDEb2HYtJGaMZ8jfj4VDswvPioaxJYaN21O3yHWjYKOFAyirla76YjsgQbjQBRZbFuBhubS72K+bfSF3cl21AfNRLGXYt/odWgYIEszr/wl2tsyJ6dga9kSPBxdUF0daEmbzG/VD+HgWxQj9rQVs+LrdZXZld+VYbqzmbaP77mZtvNO7xqBWMnygve9l/ezIfuu2t2dVFM0
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(53546011)(186003)(6512007)(107886003)(2616005)(7416002)(7406005)(6486002)(5660300002)(6506007)(83380400001)(26005)(8676002)(8936002)(2906002)(4326008)(54906003)(6916009)(41300700001)(36756003)(316002)(478600001)(38100700002)(86362001)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YecImBo7TBjhnlq1R0UDfe3WPMDeeAux0j5Aa80z9mwPygO5O4ACrr+TSv4F?=
 =?us-ascii?Q?G5alY1Hn7bP2cDq/lgIvanBlaCkUgXB5uNa2nNErcWRjrTDiSuJUg49QRkzW?=
 =?us-ascii?Q?JWqHb6akdKYcVFhZUUm03zbFEbKtgJLavw8R1StaZwN44OXp03zfivD9vQrW?=
 =?us-ascii?Q?Lxq7YorOKoR4xmoFL+KHc9Uy+khwK2+DiOSn9VReUvjoHXTQI5w5bya/A/lf?=
 =?us-ascii?Q?PidjKCBRuExrLq5y+FGoMk/YwxT1QOtBo8JXdQMcaimsINRZguBxlKDOeQNW?=
 =?us-ascii?Q?kL5uHZ9KM0BGN2jA4hxSqiX66kp0Q+x9NiHkbTa7X62yL43W0jeLu+HS/8Ch?=
 =?us-ascii?Q?Ctolr93E2WqlDWjFqPESv46Azhg8HEzQjBr/+7/ubE60ofaK2hr/fqDPTBKj?=
 =?us-ascii?Q?/uaZlNEIFAko353ChdKzBDsps37tgZfPqH614njn23gkAfHjyjfTL7CyIi5e?=
 =?us-ascii?Q?+umqgNTeHbLThJq4TqeoXIgDzekfG4UXBs2IQ6K5HWt0QeodmfA9w+46ICAg?=
 =?us-ascii?Q?/pjZggFb73+ZyMY9lCY/TPwT9EK8Jd3VhlFjB7SBnE4fdL5Feaht2lC3pMWx?=
 =?us-ascii?Q?HIXsZ/0g8XTvWlW9sSuBqrRJgRhkX3mW4P8A6ZlKwk4Pu9k9DuNAez8ubQFV?=
 =?us-ascii?Q?3xvBAkM122ikLC5hsRZDf08DkCFzxkBO7eUUwBC4L3hPys+gb0tvUsO4vEy7?=
 =?us-ascii?Q?5KoBTJc8AdHsZEmDvgZ2Jyx8H7ANdm3QMZ1s+kALFp5/17Do0srEcx4krGDf?=
 =?us-ascii?Q?7NKfHcbS+I5fd4ICtynkj8GIS7q5hS2CQbJVPhqGm3U7QK0jMXrdOMk5j4NB?=
 =?us-ascii?Q?GRVcu/4f2cQaNMukeEEgMcccJRDzJLH1ii9SYY+bXnzNu8ftuGNICGGy4RGC?=
 =?us-ascii?Q?fJ8VuHPxN+YrtQ5OUTnTFqZpbqXYE6dqxnYSmiNvq4HMWoLXbaGc85V2ZQyM?=
 =?us-ascii?Q?PGF+/8l1EqgLk3MXQiXq+uc8lgdEoMKkQeLUfLVgHzroVDe2FG/CmMsjmwSp?=
 =?us-ascii?Q?aK4zTEehSB0mpUw+HDImLWlkqrp8sReAZF9qx8XaSwbYNQPGx26Ru3fRWrok?=
 =?us-ascii?Q?yUvxAiy7tCTu0RZzg7/RVcrdqi9qLatJNKiL4u4CCUDy6PyfzoOtI/aMgGVd?=
 =?us-ascii?Q?aZLFzLR4BC9cJPGoEML1qUyjSm5nUYT/7vEAZk0U4v4kJ8Gqzzmra6IPNKxt?=
 =?us-ascii?Q?JQnn1CS3JrFbUPD+y+w44T3lF+B0nPHo9c31PyKqT5vodWtlVPd86ty8LEI/?=
 =?us-ascii?Q?9dtbGpcJ3vBt74jPbT0KgvplZ1uSramV8aEh7Wf4wIU73PCjnEoSgp1W5kJs?=
 =?us-ascii?Q?cceecdC8komFGNjg4Y2IWalx4WHsazql3QfNjNWlCR1qDLVt8yGbsaRcnhIN?=
 =?us-ascii?Q?41/2j7Nym0RzT/S0egP0xl84IZNo6kEhbI+LAV7lQ78SdjEzS1ZtONt1ZNy7?=
 =?us-ascii?Q?/kI20vF+VGY3Go/iTvInhON3/ldMAKP6U62PYCZUHPfrBYp8+XY/lc7HRrgd?=
 =?us-ascii?Q?Z0Tpwdho2YRMDKqAkUEFXk5kIF7hKgeE/W0Pect7iW8Sy0ljRthUBtl6Z2qi?=
 =?us-ascii?Q?XEpAvZXTPCp/4MpjIn6hHvTfwoejdQt08SSSLq1Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94d4b22-9866-4047-962b-08db62dffb94
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:37:14.3555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aF35lXgZjnj928qSA4MdpshLRt7u+NOLIqHCPYwSICbdGgNTUoHNu7RYbqpgzYDR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7297
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

On Thu, Jun 01, 2023 at 08:47:28PM +0100, Robin Murphy wrote:
> On 2023-05-16 01:00, Jason Gunthorpe wrote:
> > These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
> > allows them to support that mode.
> > 
> > The prior work to require default_domains makes this safe because every
> > one of these drivers is either compilation incompatible with dma-iommu.c,
> > or already establishing a default_domain. In both cases alloc_domain()
> > will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
> > to drop the test.
> > 
> > Removing these tests clarifies that the domain allocation path is only
> > about the functionality of a paging domain and has nothing to do with
> > policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.
> > 
> > Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >   drivers/iommu/fsl_pamu_domain.c | 7 ++-----
> >   drivers/iommu/msm_iommu.c       | 7 ++-----
> >   drivers/iommu/mtk_iommu_v1.c    | 7 ++-----
> >   drivers/iommu/omap-iommu.c      | 7 ++-----
> >   drivers/iommu/s390-iommu.c      | 7 ++-----
> >   5 files changed, 10 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> > index ca4f5ebf028783..8d5d6a3acf9dfd 100644
> > --- a/drivers/iommu/fsl_pamu_domain.c
> > +++ b/drivers/iommu/fsl_pamu_domain.c
> > @@ -192,13 +192,10 @@ static void fsl_pamu_domain_free(struct iommu_domain *domain)
> >   	kmem_cache_free(fsl_pamu_domain_cache, dma_domain);
> >   }
> > -static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
> > +static struct iommu_domain *fsl_pamu_domain_alloc_paging(struct device *dev)
> 
> This isn't a paging domain - it doesn't support map/unmap, and AFAICT all it
> has ever been intended to do is "isolate" accesses to within an aperture
> which is never set to anything less than the entire physical address space
> :/

Uh.. Yes, I missed that.. Yikes

I'll drop that hunk

It would be horrifying if this driver was ever used with VFIO, we
should definitely block that as it doesn't meet VFIO's security model..

It kind of looks like all this is to support
drivers/soc/fsl/qbman/qman_portal.c which does call
iommu_domain_alloc()?

It looks like the only point is to call fsl_pamu_configure_l1_stash()

Thanks,
Jason
