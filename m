Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 174AD88C45A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 15:04:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gbiwtsnv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3s3j6JNmz3vbX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 01:04:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gbiwtsnv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::700; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3s2x1PkNz3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 01:03:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cixS7WWen8h09l24yjy75oUBX9FgBUyaukkXaSM68sEJToQBQSDlFjxcJdxpgcc6w5uj/fS+0YdFUI8ENjqX20sMPV40gEIx1IQG68i0QqMXwROiib6AreRzTa+I2Lr4rTeIe8mORa9abOIou+DJMQK/ue3CsADMcelzgdkWBfo3tUQQq7vwJweeqOICh0aBQYLDShs5W0J7HLL7GbTWQuw7e4LSK3PKUHxUwMlV7rHuO7cUQm711dXBeqOcbc0rVbmRVDmcq9mX+z9PCMZLTZJZfT8+zx4KAFbRcfEvxDubxeWqc6OakLgN83sIKbvl8iVMbCka934QadGp8fSlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1TBTpNqsHYSkKcMoenf+IHxaqsv5TIjbk94zSjyQ/g=;
 b=n3duTWCyhJb3y4mji6o5N6je/o8JTnJfAyaWdO0vr8G1QHg2i2DtlIKulR0yJa8wpA6pVFov5O+PZY2qhBdFWAmFL/6FXuABRK+zRhAFauIddW9dQPknlHAgtgsoAW3+pBa71YKkstya+5IMRXu2R1KRPA/NSW0v7V1dHdoUXy0gmTu9TkadWDnsxmYecpThehk2gEoq+ZtyvqsdLtJLujgtNbPZjH6OLtOjGGfMEebitNbrjlADsz6UxzW8wccEurvZk5ONsRqAMwC3kZMHfzdYlxUICECUg2lHrEJlpRM47rkXQV2cQqOhfwL6Rh2QN8+0vgk/bAFrrHU5QSSudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1TBTpNqsHYSkKcMoenf+IHxaqsv5TIjbk94zSjyQ/g=;
 b=gbiwtsnvbcS+4qxrpc5NgqY5QqDcpbob3eUKddUHqVN+QuGJsC2nSrj2GUqHomrxulN/X4DyhR57xcZmvXhm2+IwFFSsaWjRP1+up02saS+v9u5rzuDWRFuMtlmnTzdinoA7nFPtbqsHcsmifD0jIcFw+dmPNoHwnPPiyyBeCeON/A/EXrJXFAMtKwmJi3UbbzBJG7GzLoNDpXuwrgmh3QWJcjQzvj5STSDsFqR97aGaDF0mauYgOtG/EqXUeRyhZ89J/sBKfn+UitwGTUa4Lfcrw3F/uusQllDwrE9YhO68XrylrJYEZzh7ixUaMhVAcDl+ypEzsP4Hk2QGaiE1mA==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 14:02:54 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 14:02:53 +0000
