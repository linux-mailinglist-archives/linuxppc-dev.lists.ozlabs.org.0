Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA263AC07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 16:17:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLTbb1NzZz3f3L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 02:17:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LWdLqZwi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=/mbj=34=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LWdLqZwi;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLTZh3wQzz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 02:16:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0CEADB80DED;
	Mon, 28 Nov 2022 15:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC551C433C1;
	Mon, 28 Nov 2022 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669648583;
	bh=CftQAWJINFkcBXFRaam8ztLdzPBn/UXPQX4/Gi/9C8s=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=LWdLqZwioKj4CDnukK8FxxVYevFWUtGTt7rEqdQazh4LYBX0V01z05EInRZvSPX7h
	 8D+M6HVAzmYUflEGglRW2VFV2XUzCeqSh47GyjdDojHj62/Qgepv33ZukwlR1hkFuu
	 Pv5KYxXHX4mjmoGVFem+529NOQWe4CeaRMEgHJHwxnJ1IZgFzaq1wngwaNOw2tV0ZJ
	 ZfYWMXyXJynrVlTf6nb6v1+mOsG0ATOtB9gZQUg5Mi+Mep2hxWdqBBzHEdUuUpU1TR
	 RW8GBPFKEv7k9o8iod6XMb8rbLCBnm18aYZL0TlVssdIwrLsPlqpBjHPcrA+z1T+YD
	 otf4fb5/2jsSg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5D3A95C0BA0; Mon, 28 Nov 2022 07:16:23 -0800 (PST)
Date: Mon, 28 Nov 2022 07:16:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Message-ID: <20221128151623.GI4001@paulmck-ThinkPad-P17-Gen-1>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
 <87y1rxwsse.ffs@tglx>
 <CAABZP2xNTbrx9iV+KH3VZx1c9Yi97+izNA=XSJQBuOJ4WENFZg@mail.gmail.com>
 <87v8n0woxv.ffs@tglx>
 <20221127175317.GF4001@paulmck-ThinkPad-P17-Gen-1>
 <87sfi3wl8z.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfi3wl8z.ffs@tglx>
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

On Mon, Nov 28, 2022 at 09:12:28AM +0100, Thomas Gleixner wrote:
> On Sun, Nov 27 2022 at 09:53, Paul E. McKenney wrote:
> > On Sun, Nov 27, 2022 at 01:40:28PM +0100, Thomas Gleixner wrote:
> >> There are quite some reasons why a CPU-hotplug or a hot-unplug operation
> >> can fail, which is not a fatal problem, really.
> >> 
> >> So if a CPU hotplug operation fails, then why can't the torture test
> >> just move on and validate that the system still behaves correctly?
> >> 
> >> That gives us more coverage than just testing the good case and giving
> >> up when something unexpected happens.
> >
> > Agreed, with access to a function like the tick_nohz_full_timekeeper()
> > suggested earlier in this email thread, then yes, it would make sense to
> > try to offline the CPU anyway, then forgive the failure in cases where
> > the CPU matches that indicated by tick_nohz_full_timekeeper().
> 
> Why special casing this? There are other valid reasons why offlining can
> fail. So we special case timekeeper today and then next week we special
> case something else just because. That does not make sense. If it fails
> there is a reason and you can log it. The important part is that the
> system is functional and stable after the fail and the rollback.

Perhaps there are other valid reasons, but they have not been showing up
in my torture-test runs for well over a decade.  Not saying that they
don't happen, of course.  But if they involved (say) cgroups, then my
test setup would not exercise them.

So are you looking to introduce spurious CPU-hotplug failures?  If so,
these will also affect things like suspend/resume.  Plus it will make
it much more difficult to detect real but intermittent CPU-hotplug bugs,
which is the motivation for special-casing the tick_nohz_full_timekeeper()
failures.

So we should discuss introduciton of any spurious failures that might
be under consideration.

Independently of that, the torture_onoff() functions can of course keep
some sort of histogram of the failure return codes.  Or are there other
failure indications that should be captured?

> >> I even argue that the torture test should inject random failures into
> >> the hotplug state machine to achieve extended code coverage.
> >
> > I could imagine torture_onoff() telling various CPU-hotplug notifiers
> > to refuse the transition using some TBD interface.
> 
> There is already an interface which is exposed to sysfs which allows you
> to enforce a "fail" at a defined hotplug state.

If you would like me to be testing this as part of my normal testing
regimen, I will need an in-kernel interface.  Such an interface is of
course not needed for modprobe-style testing, in which case the script
doing the modprobe and rmmod can of course manipulate the sysfs files.
But I don't do that sort of testing very often.  And when I do, it is
almost always with kernels configured for Meta's fleet, which almost
never do CPU-offline operations.

							Thanx, Paul

> > That would better test the CPU-hotplug common code's ability to deal
> > with failures.
> 
> Correct.
> 
> > Or did you have something else/additional in mind?
> 
> No.
> 
> Thanks,
> 
>         tglx
