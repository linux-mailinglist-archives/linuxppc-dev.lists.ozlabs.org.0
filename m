Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C360FD3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 12:19:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gnkd1PpjzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 20:19:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QQlrzXjs"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gnhx07rmzDqDt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 20:17:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45gnhn6jjKz9vBLK;
 Sat,  6 Jul 2019 12:17:45 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QQlrzXjs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mr_lAJsSHtA4; Sat,  6 Jul 2019 12:17:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45gnhn5Tpmz9vBL2;
 Sat,  6 Jul 2019 12:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562408265; bh=pywBShbqsEelU8k/p2Hw+ePRCD+ryl3vI419zE+0SUo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QQlrzXjsFgNCZbSQhVHD2l7QDabweGwWJPIt2qTQaoLNRFhucTiSpdC4o9kKgfxX8
 LG0W79tL3gFrhnk+yDl0rCHpAdFtlact0FJOyhxb56y+Kd1Pj9Oa3hnE8nhT90952H
 jZslSOLwE92stenRxEjkqX3LGDoGttveW0iloRmc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D4EFA8B768;
 Sat,  6 Jul 2019 12:17:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id D297ZC6n5O2m; Sat,  6 Jul 2019 12:17:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1CF948B74C;
 Sat,  6 Jul 2019 12:17:46 +0200 (CEST)
Subject: Re: [v4 5/6] powerpc: add machine check safe copy_to_user
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20190706094647.15427-1-santosh@fossix.org>
 <20190706094647.15427-6-santosh@fossix.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <97247052-fb1e-f66f-25b6-c58c8741e5e3@c-s.fr>
Date: Sat, 6 Jul 2019 12:17:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190706094647.15427-6-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/07/2019 à 11:46, Santosh Sivaraj a écrit :
> Use  memcpy_mcsafe() implementation to define copy_to_user_mcsafe()
> 
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>   arch/powerpc/Kconfig               |  1 +
>   arch/powerpc/include/asm/uaccess.h | 14 ++++++++++++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8c1c636308c8..a173b392c272 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -134,6 +134,7 @@ config PPC
>   	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
>   	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
> +	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>   	select ARCH_HAS_ZONE_DEVICE		if PPC_BOOK3S_64
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 76f34346b642..8899864a5552 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -386,6 +386,20 @@ static inline unsigned long raw_copy_to_user(void __user *to,
>   	return ret;
>   }
>   
> +static __always_inline unsigned long __must_check
> +copy_to_user_mcsafe(void __user *to, const void *from, unsigned long n)
> +{
> +	if (likely(check_copy_size(from, n, true))) {
> +		if (access_ok(to, n)) {

After looking once more, it looks like copy_to_user_mcsafe() is only 
called from copyout_mcsafe(), so maybe this access_ok() check is 
superfluous.

> +			allow_write_to_user(to, n);
> +			n = memcpy_mcsafe((void *)to, from, n);
> +			prevent_write_to_user(to, n);
> +		}
> +	}
> +
> +	return n;

Shouldn't it return 0 when check_copy_size() fails ?

Christophe

> +}
> +
>   extern unsigned long __clear_user(void __user *addr, unsigned long size);
>   
>   static inline unsigned long clear_user(void __user *addr, unsigned long size)
> 
