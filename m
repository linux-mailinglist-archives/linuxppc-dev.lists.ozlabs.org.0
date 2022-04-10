Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C284FADAB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 13:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbqdP07jxz3bgh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 21:34:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ABKNUeSe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kbqcn5cdWz2xfC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 21:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ABKNUeSe; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kbqcm0Qzdz4xLT;
 Sun, 10 Apr 2022 21:33:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649590424;
 bh=8f4PE/GIp3JZl1tbeUfCm8Jv9/KkWtCPiuEasvbGIAA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ABKNUeSeLo3WdS/+bOvS2AJ1X/1pZe4Kef4f27If8oRAovqbCa2TkEHR9K8gX/bun
 PQrm/tRn0DUnxAhqxq+TbWuwu5foVhU12i71rskhcLZg3coQlqL5tM1ssPfjFVEaLP
 y4ItLOpgqylvXYGRC7RHBFmLvgLe3YMr7zAesd5a8odeiD6NXTQNRtSJEKKeg+n8hv
 Mn85WXh5Ea5Rwe9OpzubQcnXhvg2174MlHYK9meczsgUQCe5mNkvrGfR1r2Dl1Lshk
 aaKsMqo0x7RG3Yt1WtyiccwzKdx6F13J6LUCeqsXtI2LJ5fE0+0KAx8wicNbbRfxfO
 kpqeLxwEwO9Mw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: rcu_sched self-detected stall on CPU
In-Reply-To: <CAABZP2zEU8eULq30ZLcUeqxjXuLTKO4b3wm_Jo458Nq_JJ7pEw@mail.gmail.com>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
 <CAABZP2wVAzybDTjUWxwGG4HmWK7V8rJVVFxpRx-3F9n5oST3+A@mail.gmail.com>
 <20220408140712.GZ4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zEU8eULq30ZLcUeqxjXuLTKO4b3wm_Jo458Nq_JJ7pEw@mail.gmail.com>
Date: Sun, 10 Apr 2022 21:33:43 +1000
Message-ID: <871qy56ulk.fsf@mpe.ellerman.id.au>
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
Cc: rcu <rcu@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> On Fri, Apr 8, 2022 at 10:07 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>> On Fri, Apr 08, 2022 at 06:02:19PM +0800, Zhouyi Zhou wrote:
>> > On Fri, Apr 8, 2022 at 3:23 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
...
>> > > I haven't seen it in my testing. But using Miguel's config I can
>> > > reproduce it seemingly on every boot.
>> > >
>> > > For me it bisects to:
>> > >
>> > >   35de589cb879 ("powerpc/time: improve decrementer clockevent processing")
>> > >
>> > > Which seems plausible.
>> > I also bisect to 35de589cb879 ("powerpc/time: improve decrementer
>> > clockevent processing")
...
>>
>> > > Reverting that on mainline makes the bug go away.

>> > I also revert that on the mainline, and am currently doing a pressure
>> > test (by repeatedly invoking qemu and checking the console.log) on PPC
>> > VM in Oregon State University.

> After 306 rounds of stress test on mainline without triggering the bug
> (last for 4 hours and 27 minutes), I think the bug is indeed caused by
> 35de589cb879 ("powerpc/time: improve decrementer clockevent
> processing") and stop the test for now.

Thanks for testing, that's pretty conclusive.

I'm not inclined to actually revert it yet.

We need to understand if there's actually a bug in the patch, or if it's
just exposing some existing bug/bad behavior we have. The fact that it
only appears with CONFIG_HIGH_RES_TIMERS=n is suspicious.

Do we have some code that inadvertently relies on something enabled by
HIGH_RES_TIMERS=y, or do we have a bug that is hidden by HIGH_RES_TIMERS=y ?

cheers
