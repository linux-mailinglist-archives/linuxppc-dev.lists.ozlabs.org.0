Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0382EF09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 13:32:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oLsDTSbx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDpLq07dhz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 23:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oLsDTSbx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::601; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDpKy6YNjz30RS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 23:32:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBDU7Iuo3pkIVqOgqdgFO7n0v/JSP+1lCg/rsCJG9Urpa+Sw29ztX2hjL78EHEhTJypr1WIlOb/mOgg4Wxqphr0oK2IFLHLgkKfk8axfx0ZLetH9EpygkC5P8J1fvyX1gecHM1PVxgi+JNfRYaqLbTdZZIyz+QopXZH6ABw1VHBZquaCuyHKXbFfZIJFQfRzogyHrPwBNlb5L9gae1cOMOKLT9EUSQNxa9CWTZilHgCl6De6VOfMWoe64nYBigawp7mfrlZ5MQGJr3jcTn79I4DywQs7WQJg05yHgAl2geBtQJgh+nqGlT2m/UJSKetzqUEe6MPpw+7mg8zEP8mlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ou69qmu5MyFdSzUksBk0UioIF8NrI2EuIjJPhw39MO8=;
 b=FSYsdD9F7Jy3ZSeAQGZQHxURC5IDoWB2nofreQDX4FLkxXQJEz5OKKK/1J8s8H2JtUdWcYiwmECGe87d6s+FIGp40G2kY8YThlw5tnhiqJkPm10pTjIhE5/1ruoZcyOWXoEkBOPSWWNOzHJ8cFmWcah0qT/LjcqISIXcDWDbE9XM91bJZbuvwpvdS8Y86Yd+a3LjGgcom4Xw2kErqipPu7p1QOEar5YT08z565msJ0LLMQGrVUxizOr+sFQlsBl0QG+Q6MEdeE5g22CWDgDLnt2wZdM3qAwqNEEVPCQFJ0rSqfK3aiR/1aQ41pC1IM8hTzPSYv76pyKIjwt3IcMrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou69qmu5MyFdSzUksBk0UioIF8NrI2EuIjJPhw39MO8=;
 b=oLsDTSbx5nU4UkKtJrtSM1ihw4jYLk53xAhWHdqTCptwADWLeN0ztN5IR4vGp948lLEcYwOCjBI25+UPGbVW8W1ZozxgNQ36MqpG0h2wKLgJfcF4wBmclYQZmu4fZwJL0WEiO0qmv6U6K+hCLnrD7htTOb0UGSIVznOI8VxBnF2JhzDYsmXul99yFNhdQp6vhtjX3SN4BUG/P+TA51BWqSeYbqWRER6AgShkEXBfCvVKpTtY03PJoRTpO+sftERkrUZaA+5lBXVNA6AgWqwQFPtymMsiliZQ8Cqh4i2J3UTZu1xp16nJ9rwfQsgN2q1VFqyZV0mAFdzM8km0R1Oeaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV8PR12MB9112.namprd12.prod.outlook.com (2603:10b6:408:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 16 Jan
 2024 12:31:40 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Tue, 16 Jan 2024
 12:31:39 +0000
Date: Tue, 16 Jan 2024 08:31:38 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Message-ID: <20240116123138.GZ734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-7-peterx@redhat.com>
 <20240115183748.GR734935@nvidia.com>
 <c60c9d88-33aa-4312-a23c-20206e503b6e@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c60c9d88-33aa-4312-a23c-20206e503b6e@csgroup.eu>
X-ClientProxiedBy: MN2PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::39) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV8PR12MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cdfa55-9746-4133-6268-08dc168f16c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	prUm+q64mhOP79HbjbpXdCYY8GwWVnlGcIsMX7rlOr2EpGtnHR9gWxYDRYPamfmrD0x4pWI0uQOW9Mkq1XZFq1XD/kfAMvteKVoCVU98KhrLB3K5Svj+qpgDc3t17uzKIV3TeWA8ZhimPEd3Qm/qTrCZ4B0tmyIB6fL7wbzhg4EXHBZYMccEw90AEN2CuT0ze39ldw0sUhUc/4y1QzVlL4QL3JehVginc65mag97bbbfvaJHOdQp1YzwFUos/3irW2exZ+CDpQS1A2UYQi1H3vlwswy9KWQylDHbYDBT/2knbAyUX858ED1d/2lLcExJIgIBQr5fpjTdnu4q1yf8T7qVifvVFybhz62ho6XQcsTdlVM53yDiooDRbzdUqA33LeG8ICEeGP2xQ7Y/NfiNaf8jm56SIwPm6leNllGgkuX8MNyg/rSy0/QWXySZgedyHe2v64ZlJhBI2mL15E+fDFx61xdMlW9yG9y8zanCr8VvQT+sznzIfCJkk+Qt+gQlMXe7rVvywpXy0YibHUWB/GQIrN3H2iNgNGqKXaJRzaLgWqBFdoBcszBkNG7yuB/LS6cgNQazE9roWO+VyyItC1hEodpQbai17y89mwK3EWhFG2+uwTAMQokfLZpfUXsP
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(86362001)(26005)(1076003)(33656002)(66946007)(36756003)(478600001)(5660300002)(38100700002)(41300700001)(6512007)(6506007)(2616005)(66556008)(6486002)(2906002)(66476007)(66574015)(316002)(54906003)(6916009)(8936002)(7416002)(8676002)(4326008)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?M0FRSDAyUGpFSHgwN3BFdTZWQ1g5TEI3VUNnaVpBamJNNVhXdm16K2dtTUdY?=
 =?utf-8?B?ME9IZllTS0J2U1ZkOXNtWU5zNXBTRGVDaS9yLzNVSHNZMGhrc1dOZDBsMG9L?=
 =?utf-8?B?QzZieXhkVmlMdWtxMWpsdjZ2Qkc5aGJKYURLemZEUUZWY3RNYS9kQnlHRHZQ?=
 =?utf-8?B?bWNFUExTdGxpb3dVeU9tUldwQ2pUcTA2bXhTRDR1WUl4QmlXdDNFZkI5TVZB?=
 =?utf-8?B?T3NIVnRhYlJCc0pvekZyblpPUEozV0hiTTNNaWFoVVlERmM2Yk1wbVFiWGVP?=
 =?utf-8?B?azdnVTM1ZWNLakxlb1NieU9scWNCS0tZeGkvdGFqWUpKZXhMcEE1ZzFoUEtZ?=
 =?utf-8?B?dkMweFU0b1AzK0t2dklGekdvYU54VURjeW5OV2NjZEVnSFJVMFUzdHp0ZXRM?=
 =?utf-8?B?TXZxNWthcTFpT3FNM0Nqa3dPOVhCTTB2TnBnQ1VWaFNYRVdzNGFtUSs0a1lB?=
 =?utf-8?B?VEZTa0tKWkxHNllQYmx4L1NiMjhMVmpualVIOU94N1JLbXRXSmxScnQzRmJ5?=
 =?utf-8?B?U2tpZS9aekNVcExDd29jbFBmaFhQNXVNNE1aLzkwOG9yQW1ING9Qa2xqaFZX?=
 =?utf-8?B?elRoUG96Q01OZ0prWW1yVG5PQ09MNkRFWU5CbjRrZkwwN2w0SzFvV1VITkx5?=
 =?utf-8?B?aGRZcFdQRzNsdFJ0cmM4U2phZFhObVBPWWlCMmcyL0ZkRmZKTjBFYzEyNlBl?=
 =?utf-8?B?MTM5NE5WTzBxRW5VZGxRejNLNUVzSXhBckg5NUlmUDMwMEg3UUVFT0YzVGFk?=
 =?utf-8?B?SmNFL2xUZXU4M2lLblFveE9vbkhlcHdsL2FhWkQrR1BONmhMb2lRY2tiZkhS?=
 =?utf-8?B?ZTl4b1YvV3I0S2VxZkJlaHRnR29LT1JVYmRyR01JN3pqMThvcjFvYlMvbnVr?=
 =?utf-8?B?WmkvS0ZZc3NIL1RiN1htMUZqVDZsQzM3dUJPWjJBTDd5S3dXbS83K0VOam91?=
 =?utf-8?B?K2xoZVorQ00zMVdieW1XY1ZEaERsQWF0U3VBYWRabitQS2hFVURXaUtuSUVL?=
 =?utf-8?B?aTdNR3V4L2hyUkg2SkhiM3Z6bktKOHN4YkIxcE9XanBxakg1UEpJUVg4VnZC?=
 =?utf-8?B?ckdGczd5TVlwWGRrUTYzQlNPYkoxbGYrZFE0Q2orYU1CbDJKN1FVWndidTZt?=
 =?utf-8?B?bTNhR0pheVZFelMvalhvUkJ2cHJIRjY0QWROZUFsVjJPTWhYTFh0VkJVaTN4?=
 =?utf-8?B?eGVZLzI1Wk1hd1dFM2trV1ErVXZNcmRDaEVYU2Rrcy9pekJ1a2o1UWdFWkVY?=
 =?utf-8?B?SThVdXk3NVN5djdkMW55K2RkQXk1OG5zMGlnRGNOOUZlbWU5OGhab3FXaFNl?=
 =?utf-8?B?WUZvRURDY1J2NnlsTHVyTnExZ0dHWUZFWWJMcDI3eE04bTdXRFhmVmZxMitC?=
 =?utf-8?B?OS9zcElFTWdlUy9PQWtmcDR5ZUFVdWtQWlhlUEZBVGFVb3JIMTdPQ0Qrc3cr?=
 =?utf-8?B?N3JOOHh2aWR6eEwzTUpsWmxBV1JMdFJlL3ZVaEFDQTJkR1U5TXd6ZkQ1M2hp?=
 =?utf-8?B?Q2grY0t6ZUcvanljZFNMZzM2Uk1kUnQ0UVBUTXcrYUV3ZFp0TU9yYnhkbkVW?=
 =?utf-8?B?RHo0NTgxcDlYYmNPUWg4L1hDTW84NkZ2NVZDZzMwQWRsN0VxZzhRVFArSUhG?=
 =?utf-8?B?anA5aFVncmdpbGFUTE9RTlNtM3V1bkl5RFQ3V1hqeDRJNnNuaGlnVW1rOHB2?=
 =?utf-8?B?MU9sMEtZUXkyQnpkWWg2UmFzUDhxNGR6UTJ4ZXZJTEpaeTRhRnpjdW1uK1Jv?=
 =?utf-8?B?TTNxY1l1WjlYMTFuaktoSXBUem8xWWc5Z2hTbHBOTU8rR3BrT01pMGhPQ3hL?=
 =?utf-8?B?cHdqNTJ1T0l2K25kaHpqTURnMk1yNXUyeSt3WmFFUWZGRDdwRWhTeHRieVZv?=
 =?utf-8?B?bWFGaG00d1dSM2NTRlJqVHFGVWRqb0JIcnhmRzd5SkJVaUVrejVVU2VScWxn?=
 =?utf-8?B?eTFIYWR2QTFBaWk5NWFxMVF1OG9vYVQ3TlV5SjhTODBUdjJud2dRc2VOci91?=
 =?utf-8?B?UUdrelYzRDBBRzJDRGh3RXl5dUVBRnVvc2JoWmMwWFR6SlhNdGtXRnR2UnJN?=
 =?utf-8?B?VUduMTh6UTczcG4yMThCTnlQakxqOUsvbWoxVkRaeGduN0o1Sk5jaERlSnJO?=
 =?utf-8?Q?mAEgX+hEIwPRl0IvFLjRT7TGS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cdfa55-9746-4133-6268-08dc168f16c0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 12:31:39.8628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Y1TezYZ2rSee5Ffbt+yOeqXsGBaTW5ng+cB6WdAfoQzwMujC44tRIPriUjmccZy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9112
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, "peterx@redhat.com" <peterx@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapop
 ort <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 16, 2024 at 06:30:39AM +0000, Christophe Leroy wrote:
