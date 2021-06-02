Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95075398F6E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:57:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwDF102kGz3076
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 01:57:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QgQWDTjR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.92.54;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=QgQWDTjR; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwDDK3b7lz2yY1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 01:56:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTROhl3EZ0XLiqhAxJGc91yNZ7cdYgxvcPMX78+ehrTCaln6CINX8jufe/3ggX50i13ChaoAMFZCipvCCfwTR9Oh/A5LCnSwUztmlTORFjW/8o8aQSPbj6tVb0p493Jb2k5ovUSajRYYU+qDmV27obkHWcT5o7hpISmhMzkzaD6hlTtwdZyvW1wZEBLvkk2IJdT9up+GpuIaN5DJ3LX/te4chq4XRU4RhLBUTljkeia5FGPzdtLQQmO9jPJMjJ5+axsnTE88e2wIkywAJJrOULS4g1+cSyzI3eDnT0+b6WqSMGB5wo3hT3wFI8sGx1k42rPompvadFWaccEq8XqXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FouUEDLM+C6xwXtVHsFqJOyVM8tMuqDeh8U0DIY5ozo=;
 b=Soeks3FuN1sf9SxcEPFyJ/u3ZYCGmFI47/HWRYuYOhA9dUJq9aYhJb7yx+LV/H8lPabP0HCYRaEl+DPEx+0hwv5c56ayBmbJc6SE3VV3qMab/4fDX+DN9W9xn0ykQjgLz9Vws+6bRWF5BW9yiXazJCjyaTXPmXK3kpv2JxTcH8cMV0QhwTEBKZVl5opRkeW+4M0QqLLiCNoJcGGgtqjjtrgzVwpz4na2k3tgKQSQDuBEbZRv8bfQIl5AhKm83fgsgC+G8qyXGPfl7s59QysjXDIZuDMqtlFv2yL3sadjSPb8QSh6zp2oA7NHtgd4DotXUrlIxVvc6GdKucfXAKG7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FouUEDLM+C6xwXtVHsFqJOyVM8tMuqDeh8U0DIY5ozo=;
 b=QgQWDTjR/aGoDg1G5I8PVodAtMnMxiOyvhiR5aJ2e2YP1ONvxJL6+yNtCfRiH6nFzI5SqhasK893u4uSF2zF81et6lA+OkKtO1TMDsfS9hJi9pr9/tCN3dnOGJhPcpZTK2ivcpWhsiAIPv4D+1SFfhnCZ6ONIS85FpHTMtmbwZ5G5r1swfBMESn1PC+ezhniOYG6ZzpYKrxGgMM+KtvdulvHKBKxmpDEDV0q2zRxg1ljPn75Qn9FdIc7sKRXplwe57iVObWNdZbFQ9Cmd1yYCu+xdEkiZzqWJwFvpRQH4HNYMGmOV9aA3Q7IbugGXySf+jx2zQuY5MepIc+OV8UG0Q==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 15:56:38 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2%7]) with mapi id 15.20.4173.034; Wed, 2 Jun 2021
 15:56:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Date: Wed, 02 Jun 2021 11:56:29 -0400
X-Mailer: MailMate (1.14r5809)
Message-ID: <289DA3C0-9AE5-4992-A35A-C13FCE4D8544@nvidia.com>
In-Reply-To: <746780E5-0288-494D-8B19-538049F1B891@nvidia.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <YJUqrOacyqI+kiKW@dhcp22.suse.cz>
 <792d73e2-5d63-74a5-5554-20351d5532ff@redhat.com>
 <746780E5-0288-494D-8B19-538049F1B891@nvidia.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_49457795-E15C-4266-AEFC-FB066903ABAE_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [216.228.112.22]
X-ClientProxiedBy: MN2PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:c0::24) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.80.67] (216.228.112.22) by
 MN2PR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:c0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Wed, 2 Jun 2021 15:56:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27086704-ff77-49ac-11d7-08d925df00da
