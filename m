Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5F453EC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 04:05:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv79J5zQ3z2ybK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 14:05:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Enk5P6HB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.220.48;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Enk5P6HB; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv78X3GqYz2yHH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 14:05:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPXbnpjIZ8Fl9G+vLEx16rTudx6Ob+0N01eu2QThhGFY7KKnu+UdE2poIG0QxyP/0mZPVtRcnw6XTIRHEER8WfUctuxldQSd1kRycV1Dgo5MdARnbzcG5A84rvKePnBmHFbZcr3fzUBERZnr3Md+A80CbU7F8z1LOuVmLxJvcGPUBWr6NGp2KUDLyLxoUmi6ggfn8b4GcYF2OD8krUF439MrmgD5IAtq4hToKKW0zCcnHNdtLPGVa78+Dk+MAPNz1N72jiDrTopeZewyc2J+6yWauW0gI6QizehG+rau853JIh7vqWRO188Ghu9j2W6D6TJJe7GPWu2O5u+hCGGwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9k3PoyMJrDxAUxQ8nPphYpbzsxbjQn4lWZLUBaTVmg=;
 b=QBjr+ecrEcEOk3hh0uOVwnpe/fEtqfxdD68czAqOx79DiHedLplIA7c1p/V89CukNiSw8cK2hMl2M0oUOdNL4F7Ky21EmCoGmzx1lY+yTkrhbFzsigach97/U97qtu4iRqw6lTb4+0LAEFV+z/KvCIqY91y81gdIZ0O3jYAsb13dTOLW3ZX6n2KuPydOsaGNH1cJaqwcYHFPwnRx11QRAy4gpG4wdhn4laidQsaFRCVNhZ4x7oaeyZdpyMpPCHb57pPLzQ5Tn0EWQO2YPGrPb4Ch7TXcJjiRtfyzMLWVUbJfSd1Z2bS0c4OdweWZviKHFE0r2fsDO1lpkmsFqHmtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9k3PoyMJrDxAUxQ8nPphYpbzsxbjQn4lWZLUBaTVmg=;
 b=Enk5P6HBYU2BLHjj1jXGc+roQTHVi1OKTaz3yDckZdsPANNOw+M97Z24XkW1q6Wc2+odaiw+hpLuUx4D2EU6kuYwDfaVJS1hjtg37b5SSaPjygQ2ypzPfQ2zMLo65HxqnkGqQT/K2pElIUpmOgrs9VSuOBiFTGkjGN+yn84/S7nGZ8UYT7PXor2zT2I/harMocw+YhnehYbmd/UQzNDc9+7pfncmUWfx7EzR8wIDV6DMw/6rXMNjMN47vQOZ7EQJvj3ogvHrvexLTMsmICDYdzS+bjQDGezUjL4DG/vRNnyfN1N7a6HljzzXPbApoKdyVMLwBJZWHyGOY1J4aZCOmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB4676.namprd12.prod.outlook.com (2603:10b6:207:19::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 03:04:54 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dc47:e67:877f:f19e]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dc47:e67:877f:f19e%7]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 03:04:54 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
Date: Tue, 16 Nov 2021 22:04:48 -0500
X-Mailer: MailMate (1.14r5846)
Message-ID: <C99EE864-DF71-469D-A047-4446400B2AE8@nvidia.com>
In-Reply-To: <d19fb078-cb9b-f60f-e310-fdeea1b947d2@redhat.com>
References: <20211115193725.737539-1-zi.yan@sent.com>
 <d19fb078-cb9b-f60f-e310-fdeea1b947d2@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_7B46F7CB-F271-48F7-B700-0DF1200B2EB0_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:c0::29) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
