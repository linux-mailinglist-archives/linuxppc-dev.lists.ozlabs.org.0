Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A18830703
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 14:23:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eD5lBEHg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFRRG06Bpz3cVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 00:23:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eD5lBEHg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFRQR4bccz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 00:23:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7vhKpEuk0DjDt3OxPd0y49HNoCbXQqFONNq/CYj4VHavEtYCJo7pH7NEn4LkOsoWTz9exrAHXKQ0kj7qi7/hFX8Z5FA6cfsIKsaPgCaPKo+bA7MiRH0PXn0riRwDPxzB2IkSDF8IhmNr6OX+gkR1A/+1rConzzH6GMQdckFtm7+2zER7IQuDgzYyqe/rwzQFICkh8O3OLb8/lGcVmU2AiGDKaduPNaRXe2xWA/hPqWZUEDquAefhAmcee7cCzoNSUZFwPIorBEJmY7ZED7eZ9Tk0bamZNG0OaXbfc7MvvA83biWeDnY/6DibFetcEfA7mURZniziXs7WhrH01+8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDyT/81PxUDeA4M5way5h+eZdkx3wiZ6qwptclWV8OU=;
 b=FfkhxupVUyrtw930NcpS0OsOOoHcTaXzhluLofEjoWDTdeta9aLyEWRVhK1k7Mp1y2/Qc7IhtmfTiiiBEA709xFcxZsGaVioJraoH9lkt6Qf8tyrkZsqkALgodnJ+qvOgMoVVpvjQq7U+IhpvaCfuk/pf9R1tH/daXn2EuApWDofNHXv3HVS7bWxHIy0NZvPjWaH+Db28N1GA7yD3L08Js0TSFjxZYYNYGPK5cZn1iCnz+BSQCh3KKRlM17+22EIYkKKAMXTWOrPeNotptq660e83XOpCEWQTF1ka/xzfGs0YAEZgSeU+lluarmBmfKEKpgvc8eL6Hvx0xtauN5KyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDyT/81PxUDeA4M5way5h+eZdkx3wiZ6qwptclWV8OU=;
 b=eD5lBEHgcWuIXxm543H1cTe99gMiWfp6x9+Ex5Kd32okh30PLeDQbl8mhdeOx1HgM6xh0FF5jDz0ICoFWNtb83rtU5MUyPFddmtfa5MOST2BHicsMhAukysrQ3JEchG64bA/PxaIJRU6qEVYhvt/upNjMkXUaECcp9refeLF+2XhJP9CGv4rWXBb07k8T2bbhYBkUUc8WKpYltfPfDXPZgbK2IHIdvxCYnkrHLKGgCUoqbw8tjXgDQ9H+fnbJnupFvkOzMA4YKr/8BD+7B90mKhFNOPcga2SDfCou8yJB1BXEjA0F4ldDQWM22irrkXLfiDANNEZcuSY9vGQgU+UlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 13:22:45 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Wed, 17 Jan 2024
 13:22:44 +0000
Date: Wed, 17 Jan 2024 09:22:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Message-ID: <20240117132243.GG734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-7-peterx@redhat.com>
 <20240115183748.GR734935@nvidia.com>
 <c60c9d88-33aa-4312-a23c-20206e503b6e@csgroup.eu>
 <20240116123138.GZ734935@nvidia.com>
 <44e450cb-5d3f-407e-97a3-024eb936f74b@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44e450cb-5d3f-407e-97a3-024eb936f74b@csgroup.eu>
