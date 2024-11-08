Return-Path: <linuxppc-dev+bounces-3044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1BC9C1B1E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 11:50:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlG1t3bpKz3btc;
	Fri,  8 Nov 2024 21:50:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731063042;
	cv=none; b=hMsFFmQstujtzetmKmE9yBooE0F/Cxj1kIyMVXzr+mvGi6fjOzwYT0yrOkukCp7VSLsiYjnpCFSvvwrB2pH4ZHFezEuf7PYvu81XnY2eyMSZYd0ABWBsFK1y3uZArGM9HC+ddVmzWY5ZvgyB7nVxC8Q4Q/R5Z1WEzQV9FybGcw8p98Q9kzpMgpzWpbBMY4ETOQ1nE88vRVd0yrzvCmTlLbLFE0mpz3QGXXcBHBRX9T7v4zLoEaLlwz4m1wLMHYiOLX6ieDQLn+4NwdtwhPR4LREg0aZ4hGavnzXqlAtoeRsz73EHQdMc9Eh+9h8mSw1JqJ9OsY51UxQiRqA/ATKPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731063042; c=relaxed/relaxed;
	bh=Koc1iEA1w4wFGYBpTl7Qikrn2XNXQ1G4ZK2NeRwwRAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z85NrebQx2pmJNi/UkejC7PKfKvJNPY3C1QnLxilirsZM2g/eHVTiGPKbXOwZyd47LqRlCvLORxR0j1A92zArdpGgTXrfO/f+yXVrg/o4LW9JQ1z4HKJrVZrryIKFQv+K2+O/Tou9UNiAuZPwxrd63iRF+O7U6BmUYskAPr6i+CHXYDP27JbIbPKbTZJ826miFnBSNZww6hw8vaDm8xZmRFGA+bEI2rIR7WLywd6FE4ZjsmMg/oNsMZMKM3tmZlUotohmkTqg6lutC2ulxm5A04tXcfRH0gpcMfrY7ZixHSot7Dtce1KmJdjhzz0JHBlcsW+p5uA1TEzIDswB9lTjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xoyed2Yf; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NHWAPYiC; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xoyed2Yf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NHWAPYiC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlG1r4lGLz3btZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 21:50:40 +1100 (AEDT)
Date: Fri, 8 Nov 2024 11:50:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731063033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Koc1iEA1w4wFGYBpTl7Qikrn2XNXQ1G4ZK2NeRwwRAI=;
	b=xoyed2YfNYVDJ5GKJVKlovA5cuM+kulG8GilbbZAvHxcOLzYBbSCuajiBi3yR0e0w9OUqQ
	io2po+ZSiqVrDiUAlUzOTAxg/EJNpeoCTqijoR3D+qkkIV7rxjDtaWe+qlzOwfYxKYyuSP
	N80qtvjNzjZqgriXsbk7/HlnTNG+Vmzvj9JevhzAeA8HDqo1v0/XWpeKWv11jVCtVmcvhI
	YGVmamrQdf4KzUI/OJwYPTNXeOxlPbXQ+gb/qvXmanV8PHA0D5/UDfFeWAqLoApx8fzbjd
	uNc22AGZzGWeIIiUwpCTox/Z+EZktr4LVbBlvlsRBjIU5oxv8/xNYbUA0laCRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731063033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Koc1iEA1w4wFGYBpTl7Qikrn2XNXQ1G4ZK2NeRwwRAI=;
	b=NHWAPYiCn7XOwJKTwoWAZufc9SDEnpuvevLQ2QkyQoRHyUbkQZxqg3Sj5yPqYr69kX8d8Z
	jD7uOKpWRy7lviCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	maddy@linux.ibm.com, christophe.leroy@csgroup.eu,
	peterz@infradead.org, ankur.a.arora@oracle.com
Subject: Re: [PATCH] powerpc: Add preempt lazy support
Message-ID: <20241108105031.Uq8MV60I@linutronix.de>
References: <20241108101853.277808-1-sshegde@linux.ibm.com>
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
In-Reply-To: <20241108101853.277808-1-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-11-08 15:48:53 [+0530], Shrikanth Hegde wrote:
> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
> 16 bit range of NEED_RESCHED, so compiler can issue single andi. 
> 
> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for 
> return to kernel. 
> 
> Ran a few benchmarks and db workload on Power10. Performance is close to
> preempt=none/voluntary. It is possible that some patterns would
> differ in lazy[2]. More details of preempt lazy is here [1]
> 
> Since Powerpc system can have large core count and large memory, 
> preempt lazy is going to be helpful in avoiding soft lockup issues. 
> 
> [1]: https://lore.kernel.org/lkml/20241007074609.447006177@infradead.org/
> [2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/

The lazy bits are only in tip.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index af62ec974b97..8f4acc55407b 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -396,7 +396,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>  		/* Returning to a kernel context with local irqs enabled. */
>  		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>  again:
> -		if (IS_ENABLED(CONFIG_PREEMPT)) {
> +		if (IS_ENABLED(CONFIG_PREEMPTION)) {
>  			/* Return to preemptible kernel context */
>  			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
>  				if (preempt_count() == 0)

Shouldn't exit_vmx_usercopy() get also this
s@CONFIG_PREEMPT@CONFIG_PREEMPTION@ change ?

Sebastian

