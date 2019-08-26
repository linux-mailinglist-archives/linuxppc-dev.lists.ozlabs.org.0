Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0099CE92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 13:50:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H9LQ04zLzDqRv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 21:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="DHe4OChf"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H9JH2Gj6zDqNW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 21:48:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46H9J474ncz9v6VH;
 Mon, 26 Aug 2019 13:48:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DHe4OChf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MtV9cCNuh1wj; Mon, 26 Aug 2019 13:48:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46H9J45wZjz9v6VG;
 Mon, 26 Aug 2019 13:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566820116; bh=/3WuMrmdmWS/5c4f2953Y2GY9Thjm0CP+EMv8HdNY7A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DHe4OChf62mrSsZsw5oDG402l8JwrMpk5BSCEU2X1imYi53QpoXclriQwbQ7g+vVX
 YB7D0NDfO/Mhpxc62/VIlNbKvWLdIAIwq2FKo/8p+hlRo2jciMygkjZQ+bPfprCiYc
 f8KMBQzS25e/thiKiAkyJdJf6bhNv45H1KVWdMwM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C9C218B7E1;
 Mon, 26 Aug 2019 13:48:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9Ki3Zbb64eje; Mon, 26 Aug 2019 13:48:41 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A6AD18B7DE;
 Mon, 26 Aug 2019 13:48:41 +0200 (CEST)
Subject: Re: [PATCH] powerpc/time: use feature fixup in __USE_RTC() instead of
 cpu feature.
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <55c267ac6e0cd289970accfafbf9dda11a324c2e.1566802736.git.christophe.leroy@c-s.fr>
 <87blwc40i4.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ba2a7a1f-8dcc-ec44-81d4-ef11a9e29377@c-s.fr>
Date: Mon, 26 Aug 2019 13:48:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87blwc40i4.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/08/2019 à 13:41, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> sched_clock(), used by printk(), calls __USE_RTC() to know
>> whether to use realtime clock or timebase.
>>
>> __USE_RTC() uses cpu_has_feature() which is initialised by
>> machine_init(). Before machine_init(), __USE_RTC() returns true,
>> leading to a program check exception on CPUs not having realtime
>> clock.
>>
>> In order to be able to use printk() earlier, use feature fixup.
>> Feature fixups are applies in early_init(), enabling the use of
>> printk() earlier.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/include/asm/time.h | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> The other option would be just to make this a compile time decision, eg.
> add CONFIG_PPC_601 and use that to gate whether we use RTC.

Euh ... yes OK, why not. And that would help simplify many places in the 
code. I can propose something in that direction, but it will be a bigger 
change.


> 
> Given how many 601 users there are, maybe 1?, I think that would be a
> simpler option and avoids complicating the code / binary for everyone
> else.

However this patch doesn't complicate things more than it was with 
cpu_has_feature() which does exactly the same but using static keys, 
does it ?

Christophe


> 
> cheers
> 
>> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
>> index 54f4ec1f9fab..3455cb54c333 100644
>> --- a/arch/powerpc/include/asm/time.h
>> +++ b/arch/powerpc/include/asm/time.h
>> @@ -42,7 +42,14 @@ struct div_result {
>>   /* Accessor functions for the timebase (RTC on 601) registers. */
>>   /* If one day CONFIG_POWER is added just define __USE_RTC as 1 */
>>   #ifdef CONFIG_PPC_BOOK3S_32
>> -#define __USE_RTC()	(cpu_has_feature(CPU_FTR_USE_RTC))
>> +static inline bool __USE_RTC(void)
>> +{
>> +	asm_volatile_goto(ASM_FTR_IFCLR("nop;", "b %1;", %0) ::
>> +			  "i" (CPU_FTR_USE_RTC) :: l_use_rtc);
>> +	return false;
>> +l_use_rtc:
>> +	return true;
>> +}
>>   #else
>>   #define __USE_RTC()	0
>>   #endif
>> -- 
>> 2.13.3
