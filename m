Return-Path: <linuxppc-dev+bounces-14756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9CCBC9A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 07:06:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV8ht5rg8z2xqL;
	Mon, 15 Dec 2025 17:06:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765778814;
	cv=none; b=oMi68ks3m1XY1gFdCeSHjWNbCkFy12VIwfybc91zERp7XATeei10xixRtbRgMM3hELJwxAz0FF23wG9/DZ2XHxfYp+qdldLYszEA2AFPsKtzi/wTXKtOzUZdeXKXa/yHm3g1P/jo+qU/oEhZX/9FqfPOj174Yso1usvB9ILKFWANYE9TPHj0CycWxiR/gKaG4bCYooPR1KmbsluzoJzFrsFQIYoBdoG0scrypiYQkJLvGI9gp/cMa48eMxDpO6YhBlblR8OdMGkT9A+feuqzJzjaByPd3SCDMH3JWVpO4cj1zry9Axbe3vgpnlSsDZ8DIqI54SzMbGi3Qmltf/L+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765778814; c=relaxed/relaxed;
	bh=/TlLSNFRpMoYucnzWkE6fZTL8Gqv3gNFBMOp3BHRi04=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I+D35MjG8+CooUZL0UgVtWVn1ljcboY7v2kNyTVP+R+F8aGdGmngTuhYqIV4uMZIHUP1vguC9yDGk+iIB3oo5EnKgIdyLWQgIF+KuJVAJ0C/zNgzr+cAWBLlhEwelPOiwLribm7acmOsfnF+yCqZd3+RP6cQIW8aOZ2MuRIN5hgZNb8nUy7+gZw/eIC++8pbNN0ONy3mSbU7gm4HzcbFHr+R80tHEwf3F6EubOjAPWRBQmzT4ECJ+wzAWPmlIQXM+zp8zM6qunXdOX42XQ6uOyv+BU/Jaz0C1ej1p+XMinUqr+KObAUM5g/MJqPG9cZ0SBGSs05OkA7O4idr4CRbEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dsvGK6qE; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dsvGK6qE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dV8hs3PR7z2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 17:06:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46769432E5;
	Mon, 15 Dec 2025 06:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAD2C4CEF5;
	Mon, 15 Dec 2025 06:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765778809;
	bh=LZhBjlTxoFNlhrByvEV/y6EF+GjXIZM8Cs2e+DsOYK0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dsvGK6qEbjcxkfXe4dgqGA+2gUZtLCGId9H7SRkUvCsYVOVSKyLW+oEIivRixBz+1
	 Z2Kkg2MWVahuSVvGlCjiAodOrZGvJJhqNY64Auk2gayogXzdCDIoc10dKd+5rCIJGp
	 g6OOehz+1Z3pGWYZQp2ltjP1V2ZMst0KhsfOTFkv9P4MH2bPqMG5DlMXRoUfSij6ub
	 e0vDR9gl0HQ/I0xH6yl3grXwGmyh32GJjZZfc5hMA9h56ccCrDeUdEezOPD+GB8JOK
	 WmtGBHDM9GXG3PrHDOf2iqrmzjJIALENh50UFXxhp5HRp0BST6R+FidCNs+EnUt6iK
	 76woTMbh/rMYA==
Message-ID: <686b85ff-6a5a-4608-af97-55aee1582c5c@kernel.org>
Date: Mon, 15 Dec 2025 07:06:34 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] mm/pgtable: use ptdesc for pmd_huge_pte
To: alexs@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Thomas Huth <thuth@redhat.com>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Magnus Lindholm <linmag7@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20251214065546.156209-1-alexs@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214065546.156209-1-alexs@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 07:55, alexs@kernel.org a écrit :
> From: Alex Shi <alexs@kernel.org>
> 
> 'pmd_huge_pte' are pgtable variables, but used 'pgtable->lru'
> instead of pgtable->pt_list in pgtable_trans_huge_deposit/withdraw
> functions, That's a bit weird.
> 
> So let's convert the pgtable_t to precise 'struct ptdesc *' for
> ptdesc->pmd_huge_pte, and mm->pmd_huge_pte, then convert function
> pgtable_trans_huge_deposit() to use correct ptdesc.
> 
> This convertion works for most of arch, but failed on s390/sparc/powerpc
> since they use 'pte_t *' as pgtable_t. Is there any suggestion for these
> archs? If we could have a solution, we may remove the pgtable_t for other
> archs.

The use of struct ptdesc * assumes that a pagetable is contained in one 
(or several) page(s).

On powerpc, there can be several page tables in one page. For instance, 
on powerpc 8xx the hardware require page tables to be 4k at all time, 
allthough page sizes can be either 4k or 16k. So in the 16k case there 
are 4 pages tables in one page.

There is some logic in arch/powerpc/mm/pgtable-frag.c to handle that but 
this is only for last levels (PTs and PMDs). For other levels 
kmem_cache_alloc() is used to provide a PxD of the right size. Maybe the 
solution is to convert all levels to using pgtable-frag, but this 
doesn't look trivial. Probably it should be done at core level not at 
arch level.

Christophe

> 
> Signed-off-by: Alex Shi <alexs@kernel.org>
> ---
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index aac8ce30cd3b..f10736af296d 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1320,11 +1320,11 @@ pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
>   
>   #define __HAVE_ARCH_PGTABLE_DEPOSIT
>   static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
> -					      pmd_t *pmdp, pgtable_t pgtable)
> +					      pmd_t *pmdp, struct ptdesc *pgtable)
>   {
>   	if (radix_enabled())
> -		return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
> -	return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
> +		return radix__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
> +	return hash__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
>   }
>   

I can't understand this change.

pgtable is a pointer to a page table, and you want to replace it to 
something that returns a pointer to a struct page, how can it work ?

Christophe

