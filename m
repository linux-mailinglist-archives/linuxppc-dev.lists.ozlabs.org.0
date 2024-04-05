Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920989A3FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 20:17:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VHzvvWsn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB6Cq2CrNz3vdf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 05:17:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VHzvvWsn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::701; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB6C21RQMz3dVq
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 05:16:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdt9B1785xflqM8UneTmI37q0sahMuEQdiWB5m/81s/Rm+3MGhfKMGhyEdFhhuzQkmJDZ7CxVXv3g23YWxxoujwNJAWs9wPd7ltzPW5anP1s1/Mkjvk0xAJ8AG4rSdKXL2iDTo3UsA8FVkS2v9Y8wlqhXqHrOuB2lT1dqOO9KCO1E2UZGwW1ivUEdiJBDZCKJ83HHZrYyciwnKxbr0W97tPmJwNSvjLYGDa1nFgbprF427k53/ya0FGBnnoRuyfLbRYmDIKYYS7XJgVf/wmb7UwbMiKOluddungNswkZoKkPg3Id91dzgEmZAYJ2RHpoUbrlupKh00d0XpS8IkFXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NL/KIvxvAV++WeDu1cV5CmNrcO0AJ7LxX7Dumkmbg4=;
 b=f3z/osyfoSFWhFX+xNqJEFoq7eZVex92rf8pDdY/rXJ4nOJFvCcJv1aNpR2VF7tWZIhu8VzDZQAHQcVFjFofykdKDSAPTfNeXU6Rd94Z7JnuiAsOx1UArfOFwMxjV+BJ/HYetwc3PZDzlOkDGsEe2Th3aWWRdRf91XZG4IiaMhsJ+I30YpVW3Meyc6gstJnAmbSAxG/ZJmqQ+F14hsLJ1vWLvU228U4txgi9coonRm4RZYmJGTrcT0VCQ0SUfefXrj0LQ7/EjWVNM/7kWXRffi5UY/Rp2buwz//ojxAe5/KTrFsudeC/gmnp1Ht9a/jIDKYrS10uushloGH7FcUK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NL/KIvxvAV++WeDu1cV5CmNrcO0AJ7LxX7Dumkmbg4=;
 b=VHzvvWsnAWum7AL2cx/98WHqjEtZCgf0av4TUO05PHkfnTUe2Ska/W8umFjZARYbYWKCdEMi7kDbtUuBBY/oQI8SqWMVCQX+1HS7MHvqfdEqNLdWTG05OEhaqwRKU0oUsyDFbnd04oP+LvCciPRovC/Wp0wZy6lQEvnfJR/hg+HL4LETcHcs0bPbgLvbFvNP+32uLW3tvVwqYOTElyo1HtfQ+ITfw+o1OH+zgy6s9MtE3d9iT+1s+Fs2Au9eFdxOx51xTQwsAltWYKXqSgwdG+oF0lmmrVR0Ib10DUqTLAjbKALtYjlOuZlfO+Q7ko2S33QWOyryIP0aDn9Doqd6Zw==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SA3PR12MB7831.namprd12.prod.outlook.com (2603:10b6:806:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 18:16:34 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 18:16:34 +0000
Date: Fri, 5 Apr 2024 15:16:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <20240405181633.GH5383@nvidia.com>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
 <Zg8gEyE4o_VJsTmx@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg8gEyE4o_VJsTmx@x1n>
X-ClientProxiedBy: BL1PR13CA0358.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::33) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SA3PR12MB7831:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yljun5jxC6+bMauIhUrHuM3mpOo3fH2aaqlY+KB+Un20/tVjDiX0P5MAWqdnK1wqRgBDtgP/UfNEeU+3/cheVL/DRY18NENb3YWDRQOpj6lMpxLxRsZx0sZlxNMTNm5bgk3mq5vbFoU0jTqUE/+IB9APhCS+4WlqbPqynQUC2jtl77629Q2jGmkVZ0a2CFWE+DMkii/EAoyJUGGZqAyaA2U0oxNMJsmkLm6xZ+OAAPjQ7SRFLpdZY1Zb8E/FBp/HbpZaGfOHYp42/M68LCJv05yW1bkVGsmiCjPe4Yc1DPpcwLqtQUXQSCN0fiNT6io8ljFpgaYtRSEzlq8/GWD+eYNBqLFMV8M2hB4GacDgjwSN3udV6iXjC7X95/8pyVCWHDuXB0rUcnptM18O419hoNrhmromrTL8WXLVFISjqGy+JeZCzBALnQJUyHEViAjKgXNqYZixFhQVLz78t+TwEWbJQFH5EzPLxg8GJwdqABpsT6RaRJ9GjMAbsaahYxFbaUeWaTeikR5EKEtwJv4sMN+OAeacZavNup0VWXPBjqmsUgiAczuXwsa2icNfF0OhVUUi6zP9cIcNMkQqgKLRKHzm21SuHJTdBj6E2NTu31WT3h5eTCZxAxJH8LI49e9ViOYH3ca2nw65WVKD16vtWnaiU411olpl7I0P3i7vFeU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Dprj84UPiOHIf0k82+m2bA+qbgU1qsrRoZEpdjDdzIfYTRv+pW7LoXaF/N7c?=
 =?us-ascii?Q?GAJiWpyqwNE+Pf1KwlNWeU+60JtY7mLj+vCRuUsCl6ZtK/Dqjp1hHU1ePsN4?=
 =?us-ascii?Q?l5JSCWbRRzlXipY3AaKT/1Zl9jPMWs6N3gmms0lLWpLGnMBT6qtZERRU0mZw?=
 =?us-ascii?Q?96K5M42ty1axc4nE+wrIUp615mcV1WTZCZSPpZf2/foa+yTRh7dkNxB0SQr6?=
 =?us-ascii?Q?KVoyOyEufNNU2IWuEKJpQk3+/msFSv4hq5T4fbhBk9/5tu/FGF1uW3Si7Yez?=
 =?us-ascii?Q?nu6BAzmqyGu/X5PsnzFpDiRs+Zi/FSSKrxYcQSe5gCop+BMTQjX814Pk9C4j?=
 =?us-ascii?Q?+gq8FZ3AwZucl9yhZxd4qw6LUy/LuZIlHXOBLJGihO93ZA3ohcBaLywq20uW?=
 =?us-ascii?Q?vmzgmsN4siZw9f1JGtRJ/BWYg2LaB/HRkAlOtZXpB797T9dfelHEdzcd9csG?=
 =?us-ascii?Q?kvC4Dtb+mE2MyfHB+ZXayFXT2Mrs2qjlMCkmVQap3gcSQosOTwIThjFuIYxq?=
 =?us-ascii?Q?oGbQvc2oek6ZCgHx+mvIwjPDOG1GTQ91dci5J9SlRPX6WaY7hu6X6R8B5QAJ?=
 =?us-ascii?Q?ZuFScyBLtR9JqDAYTidYpVBlm2rubBeNxcdP4qsC8wsuI+NNUA5O4reO5CdD?=
 =?us-ascii?Q?ixikDVlurZSDkp9ZJ3KZakDtroy/NY5vtBMDGK/bdbfY6n9j0e5GUH6Mv9Uo?=
 =?us-ascii?Q?mc7DpIFKbFhYE5oShqxI2lRkezcJmQ6JZfrAMN1DsszHKUEh8skKfdG0Be3l?=
 =?us-ascii?Q?x4li06zEubxY6CSnUKnIuac/QIKXX/0SQyTIbkciFonb9cl31DUMf+RQABOq?=
 =?us-ascii?Q?TXAzJ8l4tHjVKWpa5aKFq7sStyF5UOwTO4fHOwI4d6tCcjkn/Ki8zAcmxMWs?=
 =?us-ascii?Q?kuGlGH9DfMbpVW6KHt5bzEieGPffZy6BRVGqIOt7pmYjwwF3V0hohR+WnqCU?=
 =?us-ascii?Q?E7zSy+z1mThrbmP2abBvfEd5F2S3okuYNk6qottAN65bgQr66eVti6/mA6Zn?=
 =?us-ascii?Q?Exlm038siVBSRCrfBRa0BALgJ5/5ruV/1qXWooe6vBr8dmpSox939cFkXVVF?=
 =?us-ascii?Q?+WoTwPqGC2kD6aPcywVLZhDBuUFrzQAfwp03mKnDDqJznl/n/fJ3JputTr2K?=
 =?us-ascii?Q?PWhF7x5lKAVtesZXUdqQy2kp/izhrwsrkyuYNBSXb4IDfb1A7k+Vmiwix+t1?=
 =?us-ascii?Q?3DQ86id61o7uGrmgwnSpnHh+L2K+fb/mm5LJQcmjrHIlul/b9N6yyOFj+jqw?=
 =?us-ascii?Q?0o7Qeey+KzVG2UsakWevu7BJeLLRmmTnJSfTm8AD11zMOAWE8WELDljNUH1P?=
 =?us-ascii?Q?S2H/vEfXv+YZnKF43HSsqGuEMWfXucUYOzzd8TPrMMnRbBVmOJgApPfS1Ev6?=
 =?us-ascii?Q?S4oFSiP+lELPp9s2ZOO3Iv+rKIoMD/S0XQFlU0FDwCJxfDd6Ab6766d3JTlA?=
 =?us-ascii?Q?tmcQqj9/upc/JQ9hi7tbsVW6y2isckMqdUGrCPJ90UqbeudD1iMGwmSiYovW?=
 =?us-ascii?Q?cGqnz86x/7c4cs40SGM1CSfIPSBI4s6ff4KxUSPaMUvZ3xgz0sgkmXGfNt/m?=
 =?us-ascii?Q?6iEjQSEgE78mRyj9KN3Go7x1UvIvBdIkLOXfiFK7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cbcf67-69a9-4c94-f0a2-08dc559c86b1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 18:16:34.4601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgYvKRlYuSGWNegSxgNgI+MfCtxmNafRohpyYhPJoWvsVF5U0AE6UyRNZyZ6O7BN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7831
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

