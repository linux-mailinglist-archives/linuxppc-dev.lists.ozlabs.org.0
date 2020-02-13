Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7615B985
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 07:18:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48J5tW3L0bzDqBh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 17:18:43 +1100 (AEDT)
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
 header.s=mail header.b=ul2SKyzo; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48J5rd4X2pzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 17:17:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48J5rY33mTz9txqP;
 Thu, 13 Feb 2020 07:17:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ul2SKyzo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KvByieqdrI0U; Thu, 13 Feb 2020 07:17:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48J5rY20wZz9txqN;
 Thu, 13 Feb 2020 07:17:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581574621; bh=t/2LmfZnIqpmtmv0ZE2LPqev+yZwDWjNkrZOcNsg5jA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ul2SKyzo22RtsN1ENKBOu2/8T6zDA40eJJI01PExJ/53pjfxhhPeMtFc+b0szVLKJ
 Qk6CtH21vNnbEZDD1RH5IOJXHTVMN0ct4YgTznrIb72dG2KtN1scQujj5YtnVHBksO
 HVgdYFujtQ2MuNBQ8lcSaxAZihgRw1IhDFUcHduE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F69B8B793;
 Thu, 13 Feb 2020 07:17:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TYSyMjnOf7yr; Thu, 13 Feb 2020 07:17:02 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 815C38B752;
 Thu, 13 Feb 2020 07:17:01 +0100 (CET)
Subject: Re: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't
 boot anymore
To: Qiang Zhao <qiang.zhao@nxp.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Leo Li <leoyang.li@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
 <aee10440-c244-7c93-d3bb-fd29d8a83be4@c-s.fr>
 <VE1PR04MB6768B3B0F369280338370B87911A0@VE1PR04MB6768.eurprd04.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0c217693-7c73-1696-8a86-e81dbabefe02@c-s.fr>
Date: Thu, 13 Feb 2020 07:17:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6768B3B0F369280338370B87911A0@VE1PR04MB6768.eurprd04.prod.outlook.com>
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
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/02/2020 à 04:35, Qiang Zhao a écrit :
> On 02/12/2020 22:50 PM, Christophe Leroy wrote:
>> -----Original Message-----
>> From: Christophe Leroy <christophe.leroy@c-s.fr>
>> Sent: 2020年2月12日 22:50
>> To: Rasmus Villemoes <linux@rasmusvillemoes.dk>; Leo Li
>> <leoyang.li@nxp.com>; Qiang Zhao <qiang.zhao@nxp.com>; Greg
>> Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Scott Wood <oss@buserror.net>; linuxppc-dev@lists.ozlabs.org; LKML
>> <linux-kernel@vger.kernel.org>; linux-arm-kernel@lists.infradead.org
>> Subject: Re: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't
>> boot anymore
>>
>> ---
>> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
>> b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
>> index 4cabded8390b..341d682ec6eb 100644
>> --- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
>> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
>> @@ -1351,6 +1351,7 @@ static int __init cpm_uart_console_setup(struct
>> console *co, char *options)
>>    		clrbits32(&pinfo->sccp->scc_gsmrl, SCC_GSMRL_ENR |
>> SCC_GSMRL_ENT);
>>    	}
>>
>> +	cpm_muram_init();
>>    	ret = cpm_uart_allocbuf(pinfo, 1);
>>
>>    	if (ret)
>>
> How about the patch like below? Just a draft.

Yes, I see the idea. I think we could go for something like that.
But in the powerpc 8xx case, we are talking about cpm_init(), not qe_init().

And maybe the return code should be checked, because if it's not 0, 
cpm_muram_init() won't have been called.

Thanks,
Christophe
