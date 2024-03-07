Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 758BA87582A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:20:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o/LFot+U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrLKF1sv2z3vqD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 07:20:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o/LFot+U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::601; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrLJV24H5z3vYb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 07:20:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJYT7LCvYaHwT5lenWU7cEbdHRGyw7Z6HA/CIlEat83OzfwzdSieOth8D9yjg754nFYnUkgGg4iGP1j+pDvY5FzEVN+a3C7nAFJN+Q3+Vy4FQnSyQL+upI4ZKWO8qkejRsg+jHQ9TenvlaI9SdL60l+6ETuUC42awIrfumlJu5bR4y8YwKJdfQbt8rn7N7Mz1A7hxcMBrYPACTww4TmaKdmLV/kvfuCAsA6gDCmhXYa3wL2wOcUg7Itvgg1VHVzi1GONv3D152Uu9vVxF8iA7w7oA9+XWhDxQi5H3r4fh3zgefNstV/iU9gcAxyPRPUVsXB5Dq7O/rT6Y+fUZZ9vGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7SWntkteWi7F8aMSFSKPv6yd75j8pHpX8cR8E3acRU=;
 b=Upbl1fISG/ISSkqLbz7a+QBv+BpxRl1M8RHeHg4nbaVLJX53HkMLptgKBcNT26eOIfmNja/3Tnl4qypH2SRlYuqXKBA8T6d9VnvQWY6u+3tL1Oe93YZ5rd5UgT+qoAEkBxscuEkMlbbZI70L0I3WWZ/CtWWeLUPE3UR0xQQGC6modw3pf4l56NU6Dl3vJpUAGhPDIT5zX+heDTqgukAYc4wsAfjetU7tm1qzVPWlNNvveYJVysBM9GNkG8r9idDQ9KoYo+BH1+fGAAtY8V6dYNQFVBOUMrYQEAVPwbUyj793tnbKml6S5ncaADChIPc6wZqeZ17QhZ1fPVAeyHnlYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7SWntkteWi7F8aMSFSKPv6yd75j8pHpX8cR8E3acRU=;
 b=o/LFot+UfWI5YAg7qKFYHwmk9fjBcvkWrNhsAQfu1D9CfqCloTMPmbWmBIZKsRo/4rYNqz1A6oawh/FC/KFenxdry1XETeiL2SII0h4a/7qbTjbBCzAnkPPzoIasWqgAq+E2Sty83LYc1484YZV59FgVwZcW/LN7BRfYXEE1IFSjvgh6lLycVKFzvPjZR4IKonUl6fzJJb+HDBWtp7QTYLkBiiwXl34d9Mf4cRYDPrVAh/1tBwxrBfN5TG5Ivut9FJ97cQUzEHGXbDzKM4H1wljc4Q47zswjTUbRGrizvlqIMS5Zr/oh48teBn/GkYnzSgDDcGZIrPU8iGqPmHUmbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Thu, 7 Mar
 2024 20:19:48 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 20:19:47 +0000
Date: Thu, 7 Mar 2024 16:19:46 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH RFC 10/13] mm/gup: Merge pXd huge mapping checks
Message-ID: <20240307201946.GG9179@nvidia.com>
References: <20240306104147.193052-1-peterx@redhat.com>
 <20240306104147.193052-11-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306104147.193052-11-peterx@redhat.com>
