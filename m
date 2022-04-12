Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF944FE2CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 15:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd6Gq54L8z3bjq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 23:37:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D0afFjv6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=6gcg=uw=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D0afFjv6; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd6G7600Qz2ymq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 23:37:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F974B81D74;
 Tue, 12 Apr 2022 13:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E80C385A1;
 Tue, 12 Apr 2022 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649770616;
 bh=iBfkWMq45w9adg6yGPWTZznzfwj5o+ruETsOfu7AndM=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=D0afFjv6iJ6TQ7QIaz3L2dFs1PVUgMXLvO8w+J0g+dC1Rzi6FuEsaMoXxvR3jImI5
 KX7FdNy6SIBt2bUm4GAR/v7wqtB54XmJy5Cl4QLpwA7TtTi8H+PWiEaqosTMAEPnq0
 4eghqFKPeoaBZctEbqmrsBqmb3h2UzxNJLhouQIkQFKN5fMW+VKhKIN5U25poKC56G
 ITmhTjLOPW1TvgphmRoddNjQ0TPcnpRdc+xJ4kjipsLNsUskBs/sKr4Wjh8Rc5Qbby
 CNAWYpKpM4gQ/kP+hgcaIr35aWgl+VRC4sMD9VNJbg7YpjDoTGINSh6qXpzyyF2ar+
 Kg9oHIsQgj/zg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id BEE045C08B7; Tue, 12 Apr 2022 06:36:55 -0700 (PDT)
Date: Tue, 12 Apr 2022 06:36:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: rcu_sched self-detected stall on CPU
Message-ID: <20220412133655.GE4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
 <CAABZP2wVAzybDTjUWxwGG4HmWK7V8rJVVFxpRx-3F9n5oST3+A@mail.gmail.com>
 <20220408140712.GZ4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zEU8eULq30ZLcUeqxjXuLTKO4b3wm_Jo458Nq_JJ7pEw@mail.gmail.com>
 <871qy56ulk.fsf@mpe.ellerman.id.au>
 <20220411030553.GW4285@paulmck-ThinkPad-P17-Gen-1>
 <87mtgq6be5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtgq6be5.fsf@mpe.ellerman.id.au>
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
Cc: rcu <rcu@vger.kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 12, 2022 at 04:53:06PM +1000, Michael Ellerman wrote:
> "Paul E. McKenney" <paulmck@kernel.org> writes:
> > On Sun, Apr 10, 2022 at 09:33:43PM +1000, Michael Ellerman wrote:
> >> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> >> > On Fri, Apr 8, 2022 at 10:07 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >> >> On Fri, Apr 08, 2022 at 06:02:19PM +0800, Zhouyi Zhou wrote:
> >> >> > On Fri, Apr 8, 2022 at 3:23 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> ...
> >> >> > > I haven't seen it in my testing. But using Miguel's config I can
> >> >> > > reproduce it seemingly on every boot.
> >> >> > >
> >> >> > > For me it bisects to:
> >> >> > >
> >> >> > >   35de589cb879 ("powerpc/time: improve decrementer clockevent processing")
> >> >> > >
> >> >> > > Which seems plausible.
> >> >> > I also bisect to 35de589cb879 ("powerpc/time: improve decrementer
> >> >> > clockevent processing")
> >> ...
> >> >>
> >> >> > > Reverting that on mainline makes the bug go away.
> >> 
> >> >> > I also revert that on the mainline, and am currently doing a pressure
> >> >> > test (by repeatedly invoking qemu and checking the console.log) on PPC
> >> >> > VM in Oregon State University.
> >> 
> >> > After 306 rounds of stress test on mainline without triggering the bug
> >> > (last for 4 hours and 27 minutes), I think the bug is indeed caused by
> >> > 35de589cb879 ("powerpc/time: improve decrementer clockevent
> >> > processing") and stop the test for now.
> >> 
> >> Thanks for testing, that's pretty conclusive.
> >> 
> >> I'm not inclined to actually revert it yet.
> >> 
> >> We need to understand if there's actually a bug in the patch, or if it's
> >> just exposing some existing bug/bad behavior we have. The fact that it
> >> only appears with CONFIG_HIGH_RES_TIMERS=n is suspicious.
> >> 
> >> Do we have some code that inadvertently relies on something enabled by
> >> HIGH_RES_TIMERS=y, or do we have a bug that is hidden by HIGH_RES_TIMERS=y ?
> >
> > For whatever it is worth, moderate rcutorture runs to completion without
> > errors with CONFIG_HIGH_RES_TIMERS=n on 64-bit x86.
> 
> Thanks for testing that, I don't have any big x86 machines to test on :)
> 
> > Also for whatever it is worth, I don't know of anything other than
> > microcontrollers or the larger IoT devices that would want their kernels
> > built with CONFIG_HIGH_RES_TIMERS=n.  Which might be a failure of
> > imagination on my part, but so it goes.
> 
> Yeah I agree, like I said before I wasn't even aware you could turn it
> off. So I think we'll definitely add a select HIGH_RES_TIMERS in future,
> but first I need to work out why we are seeing stalls with it disabled.

Good point, and fair enough!

							Thanx, Paul
