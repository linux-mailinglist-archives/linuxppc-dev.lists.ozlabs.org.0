Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B73B195D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 13:53:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G91r55FyYz30CX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 21:53:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=WDaeq+Ms;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=WDaeq+Ms; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G91qb4Wrgz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 21:53:12 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso3705705pjv.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PLD4E/3tzCkBjKoh4yAZoZOFlc86vB66N+vtNE57Pd8=;
 b=WDaeq+Ms7FnKXkfh4e1MsS+w7PZts3YpaiKSDTRQun8B/qeoEqQHmrVa+TkK/0ZG5c
 xSM+ue8RUA84nv1/+GKuNeYVWFV5zeQ8oOfegNXCWvNkiCsLNbDVk+zq6ea9By5kTTDi
 fZm6hOcoWI27m9JuD7i8kTQlScBIOXB/Tqd4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PLD4E/3tzCkBjKoh4yAZoZOFlc86vB66N+vtNE57Pd8=;
 b=ZBom4r5aE1Soocjirm6BAuxp3ycciJHT4yA5KnwQCA0p/Gs5gvAJxsN9WC28r5uGK4
 H8pUHuKu7CfbaLVGrWLy7NdAYiNSaaD1YFwBQ5bSxhKCcbQHpzk7dQoFKix61zIwdgBg
 47MbwjeaTwv6qx0RmHHLN9sP+07L7WdhhHc/wtRoZY+YtTdSSd5b/icfBFRWpP/XDw0N
 ap3K4CsxGAUVdUwAaZd3NBnRwyLBZjqv9WS6lJNit52Et6QVR55afjjGW0MahOX6WkRR
 1q58dGdSzwn4LCM8ha4E/PSI3RFnnh0WLOqG/T+w/0Rg87Tm4GnH/4p5Hg0etAnQyX2x
 0h2g==
X-Gm-Message-State: AOAM532tw2lwcgpgLjEFqqPIVcu8sWI7YzyLnpUp4E8m73ThC4R3Hh5A
 JjQut210Dgct/EKox2OK8Em4Tg==
X-Google-Smtp-Source: ABdhPJyg/Sc4seJqwWH6MvLOgnvU0HQ65y+xbuQvokGzICog5wp0dOB27dbeMVr6RZ7Iecx7Iv4stw==
X-Received: by 2002:a17:90a:5504:: with SMTP id
 b4mr9133455pji.208.1624449189716; 
 Wed, 23 Jun 2021 04:53:09 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id 30sm5246322pjz.42.2021.06.23.04.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 04:53:09 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/3] powerpc: Define swapper_pg_dir[] in C
In-Reply-To: <5e3f1b8a4695c33ccc80aa3870e016bef32b85e1.1623063174.git.christophe.leroy@csgroup.eu>
References: <5838caffa269e0957c5a50cc85477876220298b0.1623063174.git.christophe.leroy@csgroup.eu>
 <5e3f1b8a4695c33ccc80aa3870e016bef32b85e1.1623063174.git.christophe.leroy@csgroup.eu>
Date: Wed, 23 Jun 2021 21:53:05 +1000
Message-ID: <871r8siyqm.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

This breaks booting a radix KVM guest with 4k pages for me:

make pseries_le_defconfig
scripts/config -d CONFIG_PPC_64K_PAGES
scripts/config -e CONFIG_PPC_4K_PAGES
make vmlinux
sudo qemu-system-ppc64 -enable-kvm -M pseries -m 1G -nographic -vga none -smp 4 -cpu host -kernel vmlinux

Boot hangs after printing 'Booting Linux via __start()' and qemu's 'info
registers' reports that it's stuck at the instruction fetch exception.

My host is Power9, 64k page size radix, and
gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34

Kind regards,
Daniel

