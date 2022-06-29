Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C755FBAA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 11:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXws26rg2z3cdM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 19:19:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MBGFcoYj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXwrQ42Bpz3cFH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 19:19:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MBGFcoYj;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXwrQ0988z4xD7;
	Wed, 29 Jun 2022 19:19:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656494342;
	bh=29PJfeDSMkOLNf2FkZWI9rQBkaWRAs9aho80WSfhaCs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MBGFcoYjn2Jfli66pfv4CZB0mz1WUjsFH5XNsjNxXmsIw2ZzCyS/mVWa+Fb8jvRw4
	 M4RwMT1do9//Tw6q8lrN5Ia3qG5Urb+dd13i666kFmwXPs5CWKuQo20bIOz1p2QrRP
	 MwHS4Qg3oswg9Cu5QcglLayvEyxxFUMqJqoGe7Hco/EeI1/LN0v4x622MPWfmwBH4v
	 IymQzdt2Cqj4Nh1ZFc87if+ahpFVYDQRwqJl+aVrF1Tp1uRLEeZuy2uy9IDVxe9umO
	 +ImAPIgwA1VUhe4mc2hXPbqwGBWIhlG0/irSWIvSosQpVZZFPAJAIM27tHJ3E7zuWk
	 yqW0JbzkYr+qQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/smp: poll cpu_callin_map more aggressively in
 __cpu_up()
In-Reply-To: <20220125072103.70715-1-nathanl@linux.ibm.com>
References: <20220125072103.70715-1-nathanl@linux.ibm.com>
Date: Wed, 29 Jun 2022 19:19:01 +1000
Message-ID: <87wncz3jzu.fsf@mpe.ellerman.id.au>
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
Cc: brking@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Replace the outdated iteration and timeout calculations here with
> indefinite spin_until_cond()-wrapped poll of cpu_callin_map. __cpu_up()
> already does this when waiting for the cpu to set its online bit before
> returning, so this change is not really making the function more brittle.

Sorry for the glacial response.

I'm not sure I agree that this doesn't make the code more brittle.

The existing indefinite wait you mention is later in the function, and
happens after the CPU has successfully come into the kernel.

I think it's more common that a stuck/borked CPU doesn't come into the
kernel at all, rather than comes in and then fails to online.

So I think the bail out when the CPU fails to call in is useful, I would
guess I see that "Processor x is stuck" message multiple times a year
while debugging various things.

> Removing the msleep(1) in the hotplug path here reduces the time it takes
> to online a CPU on a P9 PowerVM LPAR from about 30ms to 1ms when exercised
> via thaw_secondary_cpus().

That is a nice improvement.

Can we do something that returns quickly in the happy case and still has
a timeout when things go wrong? Seems like a busy loop with a
time_after() check would do the trick.

cheers
