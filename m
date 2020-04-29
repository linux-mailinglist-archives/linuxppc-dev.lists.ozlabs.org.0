Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCAB1BD488
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:19:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BpJJ1CHGzDqGh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:19:28 +1000 (AEST)
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
 header.s=mail header.b=gZW3oK4f; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpG50gLtzDr3F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:17:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49BpG0427Wz9txPB;
 Wed, 29 Apr 2020 08:17:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gZW3oK4f; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ixyHQ3wDASx2; Wed, 29 Apr 2020 08:17:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49BpG02kYvz9txP9;
 Wed, 29 Apr 2020 08:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1588141048; bh=EkUgosIN64/7yAQ+xWvCvCnE4dJhaM+9kMKUGtuLvK0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gZW3oK4fcOITx0QQTthRUuq+8+lLXOyN3+hMbJYia9A3sytSnomt3ORWPSzs1kr6h
 PsGVqsuY5yG0VkLnWRW3tjiqZczo15D90Ietus/AEiiyZiCpydSplDy4VOxGvXQA3H
 7ZovHIJxjY/vwsxzYU2j8S9nUS4mcL3L1x7p+5rs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 455C38B86D;
 Wed, 29 Apr 2020 08:17:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oRQk_Oz9NNoR; Wed, 29 Apr 2020 08:17:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9C888B86C;
 Wed, 29 Apr 2020 08:17:27 +0200 (CEST)
Subject: Re: [PATCH] fixup! signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
To: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>
References: <20200428074827.GA19846@lst.de>
 <20200428195645.1365019-1-arnd@arndb.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d00b4436-9a97-5e90-2a6f-e79f90be9736@c-s.fr>
Date: Wed, 29 Apr 2020 08:17:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428195645.1365019-1-arnd@arndb.de>
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
Cc: linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 "Eric W . Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/04/2020 à 21:56, Arnd Bergmann a écrit :
> I think I found a way to improve the x32 handling:
> 
> This is a simplification over Christoph's "[PATCH 2/7] signal: factor
> copy_siginfo_to_external32 from copy_siginfo_to_user32", reducing the
> x32 specifics in the common code to a single #ifdef/#endif check, in
> order to keep it more readable for everyone else.
> 
> Christoph, if you like it, please fold into your patch.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Jeremy Kerr <jk@ozlabs.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "Eric W . Biederman" <ebiederm@xmission.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-fsdevel@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/x86/include/asm/compat.h | 10 ++++++++++
>   arch/x86/kernel/signal.c      | 23 +++++++++++++++++++++++
>   kernel/signal.c               | 15 ++-------------
>   3 files changed, 35 insertions(+), 13 deletions(-)
> 

[...]

> diff --git a/kernel/signal.c b/kernel/signal.c
> index 1a81602050b4..935facca4860 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -3318,29 +3318,18 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
>   	}
>   }
>   
> +#ifndef CONFIG_X86_X32_ABI

Can it be declared __weak instead of enclosing it in an #ifndef ?

>   int copy_siginfo_to_user32(struct compat_siginfo __user *to,
>   			   const struct kernel_siginfo *from)
> -#if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
> -{
> -	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
> -}
> -int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
> -			     const struct kernel_siginfo *from, bool x32_ABI)
> -#endif
>   {
>   	struct compat_siginfo new;
>   
>   	copy_siginfo_to_external32(&new, from);
> -#ifdef CONFIG_X86_X32_ABI
> -	if (x32_ABI && from->si_signo == SIGCHLD) {
> -		new._sifields._sigchld_x32._utime = from->si_utime;
> -		new._sifields._sigchld_x32._stime = from->si_stime;
> -	}
> -#endif
>   	if (copy_to_user(to, &new, sizeof(struct compat_siginfo)))
>   		return -EFAULT;
>   	return 0;
>   }
> +#endif
>   
>   static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
>   					 const struct compat_siginfo *from)
> 

Christophe
