Return-Path: <linuxppc-dev+bounces-2328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1761E9A1536
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 23:54:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTPrh08SYz2y8F;
	Thu, 17 Oct 2024 08:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729099279;
	cv=none; b=H+nkcXVY48Fm1+a5uLcDICt4eWP/R9jEioXEWB6jc99i4dI4QqioXqC1LR2Ceeeo/fAOtrz5GmnZ2dt/GsKf/AKDJinR94auVmVwZu9YRtjBiObsARzZVlUD20dbw4nnIb75DoFgqsI0DIyrV1FMJVcDTZlSCmb5rpXq3SkMdzOycHyM29CfTL3PK9yOj+UvppeGaR/IKHFbXWQw62AnqMm1xzo3Q4ndQYfBUOvBqiBZyXUA4OPm+DwzBhNoNvRAUJv164roRJDb2AmATET8YVEQ2P5pCY8dEKtPWsuJAbcp/TRG5/1JobVQtv4ptU5+Ka7MsCYK91KMTSJvHKLECg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729099279; c=relaxed/relaxed;
	bh=1GP0B75uZXvlMdPMs8sxWFWqOcAn6bbZYSntM7zvNeg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6+MQP7nVwPRj8VR2E+xAJ4TTJ42CinzdKFVjOJtSFzc+wiInnU8wTXzY/m22W6lxGOTV6JQAgTYQ6rqPdFcDCp7/SyxIcvOpSRWNJmCvg+xGtb7ljBWIA58o3mlHFdYhMMpRFcPu7kOL4+cHLyIr5Q+wQ9JMOhLpf/1/slnFu8coCFys01stasL9Zh5kiZHhX8I8EAojYY8NUgd3vHSbbWvx1q2pNL5IhjyoM75GjPIaKCdK1xOoqGGm3L4Sg6nwPzJ15sQGBd2LC1BNuMumrdsFrEhoH/DMMn/HsYasrMxBrEJCkVIi8/uik2B9bdJow3Vpldp1c1zT3AAIQF8Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DfYOPuc6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DfYOPuc6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTHn76Rd0z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 04:21:15 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539e13375d3so52447e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729099269; x=1729704069; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GP0B75uZXvlMdPMs8sxWFWqOcAn6bbZYSntM7zvNeg=;
        b=DfYOPuc69b9toLV3Rw1LfSquk/DgVVAbQgoz6eM3eRiGYIXpNriYj1rdbCO9MPJLdh
         bVfHIjcM3v3M6XdVGg2vQqTJxfi6t605uJbDc8ZdZpWAUBkP01wH0hNgdDIWmVr0sAtN
         z/hDP/OlnkF81FO0oOG0VJddGBf1Ownfu4g0WqS+pjY/A6+IGTDuTDvKkMK2AAN/eG9X
         vo4aWYLZqk3gqh2tJniikB2k4Pr7tOWUqU4ZdPuvBm0zhsFtUBXTM9p9Rt2IWebsWalD
         1bIdk/oVMo1XGbz7MmYtcmzaAMAv0pBAtvNd7u4Mb7saPm1f9Nuh5l8p5adw8HcnFWKT
         X41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729099269; x=1729704069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GP0B75uZXvlMdPMs8sxWFWqOcAn6bbZYSntM7zvNeg=;
        b=MKE+QUNg9/t//VxZ73YpW4747ud7YhSyi5nvTvsXfG1rJEsho+9Zwc105IsUhpK6GA
         9woUrQ4ZoW47bOncm9S4/oCO54+reD+ZSJ4gy9HPr2tJjQ9tzf9fSl/m2fClxgMIhb0z
         OQTRr+yd1mQZ0ad6/J2qdxXkiCJuHp97colAXo3x2cEcsF9bZ1hfa6NOhRvEFFWBv5QC
         f7YMbiK2lVokbXmwQHljLS8ije/wGegn/guKSSZsL2IDvKRxxdH6Lz+KQ5m3RG5WchVD
         1w4arBRfmCmJ3rhJP0Rs65LG9/6wv3QJAYrY/zPfnGFyynviQjcOgu0w1/iG5YpjJbAe
         Oo0A==
