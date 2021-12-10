Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 846D24703E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 16:31:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9ZdC31FDz3cHN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 02:31:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y8ikfWL1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.93.84;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Y8ikfWL1; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9ZcM2kfPz301g
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 02:30:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJksMLLKHebaumsvzZjUntvhaPXW2EDZNAa3rgLu2CPG2ZxH94bZkPdqsq5w7hUGyJPw3wgIqvcJ0qlT30KGsiS2hLbbaSh/y9Ni+qI+J8jDw3M0fFWgnUoo+PBDxxU8sx+vjwsDAZcPQWyjLVamIesAFzGn2z/F7LRRYQjDxDYQxy35i+0l+rPIq70EK7o9lKRMyPDBeB2APsZq6RwTbqJqd/C2NTH1s2wjg4CpfI9xnMDO5EHSi+zhNYpzamtTg2bVOpvo25tZG11ki8F5/21EKlqCmOqsAsdyif6KkeoH4/GmaRSZoaotyWfKS7IGuF2y3JwnCQBm/nU/U+j18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1srbrbtSoO85eePMB3uYFMGMy6rM/A/K3N/xBPzUUk=;
 b=BqoHgY7vldjEMDrBboCEY7PA4pKjlo1vKnS/DKOBOizkOjGxGKNhsosBI5BZCZMmGvDkkYwue4FRfSFXpRMg+iEmHUqfyhRDffaWufhZNjqEsGvbjC7KZNN32F4vzn8Bjvtz3RqgG+LsV78GizEttlkiB8hNGVINIdzLxrEsmooTt7pDP7L7fv/+Ih53xOpXeXciLy4H+3Hr4RR2tNTE+q8ZRz66+lsmUU/mwXzrIkCRvSl0AJgqzLnbieoDfECHQLQL6WmnsMWtXeNmpEIfFqFiQhd2RjxWUl+m8MdKycLp29vx8ulOSRGuqtUFDeHiQFjSt+xCijGbEjKUEe/gcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1srbrbtSoO85eePMB3uYFMGMy6rM/A/K3N/xBPzUUk=;
 b=Y8ikfWL1B4fR8GS+RyePVn+3Aetlys9mgzq2t5L/RV8CbxhTDZamOif3RAIX/V4eVco+/IGyfLuUWi75knbGsX/h++l3kuQxqZsWVrA0LzT0uw+KQ4NL2/cyogmkw4eoc8rhST6LYViox+8rLchgaKwdD3BMi8b0JcpprtgPc2rvGKkdHmOym3fPCWxDUmIPDNbSndvr0VCH7X69HVFG9jxrz3Jqi5bm++RettVusawt+av4tsX4mMU12dLkhilakGGfzQDLRGF9AYGd9SBrhYefKPc4Dop3VcKf0Pw0CR2SvorukJETAnbjqwDc7OVR1iGD3RA5Iv1PusWT3sGvOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB4996.namprd12.prod.outlook.com (2603:10b6:208:1c6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Fri, 10 Dec
 2021 15:30:35 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 15:30:35 +0000
From: Zi Yan <ziy@nvidia.com>
To: Eric Ren <renzhengeek@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Use pageblock_order for cma and
 alloc_contig_range alignment.
Date: Fri, 10 Dec 2021 10:30:33 -0500
X-Mailer: MailMate (1.14r5852)
Message-ID: <E040D349-E92B-4902-B819-C5665A6B8112@nvidia.com>
In-Reply-To: <07f11dfc-f491-3b08-a2cb-3c8f5a8102d3@gmail.com>
References: <20211209230414.2766515-1-zi.yan@sent.com>
 <07f11dfc-f491-3b08-a2cb-3c8f5a8102d3@gmail.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_A20CB30B-3BE6-4D91-9DFB-251982B59B83_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR15CA0036.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::49) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
