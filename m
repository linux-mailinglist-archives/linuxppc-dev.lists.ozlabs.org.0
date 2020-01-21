Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BBD14386C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 09:38:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48224s3w0XzDqQs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 19:38:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=vYJPhRPa; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48222x4FffzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 19:37:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48222r2tbWz9v0DF;
 Tue, 21 Jan 2020 09:37:08 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vYJPhRPa; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gKX4BKKZNaEM; Tue, 21 Jan 2020 09:37:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48222r1nMXz9v0DD;
 Tue, 21 Jan 2020 09:37:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579595828; bh=pWuTMOvIrZ5e55NW6SuX7mpcZeq3kBteI+512yICmEk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vYJPhRPa4PwpO2Lpn0rpPnvwd5qCVoDLsK/98O8D06VUkF7nz0YMzO6YDfvBZnHFC
 ZUpSHzlOFHz5jTl8QTVvKYd3kGrCEUejTSh1ERLdgMz3xpPruS5N3hMoP4EavI6vhI
 mFIKJqImSrrJ2DP3Cos/mGRPynA+uBt6fEKnYwQY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 44B3E8B7DB;
 Tue, 21 Jan 2020 09:37:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AVCj8jgSnr4G; Tue, 21 Jan 2020 09:37:09 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 70EFA8B776;
 Tue, 21 Jan 2020 09:37:07 +0100 (CET)
Subject: Re: [PATCH] powerpc/sysdev: fix compile errors
To: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>,
 Andrew Donnellan <ajd@linux.ibm.com>
References: <ANcAOwAACK7otVnG7VF8E4rQ.3.1579589949706.Hmail.wenhu.wang@vivo.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d3b340dc-54df-24f6-2831-50456beea7ab@c-s.fr>
Date: Tue, 21 Jan 2020 09:37:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ANcAOwAACK7otVnG7VF8E4rQ.3.1579589949706.Hmail.wenhu.wang@vivo.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, trivial@kernel.org,
 wangwenhu <wenhu.pku@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 lonehugo@hotmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/01/2020 à 07:59, 王文虎 a écrit :
> 发件人：Andrew Donnellan <ajd@linux.ibm.com>
> 发送日期：2020-01-21 14:13:07
> 收件人：wangwenhu <wenhu.pku@gmail.com>,Benjamin Herrenschmidt <benh@kernel.crashing.org>,Paul Mackerras <paulus@samba.org>,Michael Ellerman <mpe@ellerman.id.au>,Kate Stewart <kstewart@linuxfoundation.org>,Greg Kroah-Hartman <gregkh@linuxfoundation.org>,Richard Fontana <rfontana@redhat.com>,Thomas Gleixner <tglx@linutronix.de>,linuxppc-dev@lists.ozlabs.org,linux-kernel@vger.kernel.org
> 抄送人：trivial@kernel.org,lonehugo@hotmail.com,wenhu.wang@vivo.com
> 主题：Re: [PATCH] powerpc/sysdev: fix compile errors>On 21/1/20 4:31 pm, wangwenhu wrote:
>>> From: wangwenhu <wenhu.wang@vivo.com>
>>>
>>> Include arch/powerpc/include/asm/io.h into fsl_85xx_cache_sram.c to
>>> fix the implicit declaration compile errors when building Cache-Sram.
>>>
>>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c: In function ‘instantiate_cache_sram’:
>>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:26: error: implicit declaration of function ‘ioremap_coherent’; did you mean ‘bitmap_complement’? [-Werror=implicit-function-declaration]
>>>     cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
>>>                             ^~~~~~~~~~~~~~~~
>>>                             bitmap_complement
>>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:24: error: assignment makes pointer from integer without a cast [-Werror=int-conversion]
>>>     cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
>>>                           ^
>>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c:123:2: error: implicit declaration of function ‘iounmap’; did you mean ‘roundup’? [-Werror=implicit-function-declaration]
>>>     iounmap(cache_sram->base_virt);
>>>     ^~~~~~~
>>>     roundup
>>> cc1: all warnings being treated as errors
>>>
>>> Signed-off-by: wangwenhu <wenhu.wang@vivo.com>
>>
>> How long has this code been broken for?
> 
> It's been broken almost 15 months since the commit below:
> "commit aa91796ec46339f2ed53da311bd3ea77a3e4dfe1
> Author: Christophe Leroy <christophe.leroy@c-s.fr>
> Date:   Tue Oct 9 13:51:41 2018 +0000
> 
>      powerpc: don't use ioremap_prot() nor __ioremap() unless really needed."
> 
> And we are working on it now for further development.

That's pretty surprising. That commit didn't change the iounmap(). It 
only replaced ioremap_prot() by ioremap_coherent(). Both are defined in io.h

Christophe

> 
>>
>>> ---
>>>    arch/powerpc/sysdev/fsl_85xx_cache_sram.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
>>> index f6c665dac725..29b6868eff7d 100644
>>> --- a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
>>> +++ b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
>>> @@ -17,6 +17,7 @@
>>>    #include <linux/of_platform.h>
>>>    #include <asm/pgtable.h>
>>>    #include <asm/fsl_85xx_cache_sram.h>
>>> +#include <asm/io.h>
>>>
>>>    #include "fsl_85xx_cache_ctlr.h"
>>>
>>
>> -- 
>> Andrew Donnellan              OzLabs, ADL Canberra
>> ajd@linux.ibm.com             IBM Australia Limited
>>
> 
> Wenhu
> 
