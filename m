Return-Path: <linuxppc-dev+bounces-15350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B754CFC089
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 05:59:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmG6R5PRKz2yFh;
	Wed, 07 Jan 2026 15:59:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767761967;
	cv=none; b=FioYHENEN5a7cn/JS3TosWaWw9/FWhMgF0tsn2iU8s7SPqi4tWe/bxlB/71v/RWuEng2gBo7StYpi5x5vkVTH1czFL2Y9UqDVlE5XjZLqL3CKLsTXxsIRKQ0ALZgOQukWr+Y6dfvj4BTGN63OYP1+1Pjm9Q/38wOuuGNqYSfuN5jI/xVfFdS66/pe7G9w+yyt4CMhUHHJziYTGH2IKLZglPFgsvqp8jLgoZHLax6CY/ctrOhPZDh04kXAQy5H7YNIps2/lrwnjIiS2EKLVcrOOIiUlBVhvZGUi5RcW9fPrsGTMqQiUftGDbpdkoUPqVr/Wv6PX65rOF2Jk/8ZDuxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767761967; c=relaxed/relaxed;
	bh=nurUXHNs091EaceKYt0jtxQiBJ2IaAdTDr7CGJ+zWBU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=AGjcuYx1+pV1luPDP35+ESqTkpP3QqmAXNrQBWnt536VGVqm8wD+Bsqti14zcIgu1upSEE1SipV9eOD+thYuw+p3mZGFMLfSQ01FO/+v00yZ2n0E7+tRR3je6KXs2Xgztu25dfjjtl38wmBegStRedNbfqHTU+vY803G7X8PUvPQWf1f+OYGWX2LR8QlAu3rJxWqxQDOHSscMVqEAdiIjBAiwQcrqvRdCCb0xoUxLU+qbi9LTvtKArDi8gBEXl1Xk9Rh0McBBmxC1TrOl6lvKd0drOIQ4uFthC6L1rhs0kFpPT11qQYppgDxOFW/PQUYV1ywtvSU95+W/fTc0jx0UQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AQftRw5H; dkim-atps=neutral; spf=pass (client-ip=209.85.216.41; helo=mail-pj1-f41.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AQftRw5H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.41; helo=mail-pj1-f41.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmG6P6h3Yz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 15:59:24 +1100 (AEDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so1618975a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 20:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767761902; x=1768366702; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nurUXHNs091EaceKYt0jtxQiBJ2IaAdTDr7CGJ+zWBU=;
        b=AQftRw5HrVukWybW31UK3BXgGAqr6sEv6b0kZes27ghov9bPLhRfB+F6N9xt5BhPVl
         yPApE7buSQmTMsD3+Xka28BwdxzXR1aB4xrUQ76RQHomJ3YFqN9wdKO/ejjgRMwxUVhN
         PCs/76f5MGSB5H3RGdfY3OpNg0IOwy3M8tg1B3QIdiLMHJxtFBraXDw33/umYMcQhTUP
         4pFaQlYFSiSgLbAMJpxF36ErPkWMiFutRC936w49LYz0at1qFYpGnqqEM8AXetixSDI/
         EI5Eae8HdrXVLkE0bNnCTLwuSl4qAOm1pBzNvfUlBUKIdrjhvo4xV+vvIxHQO3f8Iyjj
         iHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767761902; x=1768366702;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nurUXHNs091EaceKYt0jtxQiBJ2IaAdTDr7CGJ+zWBU=;
        b=O7Z14+fvmJkhOoGnfQmiph/5fjhdcbmThRKKHI95dgvdkhHQHXNd54K/WgzORHQ+P4
         0HC+wUdpzRmFUmFpc0wijQJoavJ60lJZXpxMsSHNAS+E17rPnOzNgYZ4aN+dKviEHl81
         l9Okd8SwrHNe4O5l9BedjddfDs5Z0NgD4KOcVmecCLBtNslb17AGOXtfeHdgPcqBPzQc
         CntjhOI2Bj1vto4udbDHLnaJ5U1p7YDVJn3g1jg8/gySX3sfdbjT9gMlZCVnFsL352Dd
         wt9byIqVvoC9QCUnr37MEoWVtA8o5fbypV/nwHfn9H3IYt/z6dtedNYF2Ra+FaLIVq4W
         L17A==
X-Forwarded-Encrypted: i=1; AJvYcCUuV8fl8+RT9EvX3IbDsnGYiPM8xvMSqpU9ZZMRS8+d0uf4Qsbgk5Yq+eD77hFdrO4YgpWWjKUvA0bn4oE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIW5GZzNPsUxKs6/NMhJjo4qTlYZF2PQ41a4rq8m5PBZopR1EP
	2LuFNGJtbSNCHJ1ACxRBB+wqUeBSN2XHmZAsFV9PDEubA1dHtV88xaT6
X-Gm-Gg: AY/fxX69xVtCbU/mWtciaCyzXRFQlEFPin9S+S0B75pAUVxGb57TRk/3bUV7414Cvwb
	WCo2M6dhc7I8lmRV+iGtcAyoxu4U5medeTJSC8R6nxBl7bWZJdmg+fq8Gwe6kZOsPUkgaQ/+Z4Z
	40432lm2njiZHq65HM8Z0R4Z2VYwfxTZHRgi2wQ0Nx7eGKDFO4QaXFLfCz7G+iG+hVeSuDYM4wF
	54FT8tu9imuTyp5GVhIgiYBOslEOK/vW+i/CFvb/jg+wczOmuoqyOD3Xk95G48XWWc1uw/Quj4A
	IIvsNA91bbn5cLDS6zS5ROfKWvhY4dz8QIQavqx+kYvuXpXNbeqaDZbE6xk9EVRHkq85SdYhDU5
	ALt44/VlwuDn5Syp2eDdV+jmhGAAATLL5PKe/STOS8menAAmIIgFxKDCURkr3z8y1UNMKbp5DrZ
	sLQoOvVw==
X-Google-Smtp-Source: AGHT+IE3iEJ4twso46GOnqJPDopUox2qFLaKHiDPKI95vlPPxjV/F7mxvaI/CeOE2s8GrRHRScEd6Q==
X-Received: by 2002:a17:90b:6c7:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-34f68d3b4a4mr1191743a91.33.1767761901762;
        Tue, 06 Jan 2026 20:58:21 -0800 (PST)
Received: from dw-tp ([49.207.192.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb75902sm3622895a91.16.2026.01.06.20.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:58:20 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Michal Simek <monstr@monstr.eu>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 14/28] powerpc: introduce arch_zone_limits_init()
In-Reply-To: <20260102070005.65328-15-rppt@kernel.org>
Date: Wed, 07 Jan 2026 09:57:34 +0530
Message-ID: <87ldia9he1.ritesh.list@gmail.com>
References: <20260102070005.65328-1-rppt@kernel.org> <20260102070005.65328-15-rppt@kernel.org>
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
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Mike Rapoport <rppt@kernel.org> writes:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/powerpc/mm/mem.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 3ddbfdbfa941..32c496bfab4f 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -221,13 +221,23 @@ static int __init mark_nonram_nosave(void)
>   * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
>   * ZONE_DMA.
>   */
> -static unsigned long max_zone_pfns[MAX_NR_ZONES];
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> +{
> +#ifdef CONFIG_ZONE_DMA
> +	max_zone_pfns[ZONE_DMA]	= min(zone_dma_limit, max_low_pfn - 1) + 1;

Hi Mike, 

This doesn't look correct. Isn't the zone_dma_limit value in bytes actually?
Shouldn't it be -

     max_zone_pfns[ZONE_DMA] = min((zone_dma_limit >> PAGE_SHIFT) + 1, max_low_pfn);


-ritesh


> +#endif
> +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +#ifdef CONFIG_HIGHMEM
> +	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
> +#endif
> +}
>  
>  /*
>   * paging_init() sets up the page tables - in fact we've already done this.
>   */
>  void __init paging_init(void)
>  {
> +	unsigned long max_zone_pfns[MAX_NR_ZONES];
>  	unsigned long long total_ram = memblock_phys_mem_size();
>  	phys_addr_t top_of_ram = memblock_end_of_DRAM();
>  	int zone_dma_bits;
> @@ -259,15 +269,7 @@ void __init paging_init(void)
>  
>  	zone_dma_limit = DMA_BIT_MASK(zone_dma_bits);
>  
> -#ifdef CONFIG_ZONE_DMA
> -	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
> -				      1UL << (zone_dma_bits - PAGE_SHIFT));
> -#endif
> -	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> -#ifdef CONFIG_HIGHMEM
> -	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
> -#endif
> -
> +	arch_zone_limits_init(max_zone_pfns);
>  	free_area_init(max_zone_pfns);
>  
>  	mark_nonram_nosave();
> -- 
> 2.51.0


