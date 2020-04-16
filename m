Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B41ABE0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 12:38:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492wg83WbKzDrVx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 20:38:28 +1000 (AEST)
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
 header.s=mail header.b=Q1mfZRzd; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492wdJ3p0pzDqlQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 20:36:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492wd560Khz9v1KF;
 Thu, 16 Apr 2020 12:36:41 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Q1mfZRzd; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gjgErL3lbfTm; Thu, 16 Apr 2020 12:36:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492wd54vTKz9v1KC;
 Thu, 16 Apr 2020 12:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587033401; bh=l5FwhWsZFKoNYPFvSBrPZm1J3No4Lds1oXRu+U6EyzE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q1mfZRzdVTVLZ9spIAcjumqoNKfKtAXMhqqu72UQK2qqOHAgzcyZ93dCPB4Z9HBDb
 eUTezV8zEsorpEL5x5DoxpQ1KoJ4kzp5DqP3jd5KDzneZxqh06kk6xhlxU4YVc9Zbm
 iebw9fw1oWps8adcEcDcgg+pOfjnMtWRYxvJ/Pmc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 29BEB8BBF0;
 Thu, 16 Apr 2020 12:36:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UL0sASDHqyWS; Thu, 16 Apr 2020 12:36:43 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 991E18B99F;
 Thu, 16 Apr 2020 12:36:42 +0200 (CEST)
Subject: Re: [PATCH v3,0/4] drivers: uio: new driver uio_fsl_85xx_cache_sram
To: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
References: <AIgAKQBlCIqtPx5U5P0kFqpr.3.1587029369636.Hmail.wenhu.wang@vivo.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a3032813-ba1e-101a-0b73-cc477d702aac@c-s.fr>
Date: Thu, 16 Apr 2020 12:36:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AIgAKQBlCIqtPx5U5P0kFqpr.3.1587029369636.Hmail.wenhu.wang@vivo.com>
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
Cc: oss@buserror.net, gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/04/2020 à 11:29, 王文虎 a écrit :
> Hi,
> Seems there is something wrong with the server that multiple dumplications
> of the v3 patches were sent out, please ignore the rest and take this newest
> series as formal count.

Which series ?

It seems you sent 3 times, at 9:29, 9:41 and 9:49 (Paris Time)

 From the series of 9:29, I received patches 0 to 3
 From the series of 9:41, I received patches 0 to 3
 From the series of 9:49, I received patches 0 and 4.

Looks like powerpc patchwork 
(https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=78320) 
got:
 From the series of 9:29, I received patches 0 to 4
 From the series of 9:41, I received patches 1 to 4
 From the series of 9:49, I received patches 1 to 4

So this seems to be something wrong somewhere.

Christophe


> 
> Thanks,
> Wenhu
> 
> From: Wang Wenhu <wenhu.wang@vivo.com>
> Date: 2020-04-16 15:49:14
> To:  gregkh@linuxfoundation.org,linux-kernel@vger.kernel.org,oss@buserror.net,christophe.leroy@c-s.fr,linuxppc-dev@lists.ozlabs.org
> Cc:  kernel@vivo.com,Wang Wenhu <wenhu.wang@vivo.com>
> Subject: [PATCH v3,0/4] drivers: uio: new driver uio_fsl_85xx_cache_sram>This series add a new uio driver for freescale 85xx platforms to
>> access the Cache-Sram form user level. This is extremely helpful
>> for the user-space applications that require high performance memory
>> accesses.
>>
>> It fixes the compile errors and warning of the hardware level drivers
>> and implements the uio driver in uio_fsl_85xx_cache_sram.c.
>>
>> Changes since v1:
>> * Addressed comments from Greg K-H
>> * Moved kfree(info->name) into uio_info_free_internal()
>>
>> Changes since v2:
>> * Drop the patch that modifies Kconfigs of arch/powerpc/platforms
>>    and modified the sequence of patches:
>>     01:dropped, 02->03, 03->02, 04->01, 05->04
>> * Addressed comments from Greg, Scott and Christophe
>> * Use "uiomem->internal_addr" as if condition for sram memory free,
>>    and memset the uiomem entry
>> * Modified of_match_table make the driver apart from Cache-Sram HW info
>>    which belong to the HW level driver fsl_85xx_cache_sram to match
>> * Use roundup_pow_of_two for align calc(really learned a lot from Christophe)
>> * Remove useless clear block of uiomem entries.
>> * Use UIO_INFO_VER micro for info->version, and define it as
>>    "devicetree,pseudo", meaning this is pseudo device and probed from
>>    device tree configuration
>> * Select FSL_85XX_CACHE_SRAM rather than depends on it
>>
>> Wang Wenhu (4):
>>   powerpc: sysdev: fix compile error for fsl_85xx_l2ctlr
>>   powerpc: sysdev: fix compile error for fsl_85xx_cache_sram
>>   powerpc: sysdev: fix compile warning for fsl_85xx_cache_sram
>>   drivers: uio: new driver for fsl_85xx_cache_sram
>>
>> arch/powerpc/sysdev/fsl_85xx_cache_sram.c |   3 +-
>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c     |   1 +
>> drivers/uio/Kconfig                       |   9 ++
>> drivers/uio/Makefile                      |   1 +
>> drivers/uio/uio_fsl_85xx_cache_sram.c     | 158 ++++++++++++++++++++++
>> 5 files changed, 171 insertions(+), 1 deletion(-)
>> create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c
>>
>> -- 
>> 2.17.1
>>
> 
> 
