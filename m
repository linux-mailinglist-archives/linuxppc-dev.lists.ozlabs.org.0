Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58E4F97A1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 16:07:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZg6d5M4Lz3bgV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 00:07:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JqGIGl7b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=srs0=khno=us=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JqGIGl7b; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZg5x6vF0z2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 00:06:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FAECB82B7A;
 Fri,  8 Apr 2022 14:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D09FC385A3;
 Fri,  8 Apr 2022 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649426784;
 bh=bsMFMPa9xdc4qXQKk/ztx+aFhK0+3VF/uBT51POjlb8=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=JqGIGl7bR8+ZRSEWI8/tT3wyHsQPVov6vyGqBTr5wXGOoOJQFffQqeucQbxfE0v4r
 HekJKAvQAaAs1MuZ644SoIndEaovWJq5N+WAvhZ5jnqg1WtxlKyT+9XmQiBUzdYAmu
 TS2ynNJp+JtlvseYFkTM++H3gyiD9x/8hvxJqUaBnzTdhNxWfvqEpryM4Lls1UlRjk
 dSwcDJeJaerUR2fyUVqeiUOG6hzpjMLkpcubr9NXkUoB8xY0Z7xu+LES+o7Zq0hZyG
 RtglujENLbaDMGrNsxDxohh7+BKRfMgWQWiJqQzqVn+gmmzxOmH8uuXNFGnUGvDQ2h
 k/oNbnR5IoYtw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id EDD575C015D; Fri,  8 Apr 2022 07:06:23 -0700 (PDT)
Date: Fri, 8 Apr 2022 07:06:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: rcu_sched self-detected stall on CPU
Message-ID: <20220408140623.GY4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmls6nt7.fsf@mpe.ellerman.id.au>
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

On Fri, Apr 08, 2022 at 05:23:32PM +1000, Michael Ellerman wrote:
> "Paul E. McKenney" <paulmck@kernel.org> writes:
> > On Wed, Apr 06, 2022 at 05:31:10PM +0800, Zhouyi Zhou wrote:
> >> Hi
> >> 
> >> I can reproduce it in a ppc virtual cloud server provided by Oregon
> >> State University.  Following is what I do:
> >> 1) curl -l https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-5.18-rc1.tar.gz
> >> -o linux-5.18-rc1.tar.gz
> >> 2) tar zxf linux-5.18-rc1.tar.gz
> >> 3) cp config linux-5.18-rc1/.config
> >> 4) cd linux-5.18-rc1
> >> 5) make vmlinux -j 8
> >> 6) qemu-system-ppc64 -kernel vmlinux -nographic -vga none -no-reboot
> >> -smp 2 (QEMU 4.2.1)
> >> 7) after 12 rounds, the bug got reproduced:
> >> (http://154.223.142.244/logs/20220406/qemu.log.txt)
> >
> > Just to make sure, are you both seeing the same thing?  Last I knew,
> > Zhouyi was chasing an RCU-tasks issue that appears only in kernels
> > built with CONFIG_PROVE_RCU=y, which Miguel does not have set.  Or did
> > I miss something?
> >
> > Miguel is instead seeing an RCU CPU stall warning where RCU's grace-period
> > kthread slept for three milliseconds, but did not wake up for more than
> > 20 seconds.  This kthread would normally have awakened on CPU 1, but
> > CPU 1 looks to me to be very unhealthy, as can be seen in your console
> > output below (but maybe my idea of what is healthy for powerpc systems
> > is outdated).  Please see also the inline annotations.
> >
> > Thoughts from the PPC guys?
> 
> I haven't seen it in my testing. But using Miguel's config I can
> reproduce it seemingly on every boot.
> 
> For me it bisects to:
> 
>   35de589cb879 ("powerpc/time: improve decrementer clockevent processing")
> 
> Which seems plausible.
> 
> Reverting that on mainline makes the bug go away.

Thank you for looking into this!

> I don't see an obvious bug in the diff, but I could be wrong, or the old
> code was papering over an existing bug?
> 
> I'll try and work out what it is about Miguel's config that exposes
> this vs our defconfig, that might give us a clue.

I have recently had some RCU bugs that were due to Kconfig failing to
rule out broken .config files.  Maybe this is something similar?

							Thanx, Paul
