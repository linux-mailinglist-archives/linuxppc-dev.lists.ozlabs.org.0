Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AEB63A287
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 09:13:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLJBT5lSFz3cLm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 19:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RVM1J6xm;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N+FP099L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RVM1J6xm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N+FP099L;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLJ9Z6fVDz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 19:12:34 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669623148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VptkHmPTPSs5eOtCUMB4/TKM/fssvk4H/apqtf0JHkw=;
	b=RVM1J6xmynemcQ48SmviPVnGKjkS+iQ7y+Dybo1n8DoWIBaaWEuXyAytD5l2OzjuGo+XFS
	Vk7ZKnYbH9kZZHEqug/eGckC2Pv+UOu8Nc49FWtne4+UPkyRZFdp5R50cRKgl5Yje2cxQo
	jAFdjHPp2hCdTAwi0J07qx20DkIEXxjb2mxvrN8i+p33hWoydbH9RsGFmRn8K7id0rHBBe
	LZbAIf2A/fEmq1cQEdvprJhMCpT2iyaxrvhrj2HHZg32ZEt0Di+ZMNxPiznaaJMaopGPIM
	7VoGy40TdxuFU0Tj0dEQKOTf1dvvoc9WqzkxraB5SxTENJJk8X3lsAcRA8L7sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669623148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VptkHmPTPSs5eOtCUMB4/TKM/fssvk4H/apqtf0JHkw=;
	b=N+FP099LREZdAsl3iwZTUkFtZExrnpVx38wkGZq8p/XNiiqKi2AVZkLug7YXt+xE9Tn1yG
	OP1gD3qu12stZLBw==
To: paulmck@kernel.org
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
In-Reply-To: <20221127175317.GF4001@paulmck-ThinkPad-P17-Gen-1>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
 <87y1rxwsse.ffs@tglx>
 <CAABZP2xNTbrx9iV+KH3VZx1c9Yi97+izNA=XSJQBuOJ4WENFZg@mail.gmail.com>
 <87v8n0woxv.ffs@tglx> <20221127175317.GF4001@paulmck-ThinkPad-P17-Gen-1>
Date: Mon, 28 Nov 2022 09:12:28 +0100
Message-ID: <87sfi3wl8z.ffs@tglx>
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
Cc: dave@stgolabs.net, linuxppc-dev@lists.ozlabs.org, josh@joshtriplett.org, linux-kernel@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, fweisbec@gmail.com, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 27 2022 at 09:53, Paul E. McKenney wrote:
> On Sun, Nov 27, 2022 at 01:40:28PM +0100, Thomas Gleixner wrote:
>> There are quite some reasons why a CPU-hotplug or a hot-unplug operation
>> can fail, which is not a fatal problem, really.
>> 
>> So if a CPU hotplug operation fails, then why can't the torture test
>> just move on and validate that the system still behaves correctly?
>> 
>> That gives us more coverage than just testing the good case and giving
>> up when something unexpected happens.
>
> Agreed, with access to a function like the tick_nohz_full_timekeeper()
> suggested earlier in this email thread, then yes, it would make sense to
> try to offline the CPU anyway, then forgive the failure in cases where
> the CPU matches that indicated by tick_nohz_full_timekeeper().

Why special casing this? There are other valid reasons why offlining can
fail. So we special case timekeeper today and then next week we special
case something else just because. That does not make sense. If it fails
there is a reason and you can log it. The important part is that the
system is functional and stable after the fail and the rollback.

>> I even argue that the torture test should inject random failures into
>> the hotplug state machine to achieve extended code coverage.
>
> I could imagine torture_onoff() telling various CPU-hotplug notifiers
> to refuse the transition using some TBD interface.

There is already an interface which is exposed to sysfs which allows you
to enforce a "fail" at a defined hotplug state.

> That would better test the CPU-hotplug common code's ability to deal
> with failures.

Correct.

> Or did you have something else/additional in mind?

No.

Thanks,

        tglx
