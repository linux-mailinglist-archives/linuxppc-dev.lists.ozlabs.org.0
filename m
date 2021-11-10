Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3A44C5BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 18:12:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqBHT5QTMz3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 04:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqBH370Q1z2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 04:12:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HqBGw58FDz9sSJ;
 Wed, 10 Nov 2021 18:12:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BV-OD3C18pQI; Wed, 10 Nov 2021 18:12:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HqBGw4CxQz9sSG;
 Wed, 10 Nov 2021 18:12:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B5D88B77E;
 Wed, 10 Nov 2021 18:12:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EhBDh9Hq4S2x; Wed, 10 Nov 2021 18:12:08 +0100 (CET)
Received: from [192.168.233.217] (unknown [192.168.233.217])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0391B8B77A;
 Wed, 10 Nov 2021 18:12:07 +0100 (CET)
Message-ID: <ed04d4a1-7a60-ee39-f64b-203b299e8875@csgroup.eu>
Date: Wed, 10 Nov 2021 18:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc: Fix sigset_t copy
Content-Language: fr-FR
To: Finn Thain <fthain@linux-m68k.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <08bbe7240b384016e0b2912ecf3bf5e2d25ef2c6.1636501628.git.fthain@linux-m68k.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <08bbe7240b384016e0b2912ecf3bf5e2d25ef2c6.1636501628.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Christopher M. Riedl" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/11/2021 à 00:47, Finn Thain a écrit :
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> The conversion from __copy_from_user() to __get_user() introduced a
> regression in __get_user_sigset() in v5.13. The bug was subsequently
> copied and pasted in unsafe_get_user_sigset().
> 
> The regression was reported by users of the Xorg packages distributed in
> Debian/powerpc --
> 
>      "The symptoms are that the fb screen goes blank, with the backlight
>      remaining on and no errors logged in /var/log; wdm (or startx) run
>      with no effect (I tried logging in in the blind, with no effect).
>      And they are hard to kill, requiring 'kill -KILL ...'"
> 
> Fix the regression by casting the __get_user() assignment lvalue to u64
> so that the entire struct gets copied.
> 
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Christopher M. Riedl <cmr@bluescreens.de>
> Link: https://lore.kernel.org/linuxppc-dev/FEtBUOuFPMN4zJy4bIOqz6C4xoliCbTxS7VtMKD6UZkbvEbycUceRgGAd7e9-trRdwVN3hWAbQi0qrNx8Zgn8niTQf2KPVdw-W35czDIaeQ=@protonmail.com/
> Fixes: 887f3ceb51cd ("powerpc/signal32: Convert do_setcontext[_tm]() to user access block")
> Fixes: d3ccc9781560 ("powerpc/signal: Use __get_user() to copy sigset_t")
> Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---

Hi Finn,

> Christophe, I hope this change is the one you wanted to see upstream (?).
> If it is acceptable please add your signed-off-by tag.

I'm on holidays, I was planing to handle this next week.

Only PPC64 uses __get_user_sigset() on mainline so I don't think it is 
worth modifying it. If we decide to modify it anyway in mainline, it 
should be another patch that can be backported without additional effort.

For unsafe_get_user_sigset(), as we don't have the KUAP overhead that we 
had with __get_user(), I'd prefer we simply perform two 32 bits 
unsafe_get_user(), one for sig[0] and one for sig[1], instead of all 
those casts to u64.

Thanks anyway for the detailed description of the problem.
Christophe

> ---
>   arch/powerpc/kernel/signal.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
> index 1f07317964e4..44e736b88e91 100644
> --- a/arch/powerpc/kernel/signal.h
> +++ b/arch/powerpc/kernel/signal.h
> @@ -23,10 +23,10 @@ static inline int __get_user_sigset(sigset_t *dst, const sigset_t __user *src)
>   {
>   	BUILD_BUG_ON(sizeof(sigset_t) != sizeof(u64));
>   
> -	return __get_user(dst->sig[0], (u64 __user *)&src->sig[0]);
> +	return __get_user(*(u64 *)&dst->sig[0], (u64 __user *)&src->sig[0]);
>   }
>   #define unsafe_get_user_sigset(dst, src, label) \
> -	unsafe_get_user((dst)->sig[0], (u64 __user *)&(src)->sig[0], label)
> +	unsafe_get_user(*(u64 *)&(dst)->sig[0], (u64 __user *)&(src)->sig[0], label)
>   
>   #ifdef CONFIG_VSX
>   extern unsigned long copy_vsx_to_user(void __user *to,
> 