Received: from [10.2.53.3] (130.44.175.231) by
 MN2PR15CA0036.namprd15.prod.outlook.com (2603:10b6:208:1b4::49) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 15:30:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bc28fcc-a787-457f-62d9-08d9bbf20244
X-MS-TrafficTypeDiagnostic: BL0PR12MB4996:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4996F5A41345965B36D9358AC2719@BL0PR12MB4996.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VcHSwBney807KhgTTe8RZsBnb5VKmQE8Jnf3n08thAMFa/ltEvMHrn3uKSnIqV1Z4PPNLIGLRv4QMpeiEju+DhGUrBO2M87Xl+ycXCUN5dUPzKYQMKBt6cQg9bPvpIDr9+DfQVEOA6ka6fsBGG6hVu3g5TZlSe0ZL6Lk+OSN7x+88vyW2mP1Z34XLP05xAHpWjCx9NJQBVmrEHC6Ok+U+8eVmUR7zHRZ/4bwBoVEDgfeXb/JvpJba0eH2edB65S/QoObC0C+0jA9FU8YFWxOLunjc6+1qexYb1NNywbKz3j1q2P7DDIZeILhuhSGbQsws7S8j1ErRP+XsnHr9+o0tIb0oP/Wft5HuWuk9tsTxDvy6filxCwzxhCp3Gh37cT6bVz0NDwFL4azMUFh11lzmGNqfnHx3ifEuVrmPzbvwJojo1eZX4FCFKGLgs2nigyc5ByrCLHQ3MgurEbTZkEW24Q4h7jc0sUESIdAbFr6KdCRx52O1wdfE1FFAOpvPohwJoevN12UbNOOlcZ2G8Qv+K4RQSTEXmXZ1ydFsYedoQDjrlTtNxKAuEaEQpscVpcYWRPHsl3256uYjXgzvlimI06KghV/EQuUwBCBX4e2jKo5izc3KmGuIohr62ebOURk/qNpwXJHtbTZ34KdnQGN0JvYUOgYHFpU5C2Zf0A2uLopW90DNVvJ1R/i18SonTYrDh4kIBuLENMeRs7C8/TZuZnrnRMHbwev0QAHZNzdG/hk0q5A5FJM4lUdK9kcROx/tio2r5sQ02rTimEV8sj0/br/aaD2T/3aZsfV4B6xKisC+qC8RqnGuv8jPSI7EQme+irXoQdB3CZMgmr29VLAcLErXHdLcvGu1vTVH8YY0Fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(966005)(33964004)(8936002)(2906002)(6486002)(8676002)(7416002)(38100700002)(6916009)(2616005)(16576012)(956004)(186003)(54906003)(66946007)(26005)(235185007)(5660300002)(4326008)(36756003)(316002)(33656002)(508600001)(21480400003)(83380400001)(66556008)(66476007)(86362001)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3gzVmNiRWg0ZVJjVTV5a0lFcWpMU0dpaGdDTklHUVltYmFmNGt4RHJSVDFz?=
 =?utf-8?B?ZTFqc2d0aXlTVHhPNG9pdmdkTU4yRmRKdHhVbnQ0cE5ZV0tndjQ2WDBvclJW?=
 =?utf-8?B?WEkrWmRQWExuQVZnVmpkUWRvMkJPK1NweW5CdytLV0lBNjdlVDVRYVlRVTlw?=
 =?utf-8?B?N3MyL0F0T0l6THpITHpzWDdod2NCR1pDUnRLUVZZaC91Q1puUHAyTzNWRjV5?=
 =?utf-8?B?QjY2azl6dnFrd2QrZExUNjN5Wk1GTHorWGVlN2pZbTJrdzNPdnBwckNiektH?=
 =?utf-8?B?R0htS0RaY2R1eEhuNVlxa1ZKWWhPTXlHSjZocGNYWnJrRmhkM1F3b2pvWXRS?=
 =?utf-8?B?dWFiaDg3V1JkYTdOTXJrcTh4cnVaU3BWR3NQdFRJNnMyUGpJS0NTc1ZPNkNJ?=
 =?utf-8?B?SjQrSVU4RlFrcngxUHFpOSs1VkxkcWNWSC9LWWFpNjJDU0JaK2lrcHlzbW5T?=
 =?utf-8?B?aFQvbTJ2bjE4VENrNFpmWElxQThUVGVpeTlLUXFLdzF0TTNDbHl5elhPMzhZ?=
 =?utf-8?B?ZjlJc2hVV2x0NTgzQVcvN0Erb2V3TzJ5UFFRRFd0VEFod0NwSXFPOHM4ZkUv?=
 =?utf-8?B?V1NrKys3SEN2ajBQc01xd0RUdVdLN1ozNnBGdVh1dkk5UnFUMXg4MWpUYmRU?=
 =?utf-8?B?RHU4MVpRRzI3ZlBncEdFeERreFE0MVRMSVFYMSt3VVJnNlZUTWc0akdpZFE2?=
 =?utf-8?B?WkxTSkMvR3pvK0hoZkd3L0VRQkQ5N1BPT0l2bk9MQzFNbUVmWjIxaHJzZXFW?=
 =?utf-8?B?bXJKT1pwWFBYUmljdGgwV3lWN1h4YTZEMEUycU9wMTJ3ZjNWM1BvcmkxM3k2?=
 =?utf-8?B?Ym1aRGgzcEdXNGxJMWFVQ1VvQktQaldhcFl2YlZBTEpDdXZQekVsT3cvSDYx?=
 =?utf-8?B?NTkvTWdHTFZZVEZ0emdRQ0c2VDFiN2NKK0pxQmhER2RuWEZIR1BYRHVxTUlV?=
 =?utf-8?B?ZVlzZW1TNEgrcGVLZXZWMkliaHA4MWpWTHFxbUE1NWt0aVlGZ29pS1pLSXVo?=
 =?utf-8?B?M3J2Vm05ZEpaNVVsZDlVdVV3UkFqRHVJQ0dKU003MkMyeWFWaTdvVTgvQm5W?=
 =?utf-8?B?NFA2T1dBNVdEYmVFSFBhUk40cmY3c29Ba3hMK2lUOFFRMFdrR1lkbldxRjNn?=
 =?utf-8?B?Q3hrU0xPQ0t5emJRaUNmTExUZnhhVDBnemsxWkxsWjBmS0hYUldFY01jb09z?=
 =?utf-8?B?MG53SUlTY2lQZFgvVVJUZUl5OFYwSjJLYzRaelkwZ0xXYWdLNmlWWVlHdmF2?=
 =?utf-8?B?cmxnWnNKZjEyVjdncGJTN1B1cXd4d3l6STBIZ3FEaHdLN0ppempoakJDV3o3?=
 =?utf-8?B?OVNtWW5YM0pReURWcUhVazhBRjdlV3Zobi9sZjU3Wi9rTGx3VTROY0gyRExW?=
 =?utf-8?B?MTU0MVlOQ2FaVGhkYVpMVG5PUHhxZXFqeVZub1lzR2VuMCtkbDZDTUtkSG1N?=
 =?utf-8?B?cUx2eVhzNldacEh3Z2lvcHp2UW1xYzlpOTBBclJUTEpBTEpkTkNEZSs5QWlZ?=
 =?utf-8?B?OG1wWFlXWDlVREtWNkFMdTRVK1dDdVMzNlI3MGo5MmtNK1dVT3QrT0tVeGta?=
 =?utf-8?B?SHhZRTlOWGtFZ3Bod3dON080V0xwUUdyTTQ1cjBva0o3S0lsZXlSNjB3MkNQ?=
 =?utf-8?B?eHM5cDZ2dG5mWC9xbldTbUdpcVhrRHp1SFlnaCtnSUZISDc2d0F3aCtZaXlT?=
 =?utf-8?B?OHNEdmlqWWZIQm9SUm92QmZRZTV4MnJvc3R6TXNqSk13bUV3d0tPWFd6cU1n?=
 =?utf-8?B?QmR1Mjc5YXRuU1VmRGVBTVZPMWRITytTMDVCVVFDb1VacCt1VHdrNVFHWHRw?=
 =?utf-8?B?dnhLNGhNV3hxbDBjV0Z0VGNxUDcxYjFCTmJoYVlwTmhmRU0xVzVPSHF5R0FQ?=
 =?utf-8?B?K0grZTZjeDBaU2lNZ3lSMWpEUmlzZGU1ZnFKRXArRS8xWElSd3RNdkxEdVYx?=
 =?utf-8?B?NVV0NTcxRStiK1o1ZXdLWENoZXFXOWYwSngzbEE3TVZhSGhHZFVPT21OaVNh?=
 =?utf-8?B?ekd3bU1VZm04TndueFBpOUFOVkhFTm4vTkRDZVlQaVZ2YVcyTnV1T01jaTJJ?=
 =?utf-8?B?TkNJNmRwV1dJNXZtTXNFcVVvazFwa0lDN2RuT0NiM0NvT0xxSnkyaUFCMnpU?=
 =?utf-8?Q?hnxw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc28fcc-a787-457f-62d9-08d9bbf20244
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:30:35.6338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qD87z52g3R2axo8CEXKw6CiNl1JKVTGQKVf6pAgEb70MU1vjOpV9C70VaX+eqnvV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4996
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

