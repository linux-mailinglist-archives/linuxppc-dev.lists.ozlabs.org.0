Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C108C6E2583
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 16:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PydtH4rBSz3fTp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 00:21:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bRZh3ytj;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PMRSDics;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bRZh3ytj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PMRSDics;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PydsP4ZbMz3fRd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Apr 2023 00:20:57 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 17A9C219D7;
	Fri, 14 Apr 2023 14:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681482053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MobFjdss3cIt7PrNBEXotgnQywA5ThDPktKEp404OhM=;
	b=bRZh3ytjoBtRslYkw8sneWwRMN9HdIHKonsn9pmiSs1tyfHaVcUF+HYt0/kS/aKTtPetD4
	JtleiNOPhM7oypovfbhbhV1MUq9tUlfmNXo7Q6vhSk1NxLu6NUosizZZTiTwltTIJ+atuv
	y42D+CzUqKJ1fjsrKsu2dnzi4oRESEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681482053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MobFjdss3cIt7PrNBEXotgnQywA5ThDPktKEp404OhM=;
	b=PMRSDicsKYJ+sop/y5Mde/tLuFoaEWN4OtCqsID6dI0s4TnFNXZPpSchniSIGvTc9UsqZu
	8xKsuJSmQOTf94Ag==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id CE08A2C143;
	Fri, 14 Apr 2023 14:20:52 +0000 (UTC)
Date: Fri, 14 Apr 2023 16:20:51 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
Message-ID: <20230414142051.GH63923@kunlun.suse.cz>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
 <87y1uotlfa.fsf@linux.ibm.com>
 <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
 <CMXFROL4N1OT.4DV7ZOHOP954@bobo>
 <87h717t24d.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h717t24d.fsf@linux.ibm.com>
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
Cc: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Fri, Sep 16, 2022 at 04:56:18PM -0500, Nathan Lynch wrote:
> "Nicholas Piggin" <npiggin@gmail.com> writes:
> > On Wed Sep 14, 2022 at 3:39 AM AEST, Leonardo Brás wrote:
> >> On Mon, 2022-09-12 at 14:58 -0500, Nathan Lynch wrote:
> >> > Leonardo Brás <leobras.c@gmail.com> writes:
> >> > > On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:

> >> > > > No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
> >> > > > Implement reentrant rtas call") change is incorrect. The "reentrant"
> >> > > > property described in the spec applies only to the individual RTAS
> >> > > > functions. The OS can invoke (for example) ibm,set-xive on multiple CPUs
> >> > > > simultaneously, but it must adhere to the more general requirement to
> >> > > > serialize with other RTAS functions.
> >> > > > 
> >> > > 
> >> > > I see. Thanks for explaining that part!
> >> > > I agree: reentrant calls that way don't look as useful on Linux than I
> >> > > previously thought.
> >> > > 
> >> > > OTOH, I think that instead of reverting the change, we could make use of the
> >> > > correct information and fix the current implementation. (This could help when we
> >> > > do the same rtas call in multiple cpus)
> >> > 
> >> > Hmm I'm happy to be mistaken here, but I doubt we ever really need to do
> >> > that. I'm not seeing the need.
> >> > 
> >> > > I have an idea of a patch to fix this. 
> >> > > Do you think it would be ok if I sent that, to prospect being an alternative to
> >> > > this reversion?
> >> > 
> >> > It is my preference, and I believe it is more common, to revert to the
> >> > well-understood prior state, imperfect as it may be. The revert can be
> >> > backported to -stable and distros while development and review of
> >> > another approach proceeds.
> >>
> >> Ok then, as long as you are aware of the kdump bug, I'm good.
> >>
> >> FWIW:
> >> Reviewed-by: Leonardo Bras <leobras.c@gmail.com>
> >
> > A shame. I guess a reader/writer lock would not be much help because
> > the crash is probably more likely to hit longer running rtas calls?
> >
> > Alternative is just cheat and do this...?
> >
> > Thanks,
> > Nick
> >
> > diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> > index 693133972294..89728714a06e 100644
> > --- a/arch/powerpc/kernel/rtas.c
> > +++ b/arch/powerpc/kernel/rtas.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/syscalls.h>
> >  #include <linux/of.h>
> >  #include <linux/of_fdt.h>
> > +#include <linux/panic.h>
> >  
> >  #include <asm/interrupt.h>
> >  #include <asm/rtas.h>
> > @@ -97,6 +98,19 @@ static unsigned long lock_rtas(void)
> >  {
> >         unsigned long flags;
> >  
> > +       if (atomic_read(&panic_cpu) == raw_smp_processor_id()) {
> > +               /*
> > +                * Crash in progress on this CPU. Other CPUs should be
> > +                * stopped by now, so skip the lock in case it was being
> > +                * held, and is now needed for crashing e.g., kexec
> > +                * (machine_kexec_mask_interrupts) requires rtas calls.
> > +                *
> > +                * It's possible this could have caused rtas state
> > breakage
> > +                * but the alternative is deadlock.
> > +                */
> > +               return 0;
> > +       }
> > +
> >         local_irq_save(flags);
> >         preempt_disable();
> >         arch_spin_lock(&rtas.lock);
> > @@ -105,6 +119,9 @@ static unsigned long lock_rtas(void)
> >  
> >  static void unlock_rtas(unsigned long flags)
> >  {
> > +       if (atomic_read(&panic_cpu) == raw_smp_processor_id())
> > +               return;
> > +
> >         arch_spin_unlock(&rtas.lock);
> >         local_irq_restore(flags);
> >         preempt_enable();
> 
> Looks correct.
> 
> I wonder - would it be worth making the panic path use a separate
> "emergency" rtas_args buffer as well? If a CPU is actually "stuck" in
> RTAS at panic time, then leaving rtas.args untouched might make the
> ibm,int-off, ibm,set-xive, ibm,os-term, and any other RTAS calls we
> incur on the panic path more likely to succeed.

Was some fix for the case of crashing in rtas merged?

Looks like there is none unless I missed something.

The paramater area allocator might help with the latter
but the former does not seem addressed.

Thanks

Michal