Received: from [10.2.52.6] (216.228.112.21) by
 MN2PR05CA0016.namprd05.prod.outlook.com (2603:10b6:208:c0::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.17 via Frontend Transport; Wed, 17 Nov 2021 03:04:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bd1fd3c-13b0-4fe4-3885-08d9a977077d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4676:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4676F73C872F1CCA5F15BC6FC29A9@BL0PR12MB4676.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b4q0qZKzhxAhT6SykcVFyrD7R7ROVjojAOagraOMsE5kQGxzHQN3hqEwpjSyrl407KSBnB3FeEFfELl/EWKeoac2/f/8msfjpQSuiPEZBcq8riRCxP7Mj0UqZWWMLalA+AZDEqQefPukg/qFDFy65IRA3P7QUvpeX9sPs+JhDZjQSNKRuPGwW9u3U2oL5lu46JJdlY9bu/dD6DZ61o5qL+bGvK+aKd6qtcHUZzg70lxvOZuw6kkahM11H9Ub3ueyiyVONyAjWwGiX8mn5X4vQxhOUM+IHTLPC15/LheLB1CaY/vTmaS/FwgqcfQLvaT+NyViQsw7/dhAWFMC4v5OBkV8M9Z+AlVs5B3X8Nt45KmXg5hGbrQMxv9na7ncaA2UmFt7MK7yWEAy8PWyUxBUDXVRSwwg9Tti837dIpwo82uDcl1IJwULWnyS2OZuDIXGhSQiEcj4loMlGYDxJnhXcN8Qo3Po8xnK0hBKzX4eR1qMuEq/Xm/g3cmHLT9IHouQoBrPG2Gf26mBp5I244eaQYUezVlqxEZaL7hoQUsYWxp9X3Me/IF8WIC44A9VELJt/HZOMQxExaGXgUY1Mtr7UBrn1yesjRNX/qDsEm+K+g2e/Csb9fxhd1KleDLW2ZkLBFuOQnkRP5GOgepYdNTtWvDKTOO+7xjAIWz03Vtx81L/0U8QgNGNzuansFOab7Y6oCAth6b+H+QKGJ+1IKrobejguAOhkJgbGuGFu63lNgk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(4326008)(956004)(38100700002)(66946007)(5660300002)(6916009)(53546011)(30864003)(86362001)(8936002)(26005)(186003)(66556008)(66476007)(235185007)(83380400001)(6486002)(33656002)(508600001)(2906002)(16576012)(7416002)(54906003)(316002)(6666004)(36756003)(21480400003)(2616005)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?47aAgoj/6IQx8bJnLVMWFi8tNJL+5LZxA4eorRs5vA0vDvyzmnEFYWPDjk62?=
 =?us-ascii?Q?O/xVB1fqQCI5VUZwoIlS+f3p7zcnPHPKm9LZzUHLu7whRbDh7Ujn27xLitGG?=
 =?us-ascii?Q?hKzqUQ982CGYk66grn9Yl0PZFjM1sfoQI7XuEUOZwG4mmM7szWsAd83Pe7RC?=
 =?us-ascii?Q?8Jlni4POWM7goTWZhLy4XmYtTJA5J0Bk2OJEzwKsEfwrHjyVB4mCW/C2Ms+4?=
 =?us-ascii?Q?5wnk60K9kxUxIP59cRZMPpvqqAC3NCCXSFepkeshEvRDAVKw0AvwEDGTpYPW?=
 =?us-ascii?Q?vMsf1Zf2g/YpCbbjAKPrYgGh4Xkgz4nnk5lW3xOyfMf66CrcoaBr3fBDM6pm?=
 =?us-ascii?Q?5e9UhlqPDSp9oZ/as/0BfThH1NPamzyTRKquwV8ZWFMt6otUJNpvgZtnX5o+?=
 =?us-ascii?Q?Tj4mYsDKh0pCDMMxYSJWG6AOfDS4Rp/iEUqSMluAvtvy7FpYdKTFhBY/Q37N?=
 =?us-ascii?Q?KriK7HkftI0mH2q2ip+h/LFcv496QYxV1H6z1g18o4Lk9fIt6aBf5OgSUC0n?=
 =?us-ascii?Q?10sPIGIFLBiFXeqN7kiSg/G1FOU8EZTd5O1lNkjzKmtpvRIfMioQXO4w6Lc7?=
 =?us-ascii?Q?gaql6J9oqi/sIPChyErgD8X4MY+WcgEeR6mPoy5iB/RWKr/eKa4J+nX/Y9wC?=
 =?us-ascii?Q?zz+iTSIoo1CIpxHyo43Ns2XKu2+8RyeU8VQe0kMWg+begyWOlhJ56KQv6fne?=
 =?us-ascii?Q?NM4/gPO70bAfi4I55Ml7JbjaR+Vf+rXHa0DBbylWYGhozQVE1IA9a3PDZlfv?=
 =?us-ascii?Q?i80uDuymUgxGW7tSBn26Zm0Rabv05o0k13VsWRBmuoZiknIE5l+Y49CiZR4R?=
 =?us-ascii?Q?UWez/INrM7G35w4vdykFHGrMgjP5GKGsJQN3cBJhaaydmdll0N7wCYOSgVE3?=
 =?us-ascii?Q?R5YJByyXLiH6iueUHknKMotJR7gskETE8fv4pqSL8QGuOzKwfvx6CZD0Tzl+?=
 =?us-ascii?Q?xD/DPGQjUg5MjvVYbazN9MzVE2nCgvt0Z2xjqguX70byczrq4VTWpid3jOsv?=
 =?us-ascii?Q?Mi1aH/jWfkbIpdho1TiUafqQQvHGRjIKMOF5FrdDxMsL8phga2P/PjOGa+nJ?=
 =?us-ascii?Q?cETJFcQU9wYef35r6WKz0U8gloWRCNCyd2Mt9OrEHuT2XuRkwpdB5l8PsBET?=
 =?us-ascii?Q?YfTzCRNGVxN4TedQphGKdjXve81wHx1IFicXROwnl2gicI1JgfTy+BOzZYZM?=
 =?us-ascii?Q?caZRoHZMUABcxDlI5nT3TVanpatEldNED7Xuq4gbnQHsLVGcWNGEn8FJNlVz?=
 =?us-ascii?Q?ox2hQUT2s1fptHzNNtdTuw4Xury7JiCWYjQANdzyZGFzWNiTc2o2l+lHvUCR?=
 =?us-ascii?Q?cbp5eJx9FhTmpv5EHBcCuZaHYKhwtPg91csEbo5HT/rwTyjOk3BOTcWvnB9S?=
 =?us-ascii?Q?0yK/5fCK7OoEjSrFttNFR8EbjRP5v0gDoSq6UHeTkAkZV2/fDjqAfKrBN0T6?=
 =?us-ascii?Q?7ZCecae2qp7M4Krb+isTo4yr/Q2YCXwwiV3saobNlClpGq+TTFZ6N1FlSwsO?=
 =?us-ascii?Q?6bLMvZjPOPY71UiqUJnzO0Y/9NHiimN8Fx9YLCAuUF51joWBqfZ9jw6jut3Y?=
 =?us-ascii?Q?J7Yj1fA2LDNzV/Op8Uw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd1fd3c-13b0-4fe4-3885-08d9a977077d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 03:04:54.3104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHUZfCcXj4BNhcC4oB4pCrT07xG4c/VuUc5ZzQcQzWcmZEjNmhXnwIBbcanIbMyB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4676
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_7B46F7CB-F271-48F7-B700-0DF1200B2EB0_=
Content-Type: text/plain

On 16 Nov 2021, at 3:58, David Hildenbrand wrote:

> On 15.11.21 20:37, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Hi David,
>
> Hi,
>
> thanks for looking into this.
>
>>
>> You suggested to make alloc_contig_range() deal with pageblock_order instead of
>> MAX_ORDER - 1 and get rid of MAX_ORDER - 1 dependency in virtio_mem[1]. This
>> patchset is my attempt to achieve that. Please take a look and let me know if
>> I am doing it correctly or not.
>>
>> From what my understanding, cma required alignment of
>> max(MAX_ORDER - 1, pageblock_order), because when MIGRATE_CMA was introduced,
>> __free_one_page() does not prevent merging two different pageblocks, when
>> MAX_ORDER - 1 > pageblock_order. But current __free_one_page() implementation
>> does prevent that. It should be OK to just align cma to pageblock_order.
>> alloc_contig_range() relies on MIGRATE_CMA to get free pages, so it can use
>> pageblock_order as alignment too.
>
> I wonder if that's sufficient. Especially the outer_start logic in
> alloc_contig_range() might be problematic. There are some ugly corner
> cases with free pages/allocations spanning multiple pageblocks and we
> only isolated a single pageblock.

Thank you a lot for writing the list of these corner cases. They are
very helpful!

>
>
> Regarding CMA, we have to keep the following cases working:
>
> a) Different pageblock types (MIGRATE_CMA and !MIGRATE_CMA) in MAX_ORDER
>    - 1 page:
>    [       MAX_ ORDER - 1     ]
>    [ pageblock 0 | pageblock 1]
>
> Assume either pageblock 0 is MIGRATE_CMA or pageblock 1 is MIGRATE_CMA,
> but not both. We have to make sure alloc_contig_range() keeps working
> correctly. This should be the case even with your change, as we won't
> merging pages accross differing migratetypes.

