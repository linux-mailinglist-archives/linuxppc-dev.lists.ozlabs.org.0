Return-Path: <linuxppc-dev+bounces-2689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7407E9B5157
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 18:52:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdHsd63mcz2xjL;
	Wed, 30 Oct 2024 04:52:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=167.114.26.122
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730224373;
	cv=none; b=jZGSPTLahyzltxg9PM/oQ+a8qsEOwyQcTnioLsZefJTOHw39DfZ+lUa3315ylZXhz5F4iRNcfgDQSgIYcJrB9okydP9H6tPN4YH4hEQtfC5fCy5zzLPRvZSCWRHdnWEk+j0tBpsrY0cgGqKHJhQ4hT+nQ0qoVXzJ0LmcTvUlz39IqIrT9ECmYqBiJiJ72Ds/7pgzM0ji8u64BhJUtiMcmDMEUN0W2jwI6OqGzxuxraLuXOrwxKrIKor9BUSAjlndH5hs3vrWSp9jW23AWnolBlJlXnB/UGOFlQQyBINpJv6BOGnDM/+7Q3UPskrUiiRLaiqPHsGcQzNUecryRUYYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730224373; c=relaxed/relaxed;
	bh=JH+6DjNBhH/A7/UlACdHLkWJsS/tAqnMvv1vmzxnXGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mh10UNu3qEm52cpZgmSQBrrgi7DW0LhWvzyFLN9qC64c0pqV/4YliDaCDUpvcknOPDED2jwh8UjxDURWTvxCnI7HeOBRKaibpfk3BYXNk99Lbh3CRafghKtEzs7KUYpRbHKH6PWu4rVAi9ZOGTbnNN2cAus9rtxxmKeh0yMmBX+P6XTsGKZeHvwDn7/RKqbKRwXkb5GibqahaUhvEDwUXmXAIBgm/Egsk0CjjJbjzt4F+W1NHtbsNzrpoOpblP+O01+dHTgAtW+411z9/zjlH04dctP4xyAnNC7PVBU2egH1r61N5j+k4wSqzZ/kNluLL/sLKkP0FoBaTf5JGgiB+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=I7Zy7hH3; dkim-atps=neutral; spf=pass (client-ip=167.114.26.122; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=I7Zy7hH3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=167.114.26.122; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdHsY5VFxz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 04:52:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1730224361;
	bh=ckhCM+oqjtXOYCi/PgBB1sMyi0XnHiioDpF/gdoLapo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I7Zy7hH3FCMNOgCYw8IRpx4H60VVYnk/nLxKPA/RTMeO4ATJ/LMo6HSxoh90SK6cd
	 X/fX0sFZfRUwApEY9r5NQICnyxMuUNeR/ivkIGyv0ZZCTN4YOKHDO25qTdDfYPA5kD
	 2bvGClZkgpcjH41laajsctsOPs8Oddb7+MrurbDmS0G63pfNNG3GGtoJaAgC9iDIlk
	 bYDoCQCBQCHI/kxtlLLtvwpI/aoiDUfnFmNn5e108XZHKtqJYtDBP1jvjblvo7G2eH
	 cU1O86iX2lGY79zddBehVOlhVWXsOyDjjYekM5WKV/SXjrfTO59Oxz7+9cXA4q4wNp
	 DfgjYGkD7bphA==
Received: from [172.16.0.134] (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4XdHsN6kJcz166Y;
	Tue, 29 Oct 2024 13:52:40 -0400 (EDT)
Message-ID: <6f394b76-3db4-4a7b-9fdd-737c6812e7ef@efficios.com>
Date: Tue, 29 Oct 2024 13:51:02 -0400
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
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of
 membarrier_state
To: "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: Segher Boessenkool <segher@kernel.crashing.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@Oracle.com>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <20241029055133.121418-1-nysal@linux.ibm.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20241029055133.121418-1-nysal@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-10-29 01:51, Nysal Jan K.A. wrote:
> On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> is not selected, sync_core_before_usermode() is a no-op.
> In membarrier_mm_sync_core_before_usermode() the compiler does not
> eliminate redundant branches and load of mm->membarrier_state
> for this case as the atomic_read() cannot be optimized away.
> 
> Here's a snippet of the code generated for finish_task_switch() on powerpc
> prior to this change:
> 
> 1b786c:   ld      r26,2624(r30)   # mm = rq->prev_mm;
> .......
> 1b78c8:   cmpdi   cr7,r26,0
> 1b78cc:   beq     cr7,1b78e4 <finish_task_switch+0xd0>
> 1b78d0:   ld      r9,2312(r13)    # current
> 1b78d4:   ld      r9,1888(r9)     # current->mm
> 1b78d8:   cmpd    cr7,r26,r9
> 1b78dc:   beq     cr7,1b7a70 <finish_task_switch+0x25c>
> 1b78e0:   hwsync
> 1b78e4:   cmplwi  cr7,r27,128
> .......
> 1b7a70:   lwz     r9,176(r26)     # atomic_read(&mm->membarrier_state)
> 1b7a74:   b       1b78e0 <finish_task_switch+0xcc>
> 
> This was found while analyzing "perf c2c" reports on kernels prior
> to commit c1753fd02a00 ("mm: move mm_count into its own cache line")
> where mm_count was false sharing with membarrier_state.
> 
> There is a minor improvement in the size of finish_task_switch().
> The following are results from bloat-o-meter for ppc64le:
> 
> GCC 7.5.0
> ---------
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> finish_task_switch                           884     852     -32
> 
> GCC 12.2.1
> ----------
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> finish_task_switch.isra                      852     820     -32
> 
> LLVM 17.0.6
> -----------
> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-36 (-36)
> Function                                     old     new   delta
> rt_mutex_schedule                            120     104     -16
> finish_task_switch                           792     772     -20
> 
> Results on aarch64:
> 
> GCC 14.1.1
> ----------
> add/remove: 0/2 grow/shrink: 1/1 up/down: 4/-60 (-56)
> Function                                     old     new   delta
> get_nohz_timer_target                        352     356      +4
> e843419@0b02_0000d7e7_408                      8       -      -8
> e843419@01bb_000021d2_868                      8       -      -8
> finish_task_switch.isra                      592     548     -44
> 
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>

Thanks!

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

> ---
> V1 -> V2:
> - Add results for aarch64
> - Add a comment describing the changes
> ---
>   include/linux/sched/mm.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 928a626725e6..b13474825130 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -531,6 +531,13 @@ enum {
>   
>   static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
>   {
> +	/*
> +	 * The atomic_read() below prevents CSE. The following should
> +	 * help the compiler generate more efficient code on architectures
> +	 * where sync_core_before_usermode() is a no-op.
> +	 */
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
> +		return;
>   	if (current->mm != mm)
>   		return;
>   	if (likely(!(atomic_read(&mm->membarrier_state) &

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


