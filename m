Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2567F636D0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 23:26:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHbMK6rwlz3cNg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 09:26:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/fwitok;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/fwitok;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHbLQ0d26z3045
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 09:25:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98BE261B47;
	Wed, 23 Nov 2022 22:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5FCC433C1;
	Wed, 23 Nov 2022 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669242346;
	bh=brVhZ/m5myoMxd89EQKefX1ZIC3YN8XJGn04cIPW2IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/fwitokwe4NqytFop4Z+ANdsCav18Ke9taxc5wCl42sdWGsHPje6aKA9P8IKqWlh
	 d7MUyM8px4DAN+FhcwbvGkHrvM5ojxe6DBP4JfLjgjl27H2vVkFnCV9GuwFrCkYmBe
	 8/hBGREvRxBJt6eCt3FYtThJoa3pk/rZfqR2Si/rKixGIWImTaMUUQNlDyYCqYfWbj
	 MdsvGP0bhZHdftFjI9Hjbz2RlEN4klFhArt4eEEeB9E0940ZYEoTvi/YEmYMcmrpfw
	 jcNycitroN15bGxr6WMaZHUm49ktKTNapvCM5Zj9W7yw0iY2fGOHdyfg84iQOdZaEM
	 lqaKV/M2euOEw==
Date: Wed, 23 Nov 2022 23:25:43 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Message-ID: <20221123222543.GB1395324@lothringen>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
 <20221122013754.GY4001@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122013754.GY4001@paulmck-ThinkPad-P17-Gen-1>
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
Cc: dave@stgolabs.net, Zhouyi Zhou <zhouzhouyi@gmail.com>, josh@joshtriplett.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 21, 2022 at 05:37:54PM -0800, Paul E. McKenney wrote:
> On Mon, Nov 21, 2022 at 11:51:40AM +0800, Zhouyi Zhou wrote:
> > @@ -358,7 +359,16 @@ torture_onoff(void *arg)
> >  			schedule_timeout_interruptible(HZ / 10);
> >  			continue;
> >  		}
> > +#ifdef CONFIG_NO_HZ_FULL
> > +		/* do not offline tick do timer cpu */
> > +		if (tick_nohz_full_running) {
> > +			cpu = (torture_random(&rand) >> 4) % maxcpu;
> > +			if (cpu >= tick_do_timer_cpu)
> 
> Why is this ">=" instead of "=="?
> 
> > +				cpu = (cpu + 1) % (maxcpu + 1);
> > +		} else
> > +#else
> >  		cpu = (torture_random(&rand) >> 4) % (maxcpu + 1);
> > +#endif
> 
> What happens if the value of tick_do_timer_cpu changes between the time of
> the check above and the call to torture_offline() below?  Alternatively,
> how is such a change in value prevented?

It can't, currently tick_do_timer_cpu is fixed when nohz_full is running.
It can however have special values at early boot such as TICK_DO_TIMER_NONE.
But if rcutorture is initialized after smp, it should be ok.

Thanks.

> 
> 							Thanx, Paul
> 
> >  		if (!torture_offline(cpu,
> >  				     &n_offline_attempts, &n_offline_successes,
> >  				     &sum_offline, &min_offline, &max_offline))
> > -- 
> > 2.34.1
> > 
