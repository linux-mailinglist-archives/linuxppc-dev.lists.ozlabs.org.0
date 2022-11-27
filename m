Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEF6639C23
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 18:54:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKx7D0rkJz3cMS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 04:54:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rTPtL2mt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=sxgl=33=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rTPtL2mt;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKx6C6cXZz3057
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 04:53:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0F081B80B3C;
	Sun, 27 Nov 2022 17:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73F0C433C1;
	Sun, 27 Nov 2022 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669571597;
	bh=cR4oVWEUk67TAnV7gA291l8sois74FLMYSBwf6j79kg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=rTPtL2mt8FWmVx2GP8FAoATCIpkEzeWETxEmypyD2s5cVOjNNGDxffAIzVp+JJSPB
	 kXga7F2X5leOvfu67vLAf22y9LWndAsNNtso1+hYnONzBoYwsbPea9x6HAYJhOqrbZ
	 kQPhGkpCqyLtZcsQE1OMPX7i65c2RVrOHqdjDKQMjUD+TA21q8VcuykyyfPCHavjpE
	 qwxiLu+LltpusRu+su7+zAmRVho0hshDG+lP3LSwlnMoBt6/dG/IUwEZBVsO8BZtOQ
	 9QBOozQ1iuvtJmf9oHp2ax8RE4QTE2Asb9XM3T3frPojd4+jTSxUSOv9AO8DfTuBGf
	 tpIV1md3I+68A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 555555C09B0; Sun, 27 Nov 2022 09:53:17 -0800 (PST)
Date: Sun, 27 Nov 2022 09:53:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Message-ID: <20221127175317.GF4001@paulmck-ThinkPad-P17-Gen-1>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
 <87y1rxwsse.ffs@tglx>
 <CAABZP2xNTbrx9iV+KH3VZx1c9Yi97+izNA=XSJQBuOJ4WENFZg@mail.gmail.com>
 <87v8n0woxv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8n0woxv.ffs@tglx>
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
Cc: dave@stgolabs.net, linuxppc-dev@lists.ozlabs.org, josh@joshtriplett.org, linux-kernel@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, fweisbec@gmail.com, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 27, 2022 at 01:40:28PM +0100, Thomas Gleixner wrote:

[ . . . ]

> >> No. We are not exporting this just to make a bogus test case happy.
> >>
> >> Fix the torture code to handle -EBUSY correctly.
> > I am going to do a study on this, for now, I do a grep in the kernel tree:
> > find . -name "*.c"|xargs grep cpuhp_setup_state|wc -l
> > The result of the grep command shows that there are 268
> > cpuhp_setup_state* cases.
> > which may make our task more complicated.
> 
> Why? The whole point of this torture thing is to stress the
> infrastructure.

Indeed.

> There are quite some reasons why a CPU-hotplug or a hot-unplug operation
> can fail, which is not a fatal problem, really.
> 
> So if a CPU hotplug operation fails, then why can't the torture test
> just move on and validate that the system still behaves correctly?
> 
> That gives us more coverage than just testing the good case and giving
> up when something unexpected happens.

Agreed, with access to a function like the tick_nohz_full_timekeeper()
suggested earlier in this email thread, then yes, it would make sense to
try to offline the CPU anyway, then forgive the failure in cases where
the CPU matches that indicated by tick_nohz_full_timekeeper().

> I even argue that the torture test should inject random failures into
> the hotplug state machine to achieve extended code coverage.

I could imagine torture_onoff() telling various CPU-hotplug notifiers
to refuse the transition using some TBD interface.  That would better
test the CPU-hotplug common code's ability to deal with failures.

Or did you have something else/additional in mind?

							Thanx, Paul
