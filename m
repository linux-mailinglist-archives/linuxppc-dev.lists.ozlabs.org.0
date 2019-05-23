Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C827656
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 08:55:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458gHs2CWhzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:55:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="b5czmhY9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458gGM0SJjzDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 16:54:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458gGG31zHz9v2C7;
 Thu, 23 May 2019 08:54:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=b5czmhY9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sXWhCKzIm3Ok; Thu, 23 May 2019 08:54:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458gGG1rzGz9v2By;
 Thu, 23 May 2019 08:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558594454; bh=s/0qOfM4Cscsf5U/dbKG8fcNN0atFD4/cWnRCbh6PDw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=b5czmhY9iGhGsbJ03OHxeREVJn/XcniinN+G4e+jMw6pPxslXAhnaROXUbdNmE9G4
 6H0+/agMaD4yYwgse634XOE7NqC97NzZTRaQkWynmzxxehol/m3YiMmJ8DctmBdOb0
 WjlUUcptLeJ3FJxVCx28ObZj2ArEhcR7/CEOj3LE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 37B2C8B77D;
 Thu, 23 May 2019 08:54:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qsNF3mH3L8eW; Thu, 23 May 2019 08:54:15 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF4478B75A;
 Thu, 23 May 2019 08:54:14 +0200 (CEST)
Subject: Re: [PATCH] powerpc/32s: Include <linux/moduleloader.h> header file
 to fix a warning
To: Mathieu Malaterre <malat@debian.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190523064956.29008-1-malat@debian.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <14b3a3c9-acbd-67b4-9187-912bb1be887f@c-s.fr>
Date: Thu, 23 May 2019 08:54:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523064956.29008-1-malat@debian.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/05/2019 à 08:49, Mathieu Malaterre a écrit :
> In commit 2edb16efc899 ("powerpc/32: Add KASAN support") support for
> KASAN has been added. However building it as module leads to (warning
> treated as error with W=1):
> 
>    arch/powerpc/mm/kasan/kasan_init_32.c:135:7: error: no previous prototype for 'module_alloc' [-Werror=missing-prototypes]
> 
> Make sure to include <linux/moduleloader.h> to provide the following
> prototype: module_alloc.
> 
> Signed-off-by: Mathieu Malaterre <malat@debian.org>

Fixes: 2edb16efc899 ("powerpc/32: Add KASAN support")
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/mm/kasan/kasan_init_32.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
> index 0d62be3cba47..0c31e440d094 100644
> --- a/arch/powerpc/mm/kasan/kasan_init_32.c
> +++ b/arch/powerpc/mm/kasan/kasan_init_32.c
> @@ -7,6 +7,7 @@
>   #include <linux/memblock.h>
>   #include <linux/sched/task.h>
>   #include <linux/vmalloc.h>
> +#include <linux/moduleloader.h>
>   #include <asm/pgalloc.h>
>   #include <asm/code-patching.h>
>   #include <mm/mmu_decl.h>
> 
