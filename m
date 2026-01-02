Return-Path: <linuxppc-dev+bounces-15175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D8CEF7B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 00:34:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djg5T5r5kz2xpl;
	Sat, 03 Jan 2026 10:34:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767396877;
	cv=none; b=HJCslXy47xqATWMzDwi1qekbIwmPDcFHNW//rMOklZxtei/ExrTnW11px2JijPHJnl8rPYC0Pg5fvpfaQiPySmy8EERUNE7O6GPGUnmue2J4nTLJXOs9ivMT4TeTeJBpF+QAliZFzMI676Syc50rOzxBOoOV9AQqWXTSJJmmZow9l6fJrP8Jac7Gl+IMST2kEAN+Yj6gFq+ofKU3b9DIVHP2OEOKpSfpZDtLxYV+o7lEjVnyj+HcuGRt6vMkFKhwMPhoSFB8ILq8gbwIvFJp9Oo+d7kZHA08z+JPmXQ8vSkNge8cxtH2Nw50r5fzGVOB7lNidz17CdncJFAikK07qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767396877; c=relaxed/relaxed;
	bh=7oJkD+3I1ySqG2dU6TJV84R7uGtBSIJL6aFjqNNbCRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dq+U0DRZQTs/tgsXqWGwmgj04KlcaXGOJuooscIL4vvxmx2UpLh4WkI4gMzhn9j2R/6hci7UqzA9B6xqkitnCvf2QzbycO3OkZZqTKfhPBuEm6J3i76AhSaSKAJ9PUCVzWASTM/bUcBnX69n4mLRGI/1pgXn9umEV6qLYgNCDN6OYhkZkPLgEstBIBBSVxuMdc55z6Lt4g2yDA7AvpJjpwZuB/Z3N6gR3euljeglafnf9Pn3VROQdGKJjf2dpzR8lKOw3w8skS4aRgAqNXIIFuDQPax9j9Q1t5qmwbuJyzmt4U0kYkjliqbCO50WKLjjZAVEOEc2q9SDrh09AiowPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hzZrXjn+; dkim-atps=neutral; spf=pass (client-ip=209.85.167.45; helo=mail-lf1-f45.google.com; envelope-from=klarasmodin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hzZrXjn+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.45; helo=mail-lf1-f45.google.com; envelope-from=klarasmodin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djg5S1Jdtz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 10:34:35 +1100 (AEDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5959187c5a9so10729453e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 15:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767396811; x=1768001611; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7oJkD+3I1ySqG2dU6TJV84R7uGtBSIJL6aFjqNNbCRs=;
        b=hzZrXjn+bySBa2KkTidT1NZrJAGZ9KFM5SHJH/U0gH5tYppDflyMRNutw9nBPsRYcI
         DHgkXkbfEhlK3e4wBxs2I5LRiSPqSoB0TBsE0stu2X6p+86BUE+0u8MKB6GmNnhaOQsf
         isSin7sJWrz9hla+jPYmrztfJc9pgctsqGeQWG16tnnGBIbXDDztvs6UKv9sHst8gD6b
         8on0bVakutA8hZwTeRgMRKe/tdewhyCRj/pMjMmUCBIDDl8EMnx3403Vas1JmV70eCXf
         UIcWm+xaeoVj2ruSSGb9KperdQXQYVLsz2Qk40EfGMDWLaN7d26cEPE1SvUolgMfrRcS
         Dvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767396811; x=1768001611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oJkD+3I1ySqG2dU6TJV84R7uGtBSIJL6aFjqNNbCRs=;
        b=MUAl5RnxdSRs7gk+szdruD38Ega854aXFL+J1NA99sM2+gLMev6mcJ5KlucumQgrka
         ovcD7vQzWnILhZq+PJmFx6cpq/KxYIE472kERbwqedm2PfcszK8Bf9B3KLnQ3q6YJANr
         Rb1aO9QxikRL3FPDR3ZDnlhWNhYGxlfc5Hmw36bwgmeKa3ObmZyMXo/HfHYkCKe9k+Do
         aeQMDZlLRFIfoU7NaBiF/CfvIrZhZ+lMn1g5/Kb415NVGwSSClyyrHD8LmLyalri59Ro
         FYyBakiKEBVjlvzp+ZczUwkdKwnREGJlag2DSWUByugx3oLQ3lcWQWDOx7XO/RMH4FRB
         +OeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsMbDw+5+2s2y2xpL4MvjYRDaZfJ8THJNISaexJPtcGrcU93uA6ToxCT+3Rz/92ubsMSIY+SCdZdBS6dE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlorGzS9CfBgr8Y9Fl/BdUODHmuG4Xgy5ibBxyHvk7W1i3PAkZ
	3HjprHgrZ3nNvDdf85LuTf+N52Lr8KHSj2zfi/YXoi/ku2li/zMx2PJH
X-Gm-Gg: AY/fxX4IFhjQ4bkV5POPUHmaBXw/boCpeZ4hMOi97ilDA0vcEqfZqIg3XkrYIHSwvGU
	B4A3bzzT+ceDurRGQLwJcbhBx32Gj9uKVu7jnx8B42kf7R6trlcAREkl3W18FFavJ2p8KiJDoDA
	SkdcBPFkE9sbYsLiou93dnr2eUD2dqJa1SQVsTUAILrPC4tJvqPUhQIzQL7OyAOP9tvoHea7rPl
	WDUzj40pdet8HqnhVxaKZv/w02lTIb2EpZTBKrxbzLy7tnbFKl4x3R5EyMSzSrjfDCiI8ur9YW8
	PP6S37aJXM8L/x460Ek5SLXOYeM8Snk7T4m9FYkMn4M0m93DOwiHIeUZX2R3LddjQyx6HWw9zYk
	vubpnss3X8AqeEROJvrRkUDG2MuGoCp1XhnuH4wDG+IpmY/dTkA96O9RzXW5if3qJLpFl/BahKS
	Za4ULSD02ZzLbatqumRVIEsRdm
X-Google-Smtp-Source: AGHT+IH2H1z9QVIhTu3A3MPtZYT5DDmpE6MbcXNtDvemf/egyv4QEgcDqeHHJdIO1qKRKt95zoj43Q==
X-Received: by 2002:ac2:4e08:0:b0:594:93b8:88b6 with SMTP id 2adb3069b0e04-59a17db705bmr11802619e87.38.1767396810454;
        Fri, 02 Jan 2026 15:33:30 -0800 (PST)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm12368060e87.43.2026.01.02.15.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 15:33:29 -0800 (PST)
Date: Sat, 3 Jan 2026 00:33:29 +0100
From: Klara Modin <klarasmodin@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 22/28] arch, mm: consolidate initialization of nodes,
 zones and memory map
Message-ID: <aVhN2NgQEKe0yzva@soda.int.kasm.eu>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-23-rppt@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102070005.65328-23-rppt@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 2026-01-02 08:59:58 +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> To initialize node, zone and memory map data structures every architecture
> calls free_area_init() during setup_arch() and passes it an array of zone
> limits.
> 
> Beside code duplication it creates "interesting" ordering cases between
> allocation and initialization of hugetlb and the memory map. Some
> architectures allocate hugetlb pages very early in setup_arch() in certain
> cases, some only create hugetlb CMA areas in setup_arch() and sometimes
> hugetlb allocations happen mm_core_init().
> 
> With arch_zone_limits_init() helper available now on all architectures it
> is no longer necessary to call free_area_init() from architecture setup
> code. Rather core MM initialization can call arch_zone_limits_init() in a
> single place.
> 
> This allows to unify ordering of hugetlb vs memory map allocation and
> initialization.
> 
> Remove the call to free_area_init() from architecture specific code and
> place it in a new mm_core_init_early() function that is called immediately
> after setup_arch().
> 
> After this refactoring it is possible to consolidate hugetlb allocations
> and eliminate differences in ordering of hugetlb and memory map
> initialization among different architectures.
> 
> As the first step of this consolidation move hugetlb_bootmem_alloc() to
> mm_core_early_init().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

This breaks boot on my Raspberry Pi 1. The reason seems to be the use of
page_folio() when initializing the dynamically allocated zero page in
arm, which doesn't work when free_area_init() hasn't been called yet.

The following oopses are generated:

 Booting Linux on physical CPU 0x0
 Linux version 6.19.0-rc3-03898-g7975b0084358 (klara@soda.int.kasm.eu) (armv6j-unknown-linux-gnueabihf-gcc (Gentoo 15.2.1_p20251122 p3) 15.2.1 20251122, GNU ld (Gentoo 2.45.1 p1) 2.45.1) #451 Fri Jan  2 20:26:00 CET 2026
 CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
 CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
 OF: fdt: Machine model: Raspberry Pi Model B Rev 2
 earlycon: pl11 at MMIO32 0x20201000 (options '')
 printk: legacy bootconsole [pl11] enabled
 Memory policy: Data cache writeback
 Reserved memory: created CMA memory pool at 0x19400000, size 64 MiB
 OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
 OF: reserved mem: 0x19400000..0x1d3fffff (65536 KiB) map reusable linux,cma
 8<--- cut here ---
 Unable to handle kernel paging request at virtual address 003dfb44 when read
 [003dfb44] *pgd=00000000
 Internal error: Oops: 5 [#1] ARM
 CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc3-03898-g7975b0084358 #451 NONE
 Hardware name: BCM2835
 PC is at paging_init (include/linux/page-flags.h:284 (discriminator 2) arch/arm/mm/mmu.c:1790 (discriminator 2))
 LR is at paging_init (arch/arm/mm/mmu.c:1789 (discriminator 1))
 pc :    lr :    psr: 600000d3
 sp : c0d01ef8  ip : defdb000  fp : 0000000b
 r10: 00200000  r9 : d9400000  r8 : ffe00000
 r7 : c0d09050  r6 : c0d0902c  r5 : c0d43d40  r4 : 0001efda
 r3 : c0dab20c  r2 : 00000000  r1 : 003dfb40  r0 : 00000000
 Flags: nZCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segment none
 Control: 00c5387d  Table: 00004008  DAC: 00000051
 Register r0 information: NULL pointer
 Register r1 information: non-paged memory
 Register r2 information: NULL pointer
 Register r3 information:
 8<--- cut here ---
 Unable to handle kernel paging request at virtual address 0001b564 when read
 [0001b564] *pgd=00000000
 Internal error: Oops: 5 [#2] ARM
 CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc3-03898-g7975b0084358 #451 NONE
 Hardware name: BCM2835
 PC is at kmem_dump_obj (mm/slab.h:142 (discriminator 2) mm/slab.h:178 (discriminator 2) mm/slab_common.c:609 (discriminator 2))
 LR is at 0x1
 pc :    lr :    psr: 200001d3
 sp : c0d01cc8  ip : 00000000  fp : 0000000b
 r10: 00200000  r9 : c0dab1dc  r8 : 00000000
 r7 : 00000005  r6 : 00000dab  r5 : 0001b560  r4 : c0dab20c
 r3 : c0dc2058  r2 : 1f000000  r1 : 00c00000  r0 : 00000001
 Flags: nzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segment none
 Control: 00c5387d  Table: 00004008  DAC: 00000051
 Register r0 information: non-paged memory
 Register r1 information: non-paged memory
 Register r2 information: non-paged memory
 Register r3 information:
 8<--- cut here ---

and the second one repeats for some time afterwards.

I experimented a little by allocating the zero page statically as many
other arches do which fixes the issue as it does not need to be
initialized at this point anymore, though I have no idea if that's
appropriate.

Regards,
Klara Modin

...

> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index bdcc3639681f..a8f7b4084715 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -118,15 +118,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
>  #endif
>  }
>  
> -static void __init zone_sizes_init(unsigned long min, unsigned long max_low,
> -	unsigned long max_high)
> -{
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
> -}
> -
>  #ifdef CONFIG_HAVE_ARCH_PFN_VALID
>  int pfn_valid(unsigned long pfn)
>  {
> @@ -222,13 +213,6 @@ void __init bootmem_init(void)
>  	 * done after the fixed reservations
>  	 */
>  	sparse_init();
> -
> -	/*
> -	 * Now free the memory - free_area_init needs
> -	 * the sparse mem_map arrays initialized by sparse_init()
> -	 * for memmap_init_zone(), otherwise all PFNs are invalid.
> -	 */
> -	zone_sizes_init(min_low_pfn, max_low_pfn, max_pfn);
>  }
>  
>  /*

...

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 628c0e0ac313..64d6f9c15ef1 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -45,6 +45,7 @@ struct pt_regs;
>  struct folio_batch;
>  
>  void arch_mm_preinit(void);
> +void mm_core_init_early(void);
>  void mm_core_init(void);
>  void init_mm_internals(void);
>  
> @@ -3536,7 +3537,7 @@ static inline unsigned long get_num_physpages(void)
>  }
>  
>  /*
> - * Using memblock node mappings, an architecture may initialise its
> + * FIXME: Using memblock node mappings, an architecture may initialise its
>   * zones, allocate the backing mem_map and account for memory holes in an
>   * architecture independent manner.
>   *
> @@ -3551,7 +3552,6 @@ static inline unsigned long get_num_physpages(void)
>   *	memblock_add_node(base, size, nid, MEMBLOCK_NONE)
>   * free_area_init(max_zone_pfns);
>   */
> -void free_area_init(unsigned long *max_zone_pfn);
>  void arch_zone_limits_init(unsigned long *max_zone_pfn);
>  unsigned long node_map_pfn_alignment(void);
>  extern unsigned long absent_pages_in_range(unsigned long start_pfn,
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..445b5643ecec 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1025,6 +1025,7 @@ void start_kernel(void)
>  	page_address_init();
>  	pr_notice("%s", linux_banner);
>  	setup_arch(&command_line);
> +	mm_core_init_early();
>  	/* Static keys and static calls are needed by LSMs */
>  	jump_label_init();
>  	static_call_init();
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index fc2a6f1e518f..ffc4a0f1fee9 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1810,7 +1810,6 @@ static void __init set_high_memory(void)
>  
>  /**
>   * free_area_init - Initialise all pg_data_t and zone data
> - * @max_zone_pfn: an array of max PFNs for each zone
>   *
>   * This will call free_area_init_node() for each active node in the system.
>   * Using the page ranges provided by memblock_set_node(), the size of each
> @@ -1821,17 +1820,14 @@ static void __init set_high_memory(void)
>   * starts where the previous one ended. For example, ZONE_DMA32 starts
>   * at arch_max_dma_pfn.
>   */
> -void __init free_area_init(unsigned long *max_zone_pfn)
> +static void __init free_area_init(void)
>  {
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  	unsigned long start_pfn, end_pfn;
>  	int i, nid, zone;
>  	bool descending;
>  
> -	/* Record where the zone boundaries are */
> -	memset(arch_zone_lowest_possible_pfn, 0,
> -				sizeof(arch_zone_lowest_possible_pfn));
> -	memset(arch_zone_highest_possible_pfn, 0,
> -				sizeof(arch_zone_highest_possible_pfn));
> +	arch_zone_limits_init(max_zone_pfn);
>  
>  	start_pfn = PHYS_PFN(memblock_start_of_DRAM());
>  	descending = arch_has_descending_max_zone_pfns();
> @@ -2681,13 +2677,19 @@ void __init __weak mem_init(void)
>  {
>  }
>  
> +void __init mm_core_init_early(void)
> +{
> +	hugetlb_bootmem_alloc();
> +
> +	free_area_init();
> +}
> +
>  /*
>   * Set up kernel memory allocators
>   */
>  void __init mm_core_init(void)
>  {
>  	arch_mm_preinit();
> -	hugetlb_bootmem_alloc();
>  
>  	/* Initializations relying on SMP setup */
>  	BUILD_BUG_ON(MAX_ZONELISTS > 2);
> -- 
> 2.51.0
> 

