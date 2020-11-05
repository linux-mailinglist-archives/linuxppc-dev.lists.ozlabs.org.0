Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E42A77CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 08:12:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRZTV109ZzDqGb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 18:12:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRZRk5cgczDqDM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 18:10:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CRZRY3PwRz9v117;
 Thu,  5 Nov 2020 08:10:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PuUCBQNMDmSo; Thu,  5 Nov 2020 08:10:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CRZRY17TXz9v116;
 Thu,  5 Nov 2020 08:10:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 115AD8B819;
 Thu,  5 Nov 2020 08:10:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id P1iQ9jSrgLaD; Thu,  5 Nov 2020 08:10:34 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AAD948B764;
 Thu,  5 Nov 2020 08:10:33 +0100 (CET)
Subject: Re: [PATCH 31/36] powerpc: asm: hvconsole: Move 'hvc_vio_init_early's
 prototype to shared location
To: Lee Jones <lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
 <20201104193549.4026187-32-lee.jones@linaro.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d2a23842-631e-cd5e-84ec-48485328ba52@csgroup.eu>
Date: Thu, 5 Nov 2020 08:10:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201104193549.4026187-32-lee.jones@linaro.org>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/11/2020 à 20:35, Lee Jones a écrit :
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/tty/hvc/hvc_vio.c:385:13: warning: no previous prototype for ‘hvc_vio_init_early’ [-Wmissing-prototypes]
>   385 | void __init hvc_vio_init_early(void)
>   | ^~~~~~~~~~~~~~~~~~
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   arch/powerpc/include/asm/hvconsole.h     | 3 +++
>   arch/powerpc/platforms/pseries/pseries.h | 3 ---
>   arch/powerpc/platforms/pseries/setup.c   | 1 +
>   3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hvconsole.h b/arch/powerpc/include/asm/hvconsole.h
> index 999ed5ac90531..936a1ee1ac786 100644
> --- a/arch/powerpc/include/asm/hvconsole.h
> +++ b/arch/powerpc/include/asm/hvconsole.h
> @@ -24,5 +24,8 @@
>   extern int hvc_get_chars(uint32_t vtermno, char *buf, int count);
>   extern int hvc_put_chars(uint32_t vtermno, const char *buf, int count);
>   
> +/* Provided by HVC VIO */
> +extern void hvc_vio_init_early(void);
> +

Declaring a prototype 'extern' is pointless. Don't add new misuse of 'extern' keyword.


>   #endif /* __KERNEL__ */
>   #endif /* _PPC64_HVCONSOLE_H */
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
> index 13fa370a87e4e..7be5b054dfc36 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -43,9 +43,6 @@ extern void pSeries_final_fixup(void);
>   /* Poweron flag used for enabling auto ups restart */
>   extern unsigned long rtas_poweron_auto;
>   
> -/* Provided by HVC VIO */
> -extern void hvc_vio_init_early(void);
> -
>   /* Dynamic logical Partitioning/Mobility */
>   extern void dlpar_free_cc_nodes(struct device_node *);
>   extern void dlpar_free_cc_property(struct property *);
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 633c45ec406da..6999b83f06612 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -71,6 +71,7 @@
>   #include <asm/swiotlb.h>
>   #include <asm/svm.h>
>   #include <asm/dtl.h>
> +#include <asm/hvconsole.h>
>   
>   #include "pseries.h"
>   #include "../../../../drivers/pci/pci.h"
> 

Christophe
