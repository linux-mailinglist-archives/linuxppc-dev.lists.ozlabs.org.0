Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A481B45A818
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 17:36:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz8sn3frTz3bhC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 03:36:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ikmGsHc/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.212.60;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=ikmGsHc/; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2060.outbound.protection.outlook.com [40.107.212.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz8s02FRxz2ybL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 03:35:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR/XGmZbtTRcJuzI1l5cIV4/RvPzdBvuBhLCfiK5Ivik3UtX+uq9pc4l7JulwuxjSj2NJhDQ7zBd7yM7x3IVr5Y8cIZ++vMwW5z71kK6UiPjDSpykd3ustrRkNKs19EWjwByNylfOVoW7w8s9kp6YYa30EuK5u5O/72ePaWx7xYg6Ni0YaPbdv0ddk/I/OS27nlsbQgFeShsiG6eN7xCZPZO+8Eb9hlW9GO72GwqemmrTvEqU4NSfSOVuNRaDfnmbbypPy+67HIVmiTu/Tj7i1tlJLAmxloWcfze1VAbQ3fbgHxWju8ezOK/Bh7AIW9YfZN9PjPM1iszMRUQKhf5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VkxpS+R45tvUqMiajIypEFMpJpYKYIDtuvgx4qDQ94=;
 b=M2cL42uXYQX1QWOvlVzGQwrX1jhQUR0H1Ii7YcJeunxYCR1Eh9Ha0uMmH5k19dNWTXXLRmejeYA6UrnRU9cTCqTG1R8MwCSvP0P+QmDkm/9Fx26xmrTxey3zVhv2RdH+RxWajdgBYIH8calzGYbbTOdtW7J4XBgTjCRA6spDYztRyV/EhLC8gnNNEN0deKHRTENVubqdC3ZZypDl8rnEcI2agybpR2Rso+LjB66UDCWInRWHUKTn0Qqnfv2iFNK6Wa0IS4XTVq6bvcgnbzLNXwc4rS2LeOlI/8Z2ttBZEox60amMxu0UFnf3PSO2FgAzOoK7ap7k64d2aE4NgOBQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VkxpS+R45tvUqMiajIypEFMpJpYKYIDtuvgx4qDQ94=;
 b=ikmGsHc/KMZs4bDMAv4mmx2hFXLXydmBECY6oLlNPSgqvcsM9OUqyr7TuekSq/Zt8pS8RImjBN+n922r5rPKk5KnfDABkIe6nUD/XY8pDEUaIl4tZVuoDpt3Sh+R7ATQ0wtHnfu5CqoHzGRB7CpyZA8qjDJJ8a/E+ElQ3QFFJr7Sfr9hR9eNWEsNeG38VTPduZ3Z+vEjT9QsHE1Ra55qLzMKsE7baUP4ZxZZ9B0cpX2FumvI5ugcUOn8jHYkBrQVKL/1KpHZLPVT8WuDQvVwRe4oKpOIpJiU0zaLk6gH6kvCVqYrUQ1ZDR4Mtj9oF5wsILucWzM1YqFk6nTXzPiJ3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB2467.namprd12.prod.outlook.com (2603:10b6:207:4c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 16:35:27 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dc47:e67:877f:f19e]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dc47:e67:877f:f19e%7]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 16:35:27 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
Date: Tue, 23 Nov 2021 11:35:06 -0500
X-Mailer: MailMate (1.14r5846)
Message-ID: <BF8FB68A-6E1D-4465-8A2B-884FC034660B@nvidia.com>
In-Reply-To: <AEFF28CF-0ED8-450F-96A4-A6CD59CB1F3D@nvidia.com>
References: <20211115193725.737539-1-zi.yan@sent.com>
 <3083463d-978b-fbe6-dadf-670d400ed437@suse.cz>
 <AEFF28CF-0ED8-450F-96A4-A6CD59CB1F3D@nvidia.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_B87A4FE1-FCD1-4BCD-A1E0-68BE0115A23A_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:c0::22) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