X-Forwarded-Encrypted: i=1; AJvYcCWRS6JnESsIqlM9uSu8+xLpMaVok3bgLLyfQS3APymyA1pXZB81J9H37kTFAha1EasMj36dwPXrJo+1kio=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzsvL9u4rHJBTTsv8aAGiIzbAcagnt9PrJTABhHf0YRCt3xjEUa
	NAG8g3WIf/DGD6UHC4ZZsU801vKZbmzJwZCro8hrjRRjJOxHZQhZ
X-Google-Smtp-Source: AGHT+IE3BOIzolDg/ircoXlrXALD+U8X6mjirKNd/VoSdJ8ZQKv3Aj0k5T5yFcByNzOByKxATFiOdw==
X-Received: by 2002:a05:6512:402a:b0:539:f619:b458 with SMTP id 2adb3069b0e04-539f619b4cbmr6540423e87.22.1729099268652;
        Wed, 16 Oct 2024 10:21:08 -0700 (PDT)
Received: from pc636 (host-95-203-1-67.mobileonline.telia.com. [95.203.1.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8a5fsm512819e87.26.2024.10.16.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 10:21:08 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Oct 2024 19:21:02 +0200
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 2/8] mm: vmalloc: don't account for number of nodes
 for HUGE_VMAP allocations
Message-ID: <Zw_1_ln440eHTjGt@pc636>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-3-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-3-rppt@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:18PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> vmalloc allocations with VM_ALLOW_HUGE_VMAP that do not explicitly
> specify node ID will use huge pages only if size_per_node is larger than
> a huge page.
> Still the actual allocated memory is not distributed between nodes and
> there is no advantage in such approach.
> On the contrary, BPF allocates SZ_2M * num_possible_nodes() for each
> new bpf_prog_pack, while it could do with a single huge page per pack.
> 
> Don't account for number of nodes for VM_ALLOW_HUGE_VMAP with
> NUMA_NO_NODE and use huge pages whenever the requested allocation size
> is larger than a huge page.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/vmalloc.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 634162271c00..86b2344d7461 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3763,8 +3763,6 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  	}
>  
>  	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
> -		unsigned long size_per_node;
> -
>  		/*
>  		 * Try huge pages. Only try for PAGE_KERNEL allocations,
>  		 * others like modules don't yet expect huge pages in
> @@ -3772,13 +3770,10 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  		 * supporting them.
>  		 */
>  
> -		size_per_node = size;
> -		if (node == NUMA_NO_NODE)
> -			size_per_node /= num_online_nodes();
> -		if (arch_vmap_pmd_supported(prot) && size_per_node >= PMD_SIZE)
> +		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
>  			shift = PMD_SHIFT;
>  		else
> -			shift = arch_vmap_pte_supported_shift(size_per_node);
> +			shift = arch_vmap_pte_supported_shift(size);
>  
>  		align = max(real_align, 1UL << shift);
>  		size = ALIGN(real_size, 1UL << shift);
>
Looking at this place, i see that an overwriting a "size" approach seems as
something that is a bit hard to follow. Below we have following code:

<snip>
...
again:
	area = __get_vm_area_node(real_size, align, shift, VM_ALLOC |
	  VM_UNINITIALIZED | vm_flags, start, end, node,
	  gfp_mask, caller);
...
<snip>

where we pass a "real_size", whereas there is only one place in the
__vmalloc_node_range_noprof() function where a "size" is used. It is
in the end of function:

<snip>
...
	size = PAGE_ALIGN(size);
	if (!(vm_flags & VM_DEFER_KMEMLEAK))
		kmemleak_vmalloc(area, size, gfp_mask);

	return area->addr;
<snip>

As fro this patch:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

