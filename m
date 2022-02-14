Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4204B5589
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 17:04:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy8DR1GD1z3cP3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 03:04:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=djXe3JHX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8b::623;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=djXe3JHX; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy8Cf6x98z3bYv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 03:03:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUOe/i2le8eSHdI8fI0Es+Fv86pnUTn9TbdA2JZ15L259brrQEILMmY5JOru+FCyLByB7ztkhx/FFa0j8ljkN6wn2lixblD2cwbc2nH3fOqHjp3uEuvic1woT3ZDMxo9VTX2O//BM75TL6W5qerdlD2iyAkgKwVkriQPKz6i2Fsr9w+Pp4WgMVB8PyoT8aA0lMgwEciW9B5hm/PWScgvPad+y9CoWWXrs2yktyMINu+cSVx8to+izjYZXfwZoIh1DO60UBrItF4lv1yAyT6Fa1bs1eOQ+lmZjdsIFcJUIXIfzWo7ETXdxzL2lN/Zh0BbHdYz0X999YBYGUihGr0pmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ/L50OaQRTiDA28B19tFav130Wocm/TgZy7+Wv2WX8=;
 b=OiUPpJbZ0AC7SHRfZEjoEkMUUcQ7OUBNyMiOtHcmkdQIR+vA55nx+/ijFo+bZPQE/O5gP2PFOzYKvsyunxRvn2YJFimPn0hrDJ73aFbNhlEAnZomNY9EpkjrwHarAeFiInR/DWqHrk+xeamnHCugR8shVQCxbuBH6gJ9EHK4SzD9FaRG+vdVr9KnPfwodIWZ912nn5OHNkr3Dw2+k/l2D3k3nMrJJjbFzFm0GxsxvzyRo9G+RCZ5zoc+FRojiUufxh5TlmO4NHbn+bEuFsAe8UafsmEjyqts1cvJhnR2lfiJezAyOumhWIIUR5iTZAiSbey7W/fqx66Yzkl1g6cFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ/L50OaQRTiDA28B19tFav130Wocm/TgZy7+Wv2WX8=;
 b=djXe3JHXTc24DM/nA4xxXxE1Kg0ziuk4huaE1O7quXBbzSKb9EhN6TyT1Fv1HKIKdVFAu1JnVwE4Y1A4pFAXfLZC5LjLbWeG7SH5aGYg0XOo1zteLDGf61d+VlKeRl0+0YqGzXKTRH4mXOynkA4cZUC8yvQhrmMO2UHK6qaFjklkEpK8VuGQ8UDqTapzwsmhLukSL7AtsPzTzdB8h1VUuxFgTuNLosSD34wOikpy5KqP7KjdIXnQRKYLyqi7SNnOyogwUWT5nZYe/B+FPZTnUkEvMk1TCTXePVGbgRwIi3f5m6csv+ZaMLvLWhZCrw7r+cX1g2jCQp5O9VONNsfOuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by DM5PR12MB4678.namprd12.prod.outlook.com (2603:10b6:4:a9::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Mon, 14 Feb
 2022 16:03:18 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::cb5:94df:b338:9b5e]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::cb5:94df:b338:9b5e%4]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 16:03:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 3/6] mm: make alloc_contig_range work at pageblock
 granularity
Date: Mon, 14 Feb 2022 11:03:15 -0500
X-Mailer: MailMate (1.14r5869)
Message-ID: <AF8E6576-CD38-4655-9CDE-DADB79DA1743@nvidia.com>
In-Reply-To: <3c4e08f4-67ca-6df5-b6d0-2f2cf2aee597@csgroup.eu>
References: <20220211164135.1803616-1-zi.yan@sent.com>
 <20220211164135.1803616-4-zi.yan@sent.com>
 <3c4e08f4-67ca-6df5-b6d0-2f2cf2aee597@csgroup.eu>
Content-Type: multipart/signed;
 boundary="=_MailMate_1B56F948-D082-4BC9-B0EC-511A796C7583_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:208:160::25) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6994e73-c639-47fe-bd17-08d9efd38432
