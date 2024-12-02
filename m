Return-Path: <linuxppc-dev+bounces-3677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC659E0ACC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 19:17:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Bpc5gRLz2xDl;
	Tue,  3 Dec 2024 05:17:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733163464;
	cv=none; b=V/QEvvzakEN2BquLfLeIMLCCFMLjCgWUj85cQTlReJ0j9w5VVqDA2+/tXsYvfRaH3hofa+nhOPAxNrEazqMGX6hYXpRvLkE73Er2RakY194tX1bMQ7/xuAFn6IOT7wzzKY9GBuVs5x5riiWIzKOoM4HOrDIcjC1gpnif+kXHqD5FNzarhwCRAP422gq7lY363Ytoyyv6G/03ZFnErdsU9VpbPUby3rnB4WQ8lvB5AGFs/f1Ex4xGFC6izx5lqlIV1RUQuTyGeAdYP3455EbaRMFH0iURjvKZrBG/ozMpmbi4ai5xyGUH2e/J3ld1H/Hf9okMu2XkAjetVBlDV3MRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733163464; c=relaxed/relaxed;
	bh=jGnTO6uQa3S4Bq+gCHNVqP0SfYOh9yq8KOSxv1EmO2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meMAgdZnDXVN4t+mMdJBfgiOqzR5sk3tQRULIJH0dwtIgK1whS4F1dqnIR50uOj+hLD+AtO+DtuB8WaPonB4HNwMA6Fwia3g+bGpPhlDUWxV8oiWfuE8KqfzjmlqpikKII7WGsHPgFRFgtSC+OMrcO1scMH5WZp+BrgwqIXhNueJi8+oplfSX03egDlD8CdLHPvSsEVQDjwHug7WQHAuB0hHXI1cmN5kLEdLMiEnCnPIgfKhD225KaXtJff4q6aEi9RQdY18Wi/ZGw3lWCqmVE6yxbUABpdPiGjNGOKPpVd+w2DsRDw56GnUfUAHSq5aaco8pm8V1Lp4C9/YKvF3Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Bpb5LNCz2xCp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 05:17:43 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2BpT6ncGz9sPd;
	Mon,  2 Dec 2024 19:17:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJGLH475UjM9; Mon,  2 Dec 2024 19:17:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2BpT5m4tz9rvV;
	Mon,  2 Dec 2024 19:17:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FDB48B765;
	Mon,  2 Dec 2024 19:17:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Q_hUgq0oLnxX; Mon,  2 Dec 2024 19:17:37 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 222188B763;
	Mon,  2 Dec 2024 19:17:37 +0100 (CET)
Message-ID: <3de6bf25-fb3c-49a9-b06b-5e2e527ec90c@csgroup.eu>
Date: Mon, 2 Dec 2024 19:17:36 +0100
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
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-2-sshegde@linux.ibm.com>
 <b5c152a3-d459-4744-84ec-846153de1652@csgroup.eu>
 <026ad776-a889-4213-8e0e-1da9065dc5ef@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <026ad776-a889-4213-8e0e-1da9065dc5ef@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 02/12/2024 à 15:05, Shrikanth Hegde a écrit :
> 
> 
> On 11/27/24 12:07, Christophe Leroy wrote:
>>
>>
>> Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
>>> PowerPC uses asm-generic preempt definitions as of now.
>>> Copy that into arch/asm so that arch specific changes can be done.
>>> This would help the next patch for enabling dynamic preemption.
>>
> 
> The reason I want the content instead was to allow future patches where 
> I thought of making preempt count per paca for ppc64 atleast. generic 
> code assumes it is per thread. If this change is to be done at that 
> point, that is fair too. I am okay with it.

I think it is better to keep series minimal and consistent. If you have 
a futur plan, no problem, keep it future and do everything at once 
unless it is heavy and better done in two steps.

As we say in French, a lot of water will have flowed under the bridge by 
then.

I'm sure there will be a lot of discussion when you do that and maybe at 
the end you will end up with something completely different than what 
you have in mind at the moment.

> 
> 
>> Instead of copying all the content of asm-generic version, can you 
>> just create a receptacle for your new macros, that will include asm- 
>> generic/ preempt.h ?
>>
>> Look at arch/powerpc/include/asm/percpu.h for exemple.
>>
> 
> You mean something like below right?
> 
> 
> #ifndef __ASM_POWERPC_PREEMPT_H
> #define __ASM_POWERPC_PREEMPT_H
> 
> #include <asm-generic/preempt.h>
> 
> #if defined(CONFIG_PREEMPT_DYNAMIC) && 
> defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> #endif
> 
> #endif /* __ASM_POWERPC_PREEMPT_H */

Yes exactly.



