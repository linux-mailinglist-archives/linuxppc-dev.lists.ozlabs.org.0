Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C22F1492
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 14:27:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDvdJ68m8zDqCV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:27:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDvXX6SD1zDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 00:22:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DDvX91rcPz9v0NS;
 Mon, 11 Jan 2021 14:22:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SVeLBOrgly-Q; Mon, 11 Jan 2021 14:22:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DDvX90Dhrz9v0NR;
 Mon, 11 Jan 2021 14:22:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 812728B799;
 Mon, 11 Jan 2021 14:22:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ll_sfeas69_L; Mon, 11 Jan 2021 14:22:54 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 459F38B78E;
 Mon, 11 Jan 2021 14:22:54 +0100 (CET)
Subject: Re: [PATCH v3 1/8] powerpc/uaccess: Add unsafe_copy_from_user
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20210109032557.13831-1-cmr@codefail.de>
 <20210109032557.13831-2-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <eb4f68f4-f606-007d-6552-8a46cb9912b4@csgroup.eu>
Date: Mon, 11 Jan 2021 14:22:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109032557.13831-2-cmr@codefail.de>
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



Le 09/01/2021 à 04:25, Christopher M. Riedl a écrit :
> Implement raw_copy_from_user_allowed() which assumes that userspace read
> access is open. Use this new function to implement raw_copy_from_user().
> Finally, wrap the new function to follow the usual "unsafe_" convention
> of taking a label argument.

I think there is no point implementing raw_copy_from_user_allowed(), see 
https://github.com/linuxppc/linux/commit/4b842e4e25b1 and 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8c74fc9ce8131cabb10b3e95dc0e430f396ee83e.1610369143.git.christophe.leroy@csgroup.eu/

You should simply do:

	#define unsafe_copy_from_user(d, s, l, e) \
		unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)


Christophe

> 
> The new raw_copy_from_user_allowed() calls non-inline __copy_tofrom_user()
> internally. This is still safe to call inside user access blocks formed
> with user_*_access_begin()/user_*_access_end() since asm functions are not
> instrumented for tracing.
> 
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/include/asm/uaccess.h | 28 +++++++++++++++++++---------
>   1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 501c9a79038c..698f3a6d6ae5 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -403,38 +403,45 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
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
> @@ -542,6 +549,9 @@ user_write_access_begin(const void __user *ptr, size_t len)
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
