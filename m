Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECC27C67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 14:03:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458p7H6N22zDqRr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 22:03:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="mYh3up+P"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458p5d5hGDzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 22:02:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458p5V4Lx7z9v2NT;
 Thu, 23 May 2019 14:02:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mYh3up+P; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id t0X21tqOHZa6; Thu, 23 May 2019 14:02:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458p5V2pLmz9v2NS;
 Thu, 23 May 2019 14:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558612926; bh=dxjR5/OUEbuHjryrELjiCz2BmB568YPeDBsdsR3B27c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mYh3up+PAV5q1CkXEn+MOv/nsPx6DdMICOFeThJ9qrLIPZA+jhtbkBC+HHc9/cL0A
 hZ2n1Zjj7fl/dhUGlc8qA57UwniCg+wLUPsvmBPHhgH6vGW6sFn8oCHfLDVYRlxTco
 ll+LSYtlKlkVUYiJJDsANgkM8wdmay41mIKPj+do=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C6A68B860;
 Thu, 23 May 2019 14:02:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r1aNl5ZvA7nM; Thu, 23 May 2019 14:02:07 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 895C78B858;
 Thu, 23 May 2019 14:02:06 +0200 (CEST)
Subject: Re: [PATCH] powerpc/power: Expose pfn_is_nosave prototype
To: Mathieu Malaterre <malat@debian.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190523114736.30268-1-malat@debian.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <11ffdbd5-60a9-b1fa-aa83-9d3c60e3d462@c-s.fr>
Date: Thu, 23 May 2019 14:02:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523114736.30268-1-malat@debian.org>
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
Cc: Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/05/2019 à 13:47, Mathieu Malaterre a écrit :
> The declaration for pfn_is_nosave is only available in
> kernel/power/power.h. Since this function can be override in arch,
> expose it globally. Having a prototype will make sure to avoid warning
> (sometime treated as error with W=1) such as:
> 
>    arch/powerpc/kernel/suspend.c:18:5: error: no previous prototype for 'pfn_is_nosave' [-Werror=missing-prototypes]
> 
> This moves the declaration into a globally visible header file and add
> missing include to avoid a warning in powerpc.

Then you should also drop it from kernel/power/power.h and 
arch/s390/kernel/entry.h

Christophe

> 
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>   arch/powerpc/kernel/suspend.c | 1 +
>   include/linux/suspend.h       | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/suspend.c b/arch/powerpc/kernel/suspend.c
> index a531154cc0f3..9e1b6b894245 100644
> --- a/arch/powerpc/kernel/suspend.c
> +++ b/arch/powerpc/kernel/suspend.c
> @@ -8,6 +8,7 @@
>    */
>   
>   #include <linux/mm.h>
> +#include <linux/suspend.h>
>   #include <asm/page.h>
>   #include <asm/sections.h>
>   
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index 3f529ad9a9d2..2660bbdf5230 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -395,6 +395,7 @@ extern bool system_entering_hibernation(void);
>   extern bool hibernation_available(void);
>   asmlinkage int swsusp_save(void);
>   extern struct pbe *restore_pblist;
> +int pfn_is_nosave(unsigned long pfn);
>   #else /* CONFIG_HIBERNATION */
>   static inline void register_nosave_region(unsigned long b, unsigned long e) {}
>   static inline void register_nosave_region_late(unsigned long b, unsigned long e) {}
> 
