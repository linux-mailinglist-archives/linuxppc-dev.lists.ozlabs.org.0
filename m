Return-Path: <linuxppc-dev+bounces-5790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8E0A25F68
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 17:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ymrp16pYqz2xsW;
	Tue,  4 Feb 2025 03:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738598473;
	cv=none; b=e80QCiuAolJndydqr/1qFai/jq5KXHJVvaHOI9LimxAp9qwegRIWOdGGYmNmrT11BUkcp7MXvKmzu9iD9cz6UwbBKSZrqJ5BcKjojs38l2GpcYyZY/4jqHQYBTpPm8sP5kMgip3+Laj2YblKFRRHqDIVgLhdVicn4yWmQ5Slhtg75eFTBzmjRr4/4TkIU4LkxVYfIsQplDhWG5asGmKuny2uMErm1AbE6AwdDwXinJtGBdQJpXC3XDe8R5pl7Lb0BR9s5ghI7krNwibi2QY288f00vM5slxpu9dYehMb2Kyquf9+QpUk6QJ/ibIcyP0LH22m+kKJPYl08N2t6rHp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738598473; c=relaxed/relaxed;
	bh=avDciMr/EFBEDxlRSPXIiSAyoliNJHuMQZ86rj/N8zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Td+SthQ9QqCHDzyu4pkUhX4Ev11HDJoIMCNMMrP9ThbVOMc88E1BoU32+/E3boUfLW7MkDAMIRe1l2tAvkEsTRXd/JPhoJwtJ+1nKpPQctgqfi7Uwhb2FB40KhJlqjAClK7Oq7MUYDOL8lGgh6MnOb3lZ91DH8ylv7FbEfmKn7zchMPg0+IaS4tVUo5Aziu0BXlySr+DNGzRlve9GthpOeHbrvqo3qDAr3XlJzv9tbPMFobYXrm8bIPnee7W+vX3WxiLqinjxOl0uCMaLPQAJp9WRfsG3kLC+aVku6IFK+QeMyMfjeN9S/borLpmM3jizh88CWqlXmN3N+vH6I9UdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xGuLoozb; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XRtrY5YO; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xGuLoozb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XRtrY5YO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ymrnz3mjpz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 03:01:11 +1100 (AEDT)
Date: Mon, 3 Feb 2025 17:01:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738598465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avDciMr/EFBEDxlRSPXIiSAyoliNJHuMQZ86rj/N8zw=;
	b=xGuLoozbF4KHQ3PON6wkF9IECWn19hd4RkIVYP4jhCwHEMfVSctwTZblRviSE/w91BBFp3
	Ozi3YOoiouoUhH8Fd1Mz6HRETW8SaAAmPGpbedvuvJAgWSgORmxvY0WHi0WDFWf7xowFej
	kE/gwSPTcSJa6bFSOUjRlEXOgn9vg2ZkmTCWcvWzNo0uoIXPdvuRXAhQ5MnTjkSBekoDbI
	jYy+L5dq1F2f2Cze6AUE4Y1ItGE7tWgy1Uzfi6vrCnDCLQLdtJkDVRvNfqRq2HIm+96+2w
	9MEdk/e77irY2rLQqjXO+XA+lU+TYfz+670UrH7h10FC2hkhceBgvV8pW8GUFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738598465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avDciMr/EFBEDxlRSPXIiSAyoliNJHuMQZ86rj/N8zw=;
	b=XRtrY5YOugetpsTxeoYN5FcxzEoVQBmvYjstq9XGiVkR5vcsRa1yOoUJWrflh/S8hVOLVI
	IN05R/ArjKk5MUDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 5/9] powerpc: Use preempt_model_str().
Message-ID: <20250203160103.9DikC9FJ@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
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
In-Reply-To: <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-02-03 16:19:06 [+0100], Christophe Leroy wrote:
>=20
>=20
> Le 03/02/2025 =C3=A0 15:16, Sebastian Andrzej Siewior a =C3=A9crit=C2=A0:
> > Use preempt_model_str() instead of manually conducting the preemption
> > model. Use pr_emerg() instead of printk() to pass a loglevel.
>=20
> Why use pr_emerg() for that line and not all other ones ?

checkpatch complained for the current printk() line and this looks like
an emergency coming from die().

> The purpose of using printk() is to get it at the level defined by
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT and I think it is important to have the f=
ull
> Oops block at the same level.

Okay. So "printk(KERN_DEFAULT " then.

Sebastian

