Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 606B523D3F1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 00:31:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMRDh4NPZzDqgF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 08:31:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c41;
 helo=mail-oo1-xc41.google.com; envelope-from=flukshun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M7DcdqLw; dkim-atps=neutral
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMRBX03dBzDqgb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 08:29:39 +1000 (AEST)
Received: by mail-oo1-xc41.google.com with SMTP id k4so4742838ooa.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Aug 2020 15:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
 :cc:references:message-id:user-agent:subject:date;
 bh=9LbmdfqrUlBIXyxOncbdSGwZKNQWIpLjA+wSvexG0n4=;
 b=M7DcdqLwwRay79Fff1HD+FkwHJ0FOS+jiEfqVpGds8IWd+2moYgWbnsNgNp7GbVVB/
 QPbzbrkF7Tewq5vU3YdLlzAc9paiNVXN8RZwsuxfQ1vkC3e08V/EklawFZicaxq21CF2
 6F+R7iWwWHMDx89kGftBaCtCFWcXNnv+yO8Dq6RC2tzIOpSrSfqUITJ6u5ZOPV/h55sj
 dvmsu0ShsAOCG1FoXJbNDMdbPwgut1/DyNfOX4WJeKCufn2jYRLEbYhfCahya7qBOYFt
 0/MxMyUoPX/nPqwPTV9stJQPgPaHh2WEhbohO7LQbIPMYNaDL0uhazd02Zewwl41DFZs
 ej4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
 :from:in-reply-to:cc:references:message-id:user-agent:subject:date;
 bh=9LbmdfqrUlBIXyxOncbdSGwZKNQWIpLjA+wSvexG0n4=;
 b=Aac+jIvrBjzdnGSnNuHiZ+FYRtywgp7YXiwa26LQ0GpL8uce8W0NSWDuj26z+REl/8
 JRPj9yT6pE+FVEayQdIlztNzJSTzzFzUF6ykuK3JSaKInwFS9OlnXqsw/aAwrvpm1s4Y
 61BEpNSBjrpmzXustfocCl3nOS/+liVYmStMfWy9X641VFA888Bk5oRMTbrIzoar+Nw7
 3hV7U2r90ZyeQ4653UxJpiVetu4rPxFYxErsXdaY2+qplIcMg0PRWgFWNarGGTemNMLE
 UmIdmxKl0/3g1dNY5jBp/qCCz0LAT8JB9QHy2ZHv7gmFqflaOwjdinriMyRx0yZ2dSc3
 GsaA==
X-Gm-Message-State: AOAM530IhO2rAQxz8uZKH/cqoLX0XuvXme4pgeicjvM9H+QkYu209Qui
 yKRFzLjdODUigjMv73ms4KTedlEm
X-Google-Smtp-Source: ABdhPJzMZjjSiI8mEUtYfmNImBXq2GihG5xrPRDqFqsu93KQfjdN03an6wukkY3hbFZzZcgc3lTdtQ==
X-Received: by 2002:a4a:52c2:: with SMTP id d185mr5040115oob.8.1596666575775; 
 Wed, 05 Aug 2020 15:29:35 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id h43sm730678ooi.30.2020.08.05.15.29.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Aug 2020 15:29:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Greg Kurz <groug@kaod.org>, Michael Ellerman <mpe@ellerman.id.au>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <159660225263.15440.2633856149684894440@sif>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
 <873652zg8h.fsf@mpe.ellerman.id.au> <20200804161609.6cb2cb71@bahia.lan>
 <87zh79yen7.fsf@mpe.ellerman.id.au>
 <159660225263.15440.2633856149684894440@sif>
Message-ID: <159666656828.15440.9097316124875217814@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU
 death
Date: Wed, 05 Aug 2020 17:29:28 -0500
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

Quoting Michael Roth (2020-08-04 23:37:32)
> Quoting Michael Ellerman (2020-08-04 22:07:08)
> > Greg Kurz <groug@kaod.org> writes:
> > > On Tue, 04 Aug 2020 23:35:10 +1000
> > > Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >> Spinning forever seems like a bad idea, but as has been demonstrated=
 at
> > >> least twice now, continuing when we don't know the state of the other
> > >> CPU can lead to straight up crashes.
> > >> =

> > >> So I think I'm persuaded that it's preferable to have the kernel stu=
ck
> > >> spinning rather than oopsing.
> > >> =

> > >
> > > +1
> > >
> > >> I'm 50/50 on whether we should have a cond_resched() in the loop. My
> > >> first instinct is no, if we're stuck here for 20s a stack trace woul=
d be
> > >> good. But then we will probably hit that on some big and/or heavily
> > >> loaded machine.
> > >> =

> > >> So possibly we should call cond_resched() but have some custom logic=
 in
> > >> the loop to print a warning if we are stuck for more than some
> > >> sufficiently long amount of time.
> > >
> > > How long should that be ?
> > =

> > Yeah good question.
> > =

> > I guess step one would be seeing how long it can take on the 384 vcpu
> > machine. And we can probably test on some other big machines.
> > =

> > Hopefully Nathan can give us some idea of how long he's seen it take on
> > large systems? I know he was concerned about the 20s timeout of the
> > softlockup detector.
> > =

> > Maybe a minute or two?
> =

> Hmm, so I took a stab at this where I called cond_resched() after
> every 5 seconds of polling and printed a warning at the same time (FWIW
> that doesn't seem to trigger any warnings on a loaded 96-core mihawk
> system using KVM running the 384vcpu unplug loop)
> =

> But it sounds like that's not quite what you had in mind. How frequently
> do you think we should call cond_resched()? Maybe after 25 iterations
> of polling smp_query_cpu_stopped() to keep original behavior somewhat
> similar?
> =

> I'll let the current patch run on the mihawk system overnight in the
> meantime so we at least have that data point, but would be good to
> know what things look like a large pHyp machine.

At one point I did manage to get the system in a state where unplug
operations were taking 1-2s, but still not enough to trigger any
5s warning, and I wasn't able to reproduce that in subsequent runs.

I also tried reworking the patch so that we print a warning and
cond_resched() after 200 ms to make sure that path gets executed, but
only managed to trigger the warning twice after a few hours.

So, if we print a warning after a couple minutes, that seems pretty
conservative as far as avoiding spurious warnings. And if we
cond_resched() after 25 loops of polling (~0.1 ms in the cases
that caused the original crash), that would avoid most of the
default RCU/lockup warnings.

But having a second timeout to trigger the cond_resched() after some
set interval like 2s seems more deterministic since we're less
susceptible to longer delays due to things like the RTAS calls
contending for QEMU's global mutex in the the KVM case.


> =

> Thanks!
> =

> > =

> > >> > Fixes: eac1e731b59ee ("powerpc/xive: guest exploitation of the XIV=
E interrupt controller")
> > >> > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=3D1856588
> > >> =

> > >> This is not public.
> > >
> > > I'll have a look at changing that.
> > =

> > Thanks.
> > =

> > cheers
