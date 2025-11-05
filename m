Return-Path: <linuxppc-dev+bounces-13774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D71C33D05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 03:55:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1VLL6cbPz2yr9;
	Wed,  5 Nov 2025 13:55:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762311322;
	cv=none; b=n0eGCvBQLBlJ5w5sYGr/tFQdOn0S8iffPrHbu+hGfwIT9mImh4NjJDK2a6lhSog6gMP129TMbms/6dPLXC2fxsTJ27GG6BousHT9kfbXd8WRn+anrBwoxKa4J7KPYbRd80hKXbalOGCVQbL1UNahS9t4Q8KmaEBXxcP4okeSDuyFxlUl7ZZLo51XMpXAoiM70JG/88y1rC6+PnnB4qw54KDmrcGtWuHD+nCLDnBKFKSlwTRUtpTnSb0sLV88WqlDWQnLTJ61s5FSATLNP9BG8mc+KOnaxZIYwf0YpgkvrDU5fMeHxSeFhc4C3n/49rVfjPLC4UAP/zcKPfrrB9i87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762311322; c=relaxed/relaxed;
	bh=RzRgxKaFFDli8ftuhQFfyH2ObKCMh7+2PDYIIzQvueg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=NhuJ8F79SKxZsy1u3oQdFVwBc2/XrwrVRTXBjwDVcUSsrAyf7lFmtN8zSHLVHL23aur8ebLPl+bXoy2wtpqAZdh13JZDQvgXEzB78cWRNunX51E0mr17/MB4Zm2weqbIarCZURyTbrfeXFxYQVsBJJB/gCG1L+Fl5OQ7esHBvKNydYRKOTv/+/yBrkWM5+drqvi6X/+6aYlL5RmxVbGzORmq73u3XxgL+JtvJfkYK3qllJQyg5JZIln9N8/B9p6Lbe4q4MZuFaJ9sZRPyFmjJS0udpg+szezFEMp6wqJfNbayMVsz0XPRwQxmDLf8kgpMOE1cQ27rncAAiwY7X4xIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kvdfm5zw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kvdfm5zw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1VLK3pXDz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 13:55:20 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-295247a814bso68681505ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 18:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762311317; x=1762916117; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzRgxKaFFDli8ftuhQFfyH2ObKCMh7+2PDYIIzQvueg=;
        b=kvdfm5zwEZ8nGpS62nfT/YV70B/7QTGp+hR/iuL5Mae3PgNLQ31FgOBkawHGtHnh48
         E+kKBJaUd2OyQL4VYv0dqpzxV61HCSYY6J4GUvbMB8KEL0CI9cOuSkcvJomOXA9Axo3i
         0M2kkSLh41u0jiOeGjkXBD3fsUSE+wKCCq9rLasLzCCxrR1xjlQR+2WiLaCvzCMo1WNr
         ZmUkrfUemD7GgyBz7YbPAX5NtGldt2RBvnB3WvRRsRMmQmu8s9Dq+erhP1r1loQEci7D
         eqzzqu0J/+CI43pnOsjSs+GK+NDzqp66SApHISW+bks/Ir9nwDZGvF0TDmRKeq/xqbSH
         tXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762311317; x=1762916117;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzRgxKaFFDli8ftuhQFfyH2ObKCMh7+2PDYIIzQvueg=;
        b=MSL4TlSt4M+/v1q8K1h17fzW5NhKP5EQv9OqSV0UrpOiFrO3y/Bqm3ZLeoEEcz/DMA
         kNDvlggP99U/BGswYUIt1D+OIlxkwxMbOu3VvutVEXqD331kShkAe+hWJoB8LxaSf0pF
         dYh7qZbWcCjVp+/7PohqXjyD9zRVAmF+wedAesuNXyBq1anxabSzCWFG+tvpzDCjuWgI
         Uf2nhb9AscDZPH3pZw51u1t0O1JF82vq4VEpx8COKxehEM7Pnpi8x2OFODvjp5pOTutA
         ETXFORvRyhTuFhp8IGFgKmQHvcSndUkwFdovJ7vBQGFjzZ23pwDhrf3aFJjyHmYw5PRV
         p86A==
X-Forwarded-Encrypted: i=1; AJvYcCVz4Ln5CILjButS2zsLkt3RCT29TnQAV604aAImyDxozGJOvKBP6PvwrMq+N7PtvUBqvtbvE++YbJdlCNo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzaLjjtJfAHowkn+pzYZ8DV6uUpqYV1FDAR+eBQ5MoLCMe4kHYf
	/SsYRYefAEaeuDyUIWGrkbJ/2PZDQLlR9ewqp2TT/WXI9UXxRTKfga34
