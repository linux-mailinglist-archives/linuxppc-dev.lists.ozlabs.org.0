Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB8FA7BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 04:57:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CW6H5Y4dzF6pk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 14:57:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uQuJAcSC"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CTt34Vf2zF6KZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 14:02:03 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q13so596282pff.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 19:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Dpd5uTeG1GRO8WYQOMFdyd5CNMfNTlaCpN0JYUg6WgU=;
 b=uQuJAcSCKkmH97BvEde5l2uvPlhaRpfqm8mmjpU2h+l4i5KrHKi++xUWoJALJ+5fJC
 W3C68IYE5j3bYB4eE7/42fRYqxdRYl4f/hcnj7NelRFeSkkSJSGGVG9GJu5OYQ46HMYF
 3rXOyPknbJGQ9ODH1AlNp6lfCaKSkgayIewo5pfkqinaTc9fmjqU2G4HqzZs8PZseEIy
 ugGHCtBKSPdxliOUJbl7Z2dAeVLk3rFVWsmrol/pBtJAx7c10dkYeGoZLv5RE85eeiUb
 0UJsxPOnUoB7yUN/kgF/nxgNR/TGMat/TF2HHGjCWIrzbzlC5x2HoDmiVB3p/UTg0QB7
 1M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Dpd5uTeG1GRO8WYQOMFdyd5CNMfNTlaCpN0JYUg6WgU=;
 b=OYFQAIVn6K4CBLslYBPY5sKi6JxfZhZ+UcjvhHNwV3Jt8Kvl+dt5RS7QyAHLOGleFe
 NlCv0ugFjJvAyQD1HXg/GZcVBlhVbRlPx0xeYNhnfZTdE/SjNyclGhpfB8o19nvqvRTG
 cUPpMWQ0p9TBYSuvqJ66zgjYWcn6D8qmrz5s2ud6HEx5649fQpmsbj1v6do6DuWXaAMh
 zaV1V4FmIpkWPafrSH8qeVw67YaCqveocubk2CVuFt82L5+75Dk7SCmWAr+5+gNZOFWm
 tXJzY81ovFJuA14dnYlAsFOK/+m80J7keh16q20UtJ+fXm0qDiSOhyji6bxK4X3Mr34T
 nk2w==
X-Gm-Message-State: APjAAAXjXReDaFHeRzPWSdA7bPThljcMSDCnk2DEiHeksbbFv/lqcBNc
 kIa27GQqp6J7sMgWtGP2pqKjd9XK
X-Google-Smtp-Source: APXvYqzXMHO/HtcVU5p9xv5xJK6VdYM/AfdUxrqLIz9XH3Tn6c4z6jFONsTXy9a5sBeWG0AWrbt9Dw==
X-Received: by 2002:a63:6c4:: with SMTP id 187mr974149pgg.421.1573614120606;
 Tue, 12 Nov 2019 19:02:00 -0800 (PST)
Received: from localhost (193-116-100-125.tpgi.com.au. [193.116.100.125])
 by smtp.gmail.com with ESMTPSA id s2sm400490pgv.48.2019.11.12.19.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 19:02:00 -0800 (PST)
Date: Wed, 13 Nov 2019 13:02:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 31/33] powerpc/64: make buildable without CONFIG_COMPAT
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
References: <cover.1573576649.git.msuchanek@suse.de>
 <13fa324dc879a7f325290bf2e131b87eb491cd7b.1573576649.git.msuchanek@suse.de>
In-Reply-To: <13fa324dc879a7f325290bf2e131b87eb491cd7b.1573576649.git.msuchanek@suse.de>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1573613683.ylw9dz9mlc.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Breno Leitao <leitao@debian.org>,
 Michael Neuling <mikey@neuling.org>, Nicolai Stange <nstange@suse.de>,
 Allison Randal <allison@lohutok.net>, Diana Craciun <diana.craciun@nxp.com>,
 Firoz Khan <firoz.khan@linaro.org>, Christian Brauner <christian@brauner.io>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Jagadeesh Pagadala <jagdsh.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Gustavo Romero <gromero@linux.ibm.com>, Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Brajeswar Ghosh <brajeswar.linux@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Suchanek's on November 13, 2019 2:52 am:
> There are numerous references to 32bit functions in generic and 64bit
> code so ifdef them out.
>=20
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

