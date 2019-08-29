Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB4A268D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 20:58:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KBhF63T6zDrfM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 04:58:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KBf65mDDzDrby
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 04:56:12 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B20A6ABBD;
 Thu, 29 Aug 2019 18:56:08 +0000 (UTC)
Date: Thu, 29 Aug 2019 20:56:05 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v4 3/4] powerpc/64: make buildable without CONFIG_COMPAT
Message-ID: <20190829205605.25c72774@naga>
In-Reply-To: <45bdadce-5b44-c941-14f7-240b0be41a7b@c-s.fr>
References: <cover.1567072270.git.msuchanek@suse.de>
 <a829dfabed8285161fcdff166d58c7e8f0f6d402.1567072270.git.msuchanek@suse.de>
 <45bdadce-5b44-c941-14f7-240b0be41a7b@c-s.fr>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Michael Neuling <mikey@neuling.org>, Arnd Bergmann <arnd@arndb.de>,
 Nicolai Stange <nstange@suse.de>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Christian Brauner <christian@brauner.io>,
 Firoz Khan <firoz.khan@linaro.org>, Breno Leitao <leitao@debian.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>, "Eric W.
 Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Aug 2019 19:40:55 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Le 29/08/2019 =C3=A0 12:23, Michal Suchanek a =C3=A9crit=C2=A0:
> > There are numerous references to 32bit functions in generic and 64bit
> > code so ifdef them out.
> >=20
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > v2:
> > - fix 32bit ifdef condition in signal.c
> > - simplify the compat ifdef condition in vdso.c - 64bit is redundant
> > - simplify the compat ifdef condition in callchain.c - 64bit is redunda=
nt
> > v3:
> > - use IS_ENABLED and maybe_unused where possible
> > - do not ifdef declarations
> > - clean up Makefile
> > v4:
> > - further makefile cleanup
> > - simplify is_32bit_task conditions
> > - avoid ifdef in condition by using return
> > ---
> >   arch/powerpc/include/asm/thread_info.h |  4 ++--
> >   arch/powerpc/kernel/Makefile           |  7 +++----
> >   arch/powerpc/kernel/entry_64.S         |  2 ++
> >   arch/powerpc/kernel/signal.c           |  3 +--
> >   arch/powerpc/kernel/syscall_64.c       |  6 ++----
> >   arch/powerpc/kernel/vdso.c             |  5 ++---
> >   arch/powerpc/perf/callchain.c          | 14 ++++++++++----
> >   7 files changed, 22 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/incl=
ude/asm/thread_info.h
> > index 8e1d0195ac36..c128d8a48ea3 100644
> > --- a/arch/powerpc/include/asm/thread_info.h
> > +++ b/arch/powerpc/include/asm/thread_info.h
> > @@ -144,10 +144,10 @@ static inline bool test_thread_local_flags(unsign=
ed int flags)
> >   	return (ti->local_flags & flags) !=3D 0;
> >   }
> >  =20
> > -#ifdef CONFIG_PPC64
> > +#ifdef CONFIG_COMPAT
> >   #define is_32bit_task()	(test_thread_flag(TIF_32BIT))
> >   #else
> > -#define is_32bit_task()	(1)
> > +#define is_32bit_task()	(IS_ENABLED(CONFIG_PPC32))
> >   #endif
> >  =20
> >   #if defined(CONFIG_PPC64)
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> > index 1d646a94d96c..9d8772e863b9 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -44,16 +44,15 @@ CFLAGS_btext.o +=3D -DDISABLE_BRANCH_PROFILING
> >   endif
> >  =20
> >   obj-y				:=3D cputable.o ptrace.o syscalls.o \
> > -				   irq.o align.o signal_32.o pmc.o vdso.o \
> > +				   irq.o align.o signal_$(BITS).o pmc.o vdso.o \
> >   				   process.o systbl.o idle.o \
> >   				   signal.o sysfs.o cacheinfo.o time.o \
> >   				   prom.o traps.o setup-common.o \
> >   				   udbg.o misc.o io.o misc_$(BITS).o \
> >   				   of_platform.o prom_parse.o
> > -obj-$(CONFIG_PPC64)		+=3D setup_64.o sys_ppc32.o \
> > -				   signal_64.o ptrace32.o \
> > -				   paca.o nvram_64.o firmware.o \
> > +obj-$(CONFIG_PPC64)		+=3D setup_64.o paca.o nvram_64.o firmware.o \
> >   				   syscall_64.o
> > +obj-$(CONFIG_COMPAT)		+=3D sys_ppc32.o ptrace32.o signal_32.o
> >   obj-$(CONFIG_VDSO32)		+=3D vdso32/
> >   obj-$(CONFIG_PPC_WATCHDOG)	+=3D watchdog.o
> >   obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+=3D hw_breakpoint.o
> > diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry=
_64.S
> > index 2ec825a85f5b..a2dbf216f607 100644
> > --- a/arch/powerpc/kernel/entry_64.S
> > +++ b/arch/powerpc/kernel/entry_64.S
> > @@ -51,8 +51,10 @@
> >   SYS_CALL_TABLE:
> >   	.tc sys_call_table[TC],sys_call_table
> >  =20
> > +#ifdef CONFIG_COMPAT
> >   COMPAT_SYS_CALL_TABLE:
> >   	.tc compat_sys_call_table[TC],compat_sys_call_table
> > +#endif
> >  =20
> >   /* This value is used to mark exception frames on the stack. */
> >   exception_marker:
> > diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> > index 60436432399f..61678cb0e6a1 100644
> > --- a/arch/powerpc/kernel/signal.c
> > +++ b/arch/powerpc/kernel/signal.c
> > @@ -247,7 +247,6 @@ static void do_signal(struct task_struct *tsk)
> >   	sigset_t *oldset =3D sigmask_to_save();
> >   	struct ksignal ksig =3D { .sig =3D 0 };
> >   	int ret;
> > -	int is32 =3D is_32bit_task();
> >  =20
> >   	BUG_ON(tsk !=3D current);
> >  =20
> > @@ -277,7 +276,7 @@ static void do_signal(struct task_struct *tsk)
> >  =20
> >   	rseq_signal_deliver(&ksig, tsk->thread.regs);
> >  =20
> > -	if (is32) {
> > +	if (is_32bit_task()) {
> >           	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
> >   			ret =3D handle_rt_signal32(&ksig, oldset, tsk);
> >   		else
> > diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sys=
call_64.c
> > index 98ed970796d5..0d5cbbe54cf1 100644
> > --- a/arch/powerpc/kernel/syscall_64.c
> > +++ b/arch/powerpc/kernel/syscall_64.c
> > @@ -38,7 +38,6 @@ typedef long (*syscall_fn)(long, long, long, long, lo=
ng, long);
> >  =20
> >   long system_call_exception(long r3, long r4, long r5, long r6, long r=
7, long r8, unsigned long r0, struct pt_regs *regs)
> >   {
> > -	unsigned long ti_flags;
> >   	syscall_fn f;
> >  =20
> >   	BUG_ON(!(regs->msr & MSR_PR));
> > @@ -83,8 +82,7 @@ long system_call_exception(long r3, long r4, long r5,=
 long r6, long r7, long r8,
> >   	 */
> >   	regs->softe =3D IRQS_ENABLED;
> >  =20
> > -	ti_flags =3D current_thread_info()->flags;
> > -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> > +	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
> >   		/*
> >   		 * We use the return value of do_syscall_trace_enter() as the
> >   		 * syscall number. If the syscall was rejected for any reason
> > @@ -100,7 +98,7 @@ long system_call_exception(long r3, long r4, long r5=
, long r6, long r7, long r8,
> >   	/* May be faster to do array_index_nospec? */
> >   	barrier_nospec();
> >  =20
> > -	if (unlikely(ti_flags & _TIF_32BIT)) {
> > +	if (unlikely(is_32bit_task())) {
> >   		f =3D (void *)compat_sys_call_table[r0];
> >  =20
> >   		r3 &=3D 0x00000000ffffffffULL;
> > diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> > index d60598113a9f..6d4a077f74d6 100644
> > --- a/arch/powerpc/kernel/vdso.c
> > +++ b/arch/powerpc/kernel/vdso.c
> > @@ -667,9 +667,7 @@ static void __init vdso_setup_syscall_map(void)
> >   {
> >   	unsigned int i;
> >   	extern unsigned long *sys_call_table;
> > -#ifdef CONFIG_PPC64
> >   	extern unsigned long *compat_sys_call_table;
> > -#endif
> >   	extern unsigned long sys_ni_syscall;
> >  =20
> >  =20
> > @@ -678,7 +676,8 @@ static void __init vdso_setup_syscall_map(void)
> >   		if (sys_call_table[i] !=3D sys_ni_syscall)
> >   			vdso_data->syscall_map_64[i >> 5] |=3D
> >   				0x80000000UL >> (i & 0x1f);
> > -		if (compat_sys_call_table[i] !=3D sys_ni_syscall)
> > +		if (IS_ENABLED(CONFIG_COMPAT) &&
> > +		    compat_sys_call_table[i] !=3D sys_ni_syscall)
> >   			vdso_data->syscall_map_32[i >> 5] |=3D
> >   				0x80000000UL >> (i & 0x1f);
> >   #else /* CONFIG_PPC64 */
> > diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchai=
n.c
> > index c84bbd4298a0..aef8c750d242 100644
> > --- a/arch/powerpc/perf/callchain.c
> > +++ b/arch/powerpc/perf/callchain.c
> > @@ -15,7 +15,7 @@
> >   #include <asm/sigcontext.h>
> >   #include <asm/ucontext.h>
> >   #include <asm/vdso.h>
> > -#ifdef CONFIG_PPC64
> > +#ifdef CONFIG_COMPAT =20
>=20
> Is this ifdef needed at all ? Is it a problem to include it all the time ?

Yes, it is a problem. Some 32bit structures are not defined giving an
error.

>=20
> >   #include "../kernel/ppc32.h"
> >   #endif
> >   #include <asm/pte-walk.h>
> > @@ -165,6 +165,7 @@ static int read_user_stack_64(unsigned long __user =
*ptr, unsigned long *ret)
> >   	return read_user_stack_slow(ptr, ret, 8);
> >   }
> >  =20
> > +__maybe_unused =20
>=20
> I don't like that too much. I see this function is almost identical=20
> between PPC64 and PPC32. It should be possible to have only one, using=20
> IS_ENABLED(CONFIG_PPC64) inside it to call read_user_stack_slow().
> An define a dummy read_user_stack_slow() for PPC32 as already done for=20
> perf_callchain_user_64().

We need to #ifdef the block below anyway because it needs 32bit
structures defined which aren't. So can add usage there.

>=20
> >   static int read_user_stack_32(unsigned int __user *ptr, unsigned int =
*ret)
> >   {
> >   	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> > @@ -341,6 +342,7 @@ static inline int valid_user_sp(unsigned long sp, i=
nt is_64)
> >  =20
> >   #endif /* CONFIG_PPC64 */
> >  =20
> > +#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
> >   /*
> >    * Layout for non-RT signal frames
> >    */
> > @@ -482,12 +484,16 @@ static void perf_callchain_user_32(struct perf_ca=
llchain_entry_ctx *entry,
> >   		sp =3D next_sp;
> >   	}
> >   }
> > +#endif /* 32bit */
> >  =20
> >   void
> >   perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt=
_regs *regs)
> >   {
> > -	if (current_is_64bit())
> > -		perf_callchain_user_64(entry, regs);
> > -	else
> > +#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
> > +	if (!current_is_64bit()) {
> >   		perf_callchain_user_32(entry, regs);
> > +		return;
> > +	}
> > +#endif
> > +	perf_callchain_user_64(entry, regs);
> >   }
> >  =20
>=20
> Instead of that it could just be:
>=20
> 	if (current_is_64bit())
> 		perf_callchain_user_64(entry, regs);
> 	else
> 		perf_callchain_user_32(entry, regs);
>=20
>=20
> By adding a dummy perf_callchain_user_32() when needed as already done=20
> for perf_callchain_user_64()

and it can do a dummy use of the function above as well.

> And by making sure current_is_64bit() returns IS_ENABLED(CONFIG_PPC64)=20
> when CONFIG_COMPAT is not set, on the same principle as you did for=20
> is_32bit_task()
Yes, that would make it constant for the !COMPAT cases.
>=20
> And maybe you could think about spliting callchain.c out in a=20
> callchain_32.c and a callchain_64.c that gets selected by the Makefiles=20
> based on the same principle as you did for ptrace_32.c etc...

I actually did not split those. Can look how splitting is done there
and if it can be applied to the callchain situation.

Thanks

Michal