X-MS-TrafficTypeDiagnostic: MN2PR12MB4078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40785B664BAB1A37B6DADD6CC23D9@MN2PR12MB4078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npuVQnrzkxHEKLG0TUda7mRpKf4RTMgb9YQ3b5uIEYzsGyo+kxEGg8zWOSzNeGcjBhZz5kldwV8Zod4B5YBSDT2UMCErP8E+bzFtFV8LbuXiY8bksbENVRlOtZH0XohzeCQ8grwJUMsFvAekZSDl61pTaTe54bmb708zU1Z3yKv1O1X1/z9hFNENP09rS0khbw/cseZ5zb6SXJEp3htAkVBpHdkILWkzoSWxD8ivz9ggTqqEuf7G0fEUXPvGTCl5gV5JfwNjST90L+IIVJbza1C/dnFyXJBxzti5aayRLeNxbS2W9nruXvU+j/SH20/Kq4wLN9PaiHTyYRzyjxGnLBbZZVaHp15gNItsDfQeF1JoN+9QzVOkRqscjdIwNNNdfwQoO/+xrXvUSHCglnM5Rvhh0O+gjNtfc3dJF3fR9nIdZVHE5p4/zA5k2QxU4Si+fAJOUMr+ft6qr2spGw1mNQF2lkBXK2iepSYzKHS3zY9jE7hmu5ffJywjdxpYNS6yrwwlOu+JLI4AQu3Mb4vIxuCVZuEwsoQPRIc4LN/Dft5Ro0ZF8kd6Glosr4GkyIEFulCCqR9CGUa3EGlzAdN9iVM+gCRRBy1wZA0o/Y6Y5YWxzFP34rFUZLlzyPH3t5iivdT9D/AWFfcbJwf2oN0zHhexvFGdctPKcvnZLpDmUGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(478600001)(235185007)(5660300002)(83380400001)(316002)(6486002)(2616005)(110136005)(54906003)(66946007)(956004)(66476007)(21480400003)(6666004)(16576012)(26005)(186003)(16526019)(66556008)(53546011)(66616009)(33964004)(7416002)(86362001)(38100700002)(33656002)(4326008)(36756003)(8676002)(2906002)(8936002)(30864003)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHNMcGJPSnN6K29NWHEwWDYva2c4Y0JjYjFYNWtMRmx5cXZQTDd5QS8xNzJL?=
 =?utf-8?B?SzRMS1lXcE1wbEJMaUpaSkVBQ040TlZZODRqVXN6UGR5VFo3M0xuZGhRTHRy?=
 =?utf-8?B?aHJsTEhTMEU4KzZ3S2NQTXVKM0llY1BzZlhlekZndUFOOFhDUVcwTHJKNk1s?=
 =?utf-8?B?VEE4RGpNMVpsZzFraVpCUmtiZ3ZpOWNYS1NrbkRvMW10WVV3VkZJbVFWWGZi?=
 =?utf-8?B?eFRZSm1RTXg2dTQ4MWhTb0lPTWN1eVRqTFo5U1RuQ2JYVHd6b3ZjbC8vU1Nw?=
 =?utf-8?B?R2htVTlWK3cxcG5sNkZYTVFZQklUbUlmd3hDeW83d1d4QnpXWVRMTUREbkZz?=
 =?utf-8?B?QkZ2ZXBObTRicDAzdWJiczNTakozZEVqNU80dmlDT2xwb1pad2hqNlQ3eVc3?=
 =?utf-8?B?YkUydHVvQ1RHQ21pdlNYcEU3alpTaE4zQjM1SVF0dkhtWml2Njh2Q1k1VUhN?=
 =?utf-8?B?TGVkT3JvUWk2U1JHR3B3a3pHSTRpUHdES2hnbytna3FndkZDWGlpc0ZMY1Jj?=
 =?utf-8?B?TVRIcUtjTDNoeVFBc1hKNHFjcEJxNWgrWnRwcUNGOVFPMkJWaFJDYTlrcmZ3?=
 =?utf-8?B?cStwU05HWTZvR0FiNjVud3BUeUJpZmZ0RzY1TW05ekFEVVpKKzkrc084Mlk1?=
 =?utf-8?B?K09TTzh5aGZ4cWdEK1NqaXNVTGY1RnVVR0ZnZ1NSN0Q0em9TREN6WlZ0STV6?=
 =?utf-8?B?YWNZRW1ZQlhmRW9Hd3FpK2hkYUxGR1hsTGxCam1CQy92Qjd0ZDdEUXpNMlJa?=
 =?utf-8?B?b2hOaU9Pdk13bXpITVVvUFg2NWJJUTBPNnNkMUNMb1M3ZFhzaEVxL05pNTJS?=
 =?utf-8?B?OHpqS24vZG0zNmlVaVhucFdBRWxmeWNLYmlPaTRRTEFMRGFpdzcyRUduM0RG?=
 =?utf-8?B?MjZWY1lvT3d6ODZsZXpROGx2M2tQYTQvdE1MT1lXVk5hMTZKRHlzV0pRQ3k3?=
 =?utf-8?B?aURtQ1pjOHNFNmhVSmJVY1JTQXFNbVZvaUk3R0pJRzRtWFZFeWlZT0VocS9S?=
 =?utf-8?B?VUpQbjVNUGdBSzBqR0w1TGMwaHF1Ykh1ajhzNXlFUTUzeHNQREx2TzVCenB3?=
 =?utf-8?B?OVozL0kwQ0NjTUJDUTVzZnNDQkNOTldPelRNU3pOaEhMTFU1Z1FYa1N6djNY?=
 =?utf-8?B?QmxNMytjSGFEc1dvd3FkNWRoVHF1ZEkzcDVleGpuM253dUg2aGxZb0pYSHl4?=
 =?utf-8?B?a2thaTRJb2lFOXZPSUhxY2RZcnJTdUFqVWUyRkRKZlBqRmlidGtLd1poWnVS?=
 =?utf-8?B?aWZTckJwSDRUcmJub0NSWk90MFc0MWNYbTV0MklPNG45THc2d1FzMTBVRVE1?=
 =?utf-8?B?K2tlYXdWRVN3RlBNZVdmb1QyS1orajZRWE1teWdRT1NrdkI3RzZ1N0ZoS0kv?=
 =?utf-8?B?TlZDRG5aM3FEd0ppMDZ2QzFLeWZMUTRhR3hvWENEOTZtbVVITmx4eEhTT2dE?=
 =?utf-8?B?YVB0TmhjcUZkdjNXMENtbFI5MjN6T08xTXJjeVg1MjVPSm55REgzcmx1WlRS?=
 =?utf-8?B?QVBhRi83WGl0VWg2bmZwWjNRN3YrOFVqVjZ4VWZKQkpWdkVLS2EyUUtVdkZ1?=
 =?utf-8?B?MVlaQmZUSXUyTlQvNmxTUS8xelhGcmw0Qm5GUHpNcjBJWTNRTEpRc0taT2Fv?=
 =?utf-8?B?WU1yWHl5NzU4NThCRWo1TXJaVXVZRURxRVYxRUdCWnh0OU9MMnB2OURWSnAy?=
 =?utf-8?B?Ykx0OTNxRWVlazdFU2t5NEpaeTc1ZzlWejR3Wk9RTkRZdGRUanJQK2pxVnBK?=
 =?utf-8?Q?auvsQ7z5o2kBz41AxzF1lDUndkuzPRW2eoT0VY/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27086704-ff77-49ac-11d7-08d925df00da
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 15:56:38.7453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRl8z0vwbB2gM3dFyOXqR9IaLjU/bDGW3adukXtKbpTmWvB9JJhxQyfoIJ6f8cb9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
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

--=_MailMate_49457795-E15C-4266-AEFC-FB066903ABAE_=
Content-Type: multipart/mixed;
 boundary="=_MailMate_38FE9B62-8ED9-48D2-88BC-C01C12090CF5_="


--=_MailMate_38FE9B62-8ED9-48D2-88BC-C01C12090CF5_=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 May 2021, at 10:36, Zi Yan wrote:

> On 7 May 2021, at 10:00, David Hildenbrand wrote:
>
>> On 07.05.21 13:55, Michal Hocko wrote:
>>> [I haven't read through respective patches due to lack of time but le=
t
>>>   me comment on the general idea and the underlying justification]
>>>
>>> On Thu 06-05-21 17:31:09, David Hildenbrand wrote:
>>>> On 06.05.21 17:26, Zi Yan wrote:
>>>>> From: Zi Yan <ziy@nvidia.com>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> This patchset tries to remove the restriction on memory hotplug/hot=
remove
>>>>> granularity, which is always greater or equal to memory section siz=
e[1].
>>>>> With the patchset, kernel is able to online/offline memory at a siz=
e independent
>>>>> of memory section size, as small as 2MB (the subsection size).
>>>>
>>>> ... which doesn't make any sense as we can only online/offline whole=
 memory
>>>> block devices.
>>>
>>> Agreed. The subsection thingy is just a hack to workaround pmem
>>> alignement problems. For the real memory hotplug it is quite hard to
>>> argue for reasonable hotplug scenarios for very small physical memory=

>>> ranges wrt. to the existing sparsemem memory model.
>>>
>>>>> The motivation is to increase MAX_ORDER of the buddy allocator and =
pageblock
>>>>> size without increasing memory hotplug/hotremove granularity at the=
 same time,
>>>>
>>>> Gah, no. Please no. No.
>>>
>>> Agreed. Those are completely independent concepts. MAX_ORDER is can b=
e
>>> really arbitrary irrespective of the section size with vmemmap sparse=

>>> model. The existing restriction is due to old sparse model not being
>>> able to do page pointer arithmetic across memory sections. Is there a=
ny
>>> reason to stick with that memory model for an advance feature you are=

>>> working on?
>
> No. I just want to increase MAX_ORDER. If the existing restriction can
> be removed, that will be great.
>
>>
>> I gave it some more thought yesterday. I guess the first thing we shou=
ld look into is increasing MAX_ORDER and leaving pageblock_order and sect=
ion size as is -- finding out what we have to tweak to get that up and ru=
nning. Once we have that in place, we can actually look into better fragm=
entation avoidance etc. One step at a time.
>
> It makes sense to me.
>
>>
>> Because that change itself might require some thought. Requiring that =
bigger MAX_ORDER depends on SPARSE_VMEMMAP is something reasonable to do.=

>
> OK, if with SPARSE_VMEMMAP MAX_ORDER can be set to be bigger than
> SECTION_SIZE, it is perfectly OK to me. Since 1GB THP support, which I
> want to add ultimately, will require SPARSE_VMEMMAP too (otherwise,
> all page++ will need to be changed to nth_page(page,1)).
>
>>
>> As stated somewhere here already, we'll have to look into making alloc=
_contig_range() (and main users CMA and virtio-mem) independent of MAX_OR=
DER and mainly rely on pageblock_order. The current handling in alloc_con=
tig_range() is far from optimal as we have to isolate a whole MAX_ORDER -=
 1 page -- and on ZONE_NORMAL we'll fail easily if any part contains some=
