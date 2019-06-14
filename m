Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C303D45A39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 12:18:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QGm970YNzDrPr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 20:18:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="aMGMnR3v"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QGVQ5PDnzDrdQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 20:06:53 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45QGVJ0nt7z9vDbm;
 Fri, 14 Jun 2019 12:06:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aMGMnR3v; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id X4TVEgvEUXXh; Fri, 14 Jun 2019 12:06:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45QGVH6rw3z9vDbk;
 Fri, 14 Jun 2019 12:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560506807; bh=H6U3dIX2SVKCwZUsFTw72sro38m1Gqkl8Z8i5rZXXBk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aMGMnR3vGNtc96FQA7Tlx/Xb6c2k5dcWmki0WikZ3pCbwAQ5boG68yvaraxbba0gA
 SmDmrwVTNjTIsBuCKtj2ADsZ/+uqrgL5K6rjuv6tuoLuYZylcEBbgrPXVO+yGDPymj
 LRH1EF2eY01DWKSxkoYMNtpIqFxfEAG5lIhoLS7A=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 27A3F8B7AD;
 Fri, 14 Jun 2019 12:06:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8qQm5fcEnkLQ; Fri, 14 Jun 2019 12:06:49 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02E4A8B7AC;
 Fri, 14 Jun 2019 12:06:49 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Enable kernel XZ compression option on PPC_85xx
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Axtens <dja@axtens.net>,
 Pawel Dembicki <paweldembicki@gmail.com>
References: <20190603164115.27471-1-paweldembicki@gmail.com>
 <877e9qp3ou.fsf@dja-thinkpad.axtens.net>
 <87ftodempa.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f988951c-3077-ab19-81eb-560418468d14@c-s.fr>
Date: Fri, 14 Jun 2019 12:06:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87ftodempa.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org, Christian Lamparter <chunkeey@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/06/2019 à 13:42, Michael Ellerman a écrit :
> Daniel Axtens <dja@axtens.net> writes:
>> Pawel Dembicki <paweldembicki@gmail.com> writes:
>>
>>> Enable kernel XZ compression option on PPC_85xx. Tested with
>>> simpleImage on TP-Link TL-WDR4900 (Freescale P1014 processor).
>>>
>>> Suggested-by: Christian Lamparter <chunkeey@gmail.com>
>>> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
>>> ---
>>>   arch/powerpc/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 8c1c636308c8..daf4cb968922 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -196,7 +196,7 @@ config PPC
>>>   	select HAVE_IOREMAP_PROT
>>>   	select HAVE_IRQ_EXIT_ON_IRQ_STACK
>>>   	select HAVE_KERNEL_GZIP
>>> -	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x
>>> +	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x || PPC_85xx
>>
>> (I'm not super well versed in the compression stuff, so apologies if
>> this is a dumb question.) If it's this simple, is there any reason we
>> can't turn it on generally, or convert it to a blacklist of platforms
>> known not to work?
> 
> For some platforms enabling XZ requires that your u-boot has XZ support,
> and I'm not very clear on when that support landed in u-boot and what
> boards have it. And there are boards out there with old/custom u-boots
> that effectively can't be updated.

I don't think that it has anything to do with u-boot.
AFAIK, today's mainline U-boot only supports GZIP (by default) and the 
following optional ones: LZO, LZMA, LZ4.

If we want to set additional compression types for u-boot, it is not 
enough to select HAVE_KERNEL_XXXX, we also have to update uImage 
generation scripts.

See the series I sent some time ago: 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=104153
I'll resent it without bzip2 as today's uboot doesn't support bzip2 anymore.

> 
> But as a server guy I don't really know the details of all that very
> well. So if someone tells me that we should enable XZ for everything, or
> as you say just black list some platforms, then that's fine by me.
> 

I guess we first need to understand how this is used.

Christophe
