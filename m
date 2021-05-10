Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577F3790E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 16:36:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff3Xg6rFgz3bnR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 00:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SJvLXtvD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.220.67;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=SJvLXtvD; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff3X63RKgz2ysk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 00:36:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UljH+NvzgtWKNPecZVBqNadJioPVB+bn4QVGcQ5/44bqUOpl1x0vvkz8pHN2W2KrkFnCTwe4aRDNfoP3ycuRhISM5imG5QJWTqtY8ipAepHVeacDf9iRmNNtjlUcCzmUGrJyPRUwA/nr8dTNduN/7GRylGfE+6QP8D++C+lTC0CcQNYZf9Q9ZfYJccrm5yYZDx/dZKBzaEUqYIbpRTXuHPH/kAmDacEHMRByBfbdVdztExsLzAcC7IDqpZIsW3URXU0WF1DKXcQHIrDB1VLHNGE3CqGBkw2vdSn9tz3/ShdXp0onCQITbGWncQJnUvx1gDdH7gIWBuiTbDG/yySB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOsHiU6ucx2Z7o36iT9C+tqCSb+DsjIU0sSPNMWIRb8=;
 b=SHZFf0o2YSDxgQzVBIakfh2A2Si59izlz/f3Bbf7xcqzsB7XWQk00dzuETdD2d+r5MfAC90rTim61Rq6jy1npWhbmSeZniZgUJsDMW8CEA5DxG36R65UAKYIFn3JP6Yxo1TTEHnrnSh1YoEsDnamDJEBz8uMbYaTGs9Z1zthucXw8fhBJ4KpqAl4XfNk/JLjylWuGU3/wEsAIEJ5SBkzHedC68V6oWLtOvPeN8GvU1G1LE6yLMOJUczml9lBRDsRWgONek3CixiOVvrqV12MgF8uZT6lbkswKc+kAAg3N5+onetfKDimg7Uj3/UExIjIfngP+YM//tqu12B060rloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOsHiU6ucx2Z7o36iT9C+tqCSb+DsjIU0sSPNMWIRb8=;
 b=SJvLXtvDsp9Y+QAzhJD0SavX03Hc7IXiEa57KVHngewJbpZkUB1hqU3S5h4omdO2Po6BtR9vD3u95sQYzFTHlsb6l4KDgl47M4H1RyHCfDHUXbZKxnqeSaONQeF35dQ2cT0TFDOM668SuhNaYTRvRhZdlnSOj7xVAmNg0jKAiCJuCyRE7H0to8enfgMUh/g7BtE1ePmMq8j4POtdrSHc3hFZ7PMW8AABN/hCdGJd47XeeYdpqrxTN/ukbE3vBWuTBMGMet8a/hkbsX/jFYKD7I15zEjnSAYw3ZFwuGIo73YL/lFe21PCIbXd17x5rJL5IzgSUXFG//OZLaP4C5zM5Q==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Mon, 10 May
 2021 14:36:11 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 14:36:11 +0000
From: "Zi Yan" <ziy@nvidia.com>
To: "David Hildenbrand" <david@redhat.com>, "Michal Hocko" <mhocko@suse.com>
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Date: Mon, 10 May 2021 10:36:04 -0400
X-Mailer: MailMate (1.14r5757)
Message-ID: <746780E5-0288-494D-8B19-538049F1B891@nvidia.com>
In-Reply-To: <792d73e2-5d63-74a5-5554-20351d5532ff@redhat.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <YJUqrOacyqI+kiKW@dhcp22.suse.cz>
 <792d73e2-5d63-74a5-5554-20351d5532ff@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_E335F9A6-81B9-4542-8F00-632486119085_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [216.228.112.21]