thing unmovable although we don't even want to allocate that part. I actu=
ally have that on my list (to be able to fully support pageblock_order in=
stead of MAX_ORDER -1 chunks in virtio-mem), however didn't have time to =
look into it.
>
> So in your mind, for gigantic page allocation (> MAX_ORDER), alloc_cont=
ig_range()
> should be used instead of buddy allocator while pageblock_order is kept=
 at a small
> granularity like 2MB. Is that the case? Isn=E2=80=99t it going to have =
high fail rate
> when any of the pageblocks within a gigantic page range (like 1GB) beco=
mes unmovable?
> Are you thinking additional mechanism/policy to prevent such thing happ=
ening as
> an additional step for gigantic page allocation? Like your ZONE_PREFER_=
MOVABLE idea?
>
>>
>> Further, page onlining / offlining code and early init code most proba=
bly also needs care if MAX_ORDER - 1 crosses sections. Memory holes we mi=
ght suddenly have in MAX_ORDER - 1 pages might become a problem and will =
have to be handled. Not sure which other code has to be tweaked (compacti=
on? page isolation?).
>
> Can you elaborate it a little more? From what I understand, memory hole=
s mean valid
> PFNs are not contiguous before and after a hole, so pfn++ will not work=
, but
> struct pages are still virtually contiguous assuming SPARSE_VMEMMAP, me=
aning page++
> would still work. So when MAX_ORDER - 1 crosses sections, additional co=
de would be
> needed instead of simple pfn++. Is there anything I am missing?
>
> BTW, to test a system with memory holes, do you know is there an easy o=
f adding
> random memory holes to an x86_64 VM, which can help reveal potential mi=
ssing pieces
> in the code? Changing BIOS-e820 table might be one way, but I have no i=
dea on
> how to do it on QEMU.
>
>>
>> Figuring out what needs care itself might take quite some effort.
>>
>> One thing I was thinking about as well: The bigger our MAX_ORDER, the =
slower it could be to allocate smaller pages. If we have 1G pages, splitt=
ing them down to 4k then takes 8 additional steps if I'm, not wrong. Of c=
ourse, that's the worst case. Would be interesting to evaluate.
>
> Sure. I am planning to check it too. As a simple start, I am going to r=
un will it scale
> benchmarks to see if there is any performance difference between differ=
ent MAX_ORDERs.

I ran vm-scalablity and memory-related will-it-scale on a server with 256=
GB memory to
see the impact of increasing MAX_ORDER and didn=E2=80=99t see much differ=
ence for most of
the workloads like page_fault1, page_fault2, and page_fault3 from will-it=
-scale.
But feel free to check the attached complete results and let me know what=
 should be
looked into. Thanks.

# Environment
Dell R630 with 2x 12-core E5-2650 v4 and 256GB memory.


# Kernel changes
On top of v5.13-rc1-mmotm-2021-05-13-17-18, with SECTION_SIZE_BITS set to=
 31 and
MAX_ORDER set to 11 and 20 respectively.

# Results of page_fault1, page_fault2, and page_fault3


compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/page_fault3/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   3199850 =C2=B1  2%      +6.0%    3390866 =C2=B1  3%  will-it-scale.24.=
threads
     54.94            +1.7%      55.85        will-it-scale.24.threads_id=
le
    133326 =C2=B1  2%      +6.0%     141285 =C2=B1  3%  will-it-scale.per=
_thread_ops
   3199850 =C2=B1  2%      +6.0%    3390866 =C2=B1  3%  will-it-scale.wor=
kload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/page_fault2/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   2016984            -6.6%    1883075 =C2=B1  2%  will-it-scale.24.threa=
ds
     69.69            -4.4%      66.64        will-it-scale.24.threads_id=
le
     84040            -6.6%      78461 =C2=B1  2%  will-it-scale.per_thre=
ad_ops
   2016984            -6.6%    1883075 =C2=B1  2%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/page_fault1/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   2138067            -1.3%    2109865        will-it-scale.24.threads
     63.34            +1.1%      64.06        will-it-scale.24.threads_id=
le
     89085            -1.3%      87910        will-it-scale.per_thread_op=
s
   2138067            -1.3%    2109865        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/page_fault3/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   3216287 =C2=B1  3%      +4.8%    3369356 =C2=B1 10%  will-it-scale.16.=
threads
     69.18            +0.5%      69.51        will-it-scale.16.threads_id=
le
    201017 =C2=B1  3%      +4.8%     210584 =C2=B1 10%  will-it-scale.per=
_thread_ops
   3216287 =C2=B1  3%      +4.8%    3369356 =C2=B1 10%  will-it-scale.wor=
kload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/page_fault2/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   2005510            -2.7%    1950620 =C2=B1  2%  will-it-scale.16.threa=
ds
     78.77            -0.2%      78.64        will-it-scale.16.threads_id=
le
    125344            -2.7%     121913 =C2=B1  2%  will-it-scale.per_thre=
ad_ops
   2005510            -2.7%    1950620 =C2=B1  2%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/page_fault1/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   2332446            -6.5%    2179823 =C2=B1  2%  will-it-scale.16.threa=
ds
     77.57            -2.0%      76.03        will-it-scale.16.threads_id=
le
    145777            -6.5%     136238 =C2=B1  2%  will-it-scale.per_thre=
ad_ops
   2332446            -6.5%    2179823 =C2=B1  2%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/page_fault3/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   3236057 =C2=B1  2%      -4.5%    3089222 =C2=B1  4%  will-it-scale.48.=
threads
     24.64 =C2=B1  7%      -3.3%      23.83 =C2=B1  2%  will-it-scale.48.=
threads_idle
     67417 =C2=B1  2%      -4.5%      64358 =C2=B1  4%  will-it-scale.per=
_thread_ops
   3236057 =C2=B1  2%      -4.5%    3089222 =C2=B1  4%  will-it-scale.wor=
kload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/page_fault2/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   1611363            -0.1%    1609891        will-it-scale.48.threads
     47.42 =C2=B1  2%      +1.2%      48.01        will-it-scale.48.threa=
ds_idle
     33569            -0.1%      33539        will-it-scale.per_thread_op=
s
   1611363            -0.1%    1609891        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/page_fault1/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   1776494 =C2=B1  3%      -2.6%    1730693        will-it-scale.48.threa=
ds
     43.36 =C2=B1  4%      +0.5%      43.57 =C2=B1  2%  will-it-scale.48.=
threads_idle
     37010 =C2=B1  3%      -2.6%      36055        will-it-scale.per_thre=
ad_ops
   1776494 =C2=B1  3%      -2.6%    1730693        will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/page_fault3/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
  15235214            -0.3%   15185167        will-it-scale.24.processes
     49.63            -0.4%      49.45        will-it-scale.24.processes_=
idle
    634800            -0.3%     632715        will-it-scale.per_process_o=
ps
  15235214            -0.3%   15185167        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/page_fault2/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   6700813            -0.6%    6662570        will-it-scale.24.processes
     49.17            +0.0%      49.18        will-it-scale.24.processes_=
idle
    279200            -0.6%     277606        will-it-scale.per_process_o=
ps
   6700813            -0.6%    6662570        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/page_fault1/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   8052059            -1.2%    7952172        will-it-scale.24.processes
     49.48            -0.4%      49.29        will-it-scale.24.processes_=
idle
    335502            -1.2%     331340        will-it-scale.per_process_o=
ps
   8052059            -1.2%    7952172        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/page_fault3/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
  10152559            +0.7%   10221240        will-it-scale.16.processes
     66.10            -0.0%      66.09        will-it-scale.16.processes_=
idle
    634534            +0.7%     638827        will-it-scale.per_process_o=