Yes.

>
> b) Migrating/freeing a MAX_ ORDER - 1 page while partially isolated:
>    [       MAX_ ORDER - 1     ]
>    [ pageblock 0 | pageblock 1]
>
> Assume both are MIGRATE_CMA. Assume we want to either allocate from
> pageblock 0 or pageblock 1. Especially, assume we want to allocate from
> pageblock 1. While we would isolate pageblock 1, we wouldn't isolate
> pageblock 0.
>
> What happens if we either have a free page spanning the MAX_ORDER - 1
> range already OR if we have to migrate a MAX_ORDER - 1 page, resulting
> in a free MAX_ORDER - 1 page of which only the second pageblock is
> isolated? We would end up essentially freeing a page that has mixed
> pageblocks, essentially placing it in !MIGRATE_ISOLATE free lists ... I
> might be wrong but I have the feeling that this would be problematic.
>

This could happen when start_isolate_page_range() stumbles upon a compound
page with order >= pageblock_order or a free page with order >=
pageblock_order, but should not. start_isolate_page_range() should check
the actual page size, either compound page size or free page size, and set
the migratetype across pageblocks if the page is bigger than pageblock size.
More precisely set_migratetype_isolate() should do that.


> c) Concurrent allocations:
>     [       MAX_ ORDER - 1     ]
>     [ pageblock 0 | pageblock 1]
>
> Assume b) but we have two concurrent CMA allocations to pageblock 0 and
> pageblock 1, which would now be possible as start_isolate_page_range()
> isolate would succeed on both.

