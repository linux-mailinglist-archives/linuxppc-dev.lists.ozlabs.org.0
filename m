Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719243ED374
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 13:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpCNL2dpyz3bmd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 21:58:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpCMr42J8z30Hx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 21:57:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GpCMj3cPpz9sTy;
 Mon, 16 Aug 2021 13:57:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIHC1e0M3SAo; Mon, 16 Aug 2021 13:57:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GpCMj2cRlz9sTd;
 Mon, 16 Aug 2021 13:57:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36DE48B796;
 Mon, 16 Aug 2021 13:57:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zvj6u5B11xyV; Mon, 16 Aug 2021 13:57:37 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 09CF88B788;
 Mon, 16 Aug 2021 13:57:37 +0200 (CEST)
Subject: Re: [PATCH linux-next] module: remove duplicate include in interrupt.c
To: cgel.zte@gmail.com, mpe@ellerman.id.au
References: <20210816113453.126939-1-lv.ruyi@zte.com.cn>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7bf73aea-5758-63e1-ac69-156a2ffecf2c@csgroup.eu>
Date: Mon, 16 Aug 2021 13:57:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816113453.126939-1-lv.ruyi@zte.com.cn>
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
Cc: Lv Ruyi <lv.ruyi@zte.com.cn>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/08/2021 à 13:34, cgel.zte@gmail.com a écrit :
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> 'asm/interrupt.h' included in 'interrupt.c' is duplicated.

This patch has been submitted at least half a dozen of times already.

You should maintain alphabetic order in the include list.

But please don't post it again, we have it in the pipe already, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1624329437-84730-1-git-send-email-jiapeng.chong@linux.alibaba.com/

Next time please check at https://patchwork.ozlabs.org/project/linuxppc-dev/list/ before submitting 
a new patch.

Thanks
Christophe

> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>   arch/powerpc/kernel/interrupt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 21bbd615ca41..8a936515e4e4 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -10,7 +10,6 @@
>   #include <asm/cputime.h>
>   #include <asm/interrupt.h>
>   #include <asm/hw_irq.h>
> -#include <asm/interrupt.h>
>   #include <asm/kprobes.h>
>   #include <asm/paca.h>
>   #include <asm/ptrace.h>
> 
