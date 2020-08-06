Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F14C623DA8D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 15:06:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpfK34SWzDqCg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 23:06:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMpJc1ZQhzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 22:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RH6CPWj9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMpJb44wLz9sPB;
 Thu,  6 Aug 2020 22:51:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596718271;
 bh=jbljMSFvZxVXF/fBiXyFdWBSQc1VFJOBuucOYPnT1g4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RH6CPWj90kGWdeahVtj2Ja8tHj+/O81xDKEMRWn+LOYc/8p5j5Z8u0jvBoQKgrhhd
 PxjddFyOM+jHDKvQWG+wE/uhM9Iy4KM/b90sy+k234etOHK1IMsAy879Q2VjF0BMn3
 2lYzN5qhNUmz72qjRf2pNkvLmDK08NopeKyTIOu+Uw0pNTjS/RTpzYk1hLQgi5iB5t
 vq6PsL1HBV4/JSpMM1a+ecjtt8Leu1+EFi3cH0HmNeGobbMpLjQSkT63wrjrWcUW7W
 0DCXEAUy/PnX+yabuu2QPSYmCUGpoZBw587dgempZloIZin2U2zUIdz6p9g2YKUvsV
 fUNdM8ldkpKyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Roth <mdroth@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU
 death
In-Reply-To: <159666656828.15440.9097316124875217814@sif>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
 <873652zg8h.fsf@mpe.ellerman.id.au> <20200804161609.6cb2cb71@bahia.lan>
 <87zh79yen7.fsf@mpe.ellerman.id.au>
 <159660225263.15440.2633856149684894440@sif>
 <159666656828.15440.9097316124875217814@sif>
Date: Thu, 06 Aug 2020 22:51:10 +1000
Message-ID: <87wo2cx7i9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Michael Roth <mdroth@linux.vnet.ibm.com> writes:
> Quoting Michael Roth (2020-08-04 23:37:32)
>> Quoting Michael Ellerman (2020-08-04 22:07:08)
>> > Greg Kurz <groug@kaod.org> writes:
>> > > On Tue, 04 Aug 2020 23:35:10 +1000
>> > > Michael Ellerman <mpe@ellerman.id.au> wrote:
>> > >> Spinning forever seems like a bad idea, but as has been demonstrated at
>> > >> least twice now, continuing when we don't know the state of the other
>> > >> CPU can lead to straight up crashes.
>> > >> 
>> > >> So I think I'm persuaded that it's preferable to have the kernel stuck
>> > >> spinning rather than oopsing.
>> > >> 
>> > >
>> > > +1
>> > >
>> > >> I'm 50/50 on whether we should have a cond_resched() in the loop. My
>> > >> first instinct is no, if we're stuck here for 20s a stack trace would be
>> > >> good. But then we will probably hit that on some big and/or heavily
>> > >> loaded machine.
>> > >> 
>> > >> So possibly we should call cond_resched() but have some custom logic in
>> > >> the loop to print a warning if we are stuck for more than some
>> > >> sufficiently long amount of time.
>> > >
>> > > How long should that be ?
>> > 
>> > Yeah good question.
>> > 
>> > I guess step one would be seeing how long it can take on the 384 vcpu
>> > machine. And we can probably test on some other big machines.
>> > 
>> > Hopefully Nathan can give us some idea of how long he's seen it take on
>> > large systems? I know he was concerned about the 20s timeout of the
>> > softlockup detector.
>> > 
>> > Maybe a minute or two?
>> 
>> Hmm, so I took a stab at this where I called cond_resched() after
>> every 5 seconds of polling and printed a warning at the same time (FWIW
>> that doesn't seem to trigger any warnings on a loaded 96-core mihawk
>> system using KVM running the 384vcpu unplug loop)
>> 
>> But it sounds like that's not quite what you had in mind. How frequently
>> do you think we should call cond_resched()? Maybe after 25 iterations
>> of polling smp_query_cpu_stopped() to keep original behavior somewhat
>> similar?

I think we can just call it on every iteration, it should be cheap
compared to an RTAS call.

The concern was just by doing that you effectively prevent the
softlockup detector from reporting you as stuck in that path. Hence the
desire to manually print a warning after ~60s or something.

cheers
