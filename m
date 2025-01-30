Return-Path: <linuxppc-dev+bounces-5721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC2A2319B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 17:14:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkPHQ4CWYz30Tk;
	Fri, 31 Jan 2025 03:14:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738253682;
	cv=none; b=cZDXROS8gNkgZ9YbA4AMUaekTiq705ETQo+ZCIz9H6RwpFHugID81w1ZGM5jkYN/mJshT5CqTvchu9Pd9mGJQ9xBFBECdx/6fNYu4Q00+uZeTGyJQAXpAvNJds7YAjLtM6W6/mfg895siN3ZRYirvEtEp4LP8WEGbnEvxz/7+L+nL56hrY5s7c/PKyePfd4pnPTRYc8fUiSCBzBx0egMRrmA6vaae5fXTWzwfUITx97lPRK8OA/xtJNHr8rfz0cWhS+Mg6ZY3SlcaPm9slfuCH1/pBeTpkZR5z/D+6RQh/faqLTDHl8iijAbga003MKIQqovVAhlHWtYpvgAmcS44g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738253682; c=relaxed/relaxed;
	bh=G103NOQeZO/912gTHo3Zy0BEdDJk2aj90MmEXGhW0e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FngkjBFHLcPwhJZV/LUokWN44ZUo8HV503Bp7jvvr0gpPe1WgFKb33w+Knzsc4ir7OXrawUN0gq+s++4R+cPgcwQortvptM+UlsL8grMP2gtmgSviwjqZtB2LXS4DX9WZPdHRH8ATyubo8DQbqjes7kU+t1FMQdO2o/uCGiPSjemYsBdObZKwOIskepMI9NEYt8h9l8O6dANvds1wc/2lz5gdWL/XgHTcEc0XnwMQqCz/+hq2nG206yDcyyhUArZj6IDqnHoRb8Hz6S4ll3jGTTOwmwdRIGfNiAZwAZpbJB2usbbeQwZT0tnxUjJENKyIanqaFQ7dQOerOji1rTsiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vokXiv+Q; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sbd3hR5z; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vokXiv+Q;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sbd3hR5z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkPHP42w5z2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 03:14:41 +1100 (AEDT)
Date: Thu, 30 Jan 2025 17:14:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738253675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G103NOQeZO/912gTHo3Zy0BEdDJk2aj90MmEXGhW0e8=;
	b=vokXiv+Qero0Rw6XoOZ5PQv5Ds69EnaKyVnQmxhy5z98ZOQkWakFs+ElSCtLWXt9AbMqn2
	EfQlMYSTHTdUbRnlkdKvWcasKF8PxH2Gw19m1dVpiPyWi3pHZDJBg0fSN74cpG/gnl1mkn
	uAMb7rd1vPy2UlgCxWLC8/XReEaWFr3JPCjlY3BKnHOjV/TxrLs8vH+U24cvF4SJ90v18i
	eMzX3Qc97xxT4+4M+ipsz/ATpKkIi9VubcXg+CP2nEGiCKAJe5X4ySEZJ4oMfvgEIkf5yq
	ho2ZnXukbtVm1EhgFAL8kGGQqFxZPin36wuzpc6ANLWyVY+jALI39UpVv+KChQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738253675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G103NOQeZO/912gTHo3Zy0BEdDJk2aj90MmEXGhW0e8=;
	b=Sbd3hR5zIRle69ykBJHqG1efMwrCscnRsXxPPGdHIIpyozfmXeF1XCVuYdWjokvWOII68N
	Xt3udXXG5B9wMGDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
	maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	npiggin@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
Message-ID: <20250130161434.0PELHkzk@linutronix.de>
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
 <05f6f732-e155-4b60-8c4e-984e42e51ee4@csgroup.eu>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <05f6f732-e155-4b60-8c4e-984e42e51ee4@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-30 16:03:09 [+0100], Christophe Leroy wrote:
> Le 30/01/2025 =C3=A0 15:54, Sebastian Andrzej Siewior a =C3=A9crit=C2=A0:
> > On 2025-01-06 10:49:19 [+0530], Shrikanth Hegde wrote:
> > > --- a/arch/powerpc/kernel/interrupt.c
> > > +++ b/arch/powerpc/kernel/interrupt.c
> > > @@ -25,6 +25,10 @@
> > >   unsigned long global_dbcr0[NR_CPUS];
> > >   #endif
> > > +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_D=
YNAMIC_KEY)
> > > +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> > > +#endif
> >=20
> > I am uncertain here: Do you need to DEFINE it? It is set by the sched
> > core which also defines it. It should be same thing after all, right?
>=20
> As far as I can see it is not handled by sched core.

=E2=80=A6
> It is in common entry but arm64 and powerpc don't use common entry.

Okay. So it is defined in the generic part (so you have to define it on
power) but it is used by sched-core (search for
	preempt_dynamic_enable(irqentry_exit_cond_resched);
).
It might make sense to define it there (in the sched part where it is
used) but this is out of scope here, it just confused me :)
Thanks for the pointer.

> Christophe

Sebastian