Date: Tue, 26 Mar 2024 11:02:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <20240326140252.GH6245@nvidia.com>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgHJaJSpoeJVEccN@x1n>
X-ClientProxiedBy: MN2PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:208:e8::23) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|MN0PR12MB6200:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2z/++uZvbciIaPk87VCEhCaFvbfMQ0nExC/Cu93D80vOE5MNY4dH8p83KdJx89gH+OVqzT41HefGFasZbqbPg1nIe1pPl2NURzQIkqFA/ikBpkP30ZiHUOkG+DS4zfOE8pQluG6CFB44jc8NOvXN8A9wFHhPUoKF8D879R1VR/FN/Qkgpsmhk8L+aNJkh6R90sVYxjCZiqIdVX/UWvn2eJc2Uv1SKSDX8XkJ0eWYeUE/hG8tOZAwe5h5eCSR3++Vb6lKxEJfMPokFVXwzKWf8bRdUjaG+SEU/vcI0RXAkLX9PB+YHQCVwXuXyJQBR1hQWXxGKdYu4Dmy+BTzhsjB6P3cHT5ht+ZEmf+S5pAensjOk+XjLfKPP1NGj7FHzMMuA+ndiNyEzfdp+3qxdQImwPn/LzYFD6k5OwX07e054+ZM3+FMw7R4Fvg4k4Ncr1lc1P05p/vq/839BSlBOr4Nxb7Mqk7hl1U/tp9l8JIbvctbbE4XALs/R09fdds3gSLBGDr/Wfky7DX+xPmnqAKrW++uP3I16lgBudLFPgdls0frlUVOYx93uEAkxpSjxDywAc+H8+mvRpE5UPn9+FM48zgxN/xicrEJ/kVWA/+5Ok8dGFyTFJvxZbZckRnToBEiMKmsjsRCnpLz2OROLj4WZOw+0zLXxUgM7uuMJ4kmbNA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?R1RBZSzEcdFftCbqPsPSY1vSXWtsSh92/Squ5OOK309gpoA7yPXlh16rOS/U?=
 =?us-ascii?Q?AZI8bdaIlQ2iCVigk9UbfM6Gc1rtLZSGcS3WHlUtlJ7hQezAda+W4g1P8ZYW?=
 =?us-ascii?Q?iopkKcuvZpZ/IVHZvuDmyl0Sc8Vyz2sHNNZMqTfA2Wfjoq+4L8ZHO/e8ywe9?=
 =?us-ascii?Q?gzmWId1e3W4nTR5IF7y9oCs8BVOM7N901bw/4JryHiVPneElP+biCG9NAvCG?=
 =?us-ascii?Q?/SRii3ODvPpKUJQ6hQwqllBLPnPnKDR2ss6r0pErSs3WYPwwpe9YDb31xuaq?=
 =?us-ascii?Q?PM1m3Nf/JJMAQ5t8pBDIJJ/IYgKe4C2oH3Kurc09USgumivKxhj0W97Ioqi2?=
 =?us-ascii?Q?Kkh+QXHhouFDYrNij5Ao+BSlFM08cMggokiJfgj0hjBSD7NiNmRWP5nz5ft3?=
 =?us-ascii?Q?Zx0jJklYZ6p5bT/axlt2R4XGOUl5544I29HSpe2MUrQ9KjsJlLlG9tswJQJQ?=
 =?us-ascii?Q?Bmu02nufVeuRnucQqbM2LrnkdUZ4O0V7ZjgAQTDCiJP1Z4kBQqD3marM/5dn?=
 =?us-ascii?Q?J9SHQKlYkFfLnEi9Y+tN+dym4lQ5wWgrmMElh+4ekqvlRP5QCevpYGMO4shd?=
 =?us-ascii?Q?7U2V1KnV8R/RDG/PtSXuOS5v3NJQfxbha25jhao1qVB6ozKEE7X8j6xaWFsI?=
 =?us-ascii?Q?hJiChbV3KKmaBviI90K4R/B7LxlHFvxtVHSaGZyDUlWcY0tu4qzHswqs+M1Z?=
 =?us-ascii?Q?OtS0bk2fnRk1Lg6kfWY1g9N+4OEGeDn2s8i43XhBGLNmkEMY3LdaXDmYaLf1?=
 =?us-ascii?Q?47LqaZypV1BRpZCtwSLVEknlIttdHWQZ4W5jA8THlornu165XNKbUe/kCapq?=
 =?us-ascii?Q?JlN/4Y/oH3+hDO13ZvvaXds/v9dvMxfhuyQxJreETbGvvpjrzbU8y5e644f6?=
 =?us-ascii?Q?kcBM2CMbD63ym2+Uo+oZWJme7IT2dMc18Dt228LDG9By6W6CFt4h2yfsRJkP?=
 =?us-ascii?Q?bOHYm86BYgxDnuiyAGxN/TVpeK0mu6oNcOpsobZMKfKDFxoMb5ZrJQhQOMs+?=
 =?us-ascii?Q?rna/4DUx8ErgFaKhwWUibI1U9XEdeFmEB1AEdrJSzROWSnd0XALqPGOPSxrv?=
 =?us-ascii?Q?Q8hC8ccBL75lpIKFMXT9OyU2WybibYA7xD8C7e0dH4mKkAcUej7T6XlWMEWI?=
 =?us-ascii?Q?sr05paIqF9YbVk7E1A0aTo/nWvqXBTDYdOXsIEDXIYXh5jxPzhfwJxz1muop?=
 =?us-ascii?Q?Z3Uu33WJGTeCwR9OMFKEnsOOHFXxM4BfRzdlrB0Vsa8/omfj0PH5vY9tEuAs?=
 =?us-ascii?Q?eDT3slMUeBNc8iNJGnuAeGOhh7pEsJGQ4H76vXXgtx2NCUV5QmJdFh9HDecv?=
 =?us-ascii?Q?GJNSK8SYUl+cT949xv/fJSSER4LrHRknoSAnXzNDUsBPWrnz7W79/pCVPF4o?=
 =?us-ascii?Q?c9IFjM4Gv3Bl97ovSE0PdYAjZrwQXKGnBoZelyphABdb0zk7z+DfOUtZQWP1?=
 =?us-ascii?Q?1I1CfWnmMamsTjNopPEk9qeWLR3WvIsFj+aOScrGeegzmcNZyJ2UgqgUTEs8?=
 =?us-ascii?Q?jFZC7nI3ls1+0dkQDqcLbusHhgHRcN5fbVAivPymlX6iMoUG4W2eUB3RBD82?=
 =?us-ascii?Q?00g05e19AMG8l4nfzT0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe89727-4cab-4195-7b4b-08dc4d9d6e2b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 14:02:53.4840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuHtmBfC/NXj/C4gQuBxrHxv+vV1eFnVpstoGdWgNx+6xQB2JqiKo+aFcp/0m64k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200
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