Received: from [10.2.49.230] (216.228.112.21) by
 MN2PR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:c0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.12 via Frontend Transport; Tue, 23 Nov 2021 16:35:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ce3efd2-be26-45ce-f0db-08d9ae9f414e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2467:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2467D5B05625C499A4D95070C2609@BL0PR12MB2467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0knTszpPOCy4ojmuXc/T3U47kTr3+jHh79zkLKU3tjwqU36eKu6rH8UX+02IbsTwWdp2Z5USDSwsWvOiLEsBbDwial2AfHNH+408FKTsUE6Tzf6sEViSN5vtqFkL429LjXNCSCYSvcM/nL3htKdK7lhmuLM8PTg1mn+vW4LRq7KSY9w+qMqn2iViFwiYXzwVJqI7LM/KPtOdmh9mC+UzZv32kAPeSVAwZd8fATBSdiKzcKF9W/9/UKxgm+s/7F0KkngzFaH2SKdpi75qjNddBxCj8irGrDNfeuC0Xte8TUYUcJspYO4kN2wHXDwb5ZEjl0MtxN9Vu4WjXmYmP/BBQ3zXXZ9XwWzMBQqWeswUXK/nh0wOcbyQUYaeONX+kmnjRQkbs8bFoQxKU+UKrucBt2k1PHYwlNlLtirp0/LsVigPq/K/EeA9JRpaQ8i1TcFss8JMZEnHcKLeIhgkfqKw/9+Dw6xd4nym99Xqfp6JiksRlrDov9U/OkakipTqIMUCmP2o2hJWc0SQgKydZ+NJU8HKJ6KKKGA3WDamf5MXVXLrpTVjSKuTaR0lXDWd3MKSBVv41Fa5m1qEk9yrnFebsvoAYM4K4UFHg2eb+7KpEuL87eIRnvwmYNP9gn0x/llgW1HFYHd+Wc3qlyeQaiUZxo/Bdg+gXbZ+s8gbUHenm4T0wwdfS3vYAjwPGGAk+jkeqa6H6FsZkOOXCo/pJlT20RlPwLGAXKR0ncfDbzMj5jSBclIbKHwah/+1twClQ9jLtCTrsJbeFFYy5LH7ipLnaM2300V8dkidVCgty7h+g3tAEx8tlluq6OkgP3YyliuD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(956004)(2906002)(966005)(8676002)(2616005)(508600001)(53546011)(316002)(8936002)(66946007)(235185007)(86362001)(7416002)(83380400001)(16576012)(54906003)(21480400003)(6486002)(66556008)(66476007)(5660300002)(36756003)(186003)(38100700002)(4326008)(33656002)(6666004)(26005)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n+Qv6q8RZs+aLHp3yKxVqmwK6cwr7vNywOQ5N1tmDayaehA0tQbcBy9xr7Kc?=
 =?us-ascii?Q?Psz6YYZzDpZLnDeyj7k4n4uV8wbieVYMmrIqbCxyeGSyYTW2TpbszwthAQNq?=
 =?us-ascii?Q?e99Zg4Ot5/z2sd8InRM7Ij18K7oLoelH0jm3iIW/JwJOpI7ect2eCvMJXfmx?=
 =?us-ascii?Q?ACaMLjNr8rgHIxj34BAP6ipdn/RRDdJA/rcINCcb6aSSeSw4wwUmLASf5L70?=
 =?us-ascii?Q?eI0gU0pLTFO7iKfmZdqT2Y7QZKLMk8IM+CrxXoluLNL5t/MJVAWcUkoU9//F?=
 =?us-ascii?Q?PUC3crsxyG30QoeUNJeaUA8aDl2xvvjA8TpJ4zQmZ31tNUPqS27fFH+4t0PF?=
 =?us-ascii?Q?dRtugNpKm3mbeq7Jz2uwgTSLXp2NqjfVUJTnOaoiq70AeHEPmaLbXmggoOLz?=
 =?us-ascii?Q?L+zDPT2L+aRbzsifm1abynJUlGaPla71zrZFxaO08SQLEoBWShPq3zr0XhzL?=
 =?us-ascii?Q?8P+wNXH7ute0svd+EP96sLz5HXH6m9e9GBGpRzUEFOaRL2r8/Wr2wW7qIF+h?=
 =?us-ascii?Q?zY/set1DFcyOnGEppFgDRnXSoTrvhMFChgKMFQlJCoaxS9WOrIPoWOwOd2u6?=
 =?us-ascii?Q?fO9vF1CRCNexZM+RmvD8Ce2q+AlX2ddTcL7nu616TdaS1789C6BN4JnOO6yk?=
 =?us-ascii?Q?McPX0Mq/Z1g4pw1if/KOxWA3twheHg4F1Zmcu6mnX0oWUmrt1S1qrpND3gWB?=
 =?us-ascii?Q?OfzdcHpqGjY6ofS/clcmcl67oKK1mZPvszFsRH+KWG5z4z0xCEoDm9miuQHy?=
 =?us-ascii?Q?S6PA6GOkrge+fQ4/jTr8NENb2/0QRsGFmEISzElXU3xuWOeR2xrO8njrP3H/?=
 =?us-ascii?Q?qnCtytfzLYbuE20CuGOg7MN7XeeJMM0TdZpiNs77QFnm3WxWpxFK+Pb6fjpa?=
 =?us-ascii?Q?9tQVr4LwSrqXfzQf9bEUeDpeUOv4t5ohOqcLA2BC0Fp5knVice75J8t+3JOM?=
 =?us-ascii?Q?m0CfVRIJrYbdxHUrLf/zdkhMx7wX+jcfrFEC0jL4KzzfTYNllyhj0eS77RRL?=
 =?us-ascii?Q?uLkE07qdlRuyn2ubUoyQI3OkxIjiDG5FseTafelCYgL36VQw9d9iHCVuXGdQ?=
 =?us-ascii?Q?PrnOyKwnbi82iyPlROLN8LWSxdL7h91/evD/BTeg/QvoUb0+TGK0aZzh6AMr?=
 =?us-ascii?Q?bzrRQNOfSKi1Gh4dSzUzttt0W86+GlyvYnMyHT66XkyaqOctvXZSg7ytMPS3?=
 =?us-ascii?Q?zbmKV6TbAEjpuXhpULnV2r9AsjGgVhEgeWmTERUw0SilaEeqp28QwCABD+RF?=
 =?us-ascii?Q?BJZos5H06hbrjxb+FmR9gN3h1bL8i60eFKIOxOXFCVKiZ35A2x7WYHIIo8tH?=
 =?us-ascii?Q?CdjVKpnDCsP0ii4cWBC1NgKxdcg/Y39GfaF0jU42nNCwlt2yAnXEx7blAITW?=
 =?us-ascii?Q?MLaB40EZ/ZDXJRqaXQEefTHl6kELFQTtLHfl7nDUW7rBmY4MgUtAnFoOX+V+?=
 =?us-ascii?Q?lFlI2voYKxyCcuShatfSQwKdmKuEy/fdEGsfJRMb4zJclzzp5h7Uv98WN5C1?=
 =?us-ascii?Q?OpKzY75YkbuDsuqpbirypG3ZRWzxhuTU5JJxXF7MSDXtlhGhOZc6EV7OtcEp?=
 =?us-ascii?Q?uZK62zVqMFBGHlHQEVQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce3efd2-be26-45ce-f0db-08d9ae9f414e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 16:35:26.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbxLP30yXt6wT2uEguj1D2xag07Fs8CmiiNGYOpIPxkP/G7PfJOqTXvRQcxOyGj7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2467
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
Cc: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_B87A4FE1-FCD1-4BCD-A1E0-68BE0115A23A_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 19 Nov 2021, at 10:15, Zi Yan wrote:

