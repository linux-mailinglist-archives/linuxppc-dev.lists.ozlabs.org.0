Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C6E9A67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:52:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4734zp0XtZzF42k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 21:52:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cIOSJZ+p"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4734xY59Q9zF3WV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 21:50:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4734xS2QKVz9vC12;
 Wed, 30 Oct 2019 11:50:52 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cIOSJZ+p; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id C5E8cMKl0Hpk; Wed, 30 Oct 2019 11:50:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4734xS1MC8z9tyjM;
 Wed, 30 Oct 2019 11:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572432652; bh=yUF2yaRPDVt2MHQzuOd+5u8GS8OOZX8ob6V4sZYv3T8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cIOSJZ+pZAZWHOzkDLlgrmQ+931Y5RSXG+7R/vb9ZS335oBTpGfI+B5occqw4GVug
 I4zSE7RoIlqWzDcHogHfXQuGRoNNOCgobcFwuDY8ZJ6GTgyelHgI5abDWX7mdF9cIZ
 U9bvG6ippiZFIITdnFAj2p2/GRafJ8CgbcnzpKcw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 19F978B875;
 Wed, 30 Oct 2019 11:50:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zdibLVy7pdhC; Wed, 30 Oct 2019 11:50:53 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D6088B7C7;
 Wed, 30 Oct 2019 11:50:50 +0100 (CET)
Subject: Re: [PATCH v2 17/23] soc: fsl: qe: make qe_ic_cascade_* static
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-18-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1d12e0d1-a873-d841-6e73-22ec1d09c268@c-s.fr>
Date: Wed, 30 Oct 2019 11:50:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025124058.22580-18-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>,
 Valentin Longchamp <valentin.longchamp@keymile.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/10/2019 à 14:40, Rasmus Villemoes a écrit :
> Now that the references from arch/powerpc/ are gone, these are only
> referenced from inside qe_ic.c, so make them static.

Why do that in two steps ?
I think patch 9 could remain until here, and then you could squash patch 
9 and patch 17 together here.

Christophe

> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   drivers/soc/fsl/qe/qe_ic.c | 6 +++---
>   include/soc/fsl/qe/qe_ic.h | 4 ----
>   2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 545eb67094d1..e20f1205c0df 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -402,7 +402,7 @@ unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
>   	return irq_linear_revmap(qe_ic->irqhost, irq);
>   }
>   
> -void qe_ic_cascade_low(struct irq_desc *desc)
> +static void qe_ic_cascade_low(struct irq_desc *desc)
>   {
>   	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
>   	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
> @@ -415,7 +415,7 @@ void qe_ic_cascade_low(struct irq_desc *desc)
>   		chip->irq_eoi(&desc->irq_data);
>   }
>   
> -void qe_ic_cascade_high(struct irq_desc *desc)
> +static void qe_ic_cascade_high(struct irq_desc *desc)
>   {
>   	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
>   	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
> @@ -428,7 +428,7 @@ void qe_ic_cascade_high(struct irq_desc *desc)
>   		chip->irq_eoi(&desc->irq_data);
>   }
>   
> -void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
> +static void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
>   {
>   	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
>   	unsigned int cascade_irq;
> diff --git a/include/soc/fsl/qe/qe_ic.h b/include/soc/fsl/qe/qe_ic.h
> index 8ec21a3bd859..43e4ce95c6a0 100644
> --- a/include/soc/fsl/qe/qe_ic.h
> +++ b/include/soc/fsl/qe/qe_ic.h
> @@ -67,8 +67,4 @@ void qe_ic_set_highest_priority(unsigned int virq, int high);
>   int qe_ic_set_priority(unsigned int virq, unsigned int priority);
>   int qe_ic_set_high_priority(unsigned int virq, unsigned int priority, int high);
>   
> -void qe_ic_cascade_low(struct irq_desc *desc);
> -void qe_ic_cascade_high(struct irq_desc *desc);
> -void qe_ic_cascade_muxed_mpic(struct irq_desc *desc);
> -
>   #endif /* _ASM_POWERPC_QE_IC_H */
> 
