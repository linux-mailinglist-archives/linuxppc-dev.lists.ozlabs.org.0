Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94650B146A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 20:27:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TnLt2kGXzF4y1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 04:27:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TnJy21B5zF4p1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 04:26:09 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 39C8DAEE0;
 Thu, 12 Sep 2019 18:26:06 +0000 (UTC)
Date: Thu, 12 Sep 2019 20:26:04 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v8 5/7] powerpc/64: make buildable without CONFIG_COMPAT
Message-ID: <20190912202604.14a73423@kitsune.suse.cz>
In-Reply-To: <9973bf6b-f1b9-c778-bd88-ed41e45ca126@c-s.fr>
References: <cover.1568306311.git.msuchanek@suse.de>
 <039ed7ac686927fe169241ac72225a258d95ccfc.1568306311.git.msuchanek@suse.de>
 <9973bf6b-f1b9-c778-bd88-ed41e45ca126@c-s.fr>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Diana Craciun <diana.craciun@nxp.com>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Hari Bathini <hbathini@linux.ibm.com>, "Eric W.
 Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Sep 2019 20:02:16 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Le 12/09/2019 =C3=A0 19:26, Michal Suchanek a =C3=A9crit=C2=A0:
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
> > v7:
> > - remove leftover perf_callchain_user_32 stub from previous series vers=
ion
> > v8:
> > - fix build again - too trigger-happy with stub removal
> > - remove a vdso.c hunk that causes warning according to kbuild test rob=
ot
> > ---
> >   arch/powerpc/include/asm/thread_info.h |  4 +--
> >   arch/powerpc/kernel/Makefile           |  7 ++---
> >   arch/powerpc/kernel/entry_64.S         |  2 ++
> >   arch/powerpc/kernel/signal.c           |  3 +-
> >   arch/powerpc/kernel/syscall_64.c       |  6 ++--
> >   arch/powerpc/kernel/vdso.c             |  3 +-
> >   arch/powerpc/perf/callchain.c          | 39 ++++++++++++++------------
> >   7 files changed, 33 insertions(+), 31 deletions(-)
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
> >   #if defined(CONFIG_PPC64) =20
>=20
> [...]
>=20
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
> > +} =20
>=20
>=20
> Since at least commit ed1cd6deb013 ("powerpc: Activate=20
> CONFIG_THREAD_INFO_IN_TASK")=20
> [https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3Ded1cd6d]=20
> the above comment is wrong and current_is_64bit() is equivalent to=20
> !is_32bit_task()
>=20
> See https://github.com/linuxppc/issues/issues/275
>=20
> Christophe

I aim at changing the code as little as possible here. A separate patch
on top removing this function would be ok?

Thanks

Michal
