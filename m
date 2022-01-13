Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523D448DA1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 15:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZS5j1JKkz3bYq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 01:50:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bBpA2T6g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.212.76;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=bBpA2T6g; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2076.outbound.protection.outlook.com [40.107.212.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZS4s5xWlz2yfd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 01:49:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpXdXiIuVOBH1VER+f7qlcgAGxnadaUY7R6+nb1hI7w5ASyfFy/X03jSYtTV6exe6seZaYYat+P0FATf7grGevTnZXjMhluUYpaJjrRTl316cEFFzVsHSJW2u3XN8iljf5POb5lEKV3cd+9RYqScVh2YuK0eL2KBLRsUcRCnvgyRdP9cOwOfnHN/KA5uq9lHZtG6+o8Tyv8HXF0uXZ0USS/A/udIjVH/impUGa9GbdWCf7tCfDjr+y/QHmd1mHQ2yG6BwbuoAxozdcSmwMQ9Baylb9Cz1FQEgSFzBbDzF7cjoBJqYjDH6swVr4XNw7zKRnXI9UjzDJPEsBeTOSmkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cdqk0sYZjkDODgaDFv3jDcm5D2KjCE0d4M0D4rGgIc=;
 b=in9A79ypNnEyUWVItK/jSWUtsh0KdfOWDT1KpIL/vag4WFYYhb9aP0mzqnHCx99N/xkpTSXYdl1Kq+icjdicaFJBV5fuv4LGVL5dXfEZm4PHlsbcN3WmKFVXN5r1ho+9c67psfg/yY0ebvjTOAcdbdipgh2TVZkgqB+SjsVyUevof+fzq3fZg90m2QJbqPzlizeBt83ROnd1UVcTPXsDBW2K36zPmGmgMqMzGGhJmBJytARomJknzxMqQvamHkapziXTENYMt5dB3/DKIgR6t371qCxZCwUrCEM9nOEYqRSdhvqTKjWgfDkKryCaWuBqXf23rr8XnuR8qhPnuegOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cdqk0sYZjkDODgaDFv3jDcm5D2KjCE0d4M0D4rGgIc=;
 b=bBpA2T6gVRb+1HAUYPwCLLEVNAOk2/2Uv0i0GENqFE1bTVhKEKY3EWle3OC1JaoRXkFoVSYM6dbw6gAGM1C8LtzVMaihckxVABYXlKop1YMZItlqVtO5bIUNDRv4ds12P9miGCtbIy6g9H8pgwieZgPbh+pX9You5OrTCbqdrI6tEO7GWRPFtWF8psfjcw80SixcnqTDgbVpXgAl8kYKBTWuxXzh1xQ7vJXsACd9tpNAMo6Bh5Gz6CsCH1zxlIjtjmIAfcN2s9zKeVEe6y46OoTyE5V+lMoRbzkogLwaBh6M249LR/2IfBEFyw28uh0GTT5hoOyYbzO4UoQnRgdLNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MWHPR12MB1264.namprd12.prod.outlook.com (2603:10b6:300:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 14:49:10 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 14:49:10 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v3 1/8] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
Date: Thu, 13 Jan 2022 09:49:08 -0500
X-Mailer: MailMate (1.14r5853)
Message-ID: <71FCD844-4194-4F8C-A6C4-C4E92B3640EE@nvidia.com>
In-Reply-To: <7dc078ef-70f4-159e-b928-34f0fb0ffaea@redhat.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-2-zi.yan@sent.com>
 <7dc078ef-70f4-159e-b928-34f0fb0ffaea@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_106301F7-B269-4F95-BAE5-92C98140A139_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR18CA0009.namprd18.prod.outlook.com
 (2603:10b6:208:23c::14) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc8ab5fa-6a42-4c65-17b9-08d9d6a3db74
X-MS-TrafficTypeDiagnostic: MWHPR12MB1264:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB126427AB2B396784517FAD02C2539@MWHPR12MB1264.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFX2pcvLBKV737GABryqR3zDwkygBjXQt0WcwYTbYeZ5cEDlJMV+BwFbiOGU60CeZvrq+vYQrBncVKGXHakstz1ocxMHfOtRtm3mGDNPyvAYz3LdLZCENXzS3007giitpZaMvGmem+9EADxQpKIHoa7+HJILYChN0SvL5RHqXpqTgZJuxxdEzNimeE8Jw9zK5DCAIGJ4AcdYFk1/hT6Zb0wjkmt82BPeVoCsqAPHxkotkuvai7yc2acxvYGUAwqT4Mj/sLpcfeHS3PEIQLCXum1Y0/CtzxZ8WQ0HoS+9cxHK/Onwd5B2S+CFlcL6xMwoRmMvm2az43QxxWqVpj8u+aGxoi1wxl2fsCyKne1+QCISevfaUi0soT+Vif6oJcPhiBdTojns8bTR1Lk83n8TlWEmsuhq//kSSGRQc6oE5Z5zlFMcydPl3GGH+oZZlIDvCKL7Z8bxp8tRzKvGrGQ2bcSFS68Ni+gH/oTMnUwc90djIXQ2e7/Tcp8XFO2hRZSfzGjF37C/dM8Q4Q4yhBdHbh2RUrGsKKzCCIrW3EAdUwVzb2C/ndkorhJ55pnBRW2tSbDPPz3pjVqQb1ct4sjuCf+dQxtzgcWeVGHxTmNAKUM9geOkaOPfMQhiF96WBRFfxibmiCbghRF4HJHZMyhoTz9GfCgAWQPL6SlD+rPqolriB4wHixwaA99gGMz9ytOJ9c0630QdYsRDzyKZ7E80rXUX/p6zuESeExtKpVIRYzwy3NyFxAM9UODruYn0Bq8dPfoba1o6RyLShoRRwXmFOosBkZTkO9NOAKiq+/pm8CxTyL8ab7Ph9am2UsM8poEh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(7416002)(66556008)(83380400001)(8676002)(26005)(53546011)(4326008)(66946007)(6506007)(2906002)(508600001)(2616005)(966005)(33656002)(21480400003)(8936002)(6916009)(186003)(5660300002)(316002)(6512007)(38100700002)(6486002)(86362001)(54906003)(235185007)(36756003)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oy6sokJh1iHSl/Agcdj+5aKA9ND4lBun50VBCtKFPj3no1WvWFwbVgrHd1Ow?=
 =?us-ascii?Q?USk0PJmKi7C7w/kUSM1uYSeuv5AdJaNjQHhHuefyl1iO9KveY5OCfnSc0xXa?=
 =?us-ascii?Q?I9XWXW3f+6JPfUkpnOX7VHovGH/zqyxelPPmnPYypMBcpnCjvX7pVriEwPxw?=
 =?us-ascii?Q?Kg9NZ2C6EFYOktjOpb3B9kFTM3m8EC9ZJXLcmrbCKR4PjwJ3iLT4CoAWtOGD?=
 =?us-ascii?Q?4CyOvR1+sTYhah13o8ta2W5LmY8C9URQYDzTQQXb2CoKOOiUCbH2kXQUNByb?=
 =?us-ascii?Q?Qn+sRXy8IoiskEeyMOjWlgPMDx9UUQDSeJjQVIhYlB1zCL1kCAIciuE3aRoT?=
 =?us-ascii?Q?Q2zo1Ljoul9tpsSCH+52SQZBcsCiVfN+8eBPhH8vDmVO+BxekNmUMkV8Hp5Q?=
 =?us-ascii?Q?lWvIr6jAc/sL8aOYfbqkMLXBqW/1FZwsYBWRizSmGBgdlcX2xuJbqLXz/cuG?=
 =?us-ascii?Q?3wWeK0hd+puRwI4rpClm/4keIYJI6+RWPnck9ekfLCA/KR+YykXqntu2GD9s?=
 =?us-ascii?Q?g+1iD3Gp9PRBKyd9wJa5ez6KZcfbfI8HtIv/i+Upo4OZ22gmY9T/qZ/TW0/Q?=
 =?us-ascii?Q?T0VJ2N4xTwazeMHmMwjARplI9YJSUvlSnQkS7+ZznLZfv7jMjBkQxQeHB64N?=
 =?us-ascii?Q?GH8n84RVDyflRsLREITeB826Bdyzo0GbX7y3gj2t+/7gqmV5xs5bvZ6KECT7?=
 =?us-ascii?Q?/nUH45xkA9DPC+omhJhzPLzvQ1Y+/GXU1sWUlIpEv+Dev+edzBBu/dAMn/TM?=
 =?us-ascii?Q?uscDHwiBYKy1S4VMRQBDSZoTZA6AWZcyMxLwvvJkVQl4JgZcYMLu9PDqZ9XV?=
 =?us-ascii?Q?QhVqPdP7RXOp1wBtbN9TJRtiwaNvhziEjJgUXoHvF86mrJJdNp5ItafHkQkY?=
 =?us-ascii?Q?nHRl7F3nur11j/TwNEZRB/i1yZOGZaDbY986aQDnNRiGtxpLJoHNeE+0yf71?=
 =?us-ascii?Q?ODKp2nuf1m11MN5SP22sXpkv530+/8nF2MUSDdxz9VrDtTPuFn3SuMBLKdIs?=
 =?us-ascii?Q?7kcZMmdsV4dGtMJ316UyXPMUEP19KLI+6+O1dFC/jRONFxlCv/vLBR2IJoTW?=
 =?us-ascii?Q?ey2EIvMkX/h2WE2gBqrPQNunjjstnltOAjdZ+PVkH66Bcf5UqQQct4AdHESQ?=
 =?us-ascii?Q?pfgfpaSuT5xLxvnB0vlWNdiAMniPs3BEi0au9KXHm9dTaIOUJwDwsuVJmnXx?=
 =?us-ascii?Q?5LhXScNwqdsxETfb55ebv4g6ZY25+3ZxwLAWRqI1CB2vt1NhJWSKPyImvVz0?=
 =?us-ascii?Q?s5MSyR5AjrGykAjCPu/L1HDvTIHqVhFTn6SZZY+KVlqIP2GSp3mSOVPgiPX6?=
 =?us-ascii?Q?USbpJsAtEteg1D1wMa0M8xzHjM/Y3ujtWxcqzeG9kbUHc422wAUSqQLmR5l9?=
 =?us-ascii?Q?D4tWb1sxIMEXnIK5IviZWl2RcWnvYQ9EKh6nEUogPl9B+7eZvU8TMwIhv79+?=
 =?us-ascii?Q?OHSlZbHhlyLZdpCQO+pKSC1H/bqJjyD12UBN3zPEiY/UterNy/LHxb13KRW3?=
 =?us-ascii?Q?iuvxpWqvoRn0gsA+nangzilHEWmxaQSoxiFxmzdtT/lQXu5W+bEdFG1TCZes?=
 =?us-ascii?Q?Hrg7MNff/Xgrjqdr9ik=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8ab5fa-6a42-4c65-17b9-08d9d6a3db74
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 14:49:10.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDDLqaHXfgTYaXIHBnJFkzCPCQJIh8RiXtPxJKQ2Jhcemm2nCJmqfYUUuhmuL3Nj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1264
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
Cc: Mel Gorman <mgorman@techsingularity.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Eric Ren <renzhengeek@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_106301F7-B269-4F95-BAE5-92C98140A139_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 12 Jan 2022, at 5:54, David Hildenbrand wrote:

> On 05.01.22 22:47, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> This is done in addition to MIGRATE_ISOLATE pageblock merge avoidance.=

>> It prepares for the upcoming removal of the MAX_ORDER-1 alignment
>> requirement for CMA and alloc_contig_range().
>>
>> MIGRARTE_HIGHATOMIC should not merge with other migratetypes like
>> MIGRATE_ISOLATE and MIGRARTE_CMA[1], so this commit prevents that too.=

>> Also add MIGRARTE_HIGHATOMIC to fallbacks array for completeness.
>>
>> [1] https://lore.kernel.org/linux-mm/20211130100853.GP3366@techsingula=
rity.net/
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  include/linux/mmzone.h |  6 ++++++
>>  mm/page_alloc.c        | 28 ++++++++++++++++++----------
>>  2 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index aed44e9b5d89..0aa549653e4e 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -83,6 +83,12 @@ static inline bool is_migrate_movable(int mt)
>>  	return is_migrate_cma(mt) || mt =3D=3D MIGRATE_MOVABLE;
>>  }
>>
>> +/* See fallbacks[MIGRATE_TYPES][3] in page_alloc.c */
>> +static inline bool migratetype_has_fallback(int mt)
>> +{
>> +	return mt < MIGRATE_PCPTYPES;
>> +}
>> +
>>  #define for_each_migratetype_order(order, type) \
>>  	for (order =3D 0; order < MAX_ORDER; order++) \
>>  		for (type =3D 0; type < MIGRATE_TYPES; type++)
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 8dd6399bafb5..5193c953dbf8 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -1042,6 +1042,12 @@ buddy_merge_likely(unsigned long pfn, unsigned =
long buddy_pfn,
>>  	return page_is_buddy(higher_page, higher_buddy, order + 1);
>>  }
>>
>> +static inline bool has_non_fallback_pageblock(struct zone *zone)
>> +{
>> +	return has_isolate_pageblock(zone) || zone_cma_pages(zone) !=3D 0 ||=

>> +		zone->nr_reserved_highatomic !=3D 0;
>> +}
>
> Due to zone_cma_pages(), the unlikely() below will be very wrong on man=
y
> setups. Previously, isolation really was a corner case. CMA and
> highatomic are less of a corner case ...

