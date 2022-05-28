Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C75536B56
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 09:03:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9CM714y5z3cD7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 17:03:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9CLh4nbWz3057
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 17:03:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4L9CLX3CmTz9t11;
	Sat, 28 May 2022 09:03:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LIaKILAdhxJ; Sat, 28 May 2022 09:03:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4L9CLX2Cbfz9t0t;
	Sat, 28 May 2022 09:03:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 365E58B76D;
	Sat, 28 May 2022 09:03:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NDa6nzlcDVx0; Sat, 28 May 2022 09:03:16 +0200 (CEST)
Received: from [192.168.5.182] (unknown [192.168.5.182])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C21CF8B763;
	Sat, 28 May 2022 09:03:15 +0200 (CEST)
Message-ID: <b81e1270-2622-da82-43b4-762240a94626@csgroup.eu>
Date: Sat, 28 May 2022 09:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4,1/5] powerpc: sysdev: fix compile error for
 fsl_85xx_l2ctlr
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Wang Wenhu <wenhu.wang@vivo.com>, kernel@vivo.com
References: <20200424085839.60284-1-wenhu.wang@vivo.com>
 <20200424085839.60284-2-wenhu.wang@vivo.com>
 <50ec8577-23a5-cbba-f8d4-a3ca37439298@csgroup.eu>
In-Reply-To: <50ec8577-23a5-cbba-f8d4-a3ca37439298@csgroup.eu>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/03/2022 à 13:45, Christophe Leroy a écrit :
> 
> 
> Le 24/04/2020 à 10:58, Wang Wenhu a écrit :
>> Include "linux/of_address.h" to fix the compile error for
>> mpc85xx_l2ctlr_of_probe() when compiling fsl_85xx_cache_sram.c.
>>
>>    CC      arch/powerpc/sysdev/fsl_85xx_l2ctlr.o
>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c: In function 
>> ‘mpc85xx_l2ctlr_of_probe’:
>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c:90:11: error: implicit 
>> declaration of function ‘of_iomap’; did you mean ‘pci_iomap’? 
>> [-Werror=implicit-function-declaration]
>>    l2ctlr = of_iomap(dev->dev.of_node, 0);
>>             ^~~~~~~~
>>             pci_iomap
>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c:90:9: error: assignment makes 
>> pointer from integer without a cast [-Werror=int-conversion]
>>    l2ctlr = of_iomap(dev->dev.of_node, 0);
>>           ^
>> cc1: all warnings being treated as errors
>> scripts/Makefile.build:267: recipe for target 
>> 'arch/powerpc/sysdev/fsl_85xx_l2ctlr.o' failed
>> make[2]: *** [arch/powerpc/sysdev/fsl_85xx_l2ctlr.o] Error 1
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Scott Wood <oss@buserror.net>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Fixes: 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
>> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> 
> Is there still an interest for this series ?
> 
> I see there is even a v5 at 
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=172421&state=* 
> allthough I can't find it in my emails.
> 
> If so do you plan to send any update of it at some point ?
> 
> Otherwise, as CONFIG_FSL_85XX_CACHE_SRAM is not user selectable and no 
> driver selects it, I think time has come to remove it completely.
> 

CONFIG_FSL_85XX_CACHE_SRAM has now been removed.

See 
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=dc21ed2aef4150fc2fcf58227a4ff24502015c03
