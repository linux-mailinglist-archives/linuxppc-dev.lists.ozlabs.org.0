Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA81951DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 08:23:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pYHP4cXhzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=B7TEcLum; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pYFm1H8XzDqcH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 18:22:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48pYFg6bkSz9txmM;
 Fri, 27 Mar 2020 08:21:59 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=B7TEcLum; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IFfcQTPQRzQ9; Fri, 27 Mar 2020 08:21:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48pYFg5N19z9txmL;
 Fri, 27 Mar 2020 08:21:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585293719; bh=bvuKDI8YlcB0/SdkE3Nlcb3nOcNO/Ia6/7Skb4ZdqnY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B7TEcLumFgaKHDO8LPwh7nC+WuzEkA3IaAkW/hLqb5p0sKH0EH4ZKkLdM4mGq+pR/
 NfhlE3+akWaM0cCcirkEbPeaenedb1OFGjNWN1MR5aEMbi7My9Zuev39eKu1y18c+J
 imTtf65Kyle6lNWWXdlPGti4szuWMEDLlvYN1ZTM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8AA718B7BC;
 Fri, 27 Mar 2020 08:22:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FbVR_QG0Y3dS; Fri, 27 Mar 2020 08:22:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC6268B756;
 Fri, 27 Mar 2020 08:21:59 +0100 (CET)
Subject: Re: [PATCH 3/4] powerpc/uaccess: evaluate macro arguments once,
 before user access is allowed
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200327070240.427074-1-npiggin@gmail.com>
 <20200327070240.427074-3-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <633fbf5b-8227-1640-f056-7e5d203895dd@c-s.fr>
Date: Fri, 27 Mar 2020 08:21:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327070240.427074-3-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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



