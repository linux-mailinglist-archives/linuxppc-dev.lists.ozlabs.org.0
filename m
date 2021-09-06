Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4BD4020C2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 22:41:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3L0H1CT1z2yNT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 06:41:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=jgFg06yM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=jgFg06yM; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3KzV71qmz2xlD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 06:40:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630960702;
 bh=WevteChaVTuIJ4vpbr4/S6Dy5gJM391zvvJnoNTQzeQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=jgFg06yM+iwybYFpbzzkJmZm/SCTiZitHSZTAJ9C5NX2kLKqYS0y0KP2FTserSuxh
 Eqwm30wHapagCvLCe+sfLUcjybTUJKUWLlL4N6xw1YMdd7tlspbfrymTlU7+4q3gkF
 PE/NY5aL+n60GN8BN0jWsYWdG0hg52z5OmxZ4RNo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.85.61] ([80.187.112.14]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKbkC-1mfxez3TOW-00KvzB; Mon, 06
 Sep 2021 22:38:22 +0200
Subject: Re: [PATCH v2] ftrace: Cleanup ftrace_dyn_arch_init()
To: Weizhao Ouyang <o451686892@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
References: <20210906111626.1259867-1-o451686892@gmail.com>
From: Helge Deller <deller@gmx.de>
Message-ID: <a25be752-bb65-652e-977f-312ee0b95c15@gmx.de>
Date: Mon, 6 Sep 2021 22:36:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906111626.1259867-1-o451686892@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r/JUrRhbvOicWGkiqogKRwFTRO8+bXkMsWJ6ArSDb2+yOaZh1Qh
 itUnWpVNjQZtukajCgk+9dVWp5QWeY6EC68jABYr/Z/mmoBCskHSc68TkP8OFkozE08Ymto
 RScyaWcZfFu0YeONVmfOsW0W+36044q2gtcmtnZfjB+47DPw/jElcyHxTaAN3Y7IHNV5r/H
 jvyIgy8IibjSGnMiYxXsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tG48Hcn4Z5Q=:ehG9Ni/7f3QY9e3/tDaV67
 Go/9izpDYuXjcteZfs+fw1YiYrhfZqvdhxTbPflNNETE0HdftRFgBe/CmV1CDBN5BiG25pDEG
 6un5Br95HIDvWvYqizxRIlseCi9E7A+jxIEc1dbkBLTKodGaWReVFzxBvn/5NRgdx4KnG/9df
 ucNdKFNKAX4j0cSUBZ6haHrP0B2AYmLT532uicLt18v1TEEIqJVpQab+XNiRy64g6rDdkRHLF
 aJIoXqZqxjC3+RQeQGY46xXIX+hGQFiF2xxMAfSR4Lzkz4K62aep6JYQ/f+pfOz4H8rF639YH
 PKgC59vyttAZGVwimTOGC9niyGHMt9eXRPgE6qGTMoYCcy4mZWQuZJGefPkg9NUJZDav1pqOd
 ZbfXhPYq8Es6bs+VONsPb/f5pHatLB4N81z5s5931+T3fQcX04KLknCYABzXJMXAFca1a/W/4
 67fdVs0SjW/6m3CrQVfi4xtNXP8QNJc3Ar8sqKQEbl6CJZzYke1YQ/IOAlfXLCGH8nmPgtgNU
 t3em/d8Kjb35YHIB0PjfM7cbZw6+qNdL/sNn+lo15+rG/GHPi6LUWNZUEtZlMYNtzIg3zsYMC
 6Xtf20IhJzPfAX+mpJuinHgQmjMg09oXSHfLLnRrW7cnWAFPKYV/8zCcFAeVvW/5Xd8FJtNYj
 Vk8KjlesicI96F+gJoVPyQAUfujUbzGjGzcYAb4mnPMVSnnjnDI2L6fqlqjNMMjrMYGKOXiiV
 FOF36zyo2Ye9CUAtgUIntYMFUzTYEMA1+dNWkp8D2ToEon7wYnylwQiwa3eX4VBNPgtgbKLTl
 SnPU+iCyrbYSep4qhUdqeqI3O7jvFcPUThaElNxhL7oh64JNICcc0oCnJ69I+DTsmdMuCDwAB
 Z4qWUzHaETcq5zJPgtCKjptx9/07i1enT+zaXoFenEP/ien6VfMOu818AJVG7zgPCAChvvhO/
 3B7OkK469cs9rUvkqUjzWgdjs42P6wWz8HKmOG4h7fA+dUruy2tipPUOLvzSyWMTmrHl5yG1S
 Vz4p4FrS45Wlm0zmdLqj3BlCIo4KZXsI5jJ3aFUoi1GkRY1W4IkespQ7JpG/CToEyVNoNNBxX
 8ju98M7ZjSeuEU554usU2/WnmGPp2u1TmeW6vjq1Qo+ZBY9J3/8cNFhLw==
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/6/21 1:16 PM, Weizhao Ouyang wrote:
> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
>
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)