Got it.

>
> I'm not even sure if this check is worth having around anymore at all,
> or if it would be easier and cheaper to just always check the both
> migration types unconditionally. Would certainly simplify the code.

I will remove the if check below, since, like you said, the check is
no longer a corner case with added highatomic and CMA check.

>
> Side node: we actually care about has_free_non_fallback_pageblock(), we=

> can only merge with free pageblocks. But that might not necessarily be
> cheaper to test/track/check.
>

I agree that what we are actually looking for is free pageblocks of these=

migratetypes. But tracking them is nontrivial.

>> +
>>  /*
>>   * Freeing function for a buddy system allocator.
>>   *
>> @@ -1117,14 +1123,15 @@ static inline void __free_one_page(struct page=
 *page,
>>  	}
>>  	if (order < MAX_ORDER - 1) {
>>  		/* If we are here, it means order is >=3D pageblock_order.
>> -		 * We want to prevent merge between freepages on isolate
>> -		 * pageblock and normal pageblock. Without this, pageblock
>> -		 * isolation could cause incorrect freepage or CMA accounting.
>> +		 * We want to prevent merge between freepages on pageblock
>> +		 * without fallbacks and normal pageblock. Without this,
>> +		 * pageblock isolation could cause incorrect freepage or CMA
>> +		 * accounting or HIGHATOMIC accounting.
>>  		 *
>>  		 * We don't want to hit this code for the more frequent
>>  		 * low-order merging.
>>  		 */
>> -		if (unlikely(has_isolate_pageblock(zone))) {
>> +		if (unlikely(has_non_fallback_pageblock(zone))) {
>>  			int buddy_mt;
>>
>>  			buddy_pfn =3D __find_buddy_pfn(pfn, order);
>> @@ -1132,8 +1139,8 @@ static inline void __free_one_page(struct page *=
page,
>>  			buddy_mt =3D get_pageblock_migratetype(buddy);
>>
>>  			if (migratetype !=3D buddy_mt
>> -					&& (is_migrate_isolate(migratetype) ||
>> -						is_migrate_isolate(buddy_mt)))
>> +					&& (!migratetype_has_fallback(migratetype) ||
>> +						!migratetype_has_fallback(buddy_mt)))
>>  				goto done_merging;
>>  		}
>>  		max_order =3D order + 1;
>> @@ -2484,6 +2491,7 @@ static int fallbacks[MIGRATE_TYPES][3] =3D {
>>  	[MIGRATE_UNMOVABLE]   =3D { MIGRATE_RECLAIMABLE, MIGRATE_MOVABLE,   =
MIGRATE_TYPES },
>>  	[MIGRATE_MOVABLE]     =3D { MIGRATE_RECLAIMABLE, MIGRATE_UNMOVABLE, =
MIGRATE_TYPES },
>>  	[MIGRATE_RECLAIMABLE] =3D { MIGRATE_UNMOVABLE,   MIGRATE_MOVABLE,   =
MIGRATE_TYPES },
>> +	[MIGRATE_HIGHATOMIC] =3D { MIGRATE_TYPES }, /* Never used */
>>  #ifdef CONFIG_CMA
>>  	[MIGRATE_CMA]         =3D { MIGRATE_TYPES }, /* Never used */
>>  #endif
>> @@ -2795,8 +2803,8 @@ static void reserve_highatomic_pageblock(struct =
page *page, struct zone *zone,
>>
>>  	/* Yoink! */
>>  	mt =3D get_pageblock_migratetype(page);
>> -	if (!is_migrate_highatomic(mt) && !is_migrate_isolate(mt)
>> -	    && !is_migrate_cma(mt)) {
>> +	/* Only reserve normal pageblock */
>> +	if (migratetype_has_fallback(mt)) {
>>  		zone->nr_reserved_highatomic +=3D pageblock_nr_pages;
>>  		set_pageblock_migratetype(page, MIGRATE_HIGHATOMIC);
>>  		move_freepages_block(zone, page, MIGRATE_HIGHATOMIC, NULL);
>> @@ -3545,8 +3553,8 @@ int __isolate_free_page(struct page *page, unsig=
ned int order)
>>  		struct page *endpage =3D page + (1 << order) - 1;
>>  		for (; page < endpage; page +=3D pageblock_nr_pages) {
>>  			int mt =3D get_pageblock_migratetype(page);
>> -			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
>> -			    && !is_migrate_highatomic(mt))
>> +			/* Only change normal pageblock */
>> +			if (migratetype_has_fallback(mt))
>>  				set_pageblock_migratetype(page,
>>  							  MIGRATE_MOVABLE);
>>  		}
>
> That part is a nice cleanup IMHO. Although the "has fallback" part is a=

> bit imprecise. "migratetype_is_mergable()" might be a bit clearer.
> ideally "migratetype_is_mergable_with_other_types()". Can we come up
> with a nice name for that?

Sure. Will change the name.

Thank you for the comments.


--
Best Regards,
Yan, Zi

--=_MailMate_106301F7-B269-4F95-BAE5-92C98140A139_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmHgO+QPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKwCEP+wYx+ZZRTcIDuAF3c0kLGitbTt+V/ZNT3Yc/
Vv7k4l1ppUqNgMAB+/clsoA6QVTri3rQBih0gwq1l0dHvwoTrYtEZbSKIRMe4qhQ
MgYLi7Mn01mA0I8Q3y+AjFg0RkQNLeIaGxmiCJrIF6yMFlda2BV1gc0wOXjGa/Mh
yut4dqogGSMy3scQqb7Gq6SII3Gsi57Xe4XnmgIhRzZj+U+gF4FaiqmdDFV6R5rU
dN3U8GOt9RERkppzNQWK1A3vaDxxtrFUWZ6vEhEP8cmml4Am7EiGgw4Du2Ji5xzM
F9SeCAvmAS8JrEY0XGxnXkhK2q4PvoZpwZiIQsjgip9ad+QHBWB28RSkj2PCMWGb
fMnVPcrgjpvpb+3dnWPTC3DVtyE2aeucyieg5K8Ev4xxEvdbn0i80AKp8koJ51Lu
MRTjD+rP4Y3Rq8zAcpu7mzIPV+9xgwqO19TmGKCE3sByjIqJK/qXhFQYxfjuTY1r
Uce08gy6Ul069So8YR7wSSjXw9hMWyisyomu7p1OIVrjXYZRtPHwwqLPk6tMLwi6
KuvPsraCnK0zwA0B/XVRqU1w3nS5F7oO3xKgVNQM0M6+O/+2dKUDvDR4E+7d26lk
v9Xq2OqZkA9viPoo0oWdAc/q4sjxtXeVorJ/uU0vh4NuPVMandprt+5DESIftUTn
b3+IGhlL
=x2Yv
-----END PGP SIGNATURE-----

--=_MailMate_106301F7-B269-4F95-BAE5-92C98140A139_=--
