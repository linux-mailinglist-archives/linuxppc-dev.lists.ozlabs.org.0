Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1467BAAC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 09:26:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z4jS3fm7zDqBN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 17:26:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="k51A5aGh"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z4fs6DbZzDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 17:24:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45z4fl22C0z9vBn0;
 Wed, 31 Jul 2019 09:23:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=k51A5aGh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5AzA9PZ3j7o8; Wed, 31 Jul 2019 09:23:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45z4fl0rBJz9vBmn;
 Wed, 31 Jul 2019 09:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564557839; bh=oXpsIjPuauSTHCSYrQrHXzbzesMqB8EkBPa5wkugwLs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=k51A5aGhf4vm+xacCtS1FzYUb49UyO7h2nSy5i/jcOnsoRy4whoNp+QLSI3SXl/uf
 1Uj5RltGwuUL0Y6ViqaqBMV99HGIEoyRzH/SzSGgwfXAoao/gs5+k3HVxM5q3oBXPN
 WPX/MoKRkhB09a26+7ZlDahPBptfhIAxBy9czl34=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 005888B829;
 Wed, 31 Jul 2019 09:23:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HJ1hGouAYP46; Wed, 31 Jul 2019 09:23:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 099BA8B752;
 Wed, 31 Jul 2019 09:23:58 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Support CMDLINE_EXTEND
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "paulus@samba.org" <paulus@samba.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
References: <20190724053303.24317-1-chris.packham@alliedtelesis.co.nz>
 <59674457-eda5-fe3b-65e0-29c20102fe4d@c-s.fr>
 <1564521015.6123.11.camel@alliedtelesis.co.nz>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <32ae09e8-0d32-4266-aa37-d5a34cb4e707@c-s.fr>
Date: Wed, 31 Jul 2019 09:23:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564521015.6123.11.camel@alliedtelesis.co.nz>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/07/2019 à 23:10, Chris Packham a écrit :
> Hi Christophe,
> 
> On Tue, 2019-07-30 at 09:02 +0200, Christophe Leroy wrote:
>>
>> Le 24/07/2019 à 07:33, Chris Packham a écrit :
>>>
>>> Device tree aware platforms can make use of CMDLINE_EXTEND to
>>> extend the
>>> kernel command line provided by the bootloader. This is
>>> particularly
>>> useful to set parameters for built-in modules that would otherwise
>>> be
>>> done at module insertion. Add support for this in the powerpc
>>> architecture.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>    arch/powerpc/Kconfig | 12 ++++++++++++
>> I think you also have to implement some stuff in
>> early_cmdline_parse()
>> in arch/powerpc/kernel/prom_init.c
> 
> I my case I didn't need to since the generic code in drivers/of/fdt.c
> did what I need. For early options or platforms that don't use a device
> tree then I can see why I'd need the update to update to prom_init.
> 
>>
>> Maybe look at https://patchwork.ozlabs.org/patch/1074126/
>>
> 
> Do you mind if I take this and fold it into a v2 of my patch? Any
> particular reason it didn't get picked up in April?

Sure, take it, I don't mind.

Two reasons it was not picked up in April I believe:
- It was part of a larger series 
(https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=100518) 
and was intended to challenge the series proposed by Daniel 
(https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=98106) 
but nothing happened.
- It was conflicting with the ongoing changes for implementing KASAN.

What you will have to do is to define prom_strlcat() in the same spirit 
as https://patchwork.ozlabs.org/patch/1091621/ by copying it from 
lib/string.c and I think you'll be able to drop prom_strlcpy() as that 
function what only used there.

Christophe

> 
>> Christophe
>>
>>>
>>>    1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index d8dcd8820369..cd9b3974aa36 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -851,6 +851,11 @@ config CMDLINE
>>>    	  some command-line options at build time by entering
>>> them here.  In
>>>    	  most cases you will need to specify the root device
>>> here.
>>>    
>>> +choice
>>> +	prompt "Kernel command line type" if CMDLINE != ""
>>> +	default CMDLINE_FORCE
>>> +	depends on CMDLINE_BOOL
>>> +
>>>    config CMDLINE_FORCE
>>>    	bool "Always use the default kernel command string"
>>>    	depends on CMDLINE_BOOL
>>> @@ -860,6 +865,13 @@ config CMDLINE_FORCE
>>>    	  This is useful if you cannot or don't want to change
>>> the
>>>    	  command-line options your boot loader passes to the
>>> kernel.
>>>    
>>> +config CMDLINE_EXTEND
>>> +	bool "Extend bootloader kernel arguments"
>>> +	help
>>> +	  The command-line arguments provided by the boot loader
>>> will be
>>> +	  appended to the default kernel command string.
>>> +endchoice
>>> +
>>>    config EXTRA_TARGETS
>>>    	string "Additional default image types"
>>>    	help
