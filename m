Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3878B33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 13:59:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xysf626nzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 21:59:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Ir8VwrvW"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xyqQ2NYWzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 21:57:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45xyqF0Z5tz9vBgm;
 Mon, 29 Jul 2019 13:57:29 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ir8VwrvW; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id U2RwxpOsV0bO; Mon, 29 Jul 2019 13:57:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45xyqD6VJkz9vBgf;
 Mon, 29 Jul 2019 13:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564401448; bh=IzuFgMAJby9Qeeyfwg6TQGxin9cLsY1Sa2j1DHJ1KUo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ir8VwrvWKorXA49KfatKtDFIhLw9IDWV3yjkolwM28w2rd+clxHjxz07/kkUktWPy
 E5L/UppUbOrLblFy0NtUrByFPOtssvN68SChGAnU8VI4v+eWM37cArYCB1Uq3HrG4z
 PltxpTaF+WRp0ffjv1dOzczs3NqIGbJXeAiJqVCk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF4088B7D0;
 Mon, 29 Jul 2019 13:57:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BcTFsavAdp-l; Mon, 29 Jul 2019 13:57:33 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EDE18B7B3;
 Mon, 29 Jul 2019 13:57:33 +0200 (CEST)
Subject: Re: [PATCH 4/5] powerpc/64: Add VIRTUAL_BUG_ON checks for __va and
 __pa addresses
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190724084638.24982-1-npiggin@gmail.com>
 <20190724084638.24982-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8c0f6994-631d-4afc-2767-2d04c43b13eb@c-s.fr>
Date: Mon, 29 Jul 2019 13:57:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724084638.24982-4-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/07/2019 à 10:46, Nicholas Piggin a écrit :
> Ensure __va is given a physical address below PAGE_OFFSET, and __pa is
> given a virtual address above PAGE_OFFSET.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/page.h | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index 0d52f57fca04..c8bb14ff4713 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -215,9 +215,19 @@ static inline bool pfn_valid(unsigned long pfn)
>   /*
>    * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
>    * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
> + * This also results in better code generation.
>    */
> -#define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET))
> -#define __pa(x) ((unsigned long)(x) & 0x0fffffffffffffffUL)
> +#define __va(x)								\
> +({									\
> +	VIRTUAL_BUG_ON((unsigned long)(x) >= PAGE_OFFSET);		\

Do we really want to add a BUG_ON here ?
Can't we just add a WARN_ON, like in 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/include/asm/io.h?id=6bf752daca07c85c181159f75dcf65b12056883b 
?

> +	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
> +})
> +
> +#define __pa(x)								\
> +({									\
> +	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\

Same

> +	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
> +})
>   
>   #else /* 32-bit, non book E */
>   #define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) + PAGE_OFFSET - MEMORY_START))
> 

Would it be possible to change those macros into static inlines ?

Christophe
