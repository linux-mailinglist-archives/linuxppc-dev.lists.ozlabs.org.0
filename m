Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C26FA3559B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 18:53:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFDBC5FKjz3brm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 02:53:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FbSNaujC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=boqun.feng@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FbSNaujC; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFD9n32wHz2yhl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 02:53:16 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id l13so11640528qtu.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1O6341K+omlIB9wJ2hXLKkbsOLGoNgyMzo2Q8jp14ns=;
 b=FbSNaujCj4GQzt69czEYT9yzhdS82ILA0XySjA6WjU4aT1lYaj3SHxv1vX2vdur6FA
 YTPONs9m8qYw+wIijaGHll5+ej9HxKg+KQFlasntXZAtvkkwMbwniIgts8YWN+JrAH8w
 t36s62MjwnpWse52CNM+le4w4F/04vOQA3nJDDv342SOv74Z/0cWBHZ/gdXD8UNv9bpp
 BXz5kIUkEtqWteih/Slzdl0lXYk3whfXldJhCGinRXTLZRQW7X8u9XyIrFGgg8ywjhjL
 /t5bDygYdKZ/ZR3zXYOZevX0iznuq6YpLkE3K4148KcvXxeVyj5tP0mDaxzX/P41zFxB
 PxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1O6341K+omlIB9wJ2hXLKkbsOLGoNgyMzo2Q8jp14ns=;
 b=qBdZ5NfFeDDPOyit3//V4iNQAYewB3lQwF5gpl4oDGJoZg1N6FqI/V9m7SbMTo46Bg
 KhhFPm1fRZqtzLxQ+eZATIHZ2z9WcP4Qr4sQDyy1jjQOKY/TiApNtbPUmXYqUMhAYuSS
 D3exPEb2USrDj0FhAdU2wrfWlniAB1+XwKEYRWKxB5zgoaL0n8fR2XXJOS+l0SJwXtBb
 dOrNCeFzFpAEJ1fM0NCDNdJJ1VQ/2ih9cpls30YSK6Tk/BAomj4ytWW+WX9SEUrDHabq
 U5EtQf1dVmEnkNsGGzOYjrhtU8yYlWm6arCZbMhpyXZRVvezToFa2jC3Y1h2pzqUFUQ9
 S4XQ==
X-Gm-Message-State: AOAM532J+bR65tV6ZH/NENaQ4kNJeaxwx+TO+3g4/i2je2g0RgoEQKod
 8WiLKTGdR+15KUth3v3GDMA=
X-Google-Smtp-Source: ABdhPJyW4+S5F6l2W1agZlUj1gpYEr0Uf+t0W/YgCPZTn1gKNE1/+tdskKTlKeUZn69qOWB+q27VRQ==
X-Received: by 2002:ac8:48c9:: with SMTP id l9mr27015485qtr.45.1617727991808; 
 Tue, 06 Apr 2021 09:53:11 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id h9sm14206728qtk.6.2021.04.06.09.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:53:11 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailauth.nyi.internal (Postfix) with ESMTP id 7F86C27C0054;
 Tue,  6 Apr 2021 12:53:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Apr 2021 12:53:10 -0400
X-ME-Sender: <xms:9JFsYMMMB4elRpqW88wslIO0VD_ZuVTszgiLe53m6RtFpubegkKdjw>
 <xme:9JFsYE8MXi0atf2wVteuwUs_we8loq8w63R9a0MILCua2xmzVrjDONtnAkG70Nh2J
 6TEDAN_p0HEj2d89A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepieffvdeitdetheffuddugffggedvjeejieffheeltdeghfehueehteehleeg
 heffnecukfhppedufedurddutdejrddugeejrdduvdeinecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
 phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
 drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:9JFsYMq4YxOfdEdokTwtHIt8Xs3fdMVumzM05UrAuCb885zHu1qeOQ>
 <xmx:9JFsYG4f2ABAf5xcYkJq3i8ICvFbYvLRcOhmAelzMj2mqBPDUoaonQ>
 <xmx:9JFsYMMiVadePONpSxOFiYg59L0Ic8noXkJMwuZM5NpPxpf-w62L2g>
 <xmx:9pFsYLzWGz8_ImuEDqJ-UV6sD7gYKwTJ_oEj70-Phbq1gZbukxLw1hZzov7S0x96>
Received: from localhost (unknown [131.107.147.126])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F9261080066;
 Tue,  6 Apr 2021 12:53:07 -0400 (EDT)
