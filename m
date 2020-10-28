Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE029CF03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 09:31:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLhcs1Rk5zDqRW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 19:31:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=dO1rxnWT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLhb003hYzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 19:30:03 +1100 (AEDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DD282463C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603873800;
 bh=qSsQZthQZ6fb9yGMUVJGt7V7PosX5m2NEfDGc2OGtmg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dO1rxnWT1rpy1GkH2qrA9wHhq+5gMkA/lRlZtPIiswa4ZckSOqbNVEaV3jMF1HbGw
 Nutj+2Oa8u5EB3CkTeMEH4ax48SFmJPZjG6cg+ONx1MGXunDqpjBNed48WwrSpKG54
 QEiLvwxsJ5JviiLlHfldObcXmNljgozkeEm2vwbs=
Received: by mail-oi1-f176.google.com with SMTP id k65so4166707oih.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 01:30:00 -0700 (PDT)
X-Gm-Message-State: AOAM532JpRo4rrIusPpeanEmgVH9E+6qTxCE1mZ5PjfRMkvEYcn/lhZW
 a/rs09Bg3TlaKyh71YUCuKWRRPe4T5AJnaOVChI=
X-Google-Smtp-Source: ABdhPJwhqulDBI9s8xG+QSmO7slUFoocOOLxHqy3ZYK2ywyP2iS31jg8q1CIQ50MYv8mYXDrA6ZU0Av16Lv5HHoVSdk=
X-Received: by 2002:aca:2310:: with SMTP id e16mr4196684oie.47.1603873799566; 
 Wed, 28 Oct 2020 01:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201028080433.26799-1-ardb@kernel.org>
In-Reply-To: <20201028080433.26799-1-ardb@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 28 Oct 2020 09:29:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHFS7BonvRaSYCn+1rTXKsT8qfQocRaYovj-BTNZw_qng@mail.gmail.com>
Message-ID: <CAMj1kXHFS7BonvRaSYCn+1rTXKsT8qfQocRaYovj-BTNZw_qng@mail.gmail.com>
Subject: Re: [PATCH] powerpc: avoid broken GCC __attribute__((optimize))
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Alexei Starovoitov <ast@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 Paul Mackerras <paulus@samba.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Oct 2020 at 09:04, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Commit 7053f80d9696 ("powerpc/64: Prevent stack protection in early boot")
> introduced a couple of uses of __attribute__((optimize)) with function
> scope, to disable the stack protector in some early boot code.
>
> Unfortunately, and this is documented in the GCC man pages [0], overriding
> function attributes for optimization is broken, and is only supported for
> debug scenarios, not for production: the problem appears to be that
> setting GCC -f flags using this method will cause it to forget about some
> or all other optimization settings that have been applied.
>
> So the only safe way to disable the stack protector is to disable it for
> the entire source file.
>
> [0] https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Arvind Sankar <nivedita@alum.mit.edu>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Kees Cook <keescook@chromium.org>
> Fixes: 7053f80d9696 ("powerpc/64: Prevent stack protection in early boot")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Related discussion here:
> https://lore.kernel.org/lkml/CAMuHMdUg0WJHEcq6to0-eODpXPOywLot6UD2=GFHpzoj_hCoBQ@mail.gmail.com/
>
> TL;DR using __attribute__((optimize("-fno-gcse"))) in the BPF interpreter
> causes the compiler to forget about -fno-asynchronous-unwind-tables passed
> on the command line, resulting in unexpected .eh_frame sections in vmlinux.
>
>  arch/powerpc/kernel/Makefile   | 3 +++
>  arch/powerpc/kernel/paca.c     | 2 +-
>  arch/powerpc/kernel/setup.h    | 6 ------
>  arch/powerpc/kernel/setup_64.c | 2 +-
>  4 files changed, 5 insertions(+), 8 deletions(-)
>

FYI i was notified by one of the robots that I missed one occurrence
of __nostackprotector in arch/powerpc/kernel/paca.c

Let me know if I need to resend.


> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index bf0bf1b900d2..fe2ef598e2ea 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -173,6 +173,9 @@ KCOV_INSTRUMENT_cputable.o := n
>  KCOV_INSTRUMENT_setup_64.o := n
>  KCOV_INSTRUMENT_paca.o := n
>
> +CFLAGS_setup_64.o              += -fno-stack-protector
> +CFLAGS_paca.o                  += -fno-stack-protector
> +
>  extra-$(CONFIG_PPC_FPU)                += fpu.o
>  extra-$(CONFIG_ALTIVEC)                += vector.o
>  extra-$(CONFIG_PPC64)          += entry_64.o
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index 0ad15768d762..fe70834d7283 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -208,7 +208,7 @@ static struct rtas_args * __init new_rtas_args(int cpu, unsigned long limit)
>  struct paca_struct **paca_ptrs __read_mostly;
>  EXPORT_SYMBOL(paca_ptrs);
>
> -void __init __nostackprotector initialise_paca(struct paca_struct *new_paca, int cpu)
> +void __init initialise_paca(struct paca_struct *new_paca, int cpu)
>  {
>  #ifdef CONFIG_PPC_PSERIES
>         new_paca->lppaca_ptr = NULL;
> diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
> index 2ec835574cc9..2dd0d9cb5a20 100644
> --- a/arch/powerpc/kernel/setup.h
> +++ b/arch/powerpc/kernel/setup.h
> @@ -8,12 +8,6 @@
>  #ifndef __ARCH_POWERPC_KERNEL_SETUP_H
>  #define __ARCH_POWERPC_KERNEL_SETUP_H
>
> -#ifdef CONFIG_CC_IS_CLANG
> -#define __nostackprotector
> -#else
> -#define __nostackprotector __attribute__((__optimize__("no-stack-protector")))
> -#endif
> -
>  void initialize_cache_info(void);
>  void irqstack_early_init(void);
>
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index bb9cab3641d7..da447a62ea1e 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -283,7 +283,7 @@ void __init record_spr_defaults(void)
>   * device-tree is not accessible via normal means at this point.
>   */
>
> -void __init __nostackprotector early_setup(unsigned long dt_ptr)
> +void __init early_setup(unsigned long dt_ptr)
>  {
>         static __initdata struct paca_struct boot_paca;
>
> --
> 2.17.1
>
