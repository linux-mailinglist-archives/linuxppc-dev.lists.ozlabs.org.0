Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A8A23162D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 01:13:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGXX908MLzDr7d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 09:12:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.193;
 helo=mail-yb1-f193.google.com; envelope-from=emil.renner.berthing@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=esmil.dk
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGKg965lDzDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 01:03:13 +1000 (AEST)
Received: by mail-yb1-f193.google.com with SMTP id 2so10761628ybr.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 08:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WONLNFpu794q8n+TRB6+pkDlBE/6T7gYDBMx4Vb+XK0=;
 b=qwUKY28wKJvQMI/7E/pFkfZ8lBj9icRPDLRViYIrUdGMvICfh9ZGloAvZ9liCCJhva
 etmnvczphG4g2wiO1KWWHAPChVp0tSuTebasqBJJcXETOCUq2RQfNClw4hWrJ69m1zrR
 WmwgNs2ldvlLKSZ990qKVpV1OnZ9yA/ZM7kTO8DahqBwgHmjcsw2LUJ89E54yW2tgtj7
 aWZEUfWn+tXbUjrBa7WdGrYn6OC3nKRCiLXlswJO38fZRyLLBRjN72PcRXxpMDY0W97Q
 9fD43xtamtH31dLMybvZIzdp8Jjygq7jnDlNLXY+UXOX9LFig1s/w3FqbWLnNRB7UFNL
 RTJQ==
X-Gm-Message-State: AOAM533UtrcBfYyQ14T5ed+FgV/KR3CvbtFtzPtdAx5aRQxzco4oyW11
 iwRew8tAz2CH6wrTGA2D0rjpolVHfSPwML1k7jI=
X-Google-Smtp-Source: ABdhPJy6pvM1HdTf+4+KuDPw7q5x5TX3BiD1AbEfhR2ccz8kUsayz/K90hZ+hTWV2UWcgHUgP/a4rPlezTgOKkfj4tU=
X-Received: by 2002:a25:bc13:: with SMTP id i19mr40197095ybh.391.1595948589701; 
 Tue, 28 Jul 2020 08:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-14-rppt@kernel.org>
In-Reply-To: <20200728051153.1590-14-rppt@kernel.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 28 Jul 2020 17:02:57 +0200
Message-ID: <CANBLGcw8u7acWFzRawk+ZOgbPK=on5ZEf6H-zrt49xNN3JbJFQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] arch,
 drivers: replace for_each_membock() with for_each_mem_range()