--=_MailMate_A20CB30B-3BE6-4D91-9DFB-251982B59B83_=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 Dec 2021, at 2:30, Eric Ren wrote:

> Hi Zi Yan,
>
> On 2021/12/10 07:04, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Hi all,
>>
>> This patchset tries to remove the MAX_ORDER - 1 alignment requirement =
for CMA
>> and alloc_contig_range(). It prepares for my upcoming changes to make =
MAX_ORDER
>> adjustable at boot time[1].
>>
>> The MAX_ORDER - 1 alignment requirement comes from that alloc_contig_r=
ange()
>> isolates pageblocks to remove free memory from buddy allocator but iso=
lating
>> only a subset of pageblocks within a page spanning across multiple pag=
eblocks
>> causes free page accounting issues. Isolated page might not be put int=
o the
>> right free list, since the code assumes the migratetype of the first p=
ageblock
>> as the whole free page migratetype. This is based on the discussion at=
 [2].
>>
>> To remove the requirement, this patchset:
>> 1. still isolates pageblocks at MAX_ORDER - 1 granularity;
> Then, unplug fails if either pageblock of the=C2=A0 MAX_ORDER - 1 page =
has unmovable page, right?

Right. One of the optimizations mentioned is targeting this by passing th=
e actual
range instead of the MAX_ORDER-1 aligned range, so that has_unmovable_pag=
es()
will not give false positive, minimizing the isolation failure rates.

