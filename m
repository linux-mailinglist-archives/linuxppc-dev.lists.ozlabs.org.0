Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE905347171
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 07:15:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4ydm5CJcz3brV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 17:15:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4ydR4Kvjz2yy4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 17:15:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F4ydH3K1sz9v0SD;
 Wed, 24 Mar 2021 07:14:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id S9cQDlsfD6rS; Wed, 24 Mar 2021 07:14:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F4ydH2Qgmz9v0SB;
 Wed, 24 Mar 2021 07:14:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E5498B812;
 Wed, 24 Mar 2021 07:15:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id B0ip2SmJdw6T; Wed, 24 Mar 2021 07:15:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5800D8B76A;
 Wed, 24 Mar 2021 07:14:59 +0100 (CET)
Subject: Re: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 He Ying <heying24@huawei.com>
References: <20210323091257.90054-1-heying24@huawei.com>
 <YFppJkpZRHMJFay0@piout.net> <YFp0Qc2P61V+3bm0@piout.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <95cd80c5-40ff-1316-9c89-2e8e7836fb6a@csgroup.eu>
Date: Wed, 24 Mar 2021 07:14:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFp0Qc2P61V+3bm0@piout.net>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, geert+renesas@glider.be,
 peterz@infradead.org, frederic@kernel.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, kernelfans@gmail.com, tglx@linutronix.de,
 msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/03/2021 à 00:05, Alexandre Belloni a écrit :
> On 23/03/2021 23:18:17+0100, Alexandre Belloni wrote:
>> Hello,
>>
>> On 23/03/2021 05:12:57-0400, He Ying wrote:
>>> We found these warnings in arch/powerpc/kernel/time.c as follows:
>>> warning: symbol 'decrementer_max' was not declared. Should it be static?
>>> warning: symbol 'rtc_lock' was not declared. Should it be static?
>>> warning: symbol 'dtl_consumer' was not declared. Should it be static?
>>>
>>> Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
>>> Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
>>> avoid the conflict with the variable in powerpc asm/time.h.
>>> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
>>> is declared there.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: He Ying <heying24@huawei.com>
>>> ---
>>> v2:
>>> - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
>>>    rtc_lock in powerpc asm/time.h.
>>>
>>
>> V1 was actually the correct thing to do. rtc_lock is there exactly
>> because chrp and maple are using mc146818 compatible RTCs. This is then
>> useful because then drivers/char/nvram.c is enabled. The proper fix
>> would be to scrap all of that and use rtc-cmos for those platforms as
>> this drives the RTC properly and exposes the NVRAM for the mc146818.
>>
>> Or at least, if there are no users for the char/nvram driver on those
>> two platforms, remove the spinlock and stop enabling CONFIG_NVRAM or
>> more likely rename the symbol as it seems to be abused by both chrp and
>> powermac.
>>
> 
> Ok so rtc_lock is not even used by the char/nvram.c driver as it is
> completely compiled out.
> 
> I guess it is fine having it move to the individual platform as looking
> very quickly at the Kconfig, it is not possible to select both
> simultaneously. Tentative patch:
> 

Looking at it once more, it looks like including linux/mc146818rtc.h is the thing to do, at least 
for now. Several platforms are defining the rtc_lock exactly the same way as powerpc does, and 
including mc146818rtc.h

I think that to get it clean, this change should go in a dedicated patch and do a bit more and 
explain exactly what is being do and why. I'll try to draft something for it.

He Y., can you make a version v3 of your patch excluding the rtc_lock change ?

Christophe