X-ClientProxiedBy: SN6PR16CA0056.namprd16.prod.outlook.com
 (2603:10b6:805:ca::33) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: b23dd179-86ea-4105-b9fa-08dc3ee3ef95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1p4e25+HzhVgyqC1ZhwtES1qrTLOJNxs5VTf3YSQZTosiXJI9rSXXNyqYftqpmeHiMXg2Z298JO7cSmbQqtVmn3yWHPi8IRwU31nw3hnUSqKi1NTneBDu/TPRun2iHEL+IGX+I2JpFbEUSOh5IHM++6tqCRofT3SEJbUOu/ec4BEH7Ak8RcAqrSTd4ZQIijI7AtovWBc1gUz1P1DY6q7rksY/OVERuoECI7PnrD1rdtfQAZHDvCHA1HKwQF50/jhJV2AT4u6lAen5EVZpK8tF9EoyemMtJQIzvUn8KFaf80AfpxNti6hX7w6QbQZHuCSXn/4qKKp5TJdgdAdUTDJsUm0SzpR3X4RcK85Ivm68dLODgUO75MrRgW3SXs9pQ8boUUbgw/8sYN0wm5mVVdGBmx70CBYsV59M59O9kyiliAsrecrOB9TG+FfQVpC1XqUwsClA77+Q1UUBoC9pvZOYTMNhuAhxXKpvHPEQOB81Xfa6mvItC+EDnrhYMn4fcbg4eWK+I3ju+RC7aztC72BQ1tONVkVsi42VRp5llYVfQbtnpwRvnMu11HISNilLYu/oqvaYtOgVTU5mdZlm7Nb0RCOU1swo7IQ85nterfMQI4S00fDbd1ETTA34YAGl3OZmaIihBSf++wFRTEVPdJcmUBA3x4pEhlc9tmZgmgf7nM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?CqcN4IaHgu2B0IX7TuXnqA71VJwJtQDn7uz8yEPFssiXBEWjdTqUBfPeA7np?=
 =?us-ascii?Q?02Pa+1rdRs7Ye4Xk5OhzHhud1SWOLsPQlrvzhCUb2D9s7xhaxGTX7F2p0RJ+?=
 =?us-ascii?Q?rSpKYzU/YyjzVVxByzSZfyBxCqC+PD74NdxZW2JEL74uRERoD26LuJvzZB0Z?=
 =?us-ascii?Q?hjPBeNO83fNryhRJwcr0UzD0oC4Uo+nbiNX1T90nEmLWE2GXa1vM2MpAxtXP?=
 =?us-ascii?Q?QTbMj43pNWreT5ECM0gLAvAX0eMnJFyrgP3oR1nCvu8FH9j2ZoOo2trOZpSw?=
 =?us-ascii?Q?qAP/nrS/ISxZHbElx+pavdGNa1ZZn+Rb7r5Ju8Zm9UxkTtvx45qy6SSuMltf?=
 =?us-ascii?Q?o3dqYhh+Y3KKVufsb8aYyQ7qnvkqxA0wvv6cMOCxGBPN3ub7gfKhxe1ca9NS?=
 =?us-ascii?Q?bIOgFePGlWpCIkAa3gocJJJzkDnPpDZ+np6J+tG/qDjwhnsfwXOZ8/XO4nKo?=
 =?us-ascii?Q?fZ8g0BVm+BytxlJqLF9lmU4JnUVUhtsZEUGertJzcjQESaM6SJJ9qT/USjTM?=
 =?us-ascii?Q?zQV6tneamiZ7W0g/ZHUYmylWnZEy9yQUpMw14su26ihZrCa9H8HbwOECjy+7?=
 =?us-ascii?Q?Mp/lUN0mVJmOFBGHd00HkZbLWDksN178LC3XxIw2cVwA+dA42NNR9rEWBSHz?=
 =?us-ascii?Q?fcf1CDblEqnQLJyPnU1nONfERaCMdBTIGH83dz3rS55zSf6qZJcsKCXn1BXg?=
 =?us-ascii?Q?Z+l+bQY7aDQHaJ8kJdkr+t3gyKEZitGONWz6hWKd9sQF/7XwTp0yKn1RQrZo?=
 =?us-ascii?Q?MAi8LbYdFyU15woJYA0WBlYznUtM0lbcPAwillTyKlQlYNb2QXofYlW68j6R?=
 =?us-ascii?Q?rPXArVb2UBzatwECh2IJ8nmCRB2OvOQNgmltIkGAJsbBixxPQaTyWHuUai+d?=
 =?us-ascii?Q?jdIlKmGIaN6CxbfMOETa1qmZkbOTRpSZZqDIXner1t2IilTLeN3XsX6CXCiv?=
 =?us-ascii?Q?5qhVTn/bHawA0fXZ/QxjOx4yJJLlj2yuZc0QghZb3AbVXn5alyTyUFcHlXry?=
 =?us-ascii?Q?rl70xQRikP2jvrqErnrsvBc0yTLVwSQ8ftWi9UXsJRApRL4uqsLarsG7wPwF?=
 =?us-ascii?Q?VlnJu8X2X44rzFn4IW2YZtSyGMXnlQEeJzBF3urajxyEjNX9YX2fHuvQ7X36?=
 =?us-ascii?Q?/kuz5xWYZprd8z+kqH1FbcoTrcEb8yVOmaWHQOZ4go48IFNmxOIL9qrtAM5E?=
 =?us-ascii?Q?4P/XD7TBKXSsTFGdf3CGdA6Wdb9CEskY33WjHkTs3LJy2AyocsVjTUbbcFZq?=
 =?us-ascii?Q?18mFwl8XSIfmx9k/nIL1qZtqNqOnzV0FlvpBL7qbGJYTCQ7mka2mYQUtLB0k?=
 =?us-ascii?Q?hIb88hqfu3Haw7UkgsxMfhKw2dFt+Ut2BMsT/0rIaCxzesypql4S6kWyXh9b?=
 =?us-ascii?Q?XPTvQqJgWD1/vEScyXt2hjkX9N5sJe1mgq6Y82zMiU3BU5lbMApnYbaC247L?=
 =?us-ascii?Q?FZKdxq4UvmlQW0L99gr58cpLP2/Jh/yXYa3oybjsTHuZCWGSYo0legYFbvL9?=
 =?us-ascii?Q?hIzBcox5FZcJfoDPWqr8M+6v8A1PRWUdMa0R1uSfgPtl6FULHnj8Wh8q4jtQ?=
 =?us-ascii?Q?It5+zUd4BwwxxnTsLtY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23dd179-86ea-4105-b9fa-08dc3ee3ef95
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 20:19:47.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPsLvwfV83l84o8zrufE8pVEF1f1ehGRBGFK6FDVxRN7dlnPfuIJ1gJtt6Lj4u4D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 06:41:44PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Huge mapping checks in GUP are slightly redundant and can be simplified.
> 
> pXd_huge() now is the same as pXd_leaf().  pmd_trans_huge() and
> pXd_devmap() should both imply pXd_leaf(). Time to merge them into one.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/gup.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Much better!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