X-MS-TrafficTypeDiagnostic: DM5PR12MB4678:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB4678B7DDAC56CEC7C46863D8C2339@DM5PR12MB4678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzFX/Bpw4JFWa1qWHhfFZMfM8o/BFG5IGduBOYd90SBjuCwMEhv1+MmMvH24hLpZv2RLvNcyup3HkhOFrlPswoOkKP7sUEO6bBiBQ9sFRN0z3tBxIhxFjayWH8Y/7nAlYDQu6WkdfuPG2FQ8NIWealVBWFUoXOOQpmawkK/67sgt6x+M0zWZk566Qc9cKqDiyifwtaAmpA3LpjejcEG5m5nNF8Ze07qav0cZ8q2iKH7bpV9wjf+gYF8YgKhIuhFt2uWbH7HZ+pW1SJQOyKqDUPWBLD1tP17Ik3/6nqgqYMEHPth/K9lIJE11G9atFBQKV9Wbp4WizM/7RaTkHjsUd+ia7DlarQ6SJtjQsrplpwBMOAtu8cwKCnAr2/EiPBosGE58f4MOtBuqmkGbh/HorL2J4Rwam9lzb5ZXA47tFBvOweihO7tsRSAdsLPakJBEO9FcpDZ9XO6XbbtXXd4KMD/JLLmbQCKlMavGx2tpymCCQ472BU1FlayPgxM89qeVE1LO9aWF6Z2DLUoq3QSNSFcUe+PGy693PWrtyXa0w71vV+3RZMceIWGU8ZFPEhN8oQUh1d/XtOg/aMbCpRUvhjeOgIFrzj9mcnuE0P8H/POW9q5n5pdt4u8m0PObpeu0qs9Vjdlb/qb5EgL4VwE6PNY8K7Tq1pcDjDG20ne04CUAdNCr0KqIP7TxGyMVVDp4ejRAjokTgBK/irFvBukvMAtfkQ0S1gPqU1iidoxqtQmrRrbRJx1qH7BXpe/SuB4oEL+xWXxG9k2+czPlgl4dqo7nWQ8zoVU/TPVmYLkLpCFa5HlnN1aTTF8hdsfaJ+t4zEwBxSKaLa/zfMMK20vWDva/wYAAfxI72X57hoDPfUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(2616005)(54906003)(4326008)(6666004)(86362001)(8936002)(8676002)(66556008)(66476007)(30864003)(235185007)(7416002)(5660300002)(966005)(6486002)(66946007)(186003)(21480400003)(26005)(2906002)(6512007)(36756003)(66574015)(508600001)(83380400001)(53546011)(316002)(33656002)(6506007)(38100700002)(33964004)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUtzTVM2eTMzNFozUGM4b3FRQWthSmFjY2s3a0lnUFJLeVcyQTV4dkF5K1lu?=
 =?utf-8?B?WUpaUEJzdmEwbUFITGI0ZUYwTVlUMktrdmxWcWlPVnRYY1VuZTVTN0ROQjJG?=
 =?utf-8?B?aGh3amYyTzhpb0Z0azM3VDRWVFZ2dW8wa1Q5OHFhbWYxTlFCbU9jM05BaDVr?=
 =?utf-8?B?cDBSdnMrTldidEFJUkZrcGZ1ZXM5RnY4TjMwRUtjbVBTOWFKcXhPQmxtTlhT?=
 =?utf-8?B?R2tCczBDMjdpaU5leHo5L2pkbEU5bG5xT0M4M3dNd20yNURQbXcwa2tXaVBD?=
 =?utf-8?B?QlFLMFMrNFlvU2xNQzI0WDFiaEJVSlhjOUpXMks4R29LeXQxcXhxRGg4Tlkx?=
 =?utf-8?B?Wm1GUHllSk9ZYmZQbGxLT2IzSk4rSm5FQjZMK0ZtTS9sdEkzb0k1V0JaVWxn?=
 =?utf-8?B?Z2VPQUFtU3J1Q0g2aVphekQ1N0JHMHM0R2VUMWJ1RzF0eGNnSEN5aVhzN1BX?=
 =?utf-8?B?TllBOEpLVGVMb0Juanl3dmVWNWdLSjA5NUVGNWJDV0VuZDZRSjBvS3drSm5t?=
 =?utf-8?B?RThQTnIzRmNnTVJQUkdLZ1lyNjBYY2RwQ01wcXJyMUU2MzNIb2UzQzNsdjhn?=
 =?utf-8?B?a0NXcFBqcVYrYm5Cb2VUeERjeXVob0pIemZFaHVyNUVNaUEweVBWS25FN04w?=
 =?utf-8?B?RmZsNWRpdHIwL2EvRXFCa3YzUXcrMXNhR0ltTDgzMXJFZC9LV1NxQ3MwcGpz?=
 =?utf-8?B?ODN4cndEenlNODB5ZEZ5ZXJkeTRuU3FMSllnaG5DaWRlZG5JSVpHKzR5cTh5?=
 =?utf-8?B?RGw4MlFlZUNicS9mUTM0Unp2MDhOL2hnWjFnZXdwTEQrVm1PaXZUK3VBTmdi?=
 =?utf-8?B?bDdUNFhDYkY5MDUzU2pZUkJZT3gvYXZQSjZZaitzQmloSHNNcU1NaVpqVGcz?=
 =?utf-8?B?R294ME5Jc25zYjVmd2FHZFJEM2JOVVlxdmxFLzBzY0ZRMEtCK0Z1U3hQT3Vv?=
 =?utf-8?B?WTA5YUhIMExtL0k4em9lZ0ZMbXA4dk5oN2FuaC9xSmlwcTFTNkNrMmhlV0Nv?=
 =?utf-8?B?WEF3L0JXeWdRclQ0Uk82Nmk5WTdUcGZLVkt0VndEdEdoL1cwU1kyMmhacWM4?=
 =?utf-8?B?Zy9DcTU1N01nV1dlazFLdFJiUVRROURjOXJiWThBYXRLV0FvbDBxSzNMbFlF?=
 =?utf-8?B?SWEzV0V3d3hUY2dzUWJ1eE5kcHJCSXdJZGpXZHFhbzFXUjVjWnNpNDVrT3pQ?=
 =?utf-8?B?YkNaLyt5YWZ2VlZPeGN5ZWZQbkM2T0hPNXhPZ3BHbitZQmI2ZXpKQWE4cUps?=
 =?utf-8?B?WWdXL3locHFEVFZPbVZYQ0ZuaU1WU2pMTk4vMDhNL0lLY3IwRDhZRDFYY1Zk?=
 =?utf-8?B?ZU1rZkdYcFc4U2VZS0lWazRBMGJ4TEc0SzcwSkEwdERkS2ZDeTJyTG1kSEJD?=
 =?utf-8?B?MENSYWpWekNTK2dleE1yQzVzTzFRMzcyZ0VTTW14dFN4RklFbGV0c2kxY21E?=
 =?utf-8?B?UE8ybzB3ZVh0NmxqblJvV3ZpbUV4NDNQeW5Xdk0xdTVJeVlsQ2ZpSEhHbThl?=
 =?utf-8?B?cDNHRWIyNHhYYm1iZTNlV1pZUTk2ek13RkFkN2UydTErcUFXTmNva2tnQTdX?=
 =?utf-8?B?VmxCdm1Nai8vT21iQUFjZDZSWnNBNStEZ1hHQzE1Nm1vbmJGbzg1WnZJN2tx?=
 =?utf-8?B?RTNzdTVGV3NnYm1uTEUzSUkraTE4SW9MRVo3WCtqRFpsQW95bzQxNEx2OUF2?=
 =?utf-8?B?UUpEWWFWUDlLczR5eitqdHVJQ0JEazZuckNlWW1lV1JqR1hFQnNDcTBxUUZC?=
 =?utf-8?B?bENoTWhYR21va3ZMS1pXbzI0YUVyc1diRVZhQ2FRdnhISHl6RUZicUpnNU04?=
 =?utf-8?B?K2c2VVVzaklSV1MyWlE2N3IreFNrcWYxOExueWpqSGxWa296cGZzUlFldzdU?=
 =?utf-8?B?Vzgram1uTmV0SDF4NGtteHh6d1FkRFJHakhIUDRTdUpFVEphVVRMRWk0TjFi?=
 =?utf-8?B?dmRqbWNPd0dobWxmZmtrVTBBN3ZTSHcxWU8xSVQ5VjUyM2xwNUltWWw4Tml5?=
 =?utf-8?B?K2FhYjlzRFh3Q3gyM2M3S0Q5N3pRbCtJNEVhcGtuWW9hSkxrNCsvU3Y0QmdD?=
 =?utf-8?B?WlM2b1Vmcm5wTXRGaFBPTVk3YkFDdGNXaEdoN2MwZG9IYjVVR1NOTEZrclNH?=
 =?utf-8?Q?2BrE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6994e73-c639-47fe-bd17-08d9efd38432
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:03:18.6722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/01KAkDaB/bbzXPNPd/uc5xAtPFVHFeFf9EMjcXH6vb/MWo/XyCfaTnDUDAHJBe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4678
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
Cc: David Hildenbrand <david@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Vlastimil Babka <vbabka@suse.cz>,
 Eric Ren <renzhengeek@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Mel Gorman <mgorman@techsingularity.net>, Christoph Hellwig <hch@lst.de>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_1B56F948-D082-4BC9-B0EC-511A796C7583_=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 Feb 2022, at 2:59, Christophe Leroy wrote:

> Le 11/02/2022 =C3=A0 17:41, Zi Yan a =C3=A9crit=C2=A0:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> alloc_contig_range() worked at MAX_ORDER-1 granularity to avoid mergin=
g
>> pageblocks with different migratetypes. It might unnecessarily convert=

>> extra pageblocks at the beginning and at the end of the range. Change
>> alloc_contig_range() to work at pageblock granularity.
>>
>> Special handling is needed for free pages and in-use pages across the
>> boundaries of the range specified alloc_contig_range(). Because these
>> partially isolated pages causes free page accounting issues. The free
>> pages will be split and freed into separate migratetype lists; the
>> in-use pages will be migrated then the freed pages will be handled.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>   include/linux/page-isolation.h |   2 +-
>>   mm/internal.h                  |   3 +
>>   mm/memory_hotplug.c            |   3 +-
>>   mm/page_alloc.c                | 235 +++++++++++++++++++++++++------=
--
>>   mm/page_isolation.c            |  33 ++++-
>>   5 files changed, 211 insertions(+), 65 deletions(-)
>>
>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isola=
tion.h
>> index 4ef7be6def83..78ff940cc169 100644
>> --- a/include/linux/page-isolation.h
>> +++ b/include/linux/page-isolation.h
>> @@ -54,7 +54,7 @@ int move_freepages_block(struct zone *zone, struct p=
age *page,
>>    */
>>   int
>>   start_isolate_page_range(unsigned long start_pfn, unsigned long end_=
pfn,
>> -			 unsigned migratetype, int flags);
>> +			 unsigned migratetype, int flags, gfp_t gfp_flags);
>>
>>   /*
>>    * Changes MIGRATE_ISOLATE to MIGRATE_MOVABLE.
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 0d240e876831..509cbdc25992 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -319,6 +319,9 @@ isolate_freepages_range(struct compact_control *cc=
,
>>   int
>>   isolate_migratepages_range(struct compact_control *cc,
>>   			   unsigned long low_pfn, unsigned long end_pfn);
>> +
>> +int
>> +isolate_single_pageblock(unsigned long boundary_pfn, gfp_t gfp_flags,=
 int isolate_before_boundary);
>>   #endif
>>   int find_suitable_fallback(struct free_area *area, unsigned int orde=
r,
>>   			int migratetype, bool only_stealable, bool *can_steal);
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index ce68098832aa..82406d2f3e46 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1863,7 +1863,8 @@ int __ref offline_pages(unsigned long start_pfn,=
 unsigned long nr_pages,
>>   	/* set above range as isolated */
>>   	ret =3D start_isolate_page_range(start_pfn, end_pfn,
>>   				       MIGRATE_MOVABLE,
>> -				       MEMORY_OFFLINE | REPORT_FAILURE);
>> +				       MEMORY_OFFLINE | REPORT_FAILURE,
>> +				       GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL);
>>   	if (ret) {
>>   		reason =3D "failure to isolate range";
>>   		goto failed_removal_pcplists_disabled;
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 62ef78f3d771..7a4fa21aea5c 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -8985,7 +8985,7 @@ static inline void alloc_contig_dump_pages(struc=
t list_head *page_list)
>>   #endif
>>
>>   /* [start, end) must belong to a single zone. */
>> -static int __alloc_contig_migrate_range(struct compact_control *cc,
>> +int __alloc_contig_migrate_range(struct compact_control *cc,
>>   					unsigned long start, unsigned long end)
>>   {
>>   	/* This function is based on compact_zone() from compaction.c. */
>> @@ -9043,6 +9043,167 @@ static int __alloc_contig_migrate_range(struct=
 compact_control *cc,
>>   	return 0;
>>   }
>>
>> +/**
>> + * split_free_page() -- split a free page at split_pfn_offset
>> + * @free_page:		the original free page
>> + * @order:		the order of the page
>> + * @split_pfn_offset:	split offset within the page
>> + *
>> + * It is used when the free page crosses two pageblocks with differen=
t migratetypes
>> + * at split_pfn_offset within the page. The split free page will be p=
ut into
>> + * separate migratetype lists afterwards. Otherwise, the function ach=
ieves
>> + * nothing.
>> + */
>> +static inline void split_free_page(struct page *free_page,
>> +				int order, unsigned long split_pfn_offset)
>> +{
>> +	struct zone *zone =3D page_zone(free_page);
>> +	unsigned long free_page_pfn =3D page_to_pfn(free_page);
>> +	unsigned long pfn;
>> +	unsigned long flags;
>> +	int free_page_order;
>> +
>> +	spin_lock_irqsave(&zone->lock, flags);
>> +	del_page_from_free_list(free_page, zone, order);
>> +	for (pfn =3D free_page_pfn;
>> +	     pfn < free_page_pfn + (1UL << order);) {
>> +		int mt =3D get_pfnblock_migratetype(pfn_to_page(pfn), pfn);
>> +
>> +		free_page_order =3D order_base_2(split_pfn_offset);
>> +		__free_one_page(pfn_to_page(pfn), pfn, zone, free_page_order,
>> +				mt, FPI_NONE);
>> +		pfn +=3D 1UL << free_page_order;
>> +		split_pfn_offset -=3D (1UL << free_page_order);
>> +		/* we have done the first part, now switch to second part */
>> +		if (split_pfn_offset =3D=3D 0)
>> +			split_pfn_offset =3D (1UL << order) - (pfn - free_page_pfn);
>> +	}
>> +	spin_unlock_irqrestore(&zone->lock, flags);
>> +}
>> +
>> +/**
>> + * isolate_single_pageblock() -- tries to isolate a pageblock that mi=
ght be
>> + * within a free or in-use page.
>> + * @boundary_pfn:		pageblock-aligned pfn that a page might cross
>> + * @gfp_flags:			GFP flags used for migrating pages
>> + * @isolate_before_boundary:	isolate the pageblock before (1) or afte=
r (0)
>> + *				the boundary_pfn
>> + *
>> + * Free and in-use pages can be as big as MAX_ORDER-1 and contain mor=
e than one
>> + * pageblock. When not all pageblocks within a page are isolated at t=
he same
>> + * time, free page accounting can go wrong. For example, in the case =
of
>> + * MAX_ORDER-1 =3D pageblock_order + 1, a MAX_ORDER-1 page has two pa=
gelbocks.
>> + * [        MAX_ORDER-1          ]
>> + * [  pageblock0  |  pageblock1  ]
>> + * When either pageblock is isolated, if it is a free page, the page =
is not
>> + * split into separate migratetype lists, which is supposed to; if it=
 is an
>> + * in-use page and freed later, __free_one_page() does not split the =
free page
>> + * either. The function handles this by splitting the free page or mi=
grating
>> + * the in-use page then splitting the free page.
>> + */
>> +int isolate_single_pageblock(unsigned long boundary_pfn, gfp_t gfp_fl=
ags,
>> +			int isolate_before_boundary)
>
> Do you need such big param name ?

I am happy to take any suggestion.

>
> See
> https://www.kernel.org/doc/html/latest/process/coding-style.html?highli=
ght=3Dstyle#naming
>
> isolate_before_boundary could probably be shorter.

isolate_before instead?

>
> And should be a bool by the way.

Sure.
>
>> +{
>> +	unsigned char saved_mt;
>> +	/*
>> +	 * scan at max(MAX_ORDER_NR_PAGES, pageblock_nr_pages) aligned range=
 to
>> +	 * avoid isolate pageblocks belonging to a bigger free or in-use pag=
e
>> +	 */
>> +	unsigned long start_pfn =3D pfn_max_align_down(boundary_pfn);
>> +	unsigned long isolated_pageblock_pfn;
>
> Variable name too long.
>
>> +	unsigned long pfn;
>> +
>> +	VM_BUG_ON(!IS_ALIGNED(boundary_pfn, pageblock_nr_pages));
>> +
>> +	if (isolate_before_boundary)
>> +		isolated_pageblock_pfn =3D boundary_pfn - pageblock_nr_pages;
>> +	else
>> +		isolated_pageblock_pfn =3D boundary_pfn;
>> +
>> +	saved_mt =3D get_pageblock_migratetype(pfn_to_page(isolated_pagebloc=
k_pfn));
>> +	set_pageblock_migratetype(pfn_to_page(isolated_pageblock_pfn), MIGRA=
TE_ISOLATE);
>> +
>> +	for (pfn =3D start_pfn; pfn < boundary_pfn;) {
>
> This loop is a bit long a deep. Isn't there a way to put what's in "if
> (PageHuge(page) || PageTransCompound(page))" into a sub-function ?
>

Let me give it a try.

> See
> https://www.kernel.org/doc/html/latest/process/coding-style.html?highli=
ght=3Dstyle#functions
>

Thanks for the review.


>> +		struct page *page =3D pfn_to_page(pfn);
>> +
>> +		/*
>> +		 * start_pfn is max(MAX_ORDER_NR_PAGES, pageblock_nr_pages)
>> +		 * aligned, if there is any free pages in [start_pfn, boundary_pfn)=
,
>> +		 * its head page will always be in the range.
>> +		 */
>> +		if (PageBuddy(page)) {
>> +			int order =3D buddy_order(page);
>> +
>> +			if (pfn + (1UL << order) > boundary_pfn)
>> +				split_free_page(page, order, boundary_pfn - pfn);
>> +			pfn +=3D (1UL << order);
>> +			continue;
>> +		}
>> +		/*
>> +		 * migrate compound pages then let the free page handling code
>> +		 * above do the rest
>> +		 */
>> +		if (PageHuge(page) || PageTransCompound(page)) {
>> +			unsigned long nr_pages =3D compound_nr(page);
>> +			int order =3D compound_order(page);
>> +			struct page *head =3D compound_head(page);
>> +			unsigned long head_pfn =3D page_to_pfn(head);
>> +
>> +			if (head_pfn + nr_pages >=3D boundary_pfn) {
>> +				int ret;
>> +				struct compact_control cc =3D {
>> +					.nr_migratepages =3D 0,
>> +					.order =3D -1,
>> +					.zone =3D page_zone(pfn_to_page(head_pfn)),
>> +					.mode =3D MIGRATE_SYNC,
>> +					.ignore_skip_hint =3D true,
>> +					.no_set_skip_hint =3D true,
>> +					.gfp_mask =3D current_gfp_context(gfp_flags),
>> +					.alloc_contig =3D true,
>> +				};
>> +
>> +				INIT_LIST_HEAD(&cc.migratepages);
>> +
>> +				ret =3D __alloc_contig_migrate_range(&cc, head_pfn,
>> +							head_pfn + nr_pages);
>> +
>> +				if (ret) {
>> +					/* restore the original migratetype */
>> +					set_pageblock_migratetype(
>> +						pfn_to_page(isolated_pageblock_pfn),
>> +						saved_mt);
>> +					return -EBUSY;
>> +				}
>> +				/*
>> +				 * reset pfn, let the free page handling code
>> +				 * above split the free page to the right
>> +				 * migratetype list.
>> +				 *
>> +				 * head_pfn is not used here as a hugetlb page
>> +				 * order can be bigger than MAX_ORDER-1, but
>> +				 * after it is freed, the free page order is not.
>> +				 * Use pfn within the range to find the head of
>> +				 * the free page and reset order to 0 if a hugetlb
>> +				 * page with >MAX_ORDER-1 order is encountered.
>> +				 */
>> +				if (order > MAX_ORDER-1)
>> +					order =3D 0;
>> +				while (!PageBuddy(pfn_to_page(pfn))) {
>> +					order++;
>> +					pfn &=3D ~0UL << order;
>> +				}
>> +				continue;
>> +			}
>> +			pfn +=3D nr_pages;
>> +			continue;
>> +		}
>> +
>> +		pfn++;
>> +	}
>> +	return 0;
>> +}
>> +
>> +
>>   /**
>>    * alloc_contig_range() -- tries to allocate given range of pages
>>    * @start:	start PFN to allocate
>> @@ -9067,8 +9228,9 @@ static int __alloc_contig_migrate_range(struct c=
ompact_control *cc,
>>   int alloc_contig_range(unsigned long start, unsigned long end,
>>   		       unsigned migratetype, gfp_t gfp_mask)
>>   {
>> -	unsigned long outer_start, outer_end;
>> -	unsigned int order;
>> +	unsigned long outer_end;
>> +	unsigned long alloc_start =3D ALIGN_DOWN(start, pageblock_nr_pages);=

>> +	unsigned long alloc_end =3D ALIGN(end, pageblock_nr_pages);
>>   	int ret =3D 0;
>>
>>   	struct compact_control cc =3D {
>> @@ -9087,14 +9249,11 @@ int alloc_contig_range(unsigned long start, un=
signed long end,
>>   	 * What we do here is we mark all pageblocks in range as
>>   	 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
>>   	 * have different sizes, and due to the way page allocator
>> -	 * work, we align the range to biggest of the two pages so
>> -	 * that page allocator won't try to merge buddies from
>> -	 * different pageblocks and change MIGRATE_ISOLATE to some
>> -	 * other migration type.
>> +	 * work, start_isolate_page_range() has special handlings for this.
>>   	 *
>>   	 * Once the pageblocks are marked as MIGRATE_ISOLATE, we
>>   	 * migrate the pages from an unaligned range (ie. pages that
>> -	 * we are interested in).  This will put all the pages in
>> +	 * we are interested in). This will put all the pages in
>>   	 * range back to page allocator as MIGRATE_ISOLATE.
>>   	 *
>>   	 * When this is done, we take the pages in range from page
>> @@ -9107,9 +9266,9 @@ int alloc_contig_range(unsigned long start, unsi=
gned long end,
>>   	 * put back to page allocator so that buddy can use them.
>>   	 */
>>
>> -	ret =3D start_isolate_page_range(start, end, migratetype, 0);
>> +	ret =3D start_isolate_page_range(start, end, migratetype, 0, gfp_mas=
k);
>>   	if (ret)
>> -		return ret;
>> +		goto done;
>>
>>   	drain_all_pages(cc.zone);
>>
>> @@ -9128,68 +9287,28 @@ int alloc_contig_range(unsigned long start, un=
signed long end,
>>   		goto done;
>>   	ret =3D 0;
>>
>> -	/*
>> -	 * Pages from [start, end) are within a MAX_ORDER_NR_PAGES
>> -	 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
>> -	 * more, all pages in [start, end) are free in page allocator.
>> -	 * What we are going to do is to allocate all pages from
>> -	 * [start, end) (that is remove them from page allocator).
>> -	 *
>> -	 * The only problem is that pages at the beginning and at the
>> -	 * end of interesting range may be not aligned with pages that
>> -	 * page allocator holds, ie. they can be part of higher order
>> -	 * pages.  Because of this, we reserve the bigger range and
>> -	 * once this is done free the pages we are not interested in.
>> -	 *
>> -	 * We don't have to hold zone->lock here because the pages are
>> -	 * isolated thus they won't get removed from buddy.
>> -	 */
>> -
>> -	order =3D 0;
>> -	outer_start =3D start;
>> -	while (!PageBuddy(pfn_to_page(outer_start))) {
>> -		if (++order >=3D MAX_ORDER) {
>> -			outer_start =3D start;
>> -			break;
>> -		}
>> -		outer_start &=3D ~0UL << order;
>> -	}
>> -
>> -	if (outer_start !=3D start) {
>> -		order =3D buddy_order(pfn_to_page(outer_start));
>> -
>> -		/*
>> -		 * outer_start page could be small order buddy page and
>> -		 * it doesn't include start page. Adjust outer_start
>> -		 * in this case to report failed page properly
>> -		 * on tracepoint in test_pages_isolated()
>> -		 */
>> -		if (outer_start + (1UL << order) <=3D start)
>> -			outer_start =3D start;
>> -	}
>> -
>>   	/* Make sure the range is really isolated. */
>> -	if (test_pages_isolated(outer_start, end, 0)) {
>> +	if (test_pages_isolated(alloc_start, alloc_end, 0)) {
>>   		ret =3D -EBUSY;
>>   		goto done;
>>   	}
>>
>>   	/* Grab isolated pages from freelists. */
>> -	outer_end =3D isolate_freepages_range(&cc, outer_start, end);
>> +	outer_end =3D isolate_freepages_range(&cc, alloc_start, alloc_end);
>>   	if (!outer_end) {
>>   		ret =3D -EBUSY;
>>   		goto done;
>>   	}
>>
>>   	/* Free head and tail (if any) */
>> -	if (start !=3D outer_start)
>> -		free_contig_range(outer_start, start - outer_start);
>> -	if (end !=3D outer_end)
>> -		free_contig_range(end, outer_end - end);
>> +	if (start !=3D alloc_start)
>> +		free_contig_range(alloc_start, start - alloc_start);
>> +	if (end !=3D alloc_end)
>> +		free_contig_range(end, alloc_end - end);
>>
>>   done:
>> -	undo_isolate_page_range(pfn_max_align_down(start),
>> -				pfn_max_align_up(end), migratetype);
>> +	undo_isolate_page_range(alloc_start,
>> +				alloc_end, migratetype);
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(alloc_contig_range);
>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>> index 64d093ab83ec..0256d5e1032c 100644
>> --- a/mm/page_isolation.c
>> +++ b/mm/page_isolation.c
>> @@ -285,6 +285,8 @@ __first_valid_page(unsigned long pfn, unsigned lon=
g nr_pages)
>>    *					 and PageOffline() pages.
>>    *			REPORT_FAILURE - report details about the failure to
>>    *			isolate the range
>> + * @gfp_flags:		GFP flags used for migrating pages that sit across th=
e
>> + *			range boundaries.
>>    *
>>    * Making page-allocation-type to be MIGRATE_ISOLATE means free page=
s in
>>    * the range will never be allocated. Any free pages and pages freed=
 in the
>> @@ -293,6 +295,10 @@ __first_valid_page(unsigned long pfn, unsigned lo=
ng nr_pages)
>>    * pages in the range finally, the caller have to free all pages in =
the range.
>>    * test_page_isolated() can be used for test it.
>>    *
>> + * The function first tries to isolate the pageblocks at the beginnin=
g and end
>> + * of the range, since there might be pages across the range boundari=
es.
>> + * Afterwards, it isolates the rest of the range.
>> + *
>>    * There is no high level synchronization mechanism that prevents tw=
o threads
>>    * from trying to isolate overlapping ranges. If this happens, one t=
hread
>>    * will notice pageblocks in the overlapping range already set to is=
olate.
>> @@ -313,21 +319,38 @@ __first_valid_page(unsigned long pfn, unsigned l=
ong nr_pages)
>>    * Return: 0 on success and -EBUSY if any part of range cannot be is=
olated.
>>    */
>>   int start_isolate_page_range(unsigned long start_pfn, unsigned long =
end_pfn,
>> -			     unsigned migratetype, int flags)
>> +			     unsigned migratetype, int flags, gfp_t gfp_flags)
>>   {
>>   	unsigned long pfn;
>>   	struct page *page;
>> +	/* isolation is done at page block granularity */
>> +	unsigned long isolate_start =3D ALIGN_DOWN(start_pfn, pageblock_nr_p=
ages);
>> +	unsigned long isolate_end =3D ALIGN(end_pfn, pageblock_nr_pages);
>> +	int ret;
>>
>> -	unsigned long isolate_start =3D pfn_max_align_down(start_pfn);
>> -	unsigned long isolate_end =3D pfn_max_align_up(end_pfn);
>> +	/* isolate [isolate_start, isolate_start + pageblock_nr_pages] pageb=
lock */
>> +	ret =3D isolate_single_pageblock(isolate_start, gfp_flags, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* isolate [isolate_end - pageblock_nr_pages, isolate_end] pageblock=
 */
>> +	ret =3D isolate_single_pageblock(isolate_end, gfp_flags, 1);
>> +	if (ret) {
>> +		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);=

>> +		return ret;
>> +	}
>>
>> -	for (pfn =3D isolate_start;
>> -	     pfn < isolate_end;
>> +	/* skip isolated pageblocks at the beginning and end */
>> +	for (pfn =3D isolate_start + pageblock_nr_pages;
>> +	     pfn < isolate_end - pageblock_nr_pages;
>>   	     pfn +=3D pageblock_nr_pages) {
>>   		page =3D __first_valid_page(pfn, pageblock_nr_pages);
>>   		if (page && set_migratetype_isolate(page, migratetype, flags,
>>   					start_pfn, end_pfn)) {
>>   			undo_isolate_page_range(isolate_start, pfn, migratetype);
>> +			unset_migratetype_isolate(
>> +				pfn_to_page(isolate_end - pageblock_nr_pages),
>> +				migratetype);
>>   			return -EBUSY;
>>   		}
>>   	}

--
Best Regards,
Yan, Zi

--=_MailMate_1B56F948-D082-4BC9-B0EC-511A796C7583_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmIKfUQPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK3WgP/ickLO1UPSlH7nDEyvnpWIoVDH0WIZS4po+h
Tg3bSW1A7rKkE++P+dfqXnz0uk2RbZRhQcejjfV8cw4sf5pbCToxlorjW+wFkIHJ
TseILwfXFq2x6y7VB+dy1TIlKcA31rh9gCPv/tKZeC4nuZ7hSN3LnEpupM3EGIGQ
Z1tD5cx0oF519suzBInmWef+nFJCeb3jyLK8zbPRs8O53LfldCi6cd+/m61mvfUM
r3KFdvcEqpoG1D6dMw7oAvzXHTKRfUVpV9pH7luuUcIUeLWzfvMfbsLo/AtSYmTx
5Y2KUoFlVZHbAKxFGnpuCU2oXL0VtLZaVO+8c544ciy9TV17z9aNcZ8BY8rvv0bn
KqdQDKi3UgSWZxu2Jkzonh3jbYldFbCIqpOwzZ/sn2TyYbSsv22li1Nw4Ne9OjAJ
X8XS1HBQ43gxo2pSNaNoqaevXhVuSIcphhZJQn5Vu8I5JpHTxyGwxNA+8cSwZN8I
eB9ee8l8XX7l6y9tNwfa1lukPwGaJQXKVCkCOfJ1hGUiM2772lpQNfydqGQ87KSm
V76RfnTgrQSXMIC+KO9g0eWDYh8BvrOL4u/DRkJhmtnnc8LY6Jd29OkpV9qvrcu2
w6qNpO4vXtxnLqBJ+4uQ0EuOTI6edGUZEMFqDuJhkBOuxDA9I86u4Q8OUAQR5nCC
03LPnrD1
=nmAz
-----END PGP SIGNATURE-----

--=_MailMate_1B56F948-D082-4BC9-B0EC-511A796C7583_=--