X-ClientProxiedBy: BL1PR13CA0268.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: a90389c4-06a8-435f-bdd5-08dc175f63db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4RUtPfwdiREM5biYnZTmJsx0ACNp3OKAqnHVEG4+VXWqWm+NgE/AtHbw0z4FBjTqIkCXuhHRFLlGKm8IEc3Z7Ey35oRTx0ECkU5g12t2Ro1XJj4FUj1/GOYJs8py9vqsNY52GAf4kQIUPHVy7DZXf2VFD7F0depxqmIFIzgU6l9gybk/uswdIKU7Zd8y7f50VDSw694lQUjJnpDqAskzA5CKfiKct3sN5KAXbZVKJ9ltCKQT0tSO9oQzsEvicZ41f0k8pVW1UFW7bOA5ZhhbrhgTrRyFThb7vyEkHSzsx3Wz4joBfz7JqA5vqGTL7T4vh2NA4DvZQ/6Bs5Xgc1sPlNWeivgo/cHQH7HGyh5dsBAs3wCLg2FgJ8ypms+wydyN3Vrg0vyEVcK2g7Cah+pXebP4OtutYGwceKnpU/aaPaqrDHpGstf1z4EPrJpTR4uYPJUl8I85QkfX8y1dYjN7BLf+hWlL0K2loUCKyh1/Bb1xPKZyJ8g9g4jB9OQJYaBIWyKizEHkmH72VwaDUydjsIux38tE4x77mkRwPvDxAl6aisRYYiJkPiiFToEJp8bL4DH+54QaU6ADoSzDKBXgF8A+viNivp4VuVfwCuWCTZ/vybHFqPPZQQvUCU0AoLv+cUSUzOgwycguaOF+GWDY6/vX2gMF7vWdLWTjC0yKrvMXFlsU6vY62GxcOUehCVu2
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(5660300002)(2906002)(41300700001)(36756003)(38100700002)(86362001)(33656002)(7416002)(6486002)(966005)(54906003)(6512007)(2616005)(66946007)(110136005)(316002)(66476007)(478600001)(6506007)(66556008)(83380400001)(4326008)(8676002)(8936002)(1076003)(26005)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UKoIFMwIgo+UP7YkCIUpJly78vCqIGGehMSOnenDhHo9xvv60z5FvHyRuyLg?=
 =?us-ascii?Q?uHqPA67mf1TDwygj+ayP55jpqpmFdhCv8VI6pPwDM4GuwuSAb0laEi10hPPC?=
 =?us-ascii?Q?batia6+j//Wl5HtR8yxc32miN2LpnzYn8EzT9x2jXe0TWiXl4eQp9ZXqg9dW?=
 =?us-ascii?Q?o5gC2i05Rf1HPwP8M5j4eNvGiQDmYtBR2Se6i0L77YHom4MsmV+B6NHkP4kc?=
 =?us-ascii?Q?AAuUvT+Z95VCfaHM3WwCIzEEIKZfp7slujsD6iDccCWXr5kJPZgguMamI3qC?=
 =?us-ascii?Q?2QajsFnpbEjGazpMLcKaZHFRKvynBc0+cY/PV6LMbzkD/iHCELC07TztNxjY?=
 =?us-ascii?Q?YDrybwwqo7DzN58FKLKghN7Z9BnzRxAmIs8tkgXz+YYshm9o6h4uq8GOORxZ?=
 =?us-ascii?Q?D7v4f88dxvKCleB3Cxo1jZvqZtawQcpJAHlmD5Yc3zD7L46gOeVlHJkiXPbK?=
 =?us-ascii?Q?D3UKK/XK+eclMeLAzDA6WbZ4ypbIPAQKNvYMyPKCT2hHT6WvSP4mIIkT1w1F?=
 =?us-ascii?Q?F0U4Vd0ZlOCsjkBBZnKZnb0XwRTSXY7yWnoMhbv3g1vq8tpgscI391PMsdab?=
 =?us-ascii?Q?x+kH5jJJlxT5uqByKMgDKk1JPeQuuBZCSx+34H+Skm9reES2tiB/LGKXlrf5?=
 =?us-ascii?Q?bEaM1HstDiu+GPxfN8t+P303I4Ty8nMK7Axcn6g6NCDaEx5v1L1NfLRSk/Gc?=
 =?us-ascii?Q?P23hqXHSTh517xlf3MB0rzIjXdQDNta7jWNS1L1izNb1Xd7e88YY+403v7zx?=
 =?us-ascii?Q?tCqMa5LTK/B2V2d9o6OtP2gaZG2VTIbH1EiQ/TME2zp7TfDCOBi9WS+HTB6K?=
 =?us-ascii?Q?+itNLJQWgtTCVyPaYsyZexsD8mKXy/WVZZGrmszFkxCd0siSs1q5i53rgwCY?=
 =?us-ascii?Q?nZb8XyjO49GgthVWBSNhz9xSkZsZ/mhXLeQgxsocFLlchYRlYf0U8PVc5Hc2?=
 =?us-ascii?Q?B7wNFA6J2nwtg8mQf7ORorj4bN+T8JiQ1o7mVKJ+XrXPrIp05g7BaMZxGWjj?=
 =?us-ascii?Q?jXcREvSWROFWCdoeh6wx86N+AuCDCN0KKB+gD8KgO2l3hpeyKrOtog1zZ8eP?=
 =?us-ascii?Q?/JricatpSrCtMNE98BvsWUX2BiqXeteeQi2GZR1JzsKsygCalWTgpNi48gaK?=
 =?us-ascii?Q?QFTuXDHabTDyzNfwbo1BroVpxMHZw1b+1PhQ+6CnxS2S2xXrBWFtPQBbew7T?=
 =?us-ascii?Q?rgijQRgTVd0rF8W9686GLw+Cuvw5SOxKnra9Mf0E17mrXRyxTColzFkPeb1F?=
 =?us-ascii?Q?MnudxA7zpNtCQn6+1vYYdjBQ/jNDNU/yY8SgVfWMpKwFzOA1wt52BoAq0KVf?=
 =?us-ascii?Q?GNb2SAhY43kCqmdrHE8QIu0e7KOOfcHesuKrClRB7mmHkUgw7OtFaF+cKZq2?=
 =?us-ascii?Q?zXs94xWwRCSK1QgWuKDZ55WqXH+l2h+6ETJYqz0lRnLAvyhIq0QYchCwadpt?=
 =?us-ascii?Q?OHe2UaH7TO1VH/fi6nptLusm0ZQL/savXJgpZZoDzMCV21LyvUMf6IQ22fUc?=
 =?us-ascii?Q?cYXbmitxRp5efeL0gbfH+VbSjw5xmmnaaQYO+x+xWGpqehokSuOEiJ8xs7wI?=
 =?us-ascii?Q?MyKZ9mEg6fWhtTtn3xaEh5TyrmdECxwdOfSB02ix?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90389c4-06a8-435f-bdd5-08dc175f63db
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 13:22:44.5643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuRr4k9IImmVkC4BHJkkI+6OMg5e5p1r5rksakFXdof9PPb19nQO7yfpICDwcwtl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8285
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

