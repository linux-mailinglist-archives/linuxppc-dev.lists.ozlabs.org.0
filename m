Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D5389E652
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 01:45:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nAcjPDAW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDjHl4vB1z3vbW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 09:45:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nAcjPDAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::700; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDjGt5r2vz3cGK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 09:44:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xi+3pvDvOVxI5yXfdGGEQhgvZpb+NKDP96OnbU3lTPZxmfFJxuI72YaIEktEJdLDtS8dTtF5+dxEgaFKn9dpdjO0dGfgBdUOa0iRMybTAJeVRfTAu723wxZN6FbbR4/fv+4hjZHbdXrfr1wrOMiJgn62bIjnIYoHRGhsvcmWOZ0DUh1EMKip5LvYZSK8qCwlhCKukGFl9bPmD+CvaL6AGhFIXo6KD3cYeAz8rIprwihx3zLcPjOxaDtoLn2x8POp/Lj/0Ql5pUS4O3awxM4iUwrezebj4mEm0SO6zVxKCbAffkwddfFN9XfdJvllRi4M4vv9rl0tWRjlaERwjN/UOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtYTOEh4QaWorr43L3gIXx64bhliZyCJB+XpBOpnfnY=;
 b=acpbnNMFSjuW2F/GF7XDJ2VI4xwM9sVYi7kcXFseCy5rM6Bser2UxfQtZHDM5PgFXLLakEAzgJOeLqARrZer0PydIAZh8YGsGIAzp8+sf40tFPy7EQMAcY+XRWEyfBrUJJyVZUbsz7GqvpmeQP7j4u6YnNB/c5B5w7g8tUWxQEljmAXWmaMTBFehxY+yfm4wZoDG4A9WvvE6ClJn3JlxB8HILipb0XM3QdU/s0OIosMVePW52tGx75UHawEnHdT3da11Wi0iqWS4x+SFGWTm5x0lyqUScllgEdZjWgL0jm3qISuW/mNiSZ0B87Z2iTqDAsMoajACRXBI2/r2UPpoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtYTOEh4QaWorr43L3gIXx64bhliZyCJB+XpBOpnfnY=;
 b=nAcjPDAW0kACTUv5lj0Y/8tRiH/b3l1rt3VC8DswdR/Y9x2JskqMcO5yof+yx1xoRzs+RhlUszlFJMCKFqKyGM/j3Z9wb53p6NMN3vUnPidrWJp8kWBmWhsqbEv05qZSU5gy8xb6InpN6aX8Jwi3muJRcFYzks21wyEutN1UQCgGFkrObwsw4KRhQyTuc72hx3p57wOaubPe21ByEu9vigKyRRkTW5xHDP/i7Xhz+6MMX/7z3FVNi1iMZkv6ZQTS6wX7tBsYQBNN8qqx5EPXlYxlBTm3L3Gnii4tQ8ort7+34j5WkmL0/JgoscbdAbCqcco4TbKwwTTrFdM3JxTocQ==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CY5PR12MB6371.namprd12.prod.outlook.com (2603:10b6:930:f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 23:43:57 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 23:43:57 +0000
Date: Tue, 9 Apr 2024 20:43:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <20240409234355.GJ5383@nvidia.com>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
 <Zg8gEyE4o_VJsTmx@x1n>
 <20240405181633.GH5383@nvidia.com>
 <ZhBwVLyHr8WEKSx2@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhBwVLyHr8WEKSx2@x1n>
X-ClientProxiedBy: BL1PR13CA0252.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::17) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CY5PR12MB6371:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iXQTxovTY807gc9Dbk5H0zd9d0njVbKMhGDXOQQ6ZTfgqyaFPOgiRx4Mm4bl0xB8/31350HIhR084ItECUUS9eEcpvJqW3JxtpmM59l+Nu2rQCGLcq4OISstEP3jYYHjaDUN8g5XVvgfMUvzafeYWdwIrDNHzODw8jTGuwRjiYTmswad9tTkbQmFH8XKGqebBpVt/IcchePxCyZcJ6YmacEx5O4zWVPpkfj3gBLD8YVroioVW8QUWelKirZsM3CD6Kml3GZsn5G6nNUhqMG88wk/GJRjfobkkcxRAGqR0BsiyBXIA6j95P7wnfrNs07dGJbcKq51rcL3V6CjHtoEJRIIKQGqVMyvHKxdb1ikHXTH7dmFZA+uWT3b8biLb0OfshoICsnk0pZLix2Q8FALh1vvX/Y6OB61pAR2koybkQimnh5CCHlf/RmEfnTxIYkeUQIe2CoBvUnmsfTJEQ8H2Olwuijj2tn0a7t26qisAnGPCwrBOrP0RZGSz7czl0awcF4UB4aH4Ba02cVp/JkguACxwR2bRXlWx1VStVtu52JNseiF73W3+DGuGK5BXNlooS3TDobd+CE4AgVZlKDeLiYr9rGDnhWKgjts2A/J2Wb2BH8XY81uonrjBpgM/v5lL6OzW9Hch0PRZqIzzcx9cburqln0VWUxWN25AOVSMnI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?LsbAex/tFaOhbX5oXZtD2xnKSHaLeub2PpPUmpl9Y4EinNTpaBVG8vnUJOWG?=
 =?us-ascii?Q?e/y7V8hJtgWVDC0rkXlLnKpc4TtC+9zKlae4wCl+pXU85lIFDQP9seYfJLYF?=
 =?us-ascii?Q?oEANW1pktsvHbr6OZlSh8TkvzUGe6e/jJG6J6c9OJQjl3yAZKkRj2KAmAGuC?=
 =?us-ascii?Q?7DWJR4SyjRGOln34+eJDGyo8OkRjSfnSmjkvn9UnXoTMqdzh8c08s1CVxqin?=
 =?us-ascii?Q?piyxmajEGbJ8xSYtlc0qHVZZT9r4PqnZazYJUu3h2sFb8WULeXkEcjRn+2/T?=
 =?us-ascii?Q?CL+wwDvuFk6ycyTyatRwdWkvZoR0xMP+3nqLp/aiLN1nJxiRf4EKH5BK0F5K?=
 =?us-ascii?Q?+O7CmocJ4fIGpWNwXj/2sDYpUykq58u2jZGwxFlvEpxy3/Fg95YGadeOowqC?=
 =?us-ascii?Q?J+RRMpxr0mF3gqyrSxQ6lu/QEgIMXeedjrl4a0tO6kmQqs+93a3I2lKgHdGw?=
 =?us-ascii?Q?tHUTHInOH6556qlhkMptj5KeK2r92pPeG1U5+zY0NlgaGexxpnT7/GJWW6TR?=
 =?us-ascii?Q?q+3WGX1ffFsk2yQAXMuvYVBDewEWi+zUKnHdxpxa1CMK0hqJyqdzUb3K7VrJ?=
 =?us-ascii?Q?aWW/9BqXWMPBJT/7M4mNzozLBLiKipDlaQ4C4nq/UJuj8XfMWsvUf4O+Styo?=
 =?us-ascii?Q?aEM9YwlIG4AzxxV65ZXH5BFJ0mSMo/rQpd++4tWJth8cLrfMwhUvgTl+exbk?=
 =?us-ascii?Q?SjKlTW7yGaKIIIUAM35bfS7SVK4W7J4l+D5ymCFCH8M6QIgEM5ZlTU7hwL/m?=
 =?us-ascii?Q?E++4/wtyRULEQd04V1YCuUZYMEX1+8NzhrE2eOuOoNMle0O3+c/qPvXv125V?=
 =?us-ascii?Q?niP47nXoiMGXvSd9+GyYUnNkuwfiiXa9bqEXTRdwtAp2zNerQslFSA9j48yO?=
 =?us-ascii?Q?0iWeN6EroSDCvRyhpTrj5HFTtpwjaCCglGLgXYe68aOxiDLqmXHuw/1f7NzZ?=
 =?us-ascii?Q?ER4NULBHpqZW/H77fQLVa3KpkFueTW0qCMAaxz+2zEMC/WZwzSJnh6cc6wpg?=
 =?us-ascii?Q?n2iVCPxpVhLcNm6LNkPBKDpcaemM65as+I39xolAOodWS0sVi02NmxWG95KC?=
 =?us-ascii?Q?J48e5+W/77mvgrt8p/1edxo10TGzDdBSUj6fqojnZaDjGVeaQa5j/l7mRIgT?=
 =?us-ascii?Q?YtW5amIZHFu1ScXv7QvJ8JUMuLKNyznJPJdNikPmoFc9Z3FKoAuwRo5FFkzA?=
 =?us-ascii?Q?iziyqOneDlKtDUTooHdz+6xef+7poKlK1II4pe4VCX0xj9/3U/8XwSMNRKlX?=
 =?us-ascii?Q?TcaQNtPGsdwlAcj9ZqrZq+7V9FS5MBHoN3oHgIPv4X1pi531SZUmJEAiMuvP?=
 =?us-ascii?Q?laDiXae2IQ1TM1+QqUu/Taey/VgL0nJya/bbhVQu6XU1p4NiIOZ8BitSojst?=
 =?us-ascii?Q?iXuUC1TEBRedIsRztPhmsrARqVSkLxjmuJrEvbnGHPVMDfkXz26fvgLAtSPr?=
 =?us-ascii?Q?yKaQLoVnWrBmbcqfaf1OF4dse5IietzKQddHb/62jAYx/USjB0FD7vL/PMBH?=
 =?us-ascii?Q?DT2+xLhhAtDQE4+/Ho/512dmzC9N4te2pdMA4wHNbAXfSISUOsAxb9UM/m8S?=
 =?us-ascii?Q?ihV6z0q3kuX/QAwP5flrKN0tCFCiLbrObP4TA0aC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e3d269-d78b-41b7-d9ce-08dc58eeec68
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 23:43:57.2831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8tC1X3VQ0gDilRgFzcj7VTWoVsSZCmOuOX+sy3uB0ahEU1M7HHxIrKg+VfaSHQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6371
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

