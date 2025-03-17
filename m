Return-Path: <linuxppc-dev+bounces-7111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7944A6474B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 10:29:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGV6b4b33z2ygD;
	Mon, 17 Mar 2025 20:29:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742203767;
	cv=none; b=RJte4nHnRbcxxycwApMF1deEeoAaZVkTXavQ+lsbmoZc/SMIIvs0BeYHRP4AW5cBaX4Dx91hdw1LarZu7JKFUCBMKh/0IymehAcoFSbwhaeqAJZsvCwAiTYcyRsSwNphbeLj/UVFvvbRGpgcqTKoGueW0qAZR0EDAqyc/ymAhixOSoICEk9BktP2h7MAVxBLNT/VxYKDTcNbaCmJFq4yIyD+61BivIrJrGIcLLSMpUyb4V7SeBDAQAkugNlgw81y4bnu1bcDlVFVL/+++sS7FNnLuVXDwEPGUM5YRWsW/AEg524hCnhSdiwnAlAyOVSejMimRFkPg1Hh6OEMEIqyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742203767; c=relaxed/relaxed;
	bh=vg2HPDJGw50++nt9f+gnQ911MKt1QN60boipCB0LDgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUIRZyE+zAmpI3J7Um/MUSuE44cllDoedmNTvWqEq4yYZPRNKliLQozHU5LXvC4x9dqqRcKUedpApERmgf0qcUplhfQxhzYpzmmmBMn4css83eehgZ6iTFPP38lGUf/Bk4qPAb/vvk5XUBrTkzged73T5FVbukbZJZ9Hd872dCD4NDcNCIrJQFkgBJzkdP9bFuVt944aiiy3/oioAe2p5vGP5lPKa8n05yRdnJJfSvwQYWefPHXx1hhuBJCKX5ee3KstQzSpFhKopf07mbGEYR/P21HVsICkoGkaey+mBwc3eLA2X4RBaf0gUagQ/kDSRr4Y9BP+N33Yw4kjbSB6ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGV6Z3bH0z2yfP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 20:29:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E81913D5;
	Mon, 17 Mar 2025 02:29:02 -0700 (PDT)
Received: from [10.57.84.137] (unknown [10.57.84.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F070E3F694;
	Mon, 17 Mar 2025 02:28:49 -0700 (PDT)
Message-ID: <16c12c3f-f2c2-45fa-9db6-4dfaeb002059@arm.com>
Date: Mon, 17 Mar 2025 09:28:48 +0000
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
Subject: Re: [PATCH 2/2] arm64/ptdump: Replace u64 with pteval_t
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>
References: <20250317061818.16244-1-anshuman.khandual@arm.com>
 <20250317061818.16244-3-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250317061818.16244-3-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/03/2025 06:18, Anshuman Khandual wrote:
> Page table entry's value, mask and protection are represented with pteval_t
> data type format not u64 that has been assumed while dumping the page table
> entries. Replace all such u64 instances with pteval_t instead as required.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/ptdump.h | 8 ++++----
>  arch/arm64/mm/ptdump.c          | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index e5da9ce8a515..476a870489b9 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -24,8 +24,8 @@ struct ptdump_info {
>  };
>  
>  struct ptdump_prot_bits {
> -	u64		mask;
> -	u64		val;
> +	pteval_t	mask;
> +	pteval_t	val;

Given Ard's suggestion of using "ptdesc" as a generic term for PTDESC_SHIFT (or
PTDESC_ORDER, or whatever we ended up calling it), I wonder if it would be
cleaner to do the same with the types? We could have a ptdesc_t, which is
typedef'ed as u64 (or u128), then pteval_t, pmdval_t, ..., could all be
typedef'ed as ptdesc_t. Then for code that just wants a generic pgtable
descriptor value, we can use that type to indicate that it can be at any level.

Thanks,
Ryan

>  	const char	*set;
>  	const char	*clear;
>  };
> @@ -34,7 +34,7 @@ struct ptdump_pg_level {
>  	const struct ptdump_prot_bits *bits;
>  	char name[4];
>  	int num;
> -	u64 mask;
> +	pteval_t mask;
>  };
>  
>  /*
> @@ -51,7 +51,7 @@ struct ptdump_pg_state {
>  	const struct mm_struct *mm;
>  	unsigned long start_address;
>  	int level;
> -	u64 current_prot;
> +	pteval_t current_prot;
>  	bool check_wx;
>  	unsigned long wx_pages;
>  	unsigned long uxn_pages;
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index fd1610b4fd15..a5651be95868 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -194,7 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
>  	struct ptdump_pg_level *pg_level = st->pg_level;
>  	static const char units[] = "KMGTPE";
> -	u64 prot = 0;
> +	pteval_t prot = 0;
>  
>  	/* check if the current level has been folded dynamically */
>  	if (st->mm && ((level == 1 && mm_p4d_folded(st->mm)) ||


