Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F34DBCA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 08:11:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44svRw4L4fzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 16:11:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EgqvEJ/V"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44svQP1v1TzDqKt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 16:10:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44svQF3b2Cz9v2qp;
 Mon, 29 Apr 2019 08:09:57 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EgqvEJ/V; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XBwTEbiM8jdW; Mon, 29 Apr 2019 08:09:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44svQF2K3lz9v2qm;
 Mon, 29 Apr 2019 08:09:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556518197; bh=77DuINPUIhTVJcSszgJjnV/Qene7kGs++C3qUyuhiU8=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=EgqvEJ/VSvjCLeh6S6QkV5kXnEfQ1+U9M2lGDMOpv4B69vzhK1kW7M6759B/+Uvp1
 5FLERh55AOkpgoQvW4yxLoU3JXgjMcrazjdCBzG66hHbj2hsxqhTykYQ8thn2KiE7O
 Rl+QYkFPEGhwOUK3KSFz8mpmLJP05M81rFEvXZJI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C43188B798;
 Mon, 29 Apr 2019 08:10:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NuMY6MLhLAek; Mon, 29 Apr 2019 08:10:01 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FE878B795;
 Mon, 29 Apr 2019 08:10:01 +0200 (CEST)
Subject: Re: Machine Check Exceptions
To: "Rodriguez Quesada, Pablo" <Pablo.Rodriguez-Quesada@windriver.com>
References: <0CDD4071D6ACF54ABB9CF1A6D90375A809B91A41@ALA-MBD.corp.ad.wrs.com>
 <64209dd1-7cce-4061-1139-15e7ef394e66@c-s.fr>
 <0CDD4071D6ACF54ABB9CF1A6D90375A809B91C51@ALA-MBD.corp.ad.wrs.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <49f28ecd-b2c2-aa9f-8183-f6c945824292@c-s.fr>
Date: Mon, 29 Apr 2019 08:10:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0CDD4071D6ACF54ABB9CF1A6D90375A809B91C51@ALA-MBD.corp.ad.wrs.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pablo,

I know nothing about mce-inject.

The driver I wrote that you are referring to is to handle the watchdog 
in e300 powerpc core. This is because the e300 gererates a machine check 
on expiry when the watchdog is configured in NMI mode.

Therefore, triggering the machine check is rather easy in that case, I 
just have to stop refreshing the watchdog.

Christophe

Le 25/04/2019 à 17:35, Rodriguez Quesada, Pablo a écrit :
> Hi Christopher,
> 
> I am trying to create a custom handler for MCE, but I don't have a way to trigger it (Or don't know how)
> 
> Therefore I looked at the mce-inject tool(**) and compile it for PPC but the path "/sys/devices/system/machine check/machinecheck0" doesn't exist unlike Intel architecture and the app fails. I want to fix it.
> 
> My question is: Do you know if there is a way to inject an MCE on PowerPC? Or can you guide me on how to start my research about it. I find it very difficult to search for PPC documentation. That is why I am writing to you, to get any tips for developing a mce-inject for PPC. And of course, I would be more than glad to contribute to the OpenSource community.
> 
> Also, how did you test your handler? Do you have an easy mechanism to trigger the exceptions?
> 
> Thank you,
> Pablo
> 
> (**) https://github.com/andikleen/mce-inject/
> 
> 
> 
> -----Original Message-----
> From: Christophe Leroy <christophe.leroy@c-s.fr>
> Sent: Wednesday, April 24, 2019 11:07 PM
> To: Rodriguez Quesada, Pablo <Pablo.Rodriguez-Quesada@windriver.com>
> Subject: Re: Machine Check Exceptions
> 
> Hi Pablo,
> 
> No problem
> 
> Christophe
> 
> 
> Le 24/04/2019 à 21:33, Rodriguez Quesada, Pablo a écrit :
>> Hi Cristopher,
>>
>> Hope you are doing good!
>>
>> I am learning about Machine Check Exceptions on PPC, and I found this
>> commit of yours:
>>
>> https://github.com/torvalds/linux/commit/0deae39cec6dab3a66794f3e9e83c
>> a4dc30080f1
>>
>> Would you mind if I ask you a couple of questions?
>>
>> Thank you,
>>
>> WR logo signiture <http://www.windriver.com/>
>>
>> 	
>>
>> *Pablo Rodriguez*, Intern, Wind River Costa Rica
>>
