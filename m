Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272D4C3D25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 05:29:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4cHH2WJQz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 15:29:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QDYtR8Nl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=dinguyen@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QDYtR8Nl; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4cGf5yTQz2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 15:28:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2283161879;
 Fri, 25 Feb 2022 04:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905E7C340E8;
 Fri, 25 Feb 2022 04:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763320;
 bh=7SThN/utKX/p0lzUCmG6ocQvEAx3lLFOHF56GsXqmkg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QDYtR8NlrGKuoQjmYA8kyhZOE9M5T1r29vrwrzKtqeW8ZEboLFyE9tpTLIHZrIsc2
 nruqaf44dOGvL9m0YF8yy/0GnP7bjsDnUbUqIRzmMJPfXE0DXeAhxVhfed4IaeshxM
 3dBB3rRybvVICiYVW2EwE6UiyRp2P0hHIB0n0MePLyot8SwYrU2i+wAnXsNlJLOQZg
 JdbB1DfWOrhGY/Jb/JrlNhbdzjO74CuLFiFEukShPqlCb0VjpFFv/dEFsnilhkTnnf
 /2HYT2lkEsKGxWybS9oRJ8pGnuvkqQGXNVQBnHCXm5s98tF2QqOVujOWC0O/sTxEOf
 zPy8zKCde1DGg==
Message-ID: <f6c34635-533f-8b63-b27b-15835b93e6d4@kernel.org>
Date: Thu, 24 Feb 2022 22:28:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/18] uaccess: fix nios2 and microblaze get_user_8()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-3-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@redhat.com, geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, shorne@gmail.com,
 monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, linux-mips@vger.kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/16/22 07:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These two architectures implement 8-byte get_user() through
> a memcpy() into a four-byte variable, which won't fit.
> 
> Use a temporary 64-bit variable instead here, and use a double
> cast the way that risc-v and openrisc do to avoid compile-time
> warnings.
> 
> Fixes: 6a090e97972d ("arch/microblaze: support get_user() of size 8 bytes")
> Fixes: 5ccc6af5e88e ("nios2: Memory management")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/microblaze/include/asm/uaccess.h | 18 +++++++++---------
>   arch/nios2/include/asm/uaccess.h      | 26 ++++++++++++++++----------
>   2 files changed, 25 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/microblaze/include/asm/uaccess.h b/arch/microblaze/include/asm/uaccess.h
> index 5b6e0e7788f4..3fe96979d2c6 100644
> --- a/arch/microblaze/include/asm/uaccess.h
> +++ b/arch/microblaze/include/asm/uaccess.h
> @@ -130,27 +130,27 @@ extern long __user_bad(void);
>   
>   #define __get_user(x, ptr)						\
>   ({									\
> -	unsigned long __gu_val = 0;					\
>   	long __gu_err;							\
>   	switch (sizeof(*(ptr))) {					\
>   	case 1:								\
> -		__get_user_asm("lbu", (ptr), __gu_val, __gu_err);	\
> +		__get_user_asm("lbu", (ptr), x, __gu_err);		\
>   		break;							\
>   	case 2:								\
> -		__get_user_asm("lhu", (ptr), __gu_val, __gu_err);	\
> +		__get_user_asm("lhu", (ptr), x, __gu_err);		\
>   		break;							\
>   	case 4:								\
> -		__get_user_asm("lw", (ptr), __gu_val, __gu_err);	\
> +		__get_user_asm("lw", (ptr), x, __gu_err);		\
>   		break;							\
> -	case 8:								\
> -		__gu_err = __copy_from_user(&__gu_val, ptr, 8);		\
> -		if (__gu_err)						\
> -			__gu_err = -EFAULT;				\
> +	case 8: {							\
> +		__u64 __x = 0;						\
> +		__gu_err = raw_copy_from_user(&__x, ptr, 8) ?		\
> +							-EFAULT : 0;	\
> +		(x) = (typeof(x))(typeof((x) - (x)))__x;		\
>   		break;							\
> +	}								\
>   	default:							\
>   		/* __gu_val = 0; __gu_err = -EINVAL;*/ __gu_err = __user_bad();\
>   	}								\
> -	x = (__force __typeof__(*(ptr))) __gu_val;			\
>   	__gu_err;							\
>   })
>   
> diff --git a/arch/nios2/include/asm/uaccess.h b/arch/nios2/include/asm/uaccess.h
> index ba9340e96fd4..ca9285a915ef 100644
> --- a/arch/nios2/include/asm/uaccess.h
> +++ b/arch/nios2/include/asm/uaccess.h
> @@ -88,6 +88,7 @@ extern __must_check long strnlen_user(const char __user *s, long n);
>   /* Optimized macros */
>   #define __get_user_asm(val, insn, addr, err)				\
>   {									\
> +	unsigned long __gu_val;						\
>   	__asm__ __volatile__(						\
>   	"       movi    %0, %3\n"					\
>   	"1:   " insn " %1, 0(%2)\n"					\
> @@ -96,14 +97,20 @@ extern __must_check long strnlen_user(const char __user *s, long n);
>   	"       .section __ex_table,\"a\"\n"				\
>   	"       .word 1b, 2b\n"						\
>   	"       .previous"						\
> -	: "=&r" (err), "=r" (val)					\
> +	: "=&r" (err), "=r" (__gu_val)					\
>   	: "r" (addr), "i" (-EFAULT));					\
> +	val = (__force __typeof__(*(addr)))__gu_val;			\
>   }
>   
> -#define __get_user_unknown(val, size, ptr, err) do {			\
> +extern void __get_user_unknown(void);
> +
> +#define __get_user_8(val, ptr, err) do {				\
> +	u64 __val = 0;							\
>   	err = 0;							\
> -	if (__copy_from_user(&(val), ptr, size)) {			\
> +	if (raw_copy_from_user(&(__val), ptr, sizeof(val))) {		\
>   		err = -EFAULT;						\
> +	} else {							\
> +		val = (typeof(val))(typeof((val) - (val)))__val;	\
>   	}								\
>   	} while (0)
>   
> @@ -119,8 +126,11 @@ do {									\
>   	case 4:								\
>   		__get_user_asm(val, "ldw", ptr, err);			\
>   		break;							\
> +	case 8:								\
> +		__get_user_8(val, ptr, err);				\
> +		break;							\
>   	default:							\
> -		__get_user_unknown(val, size, ptr, err);		\
> +		__get_user_unknown();					\
>   		break;							\
>   	}								\
>   } while (0)
> @@ -129,9 +139,7 @@ do {									\
>   	({								\
>   	long __gu_err = -EFAULT;					\
>   	const __typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
> -	unsigned long __gu_val = 0;					\
> -	__get_user_common(__gu_val, sizeof(*(ptr)), __gu_ptr, __gu_err);\
> -	(x) = (__force __typeof__(x))__gu_val;				\
> +	__get_user_common(x, sizeof(*(ptr)), __gu_ptr, __gu_err);	\
>   	__gu_err;							\
>   	})
>   
> @@ -139,11 +147,9 @@ do {									\
>   ({									\
>   	long __gu_err = -EFAULT;					\
>   	const __typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
> -	unsigned long __gu_val = 0;					\
>   	if (access_ok( __gu_ptr, sizeof(*__gu_ptr)))	\
> -		__get_user_common(__gu_val, sizeof(*__gu_ptr),		\
> +		__get_user_common(x, sizeof(*__gu_ptr),			\
>   			__gu_ptr, __gu_err);				\
> -	(x) = (__force __typeof__(x))__gu_val;				\
>   	__gu_err;							\
>   })
>   

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
