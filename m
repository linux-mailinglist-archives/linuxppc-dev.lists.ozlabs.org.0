Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 920EBE9A54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:47:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4734sn65rkzF41x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 21:47:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="IF1kk/S9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4734qR4mdrzF41Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 21:45:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4734qL1h7cz9vC0r;
 Wed, 30 Oct 2019 11:45:34 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IF1kk/S9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RKPDgr6MaFYQ; Wed, 30 Oct 2019 11:45:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4734qL0cgqz9vC0q;
 Wed, 30 Oct 2019 11:45:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572432334; bh=ldw9WUgmvPJSr0yqobCGkdD8WgYCJ83JuIM2Zc0dqTc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IF1kk/S9aewyTgTqFIvoD/cCPMgynwOcooIsZlNEKD4i5AsCVo2kQzfnPEuMaYd58
 skGXIRVEm0Diy5eW0JoSWYE1FYReNLhQWiSxAiiz/qKkW6ThLRH/EqczlF22hawOck
 L3ea7nQRw5B+cWk5/dFW6Onwwn7dQRC4k+cJrBAU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C5BDD8B7AF;
 Wed, 30 Oct 2019 11:45:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6ZJvPf1P5Mu6; Wed, 30 Oct 2019 11:45:34 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34E9E8B7C8;
 Wed, 30 Oct 2019 11:45:32 +0100 (CET)
Subject: Re: [PATCH v2 09/23] soc: fsl: qe: move qe_ic_cascade_* functions to
 qe_ic.c
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-10-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b01b12fc-88a5-8bc9-5a48-e35ad75b49d9@c-s.fr>
Date: Wed, 30 Oct 2019 11:45:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025124058.22580-10-linux@rasmusvillemoes.dk>
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
> These functions are only ever called through a function pointer, and
> therefore it makes no sense for them to be "static inline" - gcc has
> no choice but to emit a copy in each translation unit that takes the
> address of one of these (currently various platform code under
> arch/powerpc/). So move them into qe_ic.c and leave ordinary extern
> declarations in the header file.

What is the point in moving fonctions that you will drop in the next 
patch (qe_ic_cascade_low_ipic() and qe_ic_cascade_high_ipic())
Only move the ones that will remain.

Christophe


> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   drivers/soc/fsl/qe/qe_ic.c | 58 +++++++++++++++++++++++++++++++++++
>   include/soc/fsl/qe/qe_ic.h | 62 +++-----------------------------------
>   2 files changed, 63 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 7b1870d2866a..a847b2672e90 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -402,6 +402,64 @@ unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
>   	return irq_linear_revmap(qe_ic->irqhost, irq);
>   }
>   
> +void qe_ic_cascade_low_ipic(struct irq_desc *desc)
> +{
> +	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> +	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
> +
> +	if (cascade_irq != NO_IRQ)
> +		generic_handle_irq(cascade_irq);
> +}
> +
> +void qe_ic_cascade_high_ipic(struct irq_desc *desc)
> +{
> +	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> +	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
> +
> +	if (cascade_irq != NO_IRQ)
> +		generic_handle_irq(cascade_irq);
> +}
> +
> +void qe_ic_cascade_low_mpic(struct irq_desc *desc)
> +{
> +	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> +	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +
> +	if (cascade_irq != NO_IRQ)
> +		generic_handle_irq(cascade_irq);
> +
> +	chip->irq_eoi(&desc->irq_data);
> +}
> +
> +void qe_ic_cascade_high_mpic(struct irq_desc *desc)
> +{
> +	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> +	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +
> +	if (cascade_irq != NO_IRQ)
> +		generic_handle_irq(cascade_irq);
> +
> +	chip->irq_eoi(&desc->irq_data);
> +}
> +
> +void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
> +{
> +	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> +	unsigned int cascade_irq;
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +
> +	cascade_irq = qe_ic_get_high_irq(qe_ic);
> +	if (cascade_irq == NO_IRQ)
> +		cascade_irq = qe_ic_get_low_irq(qe_ic);
> +
> +	if (cascade_irq != NO_IRQ)
> +		generic_handle_irq(cascade_irq);
> +
> +	chip->irq_eoi(&desc->irq_data);
> +}
> +
>   void __init qe_ic_init(struct device_node *node, unsigned int flags,
>   		       void (*low_handler)(struct irq_desc *desc),
>   		       void (*high_handler)(struct irq_desc *desc))
> diff --git a/include/soc/fsl/qe/qe_ic.h b/include/soc/fsl/qe/qe_ic.h
> index 714a9b890d8d..f3492eb13052 100644
> --- a/include/soc/fsl/qe/qe_ic.h
> +++ b/include/soc/fsl/qe/qe_ic.h
> @@ -74,62 +74,10 @@ void qe_ic_set_highest_priority(unsigned int virq, int high);
>   int qe_ic_set_priority(unsigned int virq, unsigned int priority);
>   int qe_ic_set_high_priority(unsigned int virq, unsigned int priority, int high);
>   
> -static inline void qe_ic_cascade_low_ipic(struct irq_desc *desc)
> -{
> -	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> -	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
> -
> -	if (cascade_irq != NO_IRQ)
> -		generic_handle_irq(cascade_irq);
> -}
> -
> -static inline void qe_ic_cascade_high_ipic(struct irq_desc *desc)
> -{
> -	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> -	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
> -
> -	if (cascade_irq != NO_IRQ)
> -		generic_handle_irq(cascade_irq);
> -}
> -
> -static inline void qe_ic_cascade_low_mpic(struct irq_desc *desc)
> -{
> -	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> -	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
> -	struct irq_chip *chip = irq_desc_get_chip(desc);
> -
> -	if (cascade_irq != NO_IRQ)
> -		generic_handle_irq(cascade_irq);
> -
> -	chip->irq_eoi(&desc->irq_data);
> -}
> -
> -static inline void qe_ic_cascade_high_mpic(struct irq_desc *desc)
> -{
> -	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> -	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
> -	struct irq_chip *chip = irq_desc_get_chip(desc);
> -
> -	if (cascade_irq != NO_IRQ)
> -		generic_handle_irq(cascade_irq);
> -
> -	chip->irq_eoi(&desc->irq_data);
> -}
> -
> -static inline void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
> -{
> -	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
> -	unsigned int cascade_irq;
> -	struct irq_chip *chip = irq_desc_get_chip(desc);
> -
> -	cascade_irq = qe_ic_get_high_irq(qe_ic);
> -	if (cascade_irq == NO_IRQ)
> -		cascade_irq = qe_ic_get_low_irq(qe_ic);
> -
> -	if (cascade_irq != NO_IRQ)
> -		generic_handle_irq(cascade_irq);
> -
> -	chip->irq_eoi(&desc->irq_data);
> -}
> +void qe_ic_cascade_low_ipic(struct irq_desc *desc);
> +void qe_ic_cascade_high_ipic(struct irq_desc *desc);
> +void qe_ic_cascade_low_mpic(struct irq_desc *desc);
> +void qe_ic_cascade_high_mpic(struct irq_desc *desc);
> +void qe_ic_cascade_muxed_mpic(struct irq_desc *desc);
>   
>   #endif /* _ASM_POWERPC_QE_IC_H */
> 
