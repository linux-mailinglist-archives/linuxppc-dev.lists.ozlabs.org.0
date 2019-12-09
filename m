Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D86116C8F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 12:52:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WhQP4MgYzDqF7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 22:52:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="sOSTsvaS"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WhMS0ZMyzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 22:50:10 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47WhMF2tW2z9vBmq;
 Mon,  9 Dec 2019 12:50:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sOSTsvaS; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6pXJKZlbewDD; Mon,  9 Dec 2019 12:50:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47WhMF1qCSz9vBmp;
 Mon,  9 Dec 2019 12:50:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575892201; bh=0x1LWwsT3BNeET0V8+O9mXpF4LpLRPACmPWfUToxcpw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sOSTsvaSb5GedAdefeaYqE5sRI5Vw9GdrxpGEXmkA1rsYPXOn4wy/FL9F0AUkjfr6
 lvbPBIdHRYOTTrseENMfCjuiljc2Xmr7mWKkoHCNiOGfHsqAnvC4rjvuj1imFSc+K1
 VlDAwsyn/S5A48D3ZR3Y7Q17m9jqqt7KN1Ui2cE0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E5AB8B7D1;
 Mon,  9 Dec 2019 12:50:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e4ZbXAqFAKqP; Mon,  9 Dec 2019 12:50:06 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB3578B7C5;
 Mon,  9 Dec 2019 12:50:05 +0100 (CET)
Subject: Re: [PATCH] powerpc: Fix __clear_user() with KUAP enabled
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20191209105946.13474-1-ajd@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3349b5d5-c277-a868-8a27-ef168aae7daa@c-s.fr>
Date: Mon, 9 Dec 2019 12:50:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209105946.13474-1-ajd@linux.ibm.com>
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
Cc: syzbot+f25ecf4b2982d8c7a640@syzkaller-ppc64.appspotmail.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/12/2019 à 11:59, Andrew Donnellan a écrit :
> The KUAP implementation adds calls in clear_user() to enable and disable
> access to userspace memory. However, it doesn't add these to
> __clear_user(), which is used in the ptrace regset code.
> 
> As there's only one direct user of __clear_user(), and the time taken to
> set the AMR for KUAP purposes is going to dominate the cost of a quick
> access_ok(), there's not much point having a separate path.

No risk that access_ok() fails ?

There is also a call to might_fault() in clear_user(), isn't it a problem ?

> 
> Rename __clear_user() to clear_user_asm(), and make __clear_user() just
> call clear_user().
> 
> Reported-by: syzbot+f25ecf4b2982d8c7a640@syzkaller-ppc64.appspotmail.com
> Reported-by: Daniel Axtens <dja@axtens.net>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Russell Currey <ruscur@russell.cc>
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/uaccess.h | 9 +++++++--
>   arch/powerpc/lib/string_32.S       | 4 ++--
>   arch/powerpc/lib/string_64.S       | 6 +++---
>   3 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 15002b51ff18..d05bc0a4cafa 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -401,7 +401,7 @@ copy_to_user_mcsafe(void __user *to, const void *from, unsigned long n)
>   	return n;
>   }
>   
> -extern unsigned long __clear_user(void __user *addr, unsigned long size);
> +extern unsigned long clear_user_asm(void __user *addr, unsigned long size);
>   
>   static inline unsigned long clear_user(void __user *addr, unsigned long size)
>   {
> @@ -409,12 +409,17 @@ static inline unsigned long clear_user(void __user *addr, unsigned long size)
>   	might_fault();
>   	if (likely(access_ok(addr, size))) {
>   		allow_write_to_user(addr, size);
> -		ret = __clear_user(addr, size);
> +		ret = clear_user_asm(addr, size);
>   		prevent_write_to_user(addr, size);
>   	}

What about changing the above by the following ?

    	if (likely(access_ok(addr, size)))		ret = __clear_user(addr, size);

>   	return ret;
>   }
>   
> +static inline unsigned long __clear_user(void __user *addr, unsigned long size)
> +{
> +        return clear_user(addr, size);
> +}
> +

Then

static inline unsigned long __clear_user(void __user *addr, unsigned 
long size)
{
	allow_write_to_user(addr, size);
	ret = clear_user_asm(addr, size);
	prevent_write_to_user(addr, size);

	return ret;
}

>   extern long strncpy_from_user(char *dst, const char __user *src, long count);
>   extern __must_check long strnlen_user(const char __user *str, long n);


Christophe
