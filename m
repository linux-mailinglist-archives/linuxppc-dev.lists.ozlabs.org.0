Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA2E32E0F5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 06:03:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsFxk6tYcz3dBm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:03:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=OFZ6rXHd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=OFZ6rXHd; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsFxH3023z3ckR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 16:03:14 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id b15so1139006pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 21:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=grIw8UIVqIWLDk6Bf7euU7Jj11KPFQ17JUW2JJKotmA=;
 b=OFZ6rXHd/DFOQYbEKZkR+md/6q5C799A/VSYS2y3stBzHYkBR6XLRWcKleF5V7cvg1
 WXOioysyJYwnyUcLfud6nIMdwWdyOtrFD2jKSLEQ5X+eJbBuDJiTbSZwYePtfAKw58J0
 JEhf6qM94kgpM69/03b2/JC/HzvNrl2d1BLJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=grIw8UIVqIWLDk6Bf7euU7Jj11KPFQ17JUW2JJKotmA=;
 b=uXVmV6kkAv2zz51prLroKX4DyojYIahcQjS8XgcZ1wY2y0SqmK6yZlvJJi9GqAxnN8
 BnBQ7fwCVzTJSIaI8nueceyJgZSKX3Balhshj32clluzVtTGLeCAQHh9HZKMmxpXFpBF
 9LoUh9rt1ZcZNM42vCujsKCMq+Xb/1Qtrqn9DWcTVH/Q91pLnrGbtZld0OGdJimhhoR6
 AOjj8sOYD40ml3jp3tm5kaXjwwSUbO1Ml90UTRFwG/dL3Nbzg5auID9bCx/8taGZtu+y
 AYkh9AsxMW2YVufRr3NH811c9G+wXBTJgeCvFl4Ac/s3+uAr3mzAIfrKp8J0klfM8Hs0
 WR/A==
X-Gm-Message-State: AOAM533nPJjsVyt66+d5mwF4Sj/wRqOEG2c0phtM17j1QzwWf12+54YQ
 El5jH9QcUjOKDKEO51u9UZiybLdKksFtGz0T
X-Google-Smtp-Source: ABdhPJwYqdFCG78OEDoGtYSwQF+Dd2EnMdYRgf0rwgi3SF0pS3pHXBFQEWRt8vqGd/u0UFX4k5uyLw==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id
 d12mr8591446pjw.202.1614920592590; 
 Thu, 04 Mar 2021 21:03:12 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id j20sm798446pjn.27.2021.03.04.21.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 21:03:12 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 06/37] KVM: PPC: Book3S 64: move KVM interrupt entry to
 a common entry point
In-Reply-To: <20210225134652.2127648-7-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-7-npiggin@gmail.com>
Date: Fri, 05 Mar 2021 16:03:09 +1100
Message-ID: <87r1ku8a5u.fsf@linkitivity.dja.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> Rather than bifurcate the call depending on whether or not HV is
> possible, and have the HV entry test for PR, just make a single
> common point which does the demultiplexing. This makes it simpler
> to add another type of exit handler.
>
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

I checked this against the RFC which I was happy with and there are no
changes that I am concerned about. The expanded comment is also nice.

As such:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S    |  8 +-----
>  arch/powerpc/kvm/Makefile               |  3 +++
>  arch/powerpc/kvm/book3s_64_entry.S      | 35 +++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 11 ++------
>  4 files changed, 41 insertions(+), 16 deletions(-)
>  create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 0097e0676ed7..ba13d749d203 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -208,7 +208,6 @@ do_define_int n
>  .endm
>  
>  #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
> -#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>  /*
>   * All interrupts which set HSRR registers, as well as SRESET and MCE and
>   * syscall when invoked with "sc 1" switch to MSR[HV]=1 (HVMODE) to be taken,
> @@ -238,13 +237,8 @@ do_define_int n
>  
>  /*
>   * If an interrupt is taken while a guest is running, it is immediately routed
> - * to KVM to handle. If both HV and PR KVM arepossible, KVM interrupts go first
> - * to kvmppc_interrupt_hv, which handles the PR guest case.
> + * to KVM to handle.
>   */
> -#define kvmppc_interrupt kvmppc_interrupt_hv
> -#else
> -#define kvmppc_interrupt kvmppc_interrupt_pr
> -#endif
>  
>  .macro KVMTEST name
>  	lbz	r10,HSTATE_IN_GUEST(r13)
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 2bfeaa13befb..cdd119028f64 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -59,6 +59,9 @@ kvm-pr-y := \
>  kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
>  	tm.o
>  
> +kvm-book3s_64-builtin-objs-y += \
> +	book3s_64_entry.o
> +
>  ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
>  	book3s_rmhandlers.o
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> new file mode 100644
> index 000000000000..e9a6a8fbb164
> --- /dev/null
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -0,0 +1,35 @@
> +#include <asm/asm-offsets.h>
> +#include <asm/cache.h>
> +#include <asm/kvm_asm.h>
> +#include <asm/kvm_book3s_asm.h>
> +#include <asm/ppc_asm.h>
> +#include <asm/reg.h>
> +
> +/*
> + * This is branched to from interrupt handlers in exception-64s.S which set
> + * IKVM_REAL or IKVM_VIRT, if HSTATE_IN_GUEST was found to be non-zero.
> + */
> +.global	kvmppc_interrupt
> +.balign IFETCH_ALIGN_BYTES
> +kvmppc_interrupt:
> +	/*
> +	 * Register contents:
> +	 * R12		= (guest CR << 32) | interrupt vector
> +	 * R13		= PACA
> +	 * guest R12 saved in shadow VCPU SCRATCH0
> +	 * guest R13 saved in SPRN_SCRATCH0
> +	 */
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	std	r9,HSTATE_SCRATCH2(r13)
> +	lbz	r9,HSTATE_IN_GUEST(r13)
> +	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
> +	beq	kvmppc_bad_host_intr
> +#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> +	cmpwi	r9,KVM_GUEST_MODE_GUEST
> +	ld	r9,HSTATE_SCRATCH2(r13)
> +	beq	kvmppc_interrupt_pr
> +#endif
> +	b	kvmppc_interrupt_hv
> +#else
> +	b	kvmppc_interrupt_pr
> +#endif
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 5e634db4809b..f976efb7e4a9 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1269,16 +1269,8 @@ kvmppc_interrupt_hv:
>  	 * R13		= PACA
>  	 * guest R12 saved in shadow VCPU SCRATCH0
>  	 * guest R13 saved in SPRN_SCRATCH0
> +	 * guest R9 saved in HSTATE_SCRATCH2
>  	 */
> -	std	r9, HSTATE_SCRATCH2(r13)
> -	lbz	r9, HSTATE_IN_GUEST(r13)
> -	cmpwi	r9, KVM_GUEST_MODE_HOST_HV
> -	beq	kvmppc_bad_host_intr
> -#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> -	cmpwi	r9, KVM_GUEST_MODE_GUEST
> -	ld	r9, HSTATE_SCRATCH2(r13)
> -	beq	kvmppc_interrupt_pr
> -#endif
>  	/* We're now back in the host but in guest MMU context */
>  	li	r9, KVM_GUEST_MODE_HOST_HV
>  	stb	r9, HSTATE_IN_GUEST(r13)
> @@ -3280,6 +3272,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
>   * cfar is saved in HSTATE_CFAR(r13)
>   * ppr is saved in HSTATE_PPR(r13)
>   */
> +.global kvmppc_bad_host_intr
>  kvmppc_bad_host_intr:
>  	/*
>  	 * Switch to the emergency stack, but start half-way down in
> -- 
> 2.23.0
