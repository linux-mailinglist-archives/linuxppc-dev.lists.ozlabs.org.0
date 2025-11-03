Return-Path: <linuxppc-dev+bounces-13707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3820C2E1E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 22:15:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0kr85Ky5z2yFT;
	Tue,  4 Nov 2025 08:15:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762186281;
	cv=none; b=iIxQ1Y9HClSW8ahbOuO3lp0ewp6Y0sVGHa/884JBW2axx8jkgVKNNGPiyOc9hu1e1AILr+JhbL/ZjkhBvbtDZlvclq24OUQE76QDbccGmzBOrN2Crbs0nslBtlFCaxKcW1v2koPkkeYibwnBEAQozY0YRcPwfVsBGDYQg0+KQXhcCQ6f0ZFUG+s1SFX6Ro6VNZJL3IT/hFmZ5u+DXrgjDqAKZkPwe9pXPWQHzS1A9SWF4nP1Uu+N3Rq7uSW5/HvGBQ5wAPiYWxqjD76V48hU9iQHf4i79GVorWlRqLlPYf85M8YjvR/YwuJl6b1YEKw3IvBL9bTtLNCc5RkpgQTUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762186281; c=relaxed/relaxed;
	bh=uCjTDwFj2KWNd1jCDA9nTD0PkDT+GyDs4rwXMlsXX4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVetrMavI/sA20icKgB/FzY76HsNNJLPdD1bLm5u5y0umQH5F3QXyA/kXbJ2A4F5sT2Q/wGlMBhgpGlKg2kf0K/8qmbKI8tRCkVdAK2gEjzwsV6zTwm4wT/end0xz+u9hko6XH2COZrsCng1aFfpLoOL40Gd84YDkYJxeIK4SWWciy6PoehtDSP/wSa65VtewzHWfBARWGEmm3RQxD0xSVljRfrjL/yekHXTunNzjOcMSEFpoG8NInv117flY4NOxvjzd06k79B9E4zqyoZSMqjQhQB/m4RuJY1bwk6pGZtRMsB9lryDKNefVu2p2bytfETW6LFZypbdlIMa8fc6UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=npyBUuqj; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=npyBUuqj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0c5h1BfMz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 03:11:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF01A43237;
	Mon,  3 Nov 2025 16:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A46CC4CEE7;
	Mon,  3 Nov 2025 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186276;
	bh=V1CU9ZdjaPBn/WuqIoDgCoBVzQIejoJ47+/3Iu7JZPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=npyBUuqjUIKg4InV+qpRD6OtpMB4/GHdS8B1NFF+Q9yYKiP+sb3TgKsbqJH8Sa1rZ
	 IjmKf10sHhPZ9tJBExNMfKK9yT/VFR2YIZ9V/xn9DQdnHw+celZDegZhXdLQrF/SN5
	 lUex3DQHMkchog6zMIgVbKEfsJTbKokiYZLXNK0+peJ+RcXLboT6AnCcS4v+iq0vdd
	 UNq+DePKElJQaoqkKpkF65sYRbAzqC1oOL9GKK49eQoY+wljWRBdmHyv0D0R45C04e
	 nEuXWJ5n/3CnJfkZVAWRCYTclKE+cKq52lFKq1tbquYMBGM5LejdtS3JnqVMyuKIJJ
	 wBZRvG6pryrXw==
Message-ID: <15381b5c-726f-4eda-8ffd-c95c0acd7635@kernel.org>
Date: Mon, 3 Nov 2025 17:11:06 +0100
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
Subject: Re: [PATCH v4 10/12] sparc/mm: replace batch->active with
 in_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
 <20251029100909.3381140-11-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251029100909.3381140-11-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.10.25 11:09, Kevin Brodsky wrote:
> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper in_lazy_mmu_mode()
> to tell whether a batch struct is active instead of tracking it
> explicitly.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/sparc/include/asm/tlbflush_64.h | 1 -
>   arch/sparc/mm/tlb.c                  | 9 +--------
>   2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 4e1036728e2f..6133306ba59a 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -12,7 +12,6 @@ struct tlb_batch {
>   	unsigned int hugepage_shift;
>   	struct mm_struct *mm;
>   	unsigned long tlb_nr;
> -	unsigned long active;
>   	unsigned long vaddrs[TLB_BATCH_NR];
>   };
>   
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index 7b5dfcdb1243..879e22c86e5c 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,11 +52,7 @@ void flush_tlb_pending(void)
>   
>   void arch_enter_lazy_mmu_mode(void)
>   {
> -	struct tlb_batch *tb;
> -
>   	preempt_disable();
> -	tb = this_cpu_ptr(&tlb_batch);
> -	tb->active = 1;
>   }
>   
>   void arch_flush_lazy_mmu_mode(void)
> @@ -69,10 +65,7 @@ void arch_flush_lazy_mmu_mode(void)
>   
>   void arch_leave_lazy_mmu_mode(void)
>   {
> -	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> -
>   	arch_flush_lazy_mmu_mode();
> -	tb->active = 0;
>   	preempt_enable();
>   }
>   
> @@ -93,7 +86,7 @@ static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
>   		nr = 0;
>   	}
>   
> -	if (!tb->active) {
> +	if (!in_lazy_mmu_mode()) {
>   		flush_tsb_user_page(mm, vaddr, hugepage_shift);
>   		global_flush_tlb_page(mm, vaddr);
>   		goto out;

(messing up my transition to the email address as Thunderbird defaults 
to my old one still on mails received through RH servers)

Did we get this tested with some help from sparc64 folks?

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David


