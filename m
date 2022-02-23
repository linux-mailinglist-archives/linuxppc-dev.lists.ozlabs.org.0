Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD74C2766
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:04:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46R66X8tz3cc3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:04:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sbRe9FkU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=dinguyen@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sbRe9FkU; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46GB3CsGz3cY9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:56:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B865561A00;
 Wed, 23 Feb 2022 23:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A8BC340E7;
 Wed, 23 Feb 2022 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645659061;
 bh=lqCEQ++vi7cgL8SGDqvu6VRtg8aruPJlQBSjPBXBFVM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sbRe9FkUPCxCGG5QhSpQFHALisL4a0h67bCxhSLbAt1nLiwP1yIOk1Uj7FSa6KCb5
 weBLktMX2iJ1azUVoI5qzyIPsB248hdzJqK4FY8iQs4ijX9ClxGFEG4dPQ2t94Tu+v
 xnm83JKO7FsjVlGtupBZVZ1sGqkMArGtNnLjnEwqgMRRugYsRTn+yfOLhixpTMveFC
 hFyJk7dTbBRw3IsZy86rcTOonVkHxoMQs0BGW96T4vsXyVidvkbPH0uwFh8RFITz5K
 oD3k8dsNBCQPOLOspB8IOHbjF16KCCmPClOP9aOj20bxN2gTg9NdvWcdAxevymW0xQ
 hD4A1zZdc89kw==
Message-ID: <c6f461f1-1dd9-aec1-2c85-a3eda478a1be@kernel.org>
Date: Wed, 23 Feb 2022 17:30:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/18] nios2: drop access_ok() check from __put_user()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-8-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-8-arnd@kernel.org>
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
> Unlike other architectures, the nios2 version of __put_user() has an
> extra check for access_ok(), preventing it from being used to implement
> __put_kernel_nofault().
> 
> Split up put_user() along the same lines as __get_user()/get_user()
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/nios2/include/asm/uaccess.h | 56 +++++++++++++++++++-------------
>   1 file changed, 33 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/nios2/include/asm/uaccess.h b/arch/nios2/include/asm/uaccess.h
> index ca9285a915ef..a5cbe07cf0da 100644
> --- a/arch/nios2/include/asm/uaccess.h
> +++ b/arch/nios2/include/asm/uaccess.h
> @@ -167,34 +167,44 @@ do {									\
>   	: "r" (val), "r" (ptr), "i" (-EFAULT));				\
>   }
>   
> -#define put_user(x, ptr)						\
> +#define __put_user_common(__pu_val, __pu_ptr)				\
>   ({									\
>   	long __pu_err = -EFAULT;					\
> -	__typeof__(*(ptr)) __user *__pu_ptr = (ptr);			\
> -	__typeof__(*(ptr)) __pu_val = (__typeof(*ptr))(x);		\
> -	if (access_ok(__pu_ptr, sizeof(*__pu_ptr))) {	\
> -		switch (sizeof(*__pu_ptr)) {				\
> -		case 1:							\
> -			__put_user_asm(__pu_val, "stb", __pu_ptr, __pu_err); \
> -			break;						\
> -		case 2:							\
> -			__put_user_asm(__pu_val, "sth", __pu_ptr, __pu_err); \
> -			break;						\
> -		case 4:							\
> -			__put_user_asm(__pu_val, "stw", __pu_ptr, __pu_err); \
> -			break;						\
> -		default:						\
> -			/* XXX: This looks wrong... */			\
> -			__pu_err = 0;					\
> -			if (copy_to_user(__pu_ptr, &(__pu_val),		\
> -				sizeof(*__pu_ptr)))			\
> -				__pu_err = -EFAULT;			\
> -			break;						\
> -		}							\
> +	switch (sizeof(*__pu_ptr)) {					\
> +	case 1:								\
> +		__put_user_asm(__pu_val, "stb", __pu_ptr, __pu_err);	\
> +		break;							\
> +	case 2:								\
> +		__put_user_asm(__pu_val, "sth", __pu_ptr, __pu_err);	\
> +		break;							\
> +	case 4:								\
> +		__put_user_asm(__pu_val, "stw", __pu_ptr, __pu_err);	\
> +		break;							\
> +	default:							\
> +		/* XXX: This looks wrong... */				\
> +		__pu_err = 0;						\
> +		if (__copy_to_user(__pu_ptr, &(__pu_val),		\
> +			sizeof(*__pu_ptr)))				\
> +			__pu_err = -EFAULT;				\
> +		break;							\
>   	}								\
>   	__pu_err;							\
>   })
>   
> -#define __put_user(x, ptr) put_user(x, ptr)
> +#define __put_user(x, ptr)						\
> +({									\
> +	__auto_type __pu_ptr = (ptr);					\
> +	typeof(*__pu_ptr) __pu_val = (typeof(*__pu_ptr))(x);		\
> +	__put_user_common(__pu_val, __pu_ptr);				\
> +})
> +
> +#define put_user(x, ptr)						\
> +({									\
> +	__auto_type __pu_ptr = (ptr);					\
> +	typeof(*__pu_ptr) __pu_val = (typeof(*__pu_ptr))(x);		\
> +	access_ok(__pu_ptr, sizeof(*__pu_ptr)) ?			\
> +		__put_user_common(__pu_val, __pu_ptr) :			\
> +		-EFAULT;						\
> +})
>   
>   #endif /* _ASM_NIOS2_UACCESS_H */

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
