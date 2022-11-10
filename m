Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1317662383D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:40:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N72zg69Ckz3dv6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:39:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WelCORm+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WelCORm+;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N72yn29T8z2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:39:13 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id z26so346739pff.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgGxNqczP/RDnLsEq1AhsqG1J+0AOFpRPlGR2KFMTIc=;
        b=WelCORm+PjKtrkZ4wOtA0r069C9XoNW7B7fn5m8l8lskmvB5iyN1q1t/429NhvqSeZ
         EeU7ncEcyoaZdmT4iQzQHaQfVM2U7cGg1FlleVIYaNC/rAr8ansrDDS9F21jesQuEcmp
         iiER/Y7ju2sp65ikbVDPqzK3OuLo+WktgmtSugPpsZIPIRqzuEmbIkWcJve74Isgnt9s
         tkjfBYeoIL0/IgyxhNSF0XWA20qOPAffORh7uyQFSfjRJqNXJITeJrBak9qUqslj9kco
         OhR6VdhZB2G4OSzsa2LkkhkcJjnBya8CQj7onc28FeN4nbxYrbqPxPiuUw0jnwgKVsis
         QAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgGxNqczP/RDnLsEq1AhsqG1J+0AOFpRPlGR2KFMTIc=;
        b=P414ke1CVZJPGAUyfcWiOlahOMrTrVGgowOmpG12B5gk/q4EUmy+WjwEhSLzpZ8A3+
         0H1RS6mxO5lG+T50SYsGGO3gBXYAWEN1+rG8UIvw9wfJONFEI7NQjIM645hxtGJ504iY
         wlBtEpSEdv9aTM7pwau6S1Cf8hPoeEXwkqKOV4ji5WlSfb0oNkK5cXKdAs/vi8gGYA3a
         /uYidifm8DteliB2okcGo6ZWRjcQCOh5TmJ2EKhAw2LI4I8a08UGV7mftTS0dUm815oI
         6s+Qf98TKK/K0LMyaBiup48r7bW0oHfPTEMUUpqsPMsJLGzfBWgsFyu61OPMLhtlWHE0
         0tow==
X-Gm-Message-State: ACrzQf1ZZMFUpj1GSyEsiAmse4CZXt6cK/Fng08hWPeo0Kg1L/JZkj10
	XDBECgJu5b7KUhHITWOreAk=
X-Google-Smtp-Source: AMsMyM4neglfGnriVk9Zatte7mKTyDKoUdqEXhJnvLhHikW59jvUEkKMcGP4E2QX8pl49kQCxPdzLQ==
X-Received: by 2002:aa7:9dd1:0:b0:56c:f412:6e33 with SMTP id g17-20020aa79dd1000000b0056cf4126e33mr1459383pfq.9.1668040750124;
        Wed, 09 Nov 2022 16:39:10 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id w13-20020a1709027b8d00b00186c5e8b1d0sm9616962pll.149.2022.11.09.16.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:39:09 -0800 (PST)
Message-ID: <1d25e8402e812eb4bb619359e94140d5c03fa9b1.camel@gmail.com>
Subject: Re: [PATCH 03/17] powerpc/qspinlock: use a half-word store to
 unlock to avoid larx/stcx.
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:39:06 +1100
In-Reply-To: <20220728063120.2867508-5-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-5-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
[resend as utf-8, not utf-7]
> The first 16 bits of the lock are only modified by the owner, and other
> modifications always use atomic operations on the entire 32 bits, so
> unlocks can use plain stores on the 16 bits. This is the same kind of
> optimisation done by core qspinlock code.
> ---
>  arch/powerpc/include/asm/qspinlock.h       |  6 +-----
>  arch/powerpc/include/asm/qspinlock_types.h | 19 +++++++++++++++++--
>  2 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
> index f06117aa60e1..79a1936fb68d 100644
> --- a/arch/powerpc/include/asm/qspinlock.h
> +++ b/arch/powerpc/include/asm/qspinlock.h
> @@ -38,11 +38,7 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
>  
>  static inline void queued_spin_unlock(struct qspinlock *lock)
>  {
> -	for (;;) {
> -		int val = atomic_read(&lock->val);
> -		if (atomic_cmpxchg_release(&lock->val, val, val & ~_Q_LOCKED_VAL) == val)
> -			return;
> -	}
> +	smp_store_release(&lock->locked, 0);

Is it also possible for lock_set_locked() to use a non-atomic acquire
operation?

>  }
>  
>  #define arch_spin_is_locked(l)		queued_spin_is_locked(l)
> diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
> index 9630e714c70d..3425dab42576 100644
> --- a/arch/powerpc/include/asm/qspinlock_types.h
> +++ b/arch/powerpc/include/asm/qspinlock_types.h
> @@ -3,12 +3,27 @@
>  #define _ASM_POWERPC_QSPINLOCK_TYPES_H
>  
>  #include <linux/types.h>
> +#include <asm/byteorder.h>
>  
>  typedef struct qspinlock {
> -	atomic_t val;
> +	union {
> +		atomic_t val;
> +
> +#ifdef __LITTLE_ENDIAN
> +		struct {
> +			u16	locked;
> +			u8	reserved[2];
> +		};
> +#else
> +		struct {
> +			u8	reserved[2];
> +			u16	locked;
> +		};
> +#endif
> +	};
>  } arch_spinlock_t;

Just to double check we have:

#define _Q_LOCKED_OFFSET	0
#define _Q_LOCKED_BITS		1
#define _Q_LOCKED_MASK		0x00000001
#define _Q_LOCKED_VAL		1

#define _Q_TAIL_CPU_OFFSET	16
#define _Q_TAIL_CPU_BITS	16
#define _Q_TAIL_CPU_MASK	0xffff0000


so the ordering here looks correct.

>  
> -#define	__ARCH_SPIN_LOCK_UNLOCKED	{ .val = ATOMIC_INIT(0) }
> +#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = ATOMIC_INIT(0) } }
>  
>  /*
>   * Bitfields in the atomic value:

