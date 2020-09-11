Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D02372658E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:42:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnl4x4c3mzDqfp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:42:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnl2v5gyXzDqmd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:40:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bnl2p42mbz9tynV;
 Fri, 11 Sep 2020 07:40:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gbIQCFWmjZPC; Fri, 11 Sep 2020 07:40:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bnl2p1q6Cz9tynT;
 Fri, 11 Sep 2020 07:40:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A8AA8B834;
 Fri, 11 Sep 2020 07:40:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DMU1Nb2WBBde; Fri, 11 Sep 2020 07:40:19 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B1BBC8B832;
 Fri, 11 Sep 2020 07:40:18 +0200 (CEST)
Subject: Re: [PATCH 4/7] powerpc/xive: Fix W=1 compile warning
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200910210250.1962595-1-clg@kaod.org>
 <20200910210250.1962595-5-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b344a592-f98d-9f01-c1e7-63f805296b64@csgroup.eu>
Date: Fri, 11 Sep 2020 07:40:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910210250.1962595-5-clg@kaod.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/09/2020 à 23:02, Cédric Le Goater a écrit :
> CC      arch/powerpc/sysdev/xive/common.o
> ../arch/powerpc/sysdev/xive/common.c:1568:6: error: no previous prototype for ‘xive_debug_show_cpu’ [-Werror=missing-prototypes]
>   void xive_debug_show_cpu(struct seq_file *m, int cpu)
>        ^~~~~~~~~~~~~~~~~~~
> ../arch/powerpc/sysdev/xive/common.c:1602:6: error: no previous prototype for ‘xive_debug_show_irq’ [-Werror=missing-prototypes]
>   void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
>        ^~~~~~~~~~~~~~~~~~~
> 

A small sentence explaining how this is fixed would be welcome, so that 
you don't need to read the code the know what the commit does to fix the 
warning. Also the subject should be more explicit.

There are two ways of fixing it:
- Add the missing prototype
- Make it static

You chose the second alternative, this needs to be told in the commit log.


> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/sysdev/xive/common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index f591be9f01f4..a80440af491a 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1565,7 +1565,7 @@ static int __init xive_off(char *arg)
>   }
>   __setup("xive=off", xive_off);
>   
> -void xive_debug_show_cpu(struct seq_file *m, int cpu)
> +static void xive_debug_show_cpu(struct seq_file *m, int cpu)
>   {
>   	struct xive_cpu *xc = per_cpu(xive_cpu, cpu);
>   
> @@ -1599,7 +1599,7 @@ void xive_debug_show_cpu(struct seq_file *m, int cpu)
>   	seq_puts(m, "\n");
>   }
>   
> -void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
> +static void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
>   {
>   	struct irq_chip *chip = irq_data_get_irq_chip(d);
>   	int rc;
> 
