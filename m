Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE18933EA56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 08:01:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0h045jGwz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 18:01:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0gzl1zmmz30Dt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 18:01:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0gzb65jfz9vBn3;
 Wed, 17 Mar 2021 08:00:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id arCS8u5r8lUa; Wed, 17 Mar 2021 08:00:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0gzb4LkTz9vBn2;
 Wed, 17 Mar 2021 08:00:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 764C98B819;
 Wed, 17 Mar 2021 08:01:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TI4ffKCC1lw8; Wed, 17 Mar 2021 08:01:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 173228B81B;
 Wed, 17 Mar 2021 08:01:00 +0100 (CET)
Subject: Re: [PATCH] sched: replace if (cond) BUG() with BUG_ON()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, jk@ozlabs.org
References: <1615963510-89830-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <188541f6-e047-0dfd-8f57-edfce5fae49b@csgroup.eu>
Date: Wed, 17 Mar 2021 08:00:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1615963510-89830-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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



Le 17/03/2021 à 07:45, Jiapeng Chong a écrit :
> Fix the following coccicheck warnings:
> 
> ./arch/powerpc/platforms/cell/spufs/sched.c:908:2-5: WARNING: Use BUG_ON
> instead of if condition followed by BUG.

Consider using WARN_ON() instead of BUG_ON() if relevant. If not, explain in the commit message why 
we need to keep a BUG_ON().

See https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on


> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   arch/powerpc/platforms/cell/spufs/sched.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
> index 3692064..139a6ec 100644
> --- a/arch/powerpc/platforms/cell/spufs/sched.c
> +++ b/arch/powerpc/platforms/cell/spufs/sched.c
> @@ -904,8 +904,7 @@ static noinline void spusched_tick(struct spu_context *ctx)
>   	struct spu_context *new = NULL;
>   	struct spu *spu = NULL;
>   
> -	if (spu_acquire(ctx))
> -		BUG();	/* a kernel thread never has signals pending */
> +	BUG_ON(spu_acquire(ctx));	/* a kernel thread never has signals pending */
>   
>   	if (ctx->state != SPU_STATE_RUNNABLE)
>   		goto out;
> 
