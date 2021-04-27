Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFAE36BEB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 07:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTqTc62jKz30G8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 15:05:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTqTH0LBZz2xfk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 15:05:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FTqT63mM3z4gf;
 Tue, 27 Apr 2021 07:05:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4PMjbRIQiGt; Tue, 27 Apr 2021 07:05:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FTqT62gmzz4jM;
 Tue, 27 Apr 2021 07:05:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 125F38B77C;
 Tue, 27 Apr 2021 07:05:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id je4m3tj14JOn; Tue, 27 Apr 2021 07:05:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BD808B777;
 Tue, 27 Apr 2021 07:05:12 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Avoid clang uninitialized warning in
 __get_user_size_allowed
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210426203518.981550-1-nathan@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <32a0f305-031b-e4da-345d-0f03b2b42189@csgroup.eu>
Date: Tue, 27 Apr 2021 07:05:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426203518.981550-1-nathan@kernel.org>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/04/2021 à 22:35, Nathan Chancellor a écrit :
> Commit 9975f852ce1b ("powerpc/uaccess: Remove calls to __get_user_bad()
> and __put_user_bad()") switch to BUILD_BUG() in the default case, which
> leaves x uninitialized. This will not be an issue because the build will
> be broken in that case but clang does static analysis before it realizes
> the default case will be done so it warns about x being uninitialized
> (trimmed for brevity):
> 
>   In file included from mm/mprotect.c:13:
>   In file included from ./include/linux/hugetlb.h:28:
>   In file included from ./include/linux/mempolicy.h:16:
>   ./include/linux/pagemap.h:772:16: warning: variable '__gu_val' is used
>   uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>                   if (unlikely(__get_user(c, uaddr) != 0))
>                                ^~~~~~~~~~~~~~~~~~~~
>   ./arch/powerpc/include/asm/uaccess.h:266:2: note: expanded from macro '__get_user'
>           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ./arch/powerpc/include/asm/uaccess.h:235:2: note: expanded from macro
>   '__get_user_size_allowed'
>          default: BUILD_BUG();                                   \
>          ^~~~~~~
> 
> Commit 5cd29b1fd3e8 ("powerpc/uaccess: Use asm goto for get_user when
> compiler supports it") added an initialization for x because of the same
> reason. Do the same thing here so there is no warning across all
> versions of clang.

Ah yes, I tested with Clang 11 which has CONFIG_CC_HAS_ASM_GOTO_OUTPUT, that's the reason why I hit 
that warning only in the CONFIG_CC_HAS_ASM_GOTO_OUTPUT branch.

But regardless, is that normal that Clang warns that on a never taken branch ? That's puzzling.

> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1359
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/include/asm/uaccess.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index a4e791bcd3fe..a09e4240c5b1 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -232,7 +232,7 @@ do {								\
>   	case 2: __get_user_asm(x, (u16 __user *)ptr, retval, "lhz"); break;	\
>   	case 4: __get_user_asm(x, (u32 __user *)ptr, retval, "lwz"); break;	\
>   	case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;	\
> -	default: BUILD_BUG();					\
> +	default: x = 0; BUILD_BUG();				\
>   	}							\
>   } while (0)
>   
> 
> base-commit: ee6b25fa7c037e42cc5f3b5c024b2a779edab6dd
> 
