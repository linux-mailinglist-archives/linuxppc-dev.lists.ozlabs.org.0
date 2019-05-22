Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BEA270A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 22:14:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458P3y4GbgzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 06:14:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=iki.fi
 (client-ip=62.142.5.108; helo=emh02.mail.saunalahti.fi;
 envelope-from=aaro.koskinen@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=iki.fi
Received: from emh02.mail.saunalahti.fi (emh02.mail.saunalahti.fi
 [62.142.5.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458P2j0xq4zDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 06:13:16 +1000 (AEST)
Received: from darkstar.musicnaut.iki.fi (85-76-4-80-nat.elisa-mobile.fi
 [85.76.4.80])
 by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 9F532200C1;
 Wed, 22 May 2019 23:13:10 +0300 (EEST)
Date: Wed, 22 May 2019 23:13:10 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [BISECTED] kexec regression on PowerBook G4
Message-ID: <20190522201310.GB456@darkstar.musicnaut.iki.fi>
References: <20190521221859.GC3621@darkstar.musicnaut.iki.fi>
 <90f3557b-400b-60b5-9ff8-d5605adeee79@c-s.fr>
 <a8f8a0d7-1737-4c83-4587-8d4dc87c3ecb@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8f8a0d7-1737-4c83-4587-8d4dc87c3ecb@c-s.fr>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

Hi,

On Wed, May 22, 2019 at 07:44:56AM +0000, Christophe Leroy wrote:
> On 05/22/2019 06:14 AM, Christophe Leroy wrote:
> >Le 22/05/2019 à 00:18, Aaro Koskinen a écrit :
> >>I was trying to upgrade from v5.0 -> v5.1 on PowerBook G4, but when
> >>trying
> >>to kexec a kernel the system gets stuck (no errors seen on the console).
> >
> >Do you mean you are trying to kexec a v5.1 kernel from a v5.0 kernel, or
> >do you have a working v5.1 kernel, but kexec doesn't work with it ?
> >
> >>
> >>Bisected to: 93c4a162b014 ("powerpc/6xx: Store PGDIR physical address
> >>in a SPRG"). This commit doesn't revert cleanly anymore but I tested
> >>that the one before works OK.
> >
> >Not sure that's the problem. There was a problem with that commit, but it
> >was fixed by 4622a2d43101 ("powerpc/6xx: fix setup and use of
> >SPRN_SPRG_PGDIR for hash32").
> >You probably hit some commit between those two during bisect, that's
> >likely the reason why you ended here.
> >
> >Can you restart your bisect from 4622a2d43101 ?
> >
> >If you have CONFIG_SMP, maybe you should also consider taking 397d2300b08c
> >("powerpc/32s: fix flush_hash_pages() on SMP"). Stable 5.1.4 includes it.
> >
> >>
> >>With current Linus HEAD (9c7db5004280), it gets a bit further but still
> >>doesn't work: now I get an error on the console after kexec "Starting
> >>new kernel! ... Bye!":
> >>
> >>    kernel tried to execute exec-protected page (...) - exploit attempt?
> >
> >Interesting.
> >
> >Do you have CONFIG_STRICT_KERNEL_RWX=y in your .config ? If so, can you
> >retry without it ?
> 
> After looking at the code, I don't thing CONFIG_STRICT_KERNEL_RWX will make
> any difference. Can you try the patch below ?

Doesn't help (git refuses the patch as corrupted, so I had to do those
changes manually, but I'm pretty sure I got it right).

I still get the "kernel tried to execute exec-protected page...". What
should I try next?

A.

> From 8c1039da0d0f26cdf995156a905fc97fe7bda36c Mon Sep 17 00:00:00 2001
> From: Christophe Leroy <christophe.leroy@c-s.fr>
> Date: Wed, 22 May 2019 07:28:42 +0000
> Subject: [PATCH] Fix Kexec
> 
> ---
>  arch/powerpc/include/asm/pgtable.h     | 2 ++
>  arch/powerpc/kernel/machine_kexec_32.c | 4 ++++
>  arch/powerpc/mm/pgtable_32.c           | 2 +-
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/pgtable.h
> b/arch/powerpc/include/asm/pgtable.h
> index 3f53be60fb01..642eea937229 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -140,6 +140,8 @@ static inline void pte_frag_set(mm_context_t *ctx, void
> *p)
>  }
>  #endif
> 
> +int change_page_attr(struct page *page, int numpages, pgprot_t prot);
> +
>  #endif /* __ASSEMBLY__ */
> 
>  #endif /* _ASM_POWERPC_PGTABLE_H */
> diff --git a/arch/powerpc/kernel/machine_kexec_32.c
> b/arch/powerpc/kernel/machine_kexec_32.c
> index affe5dcce7f4..4f719501e6ae 100644
> --- a/arch/powerpc/kernel/machine_kexec_32.c
> +++ b/arch/powerpc/kernel/machine_kexec_32.c
> @@ -54,6 +54,10 @@ void default_machine_kexec(struct kimage *image)
>  	memcpy((void *)reboot_code_buffer, relocate_new_kernel,
>  						relocate_new_kernel_size);
> 
> +	change_page_attr(image->control_code_page,
> +			 ALIGN(KEXEC_CONTROL_PAGE_SIZE, PAGE_SIZE) >> PAGE_SHIFT,
> +			 PAGE_KERNEL_TEXT);
> +
>  	flush_icache_range(reboot_code_buffer,
>  				reboot_code_buffer + KEXEC_CONTROL_PAGE_SIZE);
>  	printk(KERN_INFO "Bye!\n");
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index 16ada373b32b..0e4651d803fc 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -340,7 +340,7 @@ static int __change_page_attr_noflush(struct page *page,
> pgprot_t prot)
>   *
>   * THIS DOES NOTHING WITH BAT MAPPINGS, DEBUG USE ONLY
>   */
> -static int change_page_attr(struct page *page, int numpages, pgprot_t prot)
> +int change_page_attr(struct page *page, int numpages, pgprot_t prot)
>  {
>  	int i, err = 0;
>  	unsigned long flags;
> -- 
> 2.13.3
