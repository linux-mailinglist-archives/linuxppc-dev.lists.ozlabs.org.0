Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FDD4F99EC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 17:53:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZjT93mqGz3bbm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 01:53:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bYkO4hwl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=khno=us=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bYkO4hwl; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZjSV6mGZz2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 01:52:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9642A62027;
 Fri,  8 Apr 2022 15:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079CAC385A3;
 Fri,  8 Apr 2022 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649433159;
 bh=MIPO6NzLS3OATyraPtetroejBNzc206DoT0mn5TCp+I=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=bYkO4hwlm/P9fnSaQQxTFvjEGgVT1QyTcZ8X9i4p3D4YiuPBNSmFjSEfxAAFzF4US
 dyoz0WO5QiQw4iSoUlLyg+9Bq05k+9DoNP3spsvp4skXez5LTYBQlwAC/WaA2XC2++
 UcmjfzurU8isRCRKtlCCm0fn6o3elVM90mz1bzexYfE53nUMfRU7EDh2KisWaWMfc/
 5yusXZMK4U69psC7ZCyyknnuHWdqHS3xUlCXbvn2X5gA6XniXEi2UO0PXiVjc2a8WF
 S/jJ92BE+jn2Lw2DaqE8emWc2LYF+e42VRpxDO4jRb69w/UyCRxvWEZyEvA74G/U89
 2BekZ+lhEIwHA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id A69865C0176; Fri,  8 Apr 2022 08:52:38 -0700 (PDT)
Date: Fri, 8 Apr 2022 08:52:38 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: rcu_sched self-detected stall on CPU
Message-ID: <20220408155238.GG4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
 <87k0bz7i1s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0bz7i1s.fsf@mpe.ellerman.id.au>
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

On Sat, Apr 09, 2022 at 12:42:39AM +1000, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > "Paul E. McKenney" <paulmck@kernel.org> writes:
> >> On Wed, Apr 06, 2022 at 05:31:10PM +0800, Zhouyi Zhou wrote:
> >>> Hi
> >>> 
> >>> I can reproduce it in a ppc virtual cloud server provided by Oregon
> >>> State University.  Following is what I do:
> >>> 1) curl -l https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-5.18-rc1.tar.gz
> >>> -o linux-5.18-rc1.tar.gz
> >>> 2) tar zxf linux-5.18-rc1.tar.gz
> >>> 3) cp config linux-5.18-rc1/.config
> >>> 4) cd linux-5.18-rc1
> >>> 5) make vmlinux -j 8
> >>> 6) qemu-system-ppc64 -kernel vmlinux -nographic -vga none -no-reboot
> >>> -smp 2 (QEMU 4.2.1)
> >>> 7) after 12 rounds, the bug got reproduced:
> >>> (http://154.223.142.244/logs/20220406/qemu.log.txt)
> >>
> >> Just to make sure, are you both seeing the same thing?  Last I knew,
> >> Zhouyi was chasing an RCU-tasks issue that appears only in kernels
> >> built with CONFIG_PROVE_RCU=y, which Miguel does not have set.  Or did
> >> I miss something?
> >>
> >> Miguel is instead seeing an RCU CPU stall warning where RCU's grace-period
> >> kthread slept for three milliseconds, but did not wake up for more than
> >> 20 seconds.  This kthread would normally have awakened on CPU 1, but
> >> CPU 1 looks to me to be very unhealthy, as can be seen in your console
> >> output below (but maybe my idea of what is healthy for powerpc systems
> >> is outdated).  Please see also the inline annotations.
> >>
> >> Thoughts from the PPC guys?
> >
> > I haven't seen it in my testing. But using Miguel's config I can
> > reproduce it seemingly on every boot.
> >
> > For me it bisects to:
> >
> >   35de589cb879 ("powerpc/time: improve decrementer clockevent processing")
> >
> > Which seems plausible.
> >
> > Reverting that on mainline makes the bug go away.
> >
> > I don't see an obvious bug in the diff, but I could be wrong, or the old
> > code was papering over an existing bug?
> >
> > I'll try and work out what it is about Miguel's config that exposes
> > this vs our defconfig, that might give us a clue.
> 
> It's CONFIG_HIGH_RES_TIMERS=n which triggers the stall.
> 
> I can reproduce just with:
> 
>   $ make ppc64le_guest_defconfig
>   $ ./scripts/config -d HIGH_RES_TIMERS
> 
> We have no defconfigs that disable HIGH_RES_TIMERS, I didn't even
> realise you could disable it TBH :)
> 
> The Rust CI has it disabled because I copied that from the x86 defconfig
> they were using back when I added the Rust support. I think that was
> meant to be a stripped down fast config for CI, but the result is it's
> just using a badly tested combination which is not helpful.
> 
> So I'll send a patch to turn HIGH_RES_TIMERS on for the Rust CI, and we
> can debug this further without blocking them.

Would it make sense to select HIGH_RES_TIMERS from one of the Kconfig*
files in arch/powerpc?  Asking for a friend.  ;-)

							Thanx, Paul
