Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266B3B91DD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 14:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFyv90RT5z3bP2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 22:58:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFytq0RxXz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 22:58:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GFytj08T5zB9np;
 Thu,  1 Jul 2021 14:58:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3Q4u9vNdjG6; Thu,  1 Jul 2021 14:58:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GFytg6LvnzB9pC;
 Thu,  1 Jul 2021 14:58:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C88098B903;
 Thu,  1 Jul 2021 14:58:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uOkqtDmpu2rb; Thu,  1 Jul 2021 14:58:03 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62FDB8B961;
 Thu,  1 Jul 2021 14:58:03 +0200 (CEST)
Subject: Re: [PATCH] sched: Use WARN_ON
To: Jason Wang <wangborong@cdjrlc.com>, jk@ozlabs.org
References: <20210701125046.43018-1-wangborong@cdjrlc.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f72d43b9-88a1-19f0-c6ca-87fd7a01f379@csgroup.eu>
Date: Thu, 1 Jul 2021 14:57:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701125046.43018-1-wangborong@cdjrlc.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/07/2021 à 14:50, Jason Wang a écrit :
> The BUG_ON macro simplifies the if condition followed by BUG, but it
> will lead to the kernel crashing. Therefore, we can try using WARN_ON
> instead of if condition followed by BUG.

But are you sure it is ok to continue if spu_acquire(ctx) returned false ?
Shouldn't there be at least for fallback handling ?

Something like:

	if (WARN_ON(spu_acquire(ctx)))
		return;


Christophe


> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>   arch/powerpc/platforms/cell/spufs/sched.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
> index 369206489895..0f218d9e5733 100644
> --- a/arch/powerpc/platforms/cell/spufs/sched.c
> +++ b/arch/powerpc/platforms/cell/spufs/sched.c
> @@ -904,8 +904,8 @@ static noinline void spusched_tick(struct spu_context *ctx)
>   	struct spu_context *new = NULL;
>   	struct spu *spu = NULL;
>   
> -	if (spu_acquire(ctx))
> -		BUG();	/* a kernel thread never has signals pending */
> +	/* a kernel thread never has signals pending */
> +	WARN_ON(spu_acquire(ctx));
>   
>   	if (ctx->state != SPU_STATE_RUNNABLE)
>   		goto out;
> 
