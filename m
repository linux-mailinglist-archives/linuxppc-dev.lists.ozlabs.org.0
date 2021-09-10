Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7E40740C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 01:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5sz02jqmz2yb7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 09:49:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KrXuEsLQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KrXuEsLQ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5syL3yzHz2xtS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 09:48:26 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53CDF611BF;
 Fri, 10 Sep 2021 23:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631317703;
 bh=3W+6f0wuipTibyjTQaN5vgjbRHyQ1UrUz0L6qzxUplo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KrXuEsLQIXYeh9eXjpq16ZYWxHkH1WKFaE5hG2+4bXOmbBKajE6+K36WBkyjLHeyS
 eKFv24TqMQXYQqVMk6mrx+RU19w1nOz9pH9XF2rOZ95sCLmquwI9BE51WUXEkYpaBF
 8RkK8UfnGtQA3x4rATph8qC3uKDp9d2VQz/hAbFxMKvK4hDbew9QgCKm55he2f3w1v
 YrUP8LHlt6PJhToOv4sAeceahYMsxDn4WfexupxoLJM9GTQbht9lxUCWgUg8tzdWoI
 WHMy+eff9sVxectgaPmxHdq7NHT5WCoQXjgQNJARg7qXBmd4+Te7RyzLss+7SM92v6
 5gpQvxgkkyESw==
Subject: Re: [PATCH 06/10] powerpc: remove GCC version check for UPD_CONSTR
To: Nick Desaulniers <ndesaulniers@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-7-ndesaulniers@google.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <b940bd2c-21d2-dfe9-e171-e265085a2b11@kernel.org>
Date: Fri, 10 Sep 2021 16:48:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910234047.1019925-7-ndesaulniers@google.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Joe Perches <joe@perches.com>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/10/2021 4:40 PM, Nick Desaulniers wrote:
> Now that GCC 5.1 is the minimum supported version, we can drop this
> workaround for older versions of GCC. This adversely affected clang,
> too.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>   arch/powerpc/include/asm/asm-const.h | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/asm-const.h b/arch/powerpc/include/asm/asm-const.h
> index 0ce2368bd20f..dbfa5e1e3198 100644
> --- a/arch/powerpc/include/asm/asm-const.h
> +++ b/arch/powerpc/include/asm/asm-const.h
> @@ -12,16 +12,6 @@
>   #  define ASM_CONST(x)		__ASM_CONST(x)
>   #endif
>   
> -/*
> - * Inline assembly memory constraint
> - *
> - * GCC 4.9 doesn't properly handle pre update memory constraint "m<>"
> - *
> - */
> -#if defined(GCC_VERSION) && GCC_VERSION < 50000
> -#define UPD_CONSTR ""
> -#else
>   #define UPD_CONSTR "<>"
> -#endif

The only reason this exists is because of commit 592bbe9c505d 
("powerpc/uaccess: Don't use "m<>" constraint with GCC 4.9"). It is 
probably just worth sinking "<>" into all of the callsites and removing
UPD_CONSTR.

>   
>   #endif /* _ASM_POWERPC_ASM_CONST_H */
> 