ps
  10152559            +0.7%   10221240        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/page_fault2/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   4621434            -1.0%    4576959        will-it-scale.16.processes
     66.14            -0.2%      65.98        will-it-scale.16.processes_=
idle
    288839            -1.0%     286059        will-it-scale.per_process_o=
ps
   4621434            -1.0%    4576959        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/page_fault1/will-it-scale

commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   5546153            -1.3%    5474778        will-it-scale.16.processes
     66.02            -0.1%      65.98        will-it-scale.16.processes_=
idle
    346634            -1.3%     342173        will-it-scale.per_process_o=
ps
   5546153            -1.3%    5474778        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/page_fault3/will-it-scale=


commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
  20575719            +0.4%   20651992        will-it-scale.48.processes
      0.06            +5.6%       0.06 =C2=B1  7%  will-it-scale.48.proce=
sses_idle
    428660            +0.4%     430249        will-it-scale.per_process_o=
ps
  20575719            +0.4%   20651992        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/page_fault2/will-it-scale=


commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   6984071            -1.1%    6906022        will-it-scale.48.processes
      0.07            +4.8%       0.07 =C2=B1  6%  will-it-scale.48.proce=
sses_idle
    145501            -1.1%     143875        will-it-scale.per_process_o=
ps
   6984071            -1.1%    6906022        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/page_fault1/will-it-scale=


commit:
  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   7527654            -1.7%    7399284        will-it-scale.48.processes
      0.07            +0.0%       0.07        will-it-scale.48.processes_=
idle
    156826            -1.7%     154151        will-it-scale.per_process_o=
ps
   7527654            -1.7%    7399284        will-it-scale.workload




=E2=80=94
Best Regards,
Yan, Zi

--=_MailMate_38FE9B62-8ED9-48D2-88BC-C01C12090CF5_=
Content-Disposition: attachment;
 filename="dellr630_2NUMA_24core_256GB_full_results.txt"
Content-ID: <BE46D6FE-153C-4902-9EF5-74F3C2FF6C21@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/small-allocs/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    357824            +1.5%     363199        vm-scalability.median
      8.33 =C2=B1 16%      -0.0        8.29 =C2=B1  5%  vm-scalability.st=
ddev%
  17180066            +1.5%   17435528        vm-scalability.throughput
 4.832e+09            +0.0%  4.832e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/small-allocs-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     20010 =C2=B1  2%      +2.8%      20573 =C2=B1  2%  vm-scalability.me=
dian
      2.52 =C2=B1 15%      -0.6        1.91 =C2=B1 14%  vm-scalability.st=
ddev%
    960542 =C2=B1  2%      +2.8%     987552 =C2=B1  2%  vm-scalability.th=
roughput
 2.886e+08 =C2=B1  2%      +2.8%  2.967e+08 =C2=B1  2%  vm-scalability.wo=
rkload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/mremap-xread-rand-mt/vm-scalabili=
ty

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    105253            +0.2%     105515        vm-scalability.median
      8.48 =C2=B1  3%      +0.3        8.77        vm-scalability.stddev%=

   5053394            +0.2%    5065570        vm-scalability.throughput
  1.52e+09            +0.2%  1.523e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/mmap-xread-seq-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1406301            -0.1%    1404676        vm-scalability.median
      0.03 =C2=B1 33%      -0.0        0.02 =C2=B1 23%  vm-scalability.st=
ddev%
  67502299            -0.1%   67424356        vm-scalability.throughput
 2.031e+10            -0.3%  2.025e+10        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/mmap-xread-rand-mt/vm-scalability=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     68136            +0.1%      68179        vm-scalability.median
     13.73 =C2=B1  4%      +0.2       13.94        vm-scalability.stddev%=

   3271260            +0.1%    3273712        vm-scalability.throughput
 9.834e+08            -0.0%  9.834e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/mmap-pread-seq/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     78.13           -16.2%      65.44        vm-scalability.free_time
   1209399            -1.0%    1197800        vm-scalability.median
      1.05 =C2=B1140%      -1.0        0.00 =C2=B1 23%  vm-scalability.st=
ddev%
  58047054            -1.0%   57494408        vm-scalability.throughput
 4.832e+09            +0.0%  4.832e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/mmap-pread-seq-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     54.47 =C2=B1 10%     +12.1%      61.04 =C2=B1 35%  vm-scalability.fr=
ee_time
   1040180            -1.5%    1024808 =C2=B1  2%  vm-scalability.median
    273.39 =C2=B1 82%    +140.2      413.55 =C2=B1 63%  vm-scalability.st=
ddev%
  48474981 =C2=B1  4%      -2.1%   47462936 =C2=B1  5%  vm-scalability.th=
roughput
 1.541e+10            -0.3%  1.537e+10        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/mmap-pread-rand/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     78.92           -16.3%      66.08        vm-scalability.free_time
     67291            +0.1%      67339        vm-scalability.median
     36.43 =C2=B1 61%      +6.4       42.83 =C2=B1 54%  vm-scalability.st=
ddev%
   3226783            -0.0%    3226730        vm-scalability.throughput
 9.703e+08            -0.1%  9.697e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/mmap-pread-rand-mt/vm-scalability=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     42.14 =C2=B1  3%      +4.2%      43.92        vm-scalability.free_ti=
me
     66589            +0.4%      66850        vm-scalability.median
     89.06 =C2=B1  8%     -14.8       74.29 =C2=B1 29%  vm-scalability.st=
ddev%
   3188137            +0.2%    3195092        vm-scalability.throughput
 9.573e+08            +0.3%  9.597e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/lru-file-readtwice/vm-scalability=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    144610            +2.6%     148318        vm-scalability.median
    650.58 =C2=B1 22%    -273.4      377.19 =C2=B1  7%  vm-scalability.st=
ddev%
  14175414            +1.5%   14382055        vm-scalability.throughput
 4.253e+09            +1.5%  4.315e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/lru-file-readonce/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    430327            -0.7%     427117        vm-scalability.median
     27.99 =C2=B1 11%      +3.3       31.25 =C2=B1 21%  vm-scalability.st=
ddev%
  20676239            -0.7%   20537224        vm-scalability.throughput
 4.295e+09            +0.0%  4.295e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/lru-file-mmap-read/vm-scalability=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1.73            -5.9%       1.63 =C2=B1  6%  vm-scalability.free_ti=
me
    284645            +1.4%     288596        vm-scalability.median
     24.72 =C2=B1 12%      -1.4       23.34 =C2=B1 10%  vm-scalability.st=
ddev%
  13663327            +1.4%   13853326        vm-scalability.throughput
 4.107e+09            +1.4%  4.163e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/lru-file-mmap-read-rand/vm-scalab=
ility

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2.63 =C2=B1 52%      +0.7%       2.65 =C2=B1 51%  vm-scalability.fr=
ee_time
     35249            -1.1%      34877        vm-scalability.median
     70.25 =C2=B1 47%      -9.6       60.65 =C2=B1 46%  vm-scalability.st=
ddev%
   1701952            -1.3%    1680521        vm-scalability.throughput
 5.372e+08            +0.0%  5.372e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/anon-rx-seq-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2071445            +0.0%    2072475        vm-scalability.median
  99429376            +0.0%   99478816        vm-scalability.throughput
 2.989e+10            -0.1%  2.986e+10        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/anon-rx-rand-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     94892            +0.2%      95062        vm-scalability.median
     42.22 =C2=B1 39%      +9.0       51.25 =C2=B1 20%  vm-scalability.st=
ddev%
   4535789            +0.2%    4545805        vm-scalability.throughput
 1.364e+09            +0.1%  1.366e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/anon-r-seq/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      5.48            -4.7%       5.22 =C2=B1  2%  vm-scalability.free_ti=