X-Gm-Gg: ASbGncsiynsMN0am1D+F851+bbBWafLfLUWjpM7qXD2lYSdepC0MpvvuatBVdHWqRYt
	poS+gEzagYYqCJjQXLQiiipNffVy/UoO3IvtwQ2ByYVgJE/9VHqcoEXqG6tBbWdvpagLzDljT8F
	FrGO8D+i2d9lAU+Bhm/+Av1m35XYtDtlgN4ARonaQfrPQ80dSysnwDRveYXEX6398uOYpxHw1Uz
	iOTxP56nLnfFiA/ixTflrKoxlUxWANEc4nT6jN4sxxMGn+ymZHwBJ//2tBj1Wb5yvDYLlCWmFX6
	72lzt2AnTL2macz0UfRsuu1P9bNko8UluhVAqa3JYsXR/ifltzSbK1gMJRi7Gb9mgNvuBT6gqny
	1u6/DvRtpekAyPR497mXRd2JM00ATCV6xczLJSzY4Zm4hxZotCeyhj0+5dqEnfTpvyLIajw==
X-Google-Smtp-Source: AGHT+IGwTm7URkxWPNS/uaQT82VrA80foZj+Jgsm9GWgCIbhw60EG5vfai2y+vo+uSLgfxHG3bwlGg==
X-Received: by 2002:a17:903:3c4b:b0:293:33b:a9b0 with SMTP id d9443c01a7336-2962ae10998mr22075795ad.32.1762311317247;
        Tue, 04 Nov 2025 18:55:17 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601b8f28esm43621645ad.5.2025.11.04.18.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 18:55:16 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB flush
In-Reply-To: <20251029100909.3381140-2-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 08:16:58 +0530
Message-ID: <87qzud42n1.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-2-kevin.brodsky@arm.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> From: Alexander Gordeev <agordeev@linux.ibm.com>
>
> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
> Therefore, the batch re-activation code is never called, so remove it.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/powerpc/include/asm/thread_info.h |  2 --
>  arch/powerpc/kernel/process.c          | 25 -------------------------
>  2 files changed, 27 deletions(-)
>

Since the commit referenced in above disables the preemption in
arch_enter_lazy_mmu(), so the expectation is that we will never be
context switched while in lazy_mmu, hence the code changes in
switch_to() around __flush_tlb_pending() should ideally never be called.

With this analysis - the patch looks good to me. I will give this entire
patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
let you know the results of that)!

For this patch please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


CC: Venkat who also runs CI on linux Power HW for upstream testing :)

-ritesh


> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index b0f200aba2b3..97f35f9b1a96 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -154,12 +154,10 @@ void arch_setup_new_exec(void);
>  /* Don't move TLF_NAPPING without adjusting the code in entry_32.S */
>  #define TLF_NAPPING		0	/* idle thread enabled NAP mode */
>  #define TLF_SLEEPING		1	/* suspend code enabled SLEEP mode */
> -#define TLF_LAZY_MMU		3	/* tlb_batch is active */
>  #define TLF_RUNLATCH		4	/* Is the runlatch enabled? */
>  
>  #define _TLF_NAPPING		(1 << TLF_NAPPING)
>  #define _TLF_SLEEPING		(1 << TLF_SLEEPING)
> -#define _TLF_LAZY_MMU		(1 << TLF_LAZY_MMU)
>  #define _TLF_RUNLATCH		(1 << TLF_RUNLATCH)
>  
>  #ifndef __ASSEMBLER__
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index eb23966ac0a9..9237dcbeee4a 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1281,9 +1281,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  {
>  	struct thread_struct *new_thread, *old_thread;
>  	struct task_struct *last;
> -#ifdef CONFIG_PPC_64S_HASH_MMU
> -	struct ppc64_tlb_batch *batch;
> -#endif
>  
>  	new_thread = &new->thread;
>  	old_thread = &current->thread;
> @@ -1291,14 +1288,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	WARN_ON(!irqs_disabled());
>  
>  #ifdef CONFIG_PPC_64S_HASH_MMU
> -	batch = this_cpu_ptr(&ppc64_tlb_batch);
> -	if (batch->active) {
> -		current_thread_info()->local_flags |= _TLF_LAZY_MMU;
> -		if (batch->index)
> -			__flush_tlb_pending(batch);
> -		batch->active = 0;
> -	}
> -
>  	/*
>  	 * On POWER9 the copy-paste buffer can only paste into
>  	 * foreign real addresses, so unprivileged processes can not
> @@ -1369,20 +1358,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	 */
>  
>  #ifdef CONFIG_PPC_BOOK3S_64
> -#ifdef CONFIG_PPC_64S_HASH_MMU
> -	/*
> -	 * This applies to a process that was context switched while inside
> -	 * arch_enter_lazy_mmu_mode(), to re-activate the batch that was
> -	 * deactivated above, before _switch(). This will never be the case
> -	 * for new tasks.
> -	 */
> -	if (current_thread_info()->local_flags & _TLF_LAZY_MMU) {
> -		current_thread_info()->local_flags &= ~_TLF_LAZY_MMU;
> -		batch = this_cpu_ptr(&ppc64_tlb_batch);
> -		batch->active = 1;
> -	}
> -#endif
> -
>  	/*
>  	 * Math facilities are masked out of the child MSR in copy_thread.
>  	 * A new task does not need to restore_math because it will
> -- 
> 2.47.0