On Thu, Apr 04, 2024 at 05:48:03PM -0400, Peter Xu wrote:
> On Tue, Mar 26, 2024 at 11:02:52AM -0300, Jason Gunthorpe wrote:
> > The more I look at this the more I think we need to get to Matthew's
> > idea of having some kind of generic page table API that is not tightly
> > tied to level. Replacing the hugetlb trick of 'everything is a PTE'
> > with 5 special cases in every place seems just horrible.
> > 
> >    struct mm_walk_ops {
> >        int (*leaf_entry)(struct mm_walk_state *state, struct mm_walk *walk);
> >    }
> > 
> > And many cases really want something like:
> >    struct mm_walk_state state;
> > 
> >    if (!mm_walk_seek_leaf(state, mm, address))
> >           goto no_present
> >    if (mm_walk_is_write(state)) ..
> > 
> > And detailed walking:
> >    for_each_pt_leaf(state, mm, address) {
> >        if (mm_walk_is_write(state)) ..
> >    }
> > 
> > Replacing it with a mm_walk_state that retains the level or otherwise
> > to allow decoding any entry composes a lot better. Forced Loop
> > unrolling can get back to the current code gen in alot of places.
> > 
> > It also makes the power stuff a bit nicer as the mm_walk_state could
> > automatically retain back pointers to the higher levels in the state
> > struct too...
> > 
> > The puzzle is how to do it and still get reasonable efficient codegen,
> > many operations are going to end up switching on some state->level to
> > know how to decode the entry.
> 
> These discussions are definitely constructive, thanks Jason.  Very helpful.
> 
> I thought about this last week but got interrupted.  It does make sense to
> me; it looks pretty generic and it is flexible enough as a top design.  At
> least that's what I thought.

