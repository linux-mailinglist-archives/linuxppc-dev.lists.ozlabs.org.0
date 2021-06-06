Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D639CF02
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FybP034NHz3bxk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:27:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z8LY02Dh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Z8LY02Dh; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FybNW4Bzlz3017
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:27:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FybNS4HR7z9sPf;
 Sun,  6 Jun 2021 22:27:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622982424;
 bh=VG+DE9BPeXrgkZL/Lneu3sU6RCOwUjNpIu1y6/0LsLA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Z8LY02Dhr+gm14fUfv+r3OIsnICl23XflOyskdcTZusQr/uSFREmSIb7l26SgjzKm
 H68PVnieG1xI/+2Fuzlnje8YQU5xtNVMiLXVQBGd1nJt6/rP8tWlxPfNDg++9MTnnB
 Qq7++1ns4In2YvKWiBjONrbangeBqWHbrtOov/frxdO/dgzKg0O1XInPeMvw6FXKjG
 gtQ2FpVp7P4+ZPTbdwrZJjWF8+40yImSHonpXfNbvgqxTss+GsMj+Qo0NE9PB0YI4d
 ZNMHNkNoz6ITYhpsFuBjiYZwe6z3Ai+2VHQOPTfqNB41bzJLyLVN7yiJcv4Ci7JVn+
 3QNR17hzwE7SA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v7 01/32] KVM: PPC: Book3S 64: move KVM interrupt entry
 to a common entry point
In-Reply-To: <20210528090752.3542186-2-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
 <20210528090752.3542186-2-npiggin@gmail.com>
Date: Sun, 06 Jun 2021 22:27:00 +1000
Message-ID: <87im2rfaaz.fsf@mpe.ellerman.id.au>
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
Cc: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Rather than bifurcate the call depending on whether or not HV is
> possible, and have the HV entry test for PR, just make a single
> common point which does the demultiplexing. This makes it simpler
> to add another type of exit handler.
>
> Acked-by: Paul Mackerras <paulus@ozlabs.org>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S    |  8 +-----
>  arch/powerpc/kvm/Makefile               |  3 +++
>  arch/powerpc/kvm/book3s_64_entry.S      | 36 +++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 11 ++------
>  4 files changed, 42 insertions(+), 16 deletions(-)
>  create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index fa8e52a0239e..868077f7a96f 100644
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

Further we down we have:

obj-y += $(kvm-book3s_64-builtin-objs-y)


Which means book3s_64_entry.S ends up getting built for BOOKE, which
breaks.

I think instead we want to add it to the preceding entry, eg:

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 91eb67bb91e1..ab241317481c 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -57,11 +57,9 @@ kvm-pr-y := \
 	book3s_32_mmu.o
 
 kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
+	book3s_64_entry.o \
 	tm.o
 
-kvm-book3s_64-builtin-objs-y += \
-	book3s_64_entry.o
-
 ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	book3s_rmhandlers.o


cheers
