Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040C1599B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 20:25:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HCRQ2mg9zDqMb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 06:25:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HCPS1wjqzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 06:23:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=nsf1Q9w+; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48HCPS03d6z8sxX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 06:23:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48HCPR6Vd4z9sRJ; Wed, 12 Feb 2020 06:23:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=nsf1Q9w+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48HCPP1hQNz9sPJ
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Feb 2020 06:23:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48HCPF6pPlz9v4dJ;
 Tue, 11 Feb 2020 20:23:45 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nsf1Q9w+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 394FkWBMDoai; Tue, 11 Feb 2020 20:23:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48HCPF5h78z9v4dH;
 Tue, 11 Feb 2020 20:23:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581449025; bh=6gWV85uWWvjfhGiqRxr99dy6C5m8g6hh0QIeR0DQZlw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nsf1Q9w+QGwstTOL62mu76DkC6PfBs5SPvR+NJ5X4dZl7TOj8iBkQafBSG/F6A0Is
 pbitM855OubYC+Gvkg2oLqrRu1LJ09MB5Gihc1XM4GkdZLPfxc9pRj1nJwP+fk4LTd
 tiRxLAy8uUk4GgvZ+rWGEhu8td09qvI6mvIlnmn4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C16B98B7F5;
 Tue, 11 Feb 2020 20:23:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XZI6ce_Zd7jM; Tue, 11 Feb 2020 20:23:45 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 694D08B7E4;
 Tue, 11 Feb 2020 20:23:45 +0100 (CET)
Subject: Re: Problem booting a PowerBook G4 Aluminum after commit cd08f109
 with CONFIG_VMAP_STACK=y
To: Larry Finger <Larry.Finger@lwfinger.net>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
 <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a8a38651-974a-819a-810c-83c4097adc10@c-s.fr>
Date: Tue, 11 Feb 2020 20:23:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/02/2020 à 17:06, Larry Finger a écrit :
> On 2/11/20 12:55 AM, Christophe Leroy wrote:
>>
>>
>> Le 10/02/2020 à 13:55, Larry Finger a écrit :
>>> On 2/9/20 12:19 PM, Christophe Leroy wrote:
>>>> Do you have CONFIG_TRACE_IRQFLAGS in your config ?
>>>> If so, can you try the patch below ?
>>>>
>>>> https://patchwork.ozlabs.org/patch/1235081/
>>>>
>>>> Otherwise, can you send me your .config and tell me exactly where it 
>>>> stops during the boot.
>>>
>>> Christophe,
>>>
>>> That patch did not work. My .config is attached.
>>>
>>> It does boot if CONFIG_VMAP_STACK is not set.
>>>
>>> The console display ends with the "DMA ranges" output. A screen shot 
>>> is also appended.
>>>
>>> Larry
>>>
>>
>> Hi,
>>
>> I tried your config under QEMU, it works.
>>
>> In fact your console display is looping on itself, it ends at "printk: 
>> bootconsole [udbg0] disabled".
>>
>> Looks like you get stuck at the time of switching to graphic mode. 
>> Need to understand why.
> 
> I'm not surprised that a real G4 differs from QEMU. For one thing, the 
> real hardware uses i2c to connect to the graphics hardware.
> 
> I realized that the screen was not scrolling and output was missing. To 
> see what was missed, I added a call to btext_clearscreen(). As you 
> noted, it ends at the bootconsole disabled statement.
> 
> As I could not find any console output after that point, I then turned 
> off the bootconsole disable. I realize this action may cause a different 
> problem, but in this configuration, the computer hit a BUG Unable to 
> handle kernel data access at 0x007a84fc. The faulting instruction 
> address was 0x00013674. Those addresses look like physical, not virtual, 
> addresses.
> 

Can you send me a picture of that BUG Unable to handle kernel data 
access with all the registers values etc..., together with the matching 
vmlinux ?

First thing is to identify where we are when that happens. That mean see 
what is at 0xc0013674. Can be done with 'ppc-linux-objdump -d vmlinux' 
(Or whatever your PPC objdump is named) and get the function code.

Then we need to understand how we reach that function and why it tries 
to access a physical address.


Another thing I'm thinking about, not necessarily related to that 
problem: Some buggy drivers do DMA from stack. This doesn't work anymore 
with CONFIG_VMAP_STACK. Most of them can be detected with 
CONFIG_DEBUG_VIRTUAL so you should activate it.

Christophe
