Return-Path: <linuxppc-dev+bounces-13708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83FBC2E1E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 22:15:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0krd70YPz2yG0;
	Tue,  4 Nov 2025 08:15:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762186532;
	cv=none; b=WGKoy9mnQBoppRwEBY8FgqQU7PFwAqsQvhetVevQ8I0ECDQ/MyU6tj6oXiDyRsKJ056axzVAailG7W0AZeQuqqrTTq9S6ZTT449/6aDRFkLaoKxo8JhKF4xPiru0EMDtIvZNN4RR8oZ/T90ZLnU6L3eoLPJ8th8NX6o6u3pmrWygZvjVKsCXCSw+SyZ2lEh8re88JZtpTRRazqVk1T22ea/L5oKFdmT42npfYfqAw4jYviQ69Xe1sr/YaLapJPi30EruhkNBSe6qcFsC8svZDzim1FEwtxBIRdSWJ0F/1VCD920s0Y3oRbH6vJzMS4BALJjcz35Wz+GRrINkooaV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762186532; c=relaxed/relaxed;
	bh=nwOqk6r952fnoq6kqx5JJLxmDxQO3I/qHQLZzHd75RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mckqz/dfx0JgNXKKsETjcjZxF+AQcPcY4ReAJkg06SG/fQwEZRtU0V43vvIohYcXLR3HZhSxqaFj3iEOEWvuWaAE0nND3Hu2mp9vRy0Ks7aJ5M/x+wMslH45XdgOZk34Tx+gpYbJ19WJTROKixxWV8Kt8WJEwP+w3+OyEL8mdNNtm+HcQkXHtTRFKMxh4GimdEmAVAPviG4HkUm+9hGOwrmVWS+VYffptfg38oGf4b0bDYPlB1pQcKkC2f+WKEEFJ5TwWicHcBsp3E/fCZuB38g2vNzYDbKeVYmncRqGsPyvWASgowAw1fcaqATmBraNZxSIKpudKKm9mi6pOo1YIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pMmG9L/w; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pMmG9L/w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0cBW4NGWz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 03:15:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D68643BB2;
	Mon,  3 Nov 2025 16:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BE5C4CEE7;
	Mon,  3 Nov 2025 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186529;
	bh=S0YKJr0SoBmysmz8IMr3QugNjlhYpJzfR41WjPWBUB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pMmG9L/wSj8xOcK/DzcO7x+pUKpbN+kaGWRhPKGT/hFa2p/Ay8Nl1Mzz1ZWUyScDa
	 vucJ0XbF6T0spIoI3AD/0qxqWiVKMh+Mmks24qxQFDpKZf3Zexx64cDs61lCh6Efy6
	 od0TqupiK1VEnDg7glIHKRlBc357kZIMtV/jM6SD3qxje1H7u2r4taFzH3oyOWmxWM
	 hHnL2j3jQ8KEJexQD4wpbJBjPfYdQst+gwFFqah20VMhXD96dyPMbnm/scOYZnijeO
	 WcP/Ww9iS8dXs6EdOUxwooqxO/I0VbjvAaMNzv31ZZN/WtGdcK9zJR5blHKdrg4t/9
	 0WafEdG9rsGng==
Message-ID: <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
Date: Mon, 3 Nov 2025 17:15:18 +0100
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
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251029100909.3381140-12-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.10.25 11:09, Kevin Brodsky wrote:
> We currently set a TIF flag when scheduling out a task that is in
> lazy MMU mode, in order to restore it when the task is scheduled
> again.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode in task_struct::lazy_mmu_state. We can therefore check that
> state when switching to the new task, instead of using a separate
> TIF flag.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/x86/include/asm/thread_info.h | 4 +---
>   arch/x86/xen/enlighten_pv.c        | 3 +--
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
> index e71e0e8362ed..0067684afb5b 100644
> --- a/arch/x86/include/asm/thread_info.h
> +++ b/arch/x86/include/asm/thread_info.h
> @@ -100,8 +100,7 @@ struct thread_info {
>   #define TIF_FORCED_TF		24	/* true if TF in eflags artificially */
>   #define TIF_SINGLESTEP		25	/* reenable singlestep on user return*/
>   #define TIF_BLOCKSTEP		26	/* set when we want DEBUGCTLMSR_BTF */
> -#define TIF_LAZY_MMU_UPDATES	27	/* task is updating the mmu lazily */
> -#define TIF_ADDR32		28	/* 32-bit address space on 64 bits */
> +#define TIF_ADDR32		27	/* 32-bit address space on 64 bits */
>   
>   #define _TIF_SSBD		BIT(TIF_SSBD)
>   #define _TIF_SPEC_IB		BIT(TIF_SPEC_IB)
> @@ -114,7 +113,6 @@ struct thread_info {
>   #define _TIF_FORCED_TF		BIT(TIF_FORCED_TF)
>   #define _TIF_BLOCKSTEP		BIT(TIF_BLOCKSTEP)
>   #define _TIF_SINGLESTEP		BIT(TIF_SINGLESTEP)
> -#define _TIF_LAZY_MMU_UPDATES	BIT(TIF_LAZY_MMU_UPDATES)
>   #define _TIF_ADDR32		BIT(TIF_ADDR32)
>   
>   /* flags to check in __switch_to() */
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 4806cc28d7ca..f40f5999352e 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -426,7 +426,6 @@ static void xen_start_context_switch(struct task_struct *prev)
>   
>   	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU) {
>   		arch_leave_lazy_mmu_mode();
> -		set_ti_thread_flag(task_thread_info(prev), TIF_LAZY_MMU_UPDATES);
>   	}
>   	enter_lazy(XEN_LAZY_CPU);
>   }
> @@ -437,7 +436,7 @@ static void xen_end_context_switch(struct task_struct *next)
>   
>   	xen_mc_flush();
>   	leave_lazy(XEN_LAZY_CPU);
> -	if (test_and_clear_ti_thread_flag(task_thread_info(next), TIF_LAZY_MMU_UPDATES))
> +	if (next->lazy_mmu_state.active)

This is nasty. If in_lazy_mmu_mode() is not sufficient, we will want to 
have a separate helper that makes it clear what the difference between 
both variants is.


-- 
Cheers

David

