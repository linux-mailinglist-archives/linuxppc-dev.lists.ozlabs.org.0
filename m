Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C69DE17B55A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 05:19:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YZBY14PTzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 15:19:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YZ8t0SR3zDqtN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 15:17:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=WHwpFimr; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48YZ8s3xz3z9sPK;
 Fri,  6 Mar 2020 15:17:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1583468269; bh=W55Sru9TkKAtFaLpWAFMN0S9NEayoaEaKhmZXBqRDDA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WHwpFimrGBrBl/SgH+b3ZBezTPh1zoTsSI2Yams6fLFVQ0KLwlq3xTLTrZrbs59qJ
 R2ywM8+H+hghzR3GzalFOXBlJXcYPsfYTfFyb1GLsq1GwBLcASFzgAdRiQ2LAV5bPm
 btuSsSoLLDJdIWX4qPbAADcifFr492/vU0+x/n2hicE4yD2JqQQG8PGcAkEBFDRqD2
 eA/z7HDjTTalxhNgRqvaAvEC/Fy+8njaL7mDFctk+I+p2htTSBs56CXyV10XP4ZvGU
 gyHD40LW80OlWIDWtPI6/7az5jL0OnfB+x6bkfwhcM7h8FKWdhZynC3ltdnm9hw0Cn
 /8CgUcYV2alRw==
Date: Fri, 6 Mar 2020 15:17:48 +1100
From: Anton Blanchard <anton@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/radix: Fix !SMP build
Message-ID: <20200306151748.108e555d@kryten.localdomain>
In-Reply-To: <20200302010410.2957362-1-npiggin@gmail.com>
References: <20200302010410.2957362-1-npiggin@gmail.com>
X-Mailer: Mutt/1.8.0 (2017-02-23)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Nick,

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Anton Blanchard <anton@ozlabs.org>

> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 1 +
>  arch/powerpc/mm/book3s64/radix_tlb.c     | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c
> b/arch/powerpc/mm/book3s64/radix_pgtable.c index
> dd1bea45325c..2a9a0cd79490 100644 ---
> a/arch/powerpc/mm/book3s64/radix_pgtable.c +++
> b/arch/powerpc/mm/book3s64/radix_pgtable.c @@ -26,6 +26,7 @@
>  #include <asm/firmware.h>
>  #include <asm/powernv.h>
>  #include <asm/sections.h>
> +#include <asm/smp.h>
>  #include <asm/trace.h>
>  #include <asm/uaccess.h>
>  #include <asm/ultravisor.h>
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c
> b/arch/powerpc/mm/book3s64/radix_tlb.c index
> 03f43c924e00..758ade2c2b6e 100644 ---
> a/arch/powerpc/mm/book3s64/radix_tlb.c +++
> b/arch/powerpc/mm/book3s64/radix_tlb.c @@ -587,6 +587,11 @@ void
> radix__local_flush_all_mm(struct mm_struct *mm) preempt_enable();
>  }
>  EXPORT_SYMBOL(radix__local_flush_all_mm);
> +
> +static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
> +{
> +	radix__local_flush_all_mm(mm);
> +}
>  #endif /* CONFIG_SMP */
>  
>  void radix__local_flush_tlb_page_psize(struct mm_struct *mm,
> unsigned long vmaddr, @@ -777,7 +782,7 @@ void
> radix__flush_tlb_page(struct vm_area_struct *vma, unsigned long
> vmaddr) EXPORT_SYMBOL(radix__flush_tlb_page); 
>  #else /* CONFIG_SMP */
> -#define radix__flush_all_mm radix__local_flush_all_mm
> +static inline void exit_flush_lazy_tlbs(struct mm_struct *mm) { }
>  #endif /* CONFIG_SMP */
>  
>  static void do_tlbiel_kernel(void *info)

