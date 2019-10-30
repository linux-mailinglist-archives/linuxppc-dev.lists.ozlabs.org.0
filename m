Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89367E99F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:27:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4734QN5hqszF3x1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 21:27:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="nljnVkQa"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4734Lk4pB7zF3xr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 21:24:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4734Ld313bz9vC0Y;
 Wed, 30 Oct 2019 11:24:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nljnVkQa; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VO0eJu24sHJd; Wed, 30 Oct 2019 11:24:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4734Ld1r3Qz9vC0C;
 Wed, 30 Oct 2019 11:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572431049; bh=ACqajUDrFNpwcC+AioRIkBdQ0r2pymgCUimnqSpGHQg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nljnVkQa52uPHLLWTFzaQqomoLVUelys6slJi1kyplTKQ9WqNf/IluGEQ3z2q3kTm
 /Hl8b8knPwTuMVdKX1+NWBlAVUbHmhSFz0ym8cmY+Eg8wu5dM08fyjlyuzGyLt4bx/
 dVTxTEdrz1lKfrPzahBqILlmdH6Ac7V9AqkbXzoA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5904B8B7C0;
 Wed, 30 Oct 2019 11:24:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RF5ZI91XcOtS; Wed, 30 Oct 2019 11:24:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B18758B7AF;
 Wed, 30 Oct 2019 11:24:09 +0100 (CET)
Subject: Re: [PATCH v2 07/23] soc: fsl: qe: merge qe_ic.h into qe_ic.c
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-8-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7837553d-4247-7166-8625-77483bfb641d@c-s.fr>
Date: Wed, 30 Oct 2019 11:24:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025124058.22580-8-linux@rasmusvillemoes.dk>
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
> The local qe_ic.h header is only used by qe_ic.c, so merge its
> contents into the .c file. This is preparation for moving the driver
> to drivers/irqchip/. It also avoids confusion between this header and
> the one at include/soc/fsl/qe/qe_ic.h, which is included from a number
> of places (qe_ic.c among others).
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   drivers/soc/fsl/qe/qe_ic.c |  91 ++++++++++++++++++++++++++++++-
>   drivers/soc/fsl/qe/qe_ic.h | 108 -------------------------------------
>   2 files changed, 90 insertions(+), 109 deletions(-)
>   delete mode 100644 drivers/soc/fsl/qe/qe_ic.h
> 
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index d420492b4c23..7b1870d2866a 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -26,7 +26,96 @@
>   #include <asm/io.h>
>   #include <soc/fsl/qe/qe_ic.h>
>   
> -#include "qe_ic.h"
> +#define NR_QE_IC_INTS		64
> +
> +/* QE IC registers offset */
> +#define QEIC_CICR		0x00
> +#define QEIC_CIVEC		0x04
> +#define QEIC_CRIPNR		0x08
> +#define QEIC_CIPNR		0x0c
> +#define QEIC_CIPXCC		0x10
> +#define QEIC_CIPYCC		0x14
> +#define QEIC_CIPWCC		0x18
> +#define QEIC_CIPZCC		0x1c
> +#define QEIC_CIMR		0x20
> +#define QEIC_CRIMR		0x24
> +#define QEIC_CICNR		0x28
> +#define QEIC_CIPRTA		0x30
> +#define QEIC_CIPRTB		0x34
> +#define QEIC_CRICR		0x3c
> +#define QEIC_CHIVEC		0x60
> +
> +/* Interrupt priority registers */
> +#define CIPCC_SHIFT_PRI0	29
> +#define CIPCC_SHIFT_PRI1	26
> +#define CIPCC_SHIFT_PRI2	23
> +#define CIPCC_SHIFT_PRI3	20
> +#define CIPCC_SHIFT_PRI4	13
> +#define CIPCC_SHIFT_PRI5	10
> +#define CIPCC_SHIFT_PRI6	7
> +#define CIPCC_SHIFT_PRI7	4

I think you should drop all unused consts and only keep the ones that 
are used.

> +
> +/* CICR priority modes */
> +#define CICR_GWCC		0x00040000
> +#define CICR_GXCC		0x00020000
> +#define CICR_GYCC		0x00010000
> +#define CICR_GZCC		0x00080000
> +#define CICR_GRTA		0x00200000
> +#define CICR_GRTB		0x00400000
> +#define CICR_HPIT_SHIFT		8
> +#define CICR_HPIT_MASK		0x00000300
> +#define CICR_HP_SHIFT		24
> +#define CICR_HP_MASK		0x3f000000
> +
> +/* CICNR */
> +#define CICNR_WCC1T_SHIFT	20
> +#define CICNR_ZCC1T_SHIFT	28
> +#define CICNR_YCC1T_SHIFT	12
> +#define CICNR_XCC1T_SHIFT	4

Same here

> +
> +/* CRICR */
> +#define CRICR_RTA1T_SHIFT	20
> +#define CRICR_RTB1T_SHIFT	28

Same


> +
> +/* Signal indicator */
> +#define SIGNAL_MASK		3
> +#define SIGNAL_HIGH		2
> +#define SIGNAL_LOW		0

Only SIGNAL_HIGH seems to be used.

Christophe

