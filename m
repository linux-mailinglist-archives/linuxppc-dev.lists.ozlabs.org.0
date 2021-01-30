Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D44843094EB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 12:36:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSXGJ4P6hzDrVW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 22:36:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSX9d2XBmzDrBk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 22:32:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ph98rtcH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DSX9c3mFLz9t1D;
 Sat, 30 Jan 2021 22:32:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612006324;
 bh=3bK9NCOYpREx5rmqh/92wGfjgXID65ju0DUBHDn3arI=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=ph98rtcHH2/ZQWDGXHInEnSZIm3bfsnbupoo3zW9aMGiO0FwOCRVs2FhyGHEJnpE2
 DsQE+xIwTRhK0sggPmMw+Ce1yhf7OQsVlI9e+TijoOH9/AQ6nRK9kT3UIycXT7Vw4L
 cxC3p7rrYe544BUg5B2ic/++LmFnvpAm0fPJEjBzrXo6k8sYwLQ98VxUCMf4s75lkH
 hAaEldFvKMq3yBhDIvLuLgujPNum1PADifrUaJvhceuMFyrJQ5zvp7j/X/byr3Mkge
 Crq/X8ycHc5TkTTJzEFr28vo3lmf8AX1+bQWU1fFzKReu1kSz+kDocFf1s/zfS1qiH
 2i4SkJ4VOwusA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc64/idle: Fix SP offsets when saving GPRs
In-Reply-To: <20210130030430.11369-1-cmr@codefail.de>
References: <20210130030430.11369-1-cmr@codefail.de>
Date: Sat, 30 Jan 2021 22:32:03 +1100
Message-ID: <87o8h6d5jg.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Christopher M. Riedl" <cmr@codefail.de> writes:
> The idle entry/exit code saves/restores GPRs in the stack "red zone"
> (Protected Zone according to PowerPC64 ELF ABI v2). However, the offset
> used for the first GPR is incorrect and overwrites the back chain - the
> Protected Zone actually starts below the current SP. In practice this is
> probably not an issue, but it's still incorrect so fix it.

Nice catch.

Corrupting the back chain means you can't backtrace from there, which
could be confusing for debugging one day.

It does make me wonder why we don't just create a stack frame and use
the normal macros? It would use a bit more stack space, but we shouldn't
be short of stack space when going idle.

Nick, was there a particular reason for using the red zone?

cheers


> diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
> index 22f249b6f58d..80cf35183e9d 100644
> --- a/arch/powerpc/kernel/idle_book3s.S
> +++ b/arch/powerpc/kernel/idle_book3s.S
> @@ -53,27 +53,27 @@ _GLOBAL(isa300_idle_stop_mayloss)
>  	mflr	r4
>  	mfcr	r5
>  	/* use stack red zone rather than a new frame for saving regs */
> -	std	r2,-8*0(r1)
> -	std	r14,-8*1(r1)
> -	std	r15,-8*2(r1)
> -	std	r16,-8*3(r1)
> -	std	r17,-8*4(r1)
> -	std	r18,-8*5(r1)
> -	std	r19,-8*6(r1)
> -	std	r20,-8*7(r1)
> -	std	r21,-8*8(r1)
> -	std	r22,-8*9(r1)
> -	std	r23,-8*10(r1)
> -	std	r24,-8*11(r1)
> -	std	r25,-8*12(r1)
> -	std	r26,-8*13(r1)
> -	std	r27,-8*14(r1)
> -	std	r28,-8*15(r1)
> -	std	r29,-8*16(r1)
> -	std	r30,-8*17(r1)
> -	std	r31,-8*18(r1)
> -	std	r4,-8*19(r1)
> -	std	r5,-8*20(r1)
> +	std	r2,-8*1(r1)
> +	std	r14,-8*2(r1)
> +	std	r15,-8*3(r1)
> +	std	r16,-8*4(r1)
> +	std	r17,-8*5(r1)
> +	std	r18,-8*6(r1)
> +	std	r19,-8*7(r1)
> +	std	r20,-8*8(r1)
> +	std	r21,-8*9(r1)
> +	std	r22,-8*10(r1)
> +	std	r23,-8*11(r1)
> +	std	r24,-8*12(r1)
> +	std	r25,-8*13(r1)
> +	std	r26,-8*14(r1)
> +	std	r27,-8*15(r1)
> +	std	r28,-8*16(r1)
> +	std	r29,-8*17(r1)
> +	std	r30,-8*18(r1)
> +	std	r31,-8*19(r1)
> +	std	r4,-8*20(r1)
> +	std	r5,-8*21(r1)
>  	/* 168 bytes */
>  	PPC_STOP
>  	b	.	/* catch bugs */
> @@ -89,8 +89,8 @@ _GLOBAL(isa300_idle_stop_mayloss)
>   */
>  _GLOBAL(idle_return_gpr_loss)
>  	ld	r1,PACAR1(r13)
> -	ld	r4,-8*19(r1)
> -	ld	r5,-8*20(r1)
> +	ld	r4,-8*20(r1)
> +	ld	r5,-8*21(r1)
>  	mtlr	r4
>  	mtcr	r5
>  	/*
> @@ -98,25 +98,25 @@ _GLOBAL(idle_return_gpr_loss)
>  	 * from PACATOC. This could be avoided for that less common case
>  	 * if KVM saved its r2.
>  	 */
> -	ld	r2,-8*0(r1)
> -	ld	r14,-8*1(r1)
> -	ld	r15,-8*2(r1)
> -	ld	r16,-8*3(r1)
> -	ld	r17,-8*4(r1)
> -	ld	r18,-8*5(r1)
> -	ld	r19,-8*6(r1)
> -	ld	r20,-8*7(r1)
> -	ld	r21,-8*8(r1)
> -	ld	r22,-8*9(r1)
> -	ld	r23,-8*10(r1)
> -	ld	r24,-8*11(r1)
> -	ld	r25,-8*12(r1)
> -	ld	r26,-8*13(r1)
> -	ld	r27,-8*14(r1)
> -	ld	r28,-8*15(r1)
> -	ld	r29,-8*16(r1)
> -	ld	r30,-8*17(r1)
> -	ld	r31,-8*18(r1)
> +	ld	r2,-8*1(r1)
> +	ld	r14,-8*2(r1)
> +	ld	r15,-8*3(r1)
> +	ld	r16,-8*4(r1)
> +	ld	r17,-8*5(r1)
> +	ld	r18,-8*6(r1)
> +	ld	r19,-8*7(r1)
> +	ld	r20,-8*8(r1)
> +	ld	r21,-8*9(r1)
> +	ld	r22,-8*10(r1)
> +	ld	r23,-8*11(r1)
> +	ld	r24,-8*12(r1)
> +	ld	r25,-8*13(r1)
> +	ld	r26,-8*14(r1)
> +	ld	r27,-8*15(r1)
> +	ld	r28,-8*16(r1)
> +	ld	r29,-8*17(r1)
> +	ld	r30,-8*18(r1)
> +	ld	r31,-8*19(r1)
>  	blr
>  
>  /*
> @@ -155,27 +155,27 @@ _GLOBAL(isa206_idle_insn_mayloss)
>  	mflr	r4
>  	mfcr	r5
>  	/* use stack red zone rather than a new frame for saving regs */
> -	std	r2,-8*0(r1)
> -	std	r14,-8*1(r1)
> -	std	r15,-8*2(r1)
> -	std	r16,-8*3(r1)
> -	std	r17,-8*4(r1)
> -	std	r18,-8*5(r1)
> -	std	r19,-8*6(r1)
> -	std	r20,-8*7(r1)
> -	std	r21,-8*8(r1)
> -	std	r22,-8*9(r1)
> -	std	r23,-8*10(r1)
> -	std	r24,-8*11(r1)
> -	std	r25,-8*12(r1)
> -	std	r26,-8*13(r1)
> -	std	r27,-8*14(r1)
> -	std	r28,-8*15(r1)
> -	std	r29,-8*16(r1)
> -	std	r30,-8*17(r1)
> -	std	r31,-8*18(r1)
> -	std	r4,-8*19(r1)
> -	std	r5,-8*20(r1)
> +	std	r2,-8*1(r1)
> +	std	r14,-8*2(r1)
> +	std	r15,-8*3(r1)
> +	std	r16,-8*4(r1)
> +	std	r17,-8*5(r1)
> +	std	r18,-8*6(r1)
> +	std	r19,-8*7(r1)
> +	std	r20,-8*8(r1)
> +	std	r21,-8*9(r1)
> +	std	r22,-8*10(r1)
> +	std	r23,-8*11(r1)
> +	std	r24,-8*12(r1)
> +	std	r25,-8*13(r1)
> +	std	r26,-8*14(r1)
> +	std	r27,-8*15(r1)
> +	std	r28,-8*16(r1)
> +	std	r29,-8*17(r1)
> +	std	r30,-8*18(r1)
> +	std	r31,-8*19(r1)
> +	std	r4,-8*20(r1)
> +	std	r5,-8*21(r1)
>  	cmpwi	r3,PNV_THREAD_NAP
>  	bne	1f
>  	IDLE_STATE_ENTER_SEQ_NORET(PPC_NAP)
> -- 
> 2.26.1