Two isolations will be serialized by the zone lock taken by
set_migratetype_isolate(), so the concurrent allocation would not be a problem.
If it is a MAX_ORDER-1 free page, the first comer should split it and only
isolate one of the pageblock then second one can isolate the other pageblock.
If it is a MAX_ORDER-1 compound page, the first comer should isolate both
pageblocks, then the second one would fail. WDYT?


In sum, it seems to me that the issue is page isolation code only sees
pageblock without check the actual page. When there are multiple pageblocks
belonging to one page, the problem appears. This should be fixed.

>
>
> Regarding virtio-mem, we care about the following cases:
>
> a) Allocating parts from completely movable MAX_ ORDER - 1 page:
>    [       MAX_ ORDER - 1     ]
>    [ pageblock 0 | pageblock 1]
>
> Assume pageblock 0 and pageblock 1 are either free or contain only
> movable pages. Assume we allocated pageblock 0. We have to make sure we
> can allocate pageblock 1. The other way around, assume we allocated
> pageblock 1, we have to make sure we can allocate pageblock 0.
>
> Free pages spanning both pageblocks might be problematic.

Can you elaborate a bit? If either of pageblock 0 and 1 is used by
virtio-mem, why do we care the other? If pageblock 0 and 1 belong to
the same page (either free or compound), they should have the same
migratetype. If we want to just allocate one of them, we can split
the free page or migrate the compound page then split the remaining
free page.