Yeah, exactly..

> However now when I rethink about it, and look more into the code when I got
> the chance, it turns out this will be a major rewrite of mostly every
> walkers..  

Indeed, it is why it may not be reasonable.

> Consider that what we (or.. I) want to teach the pXd layers are two things
> right now: (1) hugetlb mappings (2) MMIO (PFN) mappings.  That mostly
> shares the generic concept when working on the mm walkers no matter which
> way to go, just different treatment on different type of mem.  (2) is on
> top of current code and new stuff, while (1) is a refactoring to drop
> hugetlb_entry() hook point as the goal.

Right, I view this as a two pronged attack

One one front you teach the generic pXX_* macros to process huge pages
and push that around to the performance walkers like GUP

On another front you want to replace use of the hugepte with the new
walkers.

The challenge with the hugepte code is that it is all structured to
assume one API that works at all levels and that may be a hard fit to
replace with pXX_* functions.

The places that are easy to switch from hugetlb to pXX_* may as well
do so.

Other places maybe need a hugetlb replacement that has a similar
abstraction level of pointing to any page table level.

I think if you do the easy places for pXX conversion you will have a
good idea about what is needed for the hard places.

> Now the important question I'm asking myself is: do we really need huge p4d
> or even bigger?

Do we need huge p4d support with folios? Probably not..

huge p4d support for pfnmap, eg in VFIO. Yes I think that is possibly
interesting - but I wouldn't ask anyone to do the work :)

But then again we come back to power and its big list of page sizes
and variety :( Looks like some there have huge sizes at the pgd level
at least.

> So, can we over-engineer too much if we go the generic route now?

Yes we can, and it will probably be slow as well. The pXX macros are
the most efficient if code can be adapted to use them.

> Considering that we already have most of pmd/pud entries around in the mm
> walker ops.

Yeah, so you add pgd and maybe p4d and then we can don't need any
generic thing. If it is easy it would be nice.

Jason
