Return-Path: <linuxppc-dev+bounces-3756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B179E2C6B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:53:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2rv13Kflz30TS;
	Wed,  4 Dec 2024 06:53:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733255629;
	cv=none; b=UMWg0YTbVFmN1/JR3kEgvmOqtxBtEFif+jGWrolByVjPyqktYGSUBjchSu2uaXAhGmiFgktLKS+hofkNCI/JqxeNn2H8YeziaQND3sZKZZm9yk822VHRkB9euZIRex90xooJNDBYJv1xVGoPAH7gStuqwCBnJPyRbPQDnPsUmRUl2yVvaEKdGOgcHnXuNrwAmPbO0OPbDEeKXbStihg/40VvwSwrzByzV8YBxIhxwh1g++qUmARGNA23z1yC9aQuU99sQAu/waz9Ct+L3DzdIb61bYDhcTv97FifZtH9OcqUONcvTV79/qy0SUfgGxddSD+65CcNW7MToyW5Fb5WxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733255629; c=relaxed/relaxed;
	bh=THc/iztjpFlr1d8A3msDx/mBMdujBeNYbnvmLxuZQeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7cBX91S2HltbsQ7CwVnWgLNp01OsilYZwwr00QzHU/Mte+CNXU9tEFOTqaJZyuAJp5REZ3cZDbufM76bN0q5czEwajNxrXKC1XwiO9/MSRAk8bLSP368sCHvj/dgFRic85p3s3F/Lxsev0avIXZWCsJ9fr4CetGf8IFieaotkJErbOmbxeI40sBNPAH35phKxacWz6c5/WTwXbpaqQOzo+TTPFUmJWryOaKUh1WRCbkmVAwTMNJZ2p3tB4jxWKmNPql+ciWXm1rQ6U2RY2C0q2gYPzOQqm65a+FR+DtDeG1x1CMqeI0GUhHaks3bSqvKk97jvtBKJT8x4QzBxwn/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2rv02fXSz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:53:48 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2rtx34wrz9stR;
	Tue,  3 Dec 2024 20:53:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zs1iyu-MUpRl; Tue,  3 Dec 2024 20:53:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2rtx1qpPz9stQ;
	Tue,  3 Dec 2024 20:53:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 301298B767;
	Tue,  3 Dec 2024 20:53:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3-0Y2_s9E4jO; Tue,  3 Dec 2024 20:53:45 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 997728B763;
	Tue,  3 Dec 2024 20:53:44 +0100 (CET)
Message-ID: <d736a5cc-d976-49fd-9f86-0151d4b0a050@csgroup.eu>
Date: Tue, 3 Dec 2024 20:53:44 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powerpc: support dynamic preemption
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-3-sshegde@linux.ibm.com>
 <5089fd16-bc8c-4231-a89b-2658445e04b7@csgroup.eu>
 <ff4c586b-7be7-4c31-8b8c-5846ded486de@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ff4c586b-7be7-4c31-8b8c-5846ded486de@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 01/12/2024 à 20:45, Shrikanth Hegde a écrit :
> 
> 
> On 11/27/24 12:14, Christophe Leroy wrote:
>>
>>
>> Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
>>> Once the lazy preemption is supported, it would be desirable to change
>>> the preemption models at runtime. So this change adds support for 
>>> dynamic
>>> preemption using DYNAMIC_KEY.
>>>
>>> In irq-exit to kernel path, use preempt_model_preemptible for decision.
>>> Other way would be using static key based decision. Keeping it
>>> simpler since key based change didn't show performance improvement.
>>
>> What about static_call, wouldn't it improve performance ?
>>
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 6d6bbd93abab..01c58f5258c9 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -270,6 +270,7 @@ config PPC
>>>       select HAVE_PERF_EVENTS_NMI        if PPC64
>>>       select HAVE_PERF_REGS
>>>       select HAVE_PERF_USER_STACK_DUMP
>>> +    select HAVE_PREEMPT_DYNAMIC_KEY
>>
>> Can you use HAVE_PREEPT_DYNAMIC_CALL instead ? That should be more 
>> performant.
>>
>> I know static calls are not in for PPC64 yet, you can restart from 
>> https://eur01.safelinks.protection.outlook.com/? 
>> url=http%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinuxppc- 
>> dev%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C696bf56dcb544f3e49a408dd1240c477%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638686791595217076%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iUwKXhmoU3YgqNI%2Bi7vwi%2Fz4obxMXD0au%2Fclo1m23ng%3D&reserved=0 cover/20221010002957.128276-1-bgray@linux.ibm.com/ and https:// github.com/linuxppc/issues/issues/416
>>
> 
> Thanks Christophe, I will take a look and understand.
> 
> May be stupid question, do the concerns of arm still valid for ppc64/ 
> ppc32 out-line static calls?

Not sure. Don't know what they call landing pad.

Limited branch range is a limitation for sure, but whatever the method 
when the called function is too far indirect call is required. And on 
powerpc the max distance is 32 Mb which is quite big for a standard 
kernel. Only modules should be concerned, but do we have scheduling code 
in modules ?

CFI I don't know.

Anyway, I resurected the series I sent to implement inline static calls 
on PPC32. I'm sure we can then amplify it to PPC64.


> https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220214165216.2231574-6- 
> mark.rutland%40arm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C696bf56dcb544f3e49a408dd1240c477%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638686791595233955%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=8jT7JHp7HgNIwVEEL7gAI8JiDvCFDShI1eIeARWwbVo%3D&reserved=0
> 
> As I understood, that is the reason they went ahead with DYNAMIC_KEY.

In their commit they have comparisons of assembly code. Can you do the 
same for powerpc to get a better picture of what we are talking about ?


Christophe