On Tue, Jan 16, 2024 at 06:32:32PM +0000, Christophe Leroy wrote:
> >> hugepd is a page directory dedicated to huge pages, where you have huge
> >> pages listed instead of regular pages. For instance, on powerpc 32 with
> >> each PGD entries covering 4Mbytes, a regular page table has 1024 PTEs. A
> >> hugepd for 512k is a page table with 8 entries.
> >>
> >> And for 8Mbytes entries, the hugepd is a page table with only one entry.
> >> And 2 consecutive PGS entries will point to the same hugepd to cover the
> >> entire 8Mbytes.
> > 
> > That still sounds alot like the ARM thing - except ARM replicates the
> > entry, you also said PPC relicates the entry like ARM to get to the
> > 8M?
> 
> Is it like ARM ? Not sure. The PTE is not in the PGD it must be in a L2 
> directory, even for 8M.

Your diagram looks almost exactly like ARM to me.

The key thing is that the address for the L2 Table is *always* formed as:

   L2 Table Base << 12 + L2 Index << 2 + 00

Then the L2 Descriptor must contains bits indicating the page
size. The L2 Descriptor is replicated to every 4k entry that the page
size covers.

The only difference I see is the 8M case which has a page size greater
than a single L1 entry.

> Yes that's how it works on powerpc. For 8xx we used to do that for both 
> 8M and 512k pages. Now for 512k pages we do kind of like ARM (which 
> means replicating the entry 128 times) as that's needed to allow mixing 
> different page sizes for a given PGD entry.

Right, you want to have granular page sizes or it becomes unusable in
the general case
 
> But for 8M pages that would mean replicating the entry 2048 times. 
> That's a bit too much isn't it ?

Indeed, de-duplicating the L2 Table is a neat optimization.

> > So if you imagine a pmd_leaf(), pmd_leaf_size() and a pte_leaf_size()
> > that would return enough information for both.
> 
> pmd_leaf() ? Unless I'm missing something I can't do leaf at PMD (PGD) 
> level. It must be a two-level process even for pages bigger than a PMD 
> entry.

Right, this is the normal THP/hugetlb situation on x86/etc. It
wouldn't apply here since it seems the HW doesn't have a bit in the L1
descriptor to indicate leaf.

Instead for PPC this hugepd stuff should start to follow Ryan's
generic work for ARM contig:

https://lore.kernel.org/all/20231218105100.172635-1-ryan.roberts@arm.com/

Specifically the arch implementation:

https://lore.kernel.org/linux-mm/20231218105100.172635-15-ryan.roberts@arm.com/

Ie the arch should ultimately wire up the replication and variable
page size bits within its implementation of set_ptes(). set_ptes()s
gets a contiguous run of address and should install it with maximum
use of the variable page sizes. The core code will start to call
set_ptes() in more cases as Ryan gets along his project.

For the purposes of GUP, where are are today and where we are going,
it would be much better to not have a special PPC specific "hugepd"
parser. Just process each of the 4k replicates one by one like ARM is
starting with.

The arch would still have to return the correct page address from
pte_phys() which I think Ryan is doing by having the replicates encode
the full 4k based address in each entry. The HW will ignore those low
bits and pte_phys() then works properly. This would work for PPC as
well, excluding the 8M optimization.

Going forward I'd expect to see some pte_page_size() that returns the
size bits and GUP can have logic to skip reading replicates.

The advantage of all this is that it stops making the feature special
and the work Ryan is doing to generically push larger folios into
set_ptes will become usable on these PPC platforms as well. And we can
kill the PPC specific hugepd.

Jason
