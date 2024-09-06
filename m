Return-Path: <linuxppc-dev+bounces-1100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30A96F17C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 12:30:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0XY666FZz3054;
	Fri,  6 Sep 2024 20:30:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725618602;
	cv=none; b=RJcdi449HCmQOYf3bxuOYNAkLxdJP/nAlfubwDEczCB8CmaFoCVurYL7Tzvl1SfqdjhW837jheFYyuypLa7H5I9aLRlfN+dyHEplU5P7Zx+WmVKCFJkn9MCedqdXcHH7J7CCEDUCx4cGYHM50LhJ8044Y6qudfcjw1tKYfAn8RdB/vWQ24zT5pQ1CE+GWctm+vZq3Z4ODFgkIOAuKQiZdm4lcVqn4sjUBloL03Bn+rfU7zLRkA0GkDW3fxwAIUTH9pVBQv4X9FdlR+aWejSJk9aK4Dr7N0OY0EJ2Yet/LrK5sJEGoXv3JdG/b2roX4nQC3SlWYtOPpSFqYVhGysDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725618602; c=relaxed/relaxed;
	bh=C+7VKlBLUM+gRO+v7q/DNa240NdaVdhGABTToZbBcJU=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=O4I6jU+TrePmafFZGSxLLfw0EFvycWzxjU6/9ekOJKr3ryvoO1kbPrD+TET/XH0JfLbR9AuXPvY6FWSr8qmvwn8DwQ7KF+bfqGB9cjhlcKNFmvC7EWp1pSSnLbD8DzvhoczsZ5ZkcfVqN52+GtCziZqTQ0DXO/EeeAkgH7IWW8I5A8Qt/9bGtBPwxE1+w7BuktWnLQxneis0GmRnwiOoYn2dBIpd4QEUHiL1oQewFkzn7BsblDVhEhycHmpLw5miF0ssAiWrIDgnLjJVAfVmWUkUDXYMezPZxYFhaVSehXnHK5VUjW20A3rqVey0Hn9g8AwsGpnvA/VjDV8ahSShGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QtbQzhfd; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QtbQzhfd;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0XY55V4Bz304N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 20:30:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725618601;
	bh=C+7VKlBLUM+gRO+v7q/DNa240NdaVdhGABTToZbBcJU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QtbQzhfdU9KrOkcN98cSlcIJQfPgPXyEPQ5R31cuNvxQX5Cowen108ylCMHKzzzD2
	 R1ChFXF5cJghBNCtJMq6c4AkOIO1oQXYCvfKnyT45ZxEe9mteF4mUe4fyrrzC7iF7t
	 4T1sRJHlCiwWkLOM6OmMINKchQnFOhgSe4IOKR/HcWrilvcpGklvZtAXEAk+qMEo/W
	 teZG8oLkZb+z82p3cehLGbFXCcLFLAqhC+/c8N4ObzBvWaxpbvdpyJqdh3ZnZRpn8O
	 Fjk1ehBx18I/9cJ4y82g6rW90ug3yBzlDyUamMtKkiPX8S4NRD0aqGIHWJjNN+m+6T
	 iyHNSo0bF4y6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0XY45291z4wyh;
	Fri,  6 Sep 2024 20:30:00 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Solar Designer <solar@openwall.com>, oss-security@lists.openwall.com
Cc: 2639161967 <2639161967@qq.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [oss-security] Linux kernel: memory leak in
 arch/powerpc/platforms/powernv/opal-irqchip.c: opal_event_init()
In-Reply-To: <20240902133435.GA29502@openwall.com>
References: <tencent_BB0764F9635412BA90A36B3B19EDEEF09905@qq.com>
 <20240902133435.GA29502@openwall.com>
Date: Fri, 06 Sep 2024 20:29:59 +1000
Message-ID: <87wmjp3wig.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Solar Designer <solar@openwall.com> writes:
> Hi,
>
> This bug report is misaddressed.  Per upstream's preference and common
> sense (given how many issue reports there are against the Linux kernel),
> most Linux kernel (maybe-)issues should first be reported to Linux
> kernel maintainers/lists or (if you're reasonably sure of significant
> security relevance) to the Linux kernel security team, and only then (if
> relevant) maybe also to general security lists.  Occasional exceptions
> exist, such as for publicly exploited issues, but if you're new to this
> chances are that you should play by the rules, not claim an exception.

This was also reported to security@kernel.org, and I replied saying
there was no real security impact and that it should be reported to
linuxppc-dev@lists.ozlabs.org.

> On Mon, Sep 02, 2024 at 09:54:52AM +0800, 2639161967 wrote:
>> in the newest linux release version, in&nbsp;/arch/powerpc/platforms/powernv/opal-irqchip.c&nbsp;file , the&nbsp;
>> opal_event_init function, the variable "name"defined in line 270, and is alloced memory in line 274 or 276, but not free, cause many times memory leak, and most old release versions have the problem.
>
> The code in question is:
>
> int __init opal_event_init(void)
> {
> [...]
> 	/* Install interrupt handlers */
> 	for (i = 0; i < opal_irq_count; i++) {
> 		struct resource *r = &opal_irqs[i];
> 		const char *name;
>
> 		/* Prefix name */
> 		if (r->name && strlen(r->name))
> 			name = kasprintf(GFP_KERNEL, "opal-%s", r->name);
> 		else
> 			name = kasprintf(GFP_KERNEL, "opal");
>
> 		if (!name)
> 			continue;
> 		/* Install interrupt handler */
> 		rc = request_irq(r->start, opal_interrupt, r->flags & IRQD_TRIGGER_MASK,
> 				 name, NULL);
> 		if (rc) {
> 			pr_warn("Error %d requesting OPAL irq %d\n", rc, (int)r->start);
> 			continue;
> 		}
> 	}
...
>
> I'm CC'ing this to some maintainers in case they want to add to the "if
> (rc) {" block, if only to silence static analysis tools, but other than
> that I see nothing to do on this report.

If the request_irq() fails it's either some sort of firmware
misconfiguration, or ENOMEM, both which are possibly fatal to the
machine.

But still, it would be reasonable to kfree() name in the error path, as
you say if only to keep the static analysis clean.

Thanks for looking at it and sorry for the noise on your lists.

cheers

