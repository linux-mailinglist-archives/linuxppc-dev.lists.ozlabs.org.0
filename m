Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F97AB5AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:15:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r2KQI46M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rscmr4kkMz3cSg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 02:15:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r2KQI46M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsclw5BXNz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 02:14:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D5ACBCE2342;
	Fri, 22 Sep 2023 16:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A71C433C7;
	Fri, 22 Sep 2023 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695399254;
	bh=ghtojmtAqFRtX4PcgZLlC2VPw2Ttv8ZnkZD0uHf6G3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2KQI46MuFtdt7QHNa6AqgiJz/M5ENzMW7kPwq5MHDWzFycJ2+pY4u3MqsA9xu0nC
	 W/HNBy22Xw7JneqjviL2IaJu3dGzWLn16NZ5LDkp581LGZMdDZg4052edSPlLkbLHO
	 EwdDs5kw6QxWcMB8DPa5TapO2QHn2N4oQOpAikE02mi4L04UnKYumRRdcwACdUxhgT
	 xMQKjaY0zqYX4QHMGOi217/faMzXeE4+N/6foqQ34cnGlWvVCbUdZdJPU2NbwsyjUC
	 p3AMpsc8yh3FbtfuQO9iVhIkFE9bRCE4VRqafiuyTvaj8qLItH92nbbD52ZVQBMP1Q
	 LphK+HBo/3yDg==
Date: Fri, 22 Sep 2023 17:14:04 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v2 2/2] arm64: hugetlb: Fix set_huge_pte_at() to work
 with all swap entries
Message-ID: <20230922161404.GA23332@willie-the-truck>
References: <20230922115804.2043771-1-ryan.roberts@arm.com>
 <20230922115804.2043771-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922115804.2043771-3-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vge
 r.kernel.org, stable@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 12:58:04PM +0100, Ryan Roberts wrote:
> When called with a swap entry that does not embed a PFN (e.g.
> PTE_MARKER_POISONED or PTE_MARKER_UFFD_WP), the previous implementation
> of set_huge_pte_at() would either cause a BUG() to fire (if
> CONFIG_DEBUG_VM is enabled) or cause a dereference of an invalid address
> and subsequent panic.
> 
> arm64's huge pte implementation supports multiple huge page sizes, some
> of which are implemented in the page table with multiple contiguous
> entries. So set_huge_pte_at() needs to work out how big the logical pte
> is, so that it can also work out how many physical ptes (or pmds) need
> to be written. It previously did this by grabbing the folio out of the
> pte and querying its size.
> 
> However, there are cases when the pte being set is actually a swap
> entry. But this also used to work fine, because for huge ptes, we only
> ever saw migration entries and hwpoison entries. And both of these types
> of swap entries have a PFN embedded, so the code would grab that and
> everything still worked out.
> 
> But over time, more calls to set_huge_pte_at() have been added that set
> swap entry types that do not embed a PFN. And this causes the code to go
> bang. The triggering case is for the uffd poison test, commit
> 99aa77215ad0 ("selftests/mm: add uffd unit test for UFFDIO_POISON"),
> which causes a PTE_MARKER_POISONED swap entry to be set, coutesey of
> commit 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for
> hugetlbfs") - added in v6.5-rc7. Although review shows that there are
> other call sites that set PTE_MARKER_UFFD_WP (which also has no PFN),
> these don't trigger on arm64 because arm64 doesn't support UFFD WP.
> 
> Arguably, the root cause is really due to commit 18f3962953e4 ("mm:
> hugetlb: kill set_huge_swap_pte_at()"), which aimed to simplify the
> interface to the core code by removing set_huge_swap_pte_at() (which
> took a page size parameter) and replacing it with calls to
> set_huge_pte_at() where the size was inferred from the folio, as
> descibed above. While that commit didn't break anything at the time, it
> did break the interface because it couldn't handle swap entries without
> PFNs. And since then new callers have come along which rely on this
> working. But given the brokeness is only observable after commit
> 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs"),
> that one gets the Fixes tag.
> 
> Now that we have modified the set_huge_pte_at() interface to pass the
> huge page size in the previous patch, we can trivially fix this issue.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
> Cc: <stable@vger.kernel.org> # 6.5+
> ---
>  arch/arm64/mm/hugetlbpage.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index a7f8c8db3425..13fd592228b1 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -241,13 +241,6 @@ static void clear_flush(struct mm_struct *mm,
>  	flush_tlb_range(&vma, saddr, addr);
>  }
>  
> -static inline struct folio *hugetlb_swap_entry_to_folio(swp_entry_t entry)
> -{
> -	VM_BUG_ON(!is_migration_entry(entry) && !is_hwpoison_entry(entry));
> -
> -	return page_folio(pfn_to_page(swp_offset_pfn(entry)));
> -}
> -
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  			    pte_t *ptep, pte_t pte, unsigned long sz)
>  {
> @@ -257,13 +250,10 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  	unsigned long pfn, dpfn;
>  	pgprot_t hugeprot;
>  
> -	if (!pte_present(pte)) {
> -		struct folio *folio;
> -
> -		folio = hugetlb_swap_entry_to_folio(pte_to_swp_entry(pte));
> -		ncontig = num_contig_ptes(folio_size(folio), &pgsize);
> +	ncontig = num_contig_ptes(sz, &pgsize);
>  
> -		for (i = 0; i < ncontig; i++, ptep++)
> +	if (!pte_present(pte)) {
> +		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
>  			set_pte_at(mm, addr, ptep, pte);

Our set_pte_at() doesn't use 'addr' for anything and the old code didn't
even bother to increment it here! I'm fine adding that, but it feels
unrelated to the issue which this patch is actually fixing.

Either way:

Acked-by: Will Deacon <will@kernel.org>

Will
