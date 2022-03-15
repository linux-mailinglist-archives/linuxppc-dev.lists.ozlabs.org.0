Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AC44D9B7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 13:46:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHtS96rHzz3bYW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 23:46:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHtRk1KnVz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 23:45:34 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KHtRb47Jjz9sSm;
 Tue, 15 Mar 2022 13:45:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sI-JKIuBflLI; Tue, 15 Mar 2022 13:45:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KHtRb36Nfz9sSj;
 Tue, 15 Mar 2022 13:45:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57FB58B770;
 Tue, 15 Mar 2022 13:45:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rcqadboiGTvy; Tue, 15 Mar 2022 13:45:31 +0100 (CET)
Received: from [192.168.202.50] (unknown [192.168.202.50])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4F6E8B763;
 Tue, 15 Mar 2022 13:45:30 +0100 (CET)
Message-ID: <50ec8577-23a5-cbba-f8d4-a3ca37439298@csgroup.eu>
Date: Tue, 15 Mar 2022 13:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4,1/5] powerpc: sysdev: fix compile error for
 fsl_85xx_l2ctlr
Content-Language: fr-FR
To: Wang Wenhu <wenhu.wang@vivo.com>, kernel@vivo.com
References: <20200424085839.60284-1-wenhu.wang@vivo.com>
 <20200424085839.60284-2-wenhu.wang@vivo.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200424085839.60284-2-wenhu.wang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/04/2020 à 10:58, Wang Wenhu a écrit :
> Include "linux/of_address.h" to fix the compile error for
> mpc85xx_l2ctlr_of_probe() when compiling fsl_85xx_cache_sram.c.
> 
>    CC      arch/powerpc/sysdev/fsl_85xx_l2ctlr.o
> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c: In function ‘mpc85xx_l2ctlr_of_probe’:
> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c:90:11: error: implicit declaration of function ‘of_iomap’; did you mean ‘pci_iomap’? [-Werror=implicit-function-declaration]
>    l2ctlr = of_iomap(dev->dev.of_node, 0);
>             ^~~~~~~~
>             pci_iomap
> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c:90:9: error: assignment makes pointer from integer without a cast [-Werror=int-conversion]
>    l2ctlr = of_iomap(dev->dev.of_node, 0);
>           ^
> cc1: all warnings being treated as errors
> scripts/Makefile.build:267: recipe for target 'arch/powerpc/sysdev/fsl_85xx_l2ctlr.o' failed
> make[2]: *** [arch/powerpc/sysdev/fsl_85xx_l2ctlr.o] Error 1
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Fixes: 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>

Is there still an interest for this series ?

I see there is even a v5 at 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=172421&state=* 
allthough I can't find it in my emails.

If so do you plan to send any update of it at some point ?

Otherwise, as CONFIG_FSL_85XX_CACHE_SRAM is not user selectable and no 
driver selects it, I think time has come to remove it completely.

Thanks
Christophe


> ---
> No change v1-v4
> ---
>   arch/powerpc/sysdev/fsl_85xx_l2ctlr.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/sysdev/fsl_85xx_l2ctlr.c b/arch/powerpc/sysdev/fsl_85xx_l2ctlr.c
> index 2d0af0c517bb..7533572492f0 100644
> --- a/arch/powerpc/sysdev/fsl_85xx_l2ctlr.c
> +++ b/arch/powerpc/sysdev/fsl_85xx_l2ctlr.c
> @@ -10,6 +10,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of_platform.h>
> +#include <linux/of_address.h>
>   #include <asm/io.h>
>   
>   #include "fsl_85xx_cache_ctlr.h"
