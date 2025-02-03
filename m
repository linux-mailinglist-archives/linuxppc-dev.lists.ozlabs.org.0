Return-Path: <linuxppc-dev+bounces-5791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A206EA2608E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 17:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmstS0t3Yz2yGs;
	Tue,  4 Feb 2025 03:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738601408;
	cv=none; b=mgvZd6Plu6HUQJ+AaSn8CsIl32uNTs268gLFnNiX7N7fNKK710C0CmOyss5ppErQhqNlPZmCOhmthjjaT96ESTi6Qb26aanCxUnDSUN9OJfEzKQUlaxGIRc0MrJd3wUi469zgLuk/2cV90g83I5DlQxhD84KeoUdkBSaSiNUd7STrX36DQy93RCTQlV3yBOGlayvda5yN9z+te1y4EH69xmAw3Wxg7UzdhOksHJUV55Vt+qiGd3ylgaJlnIpoiB2vzzn5fIIRbnjGczLwCPjZj9xI8TN9IM3oA4OX+IFCUEM/n/WPeYrdFrqNNsFSXEDh0KTzKXJU9tIx7eeY+nQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738601408; c=relaxed/relaxed;
	bh=pS/5vcawS4TVBovcn1wP+lK7QegIF4J75/gfazEHnms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EquV4CkF9YrVbZKoUgWCL4JnjY0tvAMudr7bGq1CUiV4aUaYmWf1CvBU5Je1TxuCpvjnuEI1v5mnSuRBe0Zs4LnlSfAfOK2axlrWPu2SgmybW14dvAuWzZ0qz7BefWwYRezGmJdrF4IPibrunMb7sGY27oPNiVUuINFRdpAlv1HLNR1pG8cjou9ZZxbUbftsAJXiPIqZ+ApxcxKn2u+qWQMwnB5gJEdLP8wHTI8X0liioxGTOmZIkYvtK3L8MvZJOJRCwfwLn7Z/Yo8i5L6SI4vX7kIPfo3kVbqU2y7iRwH9Lp22M/WHKDsDJKGHZCjB7fZmNUOgqTHRcUg9H7g3JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmstP6HKgz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 03:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ymsc858W3z9sSp;
	Mon,  3 Feb 2025 17:37:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zL6lv9C8apOs; Mon,  3 Feb 2025 17:37:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ymsc84GNtz9sSn;
	Mon,  3 Feb 2025 17:37:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EB188B764;
	Mon,  3 Feb 2025 17:37:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Qc-OfRrFF4mj; Mon,  3 Feb 2025 17:37:44 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 519808B763;
	Mon,  3 Feb 2025 17:37:43 +0100 (CET)
Message-ID: <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
Date: Mon, 3 Feb 2025 17:37:42 +0100
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
Subject: Re: [PATCH v2 5/9] powerpc: Use preempt_model_str().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 Ben Segall <bsegall@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250203160103.9DikC9FJ@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 03/02/2025 à 17:01, Sebastian Andrzej Siewior a écrit :
> On 2025-02-03 16:19:06 [+0100], Christophe Leroy wrote:
>>
>>
>> Le 03/02/2025 à 15:16, Sebastian Andrzej Siewior a écrit :
>>> Use preempt_model_str() instead of manually conducting the preemption
>>> model. Use pr_emerg() instead of printk() to pass a loglevel.
>>
>> Why use pr_emerg() for that line and not all other ones ?
> 
> checkpatch complained for the current printk() line and this looks like
> an emergency coming from die().

Right but checkpatch only looks at the line you modify with your patch, 
it doesn't consider the global picture.

> 
>> The purpose of using printk() is to get it at the level defined by
>> CONFIG_MESSAGE_LOGLEVEL_DEFAULT and I think it is important to have the full
>> Oops block at the same level.
> 
> Okay. So "printk(KERN_DEFAULT " then.

Up to you, I'm fine with that but you should consistently update all 
printk's in the function, not only that one, so is it really worth it ?

Christophe


