Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6604636DFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 00:01:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHc7N4SbFz3dvL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 10:01:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nctdZzry;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=/r7r=3x=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nctdZzry;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHc6V286yz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 10:00:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42F4661B47;
	Wed, 23 Nov 2022 23:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEE0C433D6;
	Wed, 23 Nov 2022 23:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669244431;
	bh=xMQEI5/UaBXleLy7rFHYc25uhmr6Xx1RJf02gKDCj3M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nctdZzryom/KqAWlqstK1IX3ZErCw0/X5k4uA/2V6MLzCwgUcTqhN4zH6R9bAbRI9
	 KvJyEzaOpSCZ3ORLjDsLGWheT4XrAAIncCtfo7+TOyBRUHqFdCNoXfHUma9WYp7r/w
	 AjrCdqDjbUaJ7H33vIY+y/E10XveRVZvolFq6R14QZ4kUfxeGp3J4mMg+qp3VFmI8f
	 uVv6JLbhmdLY6Rnl7LglwezKbF7G4hjzaOhwWZQIYfVrmOu2RGyMhv1L1QJhLhISWt
	 GyN5jx9bWPP3agxPdRvTOFG60AAJtrVGSHtKRLuOJBISHW8HCwMGKdDcm1XNTJ8NE3
	 MrXg92lfYJAgg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 37FD85C0DF2; Wed, 23 Nov 2022 15:00:31 -0800 (PST)
Date: Wed, 23 Nov 2022 15:00:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Message-ID: <20221123230031.GL4001@paulmck-ThinkPad-P17-Gen-1>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
 <20221122013754.GY4001@paulmck-ThinkPad-P17-Gen-1>
 <20221123222543.GB1395324@lothringen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123222543.GB1395324@lothringen>
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
Reply-To: paulmck@kernel.org
Cc: dave@stgolabs.net, Zhouyi Zhou <zhouzhouyi@gmail.com>, josh@joshtriplett.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 23, 2022 at 11:25:43PM +0100, Frederic Weisbecker wrote:
> On Mon, Nov 21, 2022 at 05:37:54PM -0800, Paul E. McKenney wrote:
> > On Mon, Nov 21, 2022 at 11:51:40AM +0800, Zhouyi Zhou wrote:
> > > @@ -358,7 +359,16 @@ torture_onoff(void *arg)
> > >  			schedule_timeout_interruptible(HZ / 10);
> > >  			continue;
> > >  		}
> > > +#ifdef CONFIG_NO_HZ_FULL
> > > +		/* do not offline tick do timer cpu */
> > > +		if (tick_nohz_full_running) {
> > > +			cpu = (torture_random(&rand) >> 4) % maxcpu;
> > > +			if (cpu >= tick_do_timer_cpu)
> > 
> > Why is this ">=" instead of "=="?
> > 
> > > +				cpu = (cpu + 1) % (maxcpu + 1);
> > > +		} else
> > > +#else
> > >  		cpu = (torture_random(&rand) >> 4) % (maxcpu + 1);
> > > +#endif
> > 
> > What happens if the value of tick_do_timer_cpu changes between the time of
> > the check above and the call to torture_offline() below?  Alternatively,
> > how is such a change in value prevented?
> 
> It can't, currently tick_do_timer_cpu is fixed when nohz_full is running.
> It can however have special values at early boot such as TICK_DO_TIMER_NONE.
> But if rcutorture is initialized after smp, it should be ok.

Ah, getting ahead of myself, thank you for the info!

So the thing to do would be to generate only maxcpu-1 choices.

							Thanx, Paul

> Thanks.
> 
> > 
> > 							Thanx, Paul
> > 
> > >  		if (!torture_offline(cpu,
> > >  				     &n_offline_attempts, &n_offline_successes,
> > >  				     &sum_offline, &min_offline, &max_offline))
> > > -- 
> > > 2.34.1
> > > 