> 
> 
> Le 15/01/2024 à 19:37, Jason Gunthorpe a écrit :
> > On Wed, Jan 03, 2024 at 05:14:16PM +0800, peterx@redhat.com wrote:
> >> From: Peter Xu <peterx@redhat.com>
> >>
> >> Hugepd format for GUP is only used in PowerPC with hugetlbfs.  There are
> >> some kernel usage of hugepd (can refer to hugepd_populate_kernel() for
> >> PPC_8XX), however those pages are not candidates for GUP.
> >>
> >> Commit a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
> >> file-backed mappings") added a check to fail gup-fast if there's potential
> >> risk of violating GUP over writeback file systems.  That should never apply
> >> to hugepd.  Considering that hugepd is an old format (and even
> >> software-only), there's no plan to extend hugepd into other file typed
> >> memories that is prone to the same issue.
> > 
> > I didn't dig into the ppc stuff too deeply, but this looks to me like
> > it is the same thing as ARM's contig bits?
> > 
> > ie a chunk of PMD/etc entries are all managed together as though they
> > are a virtual larger entry and we use the hugepte_addr_end() stuff to
> > iterate over each sub entry.
> 
> As far as I understand ARM's contig stuff, hugepd on powerpc is 
> something different.
> 
> hugepd is a page directory dedicated to huge pages, where you have huge 
> pages listed instead of regular pages. For instance, on powerpc 32 with 
> each PGD entries covering 4Mbytes, a regular page table has 1024 PTEs. A 
> hugepd for 512k is a page table with 8 entries.
> 
> And for 8Mbytes entries, the hugepd is a page table with only one entry. 
> And 2 consecutive PGS entries will point to the same hugepd to cover the 
> entire 8Mbytes.

That still sounds alot like the ARM thing - except ARM replicates the
entry, you also said PPC relicates the entry like ARM to get to the
8M?

I guess the difference is in how the table memory is layed out? ARM
marks the size in the same entry that has the physical address so the
entries are self describing and then replicated. It kind of sounds
like PPC is marking the size in prior level and then reconfiguring the
layout of the lower level? Otherwise it surely must do the same
replication to make a radix index work..

If yes, I guess that is the main problem, the mm APIs don't have way
today to convey data from the pgd level to understand how to parse the
pmd level?

> > It seems to me we should see ARM and PPC agree on what the API is for
> > this and then get rid of hugepd by making both use the same page table
> > walker API. Is that too hopeful?
> 
> Can't see the similarity between ARM contig PTE and PPC huge page 
> directories.

Well, they are both variable sized entries.

So if you imagine a pmd_leaf(), pmd_leaf_size() and a pte_leaf_size()
that would return enough information for both.

Jason
