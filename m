Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C804C1E10D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 16:43:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49W0G35KJwzDqPm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 00:43:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=EerNxe3s; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49W08z5ZL0zDqMH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 00:39:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sDmy5Xm2F2pY2KhwGXNcV6+J3j89es51xHtTpy+cA+A=; b=EerNxe3smaAc3YWerSP2Lw+Npr
 tFZ8sQaFtxsOb746sxudWvYOKBpBmZArB9MeYtZyCdI7JxOYogp1YFwif7kF+W6eubgzeaPlDYfZ7
 mpuchARpKoY0U/x7lncesvfyIRe7TxxaR1mgsoLlp459I9SptO5dMVSiVZzaQU8PZPvFyrxvNBnJ+
 5/SJQNk2nO9Br7ajHJO+rCGLWC91fkjWpFEvebYohEYV5jIB3UQ082WzxdEDn4F0k/3uD4Fuk9+lP
 k7gAu3DiVqtBhknvniOaWGeNCpeTG/dkMyTQZfvl0dngm0Oqy7wVgO+CiGsSPJTZRqXHbXDRCPRP7
 Q11KbcNQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdEFq-000050-T9; Mon, 25 May 2020 14:39:03 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F0E6B300B38;
 Mon, 25 May 2020 16:38:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D689D2389FE1F; Mon, 25 May 2020 16:38:59 +0200 (CEST)
Date: Mon, 25 May 2020 16:38:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200525143859.GX325280@hirez.programming.kicks-ass.net>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
 <20200521093938.GG325280@hirez.programming.kicks-ass.net>
 <20200521104937.GB325303@hirez.programming.kicks-ass.net>
 <20200521110027.GC325303@hirez.programming.kicks-ass.net>
 <20200521124113.GC15455@lenoir>
 <20200525132105.GW325280@hirez.programming.kicks-ass.net>
 <20200525140541.GA28923@lenoir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525140541.GA28923@lenoir>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qian Cai <cai@lca.pw>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 25, 2020 at 04:05:49PM +0200, Frederic Weisbecker wrote:
> On Mon, May 25, 2020 at 03:21:05PM +0200, Peter Zijlstra wrote:
> > @@ -2320,7 +2304,7 @@ static void ttwu_queue_remote(struct task_struct *p, int cpu, int wake_flags)
> >  
> >  	if (llist_add(&p->wake_entry, &rq->wake_list)) {
> >  		if (!set_nr_if_polling(rq->idle))
> > -			smp_call_function_single_async(cpu, &rq->wake_csd);
> > +			smp_call_function_single_async(cpu, &p->wake_csd);
> >  		else
> >  			trace_sched_wake_idle_without_ipi(cpu);
> 
> Ok that's of course very unlikely but could it be possible to have the
> following:
> 
> CPU 0                         CPU 1                                     CPU 2
> -----       
> 
> //Wake up A
> ttwu_queue(TASK A, CPU 1)     idle_loop {
>                                   ttwu_queue_pending {
>                                       ....
>                                       raw_spin_unlock_irqrestore(rq)
>                                       # VMEXIT (with IPI still pending)
>                                                                         //task A migrates here
>                                                                         wait_event(....)
>                                                                         //sleep
> 
> //Wake up A
> ttwu_queue(TASK A, CPU 2) {
>     //IPI on CPU 2 ignored
>     // due to csd->flags == CSD_LOCK
> 

Right you are.

Bah!

More thinking....