Date: Wed, 7 Apr 2021 00:51:56 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: guoren@kernel.org
Subject: Re: [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGyRrBjomDCPOBUd@boqun-archlinux>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617201040-83905-2-git-send-email-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, Anup Patel <anup@brainfault.org>,
 sparclinux@vger.kernel.org, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Mar 31, 2021 at 02:30:32PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Some architectures don't have sub-word swap atomic instruction,
> they only have the full word's one.
> 
> The sub-word swap only improve the performance when:
> NR_CPUS < 16K
>  *  0- 7: locked byte
>  *     8: pending
>  *  9-15: not used
>  * 16-17: tail index
>  * 18-31: tail cpu (+1)
> 
> The 9-15 bits are wasted to use xchg16 in xchg_tail.
> 
> Please let architecture select xchg16/xchg32 to implement
> xchg_tail.
> 

If the architecture doesn't have sub-word swap atomic, won't it generate
the same/similar code no matter which version xchg_tail() is used? That
is even CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32=y, xchg_tail() acts
similar to an xchg16() implemented by cmpxchg(), which means we still
don't have forward progress guarantee. So this configuration doesn't
solve the problem.

I think it's OK to introduce this config and don't provide xchg16() for
risc-v. But I don't see the point of converting other architectures to
use it.

Regards,
Boqun

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Anup Patel <anup@brainfault.org>
> ---
>  kernel/Kconfig.locks       |  3 +++
>  kernel/locking/qspinlock.c | 46 +++++++++++++++++++++-----------------
>  2 files changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/kernel/Kconfig.locks b/kernel/Kconfig.locks
> index 3de8fd11873b..d02f1261f73f 100644
> --- a/kernel/Kconfig.locks
> +++ b/kernel/Kconfig.locks
> @@ -239,6 +239,9 @@ config LOCK_SPIN_ON_OWNER
>  config ARCH_USE_QUEUED_SPINLOCKS
>  	bool
>  
> +config ARCH_USE_QUEUED_SPINLOCKS_XCHG32
> +	bool
> +
>  config QUEUED_SPINLOCKS
>  	def_bool y if ARCH_USE_QUEUED_SPINLOCKS
>  	depends on SMP
> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
> index cbff6ba53d56..4bfaa969bd15 100644
> --- a/kernel/locking/qspinlock.c
> +++ b/kernel/locking/qspinlock.c
> @@ -163,26 +163,6 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
>  	WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
>  }
>  
> -/*
> - * xchg_tail - Put in the new queue tail code word & retrieve previous one
> - * @lock : Pointer to queued spinlock structure
> - * @tail : The new queue tail code word
> - * Return: The previous queue tail code word
> - *
> - * xchg(lock, tail), which heads an address dependency
> - *
> - * p,*,* -> n,*,* ; prev = xchg(lock, node)
> - */
> -static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> -{
> -	/*
> -	 * We can use relaxed semantics since the caller ensures that the
> -	 * MCS node is properly initialized before updating the tail.
> -	 */
> -	return (u32)xchg_relaxed(&lock->tail,
> -				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
> -}
> -
>  #else /* _Q_PENDING_BITS == 8 */
>  
>  /**
> @@ -206,6 +186,30 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
>  {
>  	atomic_add(-_Q_PENDING_VAL + _Q_LOCKED_VAL, &lock->val);
>  }
> +#endif /* _Q_PENDING_BITS == 8 */
> +
> +#if _Q_PENDING_BITS == 8 && !defined(CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32)
> +/*
> + * xchg_tail - Put in the new queue tail code word & retrieve previous one
> + * @lock : Pointer to queued spinlock structure
> + * @tail : The new queue tail code word
> + * Return: The previous queue tail code word
> + *
> + * xchg(lock, tail), which heads an address dependency
> + *
> + * p,*,* -> n,*,* ; prev = xchg(lock, node)
> + */
> +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> +{
> +	/*
> +	 * We can use relaxed semantics since the caller ensures that the
> +	 * MCS node is properly initialized before updating the tail.
> +	 */
> +	return (u32)xchg_relaxed(&lock->tail,
> +				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
> +}
> +
> +#else
>  
>  /**
>   * xchg_tail - Put in the new queue tail code word & retrieve previous one
> @@ -236,7 +240,7 @@ static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
>  	}
>  	return old;
>  }
> -#endif /* _Q_PENDING_BITS == 8 */
> +#endif
>  
>  /**
>   * queued_fetch_set_pending_acquire - fetch the whole lock value and set pending
> -- 
> 2.17.1
> 
