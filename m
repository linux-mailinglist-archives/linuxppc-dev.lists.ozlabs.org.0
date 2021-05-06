Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E22375B5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 21:04:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbjfx2lL9z3bVK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 05:04:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MEAhyJmU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.100.69;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=MEAhyJmU; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2069.outbound.protection.outlook.com [40.107.100.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbjfL2B76z2yx6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 05:03:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sb7SsPhX1pLWdyTYqfSRWydvLt8B4wEBBJRpwujItCttiZpK/+PGnTqamY4A60iGj+PoUCQf/LAHqQLyzzHYO2IYllx7CzUj2sYpW+wSzbl7q2n/HnDR/ettR1jmcaepPRzqsPCVy2qlaXEZ+m0mnIhuQ5QjvxXnJHZMvTQXUnL2Gd5rGDcP9uQ4Xls0cF4uczGJNQuvfsbDEc9wnkSZ+YgTBzTYoiR8R0UrdvoFv1tufzCaAzYm+uz2YefszBWsnOlJV3MrEODY83wSK232KEsHMjjJyHSBzJk99cisnq5GPauqv1VAqvGYloDTohBYwHlVJg8Du6K0HdBc8GKBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ast1UVtH1tNPZPWzD/l2djgfqoTNAdVVwy5tLnE6q80=;
 b=ijPGHVndnQGUlgbDA6QPDSbt2GPTh8zRe0il3lDpk4LdpQBIKqbGj7hFl+cImrIsshhNzI5OJKIB7Ng2IYUCK7aJjKN8EDZ0t1yt/FBvhvSAjUewCSZjthjmZpAkp5pg5Yo/ze4uBTQTSmqJpdYjTEDiSNNLN3zrMGd9Kg9wQHbcxq+A47+hdDfjcgE68Whrx+hwHGRkg8ZcMiyqncB6CGjYRTjNJ1ZWSnsIg/XqPg7C35c5jJqwEmkxZ6Z/Coa3TsW52RLx0SB4Aj2wkVzew1i/56Y8y428YtGi1xHZQ3+94+kcZ+zD79oCvV3gc4AdqqzrLNonPgGBhOD5LPuzFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ast1UVtH1tNPZPWzD/l2djgfqoTNAdVVwy5tLnE6q80=;
 b=MEAhyJmUf1Q3iTQeIAY1Ns+i3gD0VVplXi5W2TjOD00zF8Ah5U5bsge6+Rg+lyKJBhp5Gil3jlpatSa7i41y4NhhvCiVc1PFj6/S1YCMu/HfBxhHEtOBKYnPv/KTaA8KiWE2TZpPU/5pbkHl0WGx/jr7GOkCPXMbFuZYLFWzYzhSBCB1d0/WO3xi7I4smUPuXTum3OFb8hrIzhjiZi+Yt4WK63duG7H8ZqZJLmvz4BLMk2ca19HAQQmeu5GiPT/+77BLAL75J7wBS/XiKYUz0qkzcnbR+Tzo1KrsVIqjmxGgc3Zmg5jFZG6n3mREiZLFATanM7g9Cf2j64fXugnSkg==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB3871.namprd12.prod.outlook.com (2603:10b6:208:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 19:03:29 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 19:03:29 +0000
From: "Zi Yan" <ziy@nvidia.com>
To: "David Hildenbrand" <david@redhat.com>
Subject: Re: [RFC PATCH 1/7] mm: sparse: set/clear subsection bitmap when
 pages are onlined/offlined.
Date: Thu, 06 May 2021 15:03:22 -0400
X-Mailer: MailMate (1.14r5757)
Message-ID: <71EE13C0-9CF7-4F1F-9C17-64500A854BD8@nvidia.com>
In-Reply-To: <06dfaf69-1173-462c-b85f-8715cb8d108c@redhat.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <20210506152623.178731-2-zi.yan@sent.com>
 <06dfaf69-1173-462c-b85f-8715cb8d108c@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_43E29186-BF6B-431C-81FF-73AB6A9D28BD_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [216.228.112.22]
X-ClientProxiedBy: MN2PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:208:23d::17) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.49.219] (216.228.112.22) by
 MN2PR06CA0012.namprd06.prod.outlook.com (2603:10b6:208:23d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 19:03:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d8c5400-5bb5-45b9-f505-08d910c1a2b9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3871E0BA328EEF0F909D055CC2589@MN2PR12MB3871.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiVTkC17joG7tVONxf1+GuqYtwqZ3HzTT2K27YTeI5CozUuRJMQoS8No7mrGi/y1Qirxmbf+voyR+LqzhUkNVrLdtOopQog3xqoldSsFP6DyrGicVrE/tOOUph28Gyw/M4cZwohKU37yJ6CURulWbnw07WEHDvGXBN7Do3QEzo7P9KHPtDS5nM3P+fc9r9HPS6ATh8f0nafTifLmLuPjfIY1rG9ddAaQp/yWwQU1yB4ZXbHAuyEJE5CojfVFSK7EHc2v++TThAyyNTSa/tIf91L7eEmSKm3/Q5YDIyN7io4+G9KXUpsYG0lWhGLNrVtJcwURbx4cNnPnOrcJM6iuq76FqBT2PbrlfTxaS73gTZk/r8zP6LwfAfZsBBYxAf+2k0z9m8WkexIni3AWiY8RPiIuGpBVLqhJR6ZBAtiGIkJhnZ1GPLLT7Pn5UCwlXEPvdu61ssQItA8OkZblf4x3UP55oHiMPc/3GLF4pxk7Qk5zKx8lO0tdQ1+TPxGsJjKuTGbiOukFpFDZN599IcXcpT0C5HuFEXh8XPLw43iEt8o1u/RcbpmeUrWoxrjJJca/5lSQB8LDVDPRhFwyGCH6DJ9gsozAyNUlnCDu68QCB8++g728H/PWgRnFuvnCLwZOlI+hrfBNzLBBz+7mKi5h4baueKXBp6cizpyMlf8+KX2EKEQO1d9T/GF/PVUdR361
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(54906003)(66946007)(235185007)(36756003)(66556008)(8676002)(53546011)(66476007)(956004)(2906002)(4326008)(478600001)(6486002)(33656002)(186003)(26005)(16576012)(2616005)(16526019)(5660300002)(316002)(6916009)(83380400001)(86362001)(8936002)(33964004)(6666004)(38100700002)(7416002)(45980500001)(72826003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXVteHptOUlLWklXbUJ4T2lEYXRXdlNxYWlXWnJMWG5KR3hKbHF2TlU2VE9u?=
 =?utf-8?B?Zk1DY09IbVlKalBMYXBabjBPeG9LbFk2VGZ0OGgwbzR0TEZENXlSK3ZiS0k3?=
 =?utf-8?B?cWJ6RmsxcnVDenc2eXVuN1Zubm9XKzNMWFlPNzlwVi9aRkkwQXhsZGsydFVJ?=
 =?utf-8?B?UjJXL1ZBbjlyWllUNXF6M2dEOHZzazdNUVJZVThESExJVDdMR2RxQ25Xd0xt?=
 =?utf-8?B?WDBDQU1TVUg3NmhQS0NPellVa3VYanhZNWJWTFpybVJVZDA1QzFncVNaeXcr?=
 =?utf-8?B?V2tselNTbCsxU2hyNWQzSWQ4VStVL2RWMWt5YmNGdzBSZGdjaUdNRGxNYnE0?=
 =?utf-8?B?ZXhnYm9xNDZJaXZ0OXZ2Z0pQaGZuUVcwcUFOMHpvRVhlZmcyem51NFdtQVYy?=
 =?utf-8?B?Z0VIWTF0SEpMZmhRUUhOdmlKU1F4b3B0cVcwNVVXNFord1NtTlRua24weTB6?=
 =?utf-8?B?ZlRiOVV0SUVnakVPTjN5cUpvOU9TZU5GblQ3cm1TRGk2NEh2dDhXM1Z5UUNX?=
 =?utf-8?B?aml4V0N0aUdSSmxyZlNnMUVmbkdnek91aEVZWjRYbStvMzBIS3BreW8zL29y?=
 =?utf-8?B?UkltVzgrbUdMQThSTDZPS2dkVVdvaVVYN2RDYW1Sc3duaGZVREJxaUdzZERQ?=
 =?utf-8?B?ckdtRmVFcE9zK0RpMU91R0pPcVQyL3c1OW15V0VVSXdRaTNCVXg0UXJhVHZZ?=
 =?utf-8?B?ekJsaXgyS1F4QTRZQTJKbW5oWVpqSW0xanNzS3FEeWlwZHArTDhjbnUra2RR?=
 =?utf-8?B?a05uc01YRURGbGNsWDQxQ25pMnh5OGE3WFEvd1N5ODRHSjRoRnR1dlJCQWpP?=
 =?utf-8?B?SjNXd3czVGFUT3pKeVpsWXY3ek44ejhwQlZmQ09rL0tydy9kRjc1SWdncnVU?=
 =?utf-8?B?TnNzdDhmSi83dmNNWkFLMHE1elluamRER2JrVFB1MlVrZUkxVWZLUHdLcHkv?=
 =?utf-8?B?OWo5WW1wclBRSnJHc1I3SFJXdS9PNUM0Y2ZrTlBxOFlUeUdWUGxCUFZBYks5?=
 =?utf-8?B?Y0wraVpmTklQaGxWcVNMbjEyKzZVQVkxdHFEVERRVjFIRG5GMjVWSnp3emE3?=
 =?utf-8?B?dllpdzVYTW1BWVoyOFRneURJVU1IMVZDSkZYMjhPMG54eWFBbDVZS3BiSjlw?=
 =?utf-8?B?OVFXQUF3MS9yd1oyNWMwSWxMQVZheWV2Q0krZnN1OW9XZHhhclBXL2J3M3VJ?=
 =?utf-8?B?cmIwaCs2aGd2cjd0WmN0Y1hiZzhTL3F1Ty9HWGcyWjFHdnhhTnY0VCsvTVEy?=
 =?utf-8?B?VmFBekhqU0hKSHJUQlRaSFdGcXUzZDdMRjhXbjhzemRmc2J3S3dua3NqTklY?=
 =?utf-8?B?UFlibVlWMTRvSWJNT3JQalFTUlJ3dDZXYUVFTE14K1MyNUdLVnpkTnY2cTV5?=
 =?utf-8?B?ZEs4d0dyNTl0OVJLREFTMnc1TDAzOU9rcTYwWEEzWE1zbHBhNng1bTdMZk5l?=
 =?utf-8?B?dFl5WlJ4KzF6U0UzOGh4dDI3ME1FNDNvM0k5Tk9JV1pEQ2hjWkVGRmdZNzFT?=
 =?utf-8?B?dXgrczF4T2dvS1piMnpxRVA1SGh2QnJEY29pZUZoVlJNUHVycTdTSExFUlpm?=
 =?utf-8?B?VnBqK3piTi80b2NJRE9YczA4cVQ2OHBYNWZyTXVwQkUrU1V3TFpMSFR0cHdB?=
 =?utf-8?B?SHM1WDgvZXdQYk1ocjNjYithbWhVdm81d1A3RWpvQ0pNWHY1S1JTWk52bUVN?=
 =?utf-8?B?SjNhbU1OK1I0K1pzK3h5VkZPakVzdnMybXd1R3FzWjZQRk9mOVVzblJ4K2xr?=
 =?utf-8?Q?vIl3/xelsQpz4GbNMtibClaNLD67OUv4mDxWJ3Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8c5400-5bb5-45b9-f505-08d910c1a2b9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 19:03:29.8162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRI1UP/hslqfR0ZxCtrc6RXowAO8YvaE9TfP+F+n4JT8ayZGHij/s6C+wIXx54JA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3871
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_43E29186-BF6B-431C-81FF-73AB6A9D28BD_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6 May 2021, at 13:48, David Hildenbrand wrote:

> On 06.05.21 17:26, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> subsection bitmap was set/cleared when a section is added/removed, but=

>> pfn_to_online_page() uses subsection bitmap to check if the page is
>> online, which is not accurate. It was working when a whole section is
>> added/removed during memory hotplug and hotremove. When the following
>> patches enable memory hotplug and hotremove for subsections,
>> subsection bitmap needs to be changed during page online/offline time,=

>> otherwise, pfn_to_online_page() will not give right answers. Move the
>> subsection bitmap manipulation code from section_activate() to
>> online_mem_sections() and section_deactivate() to
>> offline_mem_sections(), respectively.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>   mm/sparse.c | 36 +++++++++++++++++++++++++++++++++---
>>   1 file changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/sparse.c b/mm/sparse.c
>> index b2ada9dc00cb..7637208b8874 100644
>> --- a/mm/sparse.c
>> +++ b/mm/sparse.c
>> @@ -606,6 +606,7 @@ void __init sparse_init(void)
>>    #ifdef CONFIG_MEMORY_HOTPLUG
>>  +static int fill_subsection_map(unsigned long pfn, unsigned long nr_p=
ages);
>>   /* Mark all memory sections within the pfn range as online */
>>   void online_mem_sections(unsigned long start_pfn, unsigned long end_=
pfn)
>>   {
>> @@ -621,9 +622,12 @@ void online_mem_sections(unsigned long start_pfn,=
 unsigned long end_pfn)
>>    		ms =3D __nr_to_section(section_nr);
>>   		ms->section_mem_map |=3D SECTION_IS_ONLINE;
>> +		fill_subsection_map(pfn, min(end_pfn, pfn + PAGES_PER_SECTION) - pf=
n);
>>   	}
>>   }
>>  +static int clear_subsection_map(unsigned long pfn, unsigned long nr_=
pages);
>> +static bool is_subsection_map_empty(struct mem_section *ms);
>>   /* Mark all memory sections within the pfn range as offline */
>>   void offline_mem_sections(unsigned long start_pfn, unsigned long end=
_pfn)
>>   {
>> @@ -641,7 +645,13 @@ void offline_mem_sections(unsigned long start_pfn=
, unsigned long end_pfn)
>>   			continue;
>>    		ms =3D __nr_to_section(section_nr);
>> -		ms->section_mem_map &=3D ~SECTION_IS_ONLINE;
>> +
>> +		if (end_pfn < pfn + PAGES_PER_SECTION) {
>> +			clear_subsection_map(pfn, end_pfn - pfn);
>> +			if (is_subsection_map_empty(ms))
>> +				ms->section_mem_map &=3D ~SECTION_IS_ONLINE;
>> +		} else
>> +			ms->section_mem_map &=3D ~SECTION_IS_ONLINE;
>>   	}
>>   }
>>  @@ -668,6 +678,17 @@ static void free_map_bootmem(struct page *memmap=
)
>>   	vmemmap_free(start, end, NULL);
>>   }
>>  +static int subsection_map_intersects(struct mem_section *ms, unsigne=
d long pfn,
>> +				     unsigned long nr_pages)
>> +{
>> +	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) =3D { 0 };
>> +	unsigned long *subsection_map =3D &ms->usage->subsection_map[0];
>> +
>> +	subsection_mask_set(map, pfn, nr_pages);
>> +
>> +	return bitmap_intersects(map, subsection_map, SUBSECTIONS_PER_SECTIO=
N);
>> +}
>> +
>>   static int clear_subsection_map(unsigned long pfn, unsigned long nr_=
pages)
>>   {
>>   	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) =3D { 0 };
>> @@ -760,6 +781,12 @@ static void free_map_bootmem(struct page *memmap)=

