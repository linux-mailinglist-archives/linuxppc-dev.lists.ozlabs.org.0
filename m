Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74157E9A58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:49:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4734w94RvnzF42R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 21:49:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cf/sRWCL"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4734sj0TVTzF42N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 21:47:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4734sb4Nwyz9vC0x;
 Wed, 30 Oct 2019 11:47:31 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cf/sRWCL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id K1eOxTCv4zt3; Wed, 30 Oct 2019 11:47:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4734sb3BvNz9vC0r;
 Wed, 30 Oct 2019 11:47:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572432451; bh=SGVReNGqqSUpz15YxJR2cgUBOngJFQtsEfn+NoTBckE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cf/sRWCLAZ8cBsbgNEc18qSqmsqxsnYWkA0ULkAfRxxrlrHWHYUBivisNIPFS2q4p
 nAp83AXqoauLgS8OT1FPLHrrbjpqFoCZiCwvlCm8pFXQhJmjC0EaIxMwiUc1QPSvNp
 beDe1dQLCIPXzlnHBSPaDZ5lRkzmNqC4A/uIs4Fw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BD878B7C8;
 Wed, 30 Oct 2019 11:47:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id f1h9Jfj79tSU; Wed, 30 Oct 2019 11:47:31 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F24C8B7C7;
 Wed, 30 Oct 2019 11:47:29 +0100 (CET)
Subject: Re: [PATCH v2 11/23] soc: fsl: qe: rename qe_ic_cascade_low_mpic ->
 qe_ic_cascade_low
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-12-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <caa85681-71a3-460b-d89d-4b73daac965b@c-s.fr>
Date: Wed, 30 Oct 2019 11:47:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025124058.22580-12-linux@rasmusvillemoes.dk>
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
> The qe_ic_cascade_{low,high}_mpic functions are now used as handlers
> both when the interrupt parent is mpic as well as ipic, so remove the
> _mpic suffix.

Here you are modifying code that you drop in patch 14. That's pointless. 
You should perform name change after patch 14.

Christophe

> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   arch/powerpc/platforms/83xx/misc.c            | 2 +-
>   arch/powerpc/platforms/85xx/corenet_generic.c | 4 ++--
>   arch/powerpc/platforms/85xx/mpc85xx_mds.c     | 4 ++--
>   arch/powerpc/platforms/85xx/mpc85xx_rdb.c     | 4 ++--
>   arch/powerpc/platforms/85xx/twr_p102x.c       | 4 ++--
>   drivers/soc/fsl/qe/qe_ic.c                    | 4 ++--
>   include/soc/fsl/qe/qe_ic.h                    | 4 ++--
>   7 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
> index 779791c0570f..835d082218ae 100644
> --- a/arch/powerpc/platforms/83xx/misc.c
> +++ b/arch/powerpc/platforms/83xx/misc.c
> @@ -100,7 +100,7 @@ void __init mpc83xx_qe_init_IRQ(void)
>   		if (!np)
>   			return;
>   	}
> -	qe_ic_init(np, 0, qe_ic_cascade_low_mpic, qe_ic_cascade_high_mpic);
> +	qe_ic_init(np, 0, qe_ic_cascade_low, qe_ic_cascade_high);
>   	of_node_put(np);
>   }
>   
> diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
> index 7ee2c6628f64..2ed9e84ca03a 100644
> --- a/arch/powerpc/platforms/85xx/corenet_generic.c
> +++ b/arch/powerpc/platforms/85xx/corenet_generic.c
> @@ -50,8 +50,8 @@ void __init corenet_gen_pic_init(void)
>   
>   	np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
>   	if (np) {
> -		qe_ic_init(np, 0, qe_ic_cascade_low_mpic,
> -				qe_ic_cascade_high_mpic);
> +		qe_ic_init(np, 0, qe_ic_cascade_low,
> +				qe_ic_cascade_high);
>   		of_node_put(np);
>   	}
>   }
> diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
> index 5ca254256c47..24211a1787b2 100644
> --- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
> +++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
> @@ -288,8 +288,8 @@ static void __init mpc85xx_mds_qeic_init(void)
>   	}
>   
>   	if (machine_is(p1021_mds))
> -		qe_ic_init(np, 0, qe_ic_cascade_low_mpic,
> -				qe_ic_cascade_high_mpic);
> +		qe_ic_init(np, 0, qe_ic_cascade_low,
> +				qe_ic_cascade_high);
>   	else
>   		qe_ic_init(np, 0, qe_ic_cascade_muxed_mpic, NULL);
>   	of_node_put(np);
> diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> index d3c540ee558f..093867879081 100644
> --- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> +++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> @@ -66,8 +66,8 @@ void __init mpc85xx_rdb_pic_init(void)
>   #ifdef CONFIG_QUICC_ENGINE
>   	np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
>   	if (np) {
> -		qe_ic_init(np, 0, qe_ic_cascade_low_mpic,
> -				qe_ic_cascade_high_mpic);
> +		qe_ic_init(np, 0, qe_ic_cascade_low,
> +				qe_ic_cascade_high);
>   		of_node_put(np);
>   
>   	} else
> diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
> index 720b0c0f03ba..2e0fb23854c0 100644
> --- a/arch/powerpc/platforms/85xx/twr_p102x.c
> +++ b/arch/powerpc/platforms/85xx/twr_p102x.c
> @@ -45,8 +45,8 @@ static void __init twr_p1025_pic_init(void)
>   #ifdef CONFIG_QUICC_ENGINE
>   	np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
>   	if (np) {
> -		qe_ic_init(np, 0, qe_ic_cascade_low_mpic,
> -				qe_ic_cascade_high_mpic);
> +		qe_ic_init(np, 0, qe_ic_cascade_low,
> +				qe_ic_cascade_high);
>   		of_node_put(np);
>   	} else
>   		pr_err("Could not find qe-ic node\n");
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 0ff802816c0c..f3659c312e13 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -402,7 +402,7 @@ unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
>   	return irq_linear_revmap(qe_ic->irqhost, irq);
>   }
>   
> -void qe_ic_cascade_low_mpic(struct irq_desc *desc)
> +void qe_ic_cascade_low(struct irq_desc *desc)
>   {
>   	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
>   	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
> @@ -415,7 +415,7 @@ void qe_ic_cascade_low_mpic(struct irq_desc *desc)
>   		chip->irq_eoi(&desc->irq_data);
>   }
>   
> -void qe_ic_cascade_high_mpic(struct irq_desc *desc)
> +void qe_ic_cascade_high(struct irq_desc *desc)
>   {
>   	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
>   	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
> diff --git a/include/soc/fsl/qe/qe_ic.h b/include/soc/fsl/qe/qe_ic.h
> index fb10a7606acc..3c8220cedd9a 100644
> --- a/include/soc/fsl/qe/qe_ic.h
> +++ b/include/soc/fsl/qe/qe_ic.h
> @@ -74,8 +74,8 @@ void qe_ic_set_highest_priority(unsigned int virq, int high);
>   int qe_ic_set_priority(unsigned int virq, unsigned int priority);
>   int qe_ic_set_high_priority(unsigned int virq, unsigned int priority, int high);
>   
> -void qe_ic_cascade_low_mpic(struct irq_desc *desc);
> -void qe_ic_cascade_high_mpic(struct irq_desc *desc);
> +void qe_ic_cascade_low(struct irq_desc *desc);
> +void qe_ic_cascade_high(struct irq_desc *desc);
>   void qe_ic_cascade_muxed_mpic(struct irq_desc *desc);
>   
>   #endif /* _ASM_POWERPC_QE_IC_H */
> 
