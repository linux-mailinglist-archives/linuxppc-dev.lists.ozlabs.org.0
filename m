Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A97409D194
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 16:24:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HDlt1dSLzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 00:24:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Y/SwOjPQ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HCms17K8zDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 23:40:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HCmf2BRGz9v6M8;
 Mon, 26 Aug 2019 15:40:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Y/SwOjPQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RGrgdY2y_xm7; Mon, 26 Aug 2019 15:40:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HCmf17Bcz9v6M7;
 Mon, 26 Aug 2019 15:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566826802; bh=yY3k41gmYf/DTKvMuEJLOJQmABAXRkhQIZBCeG8ju+s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Y/SwOjPQCG5asoLq8HEiW+NmcAW6rp7X9WBxmSHDBLAgvDkYIo2M2gj6I191Fm1oT
 wmYMKR+1N+9Gr7hTTnQPr80A67lICgWnilEeGHZTO6YKv9nOBGP8zqn/dpvoFYFcoG
 F8x0WGFlmLGe/3/5b4sGJsBtIX/R1pUkq5kwk4xk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B5D58B7E1;
 Mon, 26 Aug 2019 15:40:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Jyrpu0M7eqWM; Mon, 26 Aug 2019 15:40:07 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 113768B7DE;
 Mon, 26 Aug 2019 15:40:07 +0200 (CEST)
Subject: Re: [PATCH] powerpc/time: use feature fixup in __USE_RTC() instead of
 cpu feature.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <55c267ac6e0cd289970accfafbf9dda11a324c2e.1566802736.git.christophe.leroy@c-s.fr>
 <87blwc40i4.fsf@concordia.ellerman.id.au>
 <60da7620a43dc29317a062f1d58dcfde8d32b258.camel@kernel.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <bbfb63db-4d73-b638-79f3-9bee3b6749f9@c-s.fr>
Date: Mon, 26 Aug 2019 15:40:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <60da7620a43dc29317a062f1d58dcfde8d32b258.camel@kernel.crashing.org>
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



Le 26/08/2019 à 15:25, Benjamin Herrenschmidt a écrit :
> On Mon, 2019-08-26 at 21:41 +1000, Michael Ellerman wrote:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>> sched_clock(), used by printk(), calls __USE_RTC() to know
>>> whether to use realtime clock or timebase.
>>>
>>> __USE_RTC() uses cpu_has_feature() which is initialised by
>>> machine_init(). Before machine_init(), __USE_RTC() returns true,
>>> leading to a program check exception on CPUs not having realtime
>>> clock.
>>>
>>> In order to be able to use printk() earlier, use feature fixup.
>>> Feature fixups are applies in early_init(), enabling the use of
>>> printk() earlier.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>> ---
>>>   arch/powerpc/include/asm/time.h | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> The other option would be just to make this a compile time decision, eg.
>> add CONFIG_PPC_601 and use that to gate whether we use RTC.
>>
>> Given how many 601 users there are, maybe 1?, I think that would be a
>> simpler option and avoids complicating the code / binary for everyone
>> else.
> 
> Didn't we ditch 601 support years ago anyway ? We had workaround we
> threw out I think...

There are still workarounds for 601 in the kernel, for exemple (in 
arch/powerpc/include/asm/ppc_asm.h)

/* various errata or part fixups */
#ifdef CONFIG_PPC601_SYNC_FIX
#define SYNC				\
BEGIN_FTR_SECTION			\
	sync;				\
	isync;				\
END_FTR_SECTION_IFSET(CPU_FTR_601)
#define SYNC_601			\
BEGIN_FTR_SECTION			\
	sync;				\
END_FTR_SECTION_IFSET(CPU_FTR_601)
#define ISYNC_601			\
BEGIN_FTR_SECTION			\
	isync;				\
END_FTR_SECTION_IFSET(CPU_FTR_601)
#else
#define	SYNC
#define SYNC_601
#define ISYNC_601
#endif

But if you think we can get rid of 601 completely, I'm happy with that.

Christophe


> 
> Cheers,
> Ben.
> 
>> cheers
>>
>>> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
>>> index 54f4ec1f9fab..3455cb54c333 100644
>>> --- a/arch/powerpc/include/asm/time.h
>>> +++ b/arch/powerpc/include/asm/time.h
>>> @@ -42,7 +42,14 @@ struct div_result {
>>>   /* Accessor functions for the timebase (RTC on 601) registers. */
>>>   /* If one day CONFIG_POWER is added just define __USE_RTC as 1 */
>>>   #ifdef CONFIG_PPC_BOOK3S_32
>>> -#define __USE_RTC()	(cpu_has_feature(CPU_FTR_USE_RTC))
>>> +static inline bool __USE_RTC(void)
>>> +{
>>> +	asm_volatile_goto(ASM_FTR_IFCLR("nop;", "b %1;", %0) ::
>>> +			  "i" (CPU_FTR_USE_RTC) :: l_use_rtc);
>>> +	return false;
>>> +l_use_rtc:
>>> +	return true;
>>> +}
>>>   #else
>>>   #define __USE_RTC()	0
>>>   #endif
>>> -- 
>>> 2.13.3