> Don't duplicate swapper_pg_dir[] in each platform's head.S
>
> Define it in mm/pgtable.c
>
> Define MAX_PTRS_PER_PGD because on book3s/64 PTRS_PER_PGD is
> not a constant.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +++
>  arch/powerpc/include/asm/pgtable.h           |  4 ++++
>  arch/powerpc/kernel/asm-offsets.c            |  5 -----
>  arch/powerpc/kernel/head_40x.S               | 11 -----------
>  arch/powerpc/kernel/head_44x.S               | 17 +----------------
>  arch/powerpc/kernel/head_64.S                | 15 ---------------
>  arch/powerpc/kernel/head_8xx.S               | 12 ------------
>  arch/powerpc/kernel/head_book3s_32.S         | 11 -----------
>  arch/powerpc/kernel/head_fsl_booke.S         | 12 ------------
>  arch/powerpc/mm/pgtable.c                    |  2 ++
>  10 files changed, 10 insertions(+), 82 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index a666d561b44d..4d9941b2fe51 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -232,6 +232,9 @@ extern unsigned long __pmd_frag_size_shift;
>  #define PTRS_PER_PUD	(1 << PUD_INDEX_SIZE)
>  #define PTRS_PER_PGD	(1 << PGD_INDEX_SIZE)
>  
> +#define MAX_PTRS_PER_PGD	(1 << (H_PGD_INDEX_SIZE > RADIX_PGD_INDEX_SIZE ? \
> +				       H_PGD_INDEX_SIZE : RADIX_PGD_INDEX_SIZE))
> +
>  /* PMD_SHIFT determines what a second-level page table entry can map */
>  #define PMD_SHIFT	(PAGE_SHIFT + PTE_INDEX_SIZE)
>  #define PMD_SIZE	(1UL << PMD_SHIFT)
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index c6a676714f04..b9c8641654f4 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -41,6 +41,10 @@ struct mm_struct;
>  
>  #ifndef __ASSEMBLY__
>  
> +#ifndef MAX_PTRS_PER_PGD
> +#define MAX_PTRS_PER_PGD PTRS_PER_PGD
> +#endif
> +
>  /* Keep these as a macros to avoid include dependency mess */
>  #define pte_page(x)		pfn_to_page(pte_pfn(x))
>  #define mk_pte(page, pgprot)	pfn_pte(page_to_pfn(page), (pgprot))
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index 0480f4006e0c..f1b6ff14c8a0 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -361,11 +361,6 @@ int main(void)
>  	DEFINE(BUG_ENTRY_SIZE, sizeof(struct bug_entry));
>  #endif
>  
> -#ifdef CONFIG_PPC_BOOK3S_64
> -	DEFINE(PGD_TABLE_SIZE, (sizeof(pgd_t) << max(RADIX_PGD_INDEX_SIZE, H_PGD_INDEX_SIZE)));
> -#else
> -	DEFINE(PGD_TABLE_SIZE, PGD_TABLE_SIZE);
> -#endif
>  	DEFINE(PTE_SIZE, sizeof(pte_t));
>  
>  #ifdef CONFIG_KVM
> diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
> index 92b6c7356161..7d72ee5ab387 100644
> --- a/arch/powerpc/kernel/head_40x.S
> +++ b/arch/powerpc/kernel/head_40x.S
> @@ -701,14 +701,3 @@ _GLOBAL(abort)
>          mfspr   r13,SPRN_DBCR0
>          oris    r13,r13,DBCR0_RST_SYSTEM@h
>          mtspr   SPRN_DBCR0,r13
> -
> -/* We put a few things here that have to be page-aligned. This stuff
> - * goes at the beginning of the data segment, which is page-aligned.
> - */
> -	.data
> -	.align	12
> -	.globl	sdata
> -sdata:
> -	.globl	swapper_pg_dir
> -swapper_pg_dir:
> -	.space	PGD_TABLE_SIZE
> diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
> index e037eb615757..ddc978a2d381 100644
> --- a/arch/powerpc/kernel/head_44x.S
> +++ b/arch/powerpc/kernel/head_44x.S
> @@ -1233,23 +1233,8 @@ head_start_common:
>  	isync
>  	blr
>  
> -/*
> - * We put a few things here that have to be page-aligned. This stuff
> - * goes at the beginning of the data segment, which is page-aligned.
> - */
> -	.data
> -	.align	PAGE_SHIFT
> -	.globl	sdata
> -sdata:
> -
> -/*
> - * To support >32-bit physical addresses, we use an 8KB pgdir.
> - */
> -	.globl	swapper_pg_dir
> -swapper_pg_dir:
> -	.space	PGD_TABLE_SIZE
> -
>  #ifdef CONFIG_SMP
> +	.data
>  	.align	12
>  temp_boot_stack:
>  	.space	1024
> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> index 730838c7ca39..79f2d1e61abd 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -997,18 +997,3 @@ start_here_common:
>  0:	trap
>  	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
>  	.previous
> -
> -/*
> - * We put a few things here that have to be page-aligned.
> - * This stuff goes at the beginning of the bss, which is page-aligned.
> - */
> -	.section ".bss"
> -/*
> - * pgd dir should be aligned to PGD_TABLE_SIZE which is 64K.
> - * We will need to find a better way to fix this
> - */
> -	.align	16
> -
> -	.globl	swapper_pg_dir
> -swapper_pg_dir:
> -	.space	PGD_TABLE_SIZE
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
> index 5ce42dfac061..9bdb95f5694f 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -786,15 +786,3 @@ _GLOBAL(mmu_pin_tlb)
>  	mtspr	SPRN_SRR1, r10
>  	mtspr	SPRN_SRR0, r11
>  	rfi
> -
> -/*
> - * We put a few things here that have to be page-aligned.
> - * This stuff goes at the beginning of the data segment,
> - * which is page-aligned.
> - */
> -	.data
> -	.globl	sdata
> -sdata:
> -	.globl	swapper_pg_dir
> -swapper_pg_dir:
> -	.space	PGD_TABLE_SIZE
> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
> index 79c744afc6b6..689c9d37f193 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -1266,18 +1266,7 @@ setup_usbgecko_bat:
>  	blr
>  #endif
>  
> -/*
> - * We put a few things here that have to be page-aligned.
> - * This stuff goes at the beginning of the data segment,
> - * which is page-aligned.
> - */
>  	.data
> -	.globl	sdata
> -sdata:
> -	.globl	swapper_pg_dir
> -swapper_pg_dir:
> -	.space	PGD_TABLE_SIZE
> -
>  /* Room for two PTE pointers, usually the kernel and current user pointers
>   * to their respective root page table.
>   */
> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
> index f33bc5a8e73e..0f9642f36b49 100644
> --- a/arch/powerpc/kernel/head_fsl_booke.S
> +++ b/arch/powerpc/kernel/head_fsl_booke.S
> @@ -1212,15 +1212,3 @@ _GLOBAL(restore_to_as0)
>  	*/
>  3:	mr	r3,r5
>  	bl	_start
> -
> -/*
> - * We put a few things here that have to be page-aligned. This stuff
> - * goes at the beginning of the data segment, which is page-aligned.
> - */
> -	.data
> -	.align	12
> -	.globl	sdata
> -sdata:
> -	.globl	swapper_pg_dir
> -swapper_pg_dir:
> -	.space	PGD_TABLE_SIZE
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 354611940118..1707ab580ee2 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -28,6 +28,8 @@
>  #include <asm/hugetlb.h>
>  #include <asm/pte-walk.h>
>  
> +pgd_t swapper_pg_dir[MAX_PTRS_PER_PGD] __page_aligned_bss;
> +
>  static inline int is_exec_fault(void)
>  {
>  	return current->thread.regs && TRAP(current->thread.regs) == 0x400;
> -- 
> 2.25.0