> On 19 Nov 2021, at 7:33, Vlastimil Babka wrote:
>
>> On 11/15/21 20:37, Zi Yan wrote:
>>> From: Zi Yan <ziy@nvidia.com>
>>>
>>> Hi David,
>>>
>>> You suggested to make alloc_contig_range() deal with pageblock_order =
instead of
>>> MAX_ORDER - 1 and get rid of MAX_ORDER - 1 dependency in virtio_mem[1=
]. This
>>> patchset is my attempt to achieve that. Please take a look and let me=
 know if
>>> I am doing it correctly or not.
>>>
>>> From what my understanding, cma required alignment of
>>> max(MAX_ORDER - 1, pageblock_order), because when MIGRATE_CMA was int=
roduced,
>>> __free_one_page() does not prevent merging two different pageblocks, =
when
>>> MAX_ORDER - 1 > pageblock_order. But current __free_one_page() implem=
entation
>>> does prevent that.
>>
>> But it does prevent that only for isolated pageblock, not CMA, and you=
t
>> patchset doesn't seem to expand that to CMA? Or am I missing something=
=2E
>
> Yeah, you are right. Originally, I thought preventing merging isolated =
pageblock
> with other types of pageblocks is sufficient, since MIGRATE_CMA is alwa=
ys
> converted from MIGRATE_ISOLATE. But that is not true. I will rework the=
 code.
