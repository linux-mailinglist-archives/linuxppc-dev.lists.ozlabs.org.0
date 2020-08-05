Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 839AD23C4A7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLzRm462jzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 14:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=flukshun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RrRqGjCq; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLzPg65WSzDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 14:37:43 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id e6so18247343oii.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 21:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
 :cc:references:message-id:user-agent:subject:date;
 bh=h7/vLaQRbSJWqY7f6zY4rA5y1oVgwCG4LxidJCwdzco=;
 b=RrRqGjCqfDVXqwzJM8Jat8PSiKdYMeL6QzlUqExkgNK1QUZckG+Y1z0qFOazDCKRNC
 D7BYhL6uyVBqFzrGA+p00HCGCTQMrXcUbaPzEiC8lUlrTAVRL9wq4yOHnK353t6HVZy+
 gAtdVO1P56DTJXzdb6G8qz9teh0RRhpMsDzscAbQL7Rm/H7dUBpyXEGqqkSuhacFlRlx
 uOWu0eSjLheurDy2n+PhyqCb8hgEB4Sy4Jgi08OxxD4/QJrwhy3UhI66lQL8VCKBM/+b
 xgPyGIUfBeLv9ICb8aLe/JkRwcAV6ZBSXA5/YISqnYsXjsSktOb0/1otlu89qa1xjA1s
 triw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
 :from:in-reply-to:cc:references:message-id:user-agent:subject:date;
 bh=h7/vLaQRbSJWqY7f6zY4rA5y1oVgwCG4LxidJCwdzco=;
 b=IbyuML0fnzZEsHEvpP+m7PzzxhWo7uQXjY7D9wutcSzIiHaL1wukDgnpYShTD6uJme
 AhrEpL+JkPfas82Px5CaAi9wUD6j7jmm24edjfk7OhIJkE0sh4x0DgKpkxph5EsnN5C0
 0lME85RDiCZrFChePKoGI2X6uEWn15XQL3u3m4g3CXpE/K6TUh8Dyf6NPeFc1+Nv3Xmn
 UDyIxzkbGYPPTZsEIqoMWxmqUsF5SvkO0IYU5ICGceN9BHhWIRZBzoA9QBq74kmW+aNF
 bWo4h+XXbFwvRW8IaqDiVTDeuR8NfRwBadm2JiDTMvJ03+CMTFqf71Ed/uEAX1izEiJ0
 lVkw==
X-Gm-Message-State: AOAM532qJr25egGL+anYFprIYG6uUu01lM26amgBoe8COS55iUu1i6FQ
 +MZJCwPXXtPE6lKwP+y6dThoJgIL
X-Google-Smtp-Source: ABdhPJyQAjKWFKgzge2Ku/Bz9hrA0t+kayshAUY3pC8JRR0PGvpvvn56h2de8PmoL7Y2XY0H4nVzDw==
X-Received: by 2002:a05:6808:992:: with SMTP id
 a18mr1263825oic.95.1596602259633; 
 Tue, 04 Aug 2020 21:37:39 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id s26sm199403ooc.31.2020.08.04.21.37.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 21:37:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Greg Kurz <groug@kaod.org>, Michael Ellerman <mpe@ellerman.id.au>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <87zh79yen7.fsf@mpe.ellerman.id.au>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
 <873652zg8h.fsf@mpe.ellerman.id.au> <20200804161609.6cb2cb71@bahia.lan>
 <87zh79yen7.fsf@mpe.ellerman.id.au>
Message-ID: <159660225263.15440.2633856149684894440@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU
 death
Date: Tue, 04 Aug 2020 23:37:32 -0500
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Cedric Le Goater <clg@kaod.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Michael Ellerman (2020-08-04 22:07:08)
> Greg Kurz <groug@kaod.org> writes:
> > On Tue, 04 Aug 2020 23:35:10 +1000
> > Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> There is a bit of history to this code, but not in a good way :)
> >> =

