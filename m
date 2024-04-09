Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E089D4F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 10:57:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=msOkz6Vj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDKbZ529Qz3vYj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 18:57:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=msOkz6Vj;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDKZs1wbSz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 18:56:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712653012;
	bh=rA9AK049F3IGs47StGGKCr+FtqU4g3CoryIwwmMomeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=msOkz6VjlCQK6oln6GUJUGTDCSBfzOeZfQi9EsVwNoLRa5ix9kExqStoAQ5AprBqk
	 34LTS1WhqXj3hftPvoUBI1x1Zp/u3pVOJDpZPQbXLnKGX2vomfk1kAqaFpQo8cRhPE
	 stQOnXX7nAI0w9OrzO3M5ey4vEF08V5p2tARnvjjWvFF+jrya8UqrwRzTnxYKU7da3
	 Rm2vrdr/se1lJ6uQvcH5wFGlTbFEnrSPqjZu0rfJ3o8U7jBvaQRGYxGwYHE5cunhCX
	 lCI7cehVn6h6m3BvJLCepBZ4OYS8I/Nfcl0L6KVmZN5ybtAGzhS1vIWQB5uyF52/bT
	 a76+x/QpVimEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VDKZp4Mb0z4wnr;
	Tue,  9 Apr 2024 18:56:50 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, akpm@linux-foundation.org
Subject: Re: [PATCH v2 4/7] powerpc: mm: accelerate pagefault when badaccess
In-Reply-To: <20240403083805.1818160-5-wangkefeng.wang@huawei.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403083805.1818160-5-wangkefeng.wang@huawei.com>
Date: Tue, 09 Apr 2024 18:56:49 +1000
Message-ID: <871q7ec3se.fsf@mail.lhotse>
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
Cc: x86@kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Russell King <linux@armlinux.org.uk>, surenb@google.com, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kefeng Wang <wangkefeng.wang@huawei.com> writes:
> The access_[pkey]_error() of vma already checked under per-VMA lock, if
> it is a bad access, directly handle error, no need to retry with mmap_lock
> again. In order to release the correct lock, pass the mm_struct into
> bad_access_pkey()/bad_access(), if mm is NULL, release vma lock, or
> release mmap_lock. Since the page faut is handled under per-VMA lock,
> count it as a vma lock event with VMA_LOCK_SUCCESS.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/powerpc/mm/fault.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)

I thought there might be a nicer way to do this, plumbing the mm and vma
down through all those levels is a bit of a pain (vma->vm_mm exists
after all).

But I couldn't come up with anything obviously better, without doing
lots of refactoring first, which would be a pain to integrate into this
series.

So anyway, if the series goes ahead:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 53335ae21a40..215690452495 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -71,23 +71,26 @@ static noinline int bad_area_nosemaphore(struct pt_regs *regs, unsigned long add
>  	return __bad_area_nosemaphore(regs, address, SEGV_MAPERR);
>  }
>  
> -static int __bad_area(struct pt_regs *regs, unsigned long address, int si_code)
> +static int __bad_area(struct pt_regs *regs, unsigned long address, int si_code,
> +		      struct mm_struct *mm, struct vm_area_struct *vma)
>  {
> -	struct mm_struct *mm = current->mm;
>  
>  	/*
>  	 * Something tried to access memory that isn't in our memory map..
>  	 * Fix it, but check if it's kernel or user first..
>  	 */
> -	mmap_read_unlock(mm);
> +	if (mm)
> +		mmap_read_unlock(mm);
> +	else
> +		vma_end_read(vma);
>  
>  	return __bad_area_nosemaphore(regs, address, si_code);
>  }
>  
>  static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
> +				    struct mm_struct *mm,
>  				    struct vm_area_struct *vma)
>  {
> -	struct mm_struct *mm = current->mm;
>  	int pkey;
>  
>  	/*
> @@ -109,7 +112,10 @@ static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
>  	 */
>  	pkey = vma_pkey(vma);
>  
> -	mmap_read_unlock(mm);
> +	if (mm)
> +		mmap_read_unlock(mm);
> +	else
> +		vma_end_read(vma);
>  
>  	/*
>  	 * If we are in kernel mode, bail out with a SEGV, this will
> @@ -124,9 +130,10 @@ static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
>  	return 0;
>  }
>  
> -static noinline int bad_access(struct pt_regs *regs, unsigned long address)
> +static noinline int bad_access(struct pt_regs *regs, unsigned long address,
> +			       struct mm_struct *mm, struct vm_area_struct *vma)
>  {
> -	return __bad_area(regs, address, SEGV_ACCERR);
> +	return __bad_area(regs, address, SEGV_ACCERR, mm, vma);
>  }
>  
>  static int do_sigbus(struct pt_regs *regs, unsigned long address,
> @@ -479,13 +486,13 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>  
>  	if (unlikely(access_pkey_error(is_write, is_exec,
>  				       (error_code & DSISR_KEYFAULT), vma))) {
> -		vma_end_read(vma);
> -		goto lock_mmap;
> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +		return bad_access_pkey(regs, address, NULL, vma);
>  	}
>  
>  	if (unlikely(access_error(is_write, is_exec, vma))) {
> -		vma_end_read(vma);
> -		goto lock_mmap;
> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +		return bad_access(regs, address, NULL, vma);
>  	}
>  
>  	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
> @@ -521,10 +528,10 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>  
>  	if (unlikely(access_pkey_error(is_write, is_exec,
>  				       (error_code & DSISR_KEYFAULT), vma)))
> -		return bad_access_pkey(regs, address, vma);
> +		return bad_access_pkey(regs, address, mm, vma);
>  
>  	if (unlikely(access_error(is_write, is_exec, vma)))
> -		return bad_access(regs, address);
> +		return bad_access(regs, address, mm, vma);
>  
>  	/*
>  	 * If for any reason at all we couldn't handle the fault,
> -- 
> 2.27.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