On Mon, Mar 25, 2024 at 02:58:48PM -0400, Peter Xu wrote:

> > This remark would be a little easier to understand if you refer to
> > hugetlb_walk() not huge_pte_offset() - the latter is only used to
> > implement hugetlb_walk() and isn't removed by this series, while a
> > single hugetlb_walk() was removed.
> 
> Right.  Here huge_pte_offset() is the arch API that I hope we can remove,
> the hugetlb_walk() is simply the wrapper.

But arguably hugetlb_walk is the thing that should go..

In the generic code we should really try to get away from the weird
hugetlb abuse of treating every level as a pte_t. That is not how the
generic page table API works and that weirdness is part of what
motivates the arch API to supply special functions for reading. Not
every arch can just cast every level to a pte_t and still work.

But that weirdness is also saving alot of code so something else needs
to be though up..

> > Regardless, I think the point is spot on, the direction should be to
> > make the page table reading generic with minimal/no interaction with
> > hugetlbfs in the generic code.
> 
> Yes, and I also like your terms on calling them "pgtable readers".  It's a
> better way to describe the difference in that regard between
> huge_pte_offset() v.s. huge_pte_alloc().  Exactly that's my goal, that we
> should start with the "readers".

Yeah, it makes alot of sense to tackle the readers first - we are
pretty close now to having enough done to have generic readers. I
would imagine tackling everything outside mm/huge*.c to use the normal
page table API for reading.

Then consider what to do with the reading in mm/huge*.c
 
> The writters might change semantics when merge, and can be more
> challenging, I'll need to look into details of each one, like page fault
> handlers.  Such work may need to be analyzed case by case, and this GUP
> part is definitely the low hanging fruit comparing to the rest.

The write side is tricky, I think if the read side is sorted out then
it will be easer to reason about the write side. Today the write side
is paired with the special read side and it is extra hard to
understand if there is something weird hidden in the arch.
 
> measurements too when getting there.  And btw, IIUC the major challenge of
> pagewalk.c is not the removal of walk_hugetlb_range() alone - that may not
> be that hard if that's the solo purpose.  The better way to go is to remove
> mm_walk_ops.hugetlb_entry() altogether, which will cause a change in all
> callers; that's "the challenge".. pretty much labor works, not a major
> technical challenge it seems.  Not sure if it's a good news or bad..

Ugh, that is a big pain. It is relying on that hugetlbfs trick of
passing in a pte that is not a pte to make the API generic..

The more I look at this the more I think we need to get to Matthew's
idea of having some kind of generic page table API that is not tightly
tied to level. Replacing the hugetlb trick of 'everything is a PTE'
with 5 special cases in every place seems just horrible.

   struct mm_walk_ops {
       int (*leaf_entry)(struct mm_walk_state *state, struct mm_walk *walk);
   }

And many cases really want something like:
   struct mm_walk_state state;

   if (!mm_walk_seek_leaf(state, mm, address))
          goto no_present
   if (mm_walk_is_write(state)) ..

And detailed walking:
   for_each_pt_leaf(state, mm, address) {
       if (mm_walk_is_write(state)) ..
   }

Replacing it with a mm_walk_state that retains the level or otherwise
to allow decoding any entry composes a lot better. Forced Loop
unrolling can get back to the current code gen in alot of places.

It also makes the power stuff a bit nicer as the mm_walk_state could
automatically retain back pointers to the higher levels in the state
struct too...

The puzzle is how to do it and still get reasonable efficient codegen,
many operations are going to end up switching on some state->level to
know how to decode the entry.

> One thing I'll soon look into is to allow huge mappings for PFNMAP; there's
> one request from VFIO side for MMIO. Dropping mm_walk_ops.hugetlb_entry()
> seems to be good for all such purposes; well, I may need to bite the bullet
> here.. for either of the purposes to move on.

That would be a nice feature!

> > If, or how much, the hugepd write side remains special is the open
> > question, I think.
> 
> It seems balls are rolling in that aspect, I haven't looked in depth there
> in Christophe's series but it's great to have started!

Yes!

Jason
