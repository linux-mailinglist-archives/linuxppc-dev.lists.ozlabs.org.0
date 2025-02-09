Return-Path: <linuxppc-dev+bounces-6007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FACA2E005
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 19:50:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrcG73JKqz2yVF;
	Mon, 10 Feb 2025 05:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739127007;
	cv=none; b=Lf2EV250qCQEuqmqnh6+k9wHcUpMMX4Av8PT6xNGEg2h7SyGb1ZFhKX9XmpoeTcZ5vs+mgiJZujrW88r8ZfOPswUeaI4HugjH9mcodVVYomGmLxUCzJehZ1IuifCK1Pcw7QO8frlXc9XcAEWiurnrraW0Ov/Ouh+ecLRukx5MmZkxkConoiU6tzbd2yzyDAt0bV+ZvYvJ8R00o3lLAXfaJLijMfMeyy/bWKmuA7SNAhhTlXmTBnnmfbBO+J5IOmnj6flYbbIqV5kRAD7ucOB+Xm67LYxUDEk7OaAwR3qkz6p1ShUqOOZj87So8oaOPrgW/ZkTBnPdu3OmAXxENDGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739127007; c=relaxed/relaxed;
	bh=CpONG0rbEqBNTlYB4LWJHxewj3mVx4KrNJX9G+KswfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/ApSk6h9wfbmEXwSCHSmYS1IWv8UVZU7zEAi50UtKEwiezoCuAZPEogmsTiwC5A7CvSA0zwYEKZQCqDTvftoC2NhwSupppRjorBHyzGy4nx99rf2WA/i1DGM4Vy0agKdl+wAe+Qv9Qzr3IeewaCS05JA2Ryp/60E5ycCkDNmnAp9zcw4JKH9XT4FQ1GT0C57x5fzZUtqYrIP/2S2e637Ynwbo3S8ifhBOlCOd2r5E8ueHhw0kT3nOfC1t9do41d9JKycGqHp4XarWzbLlF25jbmZLXhV3Zj/KsDBKWfyTl2v4kM6aW4YHL4AM7gL+R+kp2lOUoDLGxCLbTJ9djUuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrcG63BnZz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 05:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yrc4y5BH2z9sPd;
	Sun,  9 Feb 2025 19:42:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogLfoC-SXGTd; Sun,  9 Feb 2025 19:42:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yrc4y4J49z9rvV;
	Sun,  9 Feb 2025 19:42:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7541C8B764;
	Sun,  9 Feb 2025 19:42:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uy_LGgAXm037; Sun,  9 Feb 2025 19:42:10 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B5028B763;
	Sun,  9 Feb 2025 19:42:09 +0100 (CET)
Message-ID: <deb0d4fa-d2ec-4acc-b217-b5ebb683bf05@csgroup.eu>
Date: Sun, 9 Feb 2025 19:42:07 +0100
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
Subject: Re: [PATCH v3 5/9] powerpc: Use preempt_model_str().
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 Ben Segall <bsegall@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
 <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
 <20250204082223.6iNyq_KR@linutronix.de>
 <7b51f7de-8e4b-4766-85ca-dee24832c693@linux.ibm.com>
 <93833119-9406-4d30-aa7b-4521adb3a573@csgroup.eu>
 <936f0451-a4ee-4e14-9ce9-9cd9613fc55c@linux.ibm.com>
 <0f05c020-47e4-444d-90ab-9eb8414f4ef8@csgroup.eu>
 <b95272d4-e593-48e9-aa32-8758394f4b61@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b95272d4-e593-48e9-aa32-8758394f4b61@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 09/02/2025 à 15:38, Shrikanth Hegde a écrit :
> 
> 
> On 2/8/25 23:25, Christophe Leroy wrote:
>>
>>
>> Le 08/02/2025 à 14:42, Shrikanth Hegde a écrit :
>>>
>>>
>>> On 2/8/25 18:25, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 08/02/2025 à 08:35, Shrikanth Hegde a écrit :
>>>>>
>>>>>
>>>>> On 2/4/25 13:52, Sebastian Andrzej Siewior wrote:
>>>>>> Use preempt_model_str() instead of manually conducting the preemption
>>>>>> model. Use pr_emerg() instead of printk() to pass a loglevel.
>>>>>
>>>>> even on powerpc, i see __die ends up calling show_regs_print_info().
>>>>> Why print it twice?
>>>>
>>>> I don't understand what you mean, what is printed twice ?
>>>>
>>>> I can't see show_regs_print_info() printing the preemption model, am 
>>>> I missing something ?
>>>>
>>>
>>> Patch 2/9 add preemption string in dump_stack_print_info.
>>>
>>> __die -> show_regs() _> show_regs_print_info() -> 
>>> dump_stack_print_info() -> init_utsname()->version, 
>>> preempt_model_str(), BUILD_ID_VAL);
>>>
>>> Wont we end up in this path?
>>
>> Indeed I missed that. You are right, we now get the information twice:
> 
> I think we can remove it from arch specific code and rely on lib/ 
> dump_stack?

Yes I guess so.

> 
> And similar concern of printk vs pr_warn/pr_emerg would apply to that as 
> well i guess.

Well, powerpc's show_regs() calls it with 
show_regs_print_info(KERN_DEFAULT);

And dump_stack_print_info() uses printk with log_lvl so there should be 
no concern here.

> 
>>
>> [  440.068216] BUG: Unable to handle kernel data access on write at 
>> 0xc09036fc


