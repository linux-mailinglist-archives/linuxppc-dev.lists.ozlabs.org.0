Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB61671F32B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 21:47:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXGrD2h2Vz3dxY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 05:47:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C84nYiZZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::618; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C84nYiZZ;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXGqL1cGJz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 05:46:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htnUhKvfSEAkOiIAqAKACCICRwiNQrj++qrceiZn64RVfjiOy5OD65e1WGOpdkfMcF3Lvcevl2kKh5w9zaMPt/fDdYq+16+BXhEo+V85kYAE63jQChK3BaZ+wmXF4f5zG38/W6yit7JeM84NKaRdndd7KPeR06YudFLrkDa+Cd6/yE2BPUWtiKR/zP8PDoauzLCOYd2T2R1VHVz6nyBYMOBtrldysLJUt28Ac25iR10aIRAoXd+R9qALWOZzJ+1Z3F2I7TGdpf2f4NC7mrp5U10aT7yVo8uJ/HBwOGC/KRYnX5hwuImoEcGhEV2R0DWy5bNL40/VGg35Kc5+V4Hk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fkDoKnEDNYwdXpJ9Mw4Vh8lN+5cs3jBdv2oLzpmekA=;
 b=lOfInLlbeZKje6GZ4Yc1+Mja88r2RX+MxXSXuqZwyJqP78B+gRcnCPSB9jMezs0XnlDHTK0tVOivdjXIRh1SjWdcCyAsPx9qqnqU3G0DkD+xooi8Ns1NP1eWjtaWju5ZmqyO3qUSSElMG5hqO0AhJDKsa8sjbkXI1oxb3uJq+3QCRxM7iN41xsSjv7ZY0E+a7Z9zhk701hhlpmFbfpB566q38FIvSBHcQ07xtLcpjdY0HOGPZny+RMTX+Qkm1EK/XfPNxQL2MR0rJ4fL3shlfGIQK6wzIQgAdPHg0ufxyf3uDiG1Ue4cjnZ9SKpP8pY0b7PZJS0CS9bhQQD92QHN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fkDoKnEDNYwdXpJ9Mw4Vh8lN+5cs3jBdv2oLzpmekA=;
 b=C84nYiZZ25uVglFH/9VDz72kqQ7tuqyQ3MpEqLtN6HSZWzckRP/VC0NtaveQWhrJ2y7Cs7rMEYeuk4iKZgIKPtZ7afOIxVT2Q0ik4ikkvuKd27sjdaUMbRaJm96ZfKJsL5hiptIa1aZfTmQ0CpAbVipxTfSbbvO7Cw1NNP0HTAyHAR4HFQ6OJ7NHrVafueP+5bFckbHSWQ80cNKMEQnfU4W1y0i85CaDqoTf122DAqthDdPb25778ZTBcdNzzv3h6BVqMoRNYBVFes+g8csYIjFL/1R3y1JYUbvo2hpk7xIEvXZLRAIuD/4oh2e238Yj91A0leIKRn0GHvhfx0OCDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB7648.namprd12.prod.outlook.com (2603:10b6:8:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 19:46:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 19:46:29 +0000
Date: Thu, 1 Jun 2023 16:46:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 09/25] iommu/fsl_pamu: Implement an IDENTITY domain
Message-ID: <ZHj1kXMMf5iqxXOV@nvidia.com>
References: <9-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
 <84aa0f5e-f13d-40f5-abe6-e8ac231e2d95@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84aa0f5e-f13d-40f5-abe6-e8ac231e2d95@arm.com>
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 9506740d-3a0a-4faa-1bd3-08db62d8e48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rNzspAoaYDGrnCiaY5ZzEx3y8z/pDjTL9hEPn9vweVGzMwKxAV+ePIyS5kBsTiQyXDCXl9ydRADftwjV6l6TAi9jkW+qJVTD1emWPL35fMY7OeIdl9NGj74+fpUHW2EDia6nufUskV1Y2nJ+fES97rjoh3fisyK19F1bVxpWWznF9zHRWv3VR1K+ZWYh5KVbxCcf7rXLMhVaGxfKDsirt67kJKY3JZ7YaJyYX17dkIsfBcK4XFpxpIjK7EV4bNJ6Lwy3FxL8JpXEkCM4u5c1ChhZ/bgrMJ7UU/9mh/giVoOOB0EdIdbENh5RM7EPE3VFwFtDo5YsZQAPLV0pjgDLAvzdwbiNZRCdPs0jyL5KSWFQwTIBZMinqaUX2aecEnvbfmd4YWsJTwLeU1/NfQ8VDysQNjqalG9k5BZOCIwQg3cDJdd618aYRICVGEa9Z/juLA0WtXuIh3rnVoHQUWUUnErY++ezWB9EnztA+wTfRkp1qU+2xx0QhX9pkVAs+3gDJd04SC6inwLWZDqYK/7JGiJKGZfyQnDO1UwaMegKaAVdkuBe9Q1ODXojNwsvxrLJ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(5660300002)(36756003)(6506007)(6512007)(53546011)(26005)(107886003)(7406005)(7416002)(316002)(41300700001)(38100700002)(6916009)(6486002)(66556008)(66476007)(66946007)(4326008)(8936002)(8676002)(6666004)(2616005)(86362001)(478600001)(54906003)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VxLEGwhByentOpJ37mhg9QqH4Og5EBN7LRD8DBT1S5SQoOVxL5CRrsD+xFVd?=
 =?us-ascii?Q?t9s3+Kxl9hQyFWaAGoqOVHxNNqYIpU/BH/kzJ+j3l9+FUIWque5YrhDxfTzT?=
 =?us-ascii?Q?9jya2EuaX1qs2Sh9ppUsQTsuhKYv1gbIg2wCUKtLJUM9uAL64KMoA9PL3Fl4?=
 =?us-ascii?Q?/gClwX70yiLfCOX+saz6Or/Oi19ldiWadscOuwrGgZfNwoYlZHBkHk27S7Bf?=
 =?us-ascii?Q?+4tymVJcBfHf0xR2p+hfpgt5MsCdT2T+84bMr0XNpUJcNFyaLW+iobPT6u1y?=
 =?us-ascii?Q?KiK3qgnNUwQxP1BJT/Bh/KcBV9I+tODMyqCkGWUnL1yrrlaK67D4+KrJW9wB?=
 =?us-ascii?Q?CiAY7rGlGgruQClB8gKRP7uQpaU7AQd95HEwE7+g01LFUzsAGWb1bVVy8qhn?=
 =?us-ascii?Q?+nfhZYC8cvj2SGkdyaLh19cA5XKDCtHsTvXfGZQEdyVw43LS7ZVqwKGyfJRx?=
 =?us-ascii?Q?Dj10McJFsj5fSZO5jm/xlnSwGP7OcykLkhtnX0AOcxD0SEl7jHGFgUMb5hwu?=
 =?us-ascii?Q?CsQdAmiJJ254Vu6zL3wdHSpeyxz9xR5ta3b+prhubcDIMuJi9TvRk0t89r9H?=
 =?us-ascii?Q?w0DiTAh+lQI5qJ0GjaKuIaKP7ex4XioCaHJfdJK1psWsUMcwhb5lf9aw5wNb?=
 =?us-ascii?Q?9KGnwe33zCr0OWI3ZCwLlybXO4ZmxqF0xoN/VICJJhRRnaMUd7VIVEvMIxox?=
 =?us-ascii?Q?0Ri0BLP81cV/+cZBnP2mSdJTHVg3JvHkeFLveQJFlDaB2zGQUdxdrjU4o3QM?=
 =?us-ascii?Q?amjuveK0rP25JgOcprjxohWVD8T717ufgX3Wr6oxEFduLujW3zSuyWVdzMnd?=
 =?us-ascii?Q?SZ8EyHcVlG+0B4xe0356CMN+ZCCAGPV05Pkkyphbm4xOQnptoxmmdwlIZYwd?=
 =?us-ascii?Q?TUYJe9b2QMxo6A7+FsT4H3074PJ72/MAWnxy2XuMoFsWehdHMh5oIcn7kT2x?=
 =?us-ascii?Q?XZzKrzgdo9LMP65cmtz+Dve5DRU3LVxx/bSagsolSkV7nB/H1Nrt3RUFn5e8?=
 =?us-ascii?Q?R41SuoVgi+PioJHIz/4y7SIK3PTskGLOSolTK7B9L3/aH3zTAM+cTKx46xH5?=
 =?us-ascii?Q?XHb9i8Bm1quZMBHjsWeRFyqIitOozeYUkdSXs1UqWziFur6JQ5tN9bWPoAkd?=
 =?us-ascii?Q?DiorpdQBQDZTlaic2/MjMEjzjYjbUVE+PscGoR1F0wGRztxE3b+Gn5HGSwC1?=
 =?us-ascii?Q?S+dhU/QDeXximhDJeI491q75184np25hS2CuPbnjJXJqXdb2rl8KjwQ1b5bK?=
 =?us-ascii?Q?xPdvEu2m/nvzdv544XbLcuf5dH4ZUBXece7tEp8/bPBr99BatASvjeoiJhka?=
 =?us-ascii?Q?M1HjYM6fWNLT3yiK7TEhU2jYg6ulxGHzm5zGTNNRD7XJUD9xcZiv5K8iN9KY?=
 =?us-ascii?Q?F6F4oaX24PedluV16Vl9YqQoDWQOifR7Pm20UuXuycqCK9LgCSrUf+C3GR8j?=
 =?us-ascii?Q?jyubI+9afvl0oBrfJFOUIY37Lz7xBmoi7/LB2yDvrzRh0uE2X/CwfX975pB1?=
 =?us-ascii?Q?j+tDF2phqmTBrFdY5RBxu67lPgVTm0fbK12b+Bzxuxw/NkuqbncOxKc7W1Gn?=
 =?us-ascii?Q?Rb9SEMnhRXpIQKX5iiQelUjp5GB47GsZ8mYBowhx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9506740d-3a0a-4faa-1bd3-08db62d8e48d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:46:29.2639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zv3ykiAnbD7PFAAgSjCktrY14ZwKtUi3JvniDUFjcdjA2z/ehIXKjSDpVI/OBPxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7648
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

