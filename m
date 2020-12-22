Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 129402E04E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 04:54:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0MsY1znJzDqRn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:54:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NYCj3A29; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0Mqz2mp5zDqPl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 14:53:00 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id x18so6740431pln.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6mHeOvsC1/VfoipE1phAyx1MUAsm4LKcmk+PFkZbut8=;
 b=NYCj3A29szm82n3mdSoF5YgByunLd7CVq2C2Q+NNW4xFWFWhrTwagOakOJk18+/qtZ
 fUETa9ybyUUJYDr7K9BBjPoRKj3GdWfiy+ckAA/hT1figu7SahGBYETSnyxzBxreNpGm
 51cxdJrPmHIzGLEVepkS2LaGSPl8wp/J2ZFSRZ0a0sKKcFn9SVCaAsrW1Y8j+LKY1jNj
 4xQSSCOKWpxWZ0qLr0qZT1Q9bfYVxRwRqHHUvxpWGnJqVLbZfNWQezfYCEZdb+IUwFJ2
 6Eb6xfVi/BzRbdQnBcsuszRa9YUOk8cNi9VG/+ZhFuvlS3Mb9rOsYnZ7ISjDQIIH0Bje
 4eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6mHeOvsC1/VfoipE1phAyx1MUAsm4LKcmk+PFkZbut8=;
 b=E/x3trt6IbimWtnYeHoWgPt2ieoDEzsmyNdDcxLQZ2rtQJhr5iBd++942APPnvcfZI
 +DBot+/8KRteQWj5BZ8urh0gCbs8egdEEMHotF+Dmzxyhu8qJGmfi2dViu4vGiVDQbS+
 cJbbidMObKvAOf9KvOM1fWl0f/d5Q7r3g/xZhdv8KJUKMxPAxBMYusBGYGkupeh9KJ5y
 HQc7i06pk91qZHbA8OaAbKwHWfaQVwjT5WwLgQz5HTdnnuydh5lbI0rKn8o1r/ePggih
 k1oPMncTk8OtiJXF5c3dCSPqnJUFPgvoFPxNOzpUTe532BsFLSQZGY2TjENAaegTJ+lS
 k/JQ==
X-Gm-Message-State: AOAM5332r1YDkeZ6vfN293pr/6VFZ9MuoC+xAdy5J/veAjwyfO9hvKBz
 JCgwdQ3cxSI9yHZO5hGVKh8=
X-Google-Smtp-Source: ABdhPJy5PqNQLS6C4x0e0+J1D43tyYjaUch/mM5pT/E1eKvMQGs9SjLQ1Na0Da6umudMBdS7DRerYg==
X-Received: by 2002:a17:902:ab8b:b029:da:f377:e7d7 with SMTP id
 f11-20020a170902ab8bb02900daf377e7d7mr19403296plr.4.1608609177185; 
 Mon, 21 Dec 2020 19:52:57 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id s1sm18316617pjk.1.2020.12.21.19.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 19:52:56 -0800 (PST)
Date: Tue, 22 Dec 2020 13:52:50 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc: rewrite atomics to use ARCH_ATOMIC
To: Boqun Feng <boqun.feng@gmail.com>
References: <20201111110723.3148665-1-npiggin@gmail.com>
 <20201111110723.3148665-4-npiggin@gmail.com>
 <20201113153012.GD286534@boqun-archlinux>
