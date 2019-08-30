Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F45A3F13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Krtr40CyzDqnB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:39:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KrpP6x6JzDqnM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:35:41 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 041F2AF68;
 Fri, 30 Aug 2019 20:35:38 +0000 (UTC)
Date: Fri, 30 Aug 2019 22:35:35 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v6 4/6] powerpc/64: make buildable without CONFIG_COMPAT
Message-ID: <20190830223535.7ef0b76f@kitsune.suse.cz>
In-Reply-To: <a04b5750-a160-01a1-c208-7950f4c495bd@c-s.fr>
References: <cover.1567188299.git.msuchanek@suse.de>
 <6192bddc4631d2691b98316908432ffabc5d4b40.1567188299.git.msuchanek@suse.de>
 <a04b5750-a160-01a1-c208-7950f4c495bd@c-s.fr>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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

On Fri, 30 Aug 2019 22:21:09 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Le 30/08/2019 =C3=A0 20:57, Michal Suchanek a =C3=A9crit=C2=A0:
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
> > v5:
> > - avoid unreachable code on 32bit
> > - make is_current_64bit constant on !COMPAT
> > - add stub perf_callchain_user_32 to avoid some ifdefs
> > v6:
> > - consolidate current_is_64bit
> > ---
> >   arch/powerpc/include/asm/thread_info.h |  4 +--
> >   arch/powerpc/kernel/Makefile           |  7 +++--
> >   arch/powerpc/kernel/entry_64.S         |  2 ++
> >   arch/powerpc/kernel/signal.c           |  3 +--
> >   arch/powerpc/kernel/syscall_64.c       |  6 ++---
> >   arch/powerpc/kernel/vdso.c             |  5 ++--
> >   arch/powerpc/perf/callchain.c          | 37 +++++++++++++++-----------
> >   7 files changed, 33 insertions(+), 31 deletions(-)
> >  =20
>=20
> [...]
>=20
> > diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchai=
n.c
> > index b7cdcce20280..788ad2c63f18 100644
> > --- a/arch/powerpc/perf/callchain.c
> > +++ b/arch/powerpc/perf/callchain.c
> > @@ -15,7 +15,7 @@
> >   #include <asm/sigcontext.h>
> >   #include <asm/ucontext.h>
> >   #include <asm/vdso.h>
> > -#ifdef CONFIG_PPC64
> > +#ifdef CONFIG_COMPAT
> >   #include "../kernel/ppc32.h"
> >   #endif
> >   #include <asm/pte-walk.h>
> > @@ -268,16 +268,6 @@ static void perf_callchain_user_64(struct perf_cal=
lchain_entry_ctx *entry,
> >   	}
> >   }
> >  =20
> > -static inline int current_is_64bit(void)
> > -{
> > -	/*
> > -	 * We can't use test_thread_flag() here because we may be on an
> > -	 * interrupt stack, and the thread flags don't get copied over
> > -	 * from the thread_info on the main stack to the interrupt stack.
> > -	 */
> > -	return !test_ti_thread_flag(task_thread_info(current), TIF_32BIT);
> > -}
> > -
> >   #else  /* CONFIG_PPC64 */
> >   static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> >   {
> > @@ -314,11 +304,6 @@ static inline void perf_callchain_user_64(struct p=
erf_callchain_entry_ctx *entry
> >   {
> >   }
> >  =20
> > -static inline int current_is_64bit(void)
> > -{
> > -	return 0;
> > -}
> > -
> >   static inline int valid_user_sp(unsigned long sp, int is_64)
> >   {
> >   	if (!sp || (sp & 7) || sp > TASK_SIZE - 32)
> > @@ -334,6 +319,7 @@ static inline int valid_user_sp(unsigned long sp, i=
nt is_64)
> >  =20
> >   #endif /* CONFIG_PPC64 */
> >  =20
> > +#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
> >   /*
> >    * Layout for non-RT signal frames
> >    */
> > @@ -475,6 +461,25 @@ static void perf_callchain_user_32(struct perf_cal=
lchain_entry_ctx *entry,
> >   		sp =3D next_sp;
> >   	}
> >   }
> > +#else /* 32bit */
> > +static void perf_callchain_user_32(struct perf_callchain_entry_ctx *en=
try,
> > +				   struct pt_regs *regs)
> > +{
> > +	(void)&read_user_stack_32; /* unused if !COMPAT */ =20
>=20
> You don't need that anymore do you ?

Yes, this part is not needed. It was removed later anyway but this
state is broken.

Thanks

Michal

>=20
> Christophe
>=20
> > +}
> > +#endif /* 32bit */
> > +
> > +static inline int current_is_64bit(void)
> > +{
> > +	if (!IS_ENABLED(CONFIG_COMPAT))
> > +		return IS_ENABLED(CONFIG_PPC64);
> > +	/*
> > +	 * We can't use test_thread_flag() here because we may be on an
> > +	 * interrupt stack, and the thread flags don't get copied over
> > +	 * from the thread_info on the main stack to the interrupt stack.
> > +	 */
> > +	return !test_ti_thread_flag(task_thread_info(current), TIF_32BIT);
> > +}
> >  =20
> >   void
> >   perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt=
_regs *regs)
> >  =20

