Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A544C195D1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:47:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pq7L10yczDrHY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 04:47:26 +1100 (AEDT)
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
 header.s=mail header.b=I7zcFKtD; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pq5N0bnczDr6w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 04:45:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48pq5D62XgzB09ZD;
 Fri, 27 Mar 2020 18:45:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=I7zcFKtD; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jCOozahwYNFE; Fri, 27 Mar 2020 18:45:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48pq5D4ybszB09ZC;
 Fri, 27 Mar 2020 18:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585331136; bh=3SkIPgsXKkFnLTZYxtFtW0Qi2neIcyQvhkRRPwD/4fY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I7zcFKtDhk0IpK6ocRGSsfjZqfvZ+BQdfe+AqF8TVwg7TG44rKz9ZyiOsez9Pi/ZU
 16OSJrxC98HLNaPifBNdK2NW3z5SWqYNZaWm9elGT78dOMxOWssJh9mv6oulYNZgpT
 LgEEurTeP2J90RiQYJRx9t0QZ7i//9eVRfjF5Cnw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DED68B829;
 Fri, 27 Mar 2020 18:45:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UPRfRPNn2d55; Fri, 27 Mar 2020 18:45:38 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFD748B822;
 Fri, 27 Mar 2020 18:45:36 +0100 (CET)
Subject: Re: [PATCH v1] powerpc: Make setjmp/longjump signature standard
To: Clement Courbet <courbet@google.com>
References: <20200327100801.161671-1-courbet@google.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f1b85a2a-1c60-9a12-f547-13ff255f18f0@c-s.fr>
Date: Fri, 27 Mar 2020 18:45:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327100801.161671-1-courbet@google.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Subject line, change longjump to longjmp

Le 27/03/2020 à 11:07, Clement Courbet a écrit :
> Declaring setjmp()/longjmp() as taking longs makes the signature
> non-standard, and makes clang complain. In the past, this has been
> worked around by adding -ffreestanding to the compile flags.
> 
> The implementation looks like it only ever propagates the value
> (in longjmp) or sets it to 1 (in setjmp), and we only call longjmp
> with integer parameters.
> 
> This allows removing -ffreestanding from the compilation flags.
> 
> Context:
> https://lore.kernel.org/patchwork/patch/1214060
> https://lore.kernel.org/patchwork/patch/1216174
> 
> Signed-off-by: Clement Courbet <courbet@google.com>
> ---
>   arch/powerpc/include/asm/setjmp.h | 6 ++++--
>   arch/powerpc/kexec/Makefile       | 3 ---
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
> index e9f81bb3f83b..84bb0d140d59 100644
> --- a/arch/powerpc/include/asm/setjmp.h
> +++ b/arch/powerpc/include/asm/setjmp.h
> @@ -7,7 +7,9 @@
>   
>   #define JMP_BUF_LEN    23
>   
> -extern long setjmp(long *) __attribute__((returns_twice));
> -extern void longjmp(long *, long) __attribute__((noreturn));
> +typedef long *jmp_buf;

Do we need that new opaque typedef ? Why not just keep long * ?

> +
> +extern int setjmp(jmp_buf env) __attribute__((returns_twice));
> +extern void longjmp(jmp_buf env, int val) __attribute__((noreturn));
>   
>   #endif /* _ASM_POWERPC_SETJMP_H */
> diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
> index 378f6108a414..86380c69f5ce 100644
> --- a/arch/powerpc/kexec/Makefile
> +++ b/arch/powerpc/kexec/Makefile
> @@ -3,9 +3,6 @@
>   # Makefile for the linux kernel.
>   #
>   
> -# Avoid clang warnings around longjmp/setjmp declarations
> -CFLAGS_crash.o += -ffreestanding
> -
>   obj-y				+= core.o crash.o core_$(BITS).o
>   
>   obj-$(CONFIG_PPC32)		+= relocate_32.o
> 

Christophe
