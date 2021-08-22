Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271F3F415C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 21:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gt5n11bByz3bfS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 05:59:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=a0XpbTbh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=a0XpbTbh; 
 dkim-atps=neutral
X-Greylist: delayed 409 seconds by postgrey-1.36 at boromir;
 Mon, 23 Aug 2021 05:58:50 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gt5mB3mcHz2xZB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 05:58:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629662310;
 bh=pjk5jD1zqKrMDItorPB4yDhy+hHyj7Di150YCWUjJSA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=a0XpbTbhPfHgXBqySjwC3/EF0zZeFjNJKQ7mWs3Dp4QdZR4aQg4G53MFSBnub8UcG
 7wNv/0zYGv6sRP6MyezPoBdX3wDDicBRXTHTxZLtgB6hs0QLh9zZtI7oZUMCFpyqyM
 MPWDZOBRbDH2IlDeO1cUFBJnq8DSaFJ7GSHmsvB8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.149.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1n8LVr31ed-00rqEu; Sun, 22
 Aug 2021 21:50:17 +0200
Subject: Re: [PATCH v2] init: consolidate trap_init()
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Michal Simek <monstr@monstr.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210414165808.458a3d11@xhacker.debian>
 <20210414180037.14602dab@xhacker.debian>
From: Helge Deller <deller@gmx.de>
Message-ID: <8638c5bc-71cd-9407-e597-77bf9bec17ee@gmx.de>
Date: Sun, 22 Aug 2021 21:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210414180037.14602dab@xhacker.debian>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iqhOMJzcHgngRWGUeJTS0NtZvTK1MvYjUB/t01FzLhE9XIaoXiZ
 kfsE2c5P8B/slLrvFuZKX82mTyU+P7kOPVOyeLCUWix0jZBuCQP5/RxgLdzLIXc8721wupw
 BXfChjTwIFcvt7PJbJuVENcZVlKgIlci6YyB50lbRsK9hvD2XFAIFrjh8ydx/AbPU7O3CT5
 cu/n0W491FE6U0tfzeSsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vLigm8innrw=:Zb5tn5v26kOR9SAI62S3ny
 06Qb4HIX0OSpZuQaOCgrIGWySaeMwgOCQyUaH/qmihJeUaqF4IXrsEVtU/zIdwM955Z7DyjBE
 qYu2sIe2qCScgdH6puQqPHq/ruJxlUc2eH55eyjtZ21QRWXL0srsHeXt3NF9NANwSfCVkUn5m
 SOyqDAYO1ZVVnbNhDyxS+OlUwtPLxoN+6Rjo/Zgcmkrle9Lpd4SgO6o5rNp1SWoPZ4yY1q0fS
 iLRu0xmlASKP4cVSm6I7ogK/DggOMc4O/VCfiswVhxdkkZjJSudPGylLvf0rHS2AO49CAiewP
 2wFxiZ1AzLaBlParOAzQjPbTa0Gi1mypL//+K2UFWp+ZHrQjmctIqZT8aHfOuz9H2S/TmnaaB
 m5u2Zovq4TMgLJ80Mur3JGqT8OV3OrUYm7G6xpMPOsCBbnMZkiEdSVw0lhDmPbVMqOW4m1ce/
 kiwUIt10Sccf2VYrPRgv992TqJw+Z05EBdOel7s8DaCiRBSdM71W+Y/9JBLs1hN4FclSutm89
 5Cxc5NBaR7IxtoP4WgCVGwxnVn5kFpn1lFU4EF2CjJTtWdYERth3nLYPgLxOOkPOvSPMXnGO4
 OzA7DDFEHJ6xI6FKDfmbxYH+GBHUkb9Q1F7zg7p7FjCog7tJP1uGLg0PcHRZTKwPnvMNGbyjo
 +j8Dkh2u2zcY1EFbeeY7MhZ/EF7Ep3y5kCBJJ8R+Xys4X0kMhA4a2YyBqupA8EH81evNcDWLE
 nTkeCqQnkZQ9Vx5Dif2iGJ5bdOnwVyqZTwhhGUXmy+EOLH4wqhySXsVpXj5l4buesafcQk9Q7
 ZNkOA5a3ySDR2dwY5NOhbMk3adfy/ivSLv16tk9QC3xGzRVzDfOlej7fg8gerDfxYoFRHguRB
 pwdJobw/IDZCZrZxYDL5256A7R0PPftscx/Y2ciKDtt7on0EEC3c2EkwNRXLhlej1GhgE25jP
 9P770uJaMYONJl7MBoTqCQe/EpPgLvIpp2Fnh9NoOHHGvA5HL2SjWaGOMUtpmDFSPUf+nnGEg
 LVJ9O0VEod6v7T3yMnbi+rYS+zwbV90KW2WF7Kgu27BJNPNHc+f7AscFF+BodI3hkI8wu3Iuo
 nxWll+wE7+VgvQWS+R2s3+iPedorjofEWe8geMwQXDYkjMPljXGGrNsfg==
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-parisc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Anup Patel <anup@brainfault.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/14/21 12:00 PM, Jisheng Zhang wrote:
> Many architectures implement the trap_init() as NOP, since there is
> no such default for trap_init(), this empty stub is duplicated among
> these architectures. Provide a generic but weak NOP implementation
> to drop the empty stubs of trap_init() in these architectures.
>
> The alpha, microblaze and sparc32 have real trap_init() implementation
> but the __init marker is missing, so add it to these three platforms.
>
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
> Since v1:
>   - add __init marker to trap_init() for alpha, microblaze and sparc32
>   - adjust the generic weak NOP trap_init() location to make it sits wit=
h
>     other NOP implementations together
>
>   arch/alpha/kernel/traps.c      |  2 +-
>   arch/arc/kernel/traps.c        |  5 -----
>   arch/arm/kernel/traps.c        |  5 -----
>   arch/h8300/kernel/traps.c      | 13 -------------
>   arch/hexagon/kernel/traps.c    |  4 ----
>   arch/microblaze/kernel/traps.c |  2 +-
>   arch/nds32/kernel/traps.c      |  5 -----
>   arch/nios2/kernel/traps.c      |  5 -----
>   arch/openrisc/kernel/traps.c   |  5 -----
>   arch/parisc/kernel/traps.c     |  4 ----
>   arch/powerpc/kernel/traps.c    |  5 -----
>   arch/riscv/kernel/traps.c      |  5 -----
>   arch/sparc/kernel/traps_32.c   |  2 +-
>   arch/um/kernel/trap.c          |  4 ----
>   init/main.c                    |  2 ++
>   15 files changed, 5 insertions(+), 63 deletions(-)