>
> Thanks,
> Eric
>> 2. but saves the pageblock migratetypes outside the specified range of=

>>     alloc_contig_range() and restores them after all pages within the =
range
>>     become free after __alloc_contig_migrate_range();
>> 3. splits free pages spanning multiple pageblocks at the beginning and=
 the end
>>     of the range and puts the split pages to the right migratetype fre=
e lists
>>     based on the pageblock migratetypes;
>> 4. returns pages not in the range as it did before this patch.
>>
>> Isolation needs to happen at MAX_ORDER - 1 granularity, because otherw=
ise
>> 1) extra code is needed to detect pages (free, PageHuge, THP, or PageC=
ompound)
>> to make sure all pageblocks belonging to a single page are isolated to=
gether
>> and later pageblocks outside the range need to have their migratetypes=
 restored;
>> or 2) extra logic will need to be added during page free time to split=
 a free
>> page with multi-migratetype pageblocks.
>>
>> Two optimizations might come later:
>> 1. only check unmovable pages within the range instead of MAX_ORDER - =
1 aligned
>>     range during isolation to increase successful rate of alloc_contig=
_range().
^^^^^^^^^^^^^^

>> 2. make MIGRATE_ISOLATE a separate bit to avoid saving and restoring e=
xisting
>>     migratetypes before and after isolation respectively.
>>
>> Feel free to give comments and suggestions. Thanks.
>>
>>
>> [1] https://lore.kernel.org/linux-mm/20210805190253.2795604-1-zi.yan@s=
ent.com/
>> [2] https://lore.kernel.org/linux-mm/d19fb078-cb9b-f60f-e310-fdeea1b94=
7d2@redhat.com/
>>
>>
>> Zi Yan (7):
>>    mm: page_alloc: avoid merging non-fallbackable pageblocks with othe=
rs.
>>    mm: compaction: handle non-lru compound pages properly in
>>      isolate_migratepages_block().
>>    mm: migrate: allocate the right size of non hugetlb or THP compound=