> >> Michael Roth <mdroth@linux.vnet.ibm.com> writes:
> >> > For a power9 KVM guest with XIVE enabled, running a test loop
> >> > where we hotplug 384 vcpus and then unplug them, the following traces
> >> > can be seen (generally within a few loops) either from the unplugged
> >> > vcpu:
> >> >
> >> >   [ 1767.353447] cpu 65 (hwid 65) Ready to die...
> >> >   [ 1767.952096] Querying DEAD? cpu 66 (66) shows 2
> >> >   [ 1767.952311] list_del corruption. next->prev should be c00a00000=
2470208, but was c00a000002470048
> >> ...
> >> >
> >> > At that point the worker thread assumes the unplugged CPU is in some
> >> > unknown/dead state and procedes with the cleanup, causing the race w=
ith
> >> > the XIVE cleanup code executed by the unplugged CPU.
> >> >
> >> > Fix this by inserting an msleep() after each RTAS call to avoid
> >> =

> >> We previously had an msleep(), but it was removed:
> >> =

> >>   b906cfa397fd ("powerpc/pseries: Fix cpu hotplug")
> >
> > Ah, I hadn't seen that one...
> >
> >> > pseries_cpu_die() returning prematurely, and double the number of
> >> > attempts so we wait at least a total of 5 seconds. While this isn't =
an
> >> > ideal solution, it is similar to how we dealt with a similar issue f=
or
> >> > cede_offline mode in the past (940ce422a3).
> >> =

> >> Thiago tried to fix this previously but there was a bit of discussion
> >> that didn't quite resolve:
> >> =

> >>   https://lore.kernel.org/linuxppc-dev/20190423223914.3882-1-bauerman@=
linux.ibm.com/
> >
> > Yeah it appears that the motivation at the time was to make the "Queryi=
ng DEAD?"
> > messages to disappear and to avoid potentially concurrent calls to rtas=
-stop-self
> > which is prohibited by PAPR... not fixing actual crashes.
> =

> I'm pretty sure at one point we were triggering crashes *in* RTAS via
> this path, I think that got resolved.
> =

> >> Spinning forever seems like a bad idea, but as has been demonstrated at
> >> least twice now, continuing when we don't know the state of the other
> >> CPU can lead to straight up crashes.
> >> =

> >> So I think I'm persuaded that it's preferable to have the kernel stuck
> >> spinning rather than oopsing.
> >> =

> >
> > +1
> >
> >> I'm 50/50 on whether we should have a cond_resched() in the loop. My
> >> first instinct is no, if we're stuck here for 20s a stack trace would =
be
> >> good. But then we will probably hit that on some big and/or heavily
> >> loaded machine.
> >> =

> >> So possibly we should call cond_resched() but have some custom logic in
> >> the loop to print a warning if we are stuck for more than some
> >> sufficiently long amount of time.
> >
> > How long should that be ?
> =

> Yeah good question.
> =

> I guess step one would be seeing how long it can take on the 384 vcpu
> machine. And we can probably test on some other big machines.
> =

> Hopefully Nathan can give us some idea of how long he's seen it take on
> large systems? I know he was concerned about the 20s timeout of the
> softlockup detector.
> =

> Maybe a minute or two?

Hmm, so I took a stab at this where I called cond_resched() after
every 5 seconds of polling and printed a warning at the same time (FWIW
that doesn't seem to trigger any warnings on a loaded 96-core mihawk
system using KVM running the 384vcpu unplug loop)

But it sounds like that's not quite what you had in mind. How frequently
do you think we should call cond_resched()? Maybe after 25 iterations
of polling smp_query_cpu_stopped() to keep original behavior somewhat
similar?

I'll let the current patch run on the mihawk system overnight in the
meantime so we at least have that data point, but would be good to
know what things look like a large pHyp machine.

Thanks!

> =

> >> > Fixes: eac1e731b59ee ("powerpc/xive: guest exploitation of the XIVE =
interrupt controller")
> >> > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=3D1856588
> >> =

> >> This is not public.
> >
> > I'll have a look at changing that.
> =

> Thanks.
> =

> cheers
