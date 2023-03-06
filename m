Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C1F6AD2AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 00:12:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVvW129F4z3f5m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 10:12:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=G+Sab/KI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVvV736qCz3c41
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 10:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=G+Sab/KI;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PVvV227K5z4wgq;
	Tue,  7 Mar 2023 10:11:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678144317;
	bh=Y3ZQe1v9yNGZGVZM7F5FvSpbccPl60HdWh6Jlu25Uj4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G+Sab/KI7GAdy0Diebk6cQ/coHwcVMTqNmdTfQxYLnOVvsIndv9rl72OPozMBlYMe
	 Va4LySAlFrcJ4TuVE14hxLaQ9JYQIiR9AN3z5EmgKmEhqBM84PEO4ZbGo1ccID9Ebm
	 olatYOdWLf41Dqaq+qy1i05gpFdoTdeJAOtcfeC306+ClAa8E4O8DK+nUSlu+njFEP
	 3auPTqQhaABfq8gsiySo+KUowhvu4Lg+vCfJuZixOxHqq5aDNDftd1HYeHD4cJAMK3
	 cCAJXBNKuC0w0B7clhHf+fYnXLGSBv3I9wXVnnec+nGJu+XSzbMXBLpNjTD7lQWVdh
	 VlwMZSuOylJmw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: add PTE pointer parameter to
 flush_tlb_fix_spurious_fault()
In-Reply-To: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
References: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
Date: Tue, 07 Mar 2023 10:11:53 +1100
Message-ID: <87mt4p1nly.fsf@mpe.ellerman.id.au>
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
Cc: linux-x86 <x86@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, linux-mips <linux-mips@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-power <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gerald Schaefer <gerald.schaefer@linux.ibm.com> writes:
> s390 can do more fine-grained handling of spurious TLB protection faults,
> when there also is the PTE pointer available.
>
> Therefore, pass on the PTE pointer to flush_tlb_fix_spurious_fault() as
> an additional parameter.
>
> This will add no functional change to other architectures, but those with
> private flush_tlb_fix_spurious_fault() implementations need to be made
> aware of the new parameter.
>
> Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---
>  arch/arm64/include/asm/pgtable.h              |  2 +-
>  arch/mips/include/asm/pgtable.h               |  3 ++-
>  arch/powerpc/include/asm/book3s/64/tlbflush.h |  3 ++-
>  arch/s390/include/asm/pgtable.h               | 12 +++++++-----
>  arch/x86/include/asm/pgtable.h                |  2 +-
>  include/linux/pgtable.h                       |  2 +-
>  mm/memory.c                                   |  3 ++-
>  mm/pgtable-generic.c                          |  2 +-
>  8 files changed, 17 insertions(+), 12 deletions(-)
...
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> index 2bbc0fcce04a..ff7f0ee179e5 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> @@ -121,7 +121,8 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>  
>  #define flush_tlb_fix_spurious_fault flush_tlb_fix_spurious_fault
>  static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
> -						unsigned long address)
> +						unsigned long address,
> +						pte_t *ptep)
>  {
>  	/*
>  	 * Book3S 64 does not require spurious fault flushes because the PTE

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
