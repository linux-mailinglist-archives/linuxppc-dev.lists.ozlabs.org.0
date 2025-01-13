Return-Path: <linuxppc-dev+bounces-5165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61599A0BD3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 17:26:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWyLb5WJYz30TH;
	Tue, 14 Jan 2025 03:26:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736785575;
	cv=none; b=nnKCFKjAlI29wAbm9cyPBq9+25Z0py7B9O98VzFze38/J/wh+xSkcohikAusRGLi+ofiOhqMrA6kkTAFeMhiipK9SCuE2TPll+YwF1YiMfrJ+69O9ppfTcBG1NSP36y1pVDLGRLHATXLHCoAccAjHDd8J6MtRTxwaNT+K96Ruo7Op8YVIkolGZJgJYyAuEX08CYD81FWGmD69ScQJ1dKWIRLj03tYtxlJ00+a34QRq9k2VyWzjs7FsPhuuZehb1Kb/DTukdvvFV/fi+QPzIXxggDrG/hjcjnol7p8/Urk79ZZQt/4iIA2RjipgtMcjaFdUm8pB4laYHPop3EVo/1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736785575; c=relaxed/relaxed;
	bh=pGWnrfB5x3vsMl15xo3lUlJT+6QAr+LaD+zHKo33cfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1PB9ugNxyLCO8yC68GQaGaj6Q5tUl64X90aJSfO2RUI7Z8dP8hWnhmCAkW6MJvfZQ8HonKq5QRMbS5dUX82gw/gWsMqQVE80r/dxYBpJO7YjHdugXaGFA81gKI5noQ39aaMsKQkxH1psisdL5C77aZI31zVdcugCuId3M9FDd1/HFrfT14pRFIyXd0+J7nP/dw+2IJVkhC4fIw5FNCZiI+lkhxpDxN08SRNGEJJHnPdguVp6IBBXKCTuMmDrFyGKxiL+qcs+3SqBzFCnOT/ILRIN/P8hM7agG67Yo5uReplPStkEBuht9L+rA4xuqL7dDnqb5IMfJnolA807SEnAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9OxD2cj; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9OxD2cj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWyLZ31FQz30TC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 03:26:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 198035C51B3;
	Mon, 13 Jan 2025 16:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB06FC4CEE3;
	Mon, 13 Jan 2025 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736785571;
	bh=aIErGEJQ93Edr09sqGtwbrisP+GLeiu0+v58Z3b4+wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9OxD2cjCU02a1TFHaQkRJkHTJaf800j2ThaRkmaDO8PnvHYcKvQAfMic1HE/Vgu4
	 bhoThTemMYdDsEruG0k1HE1twIt5p+okmQ1Fme2xsmkJ1BQLD8H+Zp7QUSFbDk27Gn
	 B5ufSBakDorBmKAc7MajbPl5qEyM8Cvsp7UlPF7Qlqy8u3xJW5fG1y1vkiwGoluiPG
	 TaVdI6SpQBvsCUt754VDxKLXg9xhYJFxRfy3Q35WM4nn1s+LKSVLKt3udttwPvQ+n7
	 7RdzermO/y9ghDR77Ho+plqpTXITbyFwEjDbIrmeX2kZUFwI7wLBL/ndLmvBoivzIj
	 msVg4+kWAVaUA==
Date: Mon, 13 Jan 2025 16:26:01 +0000
From: Will Deacon <will@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
	alex@ghiti.fr, andreas@gaisler.com, palmer@dabbelt.com,
	tglx@linutronix.de, david@redhat.com, jannh@google.com,
	hughd@google.com, yuzhao@google.com, willy@infradead.org,
	muchun.song@linux.dev, vbabka@kernel.org,
	lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
	rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de,
	aneesh.kumar@kernel.org, npiggin@gmail.com,
	dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d
 level page table
Message-ID: <20250113162600.GA14101@willie-the-truck>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 02:57:21PM +0800, Qi Zheng wrote:
> Like other levels of page tables, also use mmu gather mechanism to free
> p4d level page table.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/include/asm/pgalloc.h |  1 -
>  arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
> index 2965f5a7e39e3..1b4509d3382c6 100644
> --- a/arch/arm64/include/asm/pgalloc.h
> +++ b/arch/arm64/include/asm/pgalloc.h
> @@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
>  	__pgd_populate(pgdp, __pa(p4dp), pgdval);
>  }
>  
> -#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
>  #else
>  static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
>  {
> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> index a947c6e784ed2..445282cde9afb 100644
> --- a/arch/arm64/include/asm/tlb.h
> +++ b/arch/arm64/include/asm/tlb.h
> @@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
>  }
>  #endif
>  
> +#if CONFIG_PGTABLE_LEVELS > 4
> +static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
> +				  unsigned long addr)
> +{
> +	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
> +
> +	if (!pgtable_l5_enabled())
> +		return;
> +
> +	pagetable_p4d_dtor(ptdesc);
> +	tlb_remove_ptdesc(tlb, ptdesc);
> +}

Should we update p4d_free() to call the destructor, too? It looks like
it just does free_page() atm.

Will

