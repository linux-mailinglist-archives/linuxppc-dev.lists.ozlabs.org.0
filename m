Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A34F927A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 12:03:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZYjD4dWZz3bdy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 20:03:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JL4EzbSm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JL4EzbSm; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZYhZ6rGjz2xgX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 20:02:37 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id qh7so16196795ejb.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jNjdDR9GwRW08Whk7NQY8zl0I1ljR1QYgIpdjTAmx+I=;
 b=JL4EzbSmAH5MOM8Cj48evlVXrKhasMm966jPzXC6EeJt1+9V6B/sUICsndEmALOTBi
 mR9/6Kjyt1nb5bXHsPn4SBW9E3ikaaLxohDOlQ0BBVczMDFNTcZp1AtOCcQAn9FKQf1N
 lNOfY2GXvVVpK0B4rzjqgvAA5F+wkS6TPWNn92zdXfS77T9xkHPn0rx4vYfvrMZ+tycu
 9NoajP1cpc9bcZvDOdGWQuFzd5PcpvphvtGf9XVZdAxY6XFoCiMfG7KbWDeKQN4bv4uq
 6m402ryAa+ar6i76TUxtMLtGQG4G+8DpiVE5vUlzU3b1tL7oAipdY2ooo3Y6kHU6UMWs
 yTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jNjdDR9GwRW08Whk7NQY8zl0I1ljR1QYgIpdjTAmx+I=;
 b=UJHm3SZYx8VwvPd346mULZo/sh4H6f6pkL78Qc7gaFd1CGjNGSYAPSebzjkGogix08
 iLaK3xhjOxhRZDdHxcuvp5ySxqjsPK1XiGeHy2s9a8BYk5oVAgfIxUQcR8yR0HJhyvd+
 UbuWhBwp/aG7a9hcJPc1oiqTxg2Mt18fJKdVCfSHrRutS/Ap4gSjIX2dlxAdjfe80EhB
 9RGixCvXDud50H+H9QLFIQNshbuu34usGkdJtQv3zTaVjmcNF/HTzRqm7ZA2gn55Kzjo
 5Fy8kjjKAZ2dVhck7hEvCOzDW4FTa1sxGH5/cF1Vklz2pgX4UnkAK3mpPJ4w2ITqSWqW
 GiBQ==
X-Gm-Message-State: AOAM530HuGAaBy6LT9nK5eKWmK3HHfZwF6kyZwyJLyTT4o7fKaeBQRgG
 Rabky+aMi+j3FBbWZblV1D1UOw/UQqAQXQXo29Y=
X-Google-Smtp-Source: ABdhPJxUh6ig+tIb7ZLGnVrw3jOvwjNLwlMbT2O+DqCy5O0+dBRPvr9pCJpPqC8m34BiyK59oKr/pkmtL8xbvftl/Ck=
X-Received: by 2002:a17:907:7da5:b0:6e4:e40f:60a0 with SMTP id
 oz37-20020a1709077da500b006e4e40f60a0mr17739145ejc.486.1649412151422; Fri, 08
 Apr 2022 03:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmls6nt7.fsf@mpe.ellerman.id.au>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Fri, 8 Apr 2022 18:02:19 +0800
Message-ID: <CAABZP2wVAzybDTjUWxwGG4HmWK7V8rJVVFxpRx-3F9n5oST3+A@mail.gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: rcu <rcu@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 8, 2022 at 3:23 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
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
I also bisect to 35de589cb879 ("powerpc/time: improve decrementer
clockevent processing")
>
> Reverting that on mainline makes the bug go away.
I also revert that on the mainline, and am currently doing a pressure
test (by repeatedly invoking qemu and checking the console.log) on PPC
VM in Oregon State University.
>
> I don't see an obvious bug in the diff, but I could be wrong, or the old
> code was papering over an existing bug?
>
> I'll try and work out what it is about Miguel's config that exposes
> this vs our defconfig, that might give us a clue.
Great job!
>
> cheers
Thanks
Zhouyi
