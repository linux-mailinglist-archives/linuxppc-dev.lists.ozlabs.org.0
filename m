Return-Path: <linuxppc-dev+bounces-13709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB77BC2E1FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 22:16:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0kt95zKHz2yG0;
	Tue,  4 Nov 2025 08:16:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762197825;
	cv=none; b=DZ9U4SmvYuJfzmlGLWKmOAMd6nw9Dm7Ejf0CG+TErm8IcrCVsivIcBhZx6e0Nszzha72Ac8+FZfzmhbi/VQfy6+20neKMip5nue6uWZV1hlQgwYNOv2xpStSd9sYvsXGWTnwl/ewKo2Qks6hDH7CWdGx8J7LqWp8MT5HRP5mMdKJFV5ZCfTw/45MuM0yp98jci1AlEP/ZAMzp63LKuw2anfsB+7uG1qofA1K8UN86pvR+mMlD3yLM381v7Ax+ZpZysNMlGgs/dcFsRf6LU6+jRAcrg9+SeN575dtcIZWHzqvxCqVrCJDYA6WOanODdCTIJqkRFZ9g2pmy0LBA51/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762197825; c=relaxed/relaxed;
	bh=VU73K/1EslvMeIQk3g4ipwia/QceF7bjRApk//rXHwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTSgExaewSQ824Y0TWwhicg8xUUAnZGG9vDs3iitaSCLpHTKv9cDmO8O4l8psoEt79nopfftMiy1Pt/kKnR5EPnFzg9hD5s5uqzMJAo6II9ZCAnLMrEJY8V3BEmukrEv9rMU+FmpptIsZGVW5n/WrqiZSYsQS47+7eJJTF+I2gemhxYWpQAwBerRa4Bs/N3Ga+RsMpPGODkCLTZD5PGO82jrNAwalCUL7QDlHKMdUue+YI6NArsdNqCBHu4x47ac5q9Lz+WgBkIcbTol7ZVo29Ggsh6y0l9reBvwvrk6Ze2RDMECKW8SHIWVnaR33ngXupHgX06Y0rC7Hb7S+uER2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c9UT0S1a; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c9UT0S1a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0hMg6jsTz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 06:23:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31D2D40763;
	Mon,  3 Nov 2025 19:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEBEC4CEE7;
	Mon,  3 Nov 2025 19:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762197821;
	bh=YF+Dh7k5RXyD8ZknLWrr6zckBVz5y8Jk5LVnJjqJxoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c9UT0S1aE+oyoVDfFS4tVvZUGvWl9HiC7/F+Cp66KCVA7C4GhH0PqNtoBTarCw3iW
	 r2P630kamF4JSjUnf0EzY4gdgF4lREKNM2+yjmeoTw3nLHhjxYDny/gqAjP3iNUL7a
	 JzIyQ1aRH3QyNtDz4IpxtL5MX/fDHZSJh77cPeKd7LS92GluG1GXIy1BpAiLFwvlox
	 cRJrDCtLOcgMqEzgJxz44Oa9sLKyl40ixdJjaMo6LOW9qbHf4ryeTRFym1qVmpu9UH
	 uIilWOADkYHyRHPzn2EvdQ0ZptspxmBomG3l6lNVoh9BMoIycP2QxAs9MQX9p7Fs9q
	 9DzIobQXg5JOg==
Message-ID: <a326d1eb-62f1-4add-8dc9-cea7d7e4ed3c@kernel.org>
Date: Mon, 3 Nov 2025 20:23:30 +0100
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
Subject: Re: [PATCH v4 11/12] x86/xen: use lazy_mmu_state when
 context-switching
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-12-kevin.brodsky@arm.com>
 <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
 <285faae4-dab6-4819-847a-889bdf87d5d7@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <285faae4-dab6-4819-847a-889bdf87d5d7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03.11.25 19:29, Kevin Brodsky wrote:
> On 03/11/2025 16:15, David Hildenbrand (Red Hat) wrote:
>> On 29.10.25 11:09, Kevin Brodsky wrote:
>>> [...]
>>>
>>> @@ -437,7 +436,7 @@ static void xen_end_context_switch(struct
>>> task_struct *next)
>>>          xen_mc_flush();
>>>        leave_lazy(XEN_LAZY_CPU);
>>> -    if (test_and_clear_ti_thread_flag(task_thread_info(next),
>>> TIF_LAZY_MMU_UPDATES))
>>> +    if (next->lazy_mmu_state.active)
>>
>> This is nasty. If in_lazy_mmu_mode() is not sufficient, we will want
>> to have a separate helper that makes it clear what the difference
>> between both variants is.
> 
> in_lazy_mmu_mode() operates on current, but here we're operating on a
> different task. The difference is more fundamental than just passing a
> task_struct * or not: in_lazy_mmu_mode() is about whether we're
> currently in lazy MMU mode, i.e. not paused and not in interrupt
> context. A task that isn't scheduled is never in lazy MMU mode -
> lazy_mmu_state.active is just the saved state to be restored when
> scheduled again.
> 
> My point here is that we could have a helper for this use-case, but it
> should not be used in other situations (at least not on current). Maybe
> __task_lazy_mmu_active(task)? I do wonder if accessing lazy_mmu_state
> directly isn't expressing the intention well enough though (checking the
> saved state).


Likely there should be a

/**
  * task_lazy_mmu_active - test whether the lazy-mmu mode is active for a
  *			  task
  * @task: ...
  *
  * The lazy-mmu mode is active if a task has lazy-mmu mode enabled and
  * currently not paused.
  */
static inline bool task_lazy_mmu_active(struct task_struct *task)
{
	return task->lazy_mmu_state.active;
}

/**
  * in_lazy_mmu_mode() - test whether current is in lazy-mmu mode
  *
  * Test whether the current task is in lazy-mmu mode: whether the
  * interrupts are enabled and the lazy-mmu mode is active for the
  * current task.
  */
  static inline bool in_lazy_mmu_mode(void)
  {
+	if (in_interrupt())
+		return false;
+
  	return task_lazy_mmu_active(current);
  }


Something like that. Maybe we can find better terminology.

-- 
Cheers

David