me
   1469914            -0.0%    1469383        vm-scalability.median
      6.76 =C2=B1 22%      -0.4        6.34 =C2=B1 17%  vm-scalability.st=
ddev%
  70532973            -0.0%   70502407        vm-scalability.throughput
  2.12e+10            +0.0%   2.12e+10        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/anon-r-seq-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2.46 =C2=B1 13%     -10.1%       2.21 =C2=B1 12%  vm-scalability.fr=
ee_time
    980150            -2.6%     954707 =C2=B1  2%  vm-scalability.median
    213.08 =C2=B1 19%    +109.3      322.40 =C2=B1 14%  vm-scalability.st=
ddev%
  47055326            -3.4%   45456419        vm-scalability.throughput
 1.459e+10            -3.7%  1.405e+10 =C2=B1  2%  vm-scalability.workloa=
d

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/anon-r-rand/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      3.15            -0.1%       3.15        vm-scalability.free_time
     90700            +0.3%      90950        vm-scalability.median
     90.49 =C2=B1 32%     +59.7      150.15 =C2=B1 19%  vm-scalability.st=
ddev%
   4336824            +0.0%    4337090        vm-scalability.throughput
 1.305e+09            -0.1%  1.303e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/dellr630/anon-r-rand-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      8.08 =C2=B1  2%      -0.3%       8.06 =C2=B1  2%  vm-scalability.fr=
ee_time
     54716            +0.9%      55195 =C2=B1  2%  vm-scalability.median
    256.82 =C2=B1  7%     -21.9      234.93 =C2=B1 14%  vm-scalability.st=
ddev%
   2708434            +0.8%    2729708 =C2=B1  3%  vm-scalability.through=
put
 8.147e+08            +0.7%  8.205e+08 =C2=B1  3%  vm-scalability.workloa=
d

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/8T/dellr630/anon-wx-seq-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    262182 =C2=B1  2%      -7.2%     243353 =C2=B1  4%  vm-scalability.me=
dian
  12584768 =C2=B1  2%      -7.2%   11680976 =C2=B1  4%  vm-scalability.th=
roughput
 3.781e+09 =C2=B1  2%      -7.2%  3.509e+09 =C2=B1  4%  vm-scalability.wo=
rkload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/8T/dellr630/anon-w-seq/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1.82            -0.2%       1.82        vm-scalability.free_time
    671396            +0.2%     672973        vm-scalability.median
      0.18 =C2=B1  8%      +0.0        0.22 =C2=B1 22%  vm-scalability.me=
dian_stddev%
      0.24 =C2=B1  4%      +0.0        0.26 =C2=B1 12%  vm-scalability.st=
ddev%
  32200410            +0.2%   32276241        vm-scalability.throughput
 6.945e+09            -0.0%  6.945e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/8T/dellr630/anon-w-seq-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.29            +2.2%       0.29        vm-scalability.free_time
    280375            +0.3%     281262        vm-scalability.median
      4.07 =C2=B1  7%      +0.5        4.58 =C2=B1 19%  vm-scalability.me=
dian_stddev%
      3.97 =C2=B1  8%      +0.7        4.67 =C2=B1 20%  vm-scalability.st=
ddev%
  13856067            +0.4%   13917746        vm-scalability.throughput
 2.955e+09            -1.7%  2.906e+09 =C2=B1  2%  vm-scalability.workloa=
d

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/8T/dellr630/anon-cow-seq/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    394969            -0.5%     392986 =C2=B1  3%  vm-scalability.median
      0.98 =C2=B1  5%      -0.3        0.69 =C2=B1 18%  vm-scalability.me=
dian_stddev%
      1.02 =C2=B1  4%      -0.3        0.69 =C2=B1 19%  vm-scalability.st=
ddev%
  18910179            -0.5%   18811746 =C2=B1  3%  vm-scalability.through=
put
 4.536e+09            -0.0%  4.536e+09 =C2=B1  3%  vm-scalability.workloa=
d

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/8T/dellr630/anon-cow-seq-mt/vm-scalability=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     80651            -1.2%      79710        vm-scalability.median
   3871280            -1.2%    3826080        vm-scalability.throughput
 1.163e+09            -1.1%   1.15e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/512G/dellr630/anon-wx-rand-mt/vm-scalabili=
ty

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     61777            +0.5%      62081        vm-scalability.median
      0.86 =C2=B1 28%      -0.3        0.56 =C2=B1 12%  vm-scalability.me=
dian_stddev%
      0.46 =C2=B1 82%      -0.2        0.22 =C2=B1 17%  vm-scalability.st=
ddev%
   2947653            +0.1%    2949945        vm-scalability.throughput
 8.866e+08            -0.0%  8.866e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/512G/dellr630/anon-w-rand/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2.08            -7.2%       1.93 =C2=B1  6%  vm-scalability.free_ti=
me
     62997            +0.0%      63014        vm-scalability.median
      0.84 =C2=B1 38%      -0.3        0.56 =C2=B1 35%  vm-scalability.me=
dian_stddev%
      1.32 =C2=B1 31%      -0.2        1.09 =C2=B1 47%  vm-scalability.st=
ddev%
   3003429            -0.2%    2997175        vm-scalability.throughput
 8.866e+08            -0.0%  8.866e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/512G/dellr630/anon-w-rand-mt/vm-scalabilit=
y

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      4.38           -12.9%       3.82 =C2=B1  9%  vm-scalability.free_ti=
me
     56381            +0.1%      56460        vm-scalability.median
      1.13 =C2=B1 25%      -0.4        0.71 =C2=B1 20%  vm-scalability.me=
dian_stddev%
      1.40 =C2=B1 33%      -0.4        0.99 =C2=B1 12%  vm-scalability.st=
ddev%
   2692710            +0.1%    2695449        vm-scalability.throughput
 7.389e+08            -0.0%  7.389e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/512G/dellr630/anon-cow-rand/vm-scalability=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     53787            -1.1%      53191        vm-scalability.median
      1.87 =C2=B1115%      +1.1        2.99 =C2=B1 48%  vm-scalability.me=
dian_stddev%
      0.38 =C2=B1 54%      -0.0        0.36 =C2=B1 29%  vm-scalability.st=
ddev%
   2437373            -0.2%    2432934        vm-scalability.throughput
 7.238e+08            -0.0%  7.238e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/512G/dellr630/anon-cow-rand-mt/vm-scalabil=
ity

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     68313            -0.3%      68094        vm-scalability.median
    197.31 =C2=B1  3%      -0.4      196.89        vm-scalability.stddev%=

   3190330            +0.2%    3195172        vm-scalability.throughput
 9.588e+08            +0.1%  9.598e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/2T/dellr630/shm-xread-seq/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    318628            -0.6%     316839        vm-scalability.median
      0.00            +0.0        0.00 =C2=B1141%  vm-scalability.stddev%=

  15294160            -0.6%   15208286        vm-scalability.throughput
 4.593e+09            -0.6%  4.565e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/2T/dellr630/shm-xread-seq-mt/vm-scalabilit=
y

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    224701            -0.1%     224411        vm-scalability.median
  10785648            -0.1%   10771744        vm-scalability.throughput
  3.24e+09            -0.1%  3.237e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/2T/dellr630/shm-pread-seq/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     44.80            -8.0%      41.20        vm-scalability.free_time
    312877            +1.1%     316454        vm-scalability.median
      0.00 =C2=B1141%      -0.0        0.00 =C2=B1141%  vm-scalability.st=