On Fri, Apr 05, 2024 at 05:42:44PM -0400, Peter Xu wrote:
> In short, hugetlb mappings shouldn't be special comparing to other huge pXd
> and large folio (cont-pXd) mappings for most of the walkers in my mind, if
> not all.  I need to look at all the walkers and there can be some tricky
> ones, but I believe that applies in general.  It's actually similar to what
> I did with slow gup here.

I think that is the big question, I also haven't done the research to
know the answer.

At this point focusing on moving what is reasonable to the pXX_* API
makes sense to me. Then reviewing what remains and making some
decision.

> Like this series, for cont-pXd we'll need multiple walks comparing to
> before (when with hugetlb_entry()), but for that part I'll provide some
> performance tests too, and we also have a fallback plan, which is to detect
> cont-pXd existance, which will also work for large folios.

I think we can optimize this pretty easy.
 
> > I think if you do the easy places for pXX conversion you will have a
> > good idea about what is needed for the hard places.
> 
> Here IMHO we don't need to understand "what is the size of this hugetlb
> vma"

Yeh, I never really understood why hugetlb was linked to the VMA.. The
page table is self describing, obviously.

> or "which level of pgtable does this hugetlb vma pages locate",

Ditto

> because we may not need that, e.g., when we only want to collect some smaps
> statistics.  "whether it's hugetlb" may matter, though. E.g. in the mm
> walker we see a huge pmd, it can be a thp, it can be a hugetlb (when
> hugetlb_entry removed), we may need extra check later to put things into
> the right bucket, but for the walker itself it doesn't necessarily need
> hugetlb_entry().

Right, places may still need to know it is part of a huge VMA because we
have special stuff linked to that.

> > But then again we come back to power and its big list of page sizes
> > and variety :( Looks like some there have huge sizes at the pgd level
> > at least.
> 
> Yeah this is something I want to be super clear, because I may miss
> something: we don't have real pgd pages, right?  Powerpc doesn't even
> define p4d_leaf(), AFAICT.

AFAICT it is because it hides it all in hugepd.

If the goal is to purge hugepd then some of the options might turn out
to convert hugepd into huge p4d/pgd, as I understand it. It would be
nice to have certainty on this at least.

We have effectively three APIs to parse a single page table and
currently none of the APIs can return 100% of the data for power.

Jason