>>      pages.
>>    mm: make alloc_contig_range work at pageblock granularity
>>    mm: cma: use pageblock_order as the single alignment
>>    drivers: virtio_mem: use pageblock size as the minimum virtio_mem
>>      size.
>>    arch: powerpc: adjust fadump alignment to be pageblock aligned.
>>
>>   arch/powerpc/include/asm/fadump-internal.h |   4 +-
>>   drivers/virtio/virtio_mem.c                |   6 +-
>>   include/linux/mmzone.h                     |  11 +-
>>   kernel/dma/contiguous.c                    |   2 +-
>>   mm/cma.c                                   |   6 +-
>>   mm/compaction.c                            |  10 +-
>>   mm/migrate.c                               |   8 +-
>>   mm/page_alloc.c                            | 203 +++++++++++++++++--=
--
>>   8 files changed, 196 insertions(+), 54 deletions(-)
>>


--
Best Regards,
Yan, Zi

--=_MailMate_A20CB30B-3BE6-4D91-9DFB-251982B59B83_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmGzcpkPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKNT8P/3sSKQdcK0Rs5Rdocj81JQ5mcLTISZ9yi+3l
NS//Q7ZDEBswWneb51tYGAGwjpmYh/z/6WSD5ZEaTE5V1QdKxX1GXUbo2cwvXiAF
EeU5M0hbw6gXxq1wq5WJ8mYLSwIsD+By1WDNTZFOiK5AL83qAcHcZbWlEeHv4huT
6lmN5vgdQlWskJPawhDHNND7lI1eF137oRDYAFuP+3WUhI/UUaL5BS6EWNY3wjQi
OB9Ok0Pw2/JQygRI6YRDpvevVD0AxaE0liaxNfV/CJrwK6QCikyWAiA4aFnnaMoa
s0uLSiNfsA/sSzsPHcyMHbGm2C5Iw3uDRoeFVeePXI+3nbN0H9/khT92fPdldg5N
ZXUYCzP2rGAe4R2Kr9QPh3yJcFvZiywy+5Qt2WKRUFIfJe1LpZ4JLbgDzgICKp/3
M+np8ohUkM5hikrFDCauX7fRAklZD715FDFkIisIWekf6DtLYn8lVOspGYz0pbIi
LsGMXbk7e4PEpZQONuHhkXz24mPIHudVBq5ZtNzZVoU+QbiljZJFFpvIup4rlo7a
o25OpKQBgpji0FmiHTwqdeFIohJHSY/ZFJt+bpvEqGMcVZUno5HXGviBXKEcIUTX
lwFTw6LSwR05bKZPNx6xK0z+fihDfa9ktJ8782qoaH/iMu4iLAEG8mHz7IkPmSgP
xG62BQ/N
=JZ4d
-----END PGP SIGNATURE-----

--=_MailMate_A20CB30B-3BE6-4D91-9DFB-251982B59B83_=--
