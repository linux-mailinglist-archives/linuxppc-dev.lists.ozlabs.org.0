Return-Path: <linuxppc-dev+bounces-13744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E8C31788
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 15:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d19Zw3Srfz3bfN;
	Wed,  5 Nov 2025 01:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762266008;
	cv=none; b=VVr+GJ2kxeWXbFTQwdjwotwZYB2B+H3NKkRraXzG+JldOuHwKgu349ZUv6k7CqLlScZ2pYFbDNvjxJttczmOt+dWrKAD1Iiw4cA+YnoQt4/1G+umhyhwBYj1w/E+jrEdcrXLoJ0ufKXT4mDFSMQc6BzSVk+aX8mkSwsA8sqxz74CmonZzGpbUm3FggTjJ5CSwuqsyNIGR0yGTcnRgRrmPBDl71qEFGCSI0q2J/gIiYGGfzWkY5mSUzlC0ZUw/EFuORsx5WuKaOWb6QzdCxTsNbMYDZPj0HnPM9L7pAL+xZSdo4Xv7JXQKFBXtFrhm3z0x8DF/xZY+TPgwmN4ggH8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762266008; c=relaxed/relaxed;
	bh=BmyOe5n7LhxjQHPirkxcZ4HFpxOXYzn2LzeHzIejkEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhwg/9yfctnn21BEMq400DOO1SL5fPWFFT/enGDDjS5QaVwrLvfkLJVnjbE/zcARk5QqHwq6C+wrt9hl5zaKcWCGJ+bSX9W07NmoAC6vT7ssHWj3L7P5SZI5PHTCdyF0ddg+Zas6L9EsFjI/LyoE5a1RZueTL7h+B1YeJnhTvBFXZ6AexEzqe/n8RFygA6EOKcCgXvA93GP1THyizAZ8Tgd4H+eH4EClsQQUWfDDUWyBkxoLTsF/lymzQdf3Q0RFWXrZokpwOonqlFCCDS0OwOovxHEmaQVH6NSP/JhXC/rGaWZI5vbKurySdNIgoLWAFWYQ8OnevXuDHK9h7eNLmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d19Zv3d0Cz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 01:20:05 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0z9m0gsPz9sSb;
	Tue,  4 Nov 2025 07:31:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzBUMEXuRcrz; Tue,  4 Nov 2025 07:31:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0z9l6gDWz9sSZ;
	Tue,  4 Nov 2025 07:31:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CCC188B76C;
	Tue,  4 Nov 2025 07:31:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GoDVNgciAAnR; Tue,  4 Nov 2025 07:31:07 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA3368B763;
	Tue,  4 Nov 2025 07:31:05 +0100 (CET)
Message-ID: <942a27d9-135a-4e59-8eff-a44c46f8bb76@csgroup.eu>
Date: Tue, 4 Nov 2025 07:31:05 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.736737934@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.736737934@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/10/2025 à 09:44, Thomas Gleixner a écrit :
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Replace the open coded implementation with the new get/put_user_inline()
> helpers. This might be replaced by a regular get/put_user(), but that needs
> a proper performance evaluation.
> 
> No functional change intended
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Davidlohr Bueso <dave@stgolabs.net>
> Cc: "André Almeida" <andrealmeid@igalia.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> V5: Rename again and remove the helpers
> V4: Rename once moar
> V3: Adapt to scope changes
> V2: Convert to scoped variant
> ---
>   kernel/futex/core.c  |    4 +--
>   kernel/futex/futex.h |   58 ++-------------------------------------------------
>   2 files changed, 5 insertions(+), 57 deletions(-)
> ---
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -581,7 +581,7 @@ int get_futex_key(u32 __user *uaddr, uns
>   	if (flags & FLAGS_NUMA) {
>   		u32 __user *naddr = (void *)uaddr + size / 2;
>   
> -		if (futex_get_value(&node, naddr))
> +		if (get_user_inline(node, naddr))
>   			return -EFAULT;
>   
>   		if ((node != FUTEX_NO_NODE) &&
> @@ -601,7 +601,7 @@ int get_futex_key(u32 __user *uaddr, uns
>   			node = numa_node_id();
>   			node_updated = true;
>   		}
> -		if (node_updated && futex_put_value(node, naddr))
> +		if (node_updated && put_user_inline(node, naddr))
>   			return -EFAULT;
>   	}
>   
> --- a/kernel/futex/futex.h
> +++ b/kernel/futex/futex.h
> @@ -281,63 +281,11 @@ static inline int futex_cmpxchg_value_lo
>   	return ret;
>   }
>   
> -/*
> - * This does a plain atomic user space read, and the user pointer has
> - * already been verified earlier by get_futex_key() to be both aligned
> - * and actually in user space, just like futex_atomic_cmpxchg_inatomic().
> - *
> - * We still want to avoid any speculation, and while __get_user() is
> - * the traditional model for this, it's actually slower than doing
> - * this manually these days.
> - *
> - * We could just have a per-architecture special function for it,
> - * the same way we do futex_atomic_cmpxchg_inatomic(), but rather
> - * than force everybody to do that, write it out long-hand using
> - * the low-level user-access infrastructure.
> - *
> - * This looks a bit overkill, but generally just results in a couple
> - * of instructions.
> - */
> -static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
> -{
> -	u32 val;
> -
> -	if (can_do_masked_user_access())
> -		from = masked_user_access_begin(from);
> -	else if (!user_read_access_begin(from, sizeof(*from)))
> -		return -EFAULT;
> -	unsafe_get_user(val, from, Efault);
> -	user_read_access_end();
> -	*dest = val;
> -	return 0;
> -Efault:
> -	user_read_access_end();
> -	return -EFAULT;
> -}
> -
> -static __always_inline int futex_put_value(u32 val, u32 __user *to)
> -{
> -	if (can_do_masked_user_access())
> -		to = masked_user_access_begin(to);
> -	else if (!user_write_access_begin(to, sizeof(*to)))
> -		return -EFAULT;
> -	unsafe_put_user(val, to, Efault);
> -	user_write_access_end();
> -	return 0;
> -Efault:
> -	user_write_access_end();
> -	return -EFAULT;
> -}
> -
> +/* Read from user memory with pagefaults disabled */
>   static inline int futex_get_value_locked(u32 *dest, u32 __user *from)
>   {
> -	int ret;
> -
> -	pagefault_disable();
> -	ret = futex_get_value(dest, from);
> -	pagefault_enable();
> -
> -	return ret;
> +	guard(pagefault)();
> +	return get_user_inline(*dest, from);
>   }
>   
>   extern void __futex_unqueue(struct futex_q *q);
> 


