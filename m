Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D42536FBD22
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:27:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhrv5BFhz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:27:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YPxHhqqE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YPxHhqqE;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhr21TLrz3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:26:58 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64115eef620so39103591b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683599215; x=1686191215;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiz6ErBfQwF9tmz+oyQkk06okhO64kndQYHsDf4RrFk=;
        b=YPxHhqqE9FdLrKPnypnacSuiMnjpc0K6pClNimeR3qrHNGguJ545jXsIwC1XIsXCL+
         6MeoHjj5w37xxJiR2wBA66cMy6r+Q7Y80NQFosOFIiEQnfcDk386+/Um0YBGvVCwBU+C
         H+N4kEjwlnALC1dzdeuMzYYKDeQM2VnaiOXeFkO+kw89w9b7De4Ngtg9irokCucHKIUh
         V8E2JsOXfl6fn/g5xagkh5rj6/58WTjg2NmiQ2VhIM/V6hIqOShTSBTwTWtBrydmN2CC
         iS2EzLyuUWCQgRUvMtycpzHFz0ZtXA7ShGoexrWlAzk4s4zP1dmwA6jt/1NoWtI6NVZj
         aAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683599215; x=1686191215;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eiz6ErBfQwF9tmz+oyQkk06okhO64kndQYHsDf4RrFk=;
        b=Pg4Ns+VLYR4rdY8zpWqTBs9v09bX6krcWpBHk9/S5Pn8TwRwxfCW9A/dth8FqGUHn8
         RO/V2WkZm8qB3QjjPLAd2XxCGcIPyRV02HYdS8Feo2jM5cNt1OClvHECd8GJodqMfvzI
         iC5+nyWexpLvLpUwvsPO3WQfh/IP0Dw+OBgEyNhFi/NW2XJvqzC8QqJKqJ0gVEOXHX0i
         J8LC+Bbx8F467eR7f92sBcqhwgeZOdc5SZksifd5f4DhdO5ezxDe/z53O7nuBiNz4KYg
         iC34LuXN5iEln1AlDQaRmKoqId3ALWmTMKoVY3DZBqGgyP0SOI5oOflTyLOUoOdI39PJ
         kq8A==
X-Gm-Message-State: AC+VfDw23wYCSNXN5VF+3Ca6HLZtJCaI81WAWYkUxCcx6zK9ebIZ6Rul
	nnu5nU2EgpMWhEt1BXAR9OSQcLptMhQ=
X-Google-Smtp-Source: ACHHUZ7oLceQhgmq01OuKFcMacOfk6l8Y2SW0FBybiyuAu3mr+4uNNSibYbRUTNERQNtMpIKoCTn8Q==
X-Received: by 2002:a17:90b:120d:b0:24d:f1b1:4bea with SMTP id gl13-20020a17090b120d00b0024df1b14beamr19522805pjb.0.1683599215247;
        Mon, 08 May 2023 19:26:55 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id p19-20020a63f453000000b005287b22ea8esm165701pgk.88.2023.05.08.19.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:26:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:26:49 +1000
