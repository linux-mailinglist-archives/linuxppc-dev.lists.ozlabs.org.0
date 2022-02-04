Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9125F4A9322
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 05:45:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqjdb2GDhz3cPP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 15:45:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QNjc1K9R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QNjc1K9R; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqjd11ZCWz2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 15:44:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB311B835E7;
 Fri,  4 Feb 2022 04:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F14C004E1;
 Fri,  4 Feb 2022 04:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643949887;
 bh=Da4vBP/4mmZmI7+4TG2/E3AHX4y3BvIm0B1N+u0ghYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QNjc1K9RtlOkJ09er7mXypbuACrDB/Yb3dc1HvAxjaXNNFwXrNSuKmG+F87gE2KlJ
 F95U57FlBPad0SpI1p6GLkiYz9KL/hnm5ClQ9HaCClBygzDUMnBzzOVLRiT7QBS3es
 aWydb7QcIMKadvgifDZpKws3ZHwbcJJ8Wr4EAiQdQAk5c9i1cKb2UCCh7pGFL+iRvN
 ui4gsVFXgh9H7BSx+ckSvFHj4UZ20nAaDOIneB7UpmpG/31/h/k9YSFrGODTB5WyOh
 dkc+WSPJZ3Omm+S8Vb4Rr1ApbiijkhMpDeQE9Lyrv5T4LmOuWebHHxRCOzI4w30T9+
 mSPd5GL7IGrOA==
Date: Fri, 4 Feb 2022 06:44:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [RFC V1 04/31] powerpc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <YfyvNphICBzoVfNs@kernel.org>
References: <1643029028-12710-1-git-send-email-anshuman.khandual@arm.com>
 <1643029028-12710-5-git-send-email-anshuman.khandual@arm.com>
 <Yfwbz5qu20bjFZOP@kernel.org>
 <46e15116-78fb-e6fe-e0f0-fe776f9348c3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46e15116-78fb-e6fe-e0f0-fe776f9348c3@arm.com>
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
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 04, 2022 at 08:27:37AM +0530, Anshuman Khandual wrote:
> 
> On 2/3/22 11:45 PM, Mike Rapoport wrote:
> > On Mon, Jan 24, 2022 at 06:26:41PM +0530, Anshuman Khandual wrote:
> >> This defines and exports a platform specific custom vm_get_page_prot() via
> >> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> >> macros can be dropped which are no longer needed. While here, this also
> >> localizes arch_vm_get_page_prot() as powerpc_vm_get_page_prot().
> >>
> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> Cc: Paul Mackerras <paulus@samba.org>
> >> Cc: linuxppc-dev@lists.ozlabs.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >> ---
> >>  arch/powerpc/Kconfig               |  1 +
> >>  arch/powerpc/include/asm/mman.h    |  3 +-
> >>  arch/powerpc/include/asm/pgtable.h | 19 ------------
> >>  arch/powerpc/mm/mmap.c             | 47 ++++++++++++++++++++++++++++++
> >>  4 files changed, 49 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> >> index b779603978e1..ddb4a3687c05 100644
> >> --- a/arch/powerpc/Kconfig
> >> +++ b/arch/powerpc/Kconfig
> >> @@ -135,6 +135,7 @@ config PPC
> >>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
> >>  	select ARCH_HAS_UACCESS_FLUSHCACHE
> >>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
> >> +	select ARCH_HAS_VM_GET_PAGE_PROT
> >>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> >>  	select ARCH_KEEP_MEMBLOCK
> >>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> >> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
> >> index 7cb6d18f5cd6..7b10c2031e82 100644
> >> --- a/arch/powerpc/include/asm/mman.h
> >> +++ b/arch/powerpc/include/asm/mman.h
> >> @@ -24,7 +24,7 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> >>  }
> >>  #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
> >>  
> >> -static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
> >> +static inline pgprot_t powerpc_vm_get_page_prot(unsigned long vm_flags)
> >>  {
> >>  #ifdef CONFIG_PPC_MEM_KEYS
> >>  	return (vm_flags & VM_SAO) ?
> >> @@ -34,7 +34,6 @@ static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
> >>  	return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
> >>  #endif
> >>  }
> >> -#define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags)
> >>  
> >>  static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
> >>  {
> >> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> >> index d564d0ecd4cd..3cbb6de20f9d 100644
> >> --- a/arch/powerpc/include/asm/pgtable.h
> >> +++ b/arch/powerpc/include/asm/pgtable.h
> >> @@ -20,25 +20,6 @@ struct mm_struct;
> >>  #include <asm/nohash/pgtable.h>
> >>  #endif /* !CONFIG_PPC_BOOK3S */
> >>  
> >> -/* Note due to the way vm flags are laid out, the bits are XWR */
> >> -#define __P000	PAGE_NONE
> >> -#define __P001	PAGE_READONLY
> >> -#define __P010	PAGE_COPY
> >> -#define __P011	PAGE_COPY
> >> -#define __P100	PAGE_READONLY_X
> >> -#define __P101	PAGE_READONLY_X
> >> -#define __P110	PAGE_COPY_X
> >> -#define __P111	PAGE_COPY_X
> >> -
> >> -#define __S000	PAGE_NONE
> >> -#define __S001	PAGE_READONLY
> >> -#define __S010	PAGE_SHARED
> >> -#define __S011	PAGE_SHARED
> >> -#define __S100	PAGE_READONLY_X
> >> -#define __S101	PAGE_READONLY_X
> >> -#define __S110	PAGE_SHARED_X
> >> -#define __S111	PAGE_SHARED_X
> >> -
> >>  #ifndef __ASSEMBLY__
> >>  
> >>  #ifndef MAX_PTRS_PER_PGD
> >> diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
> >> index c475cf810aa8..7f05e7903bd2 100644
> >> --- a/arch/powerpc/mm/mmap.c
> >> +++ b/arch/powerpc/mm/mmap.c
> >> @@ -254,3 +254,50 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
> >>  		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
> >>  	}
> >>  }
> >> +
> >> +static inline pgprot_t __vm_get_page_prot(unsigned long vm_flags)
> >> +{
> >> +	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> >> +	case VM_NONE:
> >> +		return PAGE_NONE;
> >> +	case VM_READ:
> >> +		return PAGE_READONLY;
> >> +	case VM_WRITE:
> >> +		return PAGE_COPY;
> >> +	case VM_READ | VM_WRITE:
> >> +		return PAGE_COPY;
> >> +	case VM_EXEC:
> >> +		return PAGE_READONLY_X;
> >> +	case VM_EXEC | VM_READ:
> >> +		return PAGE_READONLY_X;
> >> +	case VM_EXEC | VM_WRITE:
> >> +		return PAGE_COPY_X;
> >> +	case VM_EXEC | VM_READ | VM_WRITE:
> >> +		return PAGE_COPY_X;
> >> +	case VM_SHARED:
> >> +		return PAGE_NONE;
> >> +	case VM_SHARED | VM_READ:
> >> +		return PAGE_READONLY;
> >> +	case VM_SHARED | VM_WRITE:
> >> +		return PAGE_SHARED;
> >> +	case VM_SHARED | VM_READ | VM_WRITE:
> >> +		return PAGE_SHARED;
> >> +	case VM_SHARED | VM_EXEC:
> >> +		return PAGE_READONLY_X;
> >> +	case VM_SHARED | VM_EXEC | VM_READ:
> >> +		return PAGE_READONLY_X;
> >> +	case VM_SHARED | VM_EXEC | VM_WRITE:
> >> +		return PAGE_SHARED_X;
> >> +	case VM_SHARED | VM_EXEC | VM_READ | VM_WRITE:
> >> +		return PAGE_SHARED_X;
> >> +	default:
> >> +		BUILD_BUG();
> >> +	}
> >> +}
> >> +
> >> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
> >> +{
> >> +	return __pgprot(pgprot_val(__vm_get_page_prot(vm_flags)) |
> >> +	       pgprot_val(powerpc_vm_get_page_prot(vm_flags)));
> > Any reason to keep powerpc_vm_get_page_prot() rather than open code it
> > here?
> > 
> > This applies to other architectures that implement arch_vm_get_page_prot()
> > and/or arch_filter_pgprot() as well.
> 
> Just to minimize the code churn ! But I will be happy to open code them
> here (and in other platforms) if that will be preferred.

I think this will be clearer because all the processing will be at one place.
Besides, this way include/asm/pgtable.h becomes shorter and less crowded.

-- 
Sincerely yours,
Mike.