For the most part these seem okay to me.

> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 45f1d5e54671..35874119b398 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -44,16 +44,16 @@ CFLAGS_btext.o +=3D -DDISABLE_BRANCH_PROFILING
>  endif
> =20
>  obj-y				:=3D cputable.o ptrace.o syscalls.o \
> -				   irq.o align.o signal_32.o pmc.o vdso.o \
> +				   irq.o align.o signal_$(BITS).o pmc.o vdso.o \
>  				   process.o systbl.o idle.o \
>  				   signal.o sysfs.o cacheinfo.o time.o \
>  				   prom.o traps.o setup-common.o \
>  				   udbg.o misc.o io.o misc_$(BITS).o \
>  				   of_platform.o prom_parse.o
> -obj-$(CONFIG_PPC64)		+=3D setup_64.o sys_ppc32.o \
> -				   signal_64.o ptrace32.o \
> +obj-$(CONFIG_PPC64)		+=3D setup_64.o \
>  				   paca.o nvram_64.o firmware.o note.o \
>  				   syscall_64.o
> +obj-$(CONFIG_COMPAT)		+=3D sys_ppc32.o ptrace32.o signal_32.o
>  obj-$(CONFIG_VDSO32)		+=3D vdso32/
>  obj-$(CONFIG_PPC_WATCHDOG)	+=3D watchdog.o
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+=3D hw_breakpoint.o
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_6=
4.S
> index 00173cc904ef..c339a984958f 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -52,8 +52,10 @@
>  SYS_CALL_TABLE:
>  	.tc sys_call_table[TC],sys_call_table
> =20
> +#ifdef CONFIG_COMPAT
>  COMPAT_SYS_CALL_TABLE:
>  	.tc compat_sys_call_table[TC],compat_sys_call_table
> +#endif
> =20
>  /* This value is used to mark exception frames on the stack. */
>  exception_marker:
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index 60436432399f..61678cb0e6a1 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -247,7 +247,6 @@ static void do_signal(struct task_struct *tsk)
>  	sigset_t *oldset =3D sigmask_to_save();
>  	struct ksignal ksig =3D { .sig =3D 0 };
>  	int ret;
> -	int is32 =3D is_32bit_task();
> =20
>  	BUG_ON(tsk !=3D current);
> =20
> @@ -277,7 +276,7 @@ static void do_signal(struct task_struct *tsk)
> =20
>  	rseq_signal_deliver(&ksig, tsk->thread.regs);
> =20
> -	if (is32) {
> +	if (is_32bit_task()) {
>          	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
>  			ret =3D handle_rt_signal32(&ksig, oldset, tsk);
>  		else

This is just a clean up I guess.

> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sysca=
ll_64.c
> index d00cfc4a39a9..319ebd4f494d 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -17,7 +17,6 @@ typedef long (*syscall_fn)(long, long, long, long, long=
, long);
> =20
>  long system_call_exception(long r3, long r4, long r5, long r6, long r7, =
long r8, unsigned long r0, struct pt_regs *regs)
>  {
> -	unsigned long ti_flags;
>  	syscall_fn f;
> =20
>  	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
> @@ -64,8 +63,7 @@ long system_call_exception(long r3, long r4, long r5, l=
ong r6, long r7, long r8,
> =20
>  	__hard_irq_enable();
> =20
> -	ti_flags =3D current_thread_info()->flags;
> -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> +	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
>  		/*
>  		 * We use the return value of do_syscall_trace_enter() as the
>  		 * syscall number. If the syscall was rejected for any reason
> @@ -81,7 +79,7 @@ long system_call_exception(long r3, long r4, long r5, l=
ong r6, long r7, long r8,
>  	/* May be faster to do array_index_nospec? */
>  	barrier_nospec();
> =20
> -	if (unlikely(ti_flags & _TIF_32BIT)) {
> +	if (unlikely(is_32bit_task())) {
>  		f =3D (void *)compat_sys_call_table[r0];
> =20
>  		r3 &=3D 0x00000000ffffffffULL;

I guess this is okay, I did want to be careful about where ti_flags
was loaded exactly, but I think DOTRACE and 32BIT are not volatile.
Is it possible to define _TIF_32BIT to zero for 64-bit !compat case
and have the original branch eliminated, or does that cause other
problems?

Thanks,
Nick
=
