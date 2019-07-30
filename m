Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478F7B652
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 01:41:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ytNT2X8dzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 09:40:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=131.153.2.43; helo=h2.fbrelay.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 440 seconds by postgrey-1.36 at bilbo;
 Wed, 31 Jul 2019 09:39:06 AEST
Received: from h2.fbrelay.privateemail.com (h2.fbrelay.privateemail.com
 [131.153.2.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ytLL3HKbzDqW4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 09:39:06 +1000 (AEST)
Received: from MTA-09-4.privateemail.com (mta-09.privateemail.com
 [198.54.127.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 5135581311
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 19:31:42 -0400 (EDT)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 0D1AD6004F;
 Tue, 30 Jul 2019 19:31:33 -0400 (EDT)
Received: from APP-04 (unknown [10.20.147.154])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id D5D676003F;
 Tue, 30 Jul 2019 23:31:32 +0000 (UTC)
Date: Tue, 30 Jul 2019 18:31:32 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Message-ID: <1271264633.409807.1564529492813@privateemail.com>
In-Reply-To: <87ef27us38.fsf@morokweng.localdomain>
References: <20190728125438.1550-1-cmr@informatik.wtf>
 <20190728125438.1550-2-cmr@informatik.wtf>
 <87ef27us38.fsf@morokweng.localdomain>
Subject: Re: [PATCH 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On July 30, 2019 at 4:31 PM Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
> 
> 
> 
> Christopher M. Riedl <cmr@informatik.wtf> writes:
> 
> > Determining if a processor is in shared processor mode is not a constant
> > so don't hide it behind a #define.
> >
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >  arch/powerpc/include/asm/spinlock.h | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> > index a47f827bc5f1..8631b0b4e109 100644
> > --- a/arch/powerpc/include/asm/spinlock.h
> > +++ b/arch/powerpc/include/asm/spinlock.h
> > @@ -101,15 +101,24 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
> >
> >  #if defined(CONFIG_PPC_SPLPAR)
> >  /* We only yield to the hypervisor if we are in shared processor mode */
> > -#define SHARED_PROCESSOR (lppaca_shared_proc(local_paca->lppaca_ptr))
> >  extern void __spin_yield(arch_spinlock_t *lock);
> >  extern void __rw_yield(arch_rwlock_t *lock);
> >  #else /* SPLPAR */
> >  #define __spin_yield(x)	barrier()
> >  #define __rw_yield(x)	barrier()
> > -#define SHARED_PROCESSOR	0
> >  #endif
> >
> > +static inline bool is_shared_processor(void)
> > +{
> > +/* Only server processors have an lppaca struct */
> > +#ifdef CONFIG_PPC_BOOK3S
> > +	return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
> > +		lppaca_shared_proc(local_paca->lppaca_ptr));
> > +#else
> > +	return false;
> > +#endif
> > +}
> > +
> 
> CONFIG_PPC_SPLPAR depends on CONFIG_PPC_PSERIES, which depends on
> CONFIG_PPC_BOOK3S so the #ifdef above is unnecessary:
> 
> if CONFIG_PPC_BOOK3S is unset then CONFIG_PPC_SPLPAR will be unset as
> well and the return expression should short-circuit to false.
> 

Agreed, but the #ifdef is necessary to compile platforms which include
this header but do not implement lppaca_shared_proc(...) and friends.
I can reword the comment if that helps.

> --
> Thiago Jung Bauermann
> IBM Linux Technology Center
