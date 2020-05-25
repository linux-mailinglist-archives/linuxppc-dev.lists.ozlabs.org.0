Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD01E1023
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 16:11:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VzXK4NhXzDq8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 00:10:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=frederic@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=djIhABcz; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VzQV6xt4zDqB3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 00:05:54 +1000 (AEST)
Received: from localhost (lfbn-ncy-1-985-231.w90-101.abo.wanadoo.fr
 [90.101.63.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC9EA2078B;
 Mon, 25 May 2020 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590415552;
 bh=4VZk7RGn/PZBtXmEcizHf6YuFu228DNJ0CvSOZvd4BE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=djIhABcz5/fRiDGNcdUszfyq0up8K+3x3CkQ/nelt1OocgB6msuJwEizqeMiNWURe
 hxbFIRagK4FJ90O4P8/mnGAm5naoZrRqw0YMNh7o4fvMR8aVumSLb+wDTQ8PaYKcn9
 qAn7oLs40TIYavPqgVIiInlrv+PaZpuGPHjV7n34=
Date: Mon, 25 May 2020 16:05:49 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200525140541.GA28923@lenoir>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
 <20200521093938.GG325280@hirez.programming.kicks-ass.net>
 <20200521104937.GB325303@hirez.programming.kicks-ass.net>
 <20200521110027.GC325303@hirez.programming.kicks-ass.net>
 <20200521124113.GC15455@lenoir>
 <20200525132105.GW325280@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525132105.GW325280@hirez.programming.kicks-ass.net>
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

On Mon, May 25, 2020 at 03:21:05PM +0200, Peter Zijlstra wrote:
> @@ -2320,7 +2304,7 @@ static void ttwu_queue_remote(struct task_struct *p, int cpu, int wake_flags)
>  
>  	if (llist_add(&p->wake_entry, &rq->wake_list)) {
>  		if (!set_nr_if_polling(rq->idle))
> -			smp_call_function_single_async(cpu, &rq->wake_csd);
> +			smp_call_function_single_async(cpu, &p->wake_csd);
>  		else
>  			trace_sched_wake_idle_without_ipi(cpu);

Ok that's of course very unlikely but could it be possible to have the
following:

CPU 0                         CPU 1                                     CPU 2
-----       

//Wake up A
ttwu_queue(TASK A, CPU 1)     idle_loop {
                                  ttwu_queue_pending {
                                      ....
                                      raw_spin_unlock_irqrestore(rq)
                                      # VMEXIT (with IPI still pending)
                                                                        //task A migrates here
                                                                        wait_event(....)
                                                                        //sleep

//Wake up A
ttwu_queue(TASK A, CPU 2) {
    //IPI on CPU 2 ignored
    // due to csd->flags == CSD_LOCK

