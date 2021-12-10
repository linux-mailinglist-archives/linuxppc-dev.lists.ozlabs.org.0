Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FEB47040E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 16:41:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9Zr94xWWz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 02:41:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qZwAe0Sc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.100.52;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=qZwAe0Sc; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2052.outbound.protection.outlook.com [40.107.100.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9ZqM5882z3053
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 02:40:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMIXVjxCxTOCYbb3AU+vEJpHi6ijgBRa6V/XvEYzC5fU6nm45GRvp3+aajQI6yNSD65CRp3tRhdSCKs7L2/AQJI4QgZ/shCDMxXgCLcGOS2bsCIWComixp/wse8chlTw2lQnNRVGJZ6bZEAjsGBfB6oE7cikfYx7cYOmR4RNWMyhRmpOicp6hpmh7sRzOTKqjo1bKSLtgfDdkXX0NZ3xXM1zxz/qM17QUr/68w9Z/TdJhK8t0AZXC/ycDMvMRXzpBU7XqvJqX/KAx5kqfskk7q7sVXXUda3Gn1p/DS7ZjQzPsLFBl/NYL//Fbdc2Iibw9MTSXXoLgLBqlLL4J1q9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=700W4SKEcW/2ypfv4mVl+ahdfvqJU2wZ++Sh0N4hFAc=;
 b=m0Nl7BBkVqJRWxZvQ7O559en3SxG+AeT35M1hlAgJw5auUPc5HC0f/iI9qwBnv32Jn9Ue6oNxaCaHbWu+wCmgnuMEFlsToxHJDWzbtlAtLgaw+Sv+WgWhSRtAhLrWIw1WQ7/2SSvSLj2eI1xL5NXMpNSt00gsw2Qt+PAzGSBf7/ybJSpAmJPkwa7QLdJzkCIvoyOcEzGZzwZrus13HI6DslvYxezUtRk+j3YeIurC3pA7TASUDgxrS1E5cFrFy1/aILwxUJtcvoV32lULVkDMSQw2ooLlx1UI+0owcqHWzAfJBXVeJjl1aaAodELvBr/di0tyU6ihHrs7FD9WLjYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=700W4SKEcW/2ypfv4mVl+ahdfvqJU2wZ++Sh0N4hFAc=;
 b=qZwAe0ScfJLxB+MEvI3NbkRh+NpJx/xiVrOVE40nVulwcthaUOW1LE+CVrsvc7eQbfouDCOscUlUeH45aGK/pCA+47RGcJ0Subb5nBj8OrwRBktvaqkqxqdWDH0jmZQYpF3i1HXWj2ezfXVFI7+yI178y4Pr4XoNX1JyXpLJegv8JgXhiTzE/SvkJ9KwAdA6XX0cydjyhoWD++imlFfMwNxLI2IPG1/WkEU1n5+6qVjXrLVcCKZ3CCNAxNdN03xJJZKuAjSYEEuyyWqjjUxhWmxSdFNzYz/hE23YE0wmzrQ3wlZxqAcrPIPMlxaAeaYzMYEAJnJ8WMz1juIM+0nYFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB3663.namprd12.prod.outlook.com (2603:10b6:208:16e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Fri, 10 Dec
 2021 15:40:10 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 15:40:10 +0000
From: Zi Yan <ziy@nvidia.com>
To: Eric Ren <renzhengeek@gmail.com>
Subject: Re: [RFC PATCH v2 1/7] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
Date: Fri, 10 Dec 2021 10:39:58 -0500
X-Mailer: MailMate (1.14r5852)
Message-ID: <4640ADF8-F5F3-4CEF-A849-8F8C28F17DD0@nvidia.com>
In-Reply-To: <2926b360-5204-45f5-e1a0-e260214f8dbf@gmail.com>
References: <20211209230414.2766515-1-zi.yan@sent.com>
 <20211209230414.2766515-2-zi.yan@sent.com>
 <2926b360-5204-45f5-e1a0-e260214f8dbf@gmail.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_367F6B3E-C529-4EDC-9577-0483D3FAF214_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BLAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:208:32d::11) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
Received: from [10.2.53.3] (130.44.175.231) by
 BLAPR03CA0036.namprd03.prod.outlook.com (2603:10b6:208:32d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend
 Transport; Fri, 10 Dec 2021 15:40:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a569b6ce-cc64-4105-7d33-08d9bbf359c0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3663:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3663285BA0E8A2EDB3A7D932C2719@MN2PR12MB3663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VtEmKNCwO+ulytGUQgzw0/8wzl9wXEUSH+lCIEsGtiXJliIibtzozbaQHyWss0391Bdnfu/YXB/I3LN0qwc3M+UDgMHUqe2bZlSQ4gNgeHSHBLWpIlPaCqoaGdtaAdvRALxn8DGKsr9K/wKQHtA5qsdgN7i9GZhRlEXMzTjRB+Xy/XFU7ZhgYSafsTga8dPuKHPE/iptML6n/7ZPq6pcEPDkQIsv+HTtF2EuiAWCOL2Z+xNhRipofYJYGrbS0jj8ajvROPNxLjxUOcipIk4AQsqxG9WX7q5aQ0tZK+eKvd6s0riB96SacNormCiVEl5hv46LksPC8eH+EFDeVporS0Y8dKgvIFM5woUT24FMNdK5WjzXN6BMW/xKuJaeGcvzt/VrXA1SupH6kAp5NkROhG6RrctXMOlZVxao0X84343W0JXTJI2iq3QVsCSoEkVHm9C5Y05r7F5dw6XyZr/uvNQzpq9mpatjE5wN3ptaMANYzu2blti3/ZCzJzXH41TpXFDAJgIe2xRaE2a1daYx7tVWxI31R96eyjWu/6PPrYfNle0EMtAp7vjUpJc6a/TFnO/9HZH4pOhytFYgp/yefhBu56ESjzuber1XB3p8Evv1y30wOvN9z26Kid1V6Drcj3DXKadmXIdvZAz82S578xPAJJrGQ5POvxtD0mkcz3QE6zBNjmlU6nCtV0lbzK2lKJzGV/np2GppX4yz5EJN/2dc8IJWWvT5+ohOdpOXPa9AHyiQVrtJb7qzvc1k3IzeZcecsJ70ZI73xpkhXb//yu+dE026ShmCjIWEkS5lyl/svuF29PNaxyVwC0ZXt9NK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(53546011)(66476007)(4326008)(66946007)(5660300002)(38100700002)(2616005)(956004)(33656002)(235185007)(2906002)(6916009)(54906003)(16576012)(33964004)(8936002)(508600001)(26005)(6486002)(21480400003)(8676002)(86362001)(186003)(7416002)(966005)(83380400001)(316002)(36756003)(6666004)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk0rRTJQekg3MG90enZBTnVBMkJaWWRuOXc1L29NZGw5RHVHUnp1WW8zK2VB?=
 =?utf-8?B?L0NNYWUzTDdsaU9wSHdTdGdwL0tzYnAxQ1hQM3NRZ1JMMGVlU3FkSFVRNWhl?=
 =?utf-8?B?S2VnMkFCM05PSVQvWXo0bFZxK053dm1WWEI3TUlLUzVwQjYzbmFqTzhQd2Nq?=
 =?utf-8?B?c1pxK3lUbEZ6R1JPME9IaFAzRjg1ZWNLMURKYktBQWdtKzY1dlNscUludHVk?=
 =?utf-8?B?OHRHNmYwRTMvc2pUM1Y4dHUvYnRTZktxM2duSzdrcmdLRXpUSlZJL0lzZVRv?=
 =?utf-8?B?VldzcGc1OFdxb2NtbEFCZldSVW1ldE9sMDFaL0hXNi8xT3RrZmNvaFRqbVpD?=
 =?utf-8?B?c2RvVzRzdGI0ZXBPN3NRQVVUSm5XVitCNUxSRjJqQmI5bTI1UWpsS3RGYmc4?=
 =?utf-8?B?VmtINlZ2MVVSWVJ6NUNGK3ZnWnhyWTlpOXNmTFJaNWVJL2ZUSDZqbHg1aU5Q?=
 =?utf-8?B?WEZ1VjhQRmQ1VXlpVFFDQytHZUd6VTlrUHdCWG93alMzM0w3NThEZlBuMytN?=
 =?utf-8?B?ZSt0MmFpaEkwWDNuWGJDOHE0TEkzd2xzN3EzY0pZRTlFRUpRUVcwTkE3VXYv?=
 =?utf-8?B?cmpnQ2JMdXg5Q1hWaGg0Y2MzWDQ0V0x6MGczdTFFRnBKMW1CeURXYnBNQUV4?=
 =?utf-8?B?UEpnMEtuODRNZlFiQnY4ZkwyUVhJbkZoUXpheVRFSDlxNzgyczRoYTVYRGpa?=
 =?utf-8?B?YVkyaTkweUlzQmdKNTNnRE9aandrVW5YU2RXLzkzU1VKNmhVL05rckpEQlRW?=
 =?utf-8?B?eXFwalN0a29UTmlxaVNDaUswU0dqcU5xWnNEd0Y0d2xDMEhSdlQzajZSOVdI?=
 =?utf-8?B?TDFMTkdSRlJaMisrODdxV1lFV0FjeE9kMDJYb0Z6VTVzRVkyblAvNVhvYytN?=
 =?utf-8?B?blEvN1FLeTYwUmJWUXV5QXZJVU5uQzJTdWFWMjlob3VKM1h0VnV3K0w0Y2tX?=
 =?utf-8?B?ZHlhemVCam1xQlF0SVdtOGlneGxIcTNtd3BDR05raU5DaElSY0Q0ZGltVFFa?=
 =?utf-8?B?TjF1ODBYTEE1andBa09PYkhuSVd6NlEwaWpDZDVLcjR4amRrRFVGUkRBZWJw?=
 =?utf-8?B?TzY1NnBhZGs4SWVIZ25mNmJZSjB4T0VMTnVOQjNtVXRGZk9qUSt3NGlLbkh6?=
 =?utf-8?B?cGdoczZMUllTWU02V3A0M3JrZEttczY3T2tCZE5rUmpWdEF3ekhZcWJ2bCtz?=
 =?utf-8?B?WDgrQ2dIS1Y2bnJRbkswZ1Jabi8zdU5pd2pzVURRRU9RbDBhQlQ3K1NoMENV?=
 =?utf-8?B?MjduK0ZkN0xROGFYS05EN0xPSVhUelVwWGkrZjN5cE1UZnl2OVgxQno5Umgz?=
 =?utf-8?B?RmYwZk5ybXNoYUI1UUZtWTU2R3F1bjViUCswWllsZnJIYmZQYktndmgwOW9D?=
 =?utf-8?B?TVBENGQ3ODJQa2lGemhaUnZPMVExTjF4MGRVWnhDS01pTHM4WU5pMnNlWGVF?=
 =?utf-8?B?RmlKL0FmcExiMXczRFFBSjJyeHEzN1o1VEN2YU80dkJnV2MyRjRYNDVPaHJT?=
 =?utf-8?B?UkFaQys0TlpsRWtNV2ZRbmxUQzZOQk9nZkYrVWxWRG9mUHNvbEpGUWR3THlk?=
 =?utf-8?B?UThLRVVVeWNqd1pJSTliNTNqSE4ycXd1S3JFeUM4ZEowQ2dRNDhDdEtjNENE?=
 =?utf-8?B?OXFhODNoelJmdEp6TkZzRk5XUGhTcENhTkR6WkFSaUU5OWJnQ2p0K3BqVFZX?=
 =?utf-8?B?UzlQQXIyWG1MRndCSmlHM1JHK0hUcHc1bXNXeDJscWRoaG0vNUVuejJ3WGR1?=
 =?utf-8?B?TW02QUJxREJaVzBGQUJWQ01jTjNmRjQvaUpYa2lSejVJdnpFT1FpWjBBRXEx?=
 =?utf-8?B?VkNsbkxydXpCVXBQaFNlZC8xemlVV1VpWnBnNXB0bTFqY3VhNVRwc2JRQy92?=
 =?utf-8?B?YVZmNDA5Q0FSMmZMNWFScW1wZkNkV3lYR2VIV3FqOU5LRlVvbUJzMTlMbFN2?=
 =?utf-8?B?eVJYUTNZWUZzL2cwNWNGempCazFkUlk5cUQrVkpDbWtOUG5JOTl6NFFaNFE4?=
 =?utf-8?B?blo5aUo0cmtOOUMvZ054WDNGKzZNZTErTFhOK2QzT3MzbUlRQ0RvRURwVXNn?=
 =?utf-8?B?TVNLazBaV0Q2cUhjWFp6OFZKU1BXQjVtYTFvOGtCdC8xelVVdGxkWFFLRkZz?=
 =?utf-8?Q?qNRk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a569b6ce-cc64-4105-7d33-08d9bbf359c0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:40:10.8276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSO4HYAHQwtrmNz4TlgOMFQGwmeBSA64DPpbZd05NIvyzXPdbLNf102ds4pNTpXm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3663
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_367F6B3E-C529-4EDC-9577-0483D3FAF214_=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Thanks for looking into my patch.

On 10 Dec 2021, at 2:43, Eric Ren wrote:

> Hi,
>
> On 2021/12/10 07:04, Zi Yan wrote:
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
>>   include/linux/mmzone.h |  6 ++++++
>>   mm/page_alloc.c        | 28 ++++++++++++++++++----------
>>   2 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index 58e744b78c2c..b925431b0123 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -83,6 +83,12 @@ static inline bool is_migrate_movable(int mt)
>>   	return is_migrate_cma(mt) || mt =3D=3D MIGRATE_MOVABLE;
>>   }
>>  +/* See fallbacks[MIGRATE_TYPES][3] in page_alloc.c */
>> +static inline bool migratetype_has_fallback(int mt)
>> +{
>> +	return mt < MIGRATE_PCPTYPES;
>> +}
>> +
>
> I would suggest spliting the patch into 2 parts.=C2=A0 The first part: =
no functioning change, just introduce migratetype_has_fallback()
> and replace where it applys to.

OK. I can do that.

>
>>   #define for_each_migratetype_order(order, type) \
>>   	for (order =3D 0; order < MAX_ORDER; order++) \
>>   		for (type =3D 0; type < MIGRATE_TYPES; type++)
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index edfd6c81af82..107a5f186d3b 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -1041,6 +1041,12 @@ buddy_merge_likely(unsigned long pfn, unsigned =
long buddy_pfn,
>>   	return page_is_buddy(higher_page, higher_buddy, order + 1);
>>   }
>>  +static inline bool has_non_fallback_pageblock(struct zone *zone)
>> +{
>> +	return has_isolate_pageblock(zone) || zone_cma_pages(zone) !=3D 0 ||=

>> +		zone->nr_reserved_highatomic !=3D 0;
>
> Make zone->nr_reserved_highatomic !=3D 0 a helper as zone_cma_pages()?

I am not sure. We have zone_cma_pages() because when CMA is not enabled, =
0 can be
simply returned. But MIGRATE_HIGHATOMIC is always present, then an helper=
 function
is not that useful.

>> +}
>> +
>>   /*
>>    * Freeing function for a buddy system allocator.
>>    *
>> @@ -1116,14 +1122,15 @@ static inline void __free_one_page(struct page=
 *page,
>>   	}
>>   	if (order < MAX_ORDER - 1) {
>>   		/* If we are here, it means order is >=3D pageblock_order.
>> -		 * We want to prevent merge between freepages on isolate
>> -		 * pageblock and normal pageblock. Without this, pageblock
>> -		 * isolation could cause incorrect freepage or CMA accounting.
>> +		 * We want to prevent merge between freepages on pageblock
>> +		 * without fallbacks and normal pageblock. Without this,
>> +		 * pageblock isolation could cause incorrect freepage or CMA
>> +		 * accounting or HIGHATOMIC accounting.
>>   		 *
>>   		 * We don't want to hit this code for the more frequent
>>   		 * low-order merging.
>>   		 */
>> -		if (unlikely(has_isolate_pageblock(zone))) {
>> +		if (unlikely(has_non_fallback_pageblock(zone))) {
> I'm not familiar with the code details, just wondering if this change w=
ould has side effects on cma
> pageblock merging as it the condition stronger?

No impact on cma pageblock merging, AFAICT.

>
> Thanks,
> Eric
>>   			int buddy_mt;
>>    			buddy_pfn =3D __find_buddy_pfn(pfn, order);
>> @@ -1131,8 +1138,8 @@ static inline void __free_one_page(struct page *=
page,
>>   			buddy_mt =3D get_pageblock_migratetype(buddy);
>>    			if (migratetype !=3D buddy_mt
>> -					&& (is_migrate_isolate(migratetype) ||
>> -						is_migrate_isolate(buddy_mt)))
>> +					&& (!migratetype_has_fallback(migratetype) ||
>> +						!migratetype_has_fallback(buddy_mt)))
>>   				goto done_merging;
>>   		}
>>   		max_order =3D order + 1;
>> @@ -2483,6 +2490,7 @@ static int fallbacks[MIGRATE_TYPES][3] =3D {
>>   	[MIGRATE_UNMOVABLE]   =3D { MIGRATE_RECLAIMABLE, MIGRATE_MOVABLE,  =
 MIGRATE_TYPES },
>>   	[MIGRATE_MOVABLE]     =3D { MIGRATE_RECLAIMABLE, MIGRATE_UNMOVABLE,=
 MIGRATE_TYPES },
>>   	[MIGRATE_RECLAIMABLE] =3D { MIGRATE_UNMOVABLE,   MIGRATE_MOVABLE,  =
 MIGRATE_TYPES },
>> +	[MIGRATE_HIGHATOMIC] =3D { MIGRATE_TYPES }, /* Never used */
>>   #ifdef CONFIG_CMA
>>   	[MIGRATE_CMA]         =3D { MIGRATE_TYPES }, /* Never used */
>>   #endif
>> @@ -2794,8 +2802,8 @@ static void reserve_highatomic_pageblock(struct =
page *page, struct zone *zone,
>>    	/* Yoink! */
>>   	mt =3D get_pageblock_migratetype(page);
>> -	if (!is_migrate_highatomic(mt) && !is_migrate_isolate(mt)
>> -	    && !is_migrate_cma(mt)) {
>> +	/* Only reserve normal pageblock */
>> +	if (migratetype_has_fallback(mt)) {
>>   		zone->nr_reserved_highatomic +=3D pageblock_nr_pages;
>>   		set_pageblock_migratetype(page, MIGRATE_HIGHATOMIC);
>>   		move_freepages_block(zone, page, MIGRATE_HIGHATOMIC, NULL);
>> @@ -3544,8 +3552,8 @@ int __isolate_free_page(struct page *page, unsig=
ned int order)
>>   		struct page *endpage =3D page + (1 << order) - 1;
>>   		for (; page < endpage; page +=3D pageblock_nr_pages) {
>>   			int mt =3D get_pageblock_migratetype(page);
>> -			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
>> -			    && !is_migrate_highatomic(mt))
>> +			/* Only change normal pageblock */
>> +			if (migratetype_has_fallback(mt))
>>   				set_pageblock_migratetype(page,
>>   							  MIGRATE_MOVABLE);
>>   		}


--
Best Regards,
Yan, Zi

--=_MailMate_367F6B3E-C529-4EDC-9577-0483D3FAF214_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmGzdM4PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKBLkP/0AqpP1ym7DhyjHNAn1mATedKiADAa5UpI2U
7HFXYUPLmgCg/jDCLS7Eva1WXp0C5zwnk+NMSw5dY2ycJcr/qjkvDDIBiswogHQm
5bBXPwE5cNcNkDDFvfM8q1G20tuBrl8fVObIzDIKImB38rL0UIGvv831G8+VVIDu
0AXmMQSM+3/7VK930JDTMnnC+osJoy4RgvmadxjClfMBjU9w2bwM/T90x2lhhdI8
AEGiFg9AGczWcvOofeLuH6xqcc/RFROAEfv7a5ZqhOToSKWcUSlrJy3lRXmg8KsW
W6hJqzLG+9+HTcl+xHs7GF71vcrRTle3H7urkP7pkSHBPhgFgdzyBIPrUdQvkNac
04apQ8cDfFKdr/UbxqQB0dSXkhlhM3HKFMfEGhs9dJSpV/zmEiZD0BMPli3dpN1R
slMRO4/eL4QV/CGnzrWircTGkKTuj5oKE09FXKXgeW4yXg+smkOB5/z/pYO8Si3j
P8Oy5u1jKGgZzDQp3tqPqvX/p6mdBM3tGSYhHf/Q+9353kVYFhaCGFq5kodxkP+J
yRGkPubQoF/9LiOZzsfC37bqLkEAZFqu0e6SbDyJ45mdQMdCWkktf6YX4X6B2gwG
BNTMpRUwtXBZAr0NUUjYmEdTywPwZpj2vwt3zjpTXuDs5KKYFfjbC5igttf2089O
/PnDrXkU
=ZIek
-----END PGP SIGNATURE-----

--=_MailMate_367F6B3E-C529-4EDC-9577-0483D3FAF214_=--
