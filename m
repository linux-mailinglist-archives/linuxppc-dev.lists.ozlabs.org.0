Return-Path: <linuxppc-dev+bounces-5719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD51A230F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 16:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkN4R2vVGz2yLB;
	Fri, 31 Jan 2025 02:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738250407;
	cv=none; b=AUrndfTo2jIhJ5MauH/g2ipYFv5zlj1nyeZCjsSADhjrpu0N+PCY9xMsotE0/AicMAmimXyLS2isY5IltJ6YJysHeyCOzIgtA8a3kHUKPfKByc3SH4zAgYKS/5svEsVConut2idNddhQgsZuZb3WljsIetUScGVwsbz9zbgWJTS6UurkLQUJzMAuQ+Yfr5yQ8juB2xOw1zViF2+inkR8d8MQmied2L8Jdr8NAhpUdDnQJXVesELg31I2aItpTCH8epdlWBxfzHVGpDej30v9wqtkV5sbIwWOMkNq0mAluP+RN0g4oWom+rdWIycCMVAheb3FxkknbTjxsmUg9eLGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738250407; c=relaxed/relaxed;
	bh=WGtgHgyAhFJsJBCIiscYwxsECM9+t5TcbQbSEJJ8dz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCRjXMmoheYk8Qgnn32APtZtNmXT6OGbbQib0a3MVtrVttKu5rCxGc5x0r/k2VVUIjQuiIXL1/wxgMDPTk9A6lc5CAt4pIqVhCnWVs2uhZwshkn0qfa2oSpBTGwaUhQv1bV7w9H5R0fa5Ji4M7K64R/wy8qx7svqdDADfnaO/sha/xcIfdb0RKCfImRth30Y7fGg4r4MLmWDd5iGsFD4j/jT3/E5+rrvlK6Ba1i76vWXpFDoVBQKwr6JzGhvqbABUiyH36GMQM2J3VWJWn0jnJ3vQ50tlEiTa2K/gQo9FTYpYndxs/5/BJV4HGDE+K7615cIuWGfnSDHBxjby5jBXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkN4Q2RPXz2xxx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 02:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YkMhs5qpGz9sS8;
	Thu, 30 Jan 2025 16:03:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97DfCRLs5zAY; Thu, 30 Jan 2025 16:03:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YkMhs534sz9sS7;
	Thu, 30 Jan 2025 16:03:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9AC968B774;
	Thu, 30 Jan 2025 16:03:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9tEHCDtSNdJp; Thu, 30 Jan 2025 16:03:09 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4199A8B763;
	Thu, 30 Jan 2025 16:03:09 +0100 (CET)
Message-ID: <05f6f732-e155-4b60-8c4e-984e42e51ee4@csgroup.eu>
Date: Thu, 30 Jan 2025 16:03:09 +0100
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
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, linux-kernel@vger.kernel.org
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250130145409.D_so_mR1@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 30/01/2025 à 15:54, Sebastian Andrzej Siewior a écrit :
> On 2025-01-06 10:49:19 [+0530], Shrikanth Hegde wrote:
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -25,6 +25,10 @@
>>   unsigned long global_dbcr0[NR_CPUS];
>>   #endif
>>   
>> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
>> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>> +#endif
> 
> I am uncertain here: Do you need to DEFINE it? It is set by the sched
> core which also defines it. It should be same thing after all, right?

As far as I can see it is not handled by sched core.

$ git grep sk_dynamic_irqentry_exit_cond_resched
arch/arm64/include/asm/preempt.h:DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
arch/arm64/kernel/entry-common.c:DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
arch/arm64/kernel/entry-common.c: 
(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
include/linux/entry-common.h:DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
kernel/entry/common.c:DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
kernel/entry/common.c:  if 
(!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))

It is in common entry but arm64 and powerpc don't use common entry.

$ git grep GENERIC_ENTRY arch
arch/Kconfig:config GENERIC_ENTRY
arch/loongarch/Kconfig: select GENERIC_ENTRY
arch/riscv/Kconfig:     select GENERIC_ENTRY
arch/s390/Kconfig:      select GENERIC_ENTRY
arch/x86/Kconfig:       select GENERIC_ENTRY


Christophe


