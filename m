Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CB21B1B0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 03:07:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495lm73wjGzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 11:07:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZkYc7EGn; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495lhx2DpDzDqyv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 11:04:49 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id re23so9590292ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 18:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bw0H72jx6pKc1XfewY4OWR4y4jU61A7BS6gM7CznPOM=;
 b=ZkYc7EGnTYPFeQODxX/5C+K65CjTsAML87pceTH1xUswUZB3C620iZ7EL43PMveqni
 s+2dK21MzBc4XqFZ6vCeWJ0Bu74JwW4MQNX3sFjmH7cI7G6mN59SMGroqP4ZoWyonKdB
 OXrLEWV13/59o574QIG4dw+SJ7GEgbSjWAaks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bw0H72jx6pKc1XfewY4OWR4y4jU61A7BS6gM7CznPOM=;
 b=V9557mgZ4HcFoILsCP7xVgGCLcJCw7QngkY5FYD3FrEfKbQvmBIcahCSOr3K3M3ciz
 GoQPKKbj3RCIEYb/s6sXytt9v71kRSXYnkkzMtB5dQG5BzXr5nQ9QdaR7eEX1mDCa5X/
 3ylSuFXJAosOaYdF7LuUBTA6VtfYqlSwfGhlh24C5T4zBNOFhq/fLWmEJO9eKeJW/SrM
 qlY8q8gcUdankv4oh77z0DPZczJyaRuWfBK1WVISdWIWmdJnLyGSvs8uzHZ2ySXQ5Z2z
 uYdMi67U7P6S6vXfc3lMzoFjKq6rL2ZHZ65rXGkIyZ3gQ4S9hDmEZX+xCqs73C19TW4F
 Jejg==
X-Gm-Message-State: AGi0PuZsv2yjCZGJvdz1VTomiVU0VAYefYmKJXfqPMpm2NHCT86vHThu
 9hUhIWW4PcnWhioKQ0xOlviypwA5Ca8QhdmAS8M=
X-Google-Smtp-Source: APiQypILnf+SDrzSHmqUpbVIuqQydZRMOLbn+YlvaEoIZ+Fv03W2AH8wkbQKMLrxIIPROAO/PVvFLCF/LlVPBekBnV0=
X-Received: by 2002:a17:906:2548:: with SMTP id
 j8mr18474009ejb.378.1587431085655; 
 Mon, 20 Apr 2020 18:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
 <8a6d7e45f7904c73a0af539642d3962e2a3c7268.1587407777.git.christophe.leroy@c-s.fr>