To: Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000c4e10105ab81bcf4"
X-Mailman-Approved-At: Wed, 29 Jul 2020 09:11:40 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Christoph Hellwig <hch@lst.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000c4e10105ab81bcf4
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jul 2020, 07:16 Mike Rapoport, <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
>
> There are several occurrences of the following pattern:
>
>         for_each_memblock(memory, reg) {
>                 start = __pfn_to_phys(memblock_region_memory_base_pfn(reg);
>                 end = __pfn_to_phys(memblock_region_memory_end_pfn(reg));
>
>                 /* do something with start and end */
>         }
>
> Using for_each_mem_range() iterator is more appropriate in such cases and
> allows simpler and cleaner code.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/arm/kernel/setup.c                  | 18 +++++++----
>  arch/arm/mm/mmu.c                        | 39 ++++++++----------------
>  arch/arm/mm/pmsa-v7.c                    | 20 ++++++------
>  arch/arm/mm/pmsa-v8.c                    | 17 +++++------
>  arch/arm/xen/mm.c                        |  7 +++--
>  arch/arm64/mm/kasan_init.c               |  8 ++---
>  arch/arm64/mm/mmu.c                      | 11 ++-----
>  arch/c6x/kernel/setup.c                  |  9 +++---
>  arch/microblaze/mm/init.c                |  9 +++---
>  arch/mips/cavium-octeon/dma-octeon.c     | 12 ++++----
>  arch/mips/kernel/setup.c                 | 31 +++++++++----------
>  arch/openrisc/mm/init.c                  |  8 +++--
>  arch/powerpc/kernel/fadump.c             | 27 +++++++---------
>  arch/powerpc/mm/book3s64/hash_utils.c    | 16 +++++-----
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 11 +++----
>  arch/powerpc/mm/kasan/kasan_init_32.c    |  8 ++---
>  arch/powerpc/mm/mem.c                    | 16 ++++++----
>  arch/powerpc/mm/pgtable_32.c             |  8 ++---
>  arch/riscv/mm/init.c                     | 24 ++++++---------
>  arch/riscv/mm/kasan_init.c               | 10 +++---
>  arch/s390/kernel/setup.c                 | 27 ++++++++++------
>  arch/s390/mm/vmem.c                      | 16 +++++-----
>  arch/sparc/mm/init_64.c                  | 12 +++-----
>  drivers/bus/mvebu-mbus.c                 | 12 ++++----
>  drivers/s390/char/zcore.c                |  9 +++---
>  25 files changed, 187 insertions(+), 198 deletions(-)
>
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index d8e18cdd96d3..3f65d0ac9f63 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -843,19 +843,25 @@ early_param("mem", early_mem);
>
>  static void __init request_standard_resources(const struct machine_desc
> *mdesc)
>  {
> -       struct memblock_region *region;
> +       phys_addr_t start, end, res_end;
>         struct resource *res;
> +       u64 i;
>
>         kernel_code.start   = virt_to_phys(_text);
>         kernel_code.end     = virt_to_phys(__init_begin - 1);
>         kernel_data.start   = virt_to_phys(_sdata);
>         kernel_data.end     = virt_to_phys(_end - 1);
>
> -       for_each_memblock(memory, region) {
> -               phys_addr_t start =
> __pfn_to_phys(memblock_region_memory_base_pfn(region));
> -               phys_addr_t end =
> __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
> +       for_each_mem_range(i, &start, &end) {
>                 unsigned long boot_alias_start;
>
> +               /*
> +                * In memblock, end points to the first byte after the
> +                * range while in resourses, end points to the last byte in
> +                * the range.
> +                */
> +               res_end = end - 1;
> +
>                 /*
>                  * Some systems have a special memory alias which is only
>                  * used for booting.  We need to advertise this region to
> @@ -869,7 +875,7 @@ static void __init request_standard_resources(const
> struct machine_desc *mdesc)
>                                       __func__, sizeof(*res));
>                         res->name = "System RAM (boot alias)";
>                         res->start = boot_alias_start;
> -                       res->end = phys_to_idmap(end);
> +                       res->end = phys_to_idmap(res_end);
>                         res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>                         request_resource(&iomem_resource, res);
>                 }
> @@ -880,7 +886,7 @@ static void __init request_standard_resources(const
> struct machine_desc *mdesc)
>                               sizeof(*res));
>                 res->name  = "System RAM";
>                 res->start = start;
> -               res->end = end;
> +               res->end = res_end;
>                 res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
>
>                 request_resource(&iomem_resource, res);
> diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
> index 628028bfbb92..a149d9cb4fdb 100644
> --- a/arch/arm/mm/mmu.c
> +++ b/arch/arm/mm/mmu.c
> @@ -1155,9 +1155,8 @@ phys_addr_t arm_lowmem_limit __initdata = 0;
>
>  void __init adjust_lowmem_bounds(void)
>  {
> -       phys_addr_t memblock_limit = 0;
> -       u64 vmalloc_limit;
> -       struct memblock_region *reg;
> +       phys_addr_t block_start, block_end, memblock_limit = 0;
> +       u64 vmalloc_limit, i;
>         phys_addr_t lowmem_limit = 0;
>
>         /*
> @@ -1173,26 +1172,18 @@ void __init adjust_lowmem_bounds(void)
>          * The first usable region must be PMD aligned. Mark its start
>          * as MEMBLOCK_NOMAP if it isn't
>          */
> -       for_each_memblock(memory, reg) {
> -               if (!memblock_is_nomap(reg)) {
> -                       if (!IS_ALIGNED(reg->base, PMD_SIZE)) {
> -                               phys_addr_t len;
> +       for_each_mem_range(i, &block_start, &block_end) {
> +               if (!IS_ALIGNED(block_start, PMD_SIZE)) {
> +                       phys_addr_t len;
>
> -                               len = round_up(reg->base, PMD_SIZE) -
> reg->base;
> -                               memblock_mark_nomap(reg->base, len);
> -                       }
> -                       break;
> +                       len = round_up(block_start, PMD_SIZE) -
> block_start;
> +                       memblock_mark_nomap(block_start, len);
>                 }
> +               break;
>         }
>
> -       for_each_memblock(memory, reg) {
> -               phys_addr_t block_start = reg->base;
> -               phys_addr_t block_end = reg->base + reg->size;
> -
> -               if (memblock_is_nomap(reg))
> -                       continue;
> -
> -               if (reg->base < vmalloc_limit) {
> +       for_each_mem_range(i, &block_start, &block_end) {
> +               if (block_start < vmalloc_limit) {
>                         if (block_end > lowmem_limit)
>                                 /*
>                                  * Compare as u64 to ensure vmalloc_limit
> does
> @@ -1441,19 +1432,15 @@ static void __init kmap_init(void)
>
>  static void __init map_lowmem(void)
>  {
> -       struct memblock_region *reg;
>         phys_addr_t kernel_x_start = round_down(__pa(KERNEL_START),
> SECTION_SIZE);
>         phys_addr_t kernel_x_end = round_up(__pa(__init_end),
> SECTION_SIZE);
> +       phys_addr_t start, end;
> +       u64 i;
>
>         /* Map all the lowmem memory banks. */
> -       for_each_memblock(memory, reg) {
> -               phys_addr_t start = reg->base;
> -               phys_addr_t end = start + reg->size;
> +       for_each_mem_range(i, &start, &end) {
>                 struct map_desc map;
>
> -               if (memblock_is_nomap(reg))
> -                       continue;
> -
>                 if (end > arm_lowmem_limit)
>                         end = arm_lowmem_limit;
>                 if (start >= end)
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index 699fa2e88725..44b7644a4237 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -231,10 +231,9 @@ static int __init allocate_region(phys_addr_t base,
> phys_addr_t size,
>  void __init pmsav7_adjust_lowmem_bounds(void)
>  {
>         phys_addr_t  specified_mem_size = 0, total_mem_size = 0;
> -       struct memblock_region *reg;
> -       bool first = true;
>         phys_addr_t mem_start;
>         phys_addr_t mem_end;
> +       phys_addr_t reg_start, reg_end;
>         unsigned int mem_max_regions;
>         int num, i;
>
> @@ -262,20 +261,19 @@ void __init pmsav7_adjust_lowmem_bounds(void)
>         mem_max_regions -= num;
>  #endif
>
> -       for_each_memblock(memory, reg) {
> -               if (first) {
> +       for_each_mem_range(i, &reg_start, &reg_end) {
> +               if (i == 0) {
>                         phys_addr_t phys_offset = PHYS_OFFSET;
>
>                         /*
>                          * Initially only use memory continuous from
>                          * PHYS_OFFSET */
> -                       if (reg->base != phys_offset)
> +                       if (reg_start != phys_offset)
>                                 panic("First memory bank must be
> contiguous from PHYS_OFFSET");
>
> -                       mem_start = reg->base;
> -                       mem_end = reg->base + reg->size;
> -                       specified_mem_size = reg->size;
> -                       first = false;
> +                       mem_start = reg_start;
> +                       mem_end = reg_end
> +                       specified_mem_size = mem_end - mem_start;
>                 } else {
>                         /*
>                          * memblock auto merges contiguous blocks, remove
> @@ -283,8 +281,8 @@ void __init pmsav7_adjust_lowmem_bounds(void)
>                          * blocks separately while iterating)
>                          */
>                         pr_notice("Ignoring RAM after %pa, memory at %pa
> ignored\n",
> -                                 &mem_end, &reg->base);
> -                       memblock_remove(reg->base, 0 - reg->base);
> +                                 &mem_end, &reg_start);
> +                       memblock_remove(reg_start, 0 - reg_start);
>                         break;
>                 }
>         }
> diff --git a/arch/arm/mm/pmsa-v8.c b/arch/arm/mm/pmsa-v8.c
> index 0d7d5fb59247..b39e74b48437 100644
> --- a/arch/arm/mm/pmsa-v8.c
> +++ b/arch/arm/mm/pmsa-v8.c
> @@ -94,20 +94,19 @@ static __init bool is_region_fixed(int number)
>  void __init pmsav8_adjust_lowmem_bounds(void)
>  {
>         phys_addr_t mem_end;
> -       struct memblock_region *reg;
> -       bool first = true;
> +       phys_addr_t reg_start, reg_end;
> +       int i;
>
> -       for_each_memblock(memory, reg) {
> -               if (first) {
> +       for_each_mem_range(i, &reg_start, &reg_end) {
> +               if (i == 0) {
>                         phys_addr_t phys_offset = PHYS_OFFSET;
>
>                         /*
>                          * Initially only use memory continuous from
>                          * PHYS_OFFSET */
> -                       if (reg->base != phys_offset)
> +                       if (reg_start != phys_offset)
>                                 panic("First memory bank must be
> contiguous from PHYS_OFFSET");
> -                       mem_end = reg->base + reg->size;
> -                       first = false;
> +                       mem_end = reg_end;
>                 } else {
>                         /*
>                          * memblock auto merges contiguous blocks, remove
> @@ -115,8 +114,8 @@ void __init pmsav8_adjust_lowmem_bounds(void)
>                          * blocks separately while iterating)
>                          */
>                         pr_notice("Ignoring RAM after %pa, memory at %pa
> ignored\n",
> -                                 &mem_end, &reg->base);
> -                       memblock_remove(reg->base, 0 - reg->base);
> +                                 &mem_end, &reg_start);
> +                       memblock_remove(reg_start, 0 - reg_start);
>                         break;
>                 }
>         }
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index d40e9e5fc52b..05f24ff41e36 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -24,11 +24,12 @@
>
>  unsigned long xen_get_swiotlb_free_pages(unsigned int order)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t base;
>         gfp_t flags = __GFP_NOWARN|__GFP_KSWAPD_RECLAIM;
> +       u64 i;
>
> -       for_each_memblock(memory, reg) {
> -               if (reg->base < (phys_addr_t)0xffffffff) {
> +       for_each_mem_range(i, &base, NULL) {
> +               if (base < (phys_addr_t)0xffffffff) {
>                         if (IS_ENABLED(CONFIG_ZONE_DMA32))
>                                 flags |= __GFP_DMA32;
>                         else
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index 7291b26ce788..1faa086f9193 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -212,7 +212,7 @@ void __init kasan_init(void)
>  {
>         u64 kimg_shadow_start, kimg_shadow_end;
>         u64 mod_shadow_start, mod_shadow_end;
> -       struct memblock_region *reg;
> +       phys_addr_t _start, _end;
>         int i;
>
>         kimg_shadow_start = (u64)kasan_mem_to_shadow(_text) & PAGE_MASK;
> @@ -246,9 +246,9 @@ void __init kasan_init(void)
>                 kasan_populate_early_shadow((void *)mod_shadow_end,
>                                             (void *)kimg_shadow_start);
>
> -       for_each_memblock(memory, reg) {
> -               void *start = (void *)__phys_to_virt(reg->base);
> -               void *end = (void *)__phys_to_virt(reg->base + reg->size);
> +       for_each_mem_range(i, &start, &end) {
> +               void *_start = (void *)__phys_to_virt(_start);
> +               void *end = (void *)__phys_to_virt(_end);
>
>                 if (start >= end)
>                         break;
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 1df25f26571d..327264fb83fb 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -461,8 +461,9 @@ static void __init map_mem(pgd_t *pgdp)
>  {
>         phys_addr_t kernel_start = __pa_symbol(_text);
>         phys_addr_t kernel_end = __pa_symbol(__init_begin);
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
>         int flags = 0;
> +       u64 i;
>
>         if (rodata_full || debug_pagealloc_enabled())
>                 flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> @@ -481,15 +482,9 @@ static void __init map_mem(pgd_t *pgdp)
>  #endif
>
>         /* map all the memory banks */
> -       for_each_memblock(memory, reg) {
> -               phys_addr_t start = reg->base;
> -               phys_addr_t end = start + reg->size;
> -
> +       for_each_mem_range(i, &start, &end) {
>                 if (start >= end)
>                         break;
> -               if (memblock_is_nomap(reg))
> -                       continue;
> -
>                 __map_memblock(pgdp, start, end, PAGE_KERNEL, flags);
>         }
>
> diff --git a/arch/c6x/kernel/setup.c b/arch/c6x/kernel/setup.c
> index 8ef35131f999..9254c3b794a5 100644
> --- a/arch/c6x/kernel/setup.c
> +++ b/arch/c6x/kernel/setup.c
> @@ -287,7 +287,8 @@ notrace void __init machine_init(unsigned long dt_ptr)
>
>  void __init setup_arch(char **cmdline_p)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
> +       u64 i;
>
>         printk(KERN_INFO "Initializing kernel\n");
>
> @@ -351,9 +352,9 @@ void __init setup_arch(char **cmdline_p)
>         disable_caching(ram_start, ram_end - 1);
>
>         /* Set caching of external RAM used by Linux */
> -       for_each_memblock(memory, reg)
> -               enable_caching(CACHE_REGION_START(reg->base),
> -                              CACHE_REGION_START(reg->base + reg->size -
> 1));
> +       for_each_mem_range(i, &start, &end)
> +               enable_caching(CACHE_REGION_START(start),
> +                              CACHE_REGION_START(end - 1));
>
>  #ifdef CONFIG_BLK_DEV_INITRD
>         /*
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index 49e0c241f9b1..15403b5adfcf 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -106,13 +106,14 @@ static void __init paging_init(void)
>  void __init setup_memory(void)
>  {
>  #ifndef CONFIG_MMU
> -       struct memblock_region *reg;
>         u32 kernel_align_start, kernel_align_size;
> +       phys_addr_t start, end;
> +       u64 i;
>
>         /* Find main memory where is the kernel */
> -       for_each_memblock(memory, reg) {
> -               memory_start = (u32)reg->base;
> -               lowmem_size = reg->size;
> +       for_each_mem_range(i, &start, &end) {
> +               memory_start = start;
> +               lowmem_size = end - start;
>                 if ((memory_start <= (u32)_text) &&
>                         ((u32)_text <= (memory_start + lowmem_size - 1))) {
>                         memory_size = lowmem_size;
> diff --git a/arch/mips/cavium-octeon/dma-octeon.c
> b/arch/mips/cavium-octeon/dma-octeon.c
> index 14ea680d180e..d938c1f7c1e1 100644
> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -190,25 +190,25 @@ char *octeon_swiotlb;
>
>  void __init plat_swiotlb_setup(void)
>  {
> -       struct memblock_region *mem;
> +       phys_addr_t start, end;
>         phys_addr_t max_addr;
>         phys_addr_t addr_size;
>         size_t swiotlbsize;
>         unsigned long swiotlb_nslabs;
> +       u64 i;
>
>         max_addr = 0;
>         addr_size = 0;
>
> -       for_each_memblock(memory, mem) {
> +       for_each_mem_range(i, &start, &end) {
>                 /* These addresses map low for PCI. */
>                 if (mem->base > 0x410000000ull && !OCTEON_IS_OCTEON2())
>                         continue;
>
> -               addr_size += mem->size;
> -
> -               if (max_addr < mem->base + mem->size)
> -                       max_addr = mem->base + mem->size;
> +               addr_size += (end - start);
>
> +               if (max_addr < end)
> +                       max_addr = end;
>         }
>
>         swiotlbsize = PAGE_SIZE;
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 7b537fa2035d..eaac1b66026d 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -300,8 +300,9 @@ static void __init bootmem_init(void)
>
>  static void __init bootmem_init(void)
>  {
> -       struct memblock_region *mem;
>         phys_addr_t ramstart, ramend;
> +       phys_addr_t start, end;
> +       u64 i;
>
>         ramstart = memblock_start_of_DRAM();
>         ramend = memblock_end_of_DRAM();
> @@ -338,18 +339,13 @@ static void __init bootmem_init(void)
>
>         min_low_pfn = ARCH_PFN_OFFSET;
>         max_pfn = PFN_DOWN(ramend);
> -       for_each_memblock(memory, mem) {
> -               unsigned long start = memblock_region_memory_base_pfn(mem);
> -               unsigned long end = memblock_region_memory_end_pfn(mem);
> -
> +       for_each_mem_range(i, &start, &end) {
>                 /*
>                  * Skip highmem here so we get an accurate max_low_pfn if
> low
>                  * memory stops short of high memory.
>                  * If the region overlaps HIGHMEM_START, end is clipped so
>                  * max_pfn excludes the highmem portion.
>                  */
> -               if (memblock_is_nomap(mem))
> -                       continue;
>                 if (start >= PFN_DOWN(HIGHMEM_START))
>                         continue;
>                 if (end > PFN_DOWN(HIGHMEM_START))
> @@ -458,13 +454,12 @@ early_param("memmap", early_parse_memmap);
>  unsigned long setup_elfcorehdr, setup_elfcorehdr_size;
>  static int __init early_parse_elfcorehdr(char *p)
>  {
> -       struct memblock_region *mem;
> +       phys_addr_t start, end;
> +       u64 i;
>
>         setup_elfcorehdr = memparse(p, &p);
>
> -        for_each_memblock(memory, mem) {
> -               unsigned long start = mem->base;
> -               unsigned long end = start + mem->size;
> +       for_each_mem_range(i, &start, &end) {
>                 if (setup_elfcorehdr >= start && setup_elfcorehdr < end) {
>                         /*
>                          * Reserve from the elf core header to the end of
> @@ -728,7 +723,8 @@ static void __init arch_mem_init(char **cmdline_p)
>
>  static void __init resource_init(void)
>  {
> -       struct memblock_region *region;
> +       phys_addr_t start, end;
> +       u64 i;
>
>         if (UNCAC_BASE != IO_BASE)
>                 return;
> @@ -740,9 +736,7 @@ static void __init resource_init(void)
>         bss_resource.start = __pa_symbol(&__bss_start);
>         bss_resource.end = __pa_symbol(&__bss_stop) - 1;
>
> -       for_each_memblock(memory, region) {
> -               phys_addr_t start =
> PFN_PHYS(memblock_region_memory_base_pfn(region));
> -               phys_addr_t end =
> PFN_PHYS(memblock_region_memory_end_pfn(region)) - 1;
> +       for_each_mem_range(i, &start, &end) {
>                 struct resource *res;
>
>                 res = memblock_alloc(sizeof(struct resource),
> SMP_CACHE_BYTES);
> @@ -751,7 +745,12 @@ static void __init resource_init(void)
>                               sizeof(struct resource));
>
>                 res->start = start;
> -               res->end = end;
> +               /*
> +                * In memblock, end points to the first byte after the
> +                * range while in resourses, end points to the last byte in
> +                * the range.
> +                */
> +               res->end = end - 1;
>                 res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
>                 res->name = "System RAM";
>
> diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
> index 3d7c79c7745d..8348feaaf46e 100644
> --- a/arch/openrisc/mm/init.c
> +++ b/arch/openrisc/mm/init.c
> @@ -64,6 +64,7 @@ extern const char _s_kernel_ro[], _e_kernel_ro[];
>   */
>  static void __init map_ram(void)
>  {
> +       phys_addr_t start, end;
>         unsigned long v, p, e;
>         pgprot_t prot;
>         pgd_t *pge;
> @@ -71,6 +72,7 @@ static void __init map_ram(void)
>         pud_t *pue;
>         pmd_t *pme;
>         pte_t *pte;
> +       u64 i;
>         /* These mark extents of read-only kernel pages...
>          * ...from vmlinux.lds.S
>          */
> @@ -78,9 +80,9 @@ static void __init map_ram(void)
>
>         v = PAGE_OFFSET;
>
> -       for_each_memblock(memory, region) {
> -               p = (u32) region->base & PAGE_MASK;
> -               e = p + (u32) region->size;
> +       for_each_mem_range(i, &start, &end) {
> +               p = (u32) start & PAGE_MASK;
> +               e = (u32) end;
>
>                 v = (u32) __va(p);
>                 pge = pgd_offset_k(v);
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index fdbafe417139..435b98d069eb 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -180,13 +180,13 @@ int is_fadump_active(void)
>   */
>  static bool is_fadump_mem_area_contiguous(u64 d_start, u64 d_end)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t reg_start, reg_end;
>         bool ret = false;
> -       u64 start, end;
> +       u64 i, start, end;
>
> -       for_each_memblock(memory, reg) {
> -               start = max_t(u64, d_start, reg->base);
> -               end = min_t(u64, d_end, (reg->base + reg->size));
> +       for_each_mem_range(i, &reg_start, &reg_end) {
> +               start = max_t(u64, d_start, reg_start);
> +               end = min_t(u64, d_end, reg_end));
>                 if (d_start < end) {
>                         /* Memory hole from d_start to start */
>                         if (start > d_start)
> @@ -413,7 +413,7 @@ static int __init fadump_get_boot_mem_regions(void)
>  {
>         unsigned long base, size, cur_size, hole_size, last_end;
>         unsigned long mem_size = fw_dump.boot_memory_size;
> -       struct memblock_region *reg;
> +       phys_addr_t reg_start, reg_end;
>         int ret = 1;
>
>         fw_dump.boot_mem_regs_cnt = 0;
> @@ -421,9 +421,8 @@ static int __init fadump_get_boot_mem_regions(void)
>         last_end = 0;
>         hole_size = 0;
>         cur_size = 0;
> -       for_each_memblock(memory, reg) {
> -               base = reg->base;
> -               size = reg->size;
> +       for_each_mem_range(i, &reg_start, &reg_end) {
> +               size = reg_end - reg_start;
>                 hole_size += (base - last_end);
>
>                 if ((cur_size + size) >= mem_size) {
> @@ -959,9 +958,8 @@ static int fadump_init_elfcore_header(char *bufp)
>   */
>  static int fadump_setup_crash_memory_ranges(void)
>  {
> -       struct memblock_region *reg;
> -       u64 start, end;
> -       int i, ret;
> +       u64 i, start, end;
> +       int ret;
>
>         pr_debug("Setup crash memory ranges.\n");
>         crash_mrange_info.mem_range_cnt = 0;
> @@ -979,10 +977,7 @@ static int fadump_setup_crash_memory_ranges(void)
>                         return ret;
>         }
>
> -       for_each_memblock(memory, reg) {
> -               start = (u64)reg->base;
> -               end = start + (u64)reg->size;
> -
> +       for_each_mem_range(i, &start, end) {
>

I don't know anything about this code, but from pure pattern matching it
looks like you missed a & here.

                /*
>                  * skip the memory chunk that is already added
>                  * (0 through boot_memory_top).
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c
> b/arch/powerpc/mm/book3s64/hash_utils.c
> index 468169e33c86..9ba76b075b11 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -7,7 +7,7 @@
>   *
>   * SMP scalability work:
>   *    Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
> - *
> + *
>   *    Module name: htab.c
>   *
>   *    Description:
> @@ -862,8 +862,8 @@ static void __init htab_initialize(void)
>         unsigned long table;
>         unsigned long pteg_count;
>         unsigned long prot;
> -       unsigned long base = 0, size = 0;
> -       struct memblock_region *reg;
> +       phys_addr_t base = 0, size = 0, end;
> +       u64 i;
>
>         DBG(" -> htab_initialize()\n");
>
> @@ -879,7 +879,7 @@ static void __init htab_initialize(void)
>         /*
>          * Calculate the required size of the htab.  We want the number of
>          * PTEGs to equal one half the number of real pages.
> -        */
> +        */
>         htab_size_bytes = htab_get_table_size();
>         pteg_count = htab_size_bytes >> 7;
>
> @@ -889,7 +889,7 @@ static void __init htab_initialize(void)
>             firmware_has_feature(FW_FEATURE_PS3_LV1)) {
>                 /* Using a hypervisor which owns the htab */
>                 htab_address = NULL;
> -               _SDR1 = 0;
> +               _SDR1 = 0;
>  #ifdef CONFIG_FA_DUMP
>                 /*
>                  * If firmware assisted dump is active firmware preserves
> @@ -955,9 +955,9 @@ static void __init htab_initialize(void)
>  #endif /* CONFIG_DEBUG_PAGEALLOC */
>
>         /* create bolted the linear mapping in the hash table */
> -       for_each_memblock(memory, reg) {
> -               base = (unsigned long)__va(reg->base);
> -               size = reg->size;
> +       for_each_mem_range(i, &base, &end) {
> +               size = end - base;
> +               base = (unsigned long)__va(base);
>
>                 DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
>                     base, size, prot);
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c
> b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index bb00e0cba119..65657b920847 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -318,28 +318,27 @@ static int __meminit
> create_physical_mapping(unsigned long start,
>  static void __init radix_init_pgtable(void)
>  {
>         unsigned long rts_field;
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
> +       u64 i;
>
>         /* We don't support slb for radix */
>         mmu_slb_size = 0;
>         /*
>          * Create the linear mapping, using standard page size for now
>          */
> -       for_each_memblock(memory, reg) {
> +       for_each_mem_range(i, &start, &end) {
>                 /*
>                  * The memblock allocator  is up at this point, so the
>                  * page tables will be allocated within the range. No
>                  * need or a node (which we don't have yet).
>                  */
>
> -               if ((reg->base + reg->size) >= RADIX_VMALLOC_START) {
> +               if (end >= RADIX_VMALLOC_START) {
>                         pr_warn("Outside the supported range\n");
>                         continue;
>                 }
>
> -               WARN_ON(create_physical_mapping(reg->base,
> -                                               reg->base + reg->size,
> -                                               -1, PAGE_KERNEL));
> +               WARN_ON(create_physical_mapping(start, end, -1,
> PAGE_KERNEL));
>         }
>
>         /* Find out how many PID bits are supported */
> diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c
> b/arch/powerpc/mm/kasan/kasan_init_32.c
> index 0760e1e754e4..6e73434e4e41 100644
> --- a/arch/powerpc/mm/kasan/kasan_init_32.c
> +++ b/arch/powerpc/mm/kasan/kasan_init_32.c
> @@ -120,11 +120,11 @@ static void __init
> kasan_unmap_early_shadow_vmalloc(void)
>  static void __init kasan_mmu_init(void)
>  {
>         int ret;
> -       struct memblock_region *reg;
> +       phys_addr_t base, end;
> +       u64 i;
>
> -       for_each_memblock(memory, reg) {
> -               phys_addr_t base = reg->base;
> -               phys_addr_t top = min(base + reg->size, total_lowmem);
> +       for_each_mem_range(i, &base, &end) {
> +               phys_addr_t top = min(end, total_lowmem);
>
>                 if (base >= top)
>                         continue;
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 38d1acd7c8ef..0248b6d58fcd 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -593,20 +593,24 @@ void flush_icache_user_page(struct vm_area_struct
> *vma, struct page *page,
>   */
>  static int __init add_system_ram_resources(void)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
> +       u64 i;
>
> -       for_each_memblock(memory, reg) {
> +       for_each_mem_range(i, &start, &end) {
>                 struct resource *res;
> -               unsigned long base = reg->base;
> -               unsigned long size = reg->size;
>
>                 res = kzalloc(sizeof(struct resource), GFP_KERNEL);
>                 WARN_ON(!res);
>
>                 if (res) {
>                         res->name = "System RAM";
> -                       res->start = base;
> -                       res->end = base + size - 1;
> +                       res->start = start;
> +                       /*
> +                        * In memblock, end points to the first byte after
> +                        * the range while in resourses, end points to the
> +                        * last byte in the range.
> +                        */
> +                       res->end = end - 1;
>                         res->flags = IORESOURCE_SYSTEM_RAM |
> IORESOURCE_BUSY;
>                         WARN_ON(request_resource(&iomem_resource, res) <
> 0);
>                 }
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index 6eb4eab79385..079159e97bca 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -123,11 +123,11 @@ static void __init __mapin_ram_chunk(unsigned long
> offset, unsigned long top)
>
>  void __init mapin_ram(void)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t base, end;
> +       u64 i;
>
> -       for_each_memblock(memory, reg) {
> -               phys_addr_t base = reg->base;
> -               phys_addr_t top = min(base + reg->size, total_lowmem);
> +       for_each_mem_range(i, &base, &end) {
> +               phys_addr_t top = min(end, total_lowmem);
>
>                 if (base >= top)
>                         continue;
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 7440ba2cdaaa..2abe1165fe56 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -145,21 +145,22 @@ static phys_addr_t dtb_early_pa __initdata;
>
>  void __init setup_bootmem(void)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
>         phys_addr_t mem_size = 0;
>         phys_addr_t total_mem = 0;
>         phys_addr_t mem_start, end = 0;
>         phys_addr_t vmlinux_end = __pa_symbol(&_end);
>         phys_addr_t vmlinux_start = __pa_symbol(&_start);
> +       u64 i;
>
>         /* Find the memory region containing the kernel */
> -       for_each_memblock(memory, reg) {
> -               end = reg->base + reg->size;
> +       for_each_mem_range(i, &start, &end) {
> +               phys_addr_t size = end - start;
>                 if (!total_mem)
> -                       mem_start = reg->base;
> -               if (reg->base <= vmlinux_start && vmlinux_end <= end)
> -                       BUG_ON(reg->size == 0);
> -               total_mem = total_mem + reg->size;
> +                       mem_start = start;
> +               if (start <= vmlinux_start && vmlinux_end <= end)
> +                       BUG_ON(size == 0);
> +               total_mem = total_mem + size;
>         }
>
>         /*
> @@ -456,7 +457,7 @@ static void __init setup_vm_final(void)
>  {
>         uintptr_t va, map_size;
>         phys_addr_t pa, start, end;
> -       struct memblock_region *reg;
> +       u64 i;
>
>         /* Set mmu_enabled flag */
>         mmu_enabled = true;
> @@ -467,14 +468,9 @@ static void __init setup_vm_final(void)
>                            PGDIR_SIZE, PAGE_TABLE);
>
>         /* Map all memory banks */
> -       for_each_memblock(memory, reg) {
> -               start = reg->base;
> -               end = start + reg->size;
> -
> +       for_each_mem_range(i, &start, &end) {
>                 if (start >= end)
>                         break;
> -               if (memblock_is_nomap(reg))
> -                       continue;
>                 if (start <= __pa(PAGE_OFFSET) &&
>                     __pa(PAGE_OFFSET) < end)
>                         start = __pa(PAGE_OFFSET);
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 87b4ab3d3c77..12ddd1f6bf70 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -85,16 +85,16 @@ static void __init populate(void *start, void *end)
>
>  void __init kasan_init(void)
>  {
> -       struct memblock_region *reg;
> -       unsigned long i;
> +       phys_addr_t _start, _end;
> +       u64 i;
>
>         kasan_populate_early_shadow((void *)KASAN_SHADOW_START,
>                                     (void *)kasan_mem_to_shadow((void *)
>
> VMALLOC_END));
>
> -       for_each_memblock(memory, reg) {
> -               void *start = (void *)__va(reg->base);
> -               void *end = (void *)__va(reg->base + reg->size);
> +       for_each_mem_range(i, &_start, &_end) {
> +               void *start = (void *)_start;
> +               void *end = (void *)_end;
>
>                 if (start >= end)
>                         break;
> diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
> index 8b284cf6e199..b6c4a0c5ff86 100644
> --- a/arch/s390/kernel/setup.c
> +++ b/arch/s390/kernel/setup.c
> @@ -198,7 +198,7 @@ static void __init conmode_default(void)
>                 cpcmd("QUERY TERM", query_buffer, 1024, NULL);
>                 ptr = strstr(query_buffer, "CONMODE");
>                 /*
> -                * Set the conmode to 3215 so that the device recognition
> +                * Set the conmode to 3215 so that the device recognition
>                  * will set the cu_type of the console to 3215. If the
>                  * conmode is 3270 and we don't set it back then both
>                  * 3215 and the 3270 driver will try to access the console
> @@ -258,7 +258,7 @@ static inline void setup_zfcpdump(void) {}
>
>   /*
>   * Reboot, halt and power_off stubs. They just call _machine_restart,
> - * _machine_halt or _machine_power_off.
> + * _machine_halt or _machine_power_off.
>   */
>
>  void machine_restart(char *command)
> @@ -484,8 +484,9 @@ static struct resource __initdata
> *standard_resources[] = {
>  static void __init setup_resources(void)
>  {
>         struct resource *res, *std_res, *sub_res;
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
>         int j;
> +       u64 i;
>
>         code_resource.start = (unsigned long) _text;
>         code_resource.end = (unsigned long) _etext - 1;
> @@ -494,7 +495,7 @@ static void __init setup_resources(void)
>         bss_resource.start = (unsigned long) __bss_start;
>         bss_resource.end = (unsigned long) __bss_stop - 1;
>
> -       for_each_memblock(memory, reg) {
> +       for_each_mem_range(i, &start, &end) {
>                 res = memblock_alloc(sizeof(*res), 8);
>                 if (!res)
>                         panic("%s: Failed to allocate %zu bytes
> align=0x%x\n",
> @@ -502,8 +503,13 @@ static void __init setup_resources(void)
>                 res->flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM;
>
>                 res->name = "System RAM";
> -               res->start = reg->base;
> -               res->end = reg->base + reg->size - 1;
> +               res->start = start;
> +               /*
> +                * In memblock, end points to the first byte after the
> +                * range while in resourses, end points to the last byte in
> +                * the range.
> +                */
> +               res->end = end - 1;
>                 request_resource(&iomem_resource, res);
>
>                 for (j = 0; j < ARRAY_SIZE(standard_resources); j++) {
> @@ -819,14 +825,15 @@ static void __init reserve_kernel(void)
>
>  static void __init setup_memory(void)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
> +       u64 i;
>
>         /*
>          * Init storage key for present memory
>          */
> -       for_each_memblock(memory, reg) {
> -               storage_key_init_range(reg->base, reg->base + reg->size);
> -       }
> +       for_each_mem_range(i, &start, &end)
> +               storage_key_init_range(start, end);
> +
>         psw_set_key(PAGE_DEFAULT_KEY);
>
>         /* Only cosmetics */
> diff --git a/arch/s390/mm/vmem.c b/arch/s390/mm/vmem.c
> index 8b6282cf7d13..30076ecc3eb7 100644
> --- a/arch/s390/mm/vmem.c
> +++ b/arch/s390/mm/vmem.c
> @@ -399,10 +399,11 @@ int vmem_add_mapping(unsigned long start, unsigned
> long size)
>   */
>  void __init vmem_map_init(void)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
> +       u64 i;
>
> -       for_each_memblock(memory, reg)
> -               vmem_add_mem(reg->base, reg->size);
> +       for_each_mem_range(i, &start, &end)
> +               vmem_add_mem(start, end - start);
>         __set_memory((unsigned long)_stext,
>                      (unsigned long)(_etext - _stext) >> PAGE_SHIFT,
>                      SET_MEMORY_RO | SET_MEMORY_X);
> @@ -428,16 +429,17 @@ void __init vmem_map_init(void)
>   */
>  static int __init vmem_convert_memory_chunk(void)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
>         struct memory_segment *seg;
> +       u64 i;
>
>         mutex_lock(&vmem_mutex);
> -       for_each_memblock(memory, reg) {
> +       for_each_mem_range(i, &start, &end) {
>                 seg = kzalloc(sizeof(*seg), GFP_KERNEL);
>                 if (!seg)
>                         panic("Out of memory...\n");
> -               seg->start = reg->base;
> -               seg->size = reg->size;
> +               seg->start = start;
> +               seg->size = end - start;
>                 insert_memory_segment(seg);
>         }
>         mutex_unlock(&vmem_mutex);
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 02e6e5e0f106..de63c002638e 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -1192,18 +1192,14 @@ int of_node_to_nid(struct device_node *dp)
>
>  static void __init add_node_ranges(void)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
>         unsigned long prev_max;
> +       u64 i;
>
>  memblock_resized:
>         prev_max = memblock.memory.max;
>
> -       for_each_memblock(memory, reg) {
> -               unsigned long size = reg->size;
> -               unsigned long start, end;
> -
> -               start = reg->base;
> -               end = start + size;
> +       for_each_mem_range(i, &start, &end) {
>                 while (start < end) {
>                         unsigned long this_end;
>                         int nid;
> @@ -1211,7 +1207,7 @@ static void __init add_node_ranges(void)
>                         this_end = memblock_nid_range(start, end, &nid);
>
>                         numadbg("Setting memblock NUMA node nid[%d] "
> -                               "start[%lx] end[%lx]\n",
> +                               "start[%llx] end[%lx]\n",
>                                 nid, start, this_end);
>
>                         memblock_set_node(start, this_end - start,
> diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
> index 5b2a11a88951..2519ceede64b 100644
> --- a/drivers/bus/mvebu-mbus.c
> +++ b/drivers/bus/mvebu-mbus.c
> @@ -610,23 +610,23 @@ static unsigned int
> armada_xp_mbus_win_remap_offset(int win)
>  static void __init
>  mvebu_mbus_find_bridge_hole(uint64_t *start, uint64_t *end)
>  {
> -       struct memblock_region *r;
> -       uint64_t s = 0;
> +       phys_addr_t reg_start, reg_end;
> +       uint64_t i, s = 0;
>
> -       for_each_memblock(memory, r) {
> +       for_each_mem_range(i, &reg_start, &reg_end) {
>                 /*
>                  * This part of the memory is above 4 GB, so we don't
>                  * care for the MBus bridge hole.
>                  */
> -               if (r->base >= 0x100000000ULL)
> +               if (reg_start >= 0x100000000ULL)
>                         continue;
>
>                 /*
>                  * The MBus bridge hole is at the end of the RAM under
>                  * the 4 GB limit.
>                  */
> -               if (r->base + r->size > s)
> -                       s = r->base + r->size;
> +               if (reg_end > s)
> +                       s = reg_end;
>         }
>
>         *start = s;
> diff --git a/drivers/s390/char/zcore.c b/drivers/s390/char/zcore.c
> index 08f812475f5e..484b1ec9a1bc 100644
> --- a/drivers/s390/char/zcore.c
> +++ b/drivers/s390/char/zcore.c
> @@ -148,18 +148,19 @@ static ssize_t zcore_memmap_read(struct file *filp,
> char __user *buf,
>
>  static int zcore_memmap_open(struct inode *inode, struct file *filp)
>  {
> -       struct memblock_region *reg;
> +       phys_addr_t start, end;
>         char *buf;
>         int i = 0;
> +       u64 r;
>
>         buf = kcalloc(memblock.memory.cnt, CHUNK_INFO_SIZE, GFP_KERNEL);
>         if (!buf) {
>                 return -ENOMEM;
>         }
> -       for_each_memblock(memory, reg) {
> +       for_each_mem_range(r, &start, &end) {
>                 sprintf(buf + (i++ * CHUNK_INFO_SIZE), "%016llx %016llx ",
> -                       (unsigned long long) reg->base,
> -                       (unsigned long long) reg->size);
> +                       (unsigned long long) start,
> +                       (unsigned long long) (end - start));
>         }
>         filp->private_data = buf;
>         return nonseekable_open(inode, filp);
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

--000000000000c4e10105ab81bcf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJs
dHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIDI4IEp1bCAyMDIwLCAwNzoxNiBNaWtlIFJh
cG9wb3J0LCAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJwcHRAa2VybmVsLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiIHJlbD0ibm9yZWZlcnJlciI+cnBwdEBrZXJuZWwub3JnPC9hPiZndDsgd3JvdGU6PGJyPjwv
ZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAu
OGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkZyb206IE1p
a2UgUmFwb3BvcnQgJmx0OzxhIGhyZWY9Im1haWx0bzpycHB0QGxpbnV4LmlibS5jb20iIHJlbD0i
bm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cnBwdEBsaW51eC5pYm0uY29t
PC9hPiZndDs8YnI+DQo8YnI+DQpUaGVyZSBhcmUgc2V2ZXJhbCBvY2N1cnJlbmNlcyBvZiB0aGUg
Zm9sbG93aW5nIHBhdHRlcm46PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgZm9yX2VhY2hfbWVtYmxv
Y2sobWVtb3J5LCByZWcpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdGFydCA9IF9f
cGZuX3RvX3BoeXMobWVtYmxvY2tfcmVnaW9uX21lbW9yeV9iYXNlX3BmbihyZWcpOzxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVuZCA9IF9fcGZuX3RvX3BoeXMobWVtYmxvY2tfcmVnaW9u
X21lbW9yeV9lbmRfcGZuKHJlZykpOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC8qIGRvIHNvbWV0aGluZyB3aXRoIHN0YXJ0IGFuZCBlbmQgKi88YnI+DQrCoCDCoCDCoCDCoCB9
PGJyPg0KPGJyPg0KVXNpbmcgZm9yX2VhY2hfbWVtX3JhbmdlKCkgaXRlcmF0b3IgaXMgbW9yZSBh
cHByb3ByaWF0ZSBpbiBzdWNoIGNhc2VzIGFuZDxicj4NCmFsbG93cyBzaW1wbGVyIGFuZCBjbGVh
bmVyIGNvZGUuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnJwcHRAbGludXguaWJtLmNvbSIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5ycHB0QGxpbnV4LmlibS5jb208L2E+Jmd0Ozxicj4NCi0tLTxi
cj4NCsKgYXJjaC9hcm0va2VybmVsL3NldHVwLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8
IDE4ICsrKysrKystLS0tPGJyPg0KwqBhcmNoL2FybS9tbS9tbXUuY8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHwgMzkgKysrKysrKystLS0tLS0tLS0tLS0tLS0tPGJyPg0KwqBh
cmNoL2FybS9tbS9wbXNhLXY3LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDIwICsr
KysrKy0tLS0tLTxicj4NCsKgYXJjaC9hcm0vbW0vcG1zYS12OC5jwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfCAxNyArKysrKy0tLS0tLTxicj4NCsKgYXJjaC9hcm0veGVuL21tLmPCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgNyArKystLTxicj4NCsKgYXJjaC9h
cm02NC9tbS9rYXNhbl9pbml0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA4ICsrLS0tPGJy
Pg0KwqBhcmNoL2FybTY0L21tL21tdS5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fCAxMSArKy0tLS0tPGJyPg0KwqBhcmNoL2M2eC9rZXJuZWwvc2V0dXAuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHzCoCA5ICsrKy0tLTxicj4NCsKgYXJjaC9taWNyb2JsYXplL21tL2luaXQu
Y8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCA5ICsrKy0tLTxicj4NCsKgYXJjaC9taXBzL2Nh
dml1bS1vY3Rlb24vZG1hLW9jdGVvbi5jwqAgwqAgwqB8IDEyICsrKystLS0tPGJyPg0KwqBhcmNo
L21pcHMva2VybmVsL3NldHVwLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMzEgKysrKysr
KysrLS0tLS0tLS0tLTxicj4NCsKgYXJjaC9vcGVucmlzYy9tbS9pbml0LmPCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgOCArKystLTxicj4NCsKgYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1
bXAuY8KgIMKgIMKgIMKgIMKgIMKgIMKgfCAyNyArKysrKysrLS0tLS0tLS0tPGJyPg0KwqBhcmNo
L3Bvd2VycGMvbW0vYm9vazNzNjQvaGFzaF91dGlscy5jwqAgwqAgfCAxNiArKysrKy0tLS0tPGJy
Pg0KwqBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jIHwgMTEgKysrLS0t
LTxicj4NCsKgYXJjaC9wb3dlcnBjL21tL2thc2FuL2thc2FuX2luaXRfMzIuY8KgIMKgIHzCoCA4
ICsrLS0tPGJyPg0KwqBhcmNoL3Bvd2VycGMvbW0vbWVtLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8IDE2ICsrKysrKy0tLS08YnI+DQrCoGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlXzMy
LmPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA4ICsrLS0tPGJyPg0KwqBhcmNoL3Jpc2N2L21tL2lu
aXQuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAyNCArKysrKystLS0tLS0tLS08
YnI+DQrCoGFyY2gvcmlzY3YvbW0va2FzYW5faW5pdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
IDEwICsrKy0tLTxicj4NCsKgYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB8IDI3ICsrKysrKysrKystLS0tLS08YnI+DQrCoGFyY2gvczM5MC9tbS92bWVt
LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDE2ICsrKysrLS0tLS08YnI+DQrC
oGFyY2gvc3BhcmMvbW0vaW5pdF82NC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAxMiAr
KystLS0tLTxicj4NCsKgZHJpdmVycy9idXMvbXZlYnUtbWJ1cy5jwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8IDEyICsrKystLS0tPGJyPg0KwqBkcml2ZXJzL3MzOTAvY2hhci96Y29yZS5jwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDkgKysrLS0tPGJyPg0KwqAyNSBmaWxlcyBjaGFuZ2Vk
LCAxODcgaW5zZXJ0aW9ucygrKSwgMTk4IGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvYXJtL2tlcm5lbC9zZXR1cC5jPGJy
Pg0KaW5kZXggZDhlMThjZGQ5NmQzLi4zZjY1ZDBhYzlmNjMgMTAwNjQ0PGJyPg0KLS0tIGEvYXJj
aC9hcm0va2VybmVsL3NldHVwLmM8YnI+DQorKysgYi9hcmNoL2FybS9rZXJuZWwvc2V0dXAuYzxi
cj4NCkBAIC04NDMsMTkgKzg0MywyNSBAQCBlYXJseV9wYXJhbSgmcXVvdDttZW0mcXVvdDssIGVh
cmx5X21lbSk7PGJyPg0KPGJyPg0KwqBzdGF0aWMgdm9pZCBfX2luaXQgcmVxdWVzdF9zdGFuZGFy
ZF9yZXNvdXJjZXMoY29uc3Qgc3RydWN0IG1hY2hpbmVfZGVzYyAqbWRlc2MpPGJyPg0KwqB7PGJy
Pg0KLcKgIMKgIMKgIMKgc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnaW9uOzxicj4NCivCoCDC
oCDCoCDCoHBoeXNfYWRkcl90IHN0YXJ0LCBlbmQsIHJlc19lbmQ7PGJyPg0KwqAgwqAgwqAgwqAg
c3RydWN0IHJlc291cmNlICpyZXM7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0K
wqAgwqAgwqAgwqAga2VybmVsX2NvZGUuc3RhcnTCoCDCoD0gdmlydF90b19waHlzKF90ZXh0KTs8
YnI+DQrCoCDCoCDCoCDCoCBrZXJuZWxfY29kZS5lbmTCoCDCoCDCoD0gdmlydF90b19waHlzKF9f
aW5pdF9iZWdpbiAtIDEpOzxicj4NCsKgIMKgIMKgIMKgIGtlcm5lbF9kYXRhLnN0YXJ0wqAgwqA9
IHZpcnRfdG9fcGh5cyhfc2RhdGEpOzxicj4NCsKgIMKgIMKgIMKgIGtlcm5lbF9kYXRhLmVuZMKg
IMKgIMKgPSB2aXJ0X3RvX3BoeXMoX2VuZCAtIDEpOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGZv
cl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnaW9uKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGh5c19hZGRyX3Qgc3RhcnQgPSBfX3Bmbl90b19waHlzKG1lbWJsb2NrX3JlZ2lvbl9t
ZW1vcnlfYmFzZV9wZm4ocmVnaW9uKSk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGh5
c19hZGRyX3QgZW5kID0gX19wZm5fdG9fcGh5cyhtZW1ibG9ja19yZWdpb25fbWVtb3J5X2VuZF9w
Zm4ocmVnaW9uKSkgLSAxOzxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX21lbV9yYW5nZShpLCAm
YW1wO3N0YXJ0LCAmYW1wO2VuZCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVuc2ln
bmVkIGxvbmcgYm9vdF9hbGlhc19zdGFydDs8YnI+DQo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAvKjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIEluIG1lbWJsb2NrLCBlbmQg
cG9pbnRzIHRvIHRoZSBmaXJzdCBieXRlIGFmdGVyIHRoZTxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAqIHJhbmdlIHdoaWxlIGluIHJlc291cnNlcywgZW5kIHBvaW50cyB0byB0aGUgbGFz
dCBieXRlIGluPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogdGhlIHJhbmdlLjxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlc19lbmQgPSBlbmQgLSAxOzxicj4NCis8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAv
Kjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBTb21lIHN5c3RlbXMgaGF2ZSBhIHNw
ZWNpYWwgbWVtb3J5IGFsaWFzIHdoaWNoIGlzIG9ubHk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCogdXNlZCBmb3IgYm9vdGluZy7CoCBXZSBuZWVkIHRvIGFkdmVydGlzZSB0aGlzIHJl
Z2lvbiB0bzxicj4NCkBAIC04NjksNyArODc1LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHJlcXVl
c3Rfc3RhbmRhcmRfcmVzb3VyY2VzKGNvbnN0IHN0cnVjdCBtYWNoaW5lX2Rlc2MgKm1kZXNjKTxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIF9fZnVuY19fLCBzaXplb2YoKnJlcykpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJlcy0mZ3Q7bmFtZSA9ICZxdW90O1N5c3RlbSBSQU0gKGJvb3QgYWxpYXMp
JnF1b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlcy0mZ3Q7
c3RhcnQgPSBib290X2FsaWFzX3N0YXJ0Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlcy0mZ3Q7ZW5kID0gcGh5c190b19pZG1hcChlbmQpOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlcy0mZ3Q7ZW5kID0gcGh5c190b19pZG1hcChy
ZXNfZW5kKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXMtJmd0
O2ZsYWdzID0gSU9SRVNPVVJDRV9NRU0gfCBJT1JFU09VUkNFX0JVU1k7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVxdWVzdF9yZXNvdXJjZSgmYW1wO2lvbWVtX3Jl
c291cmNlLCByZXMpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQpAQCAtODgw
LDcgKzg4Niw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCByZXF1ZXN0X3N0YW5kYXJkX3Jlc291cmNl
cyhjb25zdCBzdHJ1Y3QgbWFjaGluZV9kZXNjICptZGVzYyk8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzaXplb2YoKnJlcykpOzxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJlcy0mZ3Q7bmFtZcKgID0gJnF1b3Q7U3lzdGVtIFJBTSZxdW90Ozs8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXMtJmd0O3N0YXJ0ID0gc3RhcnQ7PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzLSZndDtlbmQgPSBlbmQ7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVzLSZndDtlbmQgPSByZXNfZW5kOzxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHJlcy0mZ3Q7ZmxhZ3MgPSBJT1JFU09VUkNFX1NZU1RFTV9SQU0gfCBJT1JFU09V
UkNFX0JVU1k7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVxdWVzdF9yZXNv
dXJjZSgmYW1wO2lvbWVtX3Jlc291cmNlLCByZXMpOzxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9tbS9tbXUuYyBiL2FyY2gvYXJtL21tL21tdS5jPGJyPg0KaW5kZXggNjI4MDI4YmZiYjkyLi5h
MTQ5ZDljYjRmZGIgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9hcm0vbW0vbW11LmM8YnI+DQorKysg
Yi9hcmNoL2FybS9tbS9tbXUuYzxicj4NCkBAIC0xMTU1LDkgKzExNTUsOCBAQCBwaHlzX2FkZHJf
dCBhcm1fbG93bWVtX2xpbWl0IF9faW5pdGRhdGEgPSAwOzxicj4NCjxicj4NCsKgdm9pZCBfX2lu
aXQgYWRqdXN0X2xvd21lbV9ib3VuZHModm9pZCk8YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBw
aHlzX2FkZHJfdCBtZW1ibG9ja19saW1pdCA9IDA7PGJyPg0KLcKgIMKgIMKgIMKgdTY0IHZtYWxs
b2NfbGltaXQ7PGJyPg0KLcKgIMKgIMKgIMKgc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOzxi
cj4NCivCoCDCoCDCoCDCoHBoeXNfYWRkcl90IGJsb2NrX3N0YXJ0LCBibG9ja19lbmQsIG1lbWJs
b2NrX2xpbWl0ID0gMDs8YnI+DQorwqAgwqAgwqAgwqB1NjQgdm1hbGxvY19saW1pdCwgaTs8YnI+
DQrCoCDCoCDCoCDCoCBwaHlzX2FkZHJfdCBsb3dtZW1fbGltaXQgPSAwOzxicj4NCjxicj4NCsKg
IMKgIMKgIMKgIC8qPGJyPg0KQEAgLTExNzMsMjYgKzExNzIsMTggQEAgdm9pZCBfX2luaXQgYWRq
dXN0X2xvd21lbV9ib3VuZHModm9pZCk8YnI+DQrCoCDCoCDCoCDCoCDCoCogVGhlIGZpcnN0IHVz
YWJsZSByZWdpb24gbXVzdCBiZSBQTUQgYWxpZ25lZC4gTWFyayBpdHMgc3RhcnQ8YnI+DQrCoCDC
oCDCoCDCoCDCoCogYXMgTUVNQkxPQ0tfTk9NQVAgaWYgaXQgaXNuJiMzOTt0PGJyPg0KwqAgwqAg
wqAgwqAgwqAqLzxicj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVn
KSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFtZW1ibG9ja19pc19ub21hcChy
ZWcpKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFJU19B
TElHTkVEKHJlZy0mZ3Q7YmFzZSwgUE1EX1NJWkUpKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGh5c19hZGRyX3QgbGVuOzxicj4NCivCoCDC
oCDCoCDCoGZvcl9lYWNoX21lbV9yYW5nZShpLCAmYW1wO2Jsb2NrX3N0YXJ0LCAmYW1wO2Jsb2Nr
X2VuZCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICghSVNfQUxJR05FRChibG9j
a19zdGFydCwgUE1EX1NJWkUpKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGh5c19hZGRyX3QgbGVuOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxlbiA9IHJvdW5kX3VwKHJlZy0mZ3Q7YmFzZSwgUE1E
X1NJWkUpIC0gcmVnLSZndDtiYXNlOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoG1lbWJsb2NrX21hcmtfbm9tYXAocmVnLSZndDtiYXNlLCBsZW4p
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBsZW4gPSByb3VuZF91cChibG9ja19zdGFydCwgUE1EX1NJWkUp
IC0gYmxvY2tfc3RhcnQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
bWVtYmxvY2tfbWFya19ub21hcChibG9ja19zdGFydCwgbGVuKTs8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KwqAg
wqAgwqAgwqAgfTxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9y
eSwgcmVnKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGh5c19hZGRyX3QgYmxvY2tf
c3RhcnQgPSByZWctJmd0O2Jhc2U7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGh5c19h
ZGRyX3QgYmxvY2tfZW5kID0gcmVnLSZndDtiYXNlICsgcmVnLSZndDtzaXplOzxicj4NCi08YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAobWVtYmxvY2tfaXNfbm9tYXAocmVnKSk8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTs8YnI+DQotPGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJlZy0mZ3Q7YmFzZSAmbHQ7IHZtYWxsb2Nf
bGltaXQpIHs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtibG9j
a19zdGFydCwgJmFtcDtibG9ja19lbmQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
ZiAoYmxvY2tfc3RhcnQgJmx0OyB2bWFsbG9jX2xpbWl0KSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGJsb2NrX2VuZCAmZ3Q7IGxvd21lbV9saW1pdCk8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKjxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBDb21w
YXJlIGFzIHU2NCB0byBlbnN1cmUgdm1hbGxvY19saW1pdCBkb2VzPGJyPg0KQEAgLTE0NDEsMTkg
KzE0MzIsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IGttYXBfaW5pdCh2b2lkKTxicj4NCjxicj4N
CsKgc3RhdGljIHZvaWQgX19pbml0IG1hcF9sb3dtZW0odm9pZCk8YnI+DQrCoHs8YnI+DQotwqAg
wqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7PGJyPg0KwqAgwqAgwqAgwqAgcGh5
c19hZGRyX3Qga2VybmVsX3hfc3RhcnQgPSByb3VuZF9kb3duKF9fcGEoS0VSTkVMX1NUQVJUKSwg
U0VDVElPTl9TSVpFKTs8YnI+DQrCoCDCoCDCoCDCoCBwaHlzX2FkZHJfdCBrZXJuZWxfeF9lbmQg
PSByb3VuZF91cChfX3BhKF9faW5pdF9lbmQpLCBTRUNUSU9OX1NJWkUpOzxicj4NCivCoCDCoCDC
oCDCoHBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0K
PGJyPg0KwqAgwqAgwqAgwqAgLyogTWFwIGFsbCB0aGUgbG93bWVtIG1lbW9yeSBiYW5rcy4gKi88
YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgezxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBoeXNfYWRkcl90IHN0YXJ0ID0gcmVnLSZndDtiYXNlOzxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBoeXNfYWRkcl90IGVuZCA9IHN0YXJ0ICsgcmVn
LSZndDtzaXplOzxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX21lbV9yYW5nZShpLCAmYW1wO3N0
YXJ0LCAmYW1wO2VuZCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBtYXBf
ZGVzYyBtYXA7PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKG1lbWJsb2Nr
X2lzX25vbWFwKHJlZykpPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29udGludWU7PGJyPg0KLTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChlbmQgJmd0
OyBhcm1fbG93bWVtX2xpbWl0KTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGVuZCA9IGFybV9sb3dtZW1fbGltaXQ7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
aWYgKHN0YXJ0ICZndDs9IGVuZCk8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vcG1zYS12
Ny5jIGIvYXJjaC9hcm0vbW0vcG1zYS12Ny5jPGJyPg0KaW5kZXggNjk5ZmEyZTg4NzI1Li40NGI3
NjQ0YTQyMzcgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9hcm0vbW0vcG1zYS12Ny5jPGJyPg0KKysr
IGIvYXJjaC9hcm0vbW0vcG1zYS12Ny5jPGJyPg0KQEAgLTIzMSwxMCArMjMxLDkgQEAgc3RhdGlj
IGludCBfX2luaXQgYWxsb2NhdGVfcmVnaW9uKHBoeXNfYWRkcl90IGJhc2UsIHBoeXNfYWRkcl90
IHNpemUsPGJyPg0KwqB2b2lkIF9faW5pdCBwbXNhdjdfYWRqdXN0X2xvd21lbV9ib3VuZHModm9p
ZCk8YnI+DQrCoHs8YnI+DQrCoCDCoCDCoCDCoCBwaHlzX2FkZHJfdMKgIHNwZWNpZmllZF9tZW1f
c2l6ZSA9IDAsIHRvdGFsX21lbV9zaXplID0gMDs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVt
YmxvY2tfcmVnaW9uICpyZWc7PGJyPg0KLcKgIMKgIMKgIMKgYm9vbCBmaXJzdCA9IHRydWU7PGJy
Pg0KwqAgwqAgwqAgwqAgcGh5c19hZGRyX3QgbWVtX3N0YXJ0Ozxicj4NCsKgIMKgIMKgIMKgIHBo
eXNfYWRkcl90IG1lbV9lbmQ7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3QgcmVnX3N0YXJ0
LCByZWdfZW5kOzxicj4NCsKgIMKgIMKgIMKgIHVuc2lnbmVkIGludCBtZW1fbWF4X3JlZ2lvbnM7
PGJyPg0KwqAgwqAgwqAgwqAgaW50IG51bSwgaTs8YnI+DQo8YnI+DQpAQCAtMjYyLDIwICsyNjEs
MTkgQEAgdm9pZCBfX2luaXQgcG1zYXY3X2FkanVzdF9sb3dtZW1fYm91bmRzKHZvaWQpPGJyPg0K
wqAgwqAgwqAgwqAgbWVtX21heF9yZWdpb25zIC09IG51bTs8YnI+DQrCoCNlbmRpZjxicj4NCjxi
cj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGZpcnN0KSB7PGJyPg0KK8KgIMKgIMKgIMKgZm9yX2Vh
Y2hfbWVtX3JhbmdlKGksICZhbXA7cmVnX3N0YXJ0LCAmYW1wO3JlZ19lbmQpIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoaSA9PSAwKSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcGh5c19hZGRyX3QgcGh5c19vZmZzZXQgPSBQSFlTX09GRlNFVDs8
YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKjxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBJbml0aWFsbHkgb25seSB1c2Ug
bWVtb3J5IGNvbnRpbnVvdXMgZnJvbTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgKiBQSFlTX09GRlNFVCAqLzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGlmIChyZWctJmd0O2Jhc2UgIT0gcGh5c19vZmZzZXQpPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJlZ19zdGFydCAhPSBwaHlzX29mZnNldCk8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYW5p
YygmcXVvdDtGaXJzdCBtZW1vcnkgYmFuayBtdXN0IGJlIGNvbnRpZ3VvdXMgZnJvbSBQSFlTX09G
RlNFVCZxdW90Oyk7PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgbWVtX3N0YXJ0ID0gcmVnLSZndDtiYXNlOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoG1lbV9lbmQgPSByZWctJmd0O2Jhc2UgKyByZWctJmd0O3NpemU7PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3BlY2lmaWVkX21lbV9zaXplID0g
cmVnLSZndDtzaXplOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZp
cnN0ID0gZmFsc2U7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWVt
X3N0YXJ0ID0gcmVnX3N0YXJ0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG1lbV9lbmQgPSByZWdfZW5kPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc3BlY2lmaWVkX21lbV9zaXplID0gbWVtX2VuZCAtIG1lbV9zdGFydDs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIC8qPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAqIG1lbWJsb2NrIGF1dG8gbWVyZ2VzIGNvbnRpZ3VvdXMgYmxvY2tzLCByZW1vdmU8YnI+DQpA
QCAtMjgzLDggKzI4MSw4IEBAIHZvaWQgX19pbml0IHBtc2F2N19hZGp1c3RfbG93bWVtX2JvdW5k
cyh2b2lkKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBibG9j
a3Mgc2VwYXJhdGVseSB3aGlsZSBpdGVyYXRpbmcpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHByX25vdGljZSgmcXVvdDtJZ25vcmluZyBSQU0gYWZ0ZXIgJXBhLCBtZW1vcnkgYXQgJXBh
IGlnbm9yZWRcbiZxdW90Oyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmYW1wO21lbV9lbmQsICZhbXA7cmVnLSZndDtiYXNlKTs8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtZW1ibG9ja19yZW1vdmUocmVnLSZn
dDtiYXNlLCAwIC0gcmVnLSZndDtiYXNlKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmYW1wO21lbV9lbmQsICZhbXA7cmVnX3N0YXJ0KTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtZW1ibG9ja19yZW1vdmUo
cmVnX3N0YXJ0LCAwIC0gcmVnX3N0YXJ0KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBicmVhazs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KwqAg
wqAgwqAgwqAgfTxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9wbXNhLXY4LmMgYi9hcmNo
L2FybS9tbS9wbXNhLXY4LmM8YnI+DQppbmRleCAwZDdkNWZiNTkyNDcuLmIzOWU3NGI0ODQzNyAx
MDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybS9tbS9wbXNhLXY4LmM8YnI+DQorKysgYi9hcmNoL2Fy
bS9tbS9wbXNhLXY4LmM8YnI+DQpAQCAtOTQsMjAgKzk0LDE5IEBAIHN0YXRpYyBfX2luaXQgYm9v
bCBpc19yZWdpb25fZml4ZWQoaW50IG51bWJlcik8YnI+DQrCoHZvaWQgX19pbml0IHBtc2F2OF9h
ZGp1c3RfbG93bWVtX2JvdW5kcyh2b2lkKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIHBoeXNf
YWRkcl90IG1lbV9lbmQ7PGJyPg0KLcKgIMKgIMKgIMKgc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAq
cmVnOzxicj4NCi3CoCDCoCDCoCDCoGJvb2wgZmlyc3QgPSB0cnVlOzxicj4NCivCoCDCoCDCoCDC
oHBoeXNfYWRkcl90IHJlZ19zdGFydCwgcmVnX2VuZDs8YnI+DQorwqAgwqAgwqAgwqBpbnQgaTs8
YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgezxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChmaXJzdCkgezxicj4NCivCoCDCoCDCoCDC
oGZvcl9lYWNoX21lbV9yYW5nZShpLCAmYW1wO3JlZ19zdGFydCwgJmFtcDtyZWdfZW5kKSB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGkgPT0gMCkgezxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBoeXNfYWRkcl90IHBoeXNfb2Zmc2V0ID0gUEhZU19P
RkZTRVQ7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyo8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCogSW5pdGlhbGx5IG9u
bHkgdXNlIG1lbW9yeSBjb250aW51b3VzIGZyb208YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCogUEhZU19PRkZTRVQgKi88YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAocmVnLSZndDtiYXNlICE9IHBoeXNfb2Zmc2V0KTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZWdfc3RhcnQgIT0gcGh5c19v
ZmZzZXQpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcGFuaWMoJnF1b3Q7Rmlyc3QgbWVtb3J5IGJhbmsgbXVzdCBiZSBjb250aWd1b3VzIGZyb20g
UEhZU19PRkZTRVQmcXVvdDspOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG1lbV9lbmQgPSByZWctJmd0O2Jhc2UgKyByZWctJmd0O3NpemU7PGJyPg0KLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmlyc3QgPSBmYWxzZTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtZW1fZW5kID0gcmVnX2VuZDs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIC8qPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAq
IG1lbWJsb2NrIGF1dG8gbWVyZ2VzIGNvbnRpZ3VvdXMgYmxvY2tzLCByZW1vdmU8YnI+DQpAQCAt
MTE1LDggKzExNCw4IEBAIHZvaWQgX19pbml0IHBtc2F2OF9hZGp1c3RfbG93bWVtX2JvdW5kcyh2
b2lkKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBibG9ja3Mg
c2VwYXJhdGVseSB3aGlsZSBpdGVyYXRpbmcpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAqLzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHByX25vdGljZSgmcXVvdDtJZ25vcmluZyBSQU0gYWZ0ZXIgJXBhLCBtZW1vcnkgYXQgJXBhIGln
bm9yZWRcbiZxdW90Oyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmYW1wO21lbV9lbmQsICZhbXA7cmVnLSZndDtiYXNlKTs8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtZW1ibG9ja19yZW1vdmUocmVnLSZndDti
YXNlLCAwIC0gcmVnLSZndDtiYXNlKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmYW1wO21lbV9lbmQsICZhbXA7cmVnX3N0YXJ0KTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtZW1ibG9ja19yZW1vdmUocmVn
X3N0YXJ0LCAwIC0gcmVnX3N0YXJ0KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBicmVhazs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KwqAgwqAg
wqAgwqAgfTxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hl
bi9tbS5jPGJyPg0KaW5kZXggZDQwZTllNWZjNTJiLi4wNWYyNGZmNDFlMzYgMTAwNjQ0PGJyPg0K
LS0tIGEvYXJjaC9hcm0veGVuL21tLmM8YnI+DQorKysgYi9hcmNoL2FybS94ZW4vbW0uYzxicj4N
CkBAIC0yNCwxMSArMjQsMTIgQEA8YnI+DQo8YnI+DQrCoHVuc2lnbmVkIGxvbmcgeGVuX2dldF9z
d2lvdGxiX2ZyZWVfcGFnZXModW5zaWduZWQgaW50IG9yZGVyKTxicj4NCsKgezxicj4NCi3CoCDC
oCDCoCDCoHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzs8YnI+DQorwqAgwqAgwqAgwqBwaHlz
X2FkZHJfdCBiYXNlOzxicj4NCsKgIMKgIMKgIMKgIGdmcF90IGZsYWdzID0gX19HRlBfTk9XQVJO
fF9fR0ZQX0tTV0FQRF9SRUNMQUlNOzxicj4NCivCoCDCoCDCoCDCoHU2NCBpOzxicj4NCjxicj4N
Ci3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7PGJyPg0KLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJlZy0mZ3Q7YmFzZSAmbHQ7IChwaHlzX2FkZHJfdCkweGZm
ZmZmZmZmKSB7PGJyPg0KK8KgIMKgIMKgIMKgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZhbXA7YmFz
ZSwgTlVMTCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChiYXNlICZsdDsgKHBo
eXNfYWRkcl90KTB4ZmZmZmZmZmYpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfWk9ORV9ETUEzMikpPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZmxhZ3MgfD0gX19HRlBfRE1B
MzI7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZWxzZTxicj4NCmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2thc2FuX2luaXQuYyBiL2FyY2gvYXJtNjQvbW0va2Fz
YW5faW5pdC5jPGJyPg0KaW5kZXggNzI5MWIyNmNlNzg4Li4xZmFhMDg2ZjkxOTMgMTAwNjQ0PGJy
Pg0KLS0tIGEvYXJjaC9hcm02NC9tbS9rYXNhbl9pbml0LmM8YnI+DQorKysgYi9hcmNoL2FybTY0
L21tL2thc2FuX2luaXQuYzxicj4NCkBAIC0yMTIsNyArMjEyLDcgQEAgdm9pZCBfX2luaXQga2Fz
YW5faW5pdCh2b2lkKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIHU2NCBraW1nX3NoYWRvd19z
dGFydCwga2ltZ19zaGFkb3dfZW5kOzxicj4NCsKgIMKgIMKgIMKgIHU2NCBtb2Rfc2hhZG93X3N0
YXJ0LCBtb2Rfc2hhZG93X2VuZDs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVn
aW9uICpyZWc7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3QgX3N0YXJ0LCBfZW5kOzxicj4N
CsKgIMKgIMKgIMKgIGludCBpOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGtpbWdfc2hhZG93X3N0
YXJ0ID0gKHU2NClrYXNhbl9tZW1fdG9fc2hhZG93KF90ZXh0KSAmYW1wOyBQQUdFX01BU0s7PGJy
Pg0KQEAgLTI0Niw5ICsyNDYsOSBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQpPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAga2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93KCh2b2lk
ICopbW9kX3NoYWRvd19lbmQsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKHZvaWQgKilraW1nX3NoYWRvd19zdGFy
dCk7PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcp
IHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2b2lkICpzdGFydCA9ICh2b2lkICopX19w
aHlzX3RvX3ZpcnQocmVnLSZndDtiYXNlKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2
b2lkICplbmQgPSAodm9pZCAqKV9fcGh5c190b192aXJ0KHJlZy0mZ3Q7YmFzZSArIHJlZy0mZ3Q7
c2l6ZSk7PGJyPg0KK8KgIMKgIMKgIMKgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZhbXA7c3RhcnQs
ICZhbXA7ZW5kKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdm9pZCAqX3N0YXJ0ID0g
KHZvaWQgKilfX3BoeXNfdG9fdmlydChfc3RhcnQpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHZvaWQgKmVuZCA9ICh2b2lkICopX19waHlzX3RvX3ZpcnQoX2VuZCk7PGJyPg0KPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHN0YXJ0ICZndDs9IGVuZCk8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9tbS9tbXUuYyBiL2FyY2gvYXJtNjQvbW0vbW11LmM8YnI+DQppbmRleCAxZGYyNWYy
NjU3MWQuLjMyNzI2NGZiODNmYiAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybTY0L21tL21tdS5j
PGJyPg0KKysrIGIvYXJjaC9hcm02NC9tbS9tbXUuYzxicj4NCkBAIC00NjEsOCArNDYxLDkgQEAg
c3RhdGljIHZvaWQgX19pbml0IG1hcF9tZW0ocGdkX3QgKnBnZHApPGJyPg0KwqB7PGJyPg0KwqAg
wqAgwqAgwqAgcGh5c19hZGRyX3Qga2VybmVsX3N0YXJ0ID0gX19wYV9zeW1ib2woX3RleHQpOzxi
cj4NCsKgIMKgIMKgIMKgIHBoeXNfYWRkcl90IGtlcm5lbF9lbmQgPSBfX3BhX3N5bWJvbChfX2lu
aXRfYmVnaW4pOzxicj4NCi3CoCDCoCDCoCDCoHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzs8
YnI+DQorwqAgwqAgwqAgwqBwaHlzX2FkZHJfdCBzdGFydCwgZW5kOzxicj4NCsKgIMKgIMKgIMKg
IGludCBmbGFncyA9IDA7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0KwqAgwqAg
wqAgwqAgaWYgKHJvZGF0YV9mdWxsIHx8IGRlYnVnX3BhZ2VhbGxvY19lbmFibGVkKCkpPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZmxhZ3MgPSBOT19CTE9DS19NQVBQSU5HUyB8IE5PX0NP
TlRfTUFQUElOR1M7PGJyPg0KQEAgLTQ4MSwxNSArNDgyLDkgQEAgc3RhdGljIHZvaWQgX19pbml0
IG1hcF9tZW0ocGdkX3QgKnBnZHApPGJyPg0KwqAjZW5kaWY8YnI+DQo8YnI+DQrCoCDCoCDCoCDC
oCAvKiBtYXAgYWxsIHRoZSBtZW1vcnkgYmFua3MgKi88YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFj
aF9tZW1ibG9jayhtZW1vcnksIHJlZykgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBo
eXNfYWRkcl90IHN0YXJ0ID0gcmVnLSZndDtiYXNlOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBoeXNfYWRkcl90IGVuZCA9IHN0YXJ0ICsgcmVnLSZndDtzaXplOzxicj4NCi08YnI+DQor
wqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtzdGFydCwgJmFtcDtlbmQpIHs8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoc3RhcnQgJmd0Oz0gZW5kKTxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGlmIChtZW1ibG9ja19pc19ub21hcChyZWcpKTxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRpbnVlOzxicj4NCi08YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBfX21hcF9tZW1ibG9jayhwZ2RwLCBzdGFydCwgZW5kLCBQQUdFX0tFUk5F
TCwgZmxhZ3MpOzxicj4NCsKgIMKgIMKgIMKgIH08YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvYXJj
aC9jNngva2VybmVsL3NldHVwLmMgYi9hcmNoL2M2eC9rZXJuZWwvc2V0dXAuYzxicj4NCmluZGV4
IDhlZjM1MTMxZjk5OS4uOTI1NGMzYjc5NGE1IDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvYzZ4L2tl
cm5lbC9zZXR1cC5jPGJyPg0KKysrIGIvYXJjaC9jNngva2VybmVsL3NldHVwLmM8YnI+DQpAQCAt
Mjg3LDcgKzI4Nyw4IEBAIG5vdHJhY2Ugdm9pZCBfX2luaXQgbWFjaGluZV9pbml0KHVuc2lnbmVk
IGxvbmcgZHRfcHRyKTxicj4NCjxicj4NCsKgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoq
Y21kbGluZV9wKTxicj4NCsKgezxicj4NCi3CoCDCoCDCoCDCoHN0cnVjdCBtZW1ibG9ja19yZWdp
b24gKnJlZzs8YnI+DQorwqAgwqAgwqAgwqBwaHlzX2FkZHJfdCBzdGFydCwgZW5kOzxicj4NCivC
oCDCoCDCoCDCoHU2NCBpOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIHByaW50ayhLRVJOX0lORk8g
JnF1b3Q7SW5pdGlhbGl6aW5nIGtlcm5lbFxuJnF1b3Q7KTs8YnI+DQo8YnI+DQpAQCAtMzUxLDkg
KzM1Miw5IEBAIHZvaWQgX19pbml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCk8YnI+DQrC
oCDCoCDCoCDCoCBkaXNhYmxlX2NhY2hpbmcocmFtX3N0YXJ0LCByYW1fZW5kIC0gMSk7PGJyPg0K
PGJyPg0KwqAgwqAgwqAgwqAgLyogU2V0IGNhY2hpbmcgb2YgZXh0ZXJuYWwgUkFNIHVzZWQgYnkg
TGludXggKi88YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZyk8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbmFibGVfY2FjaGluZyhDQUNIRV9SRUdJT05f
U1RBUlQocmVnLSZndDtiYXNlKSw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgQ0FDSEVfUkVHSU9OX1NUQVJUKHJlZy0mZ3Q7YmFzZSArIHJlZy0mZ3Q7
c2l6ZSAtIDEpKTs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtz
dGFydCwgJmFtcDtlbmQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZW5hYmxlX2NhY2hp
bmcoQ0FDSEVfUkVHSU9OX1NUQVJUKHN0YXJ0KSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQ0FDSEVfUkVHSU9OX1NUQVJUKGVuZCAtIDEpKTs8YnI+
DQo8YnI+DQrCoCNpZmRlZiBDT05GSUdfQkxLX0RFVl9JTklUUkQ8YnI+DQrCoCDCoCDCoCDCoCAv
Kjxicj4NCmRpZmYgLS1naXQgYS9hcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jIGIvYXJjaC9taWNy
b2JsYXplL21tL2luaXQuYzxicj4NCmluZGV4IDQ5ZTBjMjQxZjliMS4uMTU0MDNiNWFkZmNmIDEw
MDY0NDxicj4NCi0tLSBhL2FyY2gvbWljcm9ibGF6ZS9tbS9pbml0LmM8YnI+DQorKysgYi9hcmNo
L21pY3JvYmxhemUvbW0vaW5pdC5jPGJyPg0KQEAgLTEwNiwxMyArMTA2LDE0IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKTxicj4NCsKgdm9pZCBfX2luaXQgc2V0dXBfbWVt
b3J5KHZvaWQpPGJyPg0KwqB7PGJyPg0KwqAjaWZuZGVmIENPTkZJR19NTVU8YnI+DQotwqAgwqAg
wqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7PGJyPg0KwqAgwqAgwqAgwqAgdTMyIGtl
cm5lbF9hbGlnbl9zdGFydCwga2VybmVsX2FsaWduX3NpemU7PGJyPg0KK8KgIMKgIMKgIMKgcGh5
c19hZGRyX3Qgc3RhcnQsIGVuZDs8YnI+DQorwqAgwqAgwqAgwqB1NjQgaTs8YnI+DQo8YnI+DQrC
oCDCoCDCoCDCoCAvKiBGaW5kIG1haW4gbWVtb3J5IHdoZXJlIGlzIHRoZSBrZXJuZWwgKi88YnI+
DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgezxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoG1lbW9yeV9zdGFydCA9ICh1MzIpcmVnLSZndDtiYXNlOzxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxvd21lbV9zaXplID0gcmVnLSZndDtzaXplOzxicj4N
CivCoCDCoCDCoCDCoGZvcl9lYWNoX21lbV9yYW5nZShpLCAmYW1wO3N0YXJ0LCAmYW1wO2VuZCkg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1lbW9yeV9zdGFydCA9IHN0YXJ0Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxvd21lbV9zaXplID0gZW5kIC0gc3RhcnQ7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKChtZW1vcnlfc3RhcnQgJmx0Oz0gKHUzMilfdGV4
dCkgJmFtcDsmYW1wOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgo
dTMyKV90ZXh0ICZsdDs9IChtZW1vcnlfc3RhcnQgKyBsb3dtZW1fc2l6ZSAtIDEpKSkgezxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1lbW9yeV9zaXplID0gbG93bWVt
X3NpemU7PGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL2RtYS1vY3Rl
b24uYyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL2RtYS1vY3Rlb24uYzxicj4NCmluZGV4IDE0
ZWE2ODBkMTgwZS4uZDkzOGMxZjdjMWUxIDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvbWlwcy9jYXZp
dW0tb2N0ZW9uL2RtYS1vY3Rlb24uYzxicj4NCisrKyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9u
L2RtYS1vY3Rlb24uYzxicj4NCkBAIC0xOTAsMjUgKzE5MCwyNSBAQCBjaGFyICpvY3Rlb25fc3dp
b3RsYjs8YnI+DQo8YnI+DQrCoHZvaWQgX19pbml0IHBsYXRfc3dpb3RsYl9zZXR1cCh2b2lkKTxi
cj4NCsKgezxicj4NCi3CoCDCoCDCoCDCoHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKm1lbTs8YnI+
DQorwqAgwqAgwqAgwqBwaHlzX2FkZHJfdCBzdGFydCwgZW5kOzxicj4NCsKgIMKgIMKgIMKgIHBo
eXNfYWRkcl90IG1heF9hZGRyOzxicj4NCsKgIMKgIMKgIMKgIHBoeXNfYWRkcl90IGFkZHJfc2l6
ZTs8YnI+DQrCoCDCoCDCoCDCoCBzaXplX3Qgc3dpb3RsYnNpemU7PGJyPg0KwqAgwqAgwqAgwqAg
dW5zaWduZWQgbG9uZyBzd2lvdGxiX25zbGFiczs8YnI+DQorwqAgwqAgwqAgwqB1NjQgaTs8YnI+
DQo8YnI+DQrCoCDCoCDCoCDCoCBtYXhfYWRkciA9IDA7PGJyPg0KwqAgwqAgwqAgwqAgYWRkcl9z
aXplID0gMDs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnks
IG1lbSkgezxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX21lbV9yYW5nZShpLCAmYW1wO3N0YXJ0
LCAmYW1wO2VuZCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIFRoZXNlIGFkZHJl
c3NlcyBtYXAgbG93IGZvciBQQ0kuICovPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYg
KG1lbS0mZ3Q7YmFzZSAmZ3Q7IDB4NDEwMDAwMDAwdWxsICZhbXA7JmFtcDsgIU9DVEVPTl9JU19P
Q1RFT04yKCkpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29udGlu
dWU7PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYWRkcl9zaXplICs9IG1lbS0m
Z3Q7c2l6ZTs8YnI+DQotPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKG1heF9hZGRy
ICZsdDsgbWVtLSZndDtiYXNlICsgbWVtLSZndDtzaXplKTxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoG1heF9hZGRyID0gbWVtLSZndDtiYXNlICsgbWVtLSZndDtzaXpl
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFkZHJfc2l6ZSArPSAoZW5kIC0gc3RhcnQp
Ozxicj4NCjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChtYXhfYWRkciAmbHQ7IGVu
ZCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtYXhfYWRkciA9IGVu
ZDs8YnI+DQrCoCDCoCDCoCDCoCB9PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgc3dpb3RsYnNpemUg
PSBQQUdFX1NJWkU7PGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYyBi
L2FyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYzxicj4NCmluZGV4IDdiNTM3ZmEyMDM1ZC4uZWFhYzFi
NjYwMjZkIDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYzxicj4NCisr
KyBiL2FyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYzxicj4NCkBAIC0zMDAsOCArMzAwLDkgQEAgc3Rh
dGljIHZvaWQgX19pbml0IGJvb3RtZW1faW5pdCh2b2lkKTxicj4NCjxicj4NCsKgc3RhdGljIHZv
aWQgX19pbml0IGJvb3RtZW1faW5pdCh2b2lkKTxicj4NCsKgezxicj4NCi3CoCDCoCDCoCDCoHN0
cnVjdCBtZW1ibG9ja19yZWdpb24gKm1lbTs8YnI+DQrCoCDCoCDCoCDCoCBwaHlzX2FkZHJfdCBy
YW1zdGFydCwgcmFtZW5kOzxicj4NCivCoCDCoCDCoCDCoHBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7
PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgcmFtc3RhcnQg
PSBtZW1ibG9ja19zdGFydF9vZl9EUkFNKCk7PGJyPg0KwqAgwqAgwqAgwqAgcmFtZW5kID0gbWVt
YmxvY2tfZW5kX29mX0RSQU0oKTs8YnI+DQpAQCAtMzM4LDE4ICszMzksMTMgQEAgc3RhdGljIHZv
aWQgX19pbml0IGJvb3RtZW1faW5pdCh2b2lkKTxicj4NCjxicj4NCsKgIMKgIMKgIMKgIG1pbl9s
b3dfcGZuID0gQVJDSF9QRk5fT0ZGU0VUOzxicj4NCsKgIMKgIMKgIMKgIG1heF9wZm4gPSBQRk5f
RE9XTihyYW1lbmQpOzxicj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwg
bWVtKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyBzdGFydCA9
IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfYmFzZV9wZm4obWVtKTs8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIGVuZCA9IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfZW5k
X3BmbihtZW0pOzxicj4NCi08YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwg
JmFtcDtzdGFydCwgJmFtcDtlbmQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKjxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBTa2lwIGhpZ2htZW0gaGVyZSBzbyB3ZSBn
ZXQgYW4gYWNjdXJhdGUgbWF4X2xvd19wZm4gaWYgbG93PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAqIG1lbW9yeSBzdG9wcyBzaG9ydCBvZiBoaWdoIG1lbW9yeS48YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCogSWYgdGhlIHJlZ2lvbiBvdmVybGFwcyBISUdITUVNX1NUQVJU
LCBlbmQgaXMgY2xpcHBlZCBzbzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBtYXhf
cGZuIGV4Y2x1ZGVzIHRoZSBoaWdobWVtIHBvcnRpb24uPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAqLzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChtZW1ibG9ja19pc19u
b21hcChtZW0pKTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRp
bnVlOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChzdGFydCAmZ3Q7PSBQRk5fRE9X
TihISUdITUVNX1NUQVJUKSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBjb250aW51ZTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoZW5kICZndDsgUEZO
X0RPV04oSElHSE1FTV9TVEFSVCkpPGJyPg0KQEAgLTQ1OCwxMyArNDU0LDEyIEBAIGVhcmx5X3Bh
cmFtKCZxdW90O21lbW1hcCZxdW90OywgZWFybHlfcGFyc2VfbWVtbWFwKTs8YnI+DQrCoHVuc2ln
bmVkIGxvbmcgc2V0dXBfZWxmY29yZWhkciwgc2V0dXBfZWxmY29yZWhkcl9zaXplOzxicj4NCsKg
c3RhdGljIGludCBfX2luaXQgZWFybHlfcGFyc2VfZWxmY29yZWhkcihjaGFyICpwKTxicj4NCsKg
ezxicj4NCi3CoCDCoCDCoCDCoHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKm1lbTs8YnI+DQorwqAg
wqAgwqAgwqBwaHlzX2FkZHJfdCBzdGFydCwgZW5kOzxicj4NCivCoCDCoCDCoCDCoHU2NCBpOzxi
cj4NCjxicj4NCsKgIMKgIMKgIMKgIHNldHVwX2VsZmNvcmVoZHIgPSBtZW1wYXJzZShwLCAmYW1w
O3ApOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoCBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIG1l
bSkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgc3RhcnQgPSBt
ZW0tJmd0O2Jhc2U7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyBl
bmQgPSBzdGFydCArIG1lbS0mZ3Q7c2l6ZTs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1f
cmFuZ2UoaSwgJmFtcDtzdGFydCwgJmFtcDtlbmQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBpZiAoc2V0dXBfZWxmY29yZWhkciAmZ3Q7PSBzdGFydCAmYW1wOyZhbXA7IHNldHVwX2Vs
ZmNvcmVoZHIgJmx0OyBlbmQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAvKjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBSZXNl
cnZlIGZyb20gdGhlIGVsZiBjb3JlIGhlYWRlciB0byB0aGUgZW5kIG9mPGJyPg0KQEAgLTcyOCw3
ICs3MjMsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYXJjaF9tZW1faW5pdChjaGFyICoqY21kbGlu
ZV9wKTxicj4NCjxicj4NCsKgc3RhdGljIHZvaWQgX19pbml0IHJlc291cmNlX2luaXQodm9pZCk8
YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWdpb247
PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3Qgc3RhcnQsIGVuZDs8YnI+DQorwqAgwqAgwqAg
wqB1NjQgaTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBpZiAoVU5DQUNfQkFTRSAhPSBJT19CQVNF
KTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybjs8YnI+DQpAQCAtNzQwLDkgKzcz
Niw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCByZXNvdXJjZV9pbml0KHZvaWQpPGJyPg0KwqAgwqAg
wqAgwqAgYnNzX3Jlc291cmNlLnN0YXJ0ID0gX19wYV9zeW1ib2woJmFtcDtfX2Jzc19zdGFydCk7
PGJyPg0KwqAgwqAgwqAgwqAgYnNzX3Jlc291cmNlLmVuZCA9IF9fcGFfc3ltYm9sKCZhbXA7X19i
c3Nfc3RvcCkgLSAxOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1l
bW9yeSwgcmVnaW9uKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGh5c19hZGRyX3Qg
c3RhcnQgPSBQRk5fUEhZUyhtZW1ibG9ja19yZWdpb25fbWVtb3J5X2Jhc2VfcGZuKHJlZ2lvbikp
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBoeXNfYWRkcl90IGVuZCA9IFBGTl9QSFlT
KG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfZW5kX3BmbihyZWdpb24pKSAtIDE7PGJyPg0KK8KgIMKg
IMKgIMKgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZhbXA7c3RhcnQsICZhbXA7ZW5kKSB7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IHJlc291cmNlICpyZXM7PGJyPg0KPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzID0gbWVtYmxvY2tfYWxsb2Moc2l6ZW9mKHN0cnVj
dCByZXNvdXJjZSksIFNNUF9DQUNIRV9CWVRFUyk7PGJyPg0KQEAgLTc1MSw3ICs3NDUsMTIgQEAg
c3RhdGljIHZvaWQgX19pbml0IHJlc291cmNlX2luaXQodm9pZCk8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzaXplb2Yoc3RydWN0IHJlc291cmNlKSk7
PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzLSZndDtzdGFydCA9IHN0YXJ0
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlcy0mZ3Q7ZW5kID0gZW5kOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICog
SW4gbWVtYmxvY2ssIGVuZCBwb2ludHMgdG8gdGhlIGZpcnN0IGJ5dGUgYWZ0ZXIgdGhlPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogcmFuZ2Ugd2hpbGUgaW4gcmVzb3Vyc2VzLCBlbmQg
cG9pbnRzIHRvIHRoZSBsYXN0IGJ5dGUgaW48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
KiB0aGUgcmFuZ2UuPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVzLSZndDtlbmQgPSBlbmQgLSAxOzxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJlcy0mZ3Q7ZmxhZ3MgPSBJT1JFU09VUkNFX1NZU1RFTV9SQU0gfCBJT1JF
U09VUkNFX0JVU1k7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzLSZndDtuYW1lID0g
JnF1b3Q7U3lzdGVtIFJBTSZxdW90Ozs8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVu
cmlzYy9tbS9pbml0LmMgYi9hcmNoL29wZW5yaXNjL21tL2luaXQuYzxicj4NCmluZGV4IDNkN2M3
OWM3NzQ1ZC4uODM0OGZlYWFmNDZlIDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvb3BlbnJpc2MvbW0v
aW5pdC5jPGJyPg0KKysrIGIvYXJjaC9vcGVucmlzYy9tbS9pbml0LmM8YnI+DQpAQCAtNjQsNiAr
NjQsNyBAQCBleHRlcm4gY29uc3QgY2hhciBfc19rZXJuZWxfcm9bXSwgX2Vfa2VybmVsX3JvW107
PGJyPg0KwqAgKi88YnI+DQrCoHN0YXRpYyB2b2lkIF9faW5pdCBtYXBfcmFtKHZvaWQpPGJyPg0K
wqB7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3Qgc3RhcnQsIGVuZDs8YnI+DQrCoCDCoCDC
oCDCoCB1bnNpZ25lZCBsb25nIHYsIHAsIGU7PGJyPg0KwqAgwqAgwqAgwqAgcGdwcm90X3QgcHJv
dDs8YnI+DQrCoCDCoCDCoCDCoCBwZ2RfdCAqcGdlOzxicj4NCkBAIC03MSw2ICs3Miw3IEBAIHN0
YXRpYyB2b2lkIF9faW5pdCBtYXBfcmFtKHZvaWQpPGJyPg0KwqAgwqAgwqAgwqAgcHVkX3QgKnB1
ZTs8YnI+DQrCoCDCoCDCoCDCoCBwbWRfdCAqcG1lOzxicj4NCsKgIMKgIMKgIMKgIHB0ZV90ICpw
dGU7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KwqAgwqAgwqAgwqAgLyogVGhlc2UgbWFy
ayBleHRlbnRzIG9mIHJlYWQtb25seSBrZXJuZWwgcGFnZXMuLi48YnI+DQrCoCDCoCDCoCDCoCDC
oCogLi4uZnJvbSB2bWxpbnV4Lmxkcy5TPGJyPg0KwqAgwqAgwqAgwqAgwqAqLzxicj4NCkBAIC03
OCw5ICs4MCw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBtYXBfcmFtKHZvaWQpPGJyPg0KPGJyPg0K
wqAgwqAgwqAgwqAgdiA9IFBBR0VfT0ZGU0VUOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGZvcl9l
YWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnaW9uKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcCA9ICh1MzIpIHJlZ2lvbi0mZ3Q7YmFzZSAmYW1wOyBQQUdFX01BU0s7PGJyPg0KLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZSA9IHAgKyAodTMyKSByZWdpb24tJmd0O3NpemU7PGJyPg0KK8Kg
IMKgIMKgIMKgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZhbXA7c3RhcnQsICZhbXA7ZW5kKSB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcCA9ICh1MzIpIHN0YXJ0ICZhbXA7IFBBR0VfTUFT
Szs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlID0gKHUzMikgZW5kOzxicj4NCjxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHYgPSAodTMyKSBfX3ZhKHApOzxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHBnZSA9IHBnZF9vZmZzZXRfayh2KTs8YnI+DQpkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZmFkdW1w
LmM8YnI+DQppbmRleCBmZGJhZmU0MTcxMzkuLjQzNWI5OGQwNjllYiAxMDA2NDQ8YnI+DQotLS0g
YS9hcmNoL3Bvd2VycGMva2VybmVsL2ZhZHVtcC5jPGJyPg0KKysrIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC9mYWR1bXAuYzxicj4NCkBAIC0xODAsMTMgKzE4MCwxMyBAQCBpbnQgaXNfZmFkdW1wX2Fj
dGl2ZSh2b2lkKTxicj4NCsKgICovPGJyPg0KwqBzdGF0aWMgYm9vbCBpc19mYWR1bXBfbWVtX2Fy
ZWFfY29udGlndW91cyh1NjQgZF9zdGFydCwgdTY0IGRfZW5kKTxicj4NCsKgezxicj4NCi3CoCDC
oCDCoCDCoHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzs8YnI+DQorwqAgwqAgwqAgwqBwaHlz
X2FkZHJfdCByZWdfc3RhcnQsIHJlZ19lbmQ7PGJyPg0KwqAgwqAgwqAgwqAgYm9vbCByZXQgPSBm
YWxzZTs8YnI+DQotwqAgwqAgwqAgwqB1NjQgc3RhcnQsIGVuZDs8YnI+DQorwqAgwqAgwqAgwqB1
NjQgaSwgc3RhcnQsIGVuZDs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9j
ayhtZW1vcnksIHJlZykgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXJ0ID0gbWF4
X3QodTY0LCBkX3N0YXJ0LCByZWctJmd0O2Jhc2UpOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGVuZCA9IG1pbl90KHU2NCwgZF9lbmQsIChyZWctJmd0O2Jhc2UgKyByZWctJmd0O3NpemUp
KTs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtyZWdfc3RhcnQs
ICZhbXA7cmVnX2VuZCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXJ0ID0gbWF4
X3QodTY0LCBkX3N0YXJ0LCByZWdfc3RhcnQpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGVuZCA9IG1pbl90KHU2NCwgZF9lbmQsIHJlZ19lbmQpKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpZiAoZF9zdGFydCAmbHQ7IGVuZCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIC8qIE1lbW9yeSBob2xlIGZyb20gZF9zdGFydCB0byBzdGFydCAqLzxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChzdGFydCAmZ3Q7IGRf
c3RhcnQpPGJyPg0KQEAgLTQxMyw3ICs0MTMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBmYWR1bXBf
Z2V0X2Jvb3RfbWVtX3JlZ2lvbnModm9pZCk8YnI+DQrCoHs8YnI+DQrCoCDCoCDCoCDCoCB1bnNp
Z25lZCBsb25nIGJhc2UsIHNpemUsIGN1cl9zaXplLCBob2xlX3NpemUsIGxhc3RfZW5kOzxicj4N
CsKgIMKgIMKgIMKgIHVuc2lnbmVkIGxvbmcgbWVtX3NpemUgPSBmd19kdW1wLmJvb3RfbWVtb3J5
X3NpemU7PGJyPg0KLcKgIMKgIMKgIMKgc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOzxicj4N
CivCoCDCoCDCoCDCoHBoeXNfYWRkcl90IHJlZ19zdGFydCwgcmVnX2VuZDs8YnI+DQrCoCDCoCDC
oCDCoCBpbnQgcmV0ID0gMTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBmd19kdW1wLmJvb3RfbWVt
X3JlZ3NfY250ID0gMDs8YnI+DQpAQCAtNDIxLDkgKzQyMSw4IEBAIHN0YXRpYyBpbnQgX19pbml0
IGZhZHVtcF9nZXRfYm9vdF9tZW1fcmVnaW9ucyh2b2lkKTxicj4NCsKgIMKgIMKgIMKgIGxhc3Rf
ZW5kID0gMDs8YnI+DQrCoCDCoCDCoCDCoCBob2xlX3NpemUgPSAwOzxicj4NCsKgIMKgIMKgIMKg
IGN1cl9zaXplID0gMDs8YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnks
IHJlZykgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJhc2UgPSByZWctJmd0O2Jhc2U7
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2l6ZSA9IHJlZy0mZ3Q7c2l6ZTs8YnI+DQor
wqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtyZWdfc3RhcnQsICZhbXA7cmVn
X2VuZCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemUgPSByZWdfZW5kIC0gcmVn
X3N0YXJ0Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGhvbGVfc2l6ZSArPSAoYmFzZSAt
IGxhc3RfZW5kKTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKGN1cl9z
aXplICsgc2l6ZSkgJmd0Oz0gbWVtX3NpemUpIHs8YnI+DQpAQCAtOTU5LDkgKzk1OCw4IEBAIHN0
YXRpYyBpbnQgZmFkdW1wX2luaXRfZWxmY29yZV9oZWFkZXIoY2hhciAqYnVmcCk8YnI+DQrCoCAq
Lzxicj4NCsKgc3RhdGljIGludCBmYWR1bXBfc2V0dXBfY3Jhc2hfbWVtb3J5X3Jhbmdlcyh2b2lk
KTxicj4NCsKgezxicj4NCi3CoCDCoCDCoCDCoHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzs8
YnI+DQotwqAgwqAgwqAgwqB1NjQgc3RhcnQsIGVuZDs8YnI+DQotwqAgwqAgwqAgwqBpbnQgaSwg
cmV0Ozxicj4NCivCoCDCoCDCoCDCoHU2NCBpLCBzdGFydCwgZW5kOzxicj4NCivCoCDCoCDCoCDC
oGludCByZXQ7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgcHJfZGVidWcoJnF1b3Q7U2V0dXAgY3Jh
c2ggbWVtb3J5IHJhbmdlcy5cbiZxdW90Oyk7PGJyPg0KwqAgwqAgwqAgwqAgY3Jhc2hfbXJhbmdl
X2luZm8ubWVtX3JhbmdlX2NudCA9IDA7PGJyPg0KQEAgLTk3OSwxMCArOTc3LDcgQEAgc3RhdGlj
IGludCBmYWR1bXBfc2V0dXBfY3Jhc2hfbWVtb3J5X3Jhbmdlcyh2b2lkKTxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiByZXQ7PGJyPg0KwqAgwqAgwqAgwqAg
fTxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhcnQgPSAodTY0KXJlZy0mZ3Q7YmFzZTs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbmQgPSBzdGFydCArICh1NjQpcmVnLSZndDtz
aXplOzxicj4NCi08YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtz
dGFydCwgZW5kKSB7PGJyPjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+
PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5JIGRvbiYjMzk7dCBrbm93IGFueXRoaW5nIGFib3V0
IHRoaXMgY29kZSwgYnV0IGZyb20gcHVyZSBwYXR0ZXJuIG1hdGNoaW5nIGl0IGxvb2tzIGxpa2Ug
eW91IG1pc3NlZCBhICZhbXA7IGhlcmUuPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48
ZGl2IGRpcj0iYXV0byI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAj
Y2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyo8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCogc2tpcCB0aGUgbWVtb3J5IGNodW5rIHRo
YXQgaXMgYWxyZWFkeSBhZGRlZDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiAoMCB0
aHJvdWdoIGJvb3RfbWVtb3J5X3RvcCkuPGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9t
bS9ib29rM3M2NC9oYXNoX3V0aWxzLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaGFzaF91
dGlscy5jPGJyPg0KaW5kZXggNDY4MTY5ZTMzYzg2Li45YmE3NmIwNzViMTEgMTAwNjQ0PGJyPg0K
LS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYzxicj4NCisrKyBiL2Fy
Y2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmM8YnI+DQpAQCAtNyw3ICs3LDcgQEA8
YnI+DQrCoCAqPGJyPg0KwqAgKiBTTVAgc2NhbGFiaWxpdHkgd29yazo8YnI+DQrCoCAqwqAgwqAg
Q29weXJpZ2h0IChDKSAyMDAxIEFudG9uIEJsYW5jaGFyZCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFu
dG9uQGF1LmlibS5jb20iIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+YW50b25AYXUuaWJtLmNvbTwvYT4mZ3Q7LCBJQk08YnI+DQotICogPGJyPg0KKyAqPGJyPg0K
wqAgKsKgIMKgIE1vZHVsZSBuYW1lOiBodGFiLmM8YnI+DQrCoCAqPGJyPg0KwqAgKsKgIMKgIERl
c2NyaXB0aW9uOjxicj4NCkBAIC04NjIsOCArODYyLDggQEAgc3RhdGljIHZvaWQgX19pbml0IGh0
YWJfaW5pdGlhbGl6ZSh2b2lkKTxicj4NCsKgIMKgIMKgIMKgIHVuc2lnbmVkIGxvbmcgdGFibGU7
PGJyPg0KwqAgwqAgwqAgwqAgdW5zaWduZWQgbG9uZyBwdGVnX2NvdW50Ozxicj4NCsKgIMKgIMKg
IMKgIHVuc2lnbmVkIGxvbmcgcHJvdDs8YnI+DQotwqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIGJh
c2UgPSAwLCBzaXplID0gMDs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9u
ICpyZWc7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3QgYmFzZSA9IDAsIHNpemUgPSAwLCBl
bmQ7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgREJHKCZx
dW90OyAtJmd0OyBodGFiX2luaXRpYWxpemUoKVxuJnF1b3Q7KTs8YnI+DQo8YnI+DQpAQCAtODc5
LDcgKzg3OSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBodGFiX2luaXRpYWxpemUodm9pZCk8YnI+
DQrCoCDCoCDCoCDCoCAvKjxicj4NCsKgIMKgIMKgIMKgIMKgKiBDYWxjdWxhdGUgdGhlIHJlcXVp
cmVkIHNpemUgb2YgdGhlIGh0YWIuwqAgV2Ugd2FudCB0aGUgbnVtYmVyIG9mPGJyPg0KwqAgwqAg
wqAgwqAgwqAqIFBURUdzIHRvIGVxdWFsIG9uZSBoYWxmIHRoZSBudW1iZXIgb2YgcmVhbCBwYWdl
cy48YnI+DQotwqAgwqAgwqAgwqAgKi8gPGJyPg0KK8KgIMKgIMKgIMKgICovPGJyPg0KwqAgwqAg
wqAgwqAgaHRhYl9zaXplX2J5dGVzID0gaHRhYl9nZXRfdGFibGVfc2l6ZSgpOzxicj4NCsKgIMKg
IMKgIMKgIHB0ZWdfY291bnQgPSBodGFiX3NpemVfYnl0ZXMgJmd0OyZndDsgNzs8YnI+DQo8YnI+
DQpAQCAtODg5LDcgKzg4OSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBodGFiX2luaXRpYWxpemUo
dm9pZCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBmaXJtd2FyZV9oYXNfZmVhdHVyZShGV19GRUFU
VVJFX1BTM19MVjEpKSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogVXNpbmcgYSBo
eXBlcnZpc29yIHdoaWNoIG93bnMgdGhlIGh0YWIgKi88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBodGFiX2FkZHJlc3MgPSBOVUxMOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9T
RFIxID0gMDsgPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX1NEUjEgPSAwOzxicj4NCsKg
I2lmZGVmIENPTkZJR19GQV9EVU1QPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyo8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCogSWYgZmlybXdhcmUgYXNzaXN0ZWQgZHVtcCBp
cyBhY3RpdmUgZmlybXdhcmUgcHJlc2VydmVzPGJyPg0KQEAgLTk1NSw5ICs5NTUsOSBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgaHRhYl9pbml0aWFsaXplKHZvaWQpPGJyPg0KwqAjZW5kaWYgLyogQ09O
RklHX0RFQlVHX1BBR0VBTExPQyAqLzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIC8qIGNyZWF0ZSBi
b2x0ZWQgdGhlIGxpbmVhciBtYXBwaW5nIGluIHRoZSBoYXNoIHRhYmxlICovPGJyPg0KLcKgIMKg
IMKgIMKgZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHs8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBiYXNlID0gKHVuc2lnbmVkIGxvbmcpX192YShyZWctJmd0O2Jhc2UpOzxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemUgPSByZWctJmd0O3NpemU7PGJyPg0KK8KgIMKg
IMKgIMKgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZhbXA7YmFzZSwgJmFtcDtlbmQpIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzaXplID0gZW5kIC0gYmFzZTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBiYXNlID0gKHVuc2lnbmVkIGxvbmcpX192YShiYXNlKTs8YnI+DQo8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBEQkcoJnF1b3Q7Y3JlYXRpbmcgbWFwcGluZyBmb3Ig
cmVnaW9uOiAlbHguLiVseCAocHJvdDogJWx4KVxuJnF1b3Q7LDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGJhc2UsIHNpemUsIHByb3QpOzxicj4NCmRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jv
b2szczY0L3JhZGl4X3BndGFibGUuYzxicj4NCmluZGV4IGJiMDBlMGNiYTExOS4uNjU2NTdiOTIw
ODQ3IDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3Rh
YmxlLmM8YnI+DQorKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5j
PGJyPg0KQEAgLTMxOCwyOCArMzE4LDI3IEBAIHN0YXRpYyBpbnQgX19tZW1pbml0IGNyZWF0ZV9w
aHlzaWNhbF9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgc3RhcnQsPGJyPg0KwqBzdGF0aWMgdm9pZCBf
X2luaXQgcmFkaXhfaW5pdF9wZ3RhYmxlKHZvaWQpPGJyPg0KwqB7PGJyPg0KwqAgwqAgwqAgwqAg
dW5zaWduZWQgbG9uZyBydHNfZmllbGQ7PGJyPg0KLcKgIMKgIMKgIMKgc3RydWN0IG1lbWJsb2Nr
X3JlZ2lvbiAqcmVnOzxicj4NCivCoCDCoCDCoCDCoHBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7PGJy
Pg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLyogV2UgZG9uJiMz
OTt0IHN1cHBvcnQgc2xiIGZvciByYWRpeCAqLzxicj4NCsKgIMKgIMKgIMKgIG1tdV9zbGJfc2l6
ZSA9IDA7PGJyPg0KwqAgwqAgwqAgwqAgLyo8YnI+DQrCoCDCoCDCoCDCoCDCoCogQ3JlYXRlIHRo
ZSBsaW5lYXIgbWFwcGluZywgdXNpbmcgc3RhbmRhcmQgcGFnZSBzaXplIGZvciBub3c8YnI+DQrC
oCDCoCDCoCDCoCDCoCovPGJyPg0KLcKgIMKgIMKgIMKgZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5
LCByZWcpIHs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtzdGFy
dCwgJmFtcDtlbmQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKjxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBUaGUgbWVtYmxvY2sgYWxsb2NhdG9ywqAgaXMgdXAgYXQg
dGhpcyBwb2ludCwgc28gdGhlPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIHBhZ2Ug
dGFibGVzIHdpbGwgYmUgYWxsb2NhdGVkIHdpdGhpbiB0aGUgcmFuZ2UuIE5vPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAqIG5lZWQgb3IgYSBub2RlICh3aGljaCB3ZSBkb24mIzM5O3Qg
aGF2ZSB5ZXQpLjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQo8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoKHJlZy0mZ3Q7YmFzZSArIHJlZy0mZ3Q7c2l6ZSkg
Jmd0Oz0gUkFESVhfVk1BTExPQ19TVEFSVCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChlbmQgJmd0Oz0gUkFESVhfVk1BTExPQ19TVEFSVCkgezxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHByX3dhcm4oJnF1b3Q7T3V0c2lkZSB0aGUgc3VwcG9ydGVk
IHJhbmdlXG4mcXVvdDspOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGNvbnRpbnVlOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQo8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBXQVJOX09OKGNyZWF0ZV9waHlzaWNhbF9tYXBwaW5nKHJlZy0m
Z3Q7YmFzZSw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctJmd0O2Jhc2UgKyByZWctJmd0O3NpemUs
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgLTEsIFBBR0VfS0VSTkVMKSk7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgV0FSTl9PTihjcmVhdGVfcGh5c2ljYWxfbWFwcGluZyhzdGFydCwgZW5kLCAt
MSwgUEFHRV9LRVJORUwpKTs8YnI+DQrCoCDCoCDCoCDCoCB9PGJyPg0KPGJyPg0KwqAgwqAgwqAg
wqAgLyogRmluZCBvdXQgaG93IG1hbnkgUElEIGJpdHMgYXJlIHN1cHBvcnRlZCAqLzxicj4NCmRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0va2FzYW4va2FzYW5faW5pdF8zMi5jIGIvYXJjaC9w
b3dlcnBjL21tL2thc2FuL2thc2FuX2luaXRfMzIuYzxicj4NCmluZGV4IDA3NjBlMWU3NTRlNC4u
NmU3MzQzNGU0ZTQxIDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9rYXNh
bl9pbml0XzMyLmM8YnI+DQorKysgYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4va2FzYW5faW5pdF8z
Mi5jPGJyPg0KQEAgLTEyMCwxMSArMTIwLDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBrYXNhbl91
bm1hcF9lYXJseV9zaGFkb3dfdm1hbGxvYyh2b2lkKTxicj4NCsKgc3RhdGljIHZvaWQgX19pbml0
IGthc2FuX21tdV9pbml0KHZvaWQpPGJyPg0KwqB7PGJyPg0KwqAgwqAgwqAgwqAgaW50IHJldDs8
YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7PGJyPg0KK8KgIMKg
IMKgIMKgcGh5c19hZGRyX3QgYmFzZSwgZW5kOzxicj4NCivCoCDCoCDCoCDCoHU2NCBpOzxicj4N
Cjxicj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGh5c19hZGRyX3QgYmFzZSA9IHJlZy0mZ3Q7YmFzZTs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaHlzX2FkZHJfdCB0b3AgPSBtaW4oYmFzZSAr
IHJlZy0mZ3Q7c2l6ZSwgdG90YWxfbG93bWVtKTs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9t
ZW1fcmFuZ2UoaSwgJmFtcDtiYXNlLCAmYW1wO2VuZCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBoeXNfYWRkcl90IHRvcCA9IG1pbihlbmQsIHRvdGFsX2xvd21lbSk7PGJyPg0KPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGJhc2UgJmd0Oz0gdG9wKTxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnRpbnVlOzxicj4NCmRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvbW0vbWVtLmMgYi9hcmNoL3Bvd2VycGMvbW0vbWVtLmM8YnI+DQppbmRl
eCAzOGQxYWNkN2M4ZWYuLjAyNDhiNmQ1OGZjZCAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL3Bvd2Vy
cGMvbW0vbWVtLmM8YnI+DQorKysgYi9hcmNoL3Bvd2VycGMvbW0vbWVtLmM8YnI+DQpAQCAtNTkz
LDIwICs1OTMsMjQgQEAgdm9pZCBmbHVzaF9pY2FjaGVfdXNlcl9wYWdlKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hLCBzdHJ1Y3QgcGFnZSAqcGFnZSw8YnI+DQrCoCAqLzxicj4NCsKgc3RhdGlj
IGludCBfX2luaXQgYWRkX3N5c3RlbV9yYW1fcmVzb3VyY2VzKHZvaWQpPGJyPg0KwqB7PGJyPg0K
LcKgIMKgIMKgIMKgc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOzxicj4NCivCoCDCoCDCoCDC
oHBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJy
Pg0KLcKgIMKgIMKgIMKgZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHs8YnI+DQorwqAg
wqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtzdGFydCwgJmFtcDtlbmQpIHs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgcmVzb3VyY2UgKnJlczs8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIGJhc2UgPSByZWctJmd0O2Jhc2U7PGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyBzaXplID0gcmVnLSZndDtz
aXplOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlcyA9IGt6YWxsb2Moc2l6
ZW9mKHN0cnVjdCByZXNvdXJjZSksIEdGUF9LRVJORUwpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFdBUk5fT04oIXJlcyk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
aWYgKHJlcykgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlcy0m
Z3Q7bmFtZSA9ICZxdW90O1N5c3RlbSBSQU0mcXVvdDs7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVzLSZndDtzdGFydCA9IGJhc2U7PGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzLSZndDtlbmQgPSBiYXNlICsgc2l6ZSAtIDE7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzLSZndDtzdGFydCA9IHN0
YXJ0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogSW4gbWVtYmxvY2ssIGVuZCBwb2lu
dHMgdG8gdGhlIGZpcnN0IGJ5dGUgYWZ0ZXI8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgKiB0aGUgcmFuZ2Ugd2hpbGUgaW4gcmVzb3Vyc2VzLCBlbmQgcG9pbnRzIHRv
IHRoZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIGxhc3QgYnl0
ZSBpbiB0aGUgcmFuZ2UuPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzLSZndDtlbmQg
PSBlbmQgLSAxOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlcy0m
Z3Q7ZmxhZ3MgPSBJT1JFU09VUkNFX1NZU1RFTV9SQU0gfCBJT1JFU09VUkNFX0JVU1k7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgV0FSTl9PTihyZXF1ZXN0X3Jlc291
cmNlKCZhbXA7aW9tZW1fcmVzb3VyY2UsIHJlcykgJmx0OyAwKTs8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9PGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlXzMy
LmMgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZV8zMi5jPGJyPg0KaW5kZXggNmViNGVhYjc5Mzg1
Li4wNzkxNTllOTdiY2EgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGVf
MzIuYzxicj4NCisrKyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlXzMyLmM8YnI+DQpAQCAtMTIz
LDExICsxMjMsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IF9fbWFwaW5fcmFtX2NodW5rKHVuc2ln
bmVkIGxvbmcgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHRvcCk8YnI+DQo8YnI+DQrCoHZvaWQgX19p
bml0IG1hcGluX3JhbSh2b2lkKTxicj4NCsKgezxicj4NCi3CoCDCoCDCoCDCoHN0cnVjdCBtZW1i
bG9ja19yZWdpb24gKnJlZzs8YnI+DQorwqAgwqAgwqAgwqBwaHlzX2FkZHJfdCBiYXNlLCBlbmQ7
PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgZm9yX2VhY2hf
bWVtYmxvY2sobWVtb3J5LCByZWcpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaHlz
X2FkZHJfdCBiYXNlID0gcmVnLSZndDtiYXNlOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHBoeXNfYWRkcl90IHRvcCA9IG1pbihiYXNlICsgcmVnLSZndDtzaXplLCB0b3RhbF9sb3dtZW0p
Ozxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX21lbV9yYW5nZShpLCAmYW1wO2Jhc2UsICZhbXA7
ZW5kKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGh5c19hZGRyX3QgdG9wID0gbWlu
KGVuZCwgdG90YWxfbG93bWVtKTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBp
ZiAoYmFzZSAmZ3Q7PSB0b3ApPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgY29udGludWU7PGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmM8YnI+DQppbmRleCA3NDQwYmEyY2RhYWEuLjJhYmUxMTY1ZmU1NiAx
MDA2NDQ8YnI+DQotLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYzxicj4NCisrKyBiL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jPGJyPg0KQEAgLTE0NSwyMSArMTQ1LDIyIEBAIHN0YXRpYyBwaHlzX2FkZHJf
dCBkdGJfZWFybHlfcGEgX19pbml0ZGF0YTs8YnI+DQo8YnI+DQrCoHZvaWQgX19pbml0IHNldHVw
X2Jvb3RtZW0odm9pZCk8YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tf
cmVnaW9uICpyZWc7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3Qgc3RhcnQsIGVuZDs8YnI+
DQrCoCDCoCDCoCDCoCBwaHlzX2FkZHJfdCBtZW1fc2l6ZSA9IDA7PGJyPg0KwqAgwqAgwqAgwqAg
cGh5c19hZGRyX3QgdG90YWxfbWVtID0gMDs8YnI+DQrCoCDCoCDCoCDCoCBwaHlzX2FkZHJfdCBt
ZW1fc3RhcnQsIGVuZCA9IDA7PGJyPg0KwqAgwqAgwqAgwqAgcGh5c19hZGRyX3Qgdm1saW51eF9l
bmQgPSBfX3BhX3N5bWJvbCgmYW1wO19lbmQpOzxicj4NCsKgIMKgIMKgIMKgIHBoeXNfYWRkcl90
IHZtbGludXhfc3RhcnQgPSBfX3BhX3N5bWJvbCgmYW1wO19zdGFydCk7PGJyPg0KK8KgIMKgIMKg
IMKgdTY0IGk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLyogRmluZCB0aGUgbWVtb3J5IHJlZ2lv
biBjb250YWluaW5nIHRoZSBrZXJuZWwgKi88YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1i
bG9jayhtZW1vcnksIHJlZykgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVuZCA9IHJl
Zy0mZ3Q7YmFzZSArIHJlZy0mZ3Q7c2l6ZTs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1f
cmFuZ2UoaSwgJmFtcDtzdGFydCwgJmFtcDtlbmQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBwaHlzX2FkZHJfdCBzaXplID0gZW5kIC0gc3RhcnQ7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaWYgKCF0b3RhbF9tZW0pPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgbWVtX3N0YXJ0ID0gcmVnLSZndDtiYXNlOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmIChyZWctJmd0O2Jhc2UgJmx0Oz0gdm1saW51eF9zdGFydCAmYW1wOyZhbXA7IHZt
bGludXhfZW5kICZsdDs9IGVuZCk8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBCVUdfT04ocmVnLSZndDtzaXplID09IDApOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHRvdGFsX21lbSA9IHRvdGFsX21lbSArIHJlZy0mZ3Q7c2l6ZTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtZW1fc3RhcnQgPSBzdGFydDs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAoc3RhcnQgJmx0Oz0gdm1saW51eF9zdGFydCAmYW1wOyZhbXA7
IHZtbGludXhfZW5kICZsdDs9IGVuZCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBCVUdfT04oc2l6ZSA9PSAwKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0
b3RhbF9tZW0gPSB0b3RhbF9tZW0gKyBzaXplOzxicj4NCsKgIMKgIMKgIMKgIH08YnI+DQo8YnI+
DQrCoCDCoCDCoCDCoCAvKjxicj4NCkBAIC00NTYsNyArNDU3LDcgQEAgc3RhdGljIHZvaWQgX19p
bml0IHNldHVwX3ZtX2ZpbmFsKHZvaWQpPGJyPg0KwqB7PGJyPg0KwqAgwqAgwqAgwqAgdWludHB0
cl90IHZhLCBtYXBfc2l6ZTs8YnI+DQrCoCDCoCDCoCDCoCBwaHlzX2FkZHJfdCBwYSwgc3RhcnQs
IGVuZDs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7PGJyPg0K
K8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLyogU2V0IG1tdV9lbmFi
bGVkIGZsYWcgKi88YnI+DQrCoCDCoCDCoCDCoCBtbXVfZW5hYmxlZCA9IHRydWU7PGJyPg0KQEAg
LTQ2NywxNCArNDY4LDkgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX3ZtX2ZpbmFsKHZvaWQp
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQR0RJUl9TSVpF
LCBQQUdFX1RBQkxFKTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCAvKiBNYXAgYWxsIG1lbW9yeSBi
YW5rcyAqLzxicj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhcnQgPSByZWctJmd0O2Jhc2U7PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZW5kID0gc3RhcnQgKyByZWctJmd0O3NpemU7PGJyPg0K
LTxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX21lbV9yYW5nZShpLCAmYW1wO3N0YXJ0LCAmYW1w
O2VuZCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChzdGFydCAmZ3Q7PSBlbmQp
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKG1lbWJsb2NrX2lzX25vbWFwKHJlZykpPGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaWYgKHN0YXJ0ICZsdDs9IF9fcGEoUEFHRV9PRkZTRVQpICZhbXA7JmFt
cDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBfX3BhKFBBR0VfT0ZGU0VUKSAm
bHQ7IGVuZCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdGFydCA9
IF9fcGEoUEFHRV9PRkZTRVQpOzxicj4NCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2thc2Fu
X2luaXQuYyBiL2FyY2gvcmlzY3YvbW0va2FzYW5faW5pdC5jPGJyPg0KaW5kZXggODdiNGFiM2Qz
Yzc3Li4xMmRkZDFmNmJmNzAgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9yaXNjdi9tbS9rYXNhbl9p
bml0LmM8YnI+DQorKysgYi9hcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYzxicj4NCkBAIC04NSwx
NiArODUsMTYgQEAgc3RhdGljIHZvaWQgX19pbml0IHBvcHVsYXRlKHZvaWQgKnN0YXJ0LCB2b2lk
ICplbmQpPGJyPg0KPGJyPg0KwqB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQpPGJyPg0KwqB7
PGJyPg0KLcKgIMKgIMKgIMKgc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOzxicj4NCi3CoCDC
oCDCoCDCoHVuc2lnbmVkIGxvbmcgaTs8YnI+DQorwqAgwqAgwqAgwqBwaHlzX2FkZHJfdCBfc3Rh
cnQsIF9lbmQ7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAg
a2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93KCh2b2lkICopS0FTQU5fU0hBRE9XX1NUQVJULDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICh2b2lkICopa2FzYW5fbWVtX3RvX3NoYWRvdygodm9pZCAqKTxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFZNQUxMT0NfRU5EKSk7PGJyPg0KPGJyPg0KLcKgIMKg
IMKgIMKgZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHs8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB2b2lkICpzdGFydCA9ICh2b2lkICopX192YShyZWctJmd0O2Jhc2UpOzxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZvaWQgKmVuZCA9ICh2b2lkICopX192YShyZWctJmd0
O2Jhc2UgKyByZWctJmd0O3NpemUpOzxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX21lbV9yYW5n
ZShpLCAmYW1wO19zdGFydCwgJmFtcDtfZW5kKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdm9pZCAqc3RhcnQgPSAodm9pZCAqKV9zdGFydDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB2b2lkICplbmQgPSAodm9pZCAqKV9lbmQ7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaWYgKHN0YXJ0ICZndDs9IGVuZCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2tlcm5lbC9z
ZXR1cC5jIGIvYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jPGJyPg0KaW5kZXggOGIyODRjZjZlMTk5
Li5iNmM0YTBjNWZmODYgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5j
PGJyPg0KKysrIGIvYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jPGJyPg0KQEAgLTE5OCw3ICsxOTgs
NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY29ubW9kZV9kZWZhdWx0KHZvaWQpPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgY3BjbWQoJnF1b3Q7UVVFUlkgVEVSTSZxdW90OywgcXVlcnlfYnVm
ZmVyLCAxMDI0LCBOVUxMKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwdHIgPSBzdHJz
dHIocXVlcnlfYnVmZmVyLCAmcXVvdDtDT05NT0RFJnF1b3Q7KTs8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAvKjxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIFNldCB0aGUgY29u
bW9kZSB0byAzMjE1IHNvIHRoYXQgdGhlIGRldmljZSByZWNvZ25pdGlvbiA8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKiBTZXQgdGhlIGNvbm1vZGUgdG8gMzIxNSBzbyB0aGF0IHRoZSBk
ZXZpY2UgcmVjb2duaXRpb248YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCogd2lsbCBz
ZXQgdGhlIGN1X3R5cGUgb2YgdGhlIGNvbnNvbGUgdG8gMzIxNS4gSWYgdGhlPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAqIGNvbm1vZGUgaXMgMzI3MCBhbmQgd2UgZG9uJiMzOTt0IHNl
dCBpdCBiYWNrIHRoZW4gYm90aDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiAzMjE1
IGFuZCB0aGUgMzI3MCBkcml2ZXIgd2lsbCB0cnkgdG8gYWNjZXNzIHRoZSBjb25zb2xlPGJyPg0K
QEAgLTI1OCw3ICsyNTgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2V0dXBfemZjcGR1bXAodm9p
ZCkge308YnI+DQo8YnI+DQrCoCAvKjxicj4NCsKgICogUmVib290LCBoYWx0IGFuZCBwb3dlcl9v
ZmYgc3R1YnMuIFRoZXkganVzdCBjYWxsIF9tYWNoaW5lX3Jlc3RhcnQsPGJyPg0KLSAqIF9tYWNo
aW5lX2hhbHQgb3IgX21hY2hpbmVfcG93ZXJfb2ZmLiA8YnI+DQorICogX21hY2hpbmVfaGFsdCBv
ciBfbWFjaGluZV9wb3dlcl9vZmYuPGJyPg0KwqAgKi88YnI+DQo8YnI+DQrCoHZvaWQgbWFjaGlu
ZV9yZXN0YXJ0KGNoYXIgKmNvbW1hbmQpPGJyPg0KQEAgLTQ4NCw4ICs0ODQsOSBAQCBzdGF0aWMg
c3RydWN0IHJlc291cmNlIF9faW5pdGRhdGEgKnN0YW5kYXJkX3Jlc291cmNlc1tdID0gezxicj4N
CsKgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX3Jlc291cmNlcyh2b2lkKTxicj4NCsKgezxicj4N
CsKgIMKgIMKgIMKgIHN0cnVjdCByZXNvdXJjZSAqcmVzLCAqc3RkX3JlcywgKnN1Yl9yZXM7PGJy
Pg0KLcKgIMKgIMKgIMKgc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOzxicj4NCivCoCDCoCDC
oCDCoHBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7PGJyPg0KwqAgwqAgwqAgwqAgaW50IGo7PGJyPg0K
K8KgIMKgIMKgIMKgdTY0IGk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgY29kZV9yZXNvdXJjZS5z
dGFydCA9ICh1bnNpZ25lZCBsb25nKSBfdGV4dDs8YnI+DQrCoCDCoCDCoCDCoCBjb2RlX3Jlc291
cmNlLmVuZCA9ICh1bnNpZ25lZCBsb25nKSBfZXRleHQgLSAxOzxicj4NCkBAIC00OTQsNyArNDk1
LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX3Jlc291cmNlcyh2b2lkKTxicj4NCsKgIMKg
IMKgIMKgIGJzc19yZXNvdXJjZS5zdGFydCA9ICh1bnNpZ25lZCBsb25nKSBfX2Jzc19zdGFydDs8
YnI+DQrCoCDCoCDCoCDCoCBic3NfcmVzb3VyY2UuZW5kID0gKHVuc2lnbmVkIGxvbmcpIF9fYnNz
X3N0b3AgLSAxOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9y
eSwgcmVnKSB7PGJyPg0KK8KgIMKgIMKgIMKgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZhbXA7c3Rh
cnQsICZhbXA7ZW5kKSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzID0gbWVtYmxv
Y2tfYWxsb2Moc2l6ZW9mKCpyZXMpLCA4KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBp
ZiAoIXJlcyk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYW5pYygm
cXVvdDslczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlcyBhbGlnbj0weCV4XG4mcXVvdDss
PGJyPg0KQEAgLTUwMiw4ICs1MDMsMTMgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX3Jlc291
cmNlcyh2b2lkKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlcy0mZ3Q7ZmxhZ3MgPSBJ
T1JFU09VUkNFX0JVU1kgfCBJT1JFU09VUkNFX1NZU1RFTV9SQU07PGJyPg0KPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmVzLSZndDtuYW1lID0gJnF1b3Q7U3lzdGVtIFJBTSZxdW90Ozs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXMtJmd0O3N0YXJ0ID0gcmVnLSZndDtiYXNl
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlcy0mZ3Q7ZW5kID0gcmVnLSZndDtiYXNl
ICsgcmVnLSZndDtzaXplIC0gMTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXMtJmd0
O3N0YXJ0ID0gc3RhcnQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyo8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBJbiBtZW1ibG9jaywgZW5kIHBvaW50cyB0byB0aGUgZmly
c3QgYnl0ZSBhZnRlciB0aGU8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiByYW5nZSB3
aGlsZSBpbiByZXNvdXJzZXMsIGVuZCBwb2ludHMgdG8gdGhlIGxhc3QgYnl0ZSBpbjxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHRoZSByYW5nZS48YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXMtJmd0O2VuZCA9IGVu
ZCAtIDE7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVxdWVzdF9yZXNvdXJjZSgmYW1w
O2lvbWVtX3Jlc291cmNlLCByZXMpOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGZvciAoaiA9IDA7IGogJmx0OyBBUlJBWV9TSVpFKHN0YW5kYXJkX3Jlc291cmNlcyk7IGorKykg
ezxicj4NCkBAIC04MTksMTQgKzgyNSwxNSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmVzZXJ2ZV9r
ZXJuZWwodm9pZCk8YnI+DQo8YnI+DQrCoHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tZW1vcnko
dm9pZCk8YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpy
ZWc7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3Qgc3RhcnQsIGVuZDs8YnI+DQorwqAgwqAg
wqAgwqB1NjQgaTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCAvKjxicj4NCsKgIMKgIMKgIMKgIMKg
KiBJbml0IHN0b3JhZ2Uga2V5IGZvciBwcmVzZW50IG1lbW9yeTxicj4NCsKgIMKgIMKgIMKgIMKg
Ki88YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgezxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0b3JhZ2Vfa2V5X2luaXRfcmFuZ2UocmVnLSZndDti
YXNlLCByZWctJmd0O2Jhc2UgKyByZWctJmd0O3NpemUpOzxicj4NCi3CoCDCoCDCoCDCoH08YnI+
DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmFtcDtzdGFydCwgJmFtcDtlbmQp
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RvcmFnZV9rZXlfaW5pdF9yYW5nZShzdGFy
dCwgZW5kKTs8YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAgcHN3X3NldF9rZXkoUEFHRV9ERUZBVUxU
X0tFWSk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLyogT25seSBjb3NtZXRpY3MgKi88YnI+DQpk
aWZmIC0tZ2l0IGEvYXJjaC9zMzkwL21tL3ZtZW0uYyBiL2FyY2gvczM5MC9tbS92bWVtLmM8YnI+
DQppbmRleCA4YjYyODJjZjdkMTMuLjMwMDc2ZWNjM2ViNyAxMDA2NDQ8YnI+DQotLS0gYS9hcmNo
L3MzOTAvbW0vdm1lbS5jPGJyPg0KKysrIGIvYXJjaC9zMzkwL21tL3ZtZW0uYzxicj4NCkBAIC0z
OTksMTAgKzM5OSwxMSBAQCBpbnQgdm1lbV9hZGRfbWFwcGluZyh1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBsb25nIHNpemUpPGJyPg0KwqAgKi88YnI+DQrCoHZvaWQgX19pbml0IHZtZW1f
bWFwX2luaXQodm9pZCk8YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tf
cmVnaW9uICpyZWc7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3Qgc3RhcnQsIGVuZDs8YnI+
DQorwqAgwqAgwqAgwqB1NjQgaTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1i
bG9jayhtZW1vcnksIHJlZyk8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2bWVtX2FkZF9t
ZW0ocmVnLSZndDtiYXNlLCByZWctJmd0O3NpemUpOzxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNo
X21lbV9yYW5nZShpLCAmYW1wO3N0YXJ0LCAmYW1wO2VuZCk8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB2bWVtX2FkZF9tZW0oc3RhcnQsIGVuZCAtIHN0YXJ0KTs8YnI+DQrCoCDCoCDCoCDC
oCBfX3NldF9tZW1vcnkoKHVuc2lnbmVkIGxvbmcpX3N0ZXh0LDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgKHVuc2lnbmVkIGxvbmcpKF9ldGV4dCAtIF9zdGV4dCkgJmd0OyZn
dDsgUEFHRV9TSElGVCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNFVF9N
RU1PUllfUk8gfCBTRVRfTUVNT1JZX1gpOzxicj4NCkBAIC00MjgsMTYgKzQyOSwxNyBAQCB2b2lk
IF9faW5pdCB2bWVtX21hcF9pbml0KHZvaWQpPGJyPg0KwqAgKi88YnI+DQrCoHN0YXRpYyBpbnQg
X19pbml0IHZtZW1fY29udmVydF9tZW1vcnlfY2h1bmsodm9pZCk8YnI+DQrCoHs8YnI+DQotwqAg
wqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7PGJyPg0KK8KgIMKgIMKgIMKgcGh5
c19hZGRyX3Qgc3RhcnQsIGVuZDs8YnI+DQrCoCDCoCDCoCDCoCBzdHJ1Y3QgbWVtb3J5X3NlZ21l
bnQgKnNlZzs8YnI+DQorwqAgwqAgwqAgwqB1NjQgaTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBt
dXRleF9sb2NrKCZhbXA7dm1lbV9tdXRleCk7PGJyPg0KLcKgIMKgIMKgIMKgZm9yX2VhY2hfbWVt
YmxvY2sobWVtb3J5LCByZWcpIHs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1fcmFuZ2Uo
aSwgJmFtcDtzdGFydCwgJmFtcDtlbmQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBz
ZWcgPSBremFsbG9jKHNpemVvZigqc2VnKSwgR0ZQX0tFUk5FTCk7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaWYgKCFzZWcpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcGFuaWMoJnF1b3Q7T3V0IG9mIG1lbW9yeS4uLlxuJnF1b3Q7KTs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzZWctJmd0O3N0YXJ0ID0gcmVnLSZndDtiYXNlOzxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHNlZy0mZ3Q7c2l6ZSA9IHJlZy0mZ3Q7c2l6ZTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzZWctJmd0O3N0YXJ0ID0gc3RhcnQ7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc2VnLSZndDtzaXplID0gZW5kIC0gc3RhcnQ7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaW5zZXJ0X21lbW9yeV9zZWdtZW50KHNlZyk7PGJyPg0KwqAgwqAgwqAg
wqAgfTxicj4NCsKgIMKgIMKgIMKgIG11dGV4X3VubG9jaygmYW1wO3ZtZW1fbXV0ZXgpOzxicj4N
CmRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL21tL2luaXRfNjQuYyBiL2FyY2gvc3BhcmMvbW0vaW5p
dF82NC5jPGJyPg0KaW5kZXggMDJlNmU1ZTBmMTA2Li5kZTYzYzAwMjYzOGUgMTAwNjQ0PGJyPg0K
LS0tIGEvYXJjaC9zcGFyYy9tbS9pbml0XzY0LmM8YnI+DQorKysgYi9hcmNoL3NwYXJjL21tL2lu
aXRfNjQuYzxicj4NCkBAIC0xMTkyLDE4ICsxMTkyLDE0IEBAIGludCBvZl9ub2RlX3RvX25pZChz
dHJ1Y3QgZGV2aWNlX25vZGUgKmRwKTxicj4NCjxicj4NCsKgc3RhdGljIHZvaWQgX19pbml0IGFk
ZF9ub2RlX3Jhbmdlcyh2b2lkKTxicj4NCsKgezxicj4NCi3CoCDCoCDCoCDCoHN0cnVjdCBtZW1i
bG9ja19yZWdpb24gKnJlZzs8YnI+DQorwqAgwqAgwqAgwqBwaHlzX2FkZHJfdCBzdGFydCwgZW5k
Ozxicj4NCsKgIMKgIMKgIMKgIHVuc2lnbmVkIGxvbmcgcHJldl9tYXg7PGJyPg0KK8KgIMKgIMKg
IMKgdTY0IGk7PGJyPg0KPGJyPg0KwqBtZW1ibG9ja19yZXNpemVkOjxicj4NCsKgIMKgIMKgIMKg
IHByZXZfbWF4ID0gbWVtYmxvY2subWVtb3J5Lm1heDs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBm
b3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHVuc2lnbmVkIGxvbmcgc2l6ZSA9IHJlZy0mZ3Q7c2l6ZTs8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIHN0YXJ0LCBlbmQ7PGJyPg0KLTxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHN0YXJ0ID0gcmVnLSZndDtiYXNlOzxicj4NCi3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGVuZCA9IHN0YXJ0ICsgc2l6ZTs8YnI+DQorwqAgwqAgwqAgwqBmb3JfZWFjaF9t
ZW1fcmFuZ2UoaSwgJmFtcDtzdGFydCwgJmFtcDtlbmQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB3aGlsZSAoc3RhcnQgJmx0OyBlbmQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB1bnNpZ25lZCBsb25nIHRoaXNfZW5kOzxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludCBuaWQ7PGJyPg0KQEAgLTEyMTEsNyArMTIwNyw3
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBhZGRfbm9kZV9yYW5nZXModm9pZCk8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0aGlzX2VuZCA9IG1lbWJsb2NrX25pZF9yYW5n
ZShzdGFydCwgZW5kLCAmYW1wO25pZCk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgbnVtYWRiZygmcXVvdDtTZXR0aW5nIG1lbWJsb2NrIE5VTUEgbm9kZSBu
aWRbJWRdICZxdW90Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZxdW90O3N0YXJ0WyVseF0gZW5kWyVseF1cbiZxdW90Oyw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtzdGFydFslbGx4
XSBlbmRbJWx4XVxuJnF1b3Q7LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIG5pZCwgc3RhcnQsIHRoaXNfZW5kKTs8YnI+DQo8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtZW1ibG9ja19zZXRfbm9kZShzdGFydCwgdGhp
c19lbmQgLSBzdGFydCw8YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbXZlYnUtbWJ1cy5j
IGIvZHJpdmVycy9idXMvbXZlYnUtbWJ1cy5jPGJyPg0KaW5kZXggNWIyYTExYTg4OTUxLi4yNTE5
Y2VlZGU2NGIgMTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVycy9idXMvbXZlYnUtbWJ1cy5jPGJyPg0K
KysrIGIvZHJpdmVycy9idXMvbXZlYnUtbWJ1cy5jPGJyPg0KQEAgLTYxMCwyMyArNjEwLDIzIEBA
IHN0YXRpYyB1bnNpZ25lZCBpbnQgYXJtYWRhX3hwX21idXNfd2luX3JlbWFwX29mZnNldChpbnQg
d2luKTxicj4NCsKgc3RhdGljIHZvaWQgX19pbml0PGJyPg0KwqBtdmVidV9tYnVzX2ZpbmRfYnJp
ZGdlX2hvbGUodWludDY0X3QgKnN0YXJ0LCB1aW50NjRfdCAqZW5kKTxicj4NCsKgezxicj4NCi3C
oCDCoCDCoCDCoHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnI7PGJyPg0KLcKgIMKgIMKgIMKgdWlu
dDY0X3QgcyA9IDA7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3QgcmVnX3N0YXJ0LCByZWdf
ZW5kOzxicj4NCivCoCDCoCDCoCDCoHVpbnQ2NF90IGksIHMgPSAwOzxicj4NCjxicj4NCi3CoCDC
oCDCoCDCoGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcikgezxicj4NCivCoCDCoCDCoCDCoGZv
cl9lYWNoX21lbV9yYW5nZShpLCAmYW1wO3JlZ19zdGFydCwgJmFtcDtyZWdfZW5kKSB7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCogVGhpcyBwYXJ0IG9mIHRoZSBtZW1vcnkgaXMgYWJvdmUgNCBHQiwgc28gd2UgZG9uJiMzOTt0
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIGNhcmUgZm9yIHRoZSBNQnVzIGJyaWRn
ZSBob2xlLjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAoci0mZ3Q7YmFzZSAmZ3Q7PSAweDEwMDAwMDAwMFVMTCk8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmVnX3N0YXJ0ICZndDs9IDB4MTAwMDAwMDAwVUxM
KTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnRpbnVlOzxicj4N
Cjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAqIFRoZSBNQnVzIGJyaWRnZSBob2xlIGlzIGF0IHRoZSBlbmQgb2YgdGhlIFJBTSB1
bmRlcjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiB0aGUgNCBHQiBsaW1pdC48YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKHItJmd0O2Jhc2UgKyByLSZndDtzaXplICZndDsgcyk8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzID0gci0mZ3Q7YmFzZSArIHItJmd0O3NpemU7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJlZ19lbmQgJmd0OyBzKTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHMgPSByZWdfZW5kOzxicj4NCsKgIMKgIMKgIMKg
IH08YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCAqc3RhcnQgPSBzOzxicj4NCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3MzOTAvY2hhci96Y29yZS5jIGIvZHJpdmVycy9zMzkwL2NoYXIvemNvcmUuYzxicj4N
CmluZGV4IDA4ZjgxMjQ3NWY1ZS4uNDg0YjFlYzlhMWJjIDEwMDY0NDxicj4NCi0tLSBhL2RyaXZl
cnMvczM5MC9jaGFyL3pjb3JlLmM8YnI+DQorKysgYi9kcml2ZXJzL3MzOTAvY2hhci96Y29yZS5j
PGJyPg0KQEAgLTE0OCwxOCArMTQ4LDE5IEBAIHN0YXRpYyBzc2l6ZV90IHpjb3JlX21lbW1hcF9y
ZWFkKHN0cnVjdCBmaWxlICpmaWxwLCBjaGFyIF9fdXNlciAqYnVmLDxicj4NCjxicj4NCsKgc3Rh
dGljIGludCB6Y29yZV9tZW1tYXBfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmls
ZSAqZmlscCk8YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9u
ICpyZWc7PGJyPg0KK8KgIMKgIMKgIMKgcGh5c19hZGRyX3Qgc3RhcnQsIGVuZDs8YnI+DQrCoCDC
oCDCoCDCoCBjaGFyICpidWY7PGJyPg0KwqAgwqAgwqAgwqAgaW50IGkgPSAwOzxicj4NCivCoCDC
oCDCoCDCoHU2NCByOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGJ1ZiA9IGtjYWxsb2MobWVtYmxv
Y2subWVtb3J5LmNudCwgQ0hVTktfSU5GT19TSVpFLCBHRlBfS0VSTkVMKTs8YnI+DQrCoCDCoCDC
oCDCoCBpZiAoIWJ1Zikgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAtRU5P
TUVNOzxicj4NCsKgIMKgIMKgIMKgIH08YnI+DQotwqAgwqAgwqAgwqBmb3JfZWFjaF9tZW1ibG9j
ayhtZW1vcnksIHJlZykgezxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX21lbV9yYW5nZShyLCAm
YW1wO3N0YXJ0LCAmYW1wO2VuZCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNwcmlu
dGYoYnVmICsgKGkrKyAqIENIVU5LX0lORk9fU0laRSksICZxdW90OyUwMTZsbHggJTAxNmxseCAm
cXVvdDssPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKHVuc2lnbmVk
IGxvbmcgbG9uZykgcmVnLSZndDtiYXNlLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCh1bnNpZ25lZCBsb25nIGxvbmcpIHJlZy0mZ3Q7c2l6ZSk7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKHVuc2lnbmVkIGxvbmcgbG9uZykgc3RhcnQs
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKHVuc2lnbmVkIGxvbmcg
bG9uZykgKGVuZCAtIHN0YXJ0KSk7PGJyPg0KwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKg
IGZpbHAtJmd0O3ByaXZhdGVfZGF0YSA9IGJ1Zjs8YnI+DQrCoCDCoCDCoCDCoCByZXR1cm4gbm9u
c2Vla2FibGVfb3Blbihpbm9kZSwgZmlscCk7PGJyPg0KLS0gPGJyPg0KMi4yNi4yPGJyPg0KPGJy
Pg0KPGJyPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188
YnI+DQpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3Q8YnI+DQo8YSBocmVmPSJtYWlsdG86bGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZyIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5saW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnPC9hPjxicj4NCjxh
IGhyZWY9Imh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YiIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2PC9hPjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--000000000000c4e10105ab81bcf4--
