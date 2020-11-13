Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CCA2B1ED4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 16:32:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXjC170JhzDr72
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 02:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=boqun.feng@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iXs3myPm; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXj8v4mcnzDr6b
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 02:30:35 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id t191so9117936qka.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jRN0hd985rUTcBLLds2xuSjiDPNKj9RzyzM/Mhj8NMI=;
 b=iXs3myPmcsn+JNsD9rW6++x0sJAJkwPzx+KYmmbvVzyTs/hkhEQ1EYs8Xt1lD0pvzB
 e27hl/5seZ1H94hzEwZUWXBa0oWKxP2sDCMQxqRsMo0PURLHZ71na6860nyYahaTx5Dm
 OlM1mBCEtlbDt+DXSAzRNsK7RLacWQzIo+S/gKEogR73ySKGoi7G6ugJsYOwKUFEA8z3
 pUDn9c/jAxk/4UAzj0SC4/H4jVGDIIH12mxfFZJ0izijUXVsJ7Khdhhlo9Zvf9K6Z44d
 rpCkVkhY2o1Fb36rtnpIl4+MJ3lrgoRfqm8YlCN3gL/13M+B2YqUScVDiDfGb1pQApMe
 56oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jRN0hd985rUTcBLLds2xuSjiDPNKj9RzyzM/Mhj8NMI=;
 b=hITYtr+Fyn773TaWkPv6tPIUwdBk3iSvsgjTt3eGSXggCYf/7nXP6ebFAjk6I+zwjb
 regjosq4AL8XikROYvEeHCczmEfSPifF52KlPPE8ner9l8f0ExOLZkNaXeYR8S7JvC89
 OQgunVATGo2UjtDpooyIgovqKZtyyOnojdxMsqs+yTScDof8w8H867VsEje+Gyvg6fWC
 BZHrBmXK+F9/7I6G9y2NtmsirXLmq3utCoykpympcwBMhrStPUDiwOtGqAJfK2xGtC/4
 gHdt4eVj+982HGJcDYKPUy29hg4aeFr5a6IJ9evBvALy7FBPaodCFQqKIZQeNQyWgngP
 5wpw==
X-Gm-Message-State: AOAM5309szisCYSu2jncDvm6hFStfIsKCE81hg0LvtvmcI9TgKVMDUoJ
 dPN5IDRZ2wm3LS+PV64BOxA=
X-Google-Smtp-Source: ABdhPJz9IFOBRh+GQN79NayXafDuzKDzSjycL/UYvkBhej4K/KihNofuVRAU1bciSleHPD3TSVWAWA==
X-Received: by 2002:a37:8703:: with SMTP id j3mr2585373qkd.5.1605281426758;
 Fri, 13 Nov 2020 07:30:26 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id f56sm7183778qta.49.2020.11.13.07.30.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Nov 2020 07:30:25 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 6E30927C0054;
 Fri, 13 Nov 2020 10:30:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 13 Nov 2020 10:30:23 -0500
X-ME-Sender: <xms:iqauXxD7CorhV411lS0DRxUtpE6dxHigoXSXOJFN3X6Q0IETxaGs8g>
 <xme:iqauX_hh8z5oK2K4ru4sgFyVmrxdb3O4f9Oq-4dgfuVnH8-T7AHkoJLfJWf8JLXrB
 1ur8ykZK4pa-kgU-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepvdelieegudfggeevjefhjeevueevieetjeeikedvgfejfeduheefhffggedv
 geejnecukfhppedufedurddutdejrddugeejrdduvdeinecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
 phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
 drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:i6auX8nepc_qc6aTmAu8fkAIGIpWlsIMqp4Gbj785dy_z53wED4SBQ>
 <xmx:i6auX7zd92O6G5taKXavsAbxTXK6Wfn49QS_aWUBy2iYwuFAiwyVHA>
 <xmx:i6auX2QVVO-wK7rbNuV4TsYIeZUK_Igua833D-SW3axbtPcjaIaQGA>
 <xmx:j6auX5ELno9Ne22A8_qAbV0iB2xEN1c1I95ZhrmOYiQ6HGqIZ4RjNJBBVJE>
