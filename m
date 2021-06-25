Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D913B4155
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 12:17:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBCcP2kg3z3byc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 20:17:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kXPUlU2H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=kXPUlU2H; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBCbs3Z2bz3015
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 20:17:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wDQXb0b+JpxtflRteJ/ZXAm5n+oQckfOfxFaEPzX3d0=; b=kXPUlU2H9vzWAwVh0T2wqxOCx1
 lOcpMyvsK0Pl8Ao1d4v2gfWrc0Nwb0T7Vahflk+dcFWCnsLwYrkC/r7NUuY7YqpQFIZS9srFwQQiN
 AvEi9XE1GR9ucHXeyTTCuVVpALouAkeRGuwLJKDMOqNcfprqT7v+6kTUEal+L1A7UlAnst6utMhHa
 Lms0BF77SDLRUoNVMUg0HQTX5EgzVCG+BZNNXuA+ESVfBhryzFVRCsqEc2+qBc2WcmH5NuRG2FURa
 Y57J9axgTfZmNszVbocy6VneLvFx1WZum1Pp/yJyueEdGf9AftpZuBTdUaIx7WJDRC/b6Q4kzOvii
 LnmBAxeg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwitJ-00HYGQ-Ay; Fri, 25 Jun 2021 10:16:56 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D3D6E300233;
 Fri, 25 Jun 2021 12:16:52 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id ADFB22019DA0B; Fri, 25 Jun 2021 12:16:52 +0200 (CEST)
Date: Fri, 25 Jun 2021 12:16:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: PowerPC guest getting "BUG: scheduling while atomic" on
 linux-next-20210623 during secondary CPUs bringup
Message-ID: <YNWtFKdSuoYTfSon@hirez.programming.kicks-ass.net>
References: <YNSq3UQTjm6HWELA@in.ibm.com>
 <20210625054608.fmwt7lxuhp7inkjx@linux.vnet.ibm.com>
 <YNWFiZii+MINhUC3@hirez.programming.kicks-ass.net>
 <YNWZfKK+KBQSUdG5@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNWZfKK+KBQSUdG5@in.ibm.com>
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 25, 2021 at 02:23:16PM +0530, Bharata B Rao wrote:
> On Fri, Jun 25, 2021 at 09:28:09AM +0200, Peter Zijlstra wrote:
> > On Fri, Jun 25, 2021 at 11:16:08AM +0530, Srikar Dronamraju wrote:
> > > * Bharata B Rao <bharata@linux.ibm.com> [2021-06-24 21:25:09]:
> > > 
> > > > A PowerPC KVM guest gets the following BUG message when booting
> > > > linux-next-20210623:
> > > > 
> > > > smp: Bringing up secondary CPUs ...
> > > > BUG: scheduling while atomic: swapper/1/0/0x00000000
> > 
> > 'funny', your preempt_count is actually too low. The check here is for
> > preempt_count() == DISABLE_OFFSET (aka. 1 when PREEMPT=y), but you have
> > 0.
> > 
> > > > no locks held by swapper/1/0.
> > > > Modules linked in:
> > > > CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.13.0-rc7-next-20210623
> > > > Call Trace:
> > > > [c00000000ae5bc20] [c000000000badc64] dump_stack_lvl+0x98/0xe0 (unreliable)
> > > > [c00000000ae5bc60] [c000000000210200] __schedule_bug+0xb0/0xe0
> > > > [c00000000ae5bcd0] [c000000001609e28] __schedule+0x1788/0x1c70
> > > > [c00000000ae5be20] [c00000000160a8cc] schedule_idle+0x3c/0x70
> > > > [c00000000ae5be50] [c00000000022984c] do_idle+0x2bc/0x420
> > > > [c00000000ae5bf00] [c000000000229d88] cpu_startup_entry+0x38/0x40
> > > > [c00000000ae5bf30] [c0000000000666c0] start_secondary+0x290/0x2a0
> > > > [c00000000ae5bf90] [c00000000000be54] start_secondary_prolog+0x10/0x14
> > > > 
> > > > <The above repeats for all the secondary CPUs>
> > > > 
> > > > smp: Brought up 2 nodes, 16 CPUs
> > > > numa: Node 0 CPUs: 0-7
> > > > numa: Node 1 CPUs: 8-15
> > > > 
> > > > This seems to have started from next-20210521 and isn't seen on
> > > > next-20210511.
> > > > 
> > > 
> > > Bharata,
> > > 
> > > I think the regression is due to Commit f1a0a376ca0c ("sched/core:
> > > Initialize the idle task with preemption disabled")
> > 
> > So that extra preempt_disable() that got removed would've incremented it
> > to 1 and then things would've been fine.
> > 
> > Except.. Valentin changed things such that preempt_count() should've
> > been inittialized to 1, instead of 0, but for some raisin that didn't
> > stick.. what gives.
> > 
> > So we have init_idle(p) -> init_idle_preempt_count(p) ->
> > task_thread_info(p)->preempt_count = PREEMPT_DISABLED;
> > 
> > But somehow, by the time you're running start_secondary(), that's gotten
> > to be 0 again. Does DEBUG_PREEMPT give more clues?
> 
> PREEMPTION is off here.

You mean: CONFIG_PREEMPTION=n, what about CONFIG_PREEMPT_COUNT?

Because if both are =n, then I don't see how that warning could trigger.
in_atomic_preempt_off() would then result in prempt_count() == 0, and
per the print above, it *is* 0.