ddev%
  15018126            +1.1%   15189806        vm-scalability.throughput
 4.513e+09            +1.2%  4.569e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/2T/dellr630/shm-pread-seq-mt/vm-scalabilit=
y

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     31.66 =C2=B1 32%      +7.2%      33.93 =C2=B1 33%  vm-scalability.fr=
ee_time
    339602            +0.2%     340334        vm-scalability.median
      0.00 =C2=B1141%      +0.0        0.00 =C2=B1141%  vm-scalability.st=
ddev%
  16300930            +0.2%   16336068        vm-scalability.throughput
 4.898e+09            +0.1%  4.904e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/256G/dellr630/msync/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     41194 =C2=B1  5%      -3.3%      39825 =C2=B1  6%  vm-scalability.me=
dian
     19.45 =C2=B1 11%      -2.4       17.02 =C2=B1 23%  vm-scalability.me=
dian_stddev%
     19.35 =C2=B1 15%      -3.5       15.83 =C2=B1 26%  vm-scalability.st=
ddev%
   2065321 =C2=B1  4%      -3.7%    1988720 =C2=B1  6%  vm-scalability.th=
roughput
 5.418e+08 =C2=B1 12%      -9.1%  4.926e+08 =C2=B1 14%  vm-scalability.wo=
rkload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/256G/dellr630/msync-mt/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    145547            +2.3%     148921 =C2=B1  2%  vm-scalability.median
      0.01 =C2=B1141%      -0.0        0.00 =C2=B1141%  vm-scalability.st=
ddev%
   6986266            +2.3%    7148204 =C2=B1  2%  vm-scalability.through=
put
 4.557e+09            -0.4%  4.539e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/256G/dellr630/lru-shm-rand/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.14 =C2=B1  2%      -0.7%       0.14 =C2=B1  2%  vm-scalability.fr=
ee_time
     48663            +0.2%      48778        vm-scalability.median
      0.65 =C2=B1 32%      -0.1        0.57 =C2=B1 73%  vm-scalability.me=
dian_stddev%
      0.66 =C2=B1 34%      +0.3        0.92 =C2=B1 58%  vm-scalability.st=
ddev%
   2333942            +0.0%    2334978        vm-scalability.throughput
 5.911e+08            -0.0%  5.911e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/1T/dellr630/lru-shm/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.09            -0.5%       0.09        vm-scalability.free_time
    589821            -0.3%     588261        vm-scalability.median
      0.19 =C2=B1 11%      +0.0        0.24 =C2=B1 16%  vm-scalability.me=
dian_stddev%
      0.21 =C2=B1 18%      +0.0        0.24 =C2=B1 10%  vm-scalability.st=
ddev%
  28276616            -0.3%   28192741        vm-scalability.throughput
 2.364e+09            -2.1%  2.315e+09 =C2=B1  3%  vm-scalability.workloa=
d

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/16G/dellr630/shm-xread-rand/vm-scalability=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     80388            +0.9%      81089        vm-scalability.median
     53.48 =C2=B1 26%     +15.3       68.78        vm-scalability.stddev%=

   3856313            +0.7%    3881571        vm-scalability.throughput
 1.159e+09            +0.7%  1.167e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase/unit_size:
  gcc-10/defconfig/debian/300s/16G/dellr630/shm-xread-rand-mt/vm-scalabil=
ity/1G

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     83938            -0.1%      83823        vm-scalability.median
     10.55 =C2=B1  4%      +0.3       10.90 =C2=B1  4%  vm-scalability.st=
ddev%
   4030473            -0.2%    4024362        vm-scalability.throughput
 1.212e+09            -0.2%  1.209e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/16G/dellr630/shm-pread-rand/vm-scalability=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     64.56            -7.2%      59.91        vm-scalability.free_time
     80319            +0.5%      80758        vm-scalability.median
     35.63 =C2=B1 16%     +11.3       46.92 =C2=B1 12%  vm-scalability.st=
ddev%
   3853520            +0.7%    3880131        vm-scalability.throughput
 1.158e+09            +0.7%  1.166e+09        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase/unit_size:
  gcc-10/defconfig/debian/300s/16G/dellr630/shm-pread-rand-mt/vm-scalabil=
ity/1G

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.32 =C2=B1  9%     -21.3%       0.25 =C2=B1  7%  vm-scalability.fr=
ee_time
     46429            +0.7%      46754        vm-scalability.median
      0.49 =C2=B1 22%      +0.2        0.72 =C2=B1 19%  vm-scalability.me=
dian_stddev%
      0.51 =C2=B1 16%      +0.2        0.71 =C2=B1 22%  vm-scalability.st=
ddev%
   2224755            +0.7%    2240920        vm-scalability.throughput
 6.795e+08            +0.0%  6.795e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-10/defconfig/debian/300s/128G/dellr630/truncate/vm-scalability

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.055e+10 =C2=B1  2%      +2.7%  1.083e+10 =C2=B1  5%  vm-scalability.me=
dian
      4.25 =C2=B1125%      -0.7        3.54 =C2=B1 58%  vm-scalability.me=
dian_stddev%
      4.25 =C2=B1125%      -0.7        3.54 =C2=B1 58%  vm-scalability.st=
ddev%
 1.055e+10 =C2=B1  2%      +2.7%  1.083e+10 =C2=B1  5%  vm-scalability.th=
roughput
 5.254e+08            -0.0%  5.254e+08        vm-scalability.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/page_fault3/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   3199850 =C2=B1  2%      +6.0%    3390866 =C2=B1  3%  will-it-scale.24.=
threads
     54.94            +1.7%      55.85        will-it-scale.24.threads_id=
le
    133326 =C2=B1  2%      +6.0%     141285 =C2=B1  3%  will-it-scale.per=
_thread_ops
   3199850 =C2=B1  2%      +6.0%    3390866 =C2=B1  3%  will-it-scale.wor=
kload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/page_fault2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2016984            -6.6%    1883075 =C2=B1  2%  will-it-scale.24.threa=
ds
     69.69            -4.4%      66.64        will-it-scale.24.threads_id=
le
     84040            -6.6%      78461 =C2=B1  2%  will-it-scale.per_thre=
ad_ops
   2016984            -6.6%    1883075 =C2=B1  2%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/page_fault1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2138067            -1.3%    2109865        will-it-scale.24.threads
     63.34            +1.1%      64.06        will-it-scale.24.threads_id=
le
     89085            -1.3%      87910        will-it-scale.per_thread_op=
s
   2138067            -1.3%    2109865        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/page_fault3/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   3216287 =C2=B1  3%      +4.8%    3369356 =C2=B1 10%  will-it-scale.16.=
threads
     69.18            +0.5%      69.51        will-it-scale.16.threads_id=
le
    201017 =C2=B1  3%      +4.8%     210584 =C2=B1 10%  will-it-scale.per=
_thread_ops
   3216287 =C2=B1  3%      +4.8%    3369356 =C2=B1 10%  will-it-scale.wor=
kload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/page_fault2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2005510            -2.7%    1950620 =C2=B1  2%  will-it-scale.16.threa=
ds
     78.77            -0.2%      78.64        will-it-scale.16.threads_id=
le
    125344            -2.7%     121913 =C2=B1  2%  will-it-scale.per_thre=
ad_ops
   2005510            -2.7%    1950620 =C2=B1  2%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/page_fault1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2332446            -6.5%    2179823 =C2=B1  2%  will-it-scale.16.threa=
ds
     77.57            -2.0%      76.03        will-it-scale.16.threads_id=
le
    145777            -6.5%     136238 =C2=B1  2%  will-it-scale.per_thre=
