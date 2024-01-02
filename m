Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAB28217B5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 07:32:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o38+Omru;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T431g20hJz3cPR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 17:32:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o38+Omru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T42zx0qWlz3bnV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jan 2024 17:31:09 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1704177059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwM83SlsLb1lbvo4JCqZZv0h8wT6KPgcWS/HAwN04/0=;
	b=o38+Omrur7cm8Q/e0nLnXqBIsWvLMDkbm5ptAnn/ZlZWQiCVmcDjZtwoEs60A94RgcAauv
	E132opwWBTvCsPeDzfzlh9A4yzPTIVTPtHNC/5L0+b6GA84IBDoYN0L7I27E5LuYL9UL8A
	OyzbfsSDRORVadxA5D4C39d8zPUzD98=
Mime-Version: 1.0
Subject: Re: [PATCH 03/13] mm: Provide generic pmd_thp_or_huge()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ZZOhCuuozrBscdRC@x1n>
Date: Tue, 2 Jan 2024 14:30:25 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B38660D-3AC2-4F96-9DD1-2D8CAA55E7E4@linux.dev>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-4-peterx@redhat.com>
 <135b3189-f459-4b57-9861-bb8acb999d91@linux.dev> <ZZOhCuuozrBscdRC@x1n>
To: Peter Xu <peterx@redhat.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Linux-MM <linux-mm@kvack.org>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 2, 2024, at 13:37, Peter Xu <peterx@redhat.com> wrote:
>=20
> On Mon, Dec 25, 2023 at 02:29:53PM +0800, Muchun Song wrote:
>>> @@ -1355,6 +1355,10 @@ static inline int pmd_write(pmd_t pmd)
>>>  #endif /* pmd_write */
>>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>> +#ifndef pmd_thp_or_huge
>>=20
>> I think it may be the time to rename to pmd_thp_or_hugetlb,
>> the "huge" is really confusing. thp is not huge? Actually,
>> it is huge. It is better to make it more specific from now on, like
>> "hugetlb".
>=20
> The rename will need to touch ARM code, which I wanted to avoid, see:

I see.

>=20
> arch/arm64/include/asm/pgtable.h:#define pmd_thp_or_huge(pmd)   =
(pmd_huge(pmd) || pmd_trans_huge(pmd))
>=20
> So far this series only touches generic code.  Would you mind I keep =
this
> patch as-is, and leave renaming to later?

OK.

THanks.

>=20
>>=20
>> BTW, please cc me via the new email (muchun.song@linux.dev) next =
edition.
>=20
> Sure.  Thanks for taking a look.
>=20
> --=20
> Peter Xu
>=20