Message-Id: <CSHE3ZGL9GZJ.QSN86CUY0BQ4@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 07/12] powerpc: powernv: Fix KCSAN datarace warnings on
 idle_state contention
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-8-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-8-rmclure@linux.ibm.com>
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
Cc: Rohan McLure <rmclure@ibm.com>, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> The idle_state entry in the PACA on PowerNV features a bit which is
> atomically tested and set through ldarx/stdcx. to be used as a spinlock.
> This lock then guards access to other bit fields of idle_state. KCSAN
> cannot differentiate between any of these bitfield accesses as they all
> are implemented by 8-byte store/load instructions, thus cores contending
> on the bit-lock appear to data race with modifications to idle_state.
>
> Separate the bit-lock entry from the data guarded by the lock to avoid
> the possibility of data races being detected by KCSAN.
>
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Rohan McLure <rmclure@ibm.com>
> ---
>  arch/powerpc/include/asm/paca.h       |  1 +
>  arch/powerpc/platforms/powernv/idle.c | 20 +++++++++++---------
>  2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/p=
aca.h
> index da0377f46597..cb325938766a 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -191,6 +191,7 @@ struct paca_struct {
>  #ifdef CONFIG_PPC_POWERNV
>  	/* PowerNV idle fields */
>  	/* PNV_CORE_IDLE_* bits, all siblings work on thread 0 paca */
> +	unsigned long idle_lock; /* A value of 1 means acquired */
>  	unsigned long idle_state;
>  	union {
>  		/* P7/P8 specific fields */
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platfor=
ms/powernv/idle.c
> index 841cb7f31f4f..97dbb7bc2b00 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -246,9 +246,9 @@ static inline void atomic_lock_thread_idle(void)
>  {
>  	int cpu =3D raw_smp_processor_id();
>  	int first =3D cpu_first_thread_sibling(cpu);
> -	unsigned long *state =3D &paca_ptrs[first]->idle_state;
> +	unsigned long *lock =3D &paca_ptrs[first]->idle_lock;
> =20
> -	while (unlikely(test_and_set_bit_lock(NR_PNV_CORE_IDLE_LOCK_BIT, state)=
))
> +	while (unlikely(test_and_set_bit_lock(NR_PNV_CORE_IDLE_LOCK_BIT, lock))=
)
>  		barrier();
>  }
> =20
> @@ -258,29 +258,31 @@ static inline void atomic_unlock_and_stop_thread_id=
le(void)
>  	int first =3D cpu_first_thread_sibling(cpu);
>  	unsigned long thread =3D 1UL << cpu_thread_in_core(cpu);
>  	unsigned long *state =3D &paca_ptrs[first]->idle_state;
> +	unsigned long *lock =3D &paca_ptrs[first]->idle_lock;
>  	u64 s =3D READ_ONCE(*state);
>  	u64 new, tmp;
> =20
> -	BUG_ON(!(s & PNV_CORE_IDLE_LOCK_BIT));
> +	BUG_ON(!(READ_ONCE(*lock) & PNV_CORE_IDLE_LOCK_BIT));
>  	BUG_ON(s & thread);
> =20
>  again:
> -	new =3D (s | thread) & ~PNV_CORE_IDLE_LOCK_BIT;
> +	new =3D s | thread;
>  	tmp =3D cmpxchg(state, s, new);
>  	if (unlikely(tmp !=3D s)) {
>  		s =3D tmp;
>  		goto again;
>  	}
> +	clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, lock);

Sigh, another atomic. It's in a slow path though so I won't get too
upset. Would be nice to add a comment here and revert it when KCSCAN
can be taught about this pattern though, so we don't lose it.

>  }
> =20
>  static inline void atomic_unlock_thread_idle(void)
>  {
>  	int cpu =3D raw_smp_processor_id();
>  	int first =3D cpu_first_thread_sibling(cpu);
> -	unsigned long *state =3D &paca_ptrs[first]->idle_state;
> +	unsigned long *lock =3D &paca_ptrs[first]->idle_lock;
> =20
> -	BUG_ON(!test_bit(NR_PNV_CORE_IDLE_LOCK_BIT, state));
> -	clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, state);
> +	BUG_ON(!test_bit(NR_PNV_CORE_IDLE_LOCK_BIT, lock));
> +	clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, lock);
>  }
> =20
>  /* P7 and P8 */
> @@ -380,9 +382,9 @@ static unsigned long power7_idle_insn(unsigned long t=
ype)
>  		sprs.uamor	=3D mfspr(SPRN_UAMOR);
>  	}
> =20
> -	local_paca->thread_idle_state =3D type;
> +	WRITE_ONCE(local_paca->thread_idle_state, type);
>  	srr1 =3D isa206_idle_insn_mayloss(type);		/* go idle */
> -	local_paca->thread_idle_state =3D PNV_THREAD_RUNNING;
> +	WRITE_ONCE(local_paca->thread_idle_state, PNV_THREAD_RUNNING);

Where is the thread_idle_state concurrency coming from?

Thanks,
Nick