Received: from localhost (unknown [131.107.147.126])
 by mail.messagingengine.com (Postfix) with ESMTPA id B80083064AB5;
 Fri, 13 Nov 2020 10:30:18 -0500 (EST)
Date: Fri, 13 Nov 2020 23:30:12 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc: rewrite atomics to use ARCH_ATOMIC
Message-ID: <20201113153012.GD286534@boqun-archlinux>
References: <20201111110723.3148665-1-npiggin@gmail.com>
 <20201111110723.3148665-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111110723.3148665-4-npiggin@gmail.com>
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
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,

On Wed, Nov 11, 2020 at 09:07:23PM +1000, Nicholas Piggin wrote:
> All the cool kids are doing it.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/atomic.h  | 681 ++++++++++-------------------
>  arch/powerpc/include/asm/cmpxchg.h |  62 +--
>  2 files changed, 248 insertions(+), 495 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
> index 8a55eb8cc97b..899aa2403ba7 100644
> --- a/arch/powerpc/include/asm/atomic.h
> +++ b/arch/powerpc/include/asm/atomic.h
> @@ -11,185 +11,285 @@
>  #include <asm/cmpxchg.h>
>  #include <asm/barrier.h>
>  
> +#define ARCH_ATOMIC
> +
> +#ifndef CONFIG_64BIT
> +#include <asm-generic/atomic64.h>
> +#endif
> +
>  /*
>   * Since *_return_relaxed and {cmp}xchg_relaxed are implemented with
>   * a "bne-" instruction at the end, so an isync is enough as a acquire barrier
>   * on the platform without lwsync.
>   */
>  #define __atomic_acquire_fence()					\
> -	__asm__ __volatile__(PPC_ACQUIRE_BARRIER "" : : : "memory")
> +	asm volatile(PPC_ACQUIRE_BARRIER "" : : : "memory")
>  
>  #define __atomic_release_fence()					\
> -	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
> +	asm volatile(PPC_RELEASE_BARRIER "" : : : "memory")
>  
> -static __inline__ int atomic_read(const atomic_t *v)
> -{
> -	int t;
> +#define __atomic_pre_full_fence		smp_mb
>  
> -	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m"(v->counter));
> +#define __atomic_post_full_fence	smp_mb
>  

Do you need to define __atomic_{pre,post}_full_fence for PPC? IIRC, they
are default smp_mb__{before,atomic}_atomic(), so are smp_mb() defautly
on PPC.

> -	return t;
> +#define arch_atomic_read(v)			__READ_ONCE((v)->counter)
> +#define arch_atomic_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
> +#ifdef CONFIG_64BIT
> +#define ATOMIC64_INIT(i)			{ (i) }
> +#define arch_atomic64_read(v)			__READ_ONCE((v)->counter)
> +#define arch_atomic64_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
> +#endif
> +
[...]
>  
> +#define ATOMIC_FETCH_OP_UNLESS_RELAXED(name, type, dtype, width, asm_op) \
> +static inline int arch_##name##_relaxed(type *v, dtype a, dtype u)	\

I don't think we have atomic_fetch_*_unless_relaxed() at atomic APIs,
ditto for:

	atomic_fetch_add_unless_relaxed()
	atomic_inc_not_zero_relaxed()
	atomic_dec_if_positive_relaxed()

, and we don't have the _acquire() and _release() variants for them
either, and if you don't define their fully-ordered version (e.g.
atomic_inc_not_zero()), atomic-arch-fallback.h will use read and cmpxchg
to implement them, and I think not what we want.