On Thu, Jun 01, 2023 at 08:37:45PM +0100, Robin Murphy wrote:
> On 2023-05-16 01:00, Jason Gunthorpe wrote:
> > Robin was able to check the documentation and what fsl_pamu has
> > historically called detach_dev() is really putting the IOMMU into an
> > IDENTITY mode.
> 
> Unfortunately it was the other way around - it's the call to
> fsl_setup_liodns() from fsl_pamu_probe() which leaves everything in bypass
> by default (the PAACE_ATM_NO_XLATE part, IIRC), whereas the detach_device()
> call here ends up disabling the given device's LIODN altogether

Er, I see.. Let me think about it, you convinced me to change it from
PLATFORM, so maybe we should go back to that if it is all wonky.

> There doesn't appear to have ever been any code anywhere for putting
> things *back* into bypass after using a VFIO domain, so as-is these
> default domains would probably break all DMA :(

Sounds like it just never worked right.

ie going to VFIO mode was always a one way trip and you can't go back
to a kernel driver.

I don't think this patch makes it worse because we call the identity
attach_dev in all the same places we called detach_dev in the first
place.

We add an extra call at the start of time, but that call is NOP'd
by this:

> >	if (domain == platform_domain || !domain)
> > +		return 0;
> > +

(bah, and the variable name needs updating too)

Honestly, I don't really want to fix FSL since it seems abandoned, so
either this patch or going back to PLATFORM seems like the best option.

Jason