>>   	}
>>   }
>>  +static int subsection_map_intersects(struct mem_section *ms, unsigne=
d long pfn,
>> +				     unsigned long nr_pages)
>> +{
>> +	return 0;
>> +}
>> +
>>   static int clear_subsection_map(unsigned long pfn, unsigned long nr_=
pages)
>>   {
>>   	return 0;
>> @@ -800,7 +827,10 @@ static void section_deactivate(unsigned long pfn,=
 unsigned long nr_pages,
>>   	struct page *memmap =3D NULL;
>>   	bool empty;
>>  -	if (clear_subsection_map(pfn, nr_pages))
>> +	if (WARN((IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) && !ms->usage) ||
>> +		 subsection_map_intersects(ms, pfn, nr_pages),
>> +				"section already deactivated (%#lx + %ld)\n",
>> +				pfn, nr_pages))
>>   		return;
>>    	empty =3D is_subsection_map_empty(ms);
>> @@ -855,7 +885,7 @@ static struct page * __meminit section_activate(in=
t nid, unsigned long pfn,
>>   		ms->usage =3D usage;
>>   	}
>>  -	rc =3D fill_subsection_map(pfn, nr_pages);
>> +	rc =3D !nr_pages || subsection_map_intersects(ms, pfn, nr_pages);
>>   	if (rc) {
>>   		if (usage)
>>   			ms->usage =3D NULL;
>>
>
> If I am not missing something, this is completely broken for devmem/ZON=
E_DEVICE that never onlines pages. But also when memory blocks are never =
onlined, this would be just wrong. Least thing you would need is a sub-se=
ction online map.

Thanks for pointing this out. I did not know that devmem/ZONE_DEVICE neve=
r onlines pages.

>
> But glimpsing at patch #2, I'd rather stop right away digging deeper in=
to this series :)

What is the issue of patch 2, which makes pageblock_order a variable all =
the time? BTW, patch 2 fixes a bug by exporting pageblock_order, since wh=
en HUGETLB_PAGE_SIZE_VARIABLE is set, virtio-mem will not see pageblock_o=
rder as a variable, which could happen for PPC_BOOK2S_64 with virtio-men =
enabled, right? Or is this an invalid combination?

>
> I think what would really help is drafting a design of how it all could=
 look like and then first discussing the high-level design, investigating=
 how it could play along with all existing users, existing workloads, and=
 existing use cases. Proposing such changes without a clear picture in mi=
nd and a high-level overview might give you some unpleasant reactions fro=
m some of the developers around here ;)