Acked-by: Helge Deller <deller@gmx.de> # parisc

Thanks,
Helge


> ---
>
> Changes in v2:
> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
> -- add Acked-by tag
>
> ---
>   arch/arm/kernel/ftrace.c          | 5 -----
>   arch/arm64/kernel/ftrace.c        | 5 -----
>   arch/csky/kernel/ftrace.c         | 5 -----
>   arch/ia64/kernel/ftrace.c         | 6 ------
>   arch/microblaze/kernel/ftrace.c   | 5 -----
>   arch/mips/include/asm/ftrace.h    | 2 ++
>   arch/nds32/kernel/ftrace.c        | 5 -----
>   arch/parisc/kernel/ftrace.c       | 5 -----
>   arch/powerpc/include/asm/ftrace.h | 4 ++++
>   arch/riscv/kernel/ftrace.c        | 5 -----
>   arch/s390/kernel/ftrace.c         | 5 -----
>   arch/sh/kernel/ftrace.c           | 5 -----
>   arch/sparc/kernel/ftrace.c        | 5 -----
>   arch/x86/kernel/ftrace.c          | 5 -----
>   include/linux/ftrace.h            | 1 -
>   kernel/trace/ftrace.c             | 5 +++++
>   16 files changed, 11 insertions(+), 62 deletions(-)
>
> diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
> index 3c83b5d29697..a006585e1c09 100644
> --- a/arch/arm/kernel/ftrace.c
> +++ b/arch/arm/kernel/ftrace.c
> @@ -193,11 +193,6 @@ int ftrace_make_nop(struct module *mod,
>
>   	return ret;
>   }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>   #endif /* CONFIG_DYNAMIC_FTRACE */
>
>   #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
> index 7f467bd9db7a..fc62dfe73f93 100644
> --- a/arch/arm64/kernel/ftrace.c
> +++ b/arch/arm64/kernel/ftrace.c
> @@ -236,11 +236,6 @@ void arch_ftrace_update_code(int command)
>   	command |=3D FTRACE_MAY_SLEEP;
>   	ftrace_modify_all_code(command);
>   }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>   #endif /* CONFIG_DYNAMIC_FTRACE */
>
>   #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c
> index b4a7ec1517ff..50bfcf129078 100644
> --- a/arch/csky/kernel/ftrace.c
> +++ b/arch/csky/kernel/ftrace.c
> @@ -133,11 +133,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>   				(unsigned long)func, true, true);
>   	return ret;
>   }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>   #endif /* CONFIG_DYNAMIC_FTRACE */
>
>   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> diff --git a/arch/ia64/kernel/ftrace.c b/arch/ia64/kernel/ftrace.c
> index b2ab2d58fb30..d6360fd404ab 100644
> --- a/arch/ia64/kernel/ftrace.c
> +++ b/arch/ia64/kernel/ftrace.c
> @@ -194,9 +194,3 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>   	flush_icache_range(addr, addr + 16);
>   	return 0;
>   }
> -
> -/* run from kstop_machine */
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> diff --git a/arch/microblaze/kernel/ftrace.c b/arch/microblaze/kernel/ft=
race.c
> index 224eea40e1ee..188749d62709 100644
> --- a/arch/microblaze/kernel/ftrace.c
> +++ b/arch/microblaze/kernel/ftrace.c
> @@ -163,11 +163,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsign=
ed long addr)
>   	return ret;
>   }
>
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> -
>   int ftrace_update_ftrace_func(ftrace_func_t func)
>   {
>   	unsigned long ip =3D (unsigned long)(&ftrace_call);
> diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftra=
ce.h
> index b463f2aa5a61..ed013e767390 100644
> --- a/arch/mips/include/asm/ftrace.h
> +++ b/arch/mips/include/asm/ftrace.h
> @@ -76,6 +76,8 @@ do {						\
>
>
>   #ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +
>   static inline unsigned long ftrace_call_adjust(unsigned long addr)
>   {
>   	return addr;
> diff --git a/arch/nds32/kernel/ftrace.c b/arch/nds32/kernel/ftrace.c
> index 0e23e3a8df6b..f0ef4842d191 100644
> --- a/arch/nds32/kernel/ftrace.c
> +++ b/arch/nds32/kernel/ftrace.c
> @@ -84,11 +84,6 @@ void _ftrace_caller(unsigned long parent_ip)
>   	/* restore all state needed by the compiler epilogue */
>   }
>
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> -
>   static unsigned long gen_sethi_insn(unsigned long addr)
>   {
>   	unsigned long opcode =3D 0x46000000;
> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 0a1e75af5382..01581f715737 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -94,11 +94,6 @@ int ftrace_disable_ftrace_graph_caller(void)
>   #endif
>
>   #ifdef CONFIG_DYNAMIC_FTRACE
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>   int ftrace_update_ftrace_func(ftrace_func_t func)
>   {
>   	return 0;
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/as=
m/ftrace.h
> index debe8c4f7062..d59f67c0225f 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>   };
>   #endif /* __ASSEMBLY__ */
>
> +#ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +#endif /* CONFIG_DYNAMIC_FTRACE */
> +
>   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>   #define ARCH_SUPPORTS_FTRACE_OPS 1
>   #endif
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 7f1e5203de88..4716f4cdc038 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -154,11 +154,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>
>   	return ret;
>   }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>   #endif
>
>   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
> index 0a464d328467..3fd80397ff52 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -262,11 +262,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>   	return 0;
>   }
>
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> -
>   void arch_ftrace_update_code(int command)
>   {
>   	if (ftrace_shared_hotpatch_trampoline(NULL))
> diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c
> index 295c43315bbe..930001bb8c6a 100644
> --- a/arch/sh/kernel/ftrace.c
> +++ b/arch/sh/kernel/ftrace.c
> @@ -252,11 +252,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsign=
ed long addr)
>
>   	return ftrace_modify_code(rec->ip, old, new);
>   }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>   #endif /* CONFIG_DYNAMIC_FTRACE */
>
>   #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c
> index 684b84ce397f..eaead3da8e03 100644
> --- a/arch/sparc/kernel/ftrace.c
> +++ b/arch/sparc/kernel/ftrace.c
> @@ -82,11 +82,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>   	new =3D ftrace_call_replace(ip, (unsigned long)func);
>   	return ftrace_modify_code(ip, old, new);
>   }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>   #endif
>
>   #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 1b3ce3b4a2a2..23d221a9a3cd 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -252,11 +252,6 @@ void arch_ftrace_update_code(int command)
>   	ftrace_modify_all_code(command);
>   }
>
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> -
>   /* Currently only x86_64 supports dynamic trampolines */
>   #ifdef CONFIG_X86_64
>
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 832e65f06754..f1eca123d89d 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -573,7 +573,6 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char=
 *buf, int enable);
>
>   /* defined in arch */
>   extern int ftrace_ip_converted(unsigned long ip);
> -extern int ftrace_dyn_arch_init(void);
>   extern void ftrace_replace_code(int enable);
>   extern int ftrace_update_ftrace_func(ftrace_func_t func);
>   extern void ftrace_caller(void);
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 7efbc8aaf7f6..4c090323198d 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6846,6 +6846,11 @@ void __init ftrace_free_init_mem(void)
>   	ftrace_free_mem(NULL, start, end);
>   }
>
> +int __init __weak ftrace_dyn_arch_init(void)
> +{
> +	return 0;
> +}
> +
>   void __init ftrace_init(void)
>   {
>   	extern unsigned long __start_mcount_loc[];
>

