Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EDEA053A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 16:45:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JT6z0Xw4zDqK9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 00:45:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JSnH3V2BzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 00:29:55 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D8E1B620;
 Wed, 28 Aug 2019 14:29:51 +0000 (UTC)
Date: Wed, 28 Aug 2019 16:29:45 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 3/4] powerpc/64: make buildable without CONFIG_COMPAT
Message-ID: <20190828162945.50b86232@naga>
In-Reply-To: <fb471a46-5598-1c5c-911f-499b1aad259c@c-s.fr>
References: <cover.1566987936.git.msuchanek@suse.de>
 <fbf3f09d2f01e53aceea448ac42578251f424829.1566987936.git.msuchanek@suse.de>
 <fb471a46-5598-1c5c-911f-499b1aad259c@c-s.fr>
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
Cc: David Hildenbrand <david@redhat.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Firoz Khan <firoz.khan@linaro.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Aug 2019 14:49:16 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Le 28/08/2019 =C3=A0 12:30, Michal Suchanek a =C3=A9crit=C2=A0:
> > There are numerous references to 32bit functions in generic and 64bit
> > code so ifdef them out. =20
>=20
> As far as possible, avoid opting things out with ifdefs. Ref=20
> https://www.kernel.org/doc/html/latest/process/coding-style.html#conditio=
nal-compilation
>=20
> See comment below.
>=20
> >=20
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > v2:
> > - fix 32bit ifdef condition in signal.c
> > - simplify the compat ifdef condition in vdso.c - 64bit is redundant
> > - simplify the compat ifdef condition in callchain.c - 64bit is redunda=
nt
> > ---
> >   arch/powerpc/include/asm/syscall.h |  2 ++
> >   arch/powerpc/kernel/Makefile       | 15 ++++++++++++---
> >   arch/powerpc/kernel/entry_64.S     |  2 ++
> >   arch/powerpc/kernel/signal.c       |  5 +++--
> >   arch/powerpc/kernel/syscall_64.c   |  5 +++--
> >   arch/powerpc/kernel/vdso.c         |  4 +++-
> >   arch/powerpc/perf/callchain.c      | 14 ++++++++++----
> >   7 files changed, 35 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/=
asm/syscall.h
> > index 38d62acfdce7..3ed3b75541a1 100644
> > --- a/arch/powerpc/include/asm/syscall.h
> > +++ b/arch/powerpc/include/asm/syscall.h
> > @@ -16,7 +16,9 @@
> >  =20
> >   /* ftrace syscalls requires exporting the sys_call_table */
> >   extern const unsigned long sys_call_table[];
> > +#ifdef CONFIG_COMPAT
> >   extern const unsigned long compat_sys_call_table[];
> > +#endif =20
>=20
> Leaving the declaration should be harmless.

Yes, it only allows earlier check that the type is not used.

