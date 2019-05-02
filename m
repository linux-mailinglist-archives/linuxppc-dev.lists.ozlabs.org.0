Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52511290
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 07:25:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vkH518zCzDqV7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 15:25:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BQj7sfOw"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vkFm6pc9zDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 15:23:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44vkFj0chZz9v0Cc;
 Thu,  2 May 2019 07:23:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BQj7sfOw; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lRRwijcRiCfO; Thu,  2 May 2019 07:23:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44vkFh6YXgz9v0Cb;
 Thu,  2 May 2019 07:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556774632; bh=J6dTBJDafWqgTQDVR5uysm0uCO5gxlPGeSNEtqq65f4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BQj7sfOwvo0anIGVgAzPCKQBhwjUb1Bi69Bdoy4rjIg/vGAykeNZu4XCATXQLvvVv
 kGbg/gcdKe6OMlU4sn3hvkBh3ZxBEo4jZdeDjS+bY1UiY/LvBaA/jY2R8Fz4N/honl
 QQZ6n8aq9f4w77YdtwATClOZbVYe7R0O5R/Hm6WM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BC0A08B852;
 Thu,  2 May 2019 07:23:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y496wwwfPl0d; Thu,  2 May 2019 07:23:53 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 636F58B74C;
 Thu,  2 May 2019 07:23:53 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/mm: Warn if W+X pages found on boot
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20190424063958.24559-1-ruscur@russell.cc>
 <20190424063958.24559-2-ruscur@russell.cc>
 <8e659a8f-af3f-e889-3f7a-560178c1f7b1@c-s.fr>
 <ca5e1db5fca5c12ca69d7810d575a437ae39ec87.camel@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <673532fb-cd09-748f-e936-14c0cab854b1@c-s.fr>
Date: Thu, 2 May 2019 07:23:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ca5e1db5fca5c12ca69d7810d575a437ae39ec87.camel@russell.cc>
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
Cc: Julia.Lawall@lip6.fr, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/05/2019 à 09:04, Russell Currey a écrit :
> On Wed, 2019-04-24 at 09:14 +0200, Christophe Leroy wrote:
>>
>> Le 24/04/2019 à 08:39, Russell Currey a écrit :
>>> Implement code to walk all pages and warn if any are found to be
>>> both
>>> writable and executable.  Depends on STRICT_KERNEL_RWX enabled, and
>>> is
>>> behind the DEBUG_WX config option.
>>>
>>> This only runs on boot and has no runtime performance implications.
>>>
>>> Very heavily influenced (and in some cases copied verbatim) from
>>> the
>>> ARM64 code written by Laura Abbott (thanks!), since our ptdump
>>> infrastructure is similar.
>>>
>>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>>> ---
>>>    arch/powerpc/Kconfig.debug         | 19 +++++++++++++++
>>>    arch/powerpc/include/asm/pgtable.h |  5 ++++
>>>    arch/powerpc/mm/pgtable_32.c       |  5 ++++
>>>    arch/powerpc/mm/pgtable_64.c       |  5 ++++
>>>    arch/powerpc/mm/ptdump/ptdump.c    | 38
>>> ++++++++++++++++++++++++++++++
>>>    5 files changed, 72 insertions(+)
>>>
>>> diff --git a/arch/powerpc/Kconfig.debug
>>> b/arch/powerpc/Kconfig.debug
>>> index 4e00cb0a5464..a4160ff02ed4 100644
>>> --- a/arch/powerpc/Kconfig.debug
>>> +++ b/arch/powerpc/Kconfig.debug
>>> @@ -361,6 +361,25 @@ config PPC_PTDUMP
>>>    
>>>    	  If you are unsure, say N.
>>>    
>>> +config DEBUG_WX
>>
>> I would call it PPC_DEBUG_WX to avoid confusion.
> 
> It's the same functionality as on other architectures and is an arch-
> local thing, I personally think it should be left as-is but given we
> already put the PPC prefix on PTDUMP, I'll add it so it's consistent
> 
> <snip>
> 
>>> +	if (radix_enabled())
>>> +		st.start_address = PAGE_OFFSET;
>>> +	else
>> +		st.start_address = KERN_VIRT_START;
>>
>> KERN_VIRT_START doesn't exist on PPC32.
>>
>> Christophe
>>
> Thanks a lot for the review!  Applied all your suggestions.  What
> should I use on PPC32 instead?

Indeed it looks like KERN_VIRT_START is defined as 0 for PPC32 at the 
top of ptdump.c, which look strange to me.

I guess PAGE_OFFSET should be the good value for KERN_VIRT_START on PPC32.

Christophe

> 
> - Russell
> 