ad_ops
   2332446            -6.5%    2179823 =C2=B1  2%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/page_fault3/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   3236057 =C2=B1  2%      -4.5%    3089222 =C2=B1  4%  will-it-scale.48.=
threads
     24.64 =C2=B1  7%      -3.3%      23.83 =C2=B1  2%  will-it-scale.48.=
threads_idle
     67417 =C2=B1  2%      -4.5%      64358 =C2=B1  4%  will-it-scale.per=
_thread_ops
   3236057 =C2=B1  2%      -4.5%    3089222 =C2=B1  4%  will-it-scale.wor=
kload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/page_fault2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1611363            -0.1%    1609891        will-it-scale.48.threads
     47.42 =C2=B1  2%      +1.2%      48.01        will-it-scale.48.threa=
ds_idle
     33569            -0.1%      33539        will-it-scale.per_thread_op=
s
   1611363            -0.1%    1609891        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/page_fault1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1776494 =C2=B1  3%      -2.6%    1730693        will-it-scale.48.threa=
ds
     43.36 =C2=B1  4%      +0.5%      43.57 =C2=B1  2%  will-it-scale.48.=
threads_idle
     37010 =C2=B1  3%      -2.6%      36055        will-it-scale.per_thre=
ad_ops
   1776494 =C2=B1  3%      -2.6%    1730693        will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/page_fault3/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  15235214            -0.3%   15185167        will-it-scale.24.processes
     49.63            -0.4%      49.45        will-it-scale.24.processes_=
idle
    634800            -0.3%     632715        will-it-scale.per_process_o=
ps
  15235214            -0.3%   15185167        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/page_fault2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   6700813            -0.6%    6662570        will-it-scale.24.processes
     49.17            +0.0%      49.18        will-it-scale.24.processes_=
idle
    279200            -0.6%     277606        will-it-scale.per_process_o=
ps
   6700813            -0.6%    6662570        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/page_fault1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   8052059            -1.2%    7952172        will-it-scale.24.processes
     49.48            -0.4%      49.29        will-it-scale.24.processes_=
idle
    335502            -1.2%     331340        will-it-scale.per_process_o=
ps
   8052059            -1.2%    7952172        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/page_fault3/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  10152559            +0.7%   10221240        will-it-scale.16.processes
     66.10            -0.0%      66.09        will-it-scale.16.processes_=
idle
    634534            +0.7%     638827        will-it-scale.per_process_o=
ps
  10152559            +0.7%   10221240        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/page_fault2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   4621434            -1.0%    4576959        will-it-scale.16.processes
     66.14            -0.2%      65.98        will-it-scale.16.processes_=
idle
    288839            -1.0%     286059        will-it-scale.per_process_o=
ps
   4621434            -1.0%    4576959        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/page_fault1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5546153            -1.3%    5474778        will-it-scale.16.processes
     66.02            -0.1%      65.98        will-it-scale.16.processes_=
idle
    346634            -1.3%     342173        will-it-scale.per_process_o=
ps
   5546153            -1.3%    5474778        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/page_fault3/will-it-scale=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  20575719            +0.4%   20651992        will-it-scale.48.processes
      0.06            +5.6%       0.06 =C2=B1  7%  will-it-scale.48.proce=
sses_idle
    428660            +0.4%     430249        will-it-scale.per_process_o=
ps
  20575719            +0.4%   20651992        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/page_fault2/will-it-scale=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   6984071            -1.1%    6906022        will-it-scale.48.processes
      0.07            +4.8%       0.07 =C2=B1  6%  will-it-scale.48.proce=
sses_idle
    145501            -1.1%     143875        will-it-scale.per_process_o=
ps
   6984071            -1.1%    6906022        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/page_fault1/will-it-scale=


commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   7527654            -1.7%    7399284        will-it-scale.48.processes
      0.07            +0.0%       0.07        will-it-scale.48.processes_=
idle
    156826            -1.7%     154151        will-it-scale.per_process_o=
ps
   7527654            -1.7%    7399284        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/mmap2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    107582            -2.2%     105195 =C2=B1  2%  will-it-scale.24.threa=
ds
     86.69            +0.2%      86.90        will-it-scale.24.threads_id=
le
      4482            -2.2%       4382 =C2=B1  2%  will-it-scale.per_thre=
ad_ops
    107582            -2.2%     105195 =C2=B1  2%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/mmap1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     99087            -6.6%      92582 =C2=B1  4%  will-it-scale.24.threa=
ds
     89.30            +0.9%      90.14        will-it-scale.24.threads_id=
le
      4128            -6.6%       3857 =C2=B1  4%  will-it-scale.per_thre=
ad_ops
     99087            -6.6%      92582 =C2=B1  4%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/malloc2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.692e+09            +0.0%  1.692e+09        will-it-scale.24.threads
     49.55            -0.0%      49.54        will-it-scale.24.threads_id=
le
  70479299            +0.0%   70497886        will-it-scale.per_thread_op=
s
 1.692e+09            +0.0%  1.692e+09        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/mmap2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    108693            -3.4%     104954 =C2=B1  2%  will-it-scale.16.threa=
ds
     91.00            +0.1%      91.10        will-it-scale.16.threads_id=
le
      6793            -3.4%       6559 =C2=B1  2%  will-it-scale.per_thre=
ad_ops
    108693            -3.4%     104954 =C2=B1  2%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/mmap1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    100512            -0.1%     100370        will-it-scale.16.threads
     91.18            -0.5%      90.76        will-it-scale.16.threads_id=
le
      6281            -0.1%       6272        will-it-scale.per_thread_op=
s
    100512            -0.1%     100370        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/malloc2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.136e+09            +0.0%  1.136e+09        will-it-scale.16.threads
     66.30            -0.2%      66.19        will-it-scale.16.threads_id=
le
  70977943            +0.0%   70978047        will-it-scale.per_thread_op=
s
 1.136e+09            +0.0%  1.136e+09        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/mmap2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     89113            +1.9%      90829 =C2=B1  3%  will-it-scale.48.threa=
ds
     89.65            -0.9%      88.88        will-it-scale.48.threads_id=
le
      1856            +1.9%       1891 =C2=B1  3%  will-it-scale.per_thre=
ad_ops
     89113            +1.9%      90829 =C2=B1  3%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/mmap1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     77550            -2.5%      75624        will-it-scale.48.threads
     91.39            +0.3%      91.63        will-it-scale.48.threads_id=
le
      1615            -2.5%       1575        will-it-scale.per_thread_op=
s
     77550            -2.5%      75624        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/malloc2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.702e+09            -0.0%  1.702e+09        will-it-scale.48.threads
      0.03           +11.1%       0.03 =C2=B1 14%  will-it-scale.48.threa=
ds_idle
  35468051            -0.0%   35463537        will-it-scale.per_thread_op=
s
 1.702e+09            -0.0%  1.702e+09        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/mmap2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    670141            -1.0%     663139        will-it-scale.24.processes
     49.32            -0.5%      49.10        will-it-scale.24.processes_=
idle
     27922            -1.0%      27630        will-it-scale.per_process_o=
ps
    670141            -1.0%     663139        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/mmap1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    821022            -0.1%     820465        will-it-scale.24.processes
     49.09            -0.0%      49.09        will-it-scale.24.processes_=
idle
     34208            -0.1%      34185        will-it-scale.per_process_o=
ps
    821022            -0.1%     820465        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/malloc2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.694e+09            -0.2%  1.691e+09        will-it-scale.24.processes
     49.75            -0.3%      49.62        will-it-scale.24.processes_=