> Thanks for pointing this out.
>

I find that two pageblocks with different migratetypes, like MIGRATE_RECL=
AIMABLE
and MIGRATE_MOVABLE can be merged into a single free page after I checked=

__free_one_page() in detail and printed pageblock information during budd=
y page
merging. I am not sure what consequence it will cause. Do you have any id=
ea?

I will fix it in the next version of this patchset.

>>
>>
>>> It should be OK to just align cma to pageblock_order.
>>> alloc_contig_range() relies on MIGRATE_CMA to get free pages, so it c=
an use
>>> pageblock_order as alignment too.
>>>
>>> In terms of virtio_mem, if I understand correctly, it relies on
>>> alloc_contig_range() to obtain contiguous free pages and offlines the=
m to reduce
>>> guest memory size. As the result of alloc_contig_range() alignment ch=
ange,
>>> virtio_mem should be able to just align PFNs to pageblock_order.
>>>
>>> Thanks.
>>>
>>>
>>> [1] https://lore.kernel.org/linux-mm/28b57903-fae6-47ac-7e1b-a1dd4142=
1349@redhat.com/
>>>
>>> Zi Yan (3):
>>>   mm: cma: alloc_contig_range: use pageblock_order as the single
>>>     alignment.
>>>   drivers: virtio_mem: use pageblock size as the minimum virtio_mem
>>>     size.
>>>   arch: powerpc: adjust fadump alignment to be pageblock aligned.
>>>
>>>  arch/powerpc/include/asm/fadump-internal.h |  4 +---
>>>  drivers/virtio/virtio_mem.c                |  6 ++----
>>>  include/linux/mmzone.h                     |  5 +----
>>>  kernel/dma/contiguous.c                    |  2 +-
>>>  mm/cma.c                                   |  6 ++----
>>>  mm/page_alloc.c                            | 12 +++++-------
>>>  6 files changed, 12 insertions(+), 23 deletions(-)
>>>
>
> --
> Best Regards,
> Yan, Zi


--
Best Regards,
Yan, Zi

--=_MailMate_B87A4FE1-FCD1-4BCD-A1E0-68BE0115A23A_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmGdGDoPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKdSwP/Rkpe5TY8bwBrv7k8zh0t8Vtjx0X6u5hZVLY
rFGzwCpFOBaDE7hLwlsVbEUhiFpOG5QQCcgNz6nVw3N20v441mvtMeyC3X3wba+r
3echfI5q32BsavoC8dyf2/zI6POVEbRfwzZhZAuNjYIe61Aj7zG9uMYsFxxfS7kC
m63oNtUynZLQiPbAsxML8u5eWKUUflLEMcLTkMBhW5QFDiyKzt94hL93b9VF1cCP
+YfV6TXEWAMXeIwBoN2UHvSv2DBgPXtJhxuYfLkvxl3E0Kl1e6B2d5WwumYn4p+4
q7fOjS7ZIfZXkxYUjXFjxk3PLUPn3NdDzp4tPrOq/Dl6Gp3dCMtwlMhmqyFgRsws
Src8Kh8tBxqR1xG0/Cw6NBlmaMCPdqQYebx0ZxwI6g1KbcYSkZMCg+twN8XSGY/6
qVOSWC/GoXslq4xl161GfJoQ1t9jWkW339bKDxgEtPr3gOjuAqfCMtxYsHp6Jy52
6l5zwh5r9X/IiN7cYWz2UOdTX8K+80/006ySxG/fL1EWzZylnNgPVVI6bn19ASL/
5kAnxithROyYLG7ElrytbszVcHo5/0vAKrkm8dMR0zOyKolY0eDb94BMy00Mb9FP
MmRY2ka53xPdQNtPqmLk+gtNYwUs9f1HsqecJ5C7CoruF/oveELOu6uFc1UQoGFd
D0t0WTfG
=1ffP
-----END PGP SIGNATURE-----

--=_MailMate_B87A4FE1-FCD1-4BCD-A1E0-68BE0115A23A_=--
