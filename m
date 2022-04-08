Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D73B04F97FB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 16:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZgXf6Mb9z3bZf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 00:26:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BAdiVnHZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BAdiVnHZ; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZgX12Lqxz2xVY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 00:25:35 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id p15so17680937ejc.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u2DoQQgFz7qw9MRtc8eSxOedE/fArJRIQcISz938HxU=;
 b=BAdiVnHZN6uxLx/6Snzgs112QvtFvU1KZQqXra3goU8hv0ht1R+cuXXr6/+lMuwzt1
 4PO2rKowkKCAkKi5hwhDWRvRWAmaRFSdiBhrjcbPy5ezs0m46X5nX9B6pteN/kbX2PEo
 R/3lgpXq7nPscncCc6hP4VWo0bdt3YE684mbwXJ3HUn9uL9ZbLYyFPq4hD+jCPj54Kp5
 TEM0KoJPpY8J/ALpOoosmnVdeKL9Sk1p5uTHl0WiFWMAymGXWNuEBM9lo3NnCkpvDQOa
 ZFp4mMIxadHfGdrSARV+hWlJq9VTcWRZLlI7u+L3uyZ0U2a+UhYvnhqVlUB+gdXE7+69
 dXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u2DoQQgFz7qw9MRtc8eSxOedE/fArJRIQcISz938HxU=;
 b=sU5+NezQ7rAq/oyE+i3yfVxsKnLUanXlr1pOl+WP1ncaFhXNLqNLncduXcniAGUlq2
 cU7d+MBuIya4x0YTjfNGzR7cqrwqe4gFxAKunwgRagOO+DZ8qJt/JkWQv/IVGEKt8DkD
 KvqkMPDwEIYZp0SDe274aR17qbC1yueWoeHarB8topm+nV29VQoR6GMur/2a+dZ9SJHH
 Ix4Al7kB7ETCkrMcl4gzHmLK7u39lQYGjrv/hhkQwYwEZtpSsjilYC2GOPPvmICOAgDj
 DjxRcWs5lT1MVN1LxfPKLHhOt6eSk2xHrMH6XTCXrOVXzDtrn33lLpjG0AuBsDRf+qz4
 oZcw==
X-Gm-Message-State: AOAM532xLg3q+M0+OjWlhr1ZXIue7glqM5DDBKeC3NDNg4zgeAQ2wb0k
 tQAiMTbs8Jbncmbctmx+IrOou/8LfeVffbi6nY9UKH11slA=
X-Google-Smtp-Source: ABdhPJwMMe6CWFJwjcXGuD2SKEWs4JkfV9lHITjThhdtLlmqkmLABQYXc9h+iYmaeyssvf47ZyEN/O3Ml6qX00pak4M=
X-Received: by 2002:a17:907:d1e:b0:6e1:3aa5:8e5 with SMTP id
 gn30-20020a1709070d1e00b006e13aa508e5mr18285929ejc.324.1649427932107; Fri, 08
 Apr 2022 07:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
 <CAABZP2wVAzybDTjUWxwGG4HmWK7V8rJVVFxpRx-3F9n5oST3+A@mail.gmail.com>
 <20220408140712.GZ4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220408140712.GZ4285@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Fri, 8 Apr 2022 22:25:20 +0800
Message-ID: <CAABZP2zEU8eULq30ZLcUeqxjXuLTKO4b3wm_Jo458Nq_JJ7pEw@mail.gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Cc: rcu <rcu@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 8, 2022 at 10:07 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Fri, Apr 08, 2022 at 06:02:19PM +0800, Zhouyi Zhou wrote:
> > On Fri, Apr 8, 2022 at 3:23 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >
> > > "Paul E. McKenney" <paulmck@kernel.org> writes:
> > > > On Wed, Apr 06, 2022 at 05:31:10PM +0800, Zhouyi Zhou wrote:
> > > >> Hi
> > > >>
> > > >> I can reproduce it in a ppc virtual cloud server provided by Oregon
> > > >> State University.  Following is what I do:
> > > >> 1) curl -l https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-5.18-rc1.tar.gz
> > > >> -o linux-5.18-rc1.tar.gz
> > > >> 2) tar zxf linux-5.18-rc1.tar.gz
> > > >> 3) cp config linux-5.18-rc1/.config
> > > >> 4) cd linux-5.18-rc1
> > > >> 5) make vmlinux -j 8
> > > >> 6) qemu-system-ppc64 -kernel vmlinux -nographic -vga none -no-reboot
> > > >> -smp 2 (QEMU 4.2.1)
> > > >> 7) after 12 rounds, the bug got reproduced:
> > > >> (http://154.223.142.244/logs/20220406/qemu.log.txt)
> > > >
> > > > Just to make sure, are you both seeing the same thing?  Last I knew,
> > > > Zhouyi was chasing an RCU-tasks issue that appears only in kernels
> > > > built with CONFIG_PROVE_RCU=y, which Miguel does not have set.  Or did
> > > > I miss something?
> > > >
> > > > Miguel is instead seeing an RCU CPU stall warning where RCU's grace-period
> > > > kthread slept for three milliseconds, but did not wake up for more than
> > > > 20 seconds.  This kthread would normally have awakened on CPU 1, but
> > > > CPU 1 looks to me to be very unhealthy, as can be seen in your console
> > > > output below (but maybe my idea of what is healthy for powerpc systems
> > > > is outdated).  Please see also the inline annotations.
> > > >
> > > > Thoughts from the PPC guys?
> > >
> > > I haven't seen it in my testing. But using Miguel's config I can
> > > reproduce it seemingly on every boot.
> > >
> > > For me it bisects to:
> > >
> > >   35de589cb879 ("powerpc/time: improve decrementer clockevent processing")
> > >
> > > Which seems plausible.
> > I also bisect to 35de589cb879 ("powerpc/time: improve decrementer
> > clockevent processing")
>
> Very good!  Thank you all!!!
You are very welcome ;-)  and Thank you all!!!!
>
>                                                         Thanx, Paul
>
> > > Reverting that on mainline makes the bug go away.
> > I also revert that on the mainline, and am currently doing a pressure
> > test (by repeatedly invoking qemu and checking the console.log) on PPC
> > VM in Oregon State University.
After 306 rounds of stress test on mainline without triggering the bug
(last for 4 hours and 27 minutes), I think the bug is indeed caused by
35de589cb879 ("powerpc/time: improve decrementer clockevent
processing") and stop the test for now.

Thanks ;-)
Zhouyi
> > >
> > > I don't see an obvious bug in the diff, but I could be wrong, or the old
> > > code was papering over an existing bug?
> > >
> > > I'll try and work out what it is about Miguel's config that exposes
> > > this vs our defconfig, that might give us a clue.
> > Great job!
> > >
> > > cheers
> > Thanks
> > Zhouyi