For parisc:

Acked-by: Helge Deller <deller@gmx.de> # parisc

Thanks!
Helge

>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 921d4b6e4d95..96b203199c6c 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -973,7 +973,7 @@ do_entUnaUser(void __user * va, unsigned long opcode=
,
>   	return;
>   }
>
> -void
> +void __init
>   trap_init(void)
>   {
>   	/* Tell PAL-code what global pointer we want in the kernel.  */
> diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
> index 57235e5c0cea..6b83e3f2b41c 100644
> --- a/arch/arc/kernel/traps.c
> +++ b/arch/arc/kernel/traps.c
> @@ -20,11 +20,6 @@
>   #include <asm/unaligned.h>
>   #include <asm/kprobes.h>
>
> -void __init trap_init(void)
> -{
> -	return;
> -}
> -
>   void die(const char *str, struct pt_regs *regs, unsigned long address)
>   {
>   	show_kernel_fault_diag(str, regs, address);
> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index 17d5a785df28..9baccef20392 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -780,11 +780,6 @@ void abort(void)
>   	panic("Oops failed to kill thread");
>   }
>
> -void __init trap_init(void)
> -{
> -	return;
> -}
> -
>   #ifdef CONFIG_KUSER_HELPERS
>   static void __init kuser_init(void *vectors)
>   {
> diff --git a/arch/h8300/kernel/traps.c b/arch/h8300/kernel/traps.c
> index 5d8b969cd8f3..c3a3ebf77fbb 100644
> --- a/arch/h8300/kernel/traps.c
> +++ b/arch/h8300/kernel/traps.c
> @@ -30,19 +30,6 @@
>
>   static DEFINE_SPINLOCK(die_lock);
>
> -/*
> - * this must be called very early as the kernel might
> - * use some instruction that are emulated on the 060
> - */
> -
> -void __init base_trap_init(void)
> -{
> -}
> -
> -void __init trap_init(void)
> -{
> -}
> -
>   asmlinkage void set_esp0(unsigned long ssp)
>   {
>   	current->thread.esp0 =3D ssp;
> diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
> index 904134b37232..edfc35dafeb1 100644
> --- a/arch/hexagon/kernel/traps.c
> +++ b/arch/hexagon/kernel/traps.c
> @@ -28,10 +28,6 @@
>   #define TRAP_SYSCALL	1
>   #define TRAP_DEBUG	0xdb
>
> -void __init trap_init(void)
> -{
> -}
> -
>   #ifdef CONFIG_GENERIC_BUG
>   /* Maybe should resemble arch/sh/kernel/traps.c ?? */
>   int is_valid_bugaddr(unsigned long addr)
> diff --git a/arch/microblaze/kernel/traps.c b/arch/microblaze/kernel/tra=
ps.c
> index 94b6fe93147d..7c15704fe56e 100644
> --- a/arch/microblaze/kernel/traps.c
> +++ b/arch/microblaze/kernel/traps.c
> @@ -18,7 +18,7 @@
>   #include <asm/exceptions.h>
>   #include <asm/unwind.h>
>
> -void trap_init(void)
> +void __init trap_init(void)
>   {
>   	__enable_hw_exceptions();
>   }
> diff --git a/arch/nds32/kernel/traps.c b/arch/nds32/kernel/traps.c
> index ee0d9ae192a5..f06421c645af 100644
> --- a/arch/nds32/kernel/traps.c
> +++ b/arch/nds32/kernel/traps.c
> @@ -183,11 +183,6 @@ void __pgd_error(const char *file, int line, unsign=
ed long val)
>   }
>
>   extern char *exception_vector, *exception_vector_end;
> -void __init trap_init(void)
> -{
> -	return;
> -}
> -
>   void __init early_trap_init(void)
>   {
>   	unsigned long ivb =3D 0;
> diff --git a/arch/nios2/kernel/traps.c b/arch/nios2/kernel/traps.c
> index b172da4eb1a9..596986a74a26 100644
> --- a/arch/nios2/kernel/traps.c
> +++ b/arch/nios2/kernel/traps.c
> @@ -105,11 +105,6 @@ void show_stack(struct task_struct *task, unsigned =
long *stack,
>   	printk("%s\n", loglvl);
>   }
>
> -void __init trap_init(void)
> -{
> -	/* Nothing to do here */
> -}
> -
>   /* Breakpoint handler */
>   asmlinkage void breakpoint_c(struct pt_regs *fp)
>   {
> diff --git a/arch/openrisc/kernel/traps.c b/arch/openrisc/kernel/traps.c
> index 4d61333c2623..aa1e709405ac 100644
> --- a/arch/openrisc/kernel/traps.c
> +++ b/arch/openrisc/kernel/traps.c
> @@ -231,11 +231,6 @@ void unhandled_exception(struct pt_regs *regs, int =
ea, int vector)
>   	die("Oops", regs, 9);
>   }
>
> -void __init trap_init(void)
> -{
> -	/* Nothing needs to be done */
> -}
> -
>   asmlinkage void do_trap(struct pt_regs *regs, unsigned long address)
>   {
>   	force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->pc);
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index 8d8441d4562a..747c328fb886 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -859,7 +859,3 @@ void  __init early_trap_init(void)
>
>   	initialize_ivt(&fault_vector_20);
>   }
> -
> -void __init trap_init(void)
> -{
> -}
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index a44a30b0688c..e952bee89684 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -2207,11 +2207,6 @@ DEFINE_INTERRUPT_HANDLER(kernel_bad_stack)
>   	die("Bad kernel stack pointer", regs, SIGABRT);
>   }
>
> -void __init trap_init(void)
> -{
> -}
> -
> -
>   #ifdef CONFIG_PPC_EMULATED_STATS
>
>   #define WARN_EMULATED_SETUP(type)	.type =3D { .name =3D #type }
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 0879b5df11b9..b3f3d84de779 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -194,8 +194,3 @@ int is_valid_bugaddr(unsigned long pc)
>   		return ((insn & __COMPRESSED_INSN_MASK) =3D=3D __BUG_INSN_16);
>   }
>   #endif /* CONFIG_GENERIC_BUG */
> -
> -/* stvec & scratch is already set from head.S */
> -void trap_init(void)
> -{
> -}
> diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
> index 247a0d9683b2..c4df20ec01e2 100644
> --- a/arch/sparc/kernel/traps_32.c
> +++ b/arch/sparc/kernel/traps_32.c
> @@ -365,7 +365,7 @@ EXPORT_SYMBOL(do_BUG);
>    * up here so that timer interrupts work during initialization.
>    */
>
> -void trap_init(void)
> +void __init trap_init(void)
>   {
>   	extern void thread_info_offsets_are_bolixed_pete(void);
>
> diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
> index ad12f78bda7e..3198c4767387 100644
> --- a/arch/um/kernel/trap.c
> +++ b/arch/um/kernel/trap.c
> @@ -311,7 +311,3 @@ void winch(int sig, struct siginfo *unused_si, struc=
t uml_pt_regs *regs)
>   {
>   	do_IRQ(WINCH_IRQ, regs);
>   }
> -
> -void trap_init(void)
> -{
> -}
> diff --git a/init/main.c b/init/main.c
> index 53b278845b88..8d14674c4e00 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -779,6 +779,8 @@ void __init __weak poking_init(void) { }
>
>   void __init __weak pgtable_cache_init(void) { }
>
> +void __init __weak trap_init(void) { }
> +
>   bool initcall_debug;
>   core_param(initcall_debug, initcall_debug, bool, 0644);
>
>

