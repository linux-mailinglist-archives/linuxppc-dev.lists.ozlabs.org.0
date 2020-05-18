Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE3F1D7556
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 12:39:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qb8T3RkGzDqSp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 20:38:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qb6q2dswzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 20:37:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49Qb6W1q99z9txc5;
 Mon, 18 May 2020 12:36:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aoBlJkWUGX65; Mon, 18 May 2020 12:36:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49Qb6W12mbz9txc4;
 Mon, 18 May 2020 12:36:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A6DC38B76A;
 Mon, 18 May 2020 12:36:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ure_5nwPKksx; Mon, 18 May 2020 12:36:57 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 91A498B796;
 Mon, 18 May 2020 12:36:56 +0200 (CEST)
Subject: Re: [PATCH] powerpc/sysdev: fix compile errors
To: Jiri Kosina <jikos@kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200302053801.26027-1-wenhu.wang@vivo.com>
 <62251ec1-dd42-6522-dcb2-613838cd5504@c-s.fr>
 <nycvar.YFH.7.76.2005181228480.25812@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2005181232140.25812@cbobk.fhfr.pm>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <494faa28-e994-14e9-71da-07f5214b4579@csgroup.eu>
Date: Mon, 18 May 2020 12:36:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2005181232140.25812@cbobk.fhfr.pm>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 wenhu.pku@gmail.com, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 WANG Wenhu <wenhu.wang@vivo.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/05/2020 à 12:32, Jiri Kosina a écrit :
> On Mon, 18 May 2020, Jiri Kosina wrote:
> 
>>>> Include linux/io.h into fsl_85xx_cache_sram.c to fix the
>>>> implicit-declaration compile errors when building Cache-Sram.
>>>>
>>>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c: In function
>>>> ‘instantiate_cache_sram’:
>>>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:26: error: implicit declaration
>>>> of function ‘ioremap_coherent’; did you mean ‘bitmap_complement’?
>>>> [-Werror=implicit-function-declaration]
>>>>     cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
>>>>                             ^~~~~~~~~~~~~~~~
>>>>                             bitmap_complement
>>>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:24: error: assignment makes
>>>> pointer from integer without a cast [-Werror=int-conversion]
>>>>     cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
>>>>                           ^
>>>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c:123:2: error: implicit declaration
>>>> of function ‘iounmap’; did you mean ‘roundup’?
>>>> [-Werror=implicit-function-declaration]
>>>>     iounmap(cache_sram->base_virt);
>>>>     ^~~~~~~
>>>>     roundup
>>>> cc1: all warnings being treated as errors
>>>>
>>>> Fixed: commit 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
>>>> Signed-off-by: WANG Wenhu <wenhu.wang@vivo.com>
>>>
>>> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>
>> As this doesn't seem to have been picked up for linux-next yet, I am
>> picking it up now.
> 
> Only now I've noticed that this is actually a dead code o_O as this file
> can't be built by any combination of config options. So I am dropping the
> patch again, but why do we keep it in the tree in the first place?
> 

There is a series aiming at making use of it, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=172421

Christophe
