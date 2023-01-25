Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7D67B17D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 12:36:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P21xd4sxlz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 22:36:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KrbKcd+b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P21wk4Hmgz3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 22:35:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KrbKcd+b;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P21wk2hbkz4xwq;
	Wed, 25 Jan 2023 22:35:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674646518;
	bh=sBbEH3R8XvHXdKubCIYOeRh5RIgAd3Ydx2rqAfZJjzY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KrbKcd+bkGEzJxM2pgSSfM7bXhnKWm7vFOJsp0u+thAfRA6aa4XADejSHAZ5xL7Sg
	 Sx/xWbZPbSPKfJ6epcSNzIsqgmDwr1rIkYfiUKUApUxw2DgXykzhZpdQ+oHD9L+8Yv
	 Eqc5Vyn8tTCcPH5mWxrSxkvPmsEAfUMU+GJQ8uPQDIXNhAcmwoGK141xL+1TBFXhKy
	 D4uVEfPgxhiGQp+H3Wu+nPyiP9IXqUQgB4RCwYguJJ99Z/fNzTByslKD5UtwLgzdJZ
	 EpMoqpBJcNL79/9aonsKRxXGZzyeLSEizCM7oVqOen0DNrmqZkpnYw7AAIdLCnrMxq
	 uCxdbFs+lGvTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/tlb: Remove BUILD_BUG for book3s/32/tlbflush.h
 local_flush_tlb_page_psize
In-Reply-To: <20230124215424.9068-1-bgray@linux.ibm.com>
References: <20230124215424.9068-1-bgray@linux.ibm.com>
Date: Wed, 25 Jan 2023 22:35:17 +1100
Message-ID: <87sffyq22y.fsf@mpe.ellerman.id.au>
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
Cc: kernel test robot <lkp@intel.com>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Gray <bgray@linux.ibm.com> writes:
> Converts the BUILD_BUG to a WARN to allow building with a low/unoptimised
> compiler.
>
> The original expectation was that a compiler would see that the only
> usage of this function was in a function that is only called behind
> radix-only guards. And it worked this way on GCC. It seems Clang does
> not optimise away this call however, so thinks the function may be
> invoked and triggers the build bug as reported by the kernel test robot.
>
> https://lore.kernel.org/llvm/202301212348.eDkowvfF-lkp@intel.com
>
> This fix converts the build bug to a warning to allow builds without
> relying on particular compiler optimisation behaviours. The warning is
> not rate limited because this implementation should still never be called
> as-is, and anyone who might invoke it might appreciate it being very
> obvious that it's not behaving as expected.
>
> Fixes: 274d842fa1ef ("powerpc/tlb: Add local flush for page given mm_struct and psize")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/32/tlbflush.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> index 4be572908124..675196884640 100644
> --- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> @@ -2,7 +2,7 @@
>  #ifndef _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
>  #define _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
>  
> -#include <linux/build_bug.h>
> +#include <linux/bug.h>
>  
>  #define MMU_NO_CONTEXT      (0)
>  /*
> @@ -80,7 +80,7 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>  static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
>  					      unsigned long vmaddr, int psize)
>  {
> -	BUILD_BUG();
> +	WARN(1, "Unimplemented local TLB flush with psize");

Can't we just fall back to flush_tlb_page(vma, vmaddr)?

I'd guess those CPUs can't flush based on page size anyway.

cheers
