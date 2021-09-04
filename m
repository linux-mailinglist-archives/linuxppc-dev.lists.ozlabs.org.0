Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F80B400A8B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 13:15:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1sX02Lrdz2yPl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 21:15:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kLTGJlU3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=o451686892@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kLTGJlU3; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1rxC2SgLz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Sep 2021 20:48:30 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id t35so1405203qtc.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Sep 2021 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vh2QO9km+S+tFCNUXJqhD0jejFUnFOFzHei+H3j016o=;
 b=kLTGJlU3rYqGis8gbkc/RLjMRe6SjrS7OBKbWepNhpZxrFa5ltfonZJNqDdddZym/R
 JylVqYWmo6DCiEPPtOX0TN7fbgu/tDWWTwu3S6DZ6tEETdelnomUON44qaOIdu3HYcIi
 5iRcPLBwRgBQdpQx3ESiTNjPS4miDDRz/xBYcC6cVmMzyJUUeCJ9HvUAWyAJBtERSwOF
 fhGsva1RikzLsrdIfhgMD2JIYHKHY5rq4lssxQazla3vBPGbiMSGGEtw43+llxPzeHbi
 XM9EX0lI5HGnmIUxJvAYu/9iUGcFblG1KT4Tq/5asgY171mTintwm4D3ljxnUH0QRfMm
 cKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vh2QO9km+S+tFCNUXJqhD0jejFUnFOFzHei+H3j016o=;
 b=Sk8gxBZ27X/7vjOYVGdHMhNJi0DH7saAY+IjZKHmsq8IxyL8ix5mYAQOqFe41HbLrT
 d+Lm6XkgjeNZ6XBiyBqIMfcbtZl1AYv61JhAYuLWI9NiRR7w+I+2wFUP3R6TBI//yhMQ
 lh+QDi5CM7+3aVjQx/be1kK/Qxjut14C4qxTluV9FTjulup82OFsrc0LNNbwxJAlEJUo
 suP4pNt2A9bB+ZrGKrSHwHGJ6k1xQjMn7EA97UZwjowjqYqJFPGjhy+VjQSZXsvIJef7
 LcwRc8FMwtDEOTva9ChcoQE57CPl6byaAGd/LMTQ7YB4jlULozOrbZFYXhrHGRY/jXKu
 u9tA==
X-Gm-Message-State: AOAM533fJ7qPfbSldt/40gBr2UvTTU7ddXl+ieI77ejlLABa1jKXDTue
 js0fShfi5dwjupP+HfnqVOLdc+I2WyeYnveUvjc=
X-Google-Smtp-Source: ABdhPJwDTXpUrVlVlPeik08eKlZDbcyuEwB4+zKDTWQlHdp/g7JJexossfgSnroRooqxRhFLxIbJtFjvKN2HyxAP6hM=
X-Received: by 2002:ac8:4558:: with SMTP id z24mr2837313qtn.338.1630752505271; 
 Sat, 04 Sep 2021 03:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210903071817.1162938-1-o451686892@gmail.com>
In-Reply-To: <20210903071817.1162938-1-o451686892@gmail.com>
From: Weizhao Ouyang <o451686892@gmail.com>
Date: Sat, 4 Sep 2021 18:48:14 +0800
Message-ID: <CAHk0Hov3geMaATuAukuqLyyajtsWGAabc6s-tpvuWteMyj2BWQ@mail.gmail.com>
Subject: Re: [PATCH] ftrace: Cleanup ftrace_dyn_arch_init()
To: rostedt@goodmis.org, mingo@redhat.com
Content-Type: multipart/alternative; boundary="000000000000cb18c805cb292770"
X-Mailman-Approved-At: Sat, 04 Sep 2021 21:14:37 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com, will@kernel.org,
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 borntraeger@de.ibm.com, catalin.marinas@arm.com, aou@eecs.berkeley.edu,
 gor@linux.ibm.com, hca@linux.ibm.com, bp@alien8.de, green.hu@gmail.com,
 paul.walmsley@sifive.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000cb18c805cb292770
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 3:18 PM Weizhao Ouyang <o451686892@gmail.com> wrote:

