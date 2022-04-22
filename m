Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9A50BC2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 17:54:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlJqb73lvz3bpQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 01:54:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0B/g2yGc;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h+b8XloV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=0B/g2yGc; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=h+b8XloV; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlJpz5Z2lz3bWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 01:53:31 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1650642805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=egLwwNxV76btrQ9q6om6wjZt3PbLjlniEsPtA9utVZE=;
 b=0B/g2yGcr/YICXgS6yxrwyv3L9VyBOoE8ZDe1IZ6DiB/hNt5NOAtPBfDcbaVGnuC9NBNZr
 WzfW8KArxGYgHvrcWCVUrCfsCUZGiDLCKSsTnh0rQMZBoir0Bdf56o8yJmEZZXhQn3fvOi
 1pij3IAAlT1DL0fv/o751EUPVw2qSAezWfAOD+BpCvTQD5HqXOm5BIChszEt3x5eGIGu/b
 Cq1vZ4TjAROsrj/gm8Trlv8CuRVFPsRcRfce+81J0wg5OJUCBzNuzX69kH0UfKEhmjEwEo
 3rHc0uew53iewGSZoklZ1XUowp1GyVzmdH+YBE0l1LfmOesn9cVZML2A5eXjUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1650642805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=egLwwNxV76btrQ9q6om6wjZt3PbLjlniEsPtA9utVZE=;
 b=h+b8XloVx+fEEddSy+0yPJCFyuqiaW+GGnk2EUrdGujBSkcAApL+SE7A/hzyZEQRVQVwfy
 nZLkXLdKq0h2SMDg==
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, paulmck@kernel.org, Zhouyi Zhou
 <zhouzhouyi@gmail.com>
Subject: Re:
In-Reply-To: <1649818529.j46672mh2p.astroid@bobo.none>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au> <87k0bz7i1s.fsf@mpe.ellerman.id.au>
 <1649818529.j46672mh2p.astroid@bobo.none>
Date: Fri, 22 Apr 2022 17:53:24 +0200
Message-ID: <87fsm55d3f.ffs@tglx>
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 rcu <rcu@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 13 2022 at 15:11, Nicholas Piggin wrote:
> So we traced the problem down to possibly a misunderstanding between 
> decrementer clock event device and core code.
>
> The decrementer is only oneshot*ish*. It actually needs to either be 
> reprogrammed or shut down otherwise it just continues to cause 
> interrupts.

I always thought that PPC had sane timers. That's really disillusioning.

> Before commit 35de589cb879, it was sort of two-shot. The initial 
> interrupt at the programmed time would set its internal next_tb variable 
> to ~0 and call the ->event_handler(). If that did not set_next_event or 
> stop the timer, the interrupt will fire again immediately, notice 
> next_tb is ~0, and only then stop the decrementer interrupt.
>
> So that was already kind of ugly, this patch just turned it into a hang.
>
> The problem happens when the tick is stopped with an event still 
> pending, then tick_nohz_handler() is called, but it bails out because 
> tick_stopped == 1 so the device never gets programmed again, and so it 
> keeps firing.
>
> How to fix it? Before commit a7cba02deced, powerpc's decrementer was 
> really oneshot, but we would like to avoid doing that because it requires 
> additional programming of the hardware on each timer interrupt. We have 
> the ONESHOT_STOPPED state which seems to be just about what we want.
>
> Did the ONESHOT_STOPPED patch just miss this case, or is there a reason 
> we don't stop it here? This patch seems to fix the hang (not heavily
> tested though).

This was definitely overlooked, but it's arguable it is is not required
for real oneshot clockevent devices. This should only handle the case
where the interrupt was already pending.

The ONESHOT_STOPPED state was introduced to handle the case where the
last timer gets canceled, so the already programmed event does not fire.

It was not necessarily meant to "fix" clockevent devices which are
pretending to be ONESHOT, but keep firing over and over.

That, said. I'm fine with the change along with a big fat comment why
this is required.

Thanks,

        tglx
