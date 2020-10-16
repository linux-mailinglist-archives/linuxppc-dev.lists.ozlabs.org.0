Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB16290631
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 15:21:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCRcB4MKvzDqlc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 00:20:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCRXR4f9ZzDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 00:17:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CCRX662f1z9vBLq;
 Fri, 16 Oct 2020 15:17:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id exyUTaGpqwXC; Fri, 16 Oct 2020 15:17:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CCRX65CNvz9vBLp;
 Fri, 16 Oct 2020 15:17:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AEF38B849;
 Fri, 16 Oct 2020 15:17:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eCUIW4BXVQUj; Fri, 16 Oct 2020 15:17:28 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EA7F8B83E;
 Fri, 16 Oct 2020 15:17:27 +0200 (CEST)
Subject: Re: [PATCH 1/8] powerpc/uaccess: Add unsafe_copy_from_user
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-2-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5dc712e9-4d08-b436-3137-d1ac100f2bfb@csgroup.eu>
Date: Fri, 16 Oct 2020 15:17:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015150159.28933-2-cmr@codefail.de>
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



Le 15/10/2020 à 17:01, Christopher M. Riedl a écrit :
> Implement raw_copy_from_user_allowed() which assumes that userspace read
> access is open. Use this new function to implement raw_copy_from_user().
> Finally, wrap the new function to follow the usual "unsafe_" convention
> of taking a label argument. The new raw_copy_from_user_allowed() calls
> __copy_tofrom_user() internally, but this is still safe to call in user
> access blocks formed with user_*_access_begin()/user_*_access_end()
> since asm functions are not instrumented for tracing.

Would objtool accept that if it was implemented on powerpc ?

__copy_tofrom_user() is a function which is optimised for larger memory copies (using dcbz, etc ...)
Do we need such an optimisation for unsafe_copy_from_user() ? Or can we do a simple loop as done for 
unsafe_copy_to_user() instead ?

Christophe

> 
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/include/asm/uaccess.h | 28 +++++++++++++++++++---------
>   1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 26781b044932..66940b4eb692 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -418,38 +418,45 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
>   }
>   #endif /* __powerpc64__ */
>   
> -static inline unsigned long raw_copy_from_user(void *to,
> -		const void __user *from, unsigned long n)
> +static inline unsigned long
> +raw_copy_from_user_allowed(void *to, const void __user *from, unsigned long n)
>   {
> -	unsigned long ret;
>   	if (__builtin_constant_p(n) && (n <= 8)) {
> -		ret = 1;
> +		unsigned long ret = 1;
>   
>   		switch (n) {
>   		case 1:
>   			barrier_nospec();
> -			__get_user_size(*(u8 *)to, from, 1, ret);
> +			__get_user_size_allowed(*(u8 *)to, from, 1, ret);
>   			break;
>   		case 2:
>   			barrier_nospec();
> -			__get_user_size(*(u16 *)to, from, 2, ret);
> +			__get_user_size_allowed(*(u16 *)to, from, 2, ret);
>   			break;
>   		case 4:
>   			barrier_nospec();
> -			__get_user_size(*(u32 *)to, from, 4, ret);
> +			__get_user_size_allowed(*(u32 *)to, from, 4, ret);
>   			break;
>   		case 8:
>   			barrier_nospec();
> -			__get_user_size(*(u64 *)to, from, 8, ret);
> +			__get_user_size_allowed(*(u64 *)to, from, 8, ret);
>   			break;
>   		}
>   		if (ret == 0)
>   			return 0;
>   	}
>   
> +	return __copy_tofrom_user((__force void __user *)to, from, n);
> +}
> +
> +static inline unsigned long
> +raw_copy_from_user(void *to, const void __user *from, unsigned long n)
> +{
> +	unsigned long ret;
> +
>   	barrier_nospec();
>   	allow_read_from_user(from, n);
> -	ret = __copy_tofrom_user((__force void __user *)to, from, n);
> +	ret = raw_copy_from_user_allowed(to, from, n);
>   	prevent_read_from_user(from, n);
>   	return ret;
>   }
> @@ -571,6 +578,9 @@ user_write_access_begin(const void __user *ptr, size_t len)
>   #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
>   #define unsafe_put_user(x, p, e) __put_user_goto(x, p, e)
>   
> +#define unsafe_copy_from_user(d, s, l, e) \
> +	unsafe_op_wrap(raw_copy_from_user_allowed(d, s, l), e)
> +
>   #define unsafe_copy_to_user(d, s, l, e) \
>   do {									\
>   	u8 __user *_dst = (u8 __user *)(d);				\
> 