X-ClientProxiedBy: BL1PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::12) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.55.192] (216.228.112.21) by
 BL1PR13CA0097.namprd13.prod.outlook.com (2603:10b6:208:2b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.12 via Frontend
 Transport; Mon, 10 May 2021 14:36:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeaf4f9f-4eef-4ec3-d60c-08d913c0f4f1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB406479244143D9042452B097C2549@MN2PR12MB4064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWNFF3TvSqrcB2HY07r4vJoXdJ61UT0nMB6OrjFSDb+RjCimACjg9ox2U7mMeh1AtzHCx2HMnaSx/Gk5fIiooNJ+gZxXAuOkCtYeY1+K8AgKk01Z75qp4Sa4iAc0dM4nduEWttNa8ACf9ztdELm4zYJlAdYZa3LBxalV8rtQT8L1s7hinOov5YB/AuLD0q8oOdYc7VmHMM91LyIGCsKabCGqM72NlQUHtsX/RCKPmGcXkUBucuXkvSq7Lwg80b4CwqZYFOLgfp3IH2qq/FU+AKfoxhv3rUXcv9kmdqnMBW3p072a+74RzCc3AVGKjmk503VpaS38dEhW1QPcuTzqBYRPMtWf8HGAAi5VtXebVuHLHmeWhxygxtM0Z+/y/bpgdJGXOjDxojrAjksW3G730zrafoSORPUm+ZU+aEdOnIWmnIOsLExfJjhY6bVpF86gjOPCj03CX+I0v7yDRa+LvZt2Xj18cZqS3KXrD4ey8Ls6dwihTXnsxBlsndyhAEAHeDTvUIurGatoXZ+7BlWy3+VVJHV73/bKQvM4NN/kioSEoewEsdSd/zNChiUb3ggM9qOlEiXjycMJGP4ZTqAh1qjzc6br4jiYQk9eH2sUskHXHVsxLhcYdpxRt9u+X1i+VTSVa2A3FWSsnEkVMiP5cHjcoY+4e0RQL80knK3H4Nc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(26005)(16526019)(33964004)(478600001)(235185007)(53546011)(186003)(38100700002)(7416002)(5660300002)(2906002)(6486002)(86362001)(33656002)(36756003)(16576012)(54906003)(110136005)(66946007)(66556008)(956004)(66476007)(2616005)(6666004)(8936002)(83380400001)(4326008)(316002)(8676002)(45980500001)(72826003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXFmK0ZVMHk1SXVDSzVQNjh4NTh6clBZd3dVbzdkWFNnOEdSZENFdGtHeTVv?=
 =?utf-8?B?VTJpL3I4UU5UYjlkLzZjSEhPaGp3K2FjdzIydXpoaytLZW5PbnJFMjVYTUJ1?=
 =?utf-8?B?SUxKY1RkYWRDcTBPWVBQWkhhOUxjRmVjcWN5MUdVY0l6UnROckhjcUtyY3Vz?=
 =?utf-8?B?TUhBUDMrQURGZjNIdXlBV2hxR0dUWUlZYnFFMXVyVnFJYk1EN21OdldLdUVv?=
 =?utf-8?B?RWtoTDBqVlFsRXpZUW9mNC9WT1RSMEZlNy9VZGtNdmc3c0hQaHlBeUZlNWtx?=
 =?utf-8?B?S2ZzRjFydU94cW9Bb3JmYWtrQ0ZWaFpLWkN1NkF2WVlCUEt4RFFzMm5INlZW?=
 =?utf-8?B?MWYyQTB3bWFNTmJrKzhYOGdxMHNRUmxLOUJCY2VKRjZOL2xxNUJMM0dUdU5X?=
 =?utf-8?B?NGZQRWRweVY2SDRaRlgwWGl0VlVxSUU4UEgzMjVSblFXZXpiY0cxV1lyOFBk?=
 =?utf-8?B?bCs5eWM5U2tKZ0JBa29lYS9KSzZNdE96b0xaczQxdDFkT0FjNkZVV1hPYVFB?=
 =?utf-8?B?TW0ySUI3UUZCeVRxemhtTGJrclhWVUhKUW9XQ2JTQUpBUU5SL0RUNGhZT09u?=
 =?utf-8?B?N05rdU56cnJoRnNwZ25UVi9ySjJJQWlrZUtCalNmcXdBd2d5d01VamliaVcr?=
 =?utf-8?B?L2JaWERBSUZ0YUhrZ3RHblZJM05Sc3ZTN2xTTGo0UUJveG85YUs5TWpKRUtB?=
 =?utf-8?B?T0JiR2F5R0lpdjZ3MGFzRVU4a3IxaWV2WGFBSkliTGV5NTFyUEdzYW43Z21o?=
 =?utf-8?B?cU52VThvTGlDRzZKODU0alhTNStUbEtJaUJyMU5ldHBxMWhBc005Mlk1Wjhx?=
 =?utf-8?B?MGtSZWlBR25RYXlRNzhyV0pmZUdwNDZ3M2pCUnV5aEh1V2lINnE0ZGZvYjJM?=
 =?utf-8?B?cHJ2RWYwN3pWV2RDb0VFRG5PM2lXL3dESnMxbFJ0NGthSEZWUWtrM1o1NVQw?=
 =?utf-8?B?dStQZUMwOEVmNVk3WXllVzdYQzduR2VublJtQnFaSjE3QUNUZUFCWGdXeVpn?=
 =?utf-8?B?RE1hbTI0U1RCVGpKbWgwMWRRNXp5S2JmZlNxamRmU3NZUzhaUys1QjdZVG0z?=
 =?utf-8?B?UE42b3MzQXVMS2ZYTEJYa2huLzliM3pQWnF3N0lNb3pSajc4c20wSmg5aVBa?=
 =?utf-8?B?d1cwQkVGMTloaVVZdklyakVIZnM2bEErNVBLcXNVM0pyMHVpdXNpazB2SExH?=
 =?utf-8?B?RWJvaStBUjVCcU94dmw0czN2MFUxTmM3VTI0dm5pSUdwSUNOOUFQREhYVFdR?=
 =?utf-8?B?R3I4UTVWaDFiUDhKTU1IRXhWZ1J5TmUvRXR6WWdSWVp0UEJESFN1NUZyNWtY?=
 =?utf-8?B?cmhNam5WN3pRVUFHYUJRaWs4V1pQOXlhSStib3VLMkplOHlpK1BTYlA2Si9a?=
 =?utf-8?B?MFFxMmZVZVp4QmRYTjk1bGVia0FxU282bzdhVzN3Vk1HdU1HWGlmZWVYZ09Y?=
 =?utf-8?B?U0YzcXA2dmQrbnBsck1oY0p0NDlXSWYrRTBTTGh2emZaeGF5Z3QrR1diM3Nn?=
 =?utf-8?B?SGs2UStTNjNISzRqT1o1SVovM1NHTTNqUWZIUXJpVnVvbFVWNTBXZ3ZuaUpz?=
 =?utf-8?B?emNQa2g2bG1RSDZORGFnMk5udmJQMEllMitIZlB1eTdjU3plYWd2RFk5aTVr?=
 =?utf-8?B?WHp4bTlPZlFUWDcwNXpvTEFxNmxvWEhBU2YxOFpaNHd6cmxKWmMrbFUvd2k3?=
 =?utf-8?B?aGVmTXNFSzNDY1BtY1MzTHlqZk5YYm1neHdaMExhT3k3cmFqVkJxdTV0YWlJ?=
 =?utf-8?Q?YPy8Q+fIAgubOFzn3FdZN1ZB1LTuMzqV2W58pwN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaf4f9f-4eef-4ec3-d60c-08d913c0f4f1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 14:36:11.6222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSBEZ+GqjMxmX78tm/xz9fQBta1kcRyia1EPcDjyDelUGYOg6/M5fPA0P+w9m524
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
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
Cc: linux-ia64@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
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

--=_MailMate_E335F9A6-81B9-4542-8F00-632486119085_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 7 May 2021, at 10:00, David Hildenbrand wrote:

> On 07.05.21 13:55, Michal Hocko wrote:
>> [I haven't read through respective patches due to lack of time but let=

>>   me comment on the general idea and the underlying justification]
>>
>> On Thu 06-05-21 17:31:09, David Hildenbrand wrote:
>>> On 06.05.21 17:26, Zi Yan wrote:
>>>> From: Zi Yan <ziy@nvidia.com>
>>>>
>>>> Hi all,
>>>>
>>>> This patchset tries to remove the restriction on memory hotplug/hotr=
emove
>>>> granularity, which is always greater or equal to memory section size=
[1].
>>>> With the patchset, kernel is able to online/offline memory at a size=
 independent
>>>> of memory section size, as small as 2MB (the subsection size).
>>>
>>> ... which doesn't make any sense as we can only online/offline whole =
memory
>>> block devices.
>>
>> Agreed. The subsection thingy is just a hack to workaround pmem
>> alignement problems. For the real memory hotplug it is quite hard to
>> argue for reasonable hotplug scenarios for very small physical memory
>> ranges wrt. to the existing sparsemem memory model.
>>
>>>> The motivation is to increase MAX_ORDER of the buddy allocator and p=
ageblock
>>>> size without increasing memory hotplug/hotremove granularity at the =
same time,
>>>
>>> Gah, no. Please no. No.
>>
>> Agreed. Those are completely independent concepts. MAX_ORDER is can be=

>> really arbitrary irrespective of the section size with vmemmap sparse
>> model. The existing restriction is due to old sparse model not being
>> able to do page pointer arithmetic across memory sections. Is there an=
y
>> reason to stick with that memory model for an advance feature you are
>> working on?

No. I just want to increase MAX_ORDER. If the existing restriction can
be removed, that will be great.

>
> I gave it some more thought yesterday. I guess the first thing we shoul=
d look into is increasing MAX_ORDER and leaving pageblock_order and secti=
on size as is -- finding out what we have to tweak to get that up and run=
ning. Once we have that in place, we can actually look into better fragme=
ntation avoidance etc. One step at a time.

It makes sense to me.

>
> Because that change itself might require some thought. Requiring that b=
igger MAX_ORDER depends on SPARSE_VMEMMAP is something reasonable to do.

OK, if with SPARSE_VMEMMAP MAX_ORDER can be set to be bigger than
SECTION_SIZE, it is perfectly OK to me. Since 1GB THP support, which I
want to add ultimately, will require SPARSE_VMEMMAP too (otherwise,
all page++ will need to be changed to nth_page(page,1)).

>
> As stated somewhere here already, we'll have to look into making alloc_=
contig_range() (and main users CMA and virtio-mem) independent of MAX_ORD=
ER and mainly rely on pageblock_order. The current handling in alloc_cont=
ig_range() is far from optimal as we have to isolate a whole MAX_ORDER - =
1 page -- and on ZONE_NORMAL we'll fail easily if any part contains somet=
hing unmovable although we don't even want to allocate that part. I actua=
lly have that on my list (to be able to fully support pageblock_order ins=
tead of MAX_ORDER -1 chunks in virtio-mem), however didn't have time to l=
ook into it.

So in your mind, for gigantic page allocation (> MAX_ORDER), alloc_contig=
_range()
should be used instead of buddy allocator while pageblock_order is kept a=
t a small
granularity like 2MB. Is that the case? Isn=E2=80=99t it going to have hi=
gh fail rate
when any of the pageblocks within a gigantic page range (like 1GB) become=
s unmovable?
Are you thinking additional mechanism/policy to prevent such thing happen=
ing as
an additional step for gigantic page allocation? Like your ZONE_PREFER_MO=
VABLE idea?

>
> Further, page onlining / offlining code and early init code most probab=
ly also needs care if MAX_ORDER - 1 crosses sections. Memory holes we mig=
ht suddenly have in MAX_ORDER - 1 pages might become a problem and will h=
ave to be handled. Not sure which other code has to be tweaked (compactio=
n? page isolation?).

Can you elaborate it a little more? From what I understand, memory holes =
mean valid
PFNs are not contiguous before and after a hole, so pfn++ will not work, =
but
struct pages are still virtually contiguous assuming SPARSE_VMEMMAP, mean=
ing page++
would still work. So when MAX_ORDER - 1 crosses sections, additional code=
 would be
needed instead of simple pfn++. Is there anything I am missing?

BTW, to test a system with memory holes, do you know is there an easy of =
adding
random memory holes to an x86_64 VM, which can help reveal potential miss=
ing pieces
in the code? Changing BIOS-e820 table might be one way, but I have no ide=
a on
how to do it on QEMU.

>
> Figuring out what needs care itself might take quite some effort.
>
> One thing I was thinking about as well: The bigger our MAX_ORDER, the s=
lower it could be to allocate smaller pages. If we have 1G pages, splitti=
ng them down to 4k then takes 8 additional steps if I'm, not wrong. Of co=
urse, that's the worst case. Would be interesting to evaluate.

Sure. I am planning to check it too. As a simple start, I am going to run=
 will it scale
benchmarks to see if there is any performance difference between differen=
t MAX_ORDERs.

Thank you for all these valuable inputs. They are very helpful. I appreci=
ate them.


=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_E335F9A6-81B9-4542-8F00-632486119085_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmCZRNQPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKVCoP/0NXDCk4NDzURRYmnwbWMoc/8v67Y4ZQ2U47
rHYejHxvW9f/cg0lhZy205pPnYZKo3N82+yAPYpeEiV+YXmygOE+LDebvcv3I2oJ
n5/hWIix4sO7mTiJW1ZPhXFJkrGvWC/pF94YuVwl1NVwAmRgqSbYONuRrQ4slE/e
8WgDuprcQDqPGlBtGZWw2+zPyy0q8v/MRdY0lii6EU7/36vce1L6yuqHLOPmOqpw
U1xzmiUE02AA6+XwzMVPZJdABJhTQMjVjOyNx2CeJYGvidf6NFIWtH5gSOIgit8R
Kkfq8hsDScvJL2cBz5RX/QTvhRpWaaf6dAm3ERO+0E1n8/Azpjai6cNo2wh03Ly0
vszQuHyJGpIoZOwv+mX0+OZ7IKfk6VhCLo9dMJRMzTdwE87zg2q1hHDfRfEhvNAD
tbfIz0ySnfGxX+oEeaPKu+8oa2OfQ08noGGU0mnJRNXY8xGX2I6CmWV9YI5xyAf+
DOAsQnC7Qy/IjfYPnRzu4zB9r19HvjSpTSAx+yGnPNvhPNMNiSE06jFdkEms5tlx
RRDklENKX30+Tsqz1FuTyGDI3FYmpdBPD4lZGGcBIAn6EI5xj7uHO+LTd4wtaWNn
y3mM6MyTM89uae/wauqCYE50Ua9inabY8W6DQ9sncd2RXecvCMh0ivcCebMepQPG
v2QZ0RvL
=96Ul
-----END PGP SIGNATURE-----

--=_MailMate_E335F9A6-81B9-4542-8F00-632486119085_=--
