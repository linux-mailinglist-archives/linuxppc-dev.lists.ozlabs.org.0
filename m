Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79133887070
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:10:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LNloP9nK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1S2w201nz3vcN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 03:10:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LNloP9nK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::600; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1S274tNvz3vYr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 03:09:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKuJ0drbZ5V98OAmHlF2UdZg7AK7KAZW7U/s00ueUqs+j5oe4O0vF9gPx0EGn+DgJLHPLceQdPGPRs0zUyexSynDT4X+r1/aikZ+pnpx1lZ7Wfpjl61bpAR41MnVWNqC3z7qbkMdRnC/2T1vs+6eqo4r0aV2iGrSnwifezamA2EcFRp5xmCObJpKBe4oBF7/C9ofMYPKJZ7n+fDIrMte56+fhXpsknAUqDwtku0VGIjio6F2BKkhk+C1oCxq8yeSZYsyIkKb59axloFBiMdI/AmnwVKak7iqTTm0pC64rV1+zWPSOg5BctDPmOgl/UkLEc/lcthgDQ2KG2CXDC8QIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to4vDh8hHG4F0VwwxIF5cVd2i4GgYypb3KW+ICTklEk=;
 b=TbnYzIBfhoSVsR3ed/1xolquC42Z73VoGyrQpZ6Rd+UkSKgJHx/CXRFr4ltZYpySngvU8pk17Z1+ScJDK/a8psmDwEoGzP4q+eGr9e+OBOn9KrpLu0XqYeR10C81y/s8hlGqdNTy+NlDPMViLBnyF7VVc8h3aed9jtXb0S2K1kcj6QFZbS5boOQILihLnIgJfpeqTCZoO8Sny6FsakZYesCD734l1xABKT6VccthziOfeew3pX3KD/XoLFk1jg5BViNep3jbWjWQq//J4y/0GF2nWIcPbNf9Q7eQmJxyZ+RhxDhWRNQI/NKvf6gjd19bEA30uEB3+NdDrwzLVwUFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to4vDh8hHG4F0VwwxIF5cVd2i4GgYypb3KW+ICTklEk=;
 b=LNloP9nKOyT2udTa3boprHWeJMHNLEt4qDHMGsMVB6rq5OSwjRrQweomfl4ZvpKvFsfHXKBm7+3Cn9qE9W41hlN8pQe0ax6UcOZvURmfy2/XVaaqLcZ3ZBdxMaSpigGQ0jYEVcSHcnyCicHUyZsa63iCLrUmpg2PHJyWQiG9hPaGmHK75AOUZpxuSmsIbDzDP3TYqYjY8o/RdKX/4QdoXwn9x5gTVbD4oE2ywBrwigPeSYcoQILoF6BtF34s7H+l1WNXeLhjwS3JP/QzBUWzAnsAyLKC7HGQzbq8CUVgnCn20ECGfGLkIu3ePY8CtaVw04IUPhURTVD19CZdhgCd7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SA3PR12MB9227.namprd12.prod.outlook.com (2603:10b6:806:398::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 16:08:49 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7386.030; Fri, 22 Mar 2024
 16:08:48 +0000
Date: Fri, 22 Mar 2024 13:08:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <20240322160847.GA2924038@nvidia.com>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-13-peterx@redhat.com>
 <20240322133012.GI159172@nvidia.com>
 <Zf2p38Pb51T3e9uB@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zf2p38Pb51T3e9uB@x1n>
X-ClientProxiedBy: BLAPR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:208:32e::19) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SA3PR12MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: b05142a0-7586-45b3-fd44-08dc4a8a5ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4bJqTf9l4w3olSzf9klt/B+H+Xfg82jIQ8w/61krpSMitw4yO79IeUAglya9523kyJt25la6PXVTADXxL4oOjecRS6uzJ7P6XcwWZ4mi4Eo32BdP5HP30rIOE2n6sEeATppBQUGnzOOZhHdNJNRyz0kTgD7IABo6aHqNkKpm515HITFhPgEqc8YFhnu82mOd2In1CaYBN+kiGlabpEaRaf23QSFbIy0A/dS1mOL27e2i1c8S00somKG60yb2x3Axm9h4u637oWkDcngOdHR9bU3l6VKZMTKn5Fk5WkXr9sS7ZlP8Ico866wrvcxwtW19HgG0XTWSz+BgDM1gqQSz0iZoufMm9i05m28rq8xHg/+IAkMt7fyk1955x4MOdhDrOXOP+gBODTVHBrpsEf6ITSm1Dq4OMYmD1gORHrf2ibzazV8AwcuGd+UsL9PC6Z/tr7AGje99T4ntq90/ygTZ049ES4pmS8bjPishmy8DPgGrIl24youpA0NXPZxjNpQgoQRMnrFYV5lrZmhQlkMnJPOhlxs7nhCVlXGBH94P4XoRHcYwq4d63JgfkqOK764dpb3oH9WSPG/rL7zuJnlYxlaUPb3Xc0Qll1yG6xjLljDpVP/hWy4g6ltP6jF5l2aEMdM/yucn2W/V2kPrK/WRIYi5QWCNa4XjTP7p62EV2D8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lDB+CmGubtSge/esh8S0fKtCmtmw3VR5RC35UGipC2foWHUx67PpofwtAuOC?=
 =?us-ascii?Q?fu2ef856v/0O/qTIHvZWsVm5jXrTqJq44SC/YosnJomnq4UtvCIwSs4/8ToH?=
 =?us-ascii?Q?QH6qe0uVJircXdcR0EJ6i2+6tuK8PLyP+ZeSH1iJqvQvTFqjLDGCc/pEhSvr?=
 =?us-ascii?Q?EU36HGooh9KPBRDfHGhs08X8x7lzAzQ5TmbDOtIr4ymfTh397oA65nmPdOsl?=
 =?us-ascii?Q?BxEqLQ3U6IafDYxMyHNbtEHxR9P2oqa2YbaLymp6NAKXh1j+LPqGO2y0D4ix?=
 =?us-ascii?Q?6mRlerky9szFOf5bQHgacsVyOAe9LDvsnbrs2X34pCovc/3nDijlPj+aB0oC?=
 =?us-ascii?Q?TylvZjF4MzNDY21j+5YPtpmass8D0OiPUvTAHAqHFzjF9S07PWxZ2Ha7C4zQ?=
 =?us-ascii?Q?Xp7CKuzfaoAfSTlOEn2AyLffOUTJylZvimjzxK+AOxaECPkDOsOMgJ2/lPy5?=
 =?us-ascii?Q?HqSfbaxc6P5REGaGG7a0LhnUZ6n6PxRyv9EuD0NdSQyinBGVksZ5aLrJ+hvb?=
 =?us-ascii?Q?3De2RLk3od4NIOvAhQgGQ8Gmdg2i1EBs68NGDepsglgMSmlfFi8Ukr22qMI/?=
 =?us-ascii?Q?gAlkW0ekbxFiThSjeXlPaoUbn0fFHtj2CTuUH7xFGd0oVX2gj2lR6dThY+9H?=
 =?us-ascii?Q?OuxOtC5qY5vuIF4Av6egJnYihkos4vOUCoegDxNTs/M4/mhvjCf2jN10htxd?=
 =?us-ascii?Q?18LauCnS/p8IE8przQcnM9Il5lN+eohXiod0YoFztG+szdW2Q3blO4V86/Ok?=
 =?us-ascii?Q?0KlkFxwW33HgHuGLJ17CI9lNdrRFRbi/E8o0zHYUpJ2KH5trKz+1NiZQUR+7?=
 =?us-ascii?Q?ylQUY50lPCSjKC8/A55XlmBMr6jo6BQghoKl9L9+rJrIoEjuERuWmKbDkuiY?=
 =?us-ascii?Q?TA0btI13wgcinMNSuSbGEL8Yv/MYKIr4sEtargovZDTQcFJg5IyBIyUfTXTB?=
 =?us-ascii?Q?m6QDkJRGO96JwfjuNQDkPbv7HxKC28JaR2AL33N2Fo1a7CszdpR3LcFKw1VB?=
 =?us-ascii?Q?9hSZPiL5F+QRazwFqBeERm+aU+/q2pfPVmIw5UzvyVm+ql/5/yFfxS0PxPH/?=
 =?us-ascii?Q?bykrJRdRr5oUJs6kDSr7xJQYjmqt5GVzU5gx9DgZ1/lRplW7hmuq78KSk4pa?=
 =?us-ascii?Q?zJhV68KYnO31+mwaZGthNwsWSjEo048kJXLZmxLb5i7bcWdqBMK6Ef91vZvJ?=
 =?us-ascii?Q?+tYgrlv8aBaD09l74S2QiYr86KX47/7GmP4I+3X0VEdR75LLCcUnGMfU4pSE?=
 =?us-ascii?Q?a82I73E91p1IRkrapmV3BfddOLNuKm3chmT480LMrvz9+/TIYk0aKkxbACnK?=
 =?us-ascii?Q?oOCyLl6MJWYYWIlAIew19IHYQgxwxw7/vaGi9D6A+ztcJ19eaJr1wP7AgMr3?=
 =?us-ascii?Q?bN9E4NdV21w5QfOpx40NZeMEZ4xdu/iuucDeNuPSLfWGcjtGTEmHSu8biPHF?=
 =?us-ascii?Q?lYaPm2EQZBOERavzTVvJCJTfWu5M/tC8rHMUc56cLWrqF0IngMr7yraHsv9E?=
 =?us-ascii?Q?TGDqzULLoj3WGO8heA+X/nw4u2xx2Yqlh2fAaX1YoIyWPyjQuvMhfCtceLlL?=
 =?us-ascii?Q?FUqIws04rLfjPKj2yEJ3QWNCM2eytNmltKL0f+nI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05142a0-7586-45b3-fd44-08dc4a8a5ba9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 16:08:48.4980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duTUVj9cQmqFePdlBnw3+QZgP0dbqux/FBaU1J8Xnpw14pKpFQMMlDaox40QKUTu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9227
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 11:55:11AM -0400, Peter Xu wrote:
> Jason,
> 
> On Fri, Mar 22, 2024 at 10:30:12AM -0300, Jason Gunthorpe wrote:
> > On Thu, Mar 21, 2024 at 06:08:02PM -0400, peterx@redhat.com wrote:
> > 
> > > A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> > > a tight loop of slow gup after the path switched.  That shouldn't be a
> > > problem because slow-gup should not be a hot path for GUP in general: when
> > > page is commonly present, fast-gup will already succeed, while when the
> > > page is indeed missing and require a follow up page fault, the slow gup
> > > degrade will probably buried in the fault paths anyway.  It also explains
> > > why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> > > accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> > > a performance analysis but a side benefit.  If the performance will be a
> > > concern, we can consider handle CONT_PTE in follow_page().
> > 
> > I think this is probably fine for the moment, at least for this
> > series, as CONT_PTE is still very new.
> > 
> > But it will need to be optimized. "slow" GUP is the only GUP that is
> > used by FOLL_LONGTERM and it still needs to be optimized because you
> > can't assume a FOLL_LONGTERM user will be hitting the really slow
> > fault path. There are enough important cases where it is just reading
> > already populted page tables, and these days, often with large folios.
> 
> Ah, I thought FOLL_LONGTERM should work in most cases for fast-gup,
> especially for hugetlb, but maybe I missed something?  

Ah, no this is my bad memory, there was a time where that was true,
but it is not the case now. Oh, it is a really bad memory because it
seems I removed parts of it :)

> I do see that devmap skips fast-gup for LONGTERM, we also have that
> writeback issue but none of those that I can find applies to
> hugetlb.  This might be a problem indeed if we have hugetlb cont_pte
> pages that will constantly fallback to slow gup.

Right, DAX would be the main use case I can think of. Today the
intersection of DAX and contig PTE is non-existant so lets not worry.

> OTOH, I also agree with you that such batching would be nice to have for
> slow-gup, likely devmap or many fs (exclude shmem/hugetlb) file mappings
> can at least benefit from it due to above.  But then that'll be a more
> generic issue to solve, IOW, we still don't do that for !hugetlb cont_pte
> large folios, before or after this series.

Right, improving contig pte is going to be a process and eventually it
will make sense to optimize this regardless of hugetlbfs

Jason
