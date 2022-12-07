Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A1645935
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 12:47:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRwWh4k5Dz3bym
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 22:47:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gsn1e37q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRwVn1GGyz3bVf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 22:46:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gsn1e37q;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NRwVl60Gfz4xN4;
	Wed,  7 Dec 2022 22:46:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1670413615;
	bh=S+YjT48UExrzda5adY5AaltmhmcH0vh/HXnqPGGw8JY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gsn1e37qP/hsJL7zdykRPekxtQaQuAAMFZuLhk8MhxcO3jZcE6+TgIxux7Dx38XIA
	 jiPJSt0NeDxmlsFJImG+bj0Di2G4OeY1ohZ5c+4MzBfLdxSFi+vowDXab8hyvCrFsk
	 PWer91ENY8Ajcsa01IMlIhclxzEd34+3uGHOSvo2Oxh+PAsbiEhd6+t6etrV86c5KX
	 LWVQpGRHV3EfPiIjhV05Rik04yjptdaWc09/rXqc0Y2/efutkn41YyQiONRw1fsIon
	 2ywLDfgrIZZoazAkc2hO/3o0+3u7O08Se3sQjNfMDOVYrUfEwvNb6coVvDIsy5NTSH
	 1sQyiQC4XXpkA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: qspinlock: Use asm-generic definition for
 queued_spin_lock
In-Reply-To: <20221206055155.2774695-1-rmclure@linux.ibm.com>
References: <20221206055155.2774695-1-rmclure@linux.ibm.com>
Date: Wed, 07 Dec 2022 22:46:52 +1100
Message-ID: <87a63zsafn.fsf@mpe.ellerman.id.au>
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rohan McLure <rmclure@linux.ibm.com> writes:
> asm-generic/qspinlock.h provides an identical implementation of
> queued_spin_lock. Remove the variant in asm/qspinlock.h.

This code has changed recently, so this patch no longer applies.

See 9f61521c7a28 ("powerpc/qspinlock: powerpc qspinlock implementation")
in powerpc/next.

cheers


> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
> index b676c4fb90fd..bf5ba0f00258 100644
> --- a/arch/powerpc/include/asm/qspinlock.h
> +++ b/arch/powerpc/include/asm/qspinlock.h
> @@ -33,17 +33,6 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
>  extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
>  #endif
>  
> -static __always_inline void queued_spin_lock(struct qspinlock *lock)
> -{
> -	u32 val = 0;
> -
> -	if (likely(arch_atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
> -		return;
> -
> -	queued_spin_lock_slowpath(lock, val);
> -}
> -#define queued_spin_lock queued_spin_lock
> -
>  #ifdef CONFIG_PARAVIRT_SPINLOCKS
>  #define SPIN_THRESHOLD (1<<15) /* not tuned */
>  
> -- 
> 2.37.2
