Return-Path: <linuxppc-dev+bounces-3755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7CA9E2C4B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:48:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2rmJ1Btsz30DX;
	Wed,  4 Dec 2024 06:48:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733255280;
	cv=none; b=oirbkPnpl4XU6iY25A3psr0fnemZ+hAKf/Xe7oHQkV6BrAyqu0MkGSCf+crFSp13+R6WPy2TJ3qVp4HkIz/iksAfe923d8ae+RtT5/9WUbDguprCEqYqhnYvoLVYHuZQTI3yTLhhRk9HKLm6hYC5efbSeTZkqZMNIvYQu93PDBnWijSkErylVIDimwyzw2Wvc64caxIkV9u8k/7edmROOrDH1wt90O3+flnDcuwsL8slPscCUlrnS6dDfiXNk1GCUWHuB9FJ81ZqmC6gT76GdlwBAPS8O6QNWDhKzRtxhHH6DGH2Ikyp7TgUM15FSJ2bJCH9VLU7SEORJS3upU9lCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733255280; c=relaxed/relaxed;
	bh=0oIhyuU0R4wfxCPfVMz9/K37wWwC7Uu4PUY3mfLTLOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GmYnGoctQpLylcgZ0Gr0WVG8RWBs5Bi6UfDGGksXHO+DF9XewxWlK8Be6WVFeZMby/wzqxOhfFfXL4PZ3TO5fN0MjPVWJnj4R/JNtj94uUXZe/0OieSY+Z5lJejcgg+/aScsdC8SLnELx/xLOkZWcbvwNmtwbkdcAwFl0APrgCGRHUBU+WkVA2DTj9sJp1PBSr6/cvNqIf70L+vTfs+YT5lCCDouJrxrTBn1cHFxkWRA0WyaqbPFwR+MQG4nMu7twuEFngHDdAA/GGQ7Nwygx4Vfv90JFsGnoOm/r6fX6l4nH0ojaenKDfsCvcoDOrZJ6CZh7Pfcpgla1sei2bIHQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2rmH1R4Hz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:47:59 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2rmD2tq1z9stR;
	Tue,  3 Dec 2024 20:47:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjRWoB7pfHPC; Tue,  3 Dec 2024 20:47:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2rmD1yqcz9stQ;
	Tue,  3 Dec 2024 20:47:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 362878B767;
	Tue,  3 Dec 2024 20:47:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nA_6e8aHGeAM; Tue,  3 Dec 2024 20:47:56 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A79C08B763;
	Tue,  3 Dec 2024 20:47:55 +0100 (CET)
Message-ID: <f3fb20e0-516b-4b7a-a6e2-14721c078fd1@csgroup.eu>
Date: Tue, 3 Dec 2024 20:47:55 +0100
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
Subject: Re: [PATCH 1/3] powerpc: copy preempt.h into arch/include/asm
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-2-sshegde@linux.ibm.com>
 <b5c152a3-d459-4744-84ec-846153de1652@csgroup.eu>
 <026ad776-a889-4213-8e0e-1da9065dc5ef@linux.ibm.com>
 <3de6bf25-fb3c-49a9-b06b-5e2e527ec90c@csgroup.eu>
 <8715eb95-e142-4b42-83d1-7e4cc2fa8650@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8715eb95-e142-4b42-83d1-7e4cc2fa8650@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 03/12/2024 à 15:00, Shrikanth Hegde a écrit :
> 
> 
> On 12/2/24 23:47, Christophe Leroy wrote:
>>
>>
>> Le 02/12/2024 à 15:05, Shrikanth Hegde a écrit :
>>>
>>>
>>> On 11/27/24 12:07, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
>>>>> PowerPC uses asm-generic preempt definitions as of now.
>>>>> Copy that into arch/asm so that arch specific changes can be done.
>>>>> This would help the next patch for enabling dynamic preemption.
>>>>
>>>
>>> The reason I want the content instead was to allow future patches 
>>> where I thought of making preempt count per paca for ppc64 atleast. 
>>> generic code assumes it is per thread. If this change is to be done 
>>> at that point, that is fair too. I am okay with it.
>>
>> I think it is better to keep series minimal and consistent. If you 
>> have a futur plan, no problem, keep it future and do everything at 
>> once unless it is heavy and better done in two steps.
>>
>> As we say in French, a lot of water will have flowed under the bridge 
>> by then.
>>
>> I'm sure there will be a lot of discussion when you do that and maybe 
>> at the end you will end up with something completely different than 
>> what you have in mind at the moment.
>>
> 
> ok.
> 
>>>
>>>
>>>> Instead of copying all the content of asm-generic version, can you 
>>>> just create a receptacle for your new macros, that will include asm- 
>>>> generic/ preempt.h ?
>>>>
>>>> Look at arch/powerpc/include/asm/percpu.h for exemple.
>>>>
>>>
>>> You mean something like below right?
>>>
>>>
>>> #ifndef __ASM_POWERPC_PREEMPT_H
>>> #define __ASM_POWERPC_PREEMPT_H
>>>
>>> #include <asm-generic/preempt.h>
>>>
>>> #if defined(CONFIG_PREEMPT_DYNAMIC) && 
>>> defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
>>> DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>>> #endif
>>>
>>> #endif /* __ASM_POWERPC_PREEMPT_H */
>>
>> Yes exactly.
>>
>>
> 
> Should I send v2 with this and using DYNAMIC_KEY?


Yes you can do that, but I guess it is not urgent as it requires the 
lazy patches to be merged first and spend some time in linux-next ?

Christophe

