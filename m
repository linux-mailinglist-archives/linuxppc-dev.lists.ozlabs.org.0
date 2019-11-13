Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD058FAC2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 09:43:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CdST59x1zF43m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 19:43:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CdQF00W3zF7NS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 19:41:55 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2237BB11F;
 Wed, 13 Nov 2019 08:41:49 +0000 (UTC)
Date: Wed, 13 Nov 2019 09:41:37 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 31/33] powerpc/64: make buildable without CONFIG_COMPAT
Message-ID: <20191113084137.GI2770@kitsune.suse.cz>
References: <cover.1573576649.git.msuchanek@suse.de>
 <13fa324dc879a7f325290bf2e131b87eb491cd7b.1573576649.git.msuchanek@suse.de>
 <1573613683.ylw9dz9mlc.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573613683.ylw9dz9mlc.astroid@bobo.none>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 13, 2019 at 01:02:34PM +1000, Nicholas Piggin wrote:
> Michal Suchanek's on November 13, 2019 2:52 am:
> > There are numerous references to 32bit functions in generic and 64bit
> > code so ifdef them out.
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> 
> For the most part these seem okay to me.
> 
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> > index 45f1d5e54671..35874119b398 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -44,16 +44,16 @@ CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
> >  endif
> >  
> >  obj-y				:= cputable.o ptrace.o syscalls.o \
> > -				   irq.o align.o signal_32.o pmc.o vdso.o \
> > +				   irq.o align.o signal_$(BITS).o pmc.o vdso.o \
> >  				   process.o systbl.o idle.o \
> >  				   signal.o sysfs.o cacheinfo.o time.o \
> >  				   prom.o traps.o setup-common.o \
> >  				   udbg.o misc.o io.o misc_$(BITS).o \
> >  				   of_platform.o prom_parse.o
> > -obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
> > -				   signal_64.o ptrace32.o \
> > +obj-$(CONFIG_PPC64)		+= setup_64.o \
> >  				   paca.o nvram_64.o firmware.o note.o \
> >  				   syscall_64.o
> > +obj-$(CONFIG_COMPAT)		+= sys_ppc32.o ptrace32.o signal_32.o
> >  obj-$(CONFIG_VDSO32)		+= vdso32/
> >  obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
> >  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
> > diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> > index 00173cc904ef..c339a984958f 100644
> > --- a/arch/powerpc/kernel/entry_64.S
> > +++ b/arch/powerpc/kernel/entry_64.S
> > @@ -52,8 +52,10 @@
> >  SYS_CALL_TABLE:
> >  	.tc sys_call_table[TC],sys_call_table
> >  
> > +#ifdef CONFIG_COMPAT
> >  COMPAT_SYS_CALL_TABLE:
> >  	.tc compat_sys_call_table[TC],compat_sys_call_table
> > +#endif
> >  
> >  /* This value is used to mark exception frames on the stack. */
> >  exception_marker:
> > diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> > index 60436432399f..61678cb0e6a1 100644
> > --- a/arch/powerpc/kernel/signal.c
> > +++ b/arch/powerpc/kernel/signal.c
> > @@ -247,7 +247,6 @@ static void do_signal(struct task_struct *tsk)
> >  	sigset_t *oldset = sigmask_to_save();
> >  	struct ksignal ksig = { .sig = 0 };
> >  	int ret;
> > -	int is32 = is_32bit_task();
> >  
> >  	BUG_ON(tsk != current);
> >  
> > @@ -277,7 +276,7 @@ static void do_signal(struct task_struct *tsk)
> >  
> >  	rseq_signal_deliver(&ksig, tsk->thread.regs);
> >  
> > -	if (is32) {
> > +	if (is_32bit_task()) {
> >          	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
> >  			ret = handle_rt_signal32(&ksig, oldset, tsk);
> >  		else
> 
> This is just a clean up I guess.

It also expands directly to if(0) or if(1) for the !COMPAT cases. I am
not sure how it would work with the intermediate variable.

There was more complex change initially but after some additional
cleanups removing the variable is the only part left.

> 
> > diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> > index d00cfc4a39a9..319ebd4f494d 100644
> > --- a/arch/powerpc/kernel/syscall_64.c
> > +++ b/arch/powerpc/kernel/syscall_64.c
> > @@ -17,7 +17,6 @@ typedef long (*syscall_fn)(long, long, long, long, long, long);
> >  
> >  long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs)
> >  {
> > -	unsigned long ti_flags;
> >  	syscall_fn f;
> >  
> >  	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
> > @@ -64,8 +63,7 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
> >  
> >  	__hard_irq_enable();
> >  
> > -	ti_flags = current_thread_info()->flags;
> > -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> > +	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
> >  		/*
> >  		 * We use the return value of do_syscall_trace_enter() as the
> >  		 * syscall number. If the syscall was rejected for any reason
> > @@ -81,7 +79,7 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
> >  	/* May be faster to do array_index_nospec? */
> >  	barrier_nospec();
> >  
> > -	if (unlikely(ti_flags & _TIF_32BIT)) {
> > +	if (unlikely(is_32bit_task())) {
> >  		f = (void *)compat_sys_call_table[r0];
> >  
> >  		r3 &= 0x00000000ffffffffULL;
> 
> I guess this is okay, I did want to be careful about where ti_flags
> was loaded exactly, but I think DOTRACE and 32BIT are not volatile.
> Is it possible to define _TIF_32BIT to zero for 64-bit !compat case
> and have the original branch eliminated, or does that cause other
> problems?

is_32bit_task() expands to 0 or 1 constant unless CONFIG_COMPAT is set.
That's why the test needs replacing here.

Unsetting _TIF_32BIT might also be feasible but it is not necessary.

Thanks

Michal