In-Reply-To: <20201113153012.GD286534@boqun-archlinux>
MIME-Version: 1.0
Message-Id: <1608608903.7wgw6zmbi8.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Boqun Feng's message of November 14, 2020 1:30 am:
> Hi Nicholas,
>=20
> On Wed, Nov 11, 2020 at 09:07:23PM +1000, Nicholas Piggin wrote:
>> All the cool kids are doing it.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/atomic.h  | 681 ++++++++++-------------------
>>  arch/powerpc/include/asm/cmpxchg.h |  62 +--
>>  2 files changed, 248 insertions(+), 495 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/as=
m/atomic.h
>> index 8a55eb8cc97b..899aa2403ba7 100644
>> --- a/arch/powerpc/include/asm/atomic.h
>> +++ b/arch/powerpc/include/asm/atomic.h
>> @@ -11,185 +11,285 @@
>>  #include <asm/cmpxchg.h>
>>  #include <asm/barrier.h>
>> =20
>> +#define ARCH_ATOMIC
>> +
>> +#ifndef CONFIG_64BIT
>> +#include <asm-generic/atomic64.h>
>> +#endif
>> +
>>  /*
>>   * Since *_return_relaxed and {cmp}xchg_relaxed are implemented with
>>   * a "bne-" instruction at the end, so an isync is enough as a acquire =
barrier
>>   * on the platform without lwsync.
>>   */
>>  #define __atomic_acquire_fence()					\
>> -	__asm__ __volatile__(PPC_ACQUIRE_BARRIER "" : : : "memory")
>> +	asm volatile(PPC_ACQUIRE_BARRIER "" : : : "memory")
>> =20
>>  #define __atomic_release_fence()					\
>> -	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
>> +	asm volatile(PPC_RELEASE_BARRIER "" : : : "memory")
>> =20
>> -static __inline__ int atomic_read(const atomic_t *v)
>> -{
>> -	int t;
>> +#define __atomic_pre_full_fence		smp_mb
>> =20
>> -	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=3Dr"(t) : "m"(v->counter));
>> +#define __atomic_post_full_fence	smp_mb
>> =20

Thanks for the review.

> Do you need to define __atomic_{pre,post}_full_fence for PPC? IIRC, they
> are default smp_mb__{before,atomic}_atomic(), so are smp_mb() defautly
> on PPC.

Okay I didn't realise that's not required.

>> -	return t;
>> +#define arch_atomic_read(v)			__READ_ONCE((v)->counter)
>> +#define arch_atomic_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
>> +#ifdef CONFIG_64BIT
>> +#define ATOMIC64_INIT(i)			{ (i) }
>> +#define arch_atomic64_read(v)			__READ_ONCE((v)->counter)
>> +#define arch_atomic64_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
>> +#endif
>> +
> [...]
>> =20
>> +#define ATOMIC_FETCH_OP_UNLESS_RELAXED(name, type, dtype, width, asm_op=
) \
>> +static inline int arch_##name##_relaxed(type *v, dtype a, dtype u)	\
>=20
> I don't think we have atomic_fetch_*_unless_relaxed() at atomic APIs,
> ditto for:
>=20
> 	atomic_fetch_add_unless_relaxed()
> 	atomic_inc_not_zero_relaxed()
> 	atomic_dec_if_positive_relaxed()
>=20
> , and we don't have the _acquire() and _release() variants for them
> either, and if you don't define their fully-ordered version (e.g.
> atomic_inc_not_zero()), atomic-arch-fallback.h will use read and cmpxchg
> to implement them, and I think not what we want.

Okay. How can those be added? The atoimc generation is pretty=20
complicated.

> [...]
>> =20
>>  #endif /* __KERNEL__ */
>>  #endif /* _ASM_POWERPC_ATOMIC_H_ */
>> diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/a=
sm/cmpxchg.h
>> index cf091c4c22e5..181f7e8b3281 100644
>> --- a/arch/powerpc/include/asm/cmpxchg.h
>> +++ b/arch/powerpc/include/asm/cmpxchg.h
>> @@ -192,7 +192,7 @@ __xchg_relaxed(void *ptr, unsigned long x, unsigned =
int size)
>>       		(unsigned long)_x_, sizeof(*(ptr))); 			     \
>>    })
>> =20
>> -#define xchg_relaxed(ptr, x)						\
>> +#define arch_xchg_relaxed(ptr, x)					\
>>  ({									\
>>  	__typeof__(*(ptr)) _x_ =3D (x);					\
>>  	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
>> @@ -448,35 +448,7 @@ __cmpxchg_relaxed(void *ptr, unsigned long old, uns=
igned long new,
>>  	return old;
>>  }
>> =20
>> -static __always_inline unsigned long
>> -__cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
>> -		  unsigned int size)
>> -{
>> -	switch (size) {
>> -	case 1:
>> -		return __cmpxchg_u8_acquire(ptr, old, new);
>> -	case 2:
>> -		return __cmpxchg_u16_acquire(ptr, old, new);
>> -	case 4:
>> -		return __cmpxchg_u32_acquire(ptr, old, new);
>> -#ifdef CONFIG_PPC64
>> -	case 8:
>> -		return __cmpxchg_u64_acquire(ptr, old, new);
>> -#endif
>> -	}
>> -	BUILD_BUG_ON_MSG(1, "Unsupported size for __cmpxchg_acquire");
>> -	return old;
>> -}
>> -#define cmpxchg(ptr, o, n)						 \
>> -  ({									 \
>> -     __typeof__(*(ptr)) _o_ =3D (o);					 \
>> -     __typeof__(*(ptr)) _n_ =3D (n);					 \
>> -     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
>> -				    (unsigned long)_n_, sizeof(*(ptr))); \
>> -  })
>> -
>> -
>=20
> If you remove {atomic_}_cmpxchg_{,_acquire}() and use the version
> provided by atomic-arch-fallback.h, then a fail cmpxchg or
> cmpxchg_acquire() will still result into a full barrier or a acquire
> barrier after the RMW operation, the barrier is not necessary and
> probably this is not what we want?

Why is that done? That seems like a very subtle difference. Shouldn't
the fallback version skip the barrier?

Thanks,
Nick
