Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D37C029EBC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 13:21:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMPgb2ZkNzDqZk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:21:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=cai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YfN8kcOL; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YfN8kcOL; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMPbV08K6zDqST
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 23:17:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603973873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lB2c4MtlrXCuIdf9zq4VDJpB3FDpWBCyeSMN5PWwd28=;
 b=YfN8kcOLxCaj0rcOr21IVnVe3cICvlUWzqM5yQz3uOGGB1o5dSDT62b+SB6erpO8l1D6QF
 QR7wYOF82Y09sw/psn+wqHBmHarvizcCeTvp+pcAgh6IOeYnEOFgCSmThu9rXatMUgJZnY
 SEqlkPafA7GtbzvY9Flgp5IAIl6IMVI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603973873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lB2c4MtlrXCuIdf9zq4VDJpB3FDpWBCyeSMN5PWwd28=;
 b=YfN8kcOLxCaj0rcOr21IVnVe3cICvlUWzqM5yQz3uOGGB1o5dSDT62b+SB6erpO8l1D6QF
 QR7wYOF82Y09sw/psn+wqHBmHarvizcCeTvp+pcAgh6IOeYnEOFgCSmThu9rXatMUgJZnY
 SEqlkPafA7GtbzvY9Flgp5IAIl6IMVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-mBOwWrecNRmI0Qryrx8kiA-1; Thu, 29 Oct 2020 08:17:50 -0400
X-MC-Unique: mBOwWrecNRmI0Qryrx8kiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFD279CC00;
 Thu, 29 Oct 2020 12:17:48 +0000 (UTC)
Received: from ovpn-66-212.rdu2.redhat.com (ovpn-66-212.rdu2.redhat.com
 [10.10.66.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B38985B4A4;
 Thu, 29 Oct 2020 12:17:47 +0000 (UTC)
Message-ID: <15839584467d8f5e0715e377d9dd8c9d889dfd70.camel@redhat.com>
Subject: Re: [PATCH] powerpc/smp: Move rcu_cpu_starting() earlier
From: Qian Cai <cai@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>, "Paul E . McKenney"
 <paulmck@kernel.org>
Date: Thu, 29 Oct 2020 08:17:47 -0400
In-Reply-To: <87lffpx598.fsf@mpe.ellerman.id.au>
References: <20201028182334.13466-1-cai@redhat.com>
 <87lffpx598.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-10-29 at 11:09 +1100, Michael Ellerman wrote:
> Qian Cai <cai@redhat.com> writes:
> > The call to rcu_cpu_starting() in start_secondary() is not early enough
> > in the CPU-hotplug onlining process, which results in lockdep splats as
> > follows:
> 
> Since when?

For me, it is since the commit in the link which looks now merged into
v5.10-rc1. Then, it needs CONFIG_PROVE_RCU_LIST=y.

> What kernel version?
> 
> I haven't seen this running CPU hotplug tests with PROVE_LOCKING=y on
> v5.10-rc1. Am I missing a CONFIG?
> 
> cheers
> 
> 
> >  WARNING: suspicious RCU usage
> >  -----------------------------
> >  kernel/locking/lockdep.c:3497 RCU-list traversed in non-reader section!!
> > 
> >  other info that might help us debug this:
> > 
> >  RCU used illegally from offline CPU!
> >  rcu_scheduler_active = 1, debug_locks = 1
> >  no locks held by swapper/1/0.
> > 
> >  Call Trace:
> >  dump_stack+0xec/0x144 (unreliable)
> >  lockdep_rcu_suspicious+0x128/0x14c
> >  __lock_acquire+0x1060/0x1c60
> >  lock_acquire+0x140/0x5f0
> >  _raw_spin_lock_irqsave+0x64/0xb0
> >  clockevents_register_device+0x74/0x270
> >  register_decrementer_clockevent+0x94/0x110
> >  start_secondary+0x134/0x800
> >  start_secondary_prolog+0x10/0x14
> > 
> > This is avoided by moving the call to rcu_cpu_starting up near the
> > beginning of the start_secondary() function. Note that the
> > raw_smp_processor_id() is required in order to avoid calling into
> > lockdep before RCU has declared the CPU to be watched for readers.
> > 
> > Link: 
> > https://lore.kernel.org/lkml/160223032121.7002.1269740091547117869.tip-bot2@tip-bot2/
> > Signed-off-by: Qian Cai <cai@redhat.com>
> > ---
> >  arch/powerpc/kernel/smp.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 3c6b9822f978..8c2857cbd960 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -1393,13 +1393,14 @@ static void add_cpu_to_masks(int cpu)
> >  /* Activate a secondary processor. */
> >  void start_secondary(void *unused)
> >  {
> > -	unsigned int cpu = smp_processor_id();
> > +	unsigned int cpu = raw_smp_processor_id();
> >  
> >  	mmgrab(&init_mm);
> >  	current->active_mm = &init_mm;
> >  
> >  	smp_store_cpu_info(cpu);
> >  	set_dec(tb_ticks_per_jiffy);
> > +	rcu_cpu_starting(cpu);
> >  	preempt_disable();
> >  	cpu_callin_map[cpu] = 1;
> >  
> > -- 
> > 2.28.0

