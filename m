Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CE1DC41C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 02:42:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S9nm0yBRzDqZX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 10:42:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=frederic@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ZzSQm07E; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S9lF47klzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 10:40:41 +1000 (AEST)
Received: from localhost (lfbn-ncy-1-985-231.w90-101.abo.wanadoo.fr
 [90.101.63.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D58C20756;
 Thu, 21 May 2020 00:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590021638;
 bh=bkp5EojXuJdRFg/NUpaj7S7uzkKntoSInnR8U3HN/1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZzSQm07Earmg9k84H+0M7AKm1RWBEh2THpEzki+xqIevfjuKMw7BLGjy9vkIM6L3g
 vg/eLkxzZ/4rmYAZK1T4/q88BdbFepb0OdiXhAOmP35tajLFhTeBIQ4CkbuZ76ZZBK
 5iX1DKP2/WID6qyIQvZRaZTC5kcg0Ck+oRwhUOP0=
Date: Thu, 21 May 2020 02:40:36 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200521004035.GA15455@lenoir>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200520125056.GC325280@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, May 20, 2020 at 02:50:56PM +0200, Peter Zijlstra wrote:
> On Tue, May 19, 2020 at 11:58:17PM -0400, Qian Cai wrote:
> > Just a head up. Repeatedly compiling kernels for a while would trigger
> > endless soft-lockups since next-20200519 on both x86_64 and powerpc.
> > .config are in,
> 
> Could be 90b5363acd47 ("sched: Clean up scheduler_ipi()"), although I've
> not seen anything like that myself. Let me go have a look.
> 
> 
> In as far as the logs are readable (they're a wrapped mess, please don't
> do that!), they contain very little useful, as is typical with IPIs :/
> 
> > [ 1167.993773][    C1] WARNING: CPU: 1 PID: 0 at kernel/smp.c:127
> > flush_smp_call_function_queue+0x1fa/0x2e0

So I've tried to think of a race that could produce that and here is
the only thing I could come up with. It's a bit complicated unfortunately:

CPU 0                                              CPU 1
-----                                              -----

tick {
    trigger_load_balance() {
        raise_softirq(SCHED_SOFTIRQ);
        //but nohz_flags(0) = 0
    }
                                                   kick_ilb() {
                                                       atomic_fetch_or(...., nohz_flags(0))
    softirq() {                                        #VMEXIT or anything that could stop a CPU for a while
        run_rebalance_domain() {
            nohz_idle_balance() {
                atomic_andnot(NOHZ_KICK_MASK, nohz_flag(0))
            }
         }
     }
}

// schedule
nohz_newidle_balance() {
    kick_ilb() { // pick current CPU
        atomic_fetch_or(...., nohz_flags(0))           #VMENTER
        smp_call_function_single_async() {             smp_call_function_single_async() {
            // verified csd->flags != CSD_LOCK             // verified csd->flags != CSD_LOCK
            csd->flags = CSD_LOCK                          csd->flags = CSD_LOCK
            //execute in place                             //queue and send IPI
            csd->flags = 0
            nohz_csd_func()
	}
    }
}


IPI�{
    flush_smp_call_function_queue() {
        csd_unlock() {
            WARN_ON(csd->flags != CSD_LOCK) <---------!!!!!



The root cause here would be that trigger_load_balance() unconditionally raise
the softirq. And I have to confess I'm not clear why since the softirq is
essentially a no-op when nohz_flags() is 0.

Thanks.