>
> b) Allocate parts of partially movable MAX_ ORDER - 1 page:
>    [       MAX_ ORDER - 1     ]
>    [ pageblock 0 | pageblock 1]
>
> Assume pageblock 0 contains unmovable data but pageblock 1 not: we have
> to make sure we can allocate pageblock 1. Similarly, assume pageblock 1
> contains unmovable data but pageblock 0 no: we have to make sure we can
> allocate pageblock 1. has_unmovable_pages() might allow for that.
>
> But, we want to fail early in case we want to allocate a single
> pageblock but it contains unmovable data. This could be either directly
> or indirectly.
>
> If we have an unmovable (compound) MAX_ ORDER - 1 and we'd try isolating
> pageblock 1, has_unmovable_pages() would always return "false" because
> we'd simply be skiping over any tail pages, and not detect the
> un-movability.

OK. It seems to me that has_unmovable_pages() needs to be fixed to handle
such a situation.

>
> c) Migrating/freeing a MAX_ ORDER - 1 page while partially isolated:
>
> Same concern as for CMA b)
>
>
> So the biggest concern I have is dealing with migrating/freeing >
> pageblock_order pages while only having isolated a single pageblock.

I agree. I think isolation code needs to be aware of >pageblock_order
pages and act accordingly. If it is a free page, split the page to
avoid isolating a subset of the page. If it is a compound page, either
fail the isolation or isolate the entire compound page instead.

>
>>
>> In terms of virtio_mem, if I understand correctly, it relies on
>> alloc_contig_range() to obtain contiguous free pages and offlines them to reduce
>> guest memory size. As the result of alloc_contig_range() alignment change,
>> virtio_mem should be able to just align PFNs to pageblock_order.
>
> For virtio-mem it will most probably be desirable to first try
> allocating the MAX_ORDER -1 range if possible and then fallback to
> pageblock_order. But that's an additional change on top in virtio-mem code.
>

Just to understand the motivation, is this because MAX_ORDER-1 range
would be faster than pageblock_order? What if MAX_ORDER-1 goes beyond
a memory section size (like my WIP patchset to increase MAX_ORDER
beyond the memory section size)? virtio-mem could first try PAGES_PER_SECTION,
then fall back to pageblock_order, right?
>
>
> My take to teach alloc_contig_range() to properly handle would be the
> following:
>
> a) Convert MIGRATE_ISOLATE into a separate pageblock flag
>
> We would want to convert MIGRATE_ISOLATE into a separate pageblock
> flags, such that when we isolate a page block we preserve the original
> migratetype. While start_isolate_page_range() would set that bit,
> undo_isolate_page_range() would simply clear that bit. The buddy would
> use a single MIGRATE_ISOLATE queue as is: the original migratetype is
> only used for restoring the correct migratetype. This would allow for
> restoring e.g., MIGRATE_UNMOVABLE after isolating an unmovable pageblock
> (below) and not simply setting all such pageblocks to MIGRATE_MOVABLE
> when un-isolating.
>
> Ideally, we'd get rid of the "migratetype" parameter for
> alloc_contig_range(). However, even with the above change we have to
> make sure that memory offlining and ordinary alloc_contig_range() users
> will fail on MIGRATE_CMA pageblocks (has_unmovable_page() checks that as
> of today). We could achieve that differently, though (e.g., bool
> cma_alloc parameter instead).

This might need to be done in a separate patch, since pageblock bits require
to be word aligned and it is 4 now. To convert MIGRATE_ISOLATE to a separate
bit, either NR_PAGEBLOCK_BITS needs to be increased to 8 or a separate
isolation bitmap array needs to be allocated. Or the migratetype information
can be stored temporarily during isolation process. I can look into it later.


