Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E77895FDA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 00:54:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QIHeKsrv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8NVd0Jfwz3vlC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 09:54:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QIHeKsrv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::717; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20717.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::717])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8NTm3KkHz3dtJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 09:53:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5whBe2TPQ5eXK65hZsgCjupJfreBbCduLlbaNWOz4qLJA1Lm5ARHUR+f80j2ozuiR7VPB+NHEGcfCrahsNxU4rpGy8FeNLrEIIS1jaZkLqVeC7Blu/2MqygMfk2GGjs1NoSVvshwItI9kXsHlMOJgWFF7704mk7vHYBJdHQP8Jths9L4wbV6hajnn1RPpUQWXT/fkNAjeybKV9eMxjo+Vll8EXYSgvAclzXQoYIjKj3CC4L8nQtuRjfRWjMGdVLNbdGdv7trv9hJ73JkwS5719yMHFb0EKhLnpHnqqARayrv2QhUAwl5oed9eYIT5hokBMQxRIVWU+GVI9axOWm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhJ1UQURdwDUzvXSG96GikuJ0SUIiMxdS6K1gLCHIQ0=;
 b=NY0DjMEqgNnnEBPQii5H8c2t4gPkaFQxJOrsqVXzBwrOYsvFSW78sDMkR7oIvg2E5PmIwUyhPDNNBQeDfoyndJG4l123ZYjXyqVVrF4yrE7TOtP4zXdNenU3ObhCBmSsmFvxyv5IcKV185pzs2Hx+aFcxwTRoMwMjRp1gV+vKVMDMSFfx69pqS9xIbvyGD1G9/zxa72bBxdnEsL8zfNvbaIVM1eKzov0hGP2wBq2UaadIrT6tlZOf9cnvrk0FKU1m3IRpNYjCTKa1oSrF+j3ZPPz8BQwbEHuiI73Yc/ocJUSujz30aubTVxDnaNvXNufdLBagrmKsMdvfn+y6VUMjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhJ1UQURdwDUzvXSG96GikuJ0SUIiMxdS6K1gLCHIQ0=;
 b=QIHeKsrv9dQSlg4VYOTZBEc8XMbAJDA+sibJoDGSBm8ECNJ5skYQ9tKa9Ccmo33G2yIw6XUSAVFDB19NU1YqoxFZtJttnwtnzN8GnqirKY6BUBOaspL5fyZ0Q5Fk3LU0YppxjazsoQ/2uKwEftMnWYnDVAm2FLPsq6jbkFRkw4l2qQlOH6nmwUYeKOhJSdE1iusxOnl9L9dnYOOkRe2u7MmNjMlUy6Df3yEbnCCpaMikq96DXbF6Lc4pdf4bcTyoRDHckgf7W+VnEqT+dZTxXjEKqkpiSM8UNdM7pqd/p7Eb7Yq3D0uDvvdRN+z3d36BxNyMi0Ma95gdNCAc2V9HmA==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by LV8PR12MB9262.namprd12.prod.outlook.com (2603:10b6:408:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 22:53:22 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 22:53:22 +0000
Date: Tue, 2 Apr 2024 19:53:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <20240402225320.GU946323@nvidia.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgyKLLVZ4vN56uZE@x1n>
X-ClientProxiedBy: SA0PR12CA0015.namprd12.prod.outlook.com
 (2603:10b6:806:6f::20) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|LV8PR12MB9262:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aAb6xuu5/XJAHyVBhXWlYPiGm0Ij7iFUtCdheAh55xZnEif6U9osw6r5qd8saHTa1z5j4eeJDy6G4+SBbKSC0FJbUyP+1enSkKXgTM8rdlqU1jgs3+E3+Kr1q1Oaf8HIJXoIadx3s+1IVRrRkuDCYz2Fc/0dOptrmHOLAbHwJbno/bBFpBOa8T++2PW0mff9p74UoYUZr9iQnFIChQEWEDbqsGZWudF7Sbb4aZQRjJqFBMEEmZvCPeuuWMfZcrXLAiugvnweT7SviprX/7dJjY4eEjCLQ2ibDx5aGMY9QgJf6gskWHKS8r10zh2U2f8oJgkzGGu1B2sgYXFTO5FAEAK5RXXQcXuCDRDFrswxQ4GhG9PB80iiIdC++DMfMHK8TXHp/t2IzSH0sAnxXDwrOs/NcIAyxhy1OksPA9lHIigJQVRqgY6njgnmhNg4ZGCW8ZSWU0w6IWBfsrGQ9dJGjqc6iHZFm2t/o1rhpymWFgFC6vx0necF5dXk6FAAHecKgRXEEbktMUOaIltDxelWmGzx4Y3BWCcQsnTOlqhIUebVEE1p1KaPfupWkrXL8K7iwePPRX4L2OGFr2IFJ9zTwedEEb19Zm6WTmr45qNKYlhS+3aS3AAj0578joMp7NUpD2feH8PAxb+0M0enNbaY+mcQkNhtVifJV0x3GtqlIOc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?C+DuDQS5m0FwmZVT3XgazypinSRUXPD2n2z0WCs0Dzk7kGekw1vKengH/5gu?=
 =?us-ascii?Q?N3NhemlAVzWH5lnVd7qIapurAK4wFG4B1fcGhyKycUJKxC0W9Cosl0yXdEUU?=
 =?us-ascii?Q?UkmyqOJ7j4u2RcWaYIAkYyLL9A3keTWNOCTVa7Bi9DDuH7vKnLJeyG9tqhQE?=
 =?us-ascii?Q?qlkcT0GnWRV66f+OfKP7rISSP77j6jhb6X7PilGCdErF3fTgYQuMOQfY724R?=
 =?us-ascii?Q?Ji8FG3VAjV2Uw2odkhoVSKR/jGaDFqjZVn/vRSymCzMHZs28bFIQr0TDGJFg?=
 =?us-ascii?Q?OWPnqEYbz7WxCtNQjEjKrUtbxRSsIFzHufyqJQ6YTkBAhjBD9Ef7hI6Rxt80?=
 =?us-ascii?Q?XpM9XAml8m1L6neKtaYC9D9Ym2YuYqgkdcYwLC+krGncN/1HjTRnaKX0QTUI?=
 =?us-ascii?Q?L5HrE6OwM1SGujcNueObqp6YLsDIbp9U839X8SvsOk/VI8d/CFC77HW3mNl+?=
 =?us-ascii?Q?8S3+oypDT+GEWcH+dV/A01Y9xvBWzzKNO1aDF8dRqR7M3Lj2wjqP8zZqt6N5?=
 =?us-ascii?Q?IQ1cdqZAFkT2ZG6H1ejUK5soZCGoGiBMgU4T+/Bp4wpSptIkW1T4IvIR0kl0?=
 =?us-ascii?Q?2/gZMt1pK0NaMwahilBD68c5OxJ6HEQ9yQNAnjpsPkHNA932PX0dDMHkk4cd?=
 =?us-ascii?Q?4L2ft6iBFZdj7tsB5dWKdxMuNQsAk+cpumIXoodBzgyiYNhkFpEJkXBqBRJ9?=
 =?us-ascii?Q?nCA69Q2Jh5W+IfY43r6kc3Gtfk6bGQwOUqpYFWJaWl0qI+bmV+HscFFyDdFK?=
 =?us-ascii?Q?Ik0KP/oS+gp3UOwJ6fZGUOH0XfL0EX2GPAuhH4bccRG8V04Gf3Ub8+sKzBl9?=
 =?us-ascii?Q?HqQ7bY+OG27YOhr1QL1uc6Jb3YVrvU7quk/Ezy5qV2isAjDP3spAcdqW50UB?=
 =?us-ascii?Q?2XE9Wy2EO98RAArmbe73AoSLyqWPX8IVqMjyvA3vAOV9IClfM/f1P5rY86DZ?=
 =?us-ascii?Q?OirmvlLt/cnb6ZhtDSiC7votu01aq73Cxmx9hXojUzh3xcfHC6BX0SL8xGte?=
 =?us-ascii?Q?WEDq1da1/dLosHYr9SE0ZVEXRdCCwH8H6fVm9Dx3Sz8RhN+6WOKS2nnbKNPZ?=
 =?us-ascii?Q?B7VHafBOt7rZ1ZdBOkihFg/dUgE/JakzeFH3WSHgRq0qOuixt/ZqbJDC9EeP?=
 =?us-ascii?Q?RSnE9w3w1ArGAW1QdMn9mf3NvpiMJLYw9C2XbmmZI5mw5ZS5y2ME9IRk1nDj?=
 =?us-ascii?Q?WihLuCIm9Ro9MR10qsgojN2/XP8oABd22kpeHkGwT0JmLCsBhhDdDi5ZPhbU?=
 =?us-ascii?Q?zXwvfkqop5dIqGIxvDNc70B+aiUQkIml5mYBNqBEzwQcairyrvVJr71MHZCy?=
 =?us-ascii?Q?ZDVGIjHpf6NeM/OHYAnWDeOwBj3BjNld+VcmexNkYDkWhxrJYI82EsDeZ8Wc?=
 =?us-ascii?Q?cH8gZSh7tm/toaFI4JiqN52PDCyYaJfi5Spd3BNueDc7pH82xH4HBckOgCeA?=
 =?us-ascii?Q?MUT7enF8IqTek9TWtKb8Uwma5ZEgKM0acUcbXD3HI7N4vla+r3T8vmKRU381?=
 =?us-ascii?Q?eDwAv9MMYzuuU5hsvT+shLXIrXKTP6jojR2BT6uAX/MUCaKtCNW58xd9FwOD?=
 =?us-ascii?Q?VH7yZfQX6ABB+053NKSPO2ioBTE370pze8xiVzCw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d611d46-9fb3-4e5d-6979-08dc5367b2a2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 22:53:22.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oa2HsOvvP6XJ1dsEuaN3GXjvhCh14tspZkBbQzjRMrzHJ0pnk2KzDpv4P9BaFwFM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9262
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:

> I actually tested this without hitting the issue (even though I didn't
> mention it in the cover letter..).  I re-kicked the build test, it turns
> out my "make alldefconfig" on loongarch will generate a config with both
> HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> THP=y (which I assume was the one above build used).  I didn't further
> check how "make alldefconfig" generated the config; a bit surprising that
> it didn't fetch from there.

I suspect it is weird compiler variations.. Maybe something is not
being inlined.

> (and it also surprises me that this BUILD_BUG can trigger.. I used to try
>  triggering it elsewhere but failed..)

As the pud_leaf() == FALSE should result in the BUILD_BUG never being
called and the optimizer removing it.

Perhaps the issue is that the pud_leaf() is too far from the pud_pfn?

Jason
