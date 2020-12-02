Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DDC2CBDA5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 14:03:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmJzg5x49zDqSY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 00:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmJv92JthzDqhY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 23:59:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KK1gADI1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmJv85V5lz9s1l;
 Wed,  2 Dec 2020 23:59:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606913940;
 bh=NPopVYHSr/Yb3G9AtHOIa0oreXZoz6IHvAXlRk2Vbus=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KK1gADI1qlmBscjh8CgK+2na7zrF7Y0P9mjpQU+IFyWi11rzH7Bi9erK4tAwlchLU
 k7X04pPI0yIpquinU0G9FkI00XCFe0T6rCQUtNnAoqVCxntyyb0w4xxlJvUok30JO9
 Bb7IQ3CUyLVdEgLmiD4dwwOjjqKt+RmPsiqErOYpRC13+3XTmEiV9wSM5HEJjTLayr
 yM7gwcG6HhyS3kCMVuTcEf1e6xyocXGYFEyI3ZvxTa/p0ej3boygXR0SuP4WWjY68B
 kDW/BlTtDzhupAy4xUe9xzGKM8TH11Pc6foeQdcqlAcWwac5NRTjsqSUoEmjdxkFDb
 15uXeE8d4liXA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/8] KVM: PPC: Book3S HV: Ratelimit machine check messages
 coming from guests
In-Reply-To: <20201128070728.825934-5-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
 <20201128070728.825934-5-npiggin@gmail.com>
Date: Wed, 02 Dec 2020 23:58:57 +1100
Message-ID: <87360owei6.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> A number of machine check exceptions are triggerable by the guest.
> Ratelimit these to avoid a guest flooding the host console and logs.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index e3b1839fc251..c94f9595133d 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1328,8 +1328,12 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>  		r = RESUME_GUEST;
>  		break;
>  	case BOOK3S_INTERRUPT_MACHINE_CHECK:
> -		/* Print the MCE event to host console. */
> -		machine_check_print_event_info(&vcpu->arch.mce_evt, false, true);
> +		/*
> +		 * Print the MCE event to host console. Ratelimit so the guest
> +		 * can't flood the host log.
> +		 */
> +		if (printk_ratelimit())
> +			machine_check_print_event_info(&vcpu->arch.mce_evt,false, true);

You're not supposed to use printk_ratelimit(), because there's a single
rate limit state for all printks. ie. some other noisty printk() can
cause this one to never be printed.

I folded this in:

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cbbc4f0a26fe..cfaa91b27112 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1327,12 +1327,14 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	case BOOK3S_INTERRUPT_SYSTEM_RESET:
 		r = RESUME_GUEST;
 		break;
-	case BOOK3S_INTERRUPT_MACHINE_CHECK:
+	case BOOK3S_INTERRUPT_MACHINE_CHECK: {
+		static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
+					      DEFAULT_RATELIMIT_BURST);
 		/*
 		 * Print the MCE event to host console. Ratelimit so the guest
 		 * can't flood the host log.
 		 */
-		if (printk_ratelimit())
+		if (__ratelimit(&rs))
 			machine_check_print_event_info(&vcpu->arch.mce_evt,false, true);
 
 		/*
@@ -1361,6 +1363,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 
 		r = RESUME_HOST;
 		break;
+	}
 	case BOOK3S_INTERRUPT_PROGRAM:
 	{
 		ulong flags;
@@ -1520,12 +1523,16 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		r = RESUME_GUEST;
 		break;
 	case BOOK3S_INTERRUPT_MACHINE_CHECK:
+	{
+		static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
+					      DEFAULT_RATELIMIT_BURST);
 		/* Pass the machine check to the L1 guest */
 		r = RESUME_HOST;
 		/* Print the MCE event to host console. */
-		if (printk_ratelimit())
+		if (__ratelimit(&rs))
 			machine_check_print_event_info(&vcpu->arch.mce_evt, false, true);
 		break;
+	}
 	/*
 	 * We get these next two if the guest accesses a page which it thinks
 	 * it has mapped but which is not actually present, either because


cheers
