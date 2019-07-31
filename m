Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A037B808
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 04:37:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yyJZ6xlbzDqXP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 12:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=68.65.122.27; helo=mta-07-4.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 11076 seconds by postgrey-1.36 at bilbo;
 Wed, 31 Jul 2019 12:36:14 AEST
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yyGk61MszDqDG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 12:36:13 +1000 (AEST)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id DB4D56004F;
 Tue, 30 Jul 2019 22:36:08 -0400 (EDT)
Received: from APP-07 (unknown [10.20.147.157])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id B36F760049;
 Wed, 31 Jul 2019 02:36:08 +0000 (UTC)
Date: Tue, 30 Jul 2019 21:36:08 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Message-ID: <1710393174.412654.1564540568692@privateemail.com>
In-Reply-To: <87d0hrukom.fsf@morokweng.localdomain>
References: <20190728125438.1550-1-cmr@informatik.wtf>
 <20190728125438.1550-2-cmr@informatik.wtf>
 <87ef27us38.fsf@morokweng.localdomain>
 <1271264633.409807.1564529492813@privateemail.com>
 <87d0hrukom.fsf@morokweng.localdomain>
Subject: Re: [PATCH 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@ozlabs.org, linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On July 30, 2019 at 7:11 PM Thiago Jung Bauermann <bauerman@linux.ibm.com=
> wrote:
>=20
>=20
>=20
> Christopher M Riedl <cmr@informatik.wtf> writes:
>=20
> >> On July 30, 2019 at 4:31 PM Thiago Jung Bauermann <bauerman@linux.ibm.=
com> wrote:
> >>
> >>
> >>
> >> Christopher M. Riedl <cmr@informatik.wtf> writes:
> >>
> >> > Determining if a processor is in shared processor mode is not a cons=
tant
> >> > so don't hide it behind a #define.
> >> >
> >> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> >> > ---
> >> >  arch/powerpc/include/asm/spinlock.h | 21 +++++++++++++++------
> >> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >> >
> >> > diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/incl=
ude/asm/spinlock.h
> >> > index a47f827bc5f1..8631b0b4e109 100644
> >> > --- a/arch/powerpc/include/asm/spinlock.h
> >> > +++ b/arch/powerpc/include/asm/spinlock.h
> >> > @@ -101,15 +101,24 @@ static inline int arch_spin_trylock(arch_spinl=
ock_t *lock)
> >> >
> >> >  #if defined(CONFIG_PPC_SPLPAR)
> >> >  /* We only yield to the hypervisor if we are in shared processor mo=
de */
> >> > -#define SHARED_PROCESSOR (lppaca_shared_proc(local_paca->lppaca_ptr=
))
> >> >  extern void __spin_yield(arch_spinlock_t *lock);
> >> >  extern void __rw_yield(arch_rwlock_t *lock);
> >> >  #else /* SPLPAR */
> >> >  #define __spin_yield(x)=09barrier()
> >> >  #define __rw_yield(x)=09barrier()
> >> > -#define SHARED_PROCESSOR=090
> >> >  #endif
> >> >
> >> > +static inline bool is_shared_processor(void)
> >> > +{
> >> > +/* Only server processors have an lppaca struct */
> >> > +#ifdef CONFIG_PPC_BOOK3S
> >> > +=09return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
> >> > +=09=09lppaca_shared_proc(local_paca->lppaca_ptr));
> >> > +#else
> >> > +=09return false;
> >> > +#endif
> >> > +}
> >> > +
> >>
> >> CONFIG_PPC_SPLPAR depends on CONFIG_PPC_PSERIES, which depends on
> >> CONFIG_PPC_BOOK3S so the #ifdef above is unnecessary:
> >>
> >> if CONFIG_PPC_BOOK3S is unset then CONFIG_PPC_SPLPAR will be unset as
> >> well and the return expression should short-circuit to false.
> >>
> >
> > Agreed, but the #ifdef is necessary to compile platforms which include
> > this header but do not implement lppaca_shared_proc(...) and friends.
> > I can reword the comment if that helps.
>=20
> Ah, indeed. Yes, if you could mention that in the commit I think it
> would help. These #ifdefs are becoming d=C3=A9mod=C3=A9 so it's good to k=
now why
> they're there.
>=20
> Another alternative is to provide a dummy lppaca_shared_proc() which
> always returns false when CONFIG_PPC_BOOK3S isn't set (just mentioning
> it, I don't have a preference).
>=20

Yeah, I tried that first, but the declaration and definition for lppaca_sha=
red_proc()
and arguments are nested within several includes and arch/platform #ifdefs =
that I
decided the #ifdef in is_shared_processor() is simpler.
I am not sure if unraveling all that makes sense for implementing this fix,=
 maybe
someone can convince me hah.

In any case, next version will have an improved commit message and comment.

> --
> Thiago Jung Bauermann
> IBM Linux Technology Center
