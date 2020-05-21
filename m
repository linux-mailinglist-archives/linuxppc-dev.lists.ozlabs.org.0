Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6108D1DCA62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 11:46:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SPrj1hRJzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 19:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=205.233.59.134; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=vO1OR1Wx; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SPpz46LczDqkd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 19:44:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xJUdphGKJUKhgIinM68b1mk7CPkaxjn/+2MCaXBPBbo=; b=vO1OR1Wx3Y/LoO/HBRgWVYPKre
 q/E1M1NpSEbEtommc2Mx6MmlmHCA16wIVYHDbvaAuh4CQRAgpN/cg24jW24K5JO6+617hM/Vv5rDL
 zXVGGVfE/cwuDi62N7QmR6RX77WO7WWwPFj/J88v4bnkSjCQEQW7B298gS5UaPryHGi/5zb86JIxL
 8sQqbm1seCMcsuuJryZ1Q+uVe1LU173S6EsQjD9Ob4p1MwGazTXWc8Kqh19w5G+0YYzZs+eTd4+QA
 v4V+82u6b/tGc9+NobIIB8e2yxAE4kSspu66W7q3I1HsvBDn3m37ygYkTUyY4iAADYpG2BSyCljUi
 zpQrpG7g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbhg7-0001BI-Vw; Thu, 21 May 2020 09:39:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2D0A73011C6;
 Thu, 21 May 2020 11:39:39 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 09B1A25BAC8BA; Thu, 21 May 2020 11:39:38 +0200 (CEST)
Date: Thu, 21 May 2020 11:39:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200521093938.GG325280@hirez.programming.kicks-ass.net>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521004035.GA15455@lenoir>
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

On Thu, May 21, 2020 at 02:40:36AM +0200, Frederic Weisbecker wrote:
> On Wed, May 20, 2020 at 02:50:56PM +0200, Peter Zijlstra wrote:
> > On Tue, May 19, 2020 at 11:58:17PM -0400, Qian Cai wrote:
> > > Just a head up. Repeatedly compiling kernels for a while would trigger
> > > endless soft-lockups since next-20200519 on both x86_64 and powerpc.
> > > .config are in,
> > 
> > Could be 90b5363acd47 ("sched: Clean up scheduler_ipi()"), although I've
> > not seen anything like that myself. Let me go have a look.
> > 
> > 
> > In as far as the logs are readable (they're a wrapped mess, please don't
> > do that!), they contain very little useful, as is typical with IPIs :/
> > 
> > > [ 1167.993773][    C1] WARNING: CPU: 1 PID: 0 at kernel/smp.c:127
> > > flush_smp_call_function_queue+0x1fa/0x2e0
> 
> So I've tried to think of a race that could produce that and here is
> the only thing I could come up with. It's a bit complicated unfortunately:

This:

>         smp_call_function_single_async() {             smp_call_function_single_async() {
>             // verified csd->flags != CSD_LOCK             // verified csd->flags != CSD_LOCK
>             csd->flags = CSD_LOCK                          csd->flags = CSD_LOCK

concurrent smp_call_function_single_async() using the same csd is what
I'm looking at as well. Now in the ILB case there is an easy cure:

(because there is only a single ilb target)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 01f94cf52783..b6d8a7b991f0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10033,7 +10033,7 @@ static void kick_ilb(unsigned int flags)
 	 * is idle. And the softirq performing nohz idle load balance
 	 * will be run before returning from the IPI.
 	 */
-	smp_call_function_single_async(ilb_cpu, &cpu_rq(ilb_cpu)->nohz_csd);
+	smp_call_function_single_async(ilb_cpu, &this_rq()->nohz_csd);
 }
 
 /*

Qian, can you give that a spin?

But I'm still not convinced of your scenario:

>                                                    kick_ilb() {
>                                                        atomic_fetch_or(...., nohz_flags(0))

>         atomic_fetch_or(...., nohz_flags(0))           #VMENTER
>         smp_call_function_single_async() {             smp_call_function_single_async() {
>             // verified csd->flags != CSD_LOCK             // verified csd->flags != CSD_LOCK
>             csd->flags = CSD_LOCK                          csd->flags = CSD_LOCK

Note that we check the return value of atomic_fetch_or() and bail if
someone else set a flag in KICK_MASK before us.

Aah, I suppose you're saying this can happen when:

  !(flags & NOHZ_KICK_MASK)

? That's not supposed to happen though.


Anyway, let me go stare at the remove wake-up case, because i'm afraid
that might have the same problem too...