> Most ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
>
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> ---
>  arch/arm/kernel/ftrace.c          | 5 -----
>  arch/arm64/kernel/ftrace.c        | 5 -----
>  arch/csky/kernel/ftrace.c         | 5 -----
>  arch/ia64/kernel/ftrace.c         | 6 ------
>  arch/microblaze/kernel/ftrace.c   | 5 -----
>  arch/mips/include/asm/ftrace.h    | 2 ++
>  arch/nds32/kernel/ftrace.c        | 5 -----
>  arch/parisc/kernel/ftrace.c       | 5 -----
>  arch/powerpc/include/asm/ftrace.h | 4 ++++
>  arch/riscv/kernel/ftrace.c        | 5 -----
>  arch/s390/kernel/ftrace.c         | 5 -----
>  arch/sh/kernel/ftrace.c           | 5 -----
>  arch/sparc/kernel/ftrace.c        | 5 -----
>  arch/x86/kernel/ftrace.c          | 5 -----
>  include/linux/ftrace.h            | 1 -
>  kernel/trace/ftrace.c             | 5 +++++
>  16 files changed, 11 insertions(+), 62 deletions(-)
>
> diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
> index 3c83b5d29697..a006585e1c09 100644
> --- a/arch/arm/kernel/ftrace.c
> +++ b/arch/arm/kernel/ftrace.c
> @@ -193,11 +193,6 @@ int ftrace_make_nop(struct module *mod,
>
>         return ret;
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
> index 7f467bd9db7a..fc62dfe73f93 100644
> --- a/arch/arm64/kernel/ftrace.c
> +++ b/arch/arm64/kernel/ftrace.c
> @@ -236,11 +236,6 @@ void arch_ftrace_update_code(int command)
>         command |= FTRACE_MAY_SLEEP;
>         ftrace_modify_all_code(command);
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c
> index b4a7ec1517ff..50bfcf129078 100644
> --- a/arch/csky/kernel/ftrace.c
> +++ b/arch/csky/kernel/ftrace.c
> @@ -133,11 +133,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>                                 (unsigned long)func, true, true);
>         return ret;
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> diff --git a/arch/ia64/kernel/ftrace.c b/arch/ia64/kernel/ftrace.c
> index b2ab2d58fb30..d6360fd404ab 100644
> --- a/arch/ia64/kernel/ftrace.c
> +++ b/arch/ia64/kernel/ftrace.c
> @@ -194,9 +194,3 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>         flush_icache_range(addr, addr + 16);
>         return 0;
>  }
> -
> -/* run from kstop_machine */
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
> diff --git a/arch/microblaze/kernel/ftrace.c
> b/arch/microblaze/kernel/ftrace.c
> index 224eea40e1ee..188749d62709 100644
> --- a/arch/microblaze/kernel/ftrace.c
> +++ b/arch/microblaze/kernel/ftrace.c
> @@ -163,11 +163,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned
> long addr)
>         return ret;
>  }
>
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
> -
>  int ftrace_update_ftrace_func(ftrace_func_t func)
>  {
>         unsigned long ip = (unsigned long)(&ftrace_call);
> diff --git a/arch/mips/include/asm/ftrace.h
> b/arch/mips/include/asm/ftrace.h
> index b463f2aa5a61..ed013e767390 100644
> --- a/arch/mips/include/asm/ftrace.h
> +++ b/arch/mips/include/asm/ftrace.h
> @@ -76,6 +76,8 @@ do {                                          \
>
>
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +
>  static inline unsigned long ftrace_call_adjust(unsigned long addr)
>  {
>         return addr;
> diff --git a/arch/nds32/kernel/ftrace.c b/arch/nds32/kernel/ftrace.c
> index 0e23e3a8df6b..f0ef4842d191 100644
> --- a/arch/nds32/kernel/ftrace.c
> +++ b/arch/nds32/kernel/ftrace.c
> @@ -84,11 +84,6 @@ void _ftrace_caller(unsigned long parent_ip)
>         /* restore all state needed by the compiler epilogue */
>  }
>
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
> -
>  static unsigned long gen_sethi_insn(unsigned long addr)
>  {
>         unsigned long opcode = 0x46000000;
> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 0a1e75af5382..01581f715737 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -94,11 +94,6 @@ int ftrace_disable_ftrace_graph_caller(void)
>  #endif
>
>  #ifdef CONFIG_DYNAMIC_FTRACE
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
>  int ftrace_update_ftrace_func(ftrace_func_t func)
>  {
>         return 0;
> diff --git a/arch/powerpc/include/asm/ftrace.h
> b/arch/powerpc/include/asm/ftrace.h
> index debe8c4f7062..4db83cf4283f 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>  };
>  #endif /* __ASSEMBLY__ */
>
> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> +int __init ftrace_dyn_arch_init(void);
> +#endif
> +
>

Sorry there is a mistake CONFIG, I will send a v2 patch later.


>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>  #endif
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 7f1e5203de88..4716f4cdc038 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -154,11 +154,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>
>         return ret;
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
>  #endif
>
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
> index 0a464d328467..3fd80397ff52 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -262,11 +262,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>         return 0;
>  }
>
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
> -
>  void arch_ftrace_update_code(int command)
>  {
>         if (ftrace_shared_hotpatch_trampoline(NULL))
> diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c
> index 295c43315bbe..930001bb8c6a 100644
> --- a/arch/sh/kernel/ftrace.c
> +++ b/arch/sh/kernel/ftrace.c
> @@ -252,11 +252,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned
> long addr)
>
>         return ftrace_modify_code(rec->ip, old, new);
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c
> index 684b84ce397f..eaead3da8e03 100644
> --- a/arch/sparc/kernel/ftrace.c
> +++ b/arch/sparc/kernel/ftrace.c
> @@ -82,11 +82,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>         new = ftrace_call_replace(ip, (unsigned long)func);
>         return ftrace_modify_code(ip, old, new);
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
>  #endif
>
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 1b3ce3b4a2a2..23d221a9a3cd 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -252,11 +252,6 @@ void arch_ftrace_update_code(int command)
>         ftrace_modify_all_code(command);
>  }
>
> -int __init ftrace_dyn_arch_init(void)
> -{
> -       return 0;
> -}
> -
>  /* Currently only x86_64 supports dynamic trampolines */
>  #ifdef CONFIG_X86_64
>
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 832e65f06754..f1eca123d89d 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -573,7 +573,6 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char
> *buf, int enable);
>
>  /* defined in arch */
>  extern int ftrace_ip_converted(unsigned long ip);
> -extern int ftrace_dyn_arch_init(void);
>  extern void ftrace_replace_code(int enable);
>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>  extern void ftrace_caller(void);
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 7efbc8aaf7f6..4c090323198d 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6846,6 +6846,11 @@ void __init ftrace_free_init_mem(void)
>         ftrace_free_mem(NULL, start, end);
>  }
>
> +int __init __weak ftrace_dyn_arch_init(void)
> +{
> +       return 0;
> +}
> +
>  void __init ftrace_init(void)
>  {
>         extern unsigned long __start_mcount_loc[];
> --
> 2.30.2
>
>
Thanks.

--000000000000cb18c805cb292770
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 3, 2021 at 3:18 PM Weizhao Ouyang &lt;<a href=
=3D"mailto:o451686892@gmail.com">o451686892@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Most ARCHs use empty ftrace_dyn_arch_init=
(), introduce a weak common<br>
ftrace_dyn_arch_init() to cleanup them.<br>
<br>
Signed-off-by: Weizhao Ouyang &lt;<a href=3D"mailto:o451686892@gmail.com" t=
arget=3D"_blank">o451686892@gmail.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 -----<=
br>
=C2=A0arch/arm64/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 -----<br>
=C2=A0arch/csky/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 -----<=
br>
=C2=A0arch/ia64/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ------=
<br>
=C2=A0arch/microblaze/kernel/ftrace.c=C2=A0 =C2=A0| 5 -----<br>
=C2=A0arch/mips/include/asm/ftrace.h=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0arch/nds32/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 -----<br>
=C2=A0arch/parisc/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 -----<br>
=C2=A0arch/powerpc/include/asm/ftrace.h | 4 ++++<br>
=C2=A0arch/riscv/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 -----<br>
=C2=A0arch/s390/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 -----<=
br>
=C2=A0arch/sh/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 -=
----<br>
=C2=A0arch/sparc/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 -----<br>
=C2=A0arch/x86/kernel/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 -----<=
br>
=C2=A0include/linux/ftrace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -=
<br>
=C2=A0kernel/trace/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 5 +++++<br>
=C2=A016 files changed, 11 insertions(+), 62 deletions(-)<br>
<br>
diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c<br>
index 3c83b5d29697..a006585e1c09 100644<br>
--- a/arch/arm/kernel/ftrace.c<br>
+++ b/arch/arm/kernel/ftrace.c<br>
@@ -193,11 +193,6 @@ int ftrace_make_nop(struct module *mod,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
-<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
=C2=A0#endif /* CONFIG_DYNAMIC_FTRACE */<br>
<br>
=C2=A0#ifdef CONFIG_FUNCTION_GRAPH_TRACER<br>
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c<br>
index 7f467bd9db7a..fc62dfe73f93 100644<br>
--- a/arch/arm64/kernel/ftrace.c<br>
+++ b/arch/arm64/kernel/ftrace.c<br>
@@ -236,11 +236,6 @@ void arch_ftrace_update_code(int command)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 command |=3D FTRACE_MAY_SLEEP;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftrace_modify_all_code(command);<br>
=C2=A0}<br>
-<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
=C2=A0#endif /* CONFIG_DYNAMIC_FTRACE */<br>
<br>
=C2=A0#ifdef CONFIG_FUNCTION_GRAPH_TRACER<br>
diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c<br>
index b4a7ec1517ff..50bfcf129078 100644<br>
--- a/arch/csky/kernel/ftrace.c<br>
+++ b/arch/csky/kernel/ftrace.c<br>
@@ -133,11 +133,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long)func, true, true);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
-<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
=C2=A0#endif /* CONFIG_DYNAMIC_FTRACE */<br>
<br>
=C2=A0#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS<br>
diff --git a/arch/ia64/kernel/ftrace.c b/arch/ia64/kernel/ftrace.c<br>
index b2ab2d58fb30..d6360fd404ab 100644<br>
--- a/arch/ia64/kernel/ftrace.c<br>
+++ b/arch/ia64/kernel/ftrace.c<br>
@@ -194,9 +194,3 @@ int ftrace_update_ftrace_func(ftrace_func_t func)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 flush_icache_range(addr, addr + 16);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
-<br>
-/* run from kstop_machine */<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
diff --git a/arch/microblaze/kernel/ftrace.c b/arch/microblaze/kernel/ftrac=
e.c<br>
index 224eea40e1ee..188749d62709 100644<br>
--- a/arch/microblaze/kernel/ftrace.c<br>
+++ b/arch/microblaze/kernel/ftrace.c<br>
@@ -163,11 +163,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned =
long addr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
=C2=A0int ftrace_update_ftrace_func(ftrace_func_t func)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long ip =3D (unsigned long)(&amp;ftrac=
e_call);<br>
diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.=
h<br>
index b463f2aa5a61..ed013e767390 100644<br>
--- a/arch/mips/include/asm/ftrace.h<br>
+++ b/arch/mips/include/asm/ftrace.h<br>
@@ -76,6 +76,8 @@ do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
<br>
<br>
=C2=A0#ifdef CONFIG_DYNAMIC_FTRACE<br>
+int __init ftrace_dyn_arch_init(void);<br>
+<br>
=C2=A0static inline unsigned long ftrace_call_adjust(unsigned long addr)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return addr;<br>
diff --git a/arch/nds32/kernel/ftrace.c b/arch/nds32/kernel/ftrace.c<br>
index 0e23e3a8df6b..f0ef4842d191 100644<br>
--- a/arch/nds32/kernel/ftrace.c<br>
+++ b/arch/nds32/kernel/ftrace.c<br>
@@ -84,11 +84,6 @@ void _ftrace_caller(unsigned long parent_ip)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* restore all state needed by the compiler epi=
logue */<br>
=C2=A0}<br>
<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
=C2=A0static unsigned long gen_sethi_insn(unsigned long addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long opcode =3D 0x46000000;<br>
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c<br>
index 0a1e75af5382..01581f715737 100644<br>
--- a/arch/parisc/kernel/ftrace.c<br>
+++ b/arch/parisc/kernel/ftrace.c<br>
@@ -94,11 +94,6 @@ int ftrace_disable_ftrace_graph_caller(void)<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifdef CONFIG_DYNAMIC_FTRACE<br>
-<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
=C2=A0int ftrace_update_ftrace_func(ftrace_func_t func)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h<br>
index debe8c4f7062..4db83cf4283f 100644<br>
--- a/arch/powerpc/include/asm/ftrace.h<br>
+++ b/arch/powerpc/include/asm/ftrace.h<br>
@@ -61,6 +61,10 @@ struct dyn_arch_ftrace {<br>
=C2=A0};<br>
=C2=A0#endif /* __ASSEMBLY__ */<br>
<br>
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS<br>
+int __init ftrace_dyn_arch_init(void);<br>
+#endif<br>
+<br></blockquote><div><br></div><div>Sorry there is a mistake CONFIG, I wi=
ll send a v2 patch later.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
=C2=A0#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS<br>
=C2=A0#define ARCH_SUPPORTS_FTRACE_OPS 1<br>
=C2=A0#endif<br>
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c<br>
index 7f1e5203de88..4716f4cdc038 100644<br>
--- a/arch/riscv/kernel/ftrace.c<br>
+++ b/arch/riscv/kernel/ftrace.c<br>
@@ -154,11 +154,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
-<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS<br>
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c<br>
index 0a464d328467..3fd80397ff52 100644<br>
--- a/arch/s390/kernel/ftrace.c<br>
+++ b/arch/s390/kernel/ftrace.c<br>
@@ -262,11 +262,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
=C2=A0void arch_ftrace_update_code(int command)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ftrace_shared_hotpatch_trampoline(NULL))<br=
>
diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c<br>
index 295c43315bbe..930001bb8c6a 100644<br>
--- a/arch/sh/kernel/ftrace.c<br>
+++ b/arch/sh/kernel/ftrace.c<br>
@@ -252,11 +252,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned =
long addr)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ftrace_modify_code(rec-&gt;ip, old, new)=
;<br>
=C2=A0}<br>
-<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
=C2=A0#endif /* CONFIG_DYNAMIC_FTRACE */<br>
<br>
=C2=A0#ifdef CONFIG_FUNCTION_GRAPH_TRACER<br>
diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c<br>
index 684b84ce397f..eaead3da8e03 100644<br>
--- a/arch/sparc/kernel/ftrace.c<br>
+++ b/arch/sparc/kernel/ftrace.c<br>
@@ -82,11 +82,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 new =3D ftrace_call_replace(ip, (unsigned long)=
func);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ftrace_modify_code(ip, old, new);<br>
=C2=A0}<br>
-<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifdef CONFIG_FUNCTION_GRAPH_TRACER<br>
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c<br>
index 1b3ce3b4a2a2..23d221a9a3cd 100644<br>
--- a/arch/x86/kernel/ftrace.c<br>
+++ b/arch/x86/kernel/ftrace.c<br>
@@ -252,11 +252,6 @@ void arch_ftrace_update_code(int command)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftrace_modify_all_code(command);<br>
=C2=A0}<br>
<br>
-int __init ftrace_dyn_arch_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
=C2=A0/* Currently only x86_64 supports dynamic trampolines */<br>
=C2=A0#ifdef CONFIG_X86_64<br>
<br>
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h<br>
index 832e65f06754..f1eca123d89d 100644<br>
--- a/include/linux/ftrace.h<br>
+++ b/include/linux/ftrace.h<br>
@@ -573,7 +573,6 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char *b=
uf, int enable);<br>
<br>
=C2=A0/* defined in arch */<br>
=C2=A0extern int ftrace_ip_converted(unsigned long ip);<br>
-extern int ftrace_dyn_arch_init(void);<br>
=C2=A0extern void ftrace_replace_code(int enable);<br>
=C2=A0extern int ftrace_update_ftrace_func(ftrace_func_t func);<br>
=C2=A0extern void ftrace_caller(void);<br>
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c<br>
index 7efbc8aaf7f6..4c090323198d 100644<br>
--- a/kernel/trace/ftrace.c<br>
+++ b/kernel/trace/ftrace.c<br>
@@ -6846,6 +6846,11 @@ void __init ftrace_free_init_mem(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftrace_free_mem(NULL, start, end);<br>
=C2=A0}<br>
<br>
+int __init __weak ftrace_dyn_arch_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0void __init ftrace_init(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 extern unsigned long __start_mcount_loc[];<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div>Thanks.=C2=A0</div></div></div>

--000000000000cb18c805cb292770--
