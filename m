Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82238375A6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 20:50:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbjLb3H3Mz3bTq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 04:49:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KjiJTdcp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.93.46;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=KjiJTdcp; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbjKz6zf3z2xxt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 04:49:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEo2/ib1e2hzWam0WMg6kUnpF4wED1KOioOupGaER9EIkCMkeUdCWsCokcTHJL44UKxwj/rQpn/Ez742k0hUiZJH4IIUnqI1B9mQ0lXcNme2HoebLJd43yEeB1LUXTOF1i+Vb7h1KpRY48zVlaLDid7GX2JTygZQun07m7LAb3HYq1vn4KVdAkYrQBjwVn5ykswmEMVMCFCmOw+b9MAdrHwgAwLiNuEkCxlLTYwQIXGAUiBo4I39Z9TvhVPQUSY89QqCY9oMpLw0/1E/Nj5WIbx4tSKINKsqLQjiTYLz/KrNxZWxIas9H7ZIMPC610vOI2jBHG8z9tPb8nVrmdcUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaA5JCCrl+WaQBOWn9EwgrQmHKdYMnicDWf4fJAmbPY=;
 b=g8zMuyi4jOL5+WHye48zvvO3nSxuoaB2lgjZDcbujhDhRwpJnjP2kAEGHVHNuG5Uj8hm4L6fmptjCYMMVbhN7vy+7EBuuhHDPKb5Ybqlw6JFKacDWir2Ae9PgCu6K7/XkbCZq72cbhyQIeW1IJeupUbiaK8PUz8B2gGyG7k0oQsvEG3NIIAgNvRLdd2C1LjeGNh484mj8Ws0Htt3FR5PAeE9i7tszOPJoWIhJzZs8D+9q/ThoeTr39R+k8QTvtrfCr3V1MIU/f/RmUWCJNmZSX/dUXTi5BcrSc9JjhPdlwtehRQ8f4iYYvd/awFpb67qeIM7P0LZoCrGObDLglefSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaA5JCCrl+WaQBOWn9EwgrQmHKdYMnicDWf4fJAmbPY=;
 b=KjiJTdcpMjkda4pDM98roglebEg1p9l+DtMnFRApIacZKPoAiKNMBhk2M3MyYrJnzhaIlM8eCChICCFBGSbJyccSptHSHdgnAB7M81OnzT5GZA1vxbkbyfCF5ofhIH4jLs4DvjbQ50yRP9vwy3JL5qvA5VC9+VFmZQUQKOuR1BelF/PrkMRnN0yovKxHH96QF3Ga0s3qLiBiRkhxDAHsJBGdUEzx0yRmjEzlNtdreQ4JIho3c/vPGLthSAs/DL9tAgeAQTcsikw1m5aH9ea3wPM5O/2BbvA+X50FuJ1J9s9hYQbf6Na8nsHKqx42JmigzFCEBWcmE6Tz0bapHVZ19w==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB5011.namprd12.prod.outlook.com (2603:10b6:208:1c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 18:49:16 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 18:49:16 +0000
From: "Zi Yan" <ziy@nvidia.com>
To: "David Hildenbrand" <david@redhat.com>
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Date: Thu, 06 May 2021 14:49:09 -0400
X-Mailer: MailMate (1.14r5757)
Message-ID: <3A6D54CF-76F4-4401-A434-84BEB813A65A@nvidia.com>
In-Reply-To: <f3a2152c-685b-2141-3e33-b2bcab8b6010@redhat.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
 <3a51f564-f3d1-c21f-93b5-1b91639523ec@redhat.com>
 <16962E62-7D1E-4E06-B832-EC91F54CC359@nvidia.com>
 <f3a2152c-685b-2141-3e33-b2bcab8b6010@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_4E6142BD-3CD1-474B-93C8-703340E8202A_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [216.228.112.22]
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.49.219] (216.228.112.22) by
 BL1PR13CA0218.namprd13.prod.outlook.com (2603:10b6:208:2bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.12 via Frontend
 Transport; Thu, 6 May 2021 18:49:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44cdb326-7258-4f09-06ba-08d910bfa63e
X-MS-TrafficTypeDiagnostic: BL0PR12MB5011:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB501190DD4C5D170A29899B91C2589@BL0PR12MB5011.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1sddUj8TinhHcolYUp28a9YtL4n5AznegYSgqgc4SvyrRaqrLRkoibdfmM7jDYyJe4E0s4pStg/D9ippvshc2FEbpn6Ro4HHZlRnORyogtsmxKJNCzE/u0dT/6cKh9hOwaxbZACwTfUb+CCkwIJRphGZ9ojoGVBrE/X0Po/yjSwh0uDejL++ZOFnE//ViXM48jKlvb9ptVFN87uIEm5dCVxTyEz2uF5OeVPrbLffL8c7wDSPYHNAD96VgormXILEuNKx8LRQriAMTx5epMPrc+2Bg9kqjuiPvHlQnEXyfa14IWHDcGZVhEbGIoq6wGGsanU0U6nqk363oVkLAcvqsR9SFY2w+WAvARz1h3RfhXyARYwMzigINr0C/y6m4vjNWJY4eJZ2R7/6gBhkIJgiNorD+E3mj8b+KT1mabely4AGqMkIaNrXJmS4rv1Ngiy48saMURJhKzEGn9X79gVNG3fppr9axVMbnjZmLW4kJwZqarhQWGKof1HszKsaWXBEMiyQGUDZg0zgus41tAOEfxd8B4IR3vPm3DPzdDvt+wW+X8t3PZVGQbJ3lYerEiC/jUeQDZzd5l2i0D7z69d3cBFiByNcPsfsoQB6xP3UekQpVDevIgfT6y/oGkNawyPjiX4aM2i1nzLrUIpNQzBFD4u+l5cMzBvghFKV2cSwgk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(38100700002)(16526019)(956004)(5660300002)(83380400001)(33964004)(2616005)(53546011)(2906002)(6916009)(235185007)(16576012)(33656002)(6486002)(316002)(86362001)(66556008)(66476007)(478600001)(4326008)(54906003)(66946007)(8936002)(26005)(6666004)(7416002)(36756003)(186003)(8676002)(45980500001)(72826003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?emRZM1EvV29sazhtNGpqcm5GdzhqMER5T0FHWGhaUnBPbGdYcHI2UmoyaDVR?=
 =?utf-8?B?R3NYZGFrdjhBTUpPd2pHYndKbTZaVjdhZnZ4UHFhZ3BKL29tSlV6TzlINXNO?=
 =?utf-8?B?TG51eHZ3bGF4Q3h5NkNJaVpqT3dYV0JQOWtURS9heFBzZHJyaXVYUlBkbkZM?=
 =?utf-8?B?Y2lSNHFsWThjMzVRMzFSLzl5NmJjMmpmMEI4aFBhMktZY1pxSnBIc2crVkk4?=
 =?utf-8?B?NzU0Tk5vSkwwTHErR3Q5VkVZWW83THlGWFo3b1gvRTFOd0l6QWlYRHhTclZT?=
 =?utf-8?B?bXZ2ckFjbWhuME8zb0c2V1R6MEU4ZExKOU1FY0VQb3lIa3NFN05jTHIwWE4w?=
 =?utf-8?B?R1l4ejlidkdjNmoxMTZvWktPU21Ta2lHYkJwd1JBNks5cjBJNThXc3RvQmtr?=
 =?utf-8?B?Q3JCV3B4NE5kMC9JeFJ0RWE0eFNmNUZVRWhzYnIwMkRkMnhRRm9nWHpoRUZh?=
 =?utf-8?B?TVpuSVk4amVtai80d1kvbWhjaDV6ZDV0R2oxM3NHQ2E2elZrS0dDMU1yVnNm?=
 =?utf-8?B?VVI4Q05GVmlZK09qdDF4NEVRbDNKZUhBWkxqbVBUanl0UE1PNTlkQitzb2dN?=
 =?utf-8?B?dVNEOHFpalN1cldFeFBNbThvYkhJSjFzOFI0NklxZGMxTXAzYzVPUnYwdWw3?=
 =?utf-8?B?WTE3dHRZdlp5Wk44b1E5bnlwRDl5cW1HM0hkOGZTYjNPR1hzK0JFQlJGcEFL?=
 =?utf-8?B?VlgyZytyUjA5MDRDWjJna2pSdWY3anNuVGRRU1FsNVNGZHlxVm5yU3ZWUlpG?=
 =?utf-8?B?VHFpdnZtV3BSbmxCMWpuRHdmbFhOZ3NaeG9uNnpnZklQTWJrRU1qclBUSEsz?=
 =?utf-8?B?aHpSSUVraHcrNWdCQU9MNjJYUGh5TUZHMXE3aXcvVlgzWlR3KzRIcUZRTWZX?=
 =?utf-8?B?ZVJTSDJiTXBGUDZPbFIyZkZ5RFpaSXRzWWJ4dWxEVzZ3RUFsdDZCTTQ4cUN2?=
 =?utf-8?B?MmpGQkM1V0lla1RYZk4wTnJiQkl4RXpCU1daOWV0ZFJBTTN3c0I1QnVCUU9i?=
 =?utf-8?B?WTRlV0ZhbnBNTHZCOUE0ZHlGWVdnR1JoUWI2RmZMd0czUVNyVUdibVRvcXZu?=
 =?utf-8?B?bm9sNVMwRUVXaE04UXY3ZXV0SjJZUEtta0dzNmJ2WkZTa3lteHdvMnNRQXZa?=
 =?utf-8?B?S1FFK3dIWjdUc3J3c0NWaU9OWHdwWTJCelFPZ3dvRjIvUFJYNlhybnJHdGVn?=
 =?utf-8?B?ck1WcXJGd2lLK2V4SWNZaG4wcVg1UVZmOVVueXpVOVZKSnBFZzg1SUNDNyt4?=
 =?utf-8?B?QlZQeHpHWitEVjF2Sy90OXlSY1gzOThQcUcrUkRnZ1c0bGJSbDZYZm9zZjF5?=
 =?utf-8?B?a0tNWTdsM1FUYml1SmtxWEc1T2lBZlg2NmNXQ1J5eGRUeFljRTJnTk5XT0hT?=
 =?utf-8?B?UW5ldnlHY01HTDNBSDQ4OVFRbzNFTkFzT01nNks0L2ZkNGF0djQxRlJiQmNn?=
 =?utf-8?B?cWdBUWZMNW8zY3huSnYwdkE4eWU4SkhQd1NFYTdrUHJGTGxvRi9NckRIS2RI?=
 =?utf-8?B?MlZrVlBySjJzYm9xZXcxM1FQMW9BVTRZeXFBTHlZczRVRTNiTWxVdUJqR0hI?=
 =?utf-8?B?dS84QmhRUnJPcHNWdldIQWFnNHh0VDRIdG0rN3JhcjU5ZHFIMm80QkRZdWQ5?=
 =?utf-8?B?bk1LdkFXMk9BVmd0WTZ4bDlUczZPeGdHYzBHVStaY01BK0dHMGdrNVNBcFF4?=
 =?utf-8?B?eEg1bkN1dVZqUEVjZVJNZkdqMGlIZk04QlBzZ0FrSVB0RHcyWGQyenVDbnZ2?=
 =?utf-8?Q?sOOVYXoNTlk75A4VOJwPod/7drOtgn9Sn4XAL10?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44cdb326-7258-4f09-06ba-08d910bfa63e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 18:49:16.6534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6ZJ9lbkzVoeMEBcbD+Vx6jo/ThNBZMwXNn7D5xS+iiBAttfpsRwxUFZC0tgoym1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5011
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

--=_MailMate_4E6142BD-3CD1-474B-93C8-703340E8202A_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6 May 2021, at 12:28, David Hildenbrand wrote:

> On 06.05.21 17:50, Zi Yan wrote:
>> On 6 May 2021, at 11:40, David Hildenbrand wrote:
>>
>>>>>> The last patch increases SECTION_SIZE_BITS to demonstrate the use =
of memory
>>>>>> hotplug/hotremove subsection, but is not intended to be merged as =
is. It is
>>>>>> there in case one wants to try this out and will be removed during=
 the final
>>>>>> submission.
>>>>>>
>>>>>> Feel free to give suggestions and comments. I am looking forward t=
o your
>>>>>> feedback.
>>>>>
>>>>> Please not like this.
>>>>
>>>> Do you mind sharing more useful feedback instead of just saying a lo=
t of No?
>>>
>>> I remember reasoning about this already in another thread, no? Either=
 you're ignoring my previous feedback or my mind is messing with me.
>>
>> I definitely remember all your suggestions:
>>
>> 1. do not use CMA allocation for 1GB THP.
>> 2. section size defines the minimum size in which we can add_memory(),=
 so we cannot increase it.
>>
>> I am trying an alternative here. I am not using CMA allocation and not=
 increasing the minimum size of add_memory() by decoupling the memory blo=
ck size from section size, so that add_memory() can add a memory block sm=
aller (as small as 2MB, the subsection size) than section size. In this w=
ay, section size can be increased freely. I do not see the strong tie bet=
ween add_memory() and section size, especially we have subsection bitmap =
support.
>
> Okay, let me express my thoughts, I could have sworn I explained back t=
hen why I am not a friend of messing with the existing pageblock size:

Thanks for writing down your thoughts in detail. I will clarify my high-l=
evel plan below too.

>
> 1. Pageblock size
>
> There are a couple of features that rely on the pageblock size to be re=
asonably small to work as expected. One example is virtio-balloon free pa=
ge reporting, then there is virtio-mem (still also glued MAX_ORDER) and w=
e have CMA (still also glued to MAX_ORDER). Most probably there are more.=
 We track movability/ page isolation per pageblock; it's the smallest gra=
nularity you can effectively isolate pages or mark them as CMA (MIGRATE_I=
SOLATE, MIGRATE_CMA). Well, and there are "ordinary" THP / huge pages mos=
t of our applications use and will use, especially on smallish systems.
>
> Assume you bump up the pageblock order to 1G. Small VMs won't be able t=
o report any free pages to the hypervisor. You'll take the "fine-grained"=
 out of virtio-mem. Each CMA area will have to be at least 1G big, which =
turns CMA essentially useless on smallish systems (like we have on arm64 =
with 64k base pages -- pageblock_size is 512MB and I hate it).

I understand the issue of having large pageblock in small systems. My pla=
n for this issue is to make MAX_ORDER a variable (pageblock size would be=
 set according to MAX_ORDER) that can be adjusted based on total memory a=
nd via boot time parameter. My apology since I did not state this clearly=
 in my cover letter and it confused you. When we have a boot time adjusta=
ble MAX_ORDER, large pageblock like 1GB would only appear for systems wit=
h large memory. For small VMs, pageblock size would stay at 2MB, so all y=
our concerns on smallish systems should go away.

>
> Then, imagine systems that have like 4G of main memory. By stopping gro=
uping at 2M and instead grouping at 1G you can very easily find yourself =
in the system where all your 4 pageblocks are unmovable and you essential=
ly don't optimize for huge pages in that environment any more.
>
> Long story short: we need a different mechanism on top and shall leave =
the pageblock size untouched, it's too tightly integrated with page isola=
tion, ordinary THP, and CMA.

I think it is better to make pageblock size adjustable based on total mem=
ory of a system. It is not reasonable to have the same pageblock size acr=
oss systems with memory sizes from <1GB to several TBs. Do you agree?

>
> 2. Section size
>
> I assume the only reason you want to touch that is because pageblock_si=
ze <=3D section_size, and I guess that's one of the reasons I dislike it =
so much. Messing with the section size really only makes sense when we wa=
nt to manage metadata for larger granularity within a section.

Perhaps it is worth checking if it is feasible to make pageblock_size > s=
ection_size, so we can still have small sections when pageblock_size are =
large. One potential issue for that is when PFN discontinues at section b=
oundary, we might have partial pageblock when pageblock_size is big. I gu=
ess supporting partial pageblock (or different pageblock sizes like you m=
entioned below ) would be the right solution.

>
> We allocate metadata per section. We mark whole sections early/online/p=
resent/.... Yes, in case of vmemmap, we manage the memmap in smaller gran=
ularity using the sub-section map, some kind of hack to support some ZONE=
_DEVICE cases better.
>
> Let's assume we introduce something new "gigapage_order", corresponding=
 to 1G. We could either decide to squeeze the metadata into sections, hav=
ing to increase the section size, or manage that metadata differently.
>
> Managing it differently certainly makes the necessary changes easier. I=
nstead of adding more hacks into sections, rather manage that metadata at=
 differently place / in a different way.

Can you elaborate on managing it differently?

>
> See [1] for an alternative. Not necessarily what I would dream off, but=
 just to showcase that there might be alternative to group pages.

I saw this patch too. It is an interesting idea to separate different all=
ocation orders into different regions, but it would not work for gigantic=
 page allocations unless we have large pageblock size to utilize existing=
 anti-fragmentation mechanisms.


>
> 3. Grouping pages > pageblock_order
>
> There are other approaches that would benefit from grouping at > pagebl=
ock_order and having bigger MAX_ORDER. And that doesn't necessarily mean =
to form gigantic pages only, we might want to group in multiple granulari=
ty on a single system. Memory hot(un)plug is one example, but also optimi=
zing memory consumption by powering down DIMM banks. Also, some architect=
ures support differing huge page sizes (aarch64) that could be improved w=
ithout CMA. Why not have more than 2 THP sizes on these systems?
>
> Ideally, we'd have a mechanism that tries grouping on different granula=
rity, like for every order in pageblock_order ... max_pageblock_order (e.=
g., 1 GiB), and not only add one new level of grouping (or increase the s=
ingle grouping size).

I agree. In some sense, supporting partial pageblock and increasing pageb=
lock size (e.g., to 1GB) is, at the high level, quite similar to having m=
ultiple pageblock sizes. But I am not sure if we really want to support m=
ultiple pageblock sizes, since it creates pageblock fragmentation when we=
 want to change migratetype for part of a pageblock. This means we would =
break a large pageblock into small ones if we just want to steal a subset=
 of pages from MOVEABLE for UNMOVABLE allocations. Then pageblock loses i=
ts most useful anti-fragmentation feature. Also it seems to be a replicat=
ion of buddy allocator functionalities when it comes to pageblock split a=
nd merge.


The above is really a nice discussion with you on pageblock, section, mem=
ory hotplug/hotremove, which also helps me understand more on the issues =
with increasing MAX_ORDER to enable 1GB page allocation.

In sum, if I get it correctly, the issues I need to address are:

1. large pageblock size (which is needed when we bump MAX_ORDER for gigan=
tic page allocation from buddy allocator) is not good for machines with s=
mall memory.

2. pageblock size is currently tied with section size (which made me want=
 to bump section size).


For 1, I think making MAX_ORDER a variable that can be set based on total=
 memory size and adjustable via boot time parameter should solve the prob=
lem. For small machines, we will keep MAX_ORDER as small as we have now l=
ike 4MB, whereas for large machines, we can increase MAX_ORDER to utilize=
 gigantic pages.

For 2, supporting partial pageblock and allow a pageblock to cross multip=
le sections would break the tie between pageblock size and section to sol=
ve the issue.

I am going to look into them. What do you think?

=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_4E6142BD-3CD1-474B-93C8-703340E8202A_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmCUOiUPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKQxwQAIwdvlJCO/3aI45RAe4SVGdMAicXn3W5vkpK
QwXwEyiAWQDQN7VFEZDpffx/A4sP3D4Seh2V8l+xBj3cNnElnbWzbxnm7D/9TuOi
QiXpADUS5MGwO1JAtqQ/fgwuOjPIKXXvw1e/8u5NRh17CCoATGc165leSJqrTt6T
XntZXgH76lVxmYO0bswzb5yojVVo3OKiIlpAy1dtDyELzw67dnof0h3qnRTOlFJo
XQUIMfA3KeVTVvR+66IWPxjr6Gqjibd3ntZMkGVUB54yjPClEJ1+yyBfVJDvnfag
v8TosgUBN9gXeUi1uk2TngTwP7ydsq6xec/8EI7/f0RUmY+LJnoyIXhirI1rb3fB
PnyJch0jTyqwdQ0m/UxCS9w2meAfbpkUDxUcXLYa1eGq5B6zWiagEmpEw6plxa3P
yRl+r3GUfwUIRP3lAVkP+gNjuh4xmnk9eia5DrSEbSlSyDozCNYfhpO0GRwxpyXJ
zZBoWmI+suY582hIPI5rfXJDvypet5zeq8Ao3eyIFqu99PQzDlJIG1HflnK0+XIE
03lHj5E/vGGs8eFE6MrAIhcaRU5YZVFFlk7hrLi7XYWDDKiYddgLhMStvO/aBol5
qGZ296qRxnByo5U6GkTFdXXCKVqcWPpvwn8tH+P7uCQ4UZIheKXlsJWsZDJnMnAN
den8JOoa
=rO6N
-----END PGP SIGNATURE-----

--=_MailMate_4E6142BD-3CD1-474B-93C8-703340E8202A_=--