Le 27/03/2020 à 08:02, Nicholas Piggin a écrit :
> get/put_user can be called with nontrivial arguments. fs/proc/page.c
> has a good example:
> 
>      if (put_user(stable_page_flags(ppage), out)) {
> 
> stable_page_flags is quite a lot of code, including spin locks in the
> page allocator.
> 
> Ensure these arguments are evaluated before user access is allowed.
> This improves security by reducing code with access to userspace, but
> it also fixes a PREEMPT bug with KUAP on powerpc/64s:
> stable_page_flags is currently called with AMR set to allow writes,
> it ends up calling spin_unlock(), which can call preempt_schedule. But
> the task switch code can not be called with AMR set (it relies on
> interrupts saving the register), so this blows up.
> 
> It's fine if the code inside allow_user_access is preemptible, because
> a timer or IPI will save the AMR, but it's not okay to explicitly
> cause a reschedule.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/uaccess.h | 97 ++++++++++++++++++------------
>   1 file changed, 59 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 670910df3cc7..1cf8595aeef1 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -162,36 +162,48 @@ do {								\
>   	prevent_write_to_user(ptr, size);			\
>   } while (0)
>   
> -#define __put_user_nocheck(x, ptr, size, do_allow)			\
> +#define __put_user_nocheck(x, ptr, size, do_allow)		\

No need to touch this line. Anyway at the end, you still have several \ 
which are not aligned.

>   ({								\
>   	long __pu_err;						\
>   	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
> +	__typeof__(*(ptr)) __pu_val = (x);			\
> +	__typeof__(size) __pu_size = (size);			\
> +								\
>   	if (!is_kernel_addr((unsigned long)__pu_addr))		\
>   		might_fault();					\
> -	__chk_user_ptr(ptr);					\
> -	if (do_allow)								\

No need to touch that line

> -		__put_user_size((x), __pu_addr, (size), __pu_err);		\
> -	else									\

No need to touch that line

> -		__put_user_size_allowed((x), __pu_addr, (size), __pu_err);	\
> +	__chk_user_ptr(__pu_addr);				\
> +	if (do_allow)						\
> +		__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
> +	else							\
> +		__put_user_size_allowed(__pu_val, __pu_addr, __pu_size, __pu_err); \
> +								\
>   	__pu_err;						\
>   })
>   
> -#define __put_user_check(x, ptr, size)					\
> -({									\
> -	long __pu_err = -EFAULT;					\
> -	__typeof__(*(ptr)) __user *__pu_addr = (ptr);			\
> -	might_fault();							\
> -	if (access_ok(__pu_addr, size))			\
> -		__put_user_size((x), __pu_addr, (size), __pu_err);	\
> -	__pu_err;							\

Same comment applies, you are touching some lines just to change the \, 
but at the end you still have some misaligned ones.

It would help the review not to touch unchanged lines just for that.

Same comment applies a few places below as well.

> +#define __put_user_check(x, ptr, size)				\
> +({								\
> +	long __pu_err = -EFAULT;				\
> +	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
> +	__typeof__(*(ptr)) __pu_val = (x);			\
> +	__typeof__(size) __pu_size = (size);			\
> +								\
> +	might_fault();						\
> +	if (access_ok(__pu_addr, __pu_size))			\
> +		__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
> +								\
> +	__pu_err;						\
>   })
>   
>   #define __put_user_nosleep(x, ptr, size)			\
>   ({								\
>   	long __pu_err;						\
>   	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
> -	__chk_user_ptr(ptr);					\
> -	__put_user_size((x), __pu_addr, (size), __pu_err);	\
> +	__typeof__(*(ptr)) __pu_val = (x);			\
> +	__typeof__(size) __pu_size = (size);			\
> +								\
> +	__chk_user_ptr(__pu_addr);				\
> +	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
> +								\
>   	__pu_err;						\
>   })
>   
> @@ -278,46 +290,55 @@ do {								\
>   #define __long_type(x) \
>   	__typeof__(__builtin_choose_expr(sizeof(x) > sizeof(0UL), 0ULL, 0UL))
>   
> -#define __get_user_nocheck(x, ptr, size, do_allow)			\
> +#define __get_user_nocheck(x, ptr, size, do_allow)		\
>   ({								\
>   	long __gu_err;						\
>   	__long_type(*(ptr)) __gu_val;				\
> -	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
> -	__chk_user_ptr(ptr);					\
> +	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
> +	__typeof__(size) __gu_size = (size);			\
> +								\
> +	__chk_user_ptr(__gu_addr);				\
>   	if (!is_kernel_addr((unsigned long)__gu_addr))		\
>   		might_fault();					\
>   	barrier_nospec();					\
> -	if (do_allow)								\
> -		__get_user_size(__gu_val, __gu_addr, (size), __gu_err);		\
> -	else									\
> -		__get_user_size_allowed(__gu_val, __gu_addr, (size), __gu_err);	\
> +	if (do_allow)						\
> +		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
> +	else							\
> +		__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err); \
>   	(x) = (__typeof__(*(ptr)))__gu_val;			\
> +								\
>   	__gu_err;						\
>   })
>   
> -#define __get_user_check(x, ptr, size)					\
> -({									\
> -	long __gu_err = -EFAULT;					\
> -	__long_type(*(ptr)) __gu_val = 0;				\
> +#define __get_user_check(x, ptr, size)				\
> +({								\
> +	long __gu_err = -EFAULT;				\
> +	__long_type(*(ptr)) __gu_val = 0;			\
>   	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
> -	might_fault();							\
> -	if (access_ok(__gu_addr, (size))) {		\
> -		barrier_nospec();					\
> -		__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
> -	}								\
> -	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
> -	__gu_err;							\
> +	__typeof__(size) __gu_size = (size);			\
> +								\
> +	might_fault();						\
> +	if (access_ok(__gu_addr, __gu_size)) {			\
> +		barrier_nospec();				\
> +		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
> +	}							\
> +	(x) = (__force __typeof__(*(ptr)))__gu_val;		\
> +								\
> +	__gu_err;						\
>   })
>   
>   #define __get_user_nosleep(x, ptr, size)			\
>   ({								\
>   	long __gu_err;						\
>   	__long_type(*(ptr)) __gu_val;				\
> -	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
> -	__chk_user_ptr(ptr);					\
> +	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
> +	__typeof__(size) __gu_size = (size);			\
> +								\
> +	__chk_user_ptr(__gu_addr);				\
>   	barrier_nospec();					\
> -	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
> -	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> +	__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
> +	(x) = (__force __typeof__(*(ptr)))__gu_val;		\
> +								\
>   	__gu_err;						\
>   })
>   
> 


Christophe
