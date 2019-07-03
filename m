Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B502F5E56A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 15:26:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f21f18VszDqKh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Cc7c7iey"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f1sz1GsszDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 23:19:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45f1sn4cdnz9v01x;
 Wed,  3 Jul 2019 15:19:25 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Cc7c7iey; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zOalVqxx5uRw; Wed,  3 Jul 2019 15:19:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45f1sn3b62z9v01w;
 Wed,  3 Jul 2019 15:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562159965; bh=lh03SiMTXDB9kYjUCArwWbtvnoP0VQ3+8H0ObHrYEmA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Cc7c7ieyDxvj43rPPEUjaRF+pbzbGG8S5qzI3a/7zaV43cnz3lPFtnnnH44KKNLpl
 4nk1r9qVOgaIOPQHXOVNsNe19+rKZCeoujEscx0NqZTukGD6NlZRvk+Tb1S1uhDA+5
 ohHyJfToeSWAaGEQjYorjyiAr2BM0m1f2FPZ9wrY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC77C8B815;
 Wed,  3 Jul 2019 15:19:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ssm5YARw6vJA; Wed,  3 Jul 2019 15:19:26 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DAF98B811;
 Wed,  3 Jul 2019 15:19:26 +0200 (CEST)
Subject: Re: [PATCH 02/30] powerpc: Use kmemdup rather than duplicating its
 implementation
To: Fuqian Huang <huangfq.daxian@gmail.com>
References: <20190703131327.24762-1-huangfq.daxian@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <80d073af-f7b5-6c9d-de51-110f14d15380@c-s.fr>
Date: Wed, 3 Jul 2019 15:19:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703131327.24762-1-huangfq.daxian@gmail.com>
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



Le 03/07/2019 à 15:13, Fuqian Huang a écrit :
> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memset, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

s/memset/memcpy/

> 
> Add an allocation failure check.

Shouldn't this be in another patch ?

Christophe

> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/dlpar.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> index 437a74173db2..20fe7b79e09e 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -383,9 +383,10 @@ void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog)
>   	struct pseries_hp_work *work;
>   	struct pseries_hp_errorlog *hp_errlog_copy;
>   
> -	hp_errlog_copy = kmalloc(sizeof(struct pseries_hp_errorlog),
> +	hp_errlog_copy = kmemdup(hp_errlog, sizeof(struct pseries_hp_errorlog),
>   				 GFP_KERNEL);
> -	memcpy(hp_errlog_copy, hp_errlog, sizeof(struct pseries_hp_errorlog));
> +	if (!hp_errlog_copy)
> +		return;
>   
>   	work = kmalloc(sizeof(struct pseries_hp_work), GFP_KERNEL);
>   	if (work) {
> 