Please see my other email for a high-level design. Also I sent the patchs=
et as a RFC to gather information on users, workloads, use cases I did no=
t know about and I learnt a lot from your replies. :) Feedback is always =
welcome, but I am not sure why it needs to make people unpleasant. ;)


=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_43E29186-BF6B-431C-81FF-73AB6A9D28BD_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmCUPXoPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKgIIP/1oBHjFV/3vJgeuxg081qFnKHZL7261t04Av
tssn5jMT+aaHApq+OMqo7k4wuZfrljqBjU9W45kYpOlIhhYJ3QTnIIotykxsb0yK
gu0l9EIEhtm4jYncABlgJOK6JlLXlzKhgreegTYUq7yLblz10bwNZdZq78rw8KSd
fPJ3v4UJ+QWEB9isfaisfPe54Icu9cIAaoK+5g9tD7lkgqqmOTqy0RuLriz9EQxa
qzM2/5k9ftfw0LixMxuJj8LQkl16OLS6utnrUP8neQ2pBQg1J4jF1PteWLqr2zLl
jo4sz4uzLzeTMaUdmtW1P/OyWgqPSV482BQdPRi7Ui9k3nGB9op8eA2cOHvS5W4r
V0MdFQUc9H4BVavcizDpcGbzlcRGoKxeHVd1w7AISS54fgsot11SWHCJ398c3hH9
89pQg6PrQhtIwitzQW+6EwkuGMVWXXV02f2rI3KrGpmdu2+7lVSVveEmMEzujUsv
+RSjQdvgHehIv6FM5scKVb4YkexTTRCuugYQOT11sALGbFnZ5ECIT6M0dKvoxo5k
6dB0TXAxBrdmH1e+InXeoOXwLQAzArtkqI7q5FC7pbXY4td9XOAAz9Ap4Kdgjm8r
z92AtEGkBdfHcOTQ1MWDppYAIcEQTH4uiPseAl5OpKc6fiEE3zD3vB3EsBwdaBGK
wrvaXB5d
=pEsf
-----END PGP SIGNATURE-----

--=_MailMate_43E29186-BF6B-431C-81FF-73AB6A9D28BD_=--