> +
> +struct qe_ic {
> +	/* Control registers offset */
> +	u32 __iomem *regs;
> +
> +	/* The remapper for this QEIC */
> +	struct irq_domain *irqhost;
> +
> +	/* The "linux" controller struct */
> +	struct irq_chip hc_irq;
> +
> +	/* VIRQ numbers of QE high/low irqs */
> +	unsigned int virq_high;
> +	unsigned int virq_low;
> +};
> +
> +/*
> + * QE interrupt controller internal structure
> + */
> +struct qe_ic_info {
> +	/* Location of this source at the QIMR register */
> +	u32	mask;
> +
> +	/* Mask register offset */
> +	u32	mask_reg;
> +
> +	/*
> +	 * For grouped interrupts sources - the interrupt code as
> +	 * appears at the group priority register
> +	 */
> +	u8	pri_code;
> +
> +	/* Group priority register offset */
> +	u32	pri_reg;
> +};
>   
>   static DEFINE_RAW_SPINLOCK(qe_ic_lock);
>   
> diff --git a/drivers/soc/fsl/qe/qe_ic.h b/drivers/soc/fsl/qe/qe_ic.h
> deleted file mode 100644
> index 29b4d768e4a8..000000000000
> --- a/drivers/soc/fsl/qe/qe_ic.h
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * drivers/soc/fsl/qe/qe_ic.h
> - *
> - * QUICC ENGINE Interrupt Controller Header
> - *
> - * Copyright (C) 2006 Freescale Semiconductor, Inc. All rights reserved.
> - *
> - * Author: Li Yang <leoli@freescale.com>
> - * Based on code from Shlomi Gridish <gridish@freescale.com>
> - */
> -#ifndef _POWERPC_SYSDEV_QE_IC_H
> -#define _POWERPC_SYSDEV_QE_IC_H
> -
> -#include <soc/fsl/qe/qe_ic.h>
> -
> -#define NR_QE_IC_INTS		64
> -
> -/* QE IC registers offset */
> -#define QEIC_CICR		0x00
> -#define QEIC_CIVEC		0x04
> -#define QEIC_CRIPNR		0x08
> -#define QEIC_CIPNR		0x0c
> -#define QEIC_CIPXCC		0x10
> -#define QEIC_CIPYCC		0x14
> -#define QEIC_CIPWCC		0x18
> -#define QEIC_CIPZCC		0x1c
> -#define QEIC_CIMR		0x20
> -#define QEIC_CRIMR		0x24
> -#define QEIC_CICNR		0x28
> -#define QEIC_CIPRTA		0x30
> -#define QEIC_CIPRTB		0x34
> -#define QEIC_CRICR		0x3c
> -#define QEIC_CHIVEC		0x60
> -
> -/* Interrupt priority registers */
> -#define CIPCC_SHIFT_PRI0	29
> -#define CIPCC_SHIFT_PRI1	26
> -#define CIPCC_SHIFT_PRI2	23
> -#define CIPCC_SHIFT_PRI3	20
> -#define CIPCC_SHIFT_PRI4	13
> -#define CIPCC_SHIFT_PRI5	10
> -#define CIPCC_SHIFT_PRI6	7
> -#define CIPCC_SHIFT_PRI7	4
> -
> -/* CICR priority modes */
> -#define CICR_GWCC		0x00040000
> -#define CICR_GXCC		0x00020000
> -#define CICR_GYCC		0x00010000
> -#define CICR_GZCC		0x00080000
> -#define CICR_GRTA		0x00200000
> -#define CICR_GRTB		0x00400000
> -#define CICR_HPIT_SHIFT		8
> -#define CICR_HPIT_MASK		0x00000300
> -#define CICR_HP_SHIFT		24
> -#define CICR_HP_MASK		0x3f000000
> -
> -/* CICNR */
> -#define CICNR_WCC1T_SHIFT	20
> -#define CICNR_ZCC1T_SHIFT	28
> -#define CICNR_YCC1T_SHIFT	12
> -#define CICNR_XCC1T_SHIFT	4
> -
> -/* CRICR */
> -#define CRICR_RTA1T_SHIFT	20
> -#define CRICR_RTB1T_SHIFT	28
> -
> -/* Signal indicator */
> -#define SIGNAL_MASK		3
> -#define SIGNAL_HIGH		2
> -#define SIGNAL_LOW		0
> -
> -struct qe_ic {
> -	/* Control registers offset */
> -	u32 __iomem *regs;
> -
> -	/* The remapper for this QEIC */
> -	struct irq_domain *irqhost;
> -
> -	/* The "linux" controller struct */
> -	struct irq_chip hc_irq;
> -
> -	/* VIRQ numbers of QE high/low irqs */
> -	unsigned int virq_high;
> -	unsigned int virq_low;
> -};
> -
> -/*
> - * QE interrupt controller internal structure
> - */
> -struct qe_ic_info {
> -	/* Location of this source at the QIMR register */
> -	u32	mask;
> -
> -	/* Mask register offset */
> -	u32	mask_reg;
> -
> -	/*
> -	 * For grouped interrupts sources - the interrupt code as
> -	 * appears at the group priority register
> -	 */
> -	u8	pri_code;
> -
> -	/* Group priority register offset */
> -	u32	pri_reg;
> -};
> -
> -#endif /* _POWERPC_SYSDEV_QE_IC_H */
> 