idle
  70576503            -0.2%   70455796        will-it-scale.per_process_o=
ps
 1.694e+09            -0.2%  1.691e+09        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/malloc1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    195637            +0.6%     196726        will-it-scale.24.processes
     49.07            -0.0%      49.05        will-it-scale.24.processes_=
idle
      8151            +0.6%       8196        will-it-scale.per_process_o=
ps
    195637            +0.6%     196726        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/mmap2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    724970            -2.3%     708248        will-it-scale.16.processes
     66.04            -0.3%      65.85        will-it-scale.16.processes_=
idle
     45310            -2.3%      44264        will-it-scale.per_process_o=
ps
    724970            -2.3%     708248        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/mmap1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    873427            +0.7%     879407        will-it-scale.16.processes
     65.81            +0.0%      65.81        will-it-scale.16.processes_=
idle
     54588            +0.7%      54962        will-it-scale.per_process_o=
ps
    873427            +0.7%     879407        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/malloc2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.136e+09            +0.1%  1.137e+09        will-it-scale.16.processes
     66.32            -0.2%      66.22        will-it-scale.16.processes_=
idle
  70999478            +0.1%   71072433        will-it-scale.per_process_o=
ps
 1.136e+09            +0.1%  1.137e+09        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/malloc1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    205149            +2.1%     209554        will-it-scale.16.processes
     65.76            +0.1%      65.81        will-it-scale.16.processes_=
idle
     12821            +2.1%      13096        will-it-scale.per_process_o=
ps
    205149            +2.1%     209554        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/mmap2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    606469            -3.5%     585485 =C2=B1  3%  will-it-scale.48.proce=
sses
      0.06            +0.0%       0.06        will-it-scale.48.processes_=
idle
     12634            -3.5%      12197 =C2=B1  3%  will-it-scale.per_proc=
ess_ops
    606469            -3.5%     585485 =C2=B1  3%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/mmap1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    745891            -0.9%     739042        will-it-scale.48.processes
      0.06            +5.6%       0.06 =C2=B1  7%  will-it-scale.48.proce=
sses_idle
     15538            -0.9%      15396        will-it-scale.per_process_o=
ps
    745891            -0.9%     739042        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/malloc2/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.706e+09            -0.1%  1.704e+09        will-it-scale.48.processes
      0.06            +0.0%       0.06        will-it-scale.48.processes_=
idle
  35535756            -0.1%   35492836        will-it-scale.per_process_o=
ps
 1.706e+09            -0.1%  1.704e+09        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/malloc1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    174384            +1.0%     176162        will-it-scale.48.processes
      0.06            +0.0%       0.06        will-it-scale.48.processes_=
idle
      3632            +1.0%       3669        will-it-scale.per_process_o=
ps
    174384            +1.0%     176162        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/50%/debian/dellr630/brk1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    296768            -4.5%     283480 =C2=B1  5%  will-it-scale.24.threa=
ds
     77.96            +1.7%      79.29 =C2=B1  2%  will-it-scale.24.threa=
ds_idle
     12365            -4.5%      11811 =C2=B1  5%  will-it-scale.per_thre=
ad_ops
    296768            -4.5%     283480 =C2=B1  5%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/16/debian/dellr630/brk1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    267562 =C2=B1  4%     +13.1%     302654 =C2=B1  9%  will-it-scale.16.=
threads
     86.35            -4.6%      82.35 =C2=B1  4%  will-it-scale.16.threa=
ds_idle
     16722 =C2=B1  4%     +13.1%      18915 =C2=B1  9%  will-it-scale.per=
_thread_ops
    267562 =C2=B1  4%     +13.1%     302654 =C2=B1  9%  will-it-scale.wor=
kload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/thread/100%/debian/dellr630/brk1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    232568 =C2=B1  8%      -4.3%     222509 =C2=B1 11%  will-it-scale.48.=
threads
     83.85 =C2=B1  5%      +2.3%      85.75 =C2=B1  4%  will-it-scale.48.=
threads_idle
      4845 =C2=B1  8%      -4.3%       4635 =C2=B1 11%  will-it-scale.per=
_thread_ops
    232568 =C2=B1  8%      -4.3%     222509 =C2=B1 11%  will-it-scale.wor=
kload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/50%/debian/dellr630/brk1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1645683            +1.7%    1673456        will-it-scale.24.processes
     49.01            +0.2%      49.09        will-it-scale.24.processes_=
idle
     68569            +1.7%      69726        will-it-scale.per_process_o=
ps
   1645683            +1.7%    1673456        will-it-scale.workload

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/16/debian/dellr630/brk1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1768679            -2.4%    1726099 =C2=B1  3%  will-it-scale.16.proce=
sses
     66.06            -0.5%      65.73        will-it-scale.16.processes_=
idle
    110542            -2.4%     107880 =C2=B1  3%  will-it-scale.per_proc=
ess_ops
   1768679            -2.4%    1726099 =C2=B1  3%  will-it-scale.workload=


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-10/defconfig/process/100%/debian/dellr630/brk1/will-it-scale

commit: =

  5.13.0-rc1-mm1-max-order-11+
  5.13.0-rc1-mm1-max-order-20+

5.13.0-rc1-mm1-m 5.13.0-rc1-mm1-max-order-20 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1467894            -1.0%    1453898 =C2=B1  2%  will-it-scale.48.proce=
sses
      0.06 =C2=B1  7%      -5.3%       0.06        will-it-scale.48.proce=
sses_idle
     30581            -1.0%      30289 =C2=B1  2%  will-it-scale.per_proc=
ess_ops
   1467894            -1.0%    1453898 =C2=B1  2%  will-it-scale.workload=



--=_MailMate_38FE9B62-8ED9-48D2-88BC-C01C12090CF5_=--

--=_MailMate_49457795-E15C-4266-AEFC-FB066903ABAE_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJCBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmC3qi0PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKdqEP+PA7E/z0+3XZC2gOWxzbgldSqdxwtMA/oQ0G
Na4tH9wa9xvRaFbeX3/sO8AIudzd4FET1e115K1i08pdYe+yfM84/Z2mWNgfTehC
tcUHrzUHoQp7f/eAhositc1VaQvR5kzWjJHDYOJXci1ZpsP9FmEWMqLhtYDtTpMS
vn9/utkhYN1jiFul7B6nYgZ+GpSdTm41GZddg5zg/CXtUnEiEIfwIhhMXyYVWPv3
J5wuh4DcRGbNjluPGohfuVJ+evXGxEQPhplj6UYHm1E28WnheTsgmcwizkilwrRN
BnZ9gjWWAbBrFFw0guMRrIHs671dTp/W68+P2BEKrxrYp4QPCkelRLZdhH3I5/iB
IkALaR6QhoKeeHadicudqNIDvR5VoCp9QYJJVDArwbR23x6kZEH/3zZeuWEkAr1M
Zv0HOhBIO5CD+E7Hs+CRBDtcz5Iu3MlZPIyL1CcIr/VqN773zAAwbtyfU1yyczDK
2n3dLEW75pvtLqWMswpgVYQ8RbAAga2j9eQy7rBzX8pUpsUrWnmmoUuEA3FwE7CU
6oyOH1yrNDG1sJG45MglytbhNzrufSziAZTm4Hzv7ed+FaJhHlwvjRFs2wrg0wey
Vk9WfgK1OtzMuXhc3H58lyGIe2MICeuxiezHxG5LEx2u3TceG3PDGqgOoPctoHOA
9abbXPI=
=Ap5j
-----END PGP SIGNATURE-----

--=_MailMate_49457795-E15C-4266-AEFC-FB066903ABAE_=--
