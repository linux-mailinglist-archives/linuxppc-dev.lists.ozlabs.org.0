Return-Path: <linuxppc-dev+bounces-11307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1860DB35696
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 10:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB0wR62kvz3dMW;
	Tue, 26 Aug 2025 18:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756196439;
	cv=none; b=lzq/v+9Z2GUnam+I0uxJ0BTGuESxkPhvaMFFHWCgmmUnDgOM0566DUBeAJpS2wwPXDQmPThE4vE9k/2DAp/yt2Z87n3g5Z2hJjPosPyPGnvE07mQOoBU/0uVdYV6gabMDNH0Zu+KcQg1luI9SpuuoX35K/N0Q5Nbd4Ha9cMdL7APMDf/6i5oUz8UioinatABv/M4EjS//XHiJ+ehs9Sw3xLMII5UVPYe0loJ29aGCYp+UIlBXPctK6tMgQiqgknXpMGX4Ob0tdO83/SBPXZuFo8xUCNFX3UP+8MXyd5uoxss92KzQodagKcOfB1PcS1PecnNyA/T50394Q86ktEJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756196439; c=relaxed/relaxed;
	bh=akDH/evN1jSa2+M+C2Z9CkIi6aYILsRk5YkFpQSMb8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zb4kTqMFIQAR+/s2JoGjgPntq6njUIQHHcCVj3/aKkexwIq3EGOCX4diyI2UgY215DE9+ta86uqwOHXPrtIQ4l5PCpuspEE0tA/b4RH3kPAhWw4TmkbESVnnvT0r5x0qhyUj2sdfRFRqyUn8mbtKJgFzVk7Ojgk25noVjfnrvJLXYrcCSixsL1Tg0mN2oHQJ0UxyVwSNkbONqCdJ5EJT6XtjF0wYBdCifB4ZPM2fMMQcUdjUucnmbRyBU3649cD9iqX8OcM2WDMzo8Skl+Xtys75zR3aeEF1bAQY0qxfVHlET8lhFdnO8Ox18wjrPPz8hBQlSQvCnRf9lFZfAtYo3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB0wP4L3mz3d2N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 18:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cB0k63K4Cz9sSp;
	Tue, 26 Aug 2025 10:11:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiYLp3UY9uY7; Tue, 26 Aug 2025 10:11:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cB0k6241Nz9sSn;
	Tue, 26 Aug 2025 10:11:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A7BA8B764;
	Tue, 26 Aug 2025 10:11:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OvpXfkz87_WW; Tue, 26 Aug 2025 10:11:42 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B2258B763;
	Tue, 26 Aug 2025 10:11:40 +0200 (CEST)
Message-ID: <a506bb53-6e17-4a10-a870-50ce87a4ce06@csgroup.eu>
Date: Tue, 26 Aug 2025 10:11:40 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] sched/topology: Unify tl_smt_mask() across core
 and all arch
To: Peter Zijlstra <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
 Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
 Tobias Huschle <huschle@linux.ibm.com>,
 Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
 Guo Weikang <guoweikang.kernel@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Brian Gerst <brgerst@gmail.com>,
 Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>,
 "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrea Righi <arighi@nvidia.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-6-kprateek.nayak@amd.com>
 <20250826080123.GB3245006@noisy.programming.kicks-ass.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250826080123.GB3245006@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 26/08/2025 à 10:01, Peter Zijlstra a écrit :
>> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
>> index 602508130c8a..d75fbb7d9667 100644
>> --- a/include/linux/sched/topology.h
>> +++ b/include/linux/sched/topology.h
>> @@ -37,7 +37,13 @@ static inline int cpu_smt_flags(void)
>>   {
>>   	return SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
>>   }
>> -#endif
>> +
>> +static const __maybe_unused
>> +struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
>> +{
>> +	return cpu_smt_mask(cpu);
>> +}
>> +#endif /* CONFIG_SCHED_SMT */
> 
> Problem with that __maybe_unused is that you forgot inline.
> 
> static inline const
> struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
> {
> 	return cpu_smt_mask(cpu);
> }
> 
> seems to make it happy.
> 

But the function is referenced by SDTL_INIT() macro so there is no real 
point in declaring it inline. Would be cleaner to have it defined in a C 
file.

Christophe