In-Reply-To: <8a6d7e45f7904c73a0af539642d3962e2a3c7268.1587407777.git.christophe.leroy@c-s.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Apr 2020 01:04:33 +0000
Message-ID: <CACPK8XcK9_m3mz+sCVhgAfPYQ6yG4sPfF18w=8wBdFa1aSC5MA@mail.gmail.com>
Subject: Re: [PATCH 3/5] powerpc: Replace _ALIGN_UP() by ALIGN()
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Apr 2020 at 18:39, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>
> _ALIGN_UP() is specific to powerpc
> ALIGN() is generic and does the same
>
> Replace _ALIGN_UP() by ALIGN()
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/powerpc/include/asm/iommu.h             |  4 ++--
>  arch/powerpc/kernel/head_booke.h             |  2 +-
>  arch/powerpc/kernel/nvram_64.c               |  4 ++--
>  arch/powerpc/kernel/pci_64.c                 |  2 +-
>  arch/powerpc/kernel/prom.c                   |  4 ++--
>  arch/powerpc/kernel/prom_init.c              |  8 ++++----
>  arch/powerpc/kvm/book3s_64_vio_hv.c          |  2 +-
>  arch/powerpc/mm/book3s64/hash_tlb.c          |  2 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c     |  2 +-
>  arch/powerpc/mm/slice.c                      |  2 +-
>  arch/powerpc/platforms/cell/iommu.c          |  6 +++---
>  arch/powerpc/platforms/powermac/bootx_init.c | 10 +++++-----
>  arch/powerpc/platforms/powernv/pci-ioda.c    |  8 ++++----
>  arch/powerpc/platforms/ps3/mm.c              | 16 ++++++++--------
>  arch/powerpc/platforms/ps3/setup.c           |  2 +-
>  15 files changed, 37 insertions(+), 37 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index 350101e11ddb..5032f1593299 100644
> --- a/arch/powerpc/include/asm/iommu.h
> +++ b/arch/powerpc/include/asm/iommu.h
> @@ -22,11 +22,11 @@
>  #define IOMMU_PAGE_SHIFT_4K      12
>  #define IOMMU_PAGE_SIZE_4K       (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K)
>  #define IOMMU_PAGE_MASK_4K       (~((1 << IOMMU_PAGE_SHIFT_4K) - 1))
> -#define IOMMU_PAGE_ALIGN_4K(addr) _ALIGN_UP(addr, IOMMU_PAGE_SIZE_4K)
> +#define IOMMU_PAGE_ALIGN_4K(addr) ALIGN(addr, IOMMU_PAGE_SIZE_4K)
>
>  #define IOMMU_PAGE_SIZE(tblptr) (ASM_CONST(1) << (tblptr)->it_page_shift)
>  #define IOMMU_PAGE_MASK(tblptr) (~((1 << (tblptr)->it_page_shift) - 1))
> -#define IOMMU_PAGE_ALIGN(addr, tblptr) _ALIGN_UP(addr, IOMMU_PAGE_SIZE(tblptr))
> +#define IOMMU_PAGE_ALIGN(addr, tblptr) ALIGN(addr, IOMMU_PAGE_SIZE(tblptr))
>
>  /* Boot time flags */
>  extern int iommu_is_off;
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
> index bd2e5ed8dd50..18f87bf9e32b 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -534,7 +534,7 @@ struct exception_regs {
>  };
>
>  /* ensure this structure is always sized to a multiple of the stack alignment */
> -#define STACK_EXC_LVL_FRAME_SIZE       _ALIGN_UP(sizeof (struct exception_regs), 16)
> +#define STACK_EXC_LVL_FRAME_SIZE       ALIGN(sizeof (struct exception_regs), 16)
>
>  #endif /* __ASSEMBLY__ */
>  #endif /* __HEAD_BOOKE_H__ */
> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> index fb4f61096613..314780e8ef78 100644
> --- a/arch/powerpc/kernel/nvram_64.c
> +++ b/arch/powerpc/kernel/nvram_64.c
> @@ -854,8 +854,8 @@ loff_t __init nvram_create_partition(const char *name, int sig,
>         BUILD_BUG_ON(NVRAM_BLOCK_LEN != 16);
>
>         /* Convert sizes from bytes to blocks */
> -       req_size = _ALIGN_UP(req_size, NVRAM_BLOCK_LEN) / NVRAM_BLOCK_LEN;
> -       min_size = _ALIGN_UP(min_size, NVRAM_BLOCK_LEN) / NVRAM_BLOCK_LEN;
> +       req_size = ALIGN(req_size, NVRAM_BLOCK_LEN) / NVRAM_BLOCK_LEN;
> +       min_size = ALIGN(min_size, NVRAM_BLOCK_LEN) / NVRAM_BLOCK_LEN;
>
>         /* If no minimum size specified, make it the same as the
>          * requested size
> diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
> index e5d05af5a9af..ff8e3fbdf663 100644
> --- a/arch/powerpc/kernel/pci_64.c
> +++ b/arch/powerpc/kernel/pci_64.c
> @@ -131,7 +131,7 @@ static int pcibios_map_phb_io_space(struct pci_controller *hose)
>         unsigned long io_virt_offset;
>
>         phys_page = ALIGN_DOWN(hose->io_base_phys, PAGE_SIZE);
> -       size_page = _ALIGN_UP(hose->pci_io_size, PAGE_SIZE);
> +       size_page = ALIGN(hose->pci_io_size, PAGE_SIZE);
>
>         /* Make sure IO area address is clear */
>         hose->io_base_alloc = NULL;
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 10b5d5eafd34..1dcf0e214a22 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -97,7 +97,7 @@ static inline int overlaps_initrd(unsigned long start, unsigned long size)
>                 return 0;
>
>         return  (start + size) > ALIGN_DOWN(initrd_start, PAGE_SIZE) &&
> -                       start <= _ALIGN_UP(initrd_end, PAGE_SIZE);
> +                       start <= ALIGN(initrd_end, PAGE_SIZE);
>  #else
>         return 0;
>  #endif
> @@ -624,7 +624,7 @@ static void __init early_reserve_mem(void)
>         /* Then reserve the initrd, if any */
>         if (initrd_start && (initrd_end > initrd_start)) {
>                 memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
> -                       _ALIGN_UP(initrd_end, PAGE_SIZE) -
> +                       ALIGN(initrd_end, PAGE_SIZE) -
>                         ALIGN_DOWN(initrd_start, PAGE_SIZE));
>         }
>  #endif /* CONFIG_BLK_DEV_INITRD */
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 4cf5958eebd4..3a5a7db4564f 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1449,18 +1449,18 @@ static unsigned long __init alloc_up(unsigned long size, unsigned long align)
>         unsigned long addr = 0;
>
>         if (align)
> -               base = _ALIGN_UP(base, align);
> +               base = ALIGN(base, align);
>         prom_debug("%s(%lx, %lx)\n", __func__, size, align);
>         if (ram_top == 0)
>                 prom_panic("alloc_up() called with mem not initialized\n");
>
>         if (align)
> -               base = _ALIGN_UP(alloc_bottom, align);
> +               base = ALIGN(alloc_bottom, align);
>         else
>                 base = alloc_bottom;
>
>         for(; (base + size) <= alloc_top;
> -           base = _ALIGN_UP(base + 0x100000, align)) {
> +           base = ALIGN(base + 0x100000, align)) {
>                 prom_debug("    trying: 0x%lx\n\r", base);
>                 addr = (unsigned long)prom_claim(base, size, 0);
>                 if (addr != PROM_ERROR && addr != 0)
> @@ -1587,7 +1587,7 @@ static void __init reserve_mem(u64 base, u64 size)
>          * dumb and just copy this entire array to the boot params
>          */
>         base = ALIGN_DOWN(base, PAGE_SIZE);
> -       top = _ALIGN_UP(top, PAGE_SIZE);
> +       top = ALIGN(top, PAGE_SIZE);
>         size = top - base;
>
>         if (cnt >= (MEM_RESERVE_MAP_SIZE - 1))
> diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
> index 6fcaf1fa8e02..2d231eb5884a 100644
> --- a/arch/powerpc/kvm/book3s_64_vio_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
> @@ -208,7 +208,7 @@ static long kvmppc_rm_ioba_validate(struct kvmppc_spapr_tce_table *stt,
>
>         idx = (ioba >> stt->page_shift) - stt->offset;
>         sttpage = idx / TCES_PER_PAGE;
> -       sttpages = _ALIGN_UP(idx % TCES_PER_PAGE + npages, TCES_PER_PAGE) /
> +       sttpages = ALIGN(idx % TCES_PER_PAGE + npages, TCES_PER_PAGE) /
>                         TCES_PER_PAGE;
>         for (i = sttpage; i < sttpage + sttpages; ++i)
>                 if (!stt->pages[i])
> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
> index 2242d022b620..081940b85e24 100644
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -197,7 +197,7 @@ void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
>         unsigned long flags;
>
>         start = ALIGN_DOWN(start, PAGE_SIZE);
> -       end = _ALIGN_UP(end, PAGE_SIZE);
> +       end = ALIGN(end, PAGE_SIZE);
>
>         BUG_ON(!mm->pgd);
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 8f9edf07063a..4bdfc8dff87d 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -261,7 +261,7 @@ static int __meminit create_physical_mapping(unsigned long start,
>         pgprot_t prot;
>         int psize;
>
> -       start = _ALIGN_UP(start, PAGE_SIZE);
> +       start = ALIGN(start, PAGE_SIZE);
>         for (addr = start; addr < end; addr += mapping_size) {
>                 unsigned long gap, previous_size;
>                 int rc;
> diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
> index dffe1a45b6ed..82b45b1cb973 100644
> --- a/arch/powerpc/mm/slice.c
> +++ b/arch/powerpc/mm/slice.c
> @@ -478,7 +478,7 @@ unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long len,
>
>         /* If hint, make sure it matches our alignment restrictions */
>         if (!fixed && addr) {
> -               addr = _ALIGN_UP(addr, page_size);
> +               addr = ALIGN(addr, page_size);
>                 slice_dbg(" aligned addr=%lx\n", addr);
>                 /* Ignore hint if it's too large or overlaps a VMA */
>                 if (addr > high_limit - len || addr < mmap_min_addr ||
> diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
> index ca9ffc1c8685..2124831cf57c 100644
> --- a/arch/powerpc/platforms/cell/iommu.c
> +++ b/arch/powerpc/platforms/cell/iommu.c
> @@ -943,7 +943,7 @@ static int __init cell_iommu_fixed_mapping_init(void)
>                 fbase = max(fbase, dbase + dsize);
>         }
>
> -       fbase = _ALIGN_UP(fbase, 1 << IO_SEGMENT_SHIFT);
> +       fbase = ALIGN(fbase, 1 << IO_SEGMENT_SHIFT);
>         fsize = memblock_phys_mem_size();
>
>         if ((fbase + fsize) <= 0x800000000ul)
> @@ -963,8 +963,8 @@ static int __init cell_iommu_fixed_mapping_init(void)
>                 hend  = hbase + htab_size_bytes;
>
>                 /* The window must start and end on a segment boundary */
> -               if ((hbase != _ALIGN_UP(hbase, 1 << IO_SEGMENT_SHIFT)) ||
> -                   (hend != _ALIGN_UP(hend, 1 << IO_SEGMENT_SHIFT))) {
> +               if ((hbase != ALIGN(hbase, 1 << IO_SEGMENT_SHIFT)) ||
> +                   (hend != ALIGN(hend, 1 << IO_SEGMENT_SHIFT))) {
>                         pr_debug("iommu: hash window not segment aligned\n");
>                         return -1;
>                 }
> diff --git a/arch/powerpc/platforms/powermac/bootx_init.c b/arch/powerpc/platforms/powermac/bootx_init.c
> index af309ee99114..c3374a90952f 100644
> --- a/arch/powerpc/platforms/powermac/bootx_init.c
> +++ b/arch/powerpc/platforms/powermac/bootx_init.c
> @@ -108,7 +108,7 @@ static void * __init bootx_early_getprop(unsigned long base,
>
>  #define dt_push_token(token, mem) \
>         do { \
> -               *(mem) = _ALIGN_UP(*(mem),4); \
> +               *(mem) = ALIGN(*(mem),4); \
>                 *((u32 *)*(mem)) = token; \
>                 *(mem) += 4; \
>         } while(0)
> @@ -150,7 +150,7 @@ static void __init bootx_dt_add_prop(char *name, void *data, int size,
>         /* push property content */
>         if (size && data) {
>                 memcpy((void *)*mem_end, data, size);
> -               *mem_end = _ALIGN_UP(*mem_end + size, 4);
> +               *mem_end = ALIGN(*mem_end + size, 4);
>         }
>  }
>
> @@ -303,7 +303,7 @@ static void __init bootx_scan_dt_build_struct(unsigned long base,
>                         *lp++ = *p;
>         }
>         *lp = 0;
> -       *mem_end = _ALIGN_UP((unsigned long)lp + 1, 4);
> +       *mem_end = ALIGN((unsigned long)lp + 1, 4);
>
>         /* get and store all properties */
>         while (*ppp) {
> @@ -356,11 +356,11 @@ static unsigned long __init bootx_flatten_dt(unsigned long start)
>         /* Start using memory after the big blob passed by BootX, get
>          * some space for the header
>          */
> -       mem_start = mem_end = _ALIGN_UP(((unsigned long)bi) + start, 4);
> +       mem_start = mem_end = ALIGN(((unsigned long)bi) + start, 4);
>         DBG("Boot params header at: %x\n", mem_start);
>         hdr = (struct boot_param_header *)mem_start;
>         mem_end += sizeof(struct boot_param_header);
> -       rsvmap = (u64 *)(_ALIGN_UP(mem_end, 8));
> +       rsvmap = (u64 *)(ALIGN(mem_end, 8));
>         hdr->off_mem_rsvmap = ((unsigned long)rsvmap) - mem_start;
>         mem_end = ((unsigned long)rsvmap) + 8 * sizeof(u64);
>
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 276b011cd45d..d1a16ebc31bb 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -265,7 +265,7 @@ static void pnv_ioda_reserve_dev_m64_pe(struct pci_dev *pdev,
>                         continue;
>
>                 start = ALIGN_DOWN(r->start - base, sgsz);
> -               end = _ALIGN_UP(r->end - base, sgsz);
> +               end = ALIGN(r->end - base, sgsz);
>                 for (segno = start / sgsz; segno < end / sgsz; segno++) {
>                         if (pe_bitmap)
>                                 set_bit(segno, pe_bitmap);
> @@ -361,7 +361,7 @@ static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
>                 return NULL;
>
>         /* Allocate bitmap */
> -       size = _ALIGN_UP(phb->ioda.total_pe_num / 8, sizeof(unsigned long));
> +       size = ALIGN(phb->ioda.total_pe_num / 8, sizeof(unsigned long));
>         pe_alloc = kzalloc(size, GFP_KERNEL);
>         if (!pe_alloc) {
>                 pr_warn("%s: Out of memory !\n",
> @@ -2537,7 +2537,7 @@ unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
>         direct_table_size =  1UL << table_shift;
>
>         for ( ; levels; --levels) {
> -               bytes += _ALIGN_UP(tce_table_size, direct_table_size);
> +               bytes += ALIGN(tce_table_size, direct_table_size);
>
>                 tce_table_size /= direct_table_size;
>                 tce_table_size <<= 3;
> @@ -3863,7 +3863,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
>                                 PNV_IODA1_DMA32_SEGSIZE;
>
>         /* Allocate aux data & arrays. We don't have IO ports on PHB3 */
> -       size = _ALIGN_UP(max_t(unsigned, phb->ioda.total_pe_num, 8) / 8,
> +       size = ALIGN(max_t(unsigned, phb->ioda.total_pe_num, 8) / 8,
>                         sizeof(unsigned long));
>         m64map_off = size;
>         size += phb->ioda.total_pe_num * sizeof(phb->ioda.m64_segmap[0]);
> diff --git a/arch/powerpc/platforms/ps3/mm.c b/arch/powerpc/platforms/ps3/mm.c
> index 71ed37f7f475..b83f2c851b40 100644
> --- a/arch/powerpc/platforms/ps3/mm.c
> +++ b/arch/powerpc/platforms/ps3/mm.c
> @@ -395,7 +395,7 @@ static struct dma_chunk * dma_find_chunk(struct ps3_dma_region *r,
>  {
>         struct dma_chunk *c;
>         unsigned long aligned_bus = ALIGN_DOWN(bus_addr, 1 << r->page_size);
> -       unsigned long aligned_len = _ALIGN_UP(len+bus_addr-aligned_bus,
> +       unsigned long aligned_len = ALIGN(len+bus_addr-aligned_bus,
>                                               1 << r->page_size);
>
>         list_for_each_entry(c, &r->chunk_list.head, link) {
> @@ -424,7 +424,7 @@ static struct dma_chunk *dma_find_chunk_lpar(struct ps3_dma_region *r,
>  {
>         struct dma_chunk *c;
>         unsigned long aligned_lpar = ALIGN_DOWN(lpar_addr, 1 << r->page_size);
> -       unsigned long aligned_len = _ALIGN_UP(len + lpar_addr - aligned_lpar,
> +       unsigned long aligned_len = ALIGN(len + lpar_addr - aligned_lpar,
>                                               1 << r->page_size);
>
>         list_for_each_entry(c, &r->chunk_list.head, link) {
> @@ -776,7 +776,7 @@ static int dma_sb_map_area(struct ps3_dma_region *r, unsigned long virt_addr,
>         unsigned long phys_addr = is_kernel_addr(virt_addr) ? __pa(virt_addr)
>                 : virt_addr;
>         unsigned long aligned_phys = ALIGN_DOWN(phys_addr, 1 << r->page_size);
> -       unsigned long aligned_len = _ALIGN_UP(len + phys_addr - aligned_phys,
> +       unsigned long aligned_len = ALIGN(len + phys_addr - aligned_phys,
>                                               1 << r->page_size);
>         *bus_addr = dma_sb_lpar_to_bus(r, ps3_mm_phys_to_lpar(phys_addr));
>
> @@ -831,7 +831,7 @@ static int dma_ioc0_map_area(struct ps3_dma_region *r, unsigned long virt_addr,
>         unsigned long phys_addr = is_kernel_addr(virt_addr) ? __pa(virt_addr)
>                 : virt_addr;
>         unsigned long aligned_phys = ALIGN_DOWN(phys_addr, 1 << r->page_size);
> -       unsigned long aligned_len = _ALIGN_UP(len + phys_addr - aligned_phys,
> +       unsigned long aligned_len = ALIGN(len + phys_addr - aligned_phys,
>                                               1 << r->page_size);
>
>         DBG(KERN_ERR "%s: vaddr=%#lx, len=%#lx\n", __func__,
> @@ -891,7 +891,7 @@ static int dma_sb_unmap_area(struct ps3_dma_region *r, dma_addr_t bus_addr,
>         if (!c) {
>                 unsigned long aligned_bus = ALIGN_DOWN(bus_addr,
>                         1 << r->page_size);
> -               unsigned long aligned_len = _ALIGN_UP(len + bus_addr
> +               unsigned long aligned_len = ALIGN(len + bus_addr
>                         - aligned_bus, 1 << r->page_size);
>                 DBG("%s:%d: not found: bus_addr %llxh\n",
>                         __func__, __LINE__, bus_addr);
> @@ -928,7 +928,7 @@ static int dma_ioc0_unmap_area(struct ps3_dma_region *r,
>         if (!c) {
>                 unsigned long aligned_bus = ALIGN_DOWN(bus_addr,
>                                                         1 << r->page_size);
> -               unsigned long aligned_len = _ALIGN_UP(len + bus_addr
> +               unsigned long aligned_len = ALIGN(len + bus_addr
>                                                       - aligned_bus,
>                                                       1 << r->page_size);
>                 DBG("%s:%d: not found: bus_addr %llxh\n",
> @@ -974,7 +974,7 @@ static int dma_sb_region_create_linear(struct ps3_dma_region *r)
>                         pr_info("%s:%d: forcing 16M pages for linear map\n",
>                                 __func__, __LINE__);
>                         r->page_size = PS3_DMA_16M;
> -                       r->len = _ALIGN_UP(r->len, 1 << r->page_size);
> +                       r->len = ALIGN(r->len, 1 << r->page_size);
>                 }
>         }
>
> @@ -1125,7 +1125,7 @@ int ps3_dma_region_init(struct ps3_system_bus_device *dev,
>         r->offset = lpar_addr;
>         if (r->offset >= map.rm.size)
>                 r->offset -= map.r1.offset;
> -       r->len = len ? len : _ALIGN_UP(map.total, 1 << r->page_size);
> +       r->len = len ? len : ALIGN(map.total, 1 << r->page_size);
>
>         switch (dev->dev_type) {
>         case PS3_DEVICE_TYPE_SB:
> diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
> index b29368931c56..e9ae5dd03593 100644
> --- a/arch/powerpc/platforms/ps3/setup.c
> +++ b/arch/powerpc/platforms/ps3/setup.c
> @@ -138,7 +138,7 @@ static int __init early_parse_ps3fb(char *p)
>         if (!p)
>                 return 1;
>
> -       ps3fb_videomemory.size = _ALIGN_UP(memparse(p, &p),
> +       ps3fb_videomemory.size = ALIGN(memparse(p, &p),
>                                            ps3fb_videomemory.align);
>         return 0;
>  }
> --
> 2.25.0
>
