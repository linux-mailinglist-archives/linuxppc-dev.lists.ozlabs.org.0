Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D48D3EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 14:55:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467qLB2kwmzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 22:54:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Dalae2Qt"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467qGF75TczDqJS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 22:51:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467qG837FDz9tyn7;
 Wed, 14 Aug 2019 14:51:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Dalae2Qt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eImdWDUz0azO; Wed, 14 Aug 2019 14:51:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467qG82236z9tyn6;
 Wed, 14 Aug 2019 14:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565787088; bh=mOCEMB2qdCSI10DBAqLVTT6XlR6gmRR0nFTEIlsddIY=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Dalae2Qt0Ch584GmST3PYos10MrE314GXj1HW1Ji6Ex9IvGzIm/lFnCg3WAmyy+CM
 veH5s5VTN7r8usrxVNU/3VzDzMhDGjHSwTzBfTQWbZZbjQ5Udh9q1hHa48TLwI1IdR
 Q3jvSYIQIwAbKBTA+oXde9fw4QpbU4wND00MMdLs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD54D8B7F7;
 Wed, 14 Aug 2019 14:51:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3NFi6Z7pSKLw; Wed, 14 Aug 2019 14:51:29 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ADECA8B761;
 Wed, 14 Aug 2019 14:51:29 +0200 (CEST)
Subject: Re: [PATCH 1/5] powerpc/ptdump: fix addresses display on PPC32
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <eb4d626514e22f85814830012642329018ef6af9.1565786091.git.christophe.leroy@c-s.fr>
Message-ID: <db36b9fe-e9f8-0007-ff87-03ac6ae87a8b@c-s.fr>
Date: Wed, 14 Aug 2019 14:51:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eb4d626514e22f85814830012642329018ef6af9.1565786091.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael,

Le 14/08/2019 à 14:36, Christophe Leroy a écrit :
> Commit 453d87f6a8ae ("powerpc/mm: Warn if W+X pages found on boot")
> wrongly changed KERN_VIRT_START from 0 to PAGE_OFFSET, leading to a
> shift in the displayed addresses.
> 
> Lets revert that change to resync walk_pagetables()'s addr val and
> pgd_t pointer for PPC32.
> 
> Fixes: 453d87f6a8ae ("powerpc/mm: Warn if W+X pages found on boot")

Either this patch or patch 2 of the series has to go into fixes.

If you prefer next patch for fixes, then this one can be squashed into 
patch 3 which drops the PPC32 hacked definition of KERN_VIRT_START

Christophe

> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   arch/powerpc/mm/ptdump/ptdump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index 6a88a9f585d4..3ad64fc11419 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -27,7 +27,7 @@
>   #include "ptdump.h"
>   
>   #ifdef CONFIG_PPC32
> -#define KERN_VIRT_START	PAGE_OFFSET
> +#define KERN_VIRT_START	0
>   #endif
>   
>   /*
> 