>=20
> >  =20
> >   static inline int syscall_get_nr(struct task_struct *task, struct pt_=
regs *regs)
> >   {
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> > index 1d646a94d96c..b0db365b83d8 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -44,16 +44,25 @@ CFLAGS_btext.o +=3D -DDISABLE_BRANCH_PROFILING
> >   endif
> >  =20
> >   obj-y				:=3D cputable.o ptrace.o syscalls.o \
> > -				   irq.o align.o signal_32.o pmc.o vdso.o \
> > +				   irq.o align.o pmc.o vdso.o \
> >   				   process.o systbl.o idle.o \
> >   				   signal.o sysfs.o cacheinfo.o time.o \
> >   				   prom.o traps.o setup-common.o \
> >   				   udbg.o misc.o io.o misc_$(BITS).o \
> >   				   of_platform.o prom_parse.o
> > -obj-$(CONFIG_PPC64)		+=3D setup_64.o sys_ppc32.o \
> > -				   signal_64.o ptrace32.o \
> > +ifndef CONFIG_PPC64
> > +obj-y				+=3D signal_32.o
> > +else
> > +ifdef CONFIG_COMPAT
> > +obj-y				+=3D signal_32.o
> > +endif
> > +endif
> > +obj-$(CONFIG_PPC64)		+=3D setup_64.o signal_64.o \
> >   				   paca.o nvram_64.o firmware.o \
> >   				   syscall_64.o =20
>=20
> That's still a bit messy. You could have:
>=20
> obj-y =3D +=3Dsignal_$(BITS).o
> obj-$(CONFIG_COMPAT) +=3D signal_32.o
>=20
> > +ifdef CONFIG_COMPAT
> > +obj-$(CONFIG_PPC64)		+=3D sys_ppc32.o ptrace32.o
> > +endif =20
>=20
> AFAIK, CONFIG_COMPAT is only defined when CONFIG_PP64 is defined, so=20
> could be:
>=20
> obj-$(CONFIG_COMPAT)		+=3D sys_ppc32.o ptrace32.o
>=20
> And could be grouped with the above signal_32.o
>=20

Looks better.

>=20
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
> > +#endif =20
>=20
> Can we avoid this ifdef ?

AFAICT it creates reference to non-existent table otherwise.

>=20
> >  =20
> >   /* This value is used to mark exception frames on the stack. */
> >   exception_marker:
> > diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> > index 60436432399f..ffd045e9fb57 100644
> > --- a/arch/powerpc/kernel/signal.c
> > +++ b/arch/powerpc/kernel/signal.c
> > @@ -277,14 +277,15 @@ static void do_signal(struct task_struct *tsk)
> >  =20
> >   	rseq_signal_deliver(&ksig, tsk->thread.regs);
> >  =20
> > +#if !defined(CONFIG_PPC64) || defined(CONFIG_COMPAT)
> >   	if (is32) {
> >           	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
> >   			ret =3D handle_rt_signal32(&ksig, oldset, tsk);
> >   		else
> >   			ret =3D handle_signal32(&ksig, oldset, tsk);
> > -	} else {
> > +	} else =20
>=20
> " if only one branch of a conditional statement is a single statement=20
> [...] use braces in both branches"
>=20
> Ref=20
> https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-=
braces-and-spaces
>=20
> > +#endif /* 32bit */ =20
>=20
> Having an #ifdef in a middle of a if/else is gross.
>=20
> Check what are the possible values for is32. It will be always true=20
> which CONFIG_PPC32.
> If you can make sure it is always false without CONFIG_COMPAT, you are=20
> done. If not, then combine the if(is32) with something involving=20
> IS_ENABLED(CONFIG_COMPAT).

The value of is32 is not a problem. References to non-existent
functions could be.

...

> > diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchai=
n.c
> > index c84bbd4298a0..b3dacc8bc98d 100644
> > --- a/arch/powerpc/perf/callchain.c
> > +++ b/arch/powerpc/perf/callchain.c
> > @@ -15,7 +15,7 @@
> >   #include <asm/sigcontext.h>
> >   #include <asm/ucontext.h>
> >   #include <asm/vdso.h>
> > -#ifdef CONFIG_PPC64
> > +#ifdef CONFIG_COMPAT
> >   #include "../kernel/ppc32.h"

/srv/kernel/arch/powerpc/perf/../kernel/ppc32.h:50:2: error: unknown type n=
ame =E2=80=98compat_stack_t=E2=80=99

When required declarations are ifdefed in compat.h

> >  =20
> >   static inline int valid_user_sp(unsigned long sp, int is_64)
> >   {
> > @@ -341,6 +343,7 @@ static inline int valid_user_sp(unsigned long sp, i=
nt is_64)
> >  =20
> >   #endif /* CONFIG_PPC64 */
> >  =20
> > +#if !defined(CONFIG_PPC64) || defined(CONFIG_COMPAT) =20
>=20
> You don't need to opt that out.

You need to opt out here:

/srv/kernel/arch/powerpc/perf/callchain.c:349:22: error: field =E2=80=98sct=
x=E2=80=99 has incomplete type
  struct sigcontext32 sctx;
/srv/kernel/arch/powerpc/perf/callchain.c:359:2: error: unknown type name =
=E2=80=98compat_siginfo_t=E2=80=99
  compat_siginfo_t info;
...
>=20
> >   /*
> >    * Layout for non-RT signal frames
> >    */
> > @@ -482,12 +485,15 @@ static void perf_callchain_user_32(struct perf_ca=
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
> > +#if !defined(CONFIG_PPC64) || defined(CONFIG_COMPAT)
> > +	if (!current_is_64bit())
> >   		perf_callchain_user_32(entry, regs);
> > +	else
> > +#endif
> > +		perf_callchain_user_64(entry, regs); =20
>=20
> Please rewrite using  IS_ENABLED() instead of #ifdefs.

And ifdef here.

The ifdefs could be potentially reduced in some places, though.

Thanks

Michal
