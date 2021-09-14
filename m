Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8D40B50F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 18:39:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H88FZ45Mvz2yZ2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 02:39:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WXC4s1Fl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WXC4s1Fl; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H88Dy5sj8z2xr8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 02:38:58 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F970610A6;
 Tue, 14 Sep 2021 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631637536;
 bh=uvMVvjps/EzMsz0e/xHGQpDS9hZhJdVg3N7lAeNdyBs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WXC4s1Flpimwz39El5q5+N6oUFi6W3Ber0xZF7Sd1TJdvRVCyFdn+oXvHkpQM8W05
 Z77ubk8ByH+yjXJvcmOLTpUrbCKbs2PtX7amk8zOruo8S3wvWdfVZLeikZx6uNyWt+
 T8UVGprTDms1n4hm8DUmA2t9kV/42PB9z6/lFkrX4DjGymOqJAy/5VhXEYFXdtbePU
 Q/BjDlnHLEaruapz9+cE6MbLdnopRIt3ueUJsHGktUKjN/obnEdxb1uPDnrIjupO3c
 nhii9mfPUHZzjwaP0zSI7vJRsWrucLwlth8VRfo6QLd1Cl20XK/5eRGlBHZct6nUhV
 PHKrmshoxVvUQ==
Subject: Re: [PATCH] powerpc: clean up UPD_CONSTR
To: Nick Desaulniers <ndesaulniers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210914161712.2463458-1-ndesaulniers@google.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <c2ebc59f-c14e-d78f-78f0-2204d09cf81c@kernel.org>
Date: Tue, 14 Sep 2021 09:38:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210914161712.2463458-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "Christopher M. Riedl" <cmr@codefail.de>,
 Paul Mackerras <paulus@samba.org>, kvm-ppc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/14/2021 9:17 AM, Nick Desaulniers wrote:
> UPD_CONSTR was previously a preprocessor define for an old GCC 4.9 inline
> asm bug with m<> constraints.
> 
> Fixes: 6563139d90ad ("powerpc: remove GCC version check for UPD_CONSTR")
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   arch/powerpc/include/asm/asm-const.h | 2 --
>   arch/powerpc/include/asm/atomic.h    | 8 ++++----
>   arch/powerpc/include/asm/io.h        | 4 ++--
>   arch/powerpc/include/asm/uaccess.h   | 6 +++---
>   arch/powerpc/kvm/powerpc.c           | 4 ++--
>   5 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/asm-const.h b/arch/powerpc/include/asm/asm-const.h
> index dbfa5e1e3198..bfb3c3534877 100644
> --- a/arch/powerpc/include/asm/asm-const.h
> +++ b/arch/powerpc/include/asm/asm-const.h
> @@ -12,6 +12,4 @@
>   #  define ASM_CONST(x)		__ASM_CONST(x)
>   #endif
>   
> -#define UPD_CONSTR "<>"
> -
>   #endif /* _ASM_POWERPC_ASM_CONST_H */
> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
> index 6a53ef178bfd..fd594fdbd84d 100644
> --- a/arch/powerpc/include/asm/atomic.h
> +++ b/arch/powerpc/include/asm/atomic.h
> @@ -27,14 +27,14 @@ static __inline__ int arch_atomic_read(const atomic_t *v)
>   {
>   	int t;
>   
> -	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m"UPD_CONSTR(v->counter));
> +	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
>   
>   	return t;
>   }
>   
>   static __inline__ void arch_atomic_set(atomic_t *v, int i)
>   {
> -	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m"UPD_CONSTR(v->counter) : "r"(i));
> +	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
>   }
>   
>   #define ATOMIC_OP(op, asm_op)						\
> @@ -320,14 +320,14 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
>   {
>   	s64 t;
>   
> -	__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m"UPD_CONSTR(v->counter));
> +	__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
>   
>   	return t;
>   }
>   
>   static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
>   {
> -	__asm__ __volatile__("std%U0%X0 %1,%0" : "=m"UPD_CONSTR(v->counter) : "r"(i));
> +	__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
>   }
>   
>   #define ATOMIC64_OP(op, asm_op)						\
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index f130783c8301..beba4979bff9 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -122,7 +122,7 @@ static inline u##size name(const volatile u##size __iomem *addr)	\
>   {									\
>   	u##size ret;							\
>   	__asm__ __volatile__("sync;"#insn"%U1%X1 %0,%1;twi 0,%0,0;isync"\
> -		: "=r" (ret) : "m"UPD_CONSTR (*addr) : "memory");	\
> +		: "=r" (ret) : "m<>" (*addr) : "memory");	\
>   	return ret;							\
>   }
>   
> @@ -130,7 +130,7 @@ static inline u##size name(const volatile u##size __iomem *addr)	\
>   static inline void name(volatile u##size __iomem *addr, u##size val)	\
>   {									\
>   	__asm__ __volatile__("sync;"#insn"%U0%X0 %1,%0"			\
> -		: "=m"UPD_CONSTR (*addr) : "r" (val) : "memory");	\
> +		: "=m<>" (*addr) : "r" (val) : "memory");	\
>   	mmiowb_set_pending();						\
>   }
>   
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 22c79ab40006..63316100080c 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -86,7 +86,7 @@ __pu_failed:							\
>   		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
>   		EX_TABLE(1b, %l2)				\
>   		:						\
> -		: "r" (x), "m"UPD_CONSTR (*addr)		\
> +		: "r" (x), "m<>" (*addr)		\
>   		:						\
>   		: label)
>   
> @@ -143,7 +143,7 @@ do {								\
>   		"1:	"op"%U1%X1 %0, %1	# get_user\n"	\
>   		EX_TABLE(1b, %l2)				\
>   		: "=r" (x)					\
> -		: "m"UPD_CONSTR (*addr)				\
> +		: "m<>" (*addr)				\
>   		:						\
>   		: label)
>   
> @@ -200,7 +200,7 @@ __gus_failed:								\
>   		".previous\n"				\
>   		EX_TABLE(1b, 3b)			\
>   		: "=r" (err), "=r" (x)			\
> -		: "m"UPD_CONSTR (*addr), "i" (-EFAULT), "0" (err))
> +		: "m<>" (*addr), "i" (-EFAULT), "0" (err))
>   
>   #ifdef __powerpc64__
>   #define __get_user_asm2(x, addr, err)			\
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index b4e6f70b97b9..3fd037d36afb 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1094,7 +1094,7 @@ static inline u64 sp_to_dp(u32 fprs)
>   
>   	preempt_disable();
>   	enable_kernel_fp();
> -	asm ("lfs%U1%X1 0,%1; stfd%U0%X0 0,%0" : "=m"UPD_CONSTR (fprd) : "m"UPD_CONSTR (fprs)
> +	asm ("lfs%U1%X1 0,%1; stfd%U0%X0 0,%0" : "=m<>" (fprd) : "m<>" (fprs)
>   	     : "fr0");
>   	preempt_enable();
>   	return fprd;
> @@ -1106,7 +1106,7 @@ static inline u32 dp_to_sp(u64 fprd)
>   
>   	preempt_disable();
>   	enable_kernel_fp();
> -	asm ("lfd%U1%X1 0,%1; stfs%U0%X0 0,%0" : "=m"UPD_CONSTR (fprs) : "m"UPD_CONSTR (fprd)
> +	asm ("lfd%U1%X1 0,%1; stfs%U0%X0 0,%0" : "=m<>" (fprs) : "m<>" (fprd)
>   	     : "fr0");
>   	preempt_enable();
>   	return fprs;
> 

