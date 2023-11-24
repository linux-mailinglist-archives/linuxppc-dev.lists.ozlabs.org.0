Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848D77F6BB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 06:29:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PpYv4BBj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc3TG389pz3dS5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 16:29:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PpYv4BBj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc3SN2JXGz3dBd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 16:29:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3E1A616B4;
	Fri, 24 Nov 2023 05:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B82FC433C7;
	Fri, 24 Nov 2023 05:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700803744;
	bh=b1xrLFEHTKstn3tjIcO7kRrLqNMDkvZlizKbZ9tMeZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PpYv4BBjh5pUqvb+tRw9+/ZzMx2Tz0YEDWezWO1IttzM0Vs+ZJzJeKKQIxKJNQ0p3
	 MnYvvnVpZ+8NNiBcV75ilpO+5qMuY88uD3QkQx5eelkd3JJQDmlWiAAB4WEdd6giY9
	 OSEc1zqwX3pbA6qEivv2Bd8HlAqgxCIABV9BqAeU6jza8xc3qQo/hUkmv7kLIqW3EC
	 mQvOW9pAv3MePCglg1ruFu1oWrvpuChqcMpNYLnX9ei3Zbx5tMJddcT5W3/083HSp+
	 Jl2oKTVE9J1TRJVGPJB8Amm3RYIFOshsSCbvueTtjrnj8cJ30QQ718ITVxXeNnhFRr
	 dcvO53tjfP9VA==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Peter Xu <peterx@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
In-Reply-To: <ZV-p7haI5SmIYACs@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org> <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org> <ZV4co7wcI-_wK91F@x1n>
 <57be0ed0-f1d7-4583-9a5f-3ed7deb0ea97@csgroup.eu> <ZV-p7haI5SmIYACs@x1n>
Date: Fri, 24 Nov 2023 10:58:51 +0530
Message-ID: <87zfz37m98.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Xu <peterx@redhat.com> writes:

> On Thu, Nov 23, 2023 at 06:22:33PM +0000, Christophe Leroy wrote:
>> > For fast-gup I think the hugepd code is in use, however for walk_page_*
>> > apis hugepd code shouldn't be reached iiuc as we have the hugetlb specific
>> > handling (walk_hugetlb_range()), so anything within walk_pgd_range() to hit
>> > a hugepd can be dead code to me (but note that this "dead code" is good
>> > stuff to me, if one would like to merge hugetlb instead into generic mm).
>> 
>> Not sure what you mean here. What do you mean by "dead code" ?
>> A hugepage directory can be plugged at any page level, from PGD to PMD.
>> So the following bit in walk_pgd_range() is valid and not dead:
>> 
>> 		if (is_hugepd(__hugepd(pgd_val(*pgd))))
>> 			err = walk_hugepd_range((hugepd_t *)pgd, addr, next, walk, PGDIR_SHIFT);
>
> IMHO it boils down to the question on whether hugepd is only used in
> hugetlbfs.  I think I already mentioned that above, but I can be more
> explicit; what I see is that from higher stack in __walk_page_range():
>
> 	if (is_vm_hugetlb_page(vma)) {
> 		if (ops->hugetlb_entry)
> 			err = walk_hugetlb_range(start, end, walk);
> 	} else
> 		err = walk_pgd_range(start, end, walk);
>
> It means to me as long as the vma is hugetlb, it'll not trigger any code in
> walk_pgd_range(), but only walk_hugetlb_range().  Do you perhaps mean
> hugepd is used outside hugetlbfs?
>

walk_pgd_range also get called from walk_page_range_novma().
IIRC commit e17eae2b839937817d771e2f5d2b30e5e2b81bb7 added the hugepd
details to pagewalk code to handle ptdump.

There is also a desire to use hugepd format in vmap mappings. 
https://lore.kernel.org/linuxppc-dev/cover.1620795204.git.christophe.leroy@csgroup.eu

-aneesh
