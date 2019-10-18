Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3625DC5EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:24:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vmvd2xCjzDsNk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 00:23:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="V36NPl2g"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vmPp1nZdzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 00:01:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46vmPk1lMZzB09b0;
 Fri, 18 Oct 2019 15:01:30 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=V36NPl2g; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7kP6dKzeFt4q; Fri, 18 Oct 2019 15:01:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46vmPk0gjjzB09Zw;
 Fri, 18 Oct 2019 15:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571403690; bh=I1VMzgDpQacCcFVqFBepaAY9ZdCU2g4skomvficbUgo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V36NPl2ghgYXPsiMJKmq37EE8nFCg3F0wUdkilhhKCYptgtZHVg0yYaXsgcfJB/dw
 XgTxpVCnTzH5bl2NXEdBstoRltcAzsC9WQn81wfpkNh6WEyaK1buqVUWoWaEIxuqYx
 8J8Ie7KRb54AKQutihiVrpv9VXDnAOpxxVgAZARw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0038F8B802;
 Fri, 18 Oct 2019 15:01:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SGZtcWX72nh9; Fri, 18 Oct 2019 15:01:29 +0200 (CEST)
Received: from [192.168.204.43] (unknown [192.168.204.43])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 20E738B800;
 Fri, 18 Oct 2019 15:01:29 +0200 (CEST)
Subject: Re: [PATCH 2/7] soc: fsl: qe: drop volatile qualifier of struct
 qe_ic::regs
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191018125234.21825-3-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <841cd430-4e8b-13fd-1f80-27aef9e1bd11@c-s.fr>
Date: Fri, 18 Oct 2019 15:01:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018125234.21825-3-linux@rasmusvillemoes.dk>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/10/2019 à 14:52, Rasmus Villemoes a écrit :
> The actual io accessors (e.g. in_be32) implicitly add a volatile
> qualifier to their address argument. Remove volatile from the struct
> definition and the qe_ic_(read/write) helpers, in preparation for
> switching from the ppc-specific io accessors to generic ones.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   drivers/soc/fsl/qe/qe_ic.c | 4 ++--
>   drivers/soc/fsl/qe/qe_ic.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 9bac546998d3..9694569dcc76 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -171,12 +171,12 @@ static struct qe_ic_info qe_ic_info[] = {
>   		},
>   };
>   
> -static inline u32 qe_ic_read(volatile __be32  __iomem * base, unsigned int reg)
> +static inline u32 qe_ic_read(__be32  __iomem * base, unsigned int reg)

No space between '*' and 'base' please

>   {
>   	return in_be32(base + (reg >> 2));
>   }
>   
> -static inline void qe_ic_write(volatile __be32  __iomem * base, unsigned int reg,
> +static inline void qe_ic_write(__be32  __iomem * base, unsigned int reg,

same

>   			       u32 value)
>   {
>   	out_be32(base + (reg >> 2), value);
> diff --git a/drivers/soc/fsl/qe/qe_ic.h b/drivers/soc/fsl/qe/qe_ic.h
> index 08c695672a03..9420378d9b6b 100644
> --- a/drivers/soc/fsl/qe/qe_ic.h
> +++ b/drivers/soc/fsl/qe/qe_ic.h
> @@ -72,7 +72,7 @@
>   
>   struct qe_ic {
>   	/* Control registers offset */
> -	volatile u32 __iomem *regs;
> +	u32 __iomem *regs;
>   
>   	/* The remapper for this QEIC */
>   	struct irq_domain *irqhost;
> 

Christophe
