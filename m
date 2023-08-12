Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A92779FBA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 13:29:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=onx72AgI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RNJNd2zb9z3cG1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 21:29:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=onx72AgI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::600; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RNJMh609sz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 21:29:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7OL79NaSPERuHxqswW6x/vlFVQQYjwDsjcPKfCxZO51p9jeKlBhE7eEyLe4KyaWcIRqsikJG5v54EjeW2w+EVjnZxhkQJB93PPoAYV7TIQkiPWDp1KcWaeLfGgSNxuv1silbTmYCjcUjh4EpO0Iv5vURXc8ROSOvxLXWWiW/uHHoVRppr4+33c+ivwggH2pIxX+u4e9Gr8N6Bu8qed3wBmQMpkuyuqtZWZJDrLS7LmViQfCItfRQBgTqb9oWgZ3LG01kiDtPtob2vbJPiTJwMrapQqjQ6ZNd5psRqOo0aKTblU+USPeS251f9dTnN1eN5u69ugpIj93STxQ5iwi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRM2xdLxGBDxpPvsRXUsdUBMz3A2DTbCI4aCO3pctCQ=;
 b=cSMaLisz1bU4d6meX/OjXa0svEZaXL8Ldi2jdqrFW1J7NFx10FaZ3sYdvyFosRkzP0fjmLpUKEt8QSZOj5qOpDw+mMCqJUyXgZbpgaGdSIvw/Ho8w/rA8rnAQciu1G7z6phfyHNqgb6guwmJ9rA7kMn6F7Zd/xNxGzI1f6Ldledg/v7dXoGYvCrQepfWuspqv8LS7Fu2mRBntmkwEmVd2xhGd0315i8mtiU6LAhBBF/YVEsmTsJOM4TIFNA83hffZ6zGsMuc5le99k6IRlBr+KR+jBYmRL+yiZeASP6Gxqaefgfz1vwx99yrBA8iXckLvoRYl2MoqDFfsaK2dAeMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRM2xdLxGBDxpPvsRXUsdUBMz3A2DTbCI4aCO3pctCQ=;
 b=onx72AgIMzeJMPmrW4EFaLgxY1ELWaJ0kEhq4/zPPfEW4oV8q0vGdvo/TYXrs1UwfVPBeZuvTmOm6PYFy1jWc8soHNZyJj4bSUSjcyB0WO00W8zldgsaknfSdarv8t1fURf74SnKgXflOO0329W1pJlFs0Yyz27zs6BYhd0tlBecXJel1ABCXBEenSbol4hR0Fbfo/omBBC0eYDdeWRJg0QBVbMnZScj/zkmDcMKDiLerd2EpC5CyDULIPiEeiqoylV5i83QKsseFTU28enCRdNe8hasxIHGblJgZRsAU9+5/G4hO5gI7/miQDTm5yiKX3kvJQse9PbxiEXjbf8/xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB7908.namprd12.prod.outlook.com (2603:10b6:510:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.22; Sat, 12 Aug
 2023 11:28:38 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.023; Sat, 12 Aug 2023
 11:28:37 +0000
Date: Sat, 12 Aug 2023 08:28:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
Message-ID: <ZNds4kejneylOYBE@nvidia.com>
References: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <dde32ea5-2b1a-1148-c329-3c52ffcb71a7@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dde32ea5-2b1a-1148-c329-3c52ffcb71a7@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0094.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: a25a0592-74f5-43cb-fe1a-08db9b274526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JcOjWbb1rmqWFJSeUlcP404Wd7uifK0tlwNuwW7iq5TunBKKrYpdz+YOnHquBQuscA7ZPSuyZyhdFUjXdQEmiQd11ogSsOlKrdjhN+7BxsdcG4pwjOJbgL2ZUnq745Rfu2u1YDJI0/Tl4OGgHYGD9APaJwLE0GqJdeB5hazTolGhpTkOo+6/NlG+AAo36k/fdwzyFaCSt9sPiJy7udVsq2ZpWJU/07hp3U+FItwGU58DL6oQB/M/IuIPkoxz4Bpiu2dvgCUM2Y9z7AVV/Rnili6fi0V8S8R65y+wu4DofepESZ7WKY2CkSt5zaPPh6e5ESHTMnn0fZ9EWZBWG8uRoWeJ4y419+WFd6AWWVX37pYtHnS6NsDOaVOm3cfTWnbLmoa3haKKaE+oSXixJDONH7lfXyravdrUp7QP2a9SFofMBHqUzhys5ybi/Ts7EgxElc1uf2I2PjhZQqPVaCIKpk4yIbigvunNZpxYXQU1iDlc7Xf9Aqx0IlrYMQGzTDQxvqjr40VSXvkxdMZl5jBE/fEQJe+MDQpXbjspD/1lQs7eIJdv5rv7w6Hg3oF7Z5Df
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(1800799006)(186006)(6486002)(6666004)(6512007)(54906003)(478600001)(2616005)(107886003)(6506007)(26005)(2906002)(4326008)(6916009)(316002)(66946007)(66476007)(41300700001)(5660300002)(8676002)(66556008)(7406005)(7416002)(8936002)(38100700002)(86362001)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YwWwAKFhrK5RsN1Nqyw4lu4KztkvFIwmLRUTXzJQJ/EcD85ScwfT+JCkKJzz?=
 =?us-ascii?Q?zTTwIGmmSPpB3pPfuMy5KnreVOiC5Pj6tep7x/pjluW/2Yav6+7rokQDLUvL?=
 =?us-ascii?Q?GEpqHNu+Qi0DORY5T6OJjHvyZarywDRXN6nySktJ6RPDPnzReVY8FTlaM1CH?=
 =?us-ascii?Q?qMo2iiPRpIq+9k9QVUz23JBgSOutvIP/tXBnmIbtdMxiSpX3B8ZYLJ56sUg3?=
 =?us-ascii?Q?ViYOVojWAJ7Q6zNgkFo6nsCtM4GZRLpwUsEBwfoEB78DDMaDqxtQsXzVO70z?=
 =?us-ascii?Q?NUphbViO1kaQgB125zNf71Nn6jGu9BGLyNzuOCB3zWjPCySC2Cwrn1bSq7x/?=
 =?us-ascii?Q?f9kJ1/h0M/T3vyxhehvyg5mGjwiLw1YVPUEZBNm0RhHJu02rIs2fe/HhUXwh?=
 =?us-ascii?Q?2T/iR0ahYtsIMxfzR2dNlvPmtzQAzJmCADFYfyY1Qxr7tmCYxeYPMtr65kaY?=
 =?us-ascii?Q?SqOxUEK6rHH8u2ba2JgNRNFU2SrLC6ET83ivFfr2T4EgeKnGNZZy4tnquRwH?=
 =?us-ascii?Q?r4BXsotiR0DDaSAcM/daGxxJ7xmTz4G/eJw3Imw+qHdYyeGREkYI+Pjk5s+Z?=
 =?us-ascii?Q?f8ifk6rZHR/3QPIhGB5YXqWWSFn+NtQmWUUmYRgrWSQuHYfFtIVXYqHn3Q9H?=
 =?us-ascii?Q?gbOgsveCPPNhZf/8Uux9WF73lxtOIKwzYq/P+o52UgEoyt5xBlApQGZr+92s?=
 =?us-ascii?Q?1ZtjWeirrD/LKrxAaxuzMnCNUSCNBHE8f9tT32aUCrV171riWaKcVdzBii5O?=
 =?us-ascii?Q?6fKlh105CgPspi3uBlIoQUghCAX+PxV3G5ORKJ4QSMVvSPTO46dJysJ+j+hA?=
 =?us-ascii?Q?xsPHf2xAeLRjThFIptIkie7wO/YiKGjt+dy9VQbMyGmqP9j0oRJA+FRvO/sJ?=
 =?us-ascii?Q?jipMDzQYbkVIMKA0mO8y4bpPh4Z8nzr4skCjHI/xaE22v+Z3mQhBBfUi++Lt?=
 =?us-ascii?Q?pe9VGZTKvCmJQy0y4NOAoNzhzDAv35WfZf25Inzei7+RFJzOzfd5Ngz8/4Dn?=
 =?us-ascii?Q?w2rIRutosXQWRIzZUWZzuwmtzlSSpX3982RFR/jsR/FzDF9xtgkl0iIaPOBZ?=
 =?us-ascii?Q?1GkCNRDOu6pfW3XDMRfGrjGVddn7shHWb4Jo+hwZYHYcslUnWX+y4Pf5qavD?=
 =?us-ascii?Q?Zgceibv7rJ6Ldndm7xppihzHLyZCRXZ6E9QwY5LaazXWBWvf6hXuwJJepslr?=
 =?us-ascii?Q?iqFpnhUtpzRYRdQZnkOXKiK8ero4iwTIDC08yohrBz4C6QYLYx1os3x5DE6K?=
 =?us-ascii?Q?eCOU0YPfc3ddlLiVRglaluIedyS1BDaSTo035kFUA3CLLtreanMJ5G5yt8Nc?=
 =?us-ascii?Q?OrRkXYlVh6SFTxO9AoO/PoY4NfhmIbzyYjkPscCD/FGtbpY2DA69OotzATkx?=
 =?us-ascii?Q?CAuRQWhL8iArbliw5JWOGclxpqnl0sQ58O7FI7JBn7K1hr5myXeKbsQPS+7z?=
 =?us-ascii?Q?pqIjJpF15WyuFMH+LxzkgItETZo6xWaajrtxRPawWIdAGSR/LwWpMgOjdzqd?=
 =?us-ascii?Q?hVd1yXaFZR88GM9L3iG1TyPJ8zJBdlbi724bKOxG6bHDlxwmjbeQIrhNqWOd?=
 =?us-ascii?Q?jDkex0akNDafDNCG4xDr31rqBbglmd8m+WdL6CeX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25a0592-74f5-43cb-fe1a-08db9b274526
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2023 11:28:37.4044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UedRypMQQ26XX5UGML5ZoRx8UpSgH+aDI5E+KzzOwJ7R825wYBkysyMCjd4Tr+hg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7908
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

On Sat, Aug 12, 2023 at 09:36:33AM +0800, Baolu Lu wrote:
> > @@ -290,6 +295,7 @@ struct iommu_ops {
> >   	unsigned long pgsize_bitmap;
> >   	struct module *owner;
> >   	struct iommu_domain *identity_domain;
> > +	struct iommu_domain *default_domain;
> 
> I am imaging whether we can merge above two pointers into a single one.
> It is either an IDENTITY or PLATFORM domain and the core will choose it
> as the default domain of a group if iommu_group_alloc_default_domain()
> fails to allocate one through the iommu dev_ops.

I think that would be the wrong direction..

identity_domain is a pointer that is always, ALWAYS an identity
domain. It is the shortcut for drivers (and all drivers should do
this) that implement a global static identity domain.

default_domain is a shortcut to avoid implementing the entire flow
around def_domain_type/domain_alloc for special cases. For this patch
the specialc ase is the IOMMU_DOMAIN_PLATFORM.

We'll probably also get a blocking_domain pointer here too.

All of this is removing the type multiplexor in alloc_domain so we can
so  alloc_domain_paging()

> Probably we could give it a more meaningful name? For example,
> supplemental_domain or rescue_domain?

But that isn't what it is for, default_domain is the operational
domain for attached drivers..

Jason
