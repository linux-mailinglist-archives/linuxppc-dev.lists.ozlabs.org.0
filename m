Return-Path: <linuxppc-dev+bounces-5724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2AA2350E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 21:26:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkVtC0xKZz30Bd;
	Fri, 31 Jan 2025 07:26:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738268803;
	cv=none; b=DmYjSb0sWa8Tpb135nz3C7Tqzni+19al888XUhFbYaNDQSotRj6WRf7bimM6uO9PbfYxcaSeaW996rwuuu8NwNvS9PtcE5Eib42KbYPjlewmdW1Kf/M6ydHjjYfRvwUtMmZGtNLiFr+BPuButtnL7rl1izZqz5B89F5Kp1I2b3WkmZfJmi8Ua5JOhFPxgFOBr27LnOyi8lI/AZALD63T77Z1YnzdAdkd9iYY7yO9yAhLnqqFv/mgBftt55jHcVJn9ewNiODofKLeDcjq3G9sLOfwN5tH/OIA/Qw/OEr04mUTjeKISejC6OYgs1WkXzIKviydzd6IUDabDYY9GYG06w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738268803; c=relaxed/relaxed;
	bh=raKStGmQ1HgcDzebMHePJVys7D0i3X8hHAKlsWuJCIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htfClzenyoqYQgGh9PrckAMvLxje359Gal0qsk2rUNqfp4Rgrxu6rAdmRKQoAwgKL+P0bXfqaSsI/hkr16pCtnweDKZLWfD3iQ6dzaQ1r4H2w+SRiXfIsOPHz/FUnGIsgjzXE+vL802otn2Q5BBbQBVCnhGKaVi8yuLR6laFNypxIgDc85ifev4cPWhTnvYBW+NpJi9Aa8jSnbjlpuvRYFj2upuUJ/rvH1UeeITiKKX3YisQxEwO2xHSE5wVc4g0B5XEKhkMrDvZW7/Lk81ZDGyu1dq1N/aXN2CPBLxheh/4RoMeTsRhLHEGjk76GZazmvCe4RihO5Dc884eUEtTRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0ko0sTai; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MaqkWpfu; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0ko0sTai;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MaqkWpfu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkVtB2TPwz2yvj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 07:26:42 +1100 (AEDT)
Date: Thu, 30 Jan 2025 21:26:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738268796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=raKStGmQ1HgcDzebMHePJVys7D0i3X8hHAKlsWuJCIA=;
	b=0ko0sTaiJJwaxW8bhn13GnM7LjqYjETxlX1v5/dPILw7a8h+A1dw+OPBtBgHpD3MWPMQvK
	+7fabej8mr1u1GhgVImjjm1oI5HgPf+PvJY2UCuunyGfZvYwSOvAIYdyuuo8TVD8DpvRtQ
	FjV/9KY14DF6G38sW2l/RJVWnyJu1rFJznFAIkAn5E9NRU3Bf/h0mT8qEoPpGiI8wAw43F
	QIZP/i7RtljRdDPAYGxF5pezvSLzHPNXup1IUw7m1QpGkaTW/kBrD6bh+EQTgk/RH7/Bv4
	7AJX+68opRRVXyy/F8N0SNicKhlAMUHzTJhNimmcQD7WXUmYGj2PJP1SkIF+DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738268796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=raKStGmQ1HgcDzebMHePJVys7D0i3X8hHAKlsWuJCIA=;
	b=MaqkWpfuGWBc1JyZ5Qgj5qBjueGmZfGBO1JQrK/JVn4QpWW3wFPIpaDe2Of2y95FyM228e
	AZe2qZ2c0igSNVDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
Message-ID: <20250130202634.eeb9TfkW@linutronix.de>
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
 <b73b5143-1a7f-4032-ac06-43db3bf4abea@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b73b5143-1a7f-4032-ac06-43db3bf4abea@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-30 22:27:07 [+0530], Shrikanth Hegde wrote:
> > | #DEFINE need_irq_preemption() \
> > |          (static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> > |
> > | 	if (need_irq_preemption()) {
> > 
> > be a bit smaller/ quicker? This could be a fast path ;)
> 
> I am okay with either way. I did try both[1], there wasn't any significant difference,
> hence chose a simpler one. May be system size, workload pattern might matter.
> 
> Let me do some more testing to see which one wins.
> Is there any specific benchmark which might help here?

No idea. As per bean counting: preempt_model_preemptible() should
resolve in two function calls + conditional in the dynamic case. This
should be more expensive compared to a nop/ branch ;)
But you would still need preempt_model_preemptible() for the !DYN case.

> > > +	       preempt_model_voluntary() ? "voluntary" :
> > > +	       preempt_model_full()      ? "full" :
> > > +	       preempt_model_lazy()      ? "lazy" :
> > > +	       "",
> > 
> > So intend to rework this part. I have patches stashed at
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git/log/?h=preemption_string
> > 
> > which I didn't sent yet due to the merge window. Just a heads up ;)
> 
> Makes sense. I had seen at-least two places where this code was there, ftrace/powerpc.
> There were way more places..
> 
> You want me to remove this part?

No, just be aware.
I don't know how this will be routed I guess we merge the sched pieces
first and then I submit the other pieces via the relevant maintainer
tree. In that case please be aware that all parts get removed/ replaced
properly.

Sebastian