>
>
> b) Allow isolating pageblocks with unmovable pages
>
> We'd pass the actual range of interest to start_isolate_page_range() and
> rework the code to check has_unmovable_pages() only on the range of
> interest, but considering overlapping larger allocations. E.g., if we
> stumble over a compound page, lookup the head an test if that page is
> movable/unmovable.

This is an optimization to reduce isolation failure rate, right? This only
applies to the pageblocks at the beginning and the end of a range of interest.

>
> c) Change alloc_contig_range() to not "extend" the range of interest to
> include pageblock of different type. Assume we're isolating a
> MIGRATE_CMA pageblock, only isolate a neighboring MIGRATE_CMA pageblock,
> not other pageblocks.

But alloc_contig_range() would return these extended pageblocks at the end.
And if pageblock migratetype can be preserved during isolation (item (a) above),
this would not be a problem, right?

>
>
> So we'd keep isolating complete MAX_ORDER - 1 pages unless c) prevents
> it. We'd allow isolating even pageblocks that contain unmovable pages on
> ZONE_NORMAL, and check via has_unmovable_pages() only if the range of
> interest contains unmovable pages, not the whole MAX_ORDER -1 range or
> even the whole pageblock. We'd not silently overwrite the pageblock type
> when restoring but instead restore the old migratetype.
>
I assume MAX_ORDER - 1 is an optimization for faster isolation speed.
If MAX_ORDER goes beyond a memory section size, I guess PAGES_PER_SECTION
is what you want, right? FYI, I am preparing a follow-up patch to replace
any MAX_ORDER use that is intended to indicate maximum physically contiguous
size with a new variable, MAX_PHYS_CONTIG_ORDER, which is PFN_SECTION_SHIFT
when SPARSEMEM and MAX_ORDER when FLATMEM. I would replace MAX_ORDER here
with the new variable.

--
Best Regards,
Yan, Zi

--=_MailMate_7B46F7CB-F271-48F7-B700-0DF1200B2EB0_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmGUcVAPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKxZkP/i/ki2maWjoWgk6dkNcnTnqYigdf5agV9kOM
uT+O4ss4HbmgCiw9daQFSF+l7gvNR6aJImNtuMcbsBXikaAcd9Djr0ovb8dJ2Lwx
CPe8SIcNymdOlNzXhJumdFZs8gzdZKcN4sDNIuHPPapNWd2ncyXsRAMv52l4FOtb
7uNuODKvy6Dp3BSvYMxDciZt7YkgfW0QISIdN6M0ArkR+h10UNQiB6UFE+jj7fAV
ByPfCiaVT5JdWg9L9PZxknPG5OpIxydyYV7eNawWtZEaHyTn+SoAnPI9J7I4Sgyt
tSvdCHPLPF80CAmmW+5UAvi+WQfVEoPANrLwKmoN0Heo02GEY9UDRsfXH12jnvtR
VAPIB9r0yw20xIKpa+7yy6bKCuLApRHksc652OyO7U5YtDZ9+9XiK592sqM0O4YN
8BA8TCibkVCnw6lZu2Kc4F9dafQuBBBHqf3kzlnv+kgggB3zeBIHIWpwPI8LoMhV
2ArIUop2ZB+7Y7sacrj6G+7Scme3qSav79Kepi98WWyVKBECP/oQQ0tYEVnnGjk+
Ul2n3i4n5HrbdtNFSAJ0X9wNqSF4ZkhME9ytfaU8nLH1dErP7g45Fqcw1YeRbbSx
qarZmWch19DLRVhHtpVmoLeOQBYneOS+wZYaz/j9ifbaiHAsa2XaqLtoWSXbwUvA
1+DbCbA8
=OzuC
-----END PGP SIGNATURE-----

--=_MailMate_7B46F7CB-F271-48F7-B700-0DF1200B2EB0_=--
