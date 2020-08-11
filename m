Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80068241AB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 13:58:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQrvX1gNPzDqNk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 21:58:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQrsb1F1tzDqMb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 21:56:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TY6TpWVq; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQrsZ6JJYz9sRN;
 Tue, 11 Aug 2020 21:56:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597147010;
 bh=dhLB5WjSUDtOcwhNZ+SteCjkOiFkvQhVrrHYd19toYw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TY6TpWVqdayK1xr/IHaJBx+q8cCdwDi/ymGC0k4Im4MVRPdy5ta9kCk6RFvy9HoWQ
 kYeHA1Au06X4yvTrcV2jmCxv23G8jhFE2c1gUpoRibJvP24EOM5dRaKRh9o88DgiO5
 kFq6mScAzIzNDEWIrk5cR78BZQROAy/E2C3n/83M/s9B+Wdpkmd5gW2clRrlyWIpi/
 bOgcsdjS6BGByksnJJcQ8IM2DdwVuW0eIJSbR+YVY3XaNL1xI7ezFVA8I4o5+gqAXO
 MbMDxskWmX8JfMFIvDE31uznHtaKJCVWwiVRpT5miLM++8Hhm7x20Y/AOWdM07KQDz
 Bvi0/P9C1vklQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Roth <mdroth@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU
 death
In-Reply-To: <159712434106.7191.15165087672426328577@sif>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
 <873652zg8h.fsf@mpe.ellerman.id.au> <20200804161609.6cb2cb71@bahia.lan>
 <87zh79yen7.fsf@mpe.ellerman.id.au> <87mu37ylzu.fsf@linux.ibm.com>
 <159712434106.7191.15165087672426328577@sif>
Date: Tue, 11 Aug 2020 21:56:50 +1000
Message-ID: <87r1sd9z0d.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Roth <mdroth@linux.vnet.ibm.com> writes:
> Quoting Nathan Lynch (2020-08-07 02:05:09)
...
>> wait_for_cpu_stopped() should be able to accommodate a time-based
>> warning if necessary, but speaking as a likely recipient of any bug
>> reports that would arise here, I'm not convinced of the need and I
>> don't know what a good value would be. It's relatively easy to sample
>> the stack of a task that's apparently failing to make progress, plus I
>> probably would use 'perf probe' or similar to report the inputs and
>> outputs for the RTAS call.
>
> I think if we make the timeout sufficiently high like 2 minutes or so
> it wouldn't hurt and if we did seem them it would probably point to an
> actual bug. But I don't have a strong feeling either way.

I think we should print a warning after 2 minutes.

It's true that there are fairly easy mechanisms to work out where the
thread is stuck, but customers are unlikely to use them. They're just
going to report that it's stuck with no further info, and probably
reboot the machine before we get a chance to get any further info.

Whereas if the kernel prints a warning with a stack trace we at least
have that to go on in an initial bug report.

>> I'm happy to make this a proper submission after I can clean it up and
>> retest it, or Michael R. is welcome to appropriate it, assuming it's
>> acceptable.
>> 
>
> I've given it a shot with this patch and it seems to be holding up in
> testing. If we don't think the ~2 minutes warning message is needed I
> can clean it up to post:
>
> https://github.com/mdroth/linux/commit/354b8c97bf0dc1146e36aa72273f5b33fe90d09e
>
> I'd likely break the refactoring patches out to a separate patch under
> Nathan's name since it fixes a separate bug potentially.

While I like Nathan's refactoring, we probably want to do the minimal
fix first to ease backporting.

Then do the refactoring on top of that.

cheers
