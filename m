Return-Path: <linuxppc-dev+bounces-7960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72781A9B179
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 16:49:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjzQX0kd0z3bpP;
	Fri, 25 Apr 2025 00:49:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745506180;
	cv=none; b=kLrGiRpPLpUS6AtAu5j7m0Vhgd6ZAx2oaWkvaoH8cLoiTwP/ZRl5nvYc+oqBYKIvn6KPPLlyyarkCmcghmj0XUHRdKITtMPC5mOZxnHxMo8x564s7cN0DQAU0kCS/lCRn2We0K3fwlGDcJZ2iq5bSY86pafjzT+2NyOJxZgyOxPluRP+jWg53ebLbsfDP17pKmFq4kKoDpmjT6TtE8u3q+bd2Mhdvi/a3vJm3FNeSFW5kfJr0sEUgfMM3VlBFws7TfrTEozJuCP0D2uJ94jxbO1yRquYea/GZJXNpMs0tnOnphj8bJPOGEco4VeBKc/jHMJKab0AyQskUvpxEm+mrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745506180; c=relaxed/relaxed;
	bh=d8vMlkL+lIHjasAEJl+J38/UdVO5mJgPzQD6eJm4tSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6ehukdNjaa6cZhgf9bO/uXxxGzuCUc4PEL2VqhzovylwUxYOjJuoblPRBjl+jjvd17Z1AI3BC8z8o0UM2c5e/LI+3Nx4QQtbff5NAvg3ynVM8cllq6ptulvw/1otvYmnx2bpGdBCgEIJClflgFCrOox6dmwFd7sQjx/gFjhLUeWeBrYrSJHkQWoRjpiaw3JE8V5eNcWEdjzzttxQ7yU4tvQhUIB8l0OZ//Enjiw3gl98/j07yL3KnF9tr0r4xy7wi2NrvB2+ZNEEZgR+83NxzvgpqsG8jSj00rIhSaMEWZi8Bz84P1vlE/kFMJmSairEx2xhmap74G9NKyVXUeJhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ucuaI7Wn; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yt7PjhcN; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ucuaI7Wn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yt7PjhcN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 434 seconds by postgrey-1.37 at boromir; Fri, 25 Apr 2025 00:49:38 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjzQV6B9tz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 00:49:38 +1000 (AEST)
Date: Thu, 24 Apr 2025 16:42:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745505736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8vMlkL+lIHjasAEJl+J38/UdVO5mJgPzQD6eJm4tSU=;
	b=ucuaI7Wnn0jg1oXdKKMJt8cBLvEWz+ylQEYyYb6u0Pe9XmXpSjzZmx1v4Z/3aWtd+KkvQI
	VsTJMQBzXu+h0fooHpuvjzkjvyLdoBXcz7O0o/0N1r9VtTIkqM4ja6cX6zOy/zRS21WwiF
	aJyCBzDkbKn1yZ/A9f4jrFIwmLfG0YHWo181Q/kAtCLdGBmMOE1AYX71z3Sum5djvSiWXo
	stTHfpLJafg7ZRX6V3Ej3L4qkjtFszKlQvgK+CkxbaMDvQHWwrN1RKMRy9o6kuFoGmkrGm
	EaF9FyGJvXrpIM6KRwkOHl+BwxWr6QuGnCBbdMgIUekzA1M7hXk5Y8tbU69hhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745505736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8vMlkL+lIHjasAEJl+J38/UdVO5mJgPzQD6eJm4tSU=;
	b=yt7PjhcNn9iS2ueEI9cj7dywq52hOhs96CHr8Z24A70lduz7Ic3uP4NP11zFrcciYaKiPb
	we9YIFNwx+WJfcBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
	vaibhav@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
Message-ID: <20250424144215._ooDjDz9@linutronix.de>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
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
In-Reply-To: <20250421102837.78515-2-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-21 15:58:36 [+0530], Shrikanth Hegde wrote:
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 19f4d298d..123539642 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -80,8 +80,8 @@
>  #include <asm/ultravisor.h>
>  #include <asm/dtl.h>
>  #include <asm/plpar_wrappers.h>
> -
>  #include <trace/events/ipi.h>
> +#include <linux/entry-kvm.h>
>  
>  #include "book3s.h"
>  #include "book3s_hv.h"
> @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>  	}
>  
>  	if (need_resched())
> -		cond_resched();
> +		schedule();

This looks unrelated and odd. I don't why but this should be a
cond_resched() so it can be optimized away on PREEMPT kernels.

>  	kvmppc_update_vpas(vcpu);
>  
> @@ -5097,10 +5097,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  		return -EINVAL;
>  	}
>  
> -	/* No need to go into the guest when all we'll do is come back out */
> -	if (signal_pending(current)) {
> -		run->exit_reason = KVM_EXIT_INTR;
> -		return -EINTR;
> +	/* use generic frameworks to handle signals, need_resched  */
> +	if (__xfer_to_guest_mode_work_pending()) {
> +		r = xfer_to_guest_mode_handle_work(vcpu);
This could be unconditional.

> +		if (r)
> +			return r;
>  	}
>  
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 153587741..4ff334532 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -34,6 +34,7 @@
>  #endif
>  #include <asm/ultravisor.h>
>  #include <asm/setup.h>
> +#include <linux/entry-kvm.h>
>  
>  #include "timing.h"
>  #include "../mm/mmu_decl.h"
> @@ -80,24 +81,17 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>  {
>  	int r;
>  
> +	/* use generic framework to handle need resched and signals */
> +	if (__xfer_to_guest_mode_work_pending()) {
> +		r = xfer_to_guest_mode_handle_work(vcpu);

there is nothing special you do checking and handling the work. Couldn't
you invoke xfer_to_guest_mode_handle_work() unconditionally?

> +		if (r)
> +			return r;
> +	}
> +
>  	WARN_ON(irqs_disabled());
>  	hard_irq_disable();
>  
>  	while (true) {
> -		if (need_resched()) {
> -			local_irq_enable();
> -			cond_resched();
> -			hard_irq_disable();
> -			continue;
> -		}
> -
> -		if (signal_pending(current)) {
> -			kvmppc_account_exit(vcpu, SIGNAL_EXITS);
> -			vcpu->run->exit_reason = KVM_EXIT_INTR;
> -			r = -EINTR;
> -			break;

I don't how this works but couldn't SIGNAL_EXITS vanish now that it
isn't updated anymore? The stat itself moves in kvm_handle_signal_exit()
to a different counter so it is not lost. The reader just needs to look
somewhere else for it.

> -		}
> -
>  		vcpu->mode = IN_GUEST_MODE;
>  
>  		/*

Sebastian