[...]
>  
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_ATOMIC_H_ */
> diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
> index cf091c4c22e5..181f7e8b3281 100644
> --- a/arch/powerpc/include/asm/cmpxchg.h
> +++ b/arch/powerpc/include/asm/cmpxchg.h
> @@ -192,7 +192,7 @@ __xchg_relaxed(void *ptr, unsigned long x, unsigned int size)
>       		(unsigned long)_x_, sizeof(*(ptr))); 			     \
>    })
>  
> -#define xchg_relaxed(ptr, x)						\
> +#define arch_xchg_relaxed(ptr, x)					\
>  ({									\
>  	__typeof__(*(ptr)) _x_ = (x);					\
>  	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
> @@ -448,35 +448,7 @@ __cmpxchg_relaxed(void *ptr, unsigned long old, unsigned long new,
>  	return old;
>  }
>  
> -static __always_inline unsigned long
> -__cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
> -		  unsigned int size)
> -{
> -	switch (size) {
> -	case 1:
> -		return __cmpxchg_u8_acquire(ptr, old, new);
> -	case 2:
> -		return __cmpxchg_u16_acquire(ptr, old, new);
> -	case 4:
> -		return __cmpxchg_u32_acquire(ptr, old, new);
> -#ifdef CONFIG_PPC64
> -	case 8:
> -		return __cmpxchg_u64_acquire(ptr, old, new);
> -#endif
> -	}
> -	BUILD_BUG_ON_MSG(1, "Unsupported size for __cmpxchg_acquire");
> -	return old;
> -}
> -#define cmpxchg(ptr, o, n)						 \
> -  ({									 \
> -     __typeof__(*(ptr)) _o_ = (o);					 \
> -     __typeof__(*(ptr)) _n_ = (n);					 \
> -     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
> -				    (unsigned long)_n_, sizeof(*(ptr))); \
> -  })
> -
> -

If you remove {atomic_}_cmpxchg_{,_acquire}() and use the version
provided by atomic-arch-fallback.h, then a fail cmpxchg or
cmpxchg_acquire() will still result into a full barrier or a acquire
barrier after the RMW operation, the barrier is not necessary and
probably this is not what we want?

Regards,
Boqun

> -#define cmpxchg_local(ptr, o, n)					 \
> +#define arch_cmpxchg_local(ptr, o, n)					 \
>    ({									 \
>       __typeof__(*(ptr)) _o_ = (o);					 \
>       __typeof__(*(ptr)) _n_ = (n);					 \
> @@ -484,7 +456,7 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
>  				    (unsigned long)_n_, sizeof(*(ptr))); \
>    })
>  
> -#define cmpxchg_relaxed(ptr, o, n)					\
> +#define arch_cmpxchg_relaxed(ptr, o, n)					\
>  ({									\
>  	__typeof__(*(ptr)) _o_ = (o);					\
>  	__typeof__(*(ptr)) _n_ = (n);					\
> @@ -493,38 +465,20 @@ __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
>  			sizeof(*(ptr)));				\
>  })
>  
> -#define cmpxchg_acquire(ptr, o, n)					\
> -({									\
> -	__typeof__(*(ptr)) _o_ = (o);					\
> -	__typeof__(*(ptr)) _n_ = (n);					\
> -	(__typeof__(*(ptr))) __cmpxchg_acquire((ptr),			\
> -			(unsigned long)_o_, (unsigned long)_n_,		\
> -			sizeof(*(ptr)));				\
> -})
>  #ifdef CONFIG_PPC64
> -#define cmpxchg64(ptr, o, n)						\
> -  ({									\
> -	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
> -	cmpxchg((ptr), (o), (n));					\
> -  })
> -#define cmpxchg64_local(ptr, o, n)					\
> +#define arch_cmpxchg64_local(ptr, o, n)					\
>    ({									\
>  	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
> -	cmpxchg_local((ptr), (o), (n));					\
> +	arch_cmpxchg_local((ptr), (o), (n));				\
>    })
> -#define cmpxchg64_relaxed(ptr, o, n)					\
> -({									\
> -	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
> -	cmpxchg_relaxed((ptr), (o), (n));				\
> -})
> -#define cmpxchg64_acquire(ptr, o, n)					\
> +#define arch_cmpxchg64_relaxed(ptr, o, n)				\
>  ({									\
>  	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
> -	cmpxchg_acquire((ptr), (o), (n));				\
> +	arch_cmpxchg_relaxed((ptr), (o), (n));				\
>  })
>  #else
>  #include <asm-generic/cmpxchg-local.h>
> -#define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
> +#define arch_cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
>  #endif
>  
>  #endif /* __KERNEL__ */
> -- 
> 2.23.0
> 
