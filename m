Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3E81E1E0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 11:12:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WSrz3JkjzDqMf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 19:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=zong.li@sifive.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256
 header.s=google header.b=VB0IJCKf; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WSjM26lSzDqLh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 19:05:23 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id d7so15680938ote.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 02:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/3w8cfGBsTlHvqLR3U+lzLxG0Ht4yzZveld1byYqfS4=;
 b=VB0IJCKfeceglSmWrYCMOzzK7GXWJ4hwtocL1HEGjNNW4U4b6QJ5BK1aVDkqpR/U18
 npyMwOTswqlSNzj2MRqEtRkWkDa/QOxxOuYBWxTglilYJPp6heENCk8zPzN9yh+h6MGI
 W6bNICgB/Pe0AfkVS/WOOmlnpWJ16If/M8UmfUYHozbVT8PbYCt7IbXqdCXamvMQ97pU
 yzquI4R+cfbupQIRYq2xYetPGO135C/Dr/YAT0qekQkrCR7BreHsQJjJIU/VX08yqU7P
 p3GIh9+XAlAbL75y+buQOSPqSLG7Y502TJOQ8fiW0Tuwle7Vmg7xu4715ncyO9khMqEp
 +/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/3w8cfGBsTlHvqLR3U+lzLxG0Ht4yzZveld1byYqfS4=;
 b=cxPO88vxHIeBVc7JCFqSQdA/GjULldbOdLX4xt2XFmW0Fj5tWLbBEh5bOnsCgX8qI2
 oySO5XsuXQu5KCCLkwlSJYEfgbkKySYhvDpn8dtPsjT+v4Hubdr21J39BXP0/EVpeqqi
 9ukEmqmzpEkbaHLefg/7RtUfDZN/06gIeIThmvX8og0QFLu+4ejlH1lzqdxM0hxRd/5l
 T+o94yd7IyfM9R44hI9soELYxdy023GHsWCGCWcune3zfIXr4dIOB1RzAe1Oke4Uduut
 KBTl91F3ebSu6HAaGoScibYUJGDL+jJxBL8kTr2xYX/EH3JRW7T87Ug1fySHuD2DHa18
 hiPQ==
X-Gm-Message-State: AOAM532HoRfs7qNd216kpYHrw/CUfEcjwxju74oZOFHZCSkzQU4FVieN
 FZaCYiWeLT6T/Ah+9lHwLgAOrj++b+SpkKkyiPuC3Q==
X-Google-Smtp-Source: ABdhPJyuhLPAc5N/uuqD7ThQ4bQVyc10oQff+CZam5oOrMDE1Nv7VD9kSzLXi5Z8w+uRHIMCDst3FTS9U8B07jRKupA=
X-Received: by 2002:a05:6830:1d69:: with SMTP id
 l9mr144061oti.127.1590483919866; 
 Tue, 26 May 2020 02:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200524085259.24784-1-alex@ghiti.fr>
 <20200524085259.24784-3-alex@ghiti.fr>
In-Reply-To: <20200524085259.24784-3-alex@ghiti.fr>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 26 May 2020 17:05:08 +0800
Message-ID: <CANXhq0pSutF8x6YfZS_d52sASnDpPVvH72Omq5LP-dcPmqD3Gw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: Introduce CONFIG_RELOCATABLE
To: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 May 2020 19:10:08 +1000
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 24, 2020 at 4:55 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> This config allows to compile the kernel as PIE and to relocate it at
> any virtual address at runtime: this paves the way to KASLR and to 4-level
> page table folding at runtime. Runtime relocation is possible since
> relocation metadata are embedded into the kernel.
>
> Note that relocating at runtime introduces an overhead even if the
> kernel is loaded at the same address it was linked at and that the compiler
> options are those used in arm64 which uses the same RELA relocation
> format.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/Kconfig              | 12 +++++++
>  arch/riscv/Makefile             |  5 ++-
>  arch/riscv/kernel/vmlinux.lds.S |  6 ++--
>  arch/riscv/mm/Makefile          |  4 +++
>  arch/riscv/mm/init.c            | 63 +++++++++++++++++++++++++++++++++
>  5 files changed, 87 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a31e1a41913a..93127d5913fe 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -170,6 +170,18 @@ config PGTABLE_LEVELS
>         default 3 if 64BIT
>         default 2
>
> +config RELOCATABLE
> +       bool
> +       depends on MMU
> +       help
> +          This builds a kernel as a Position Independent Executable (PIE),
> +          which retains all relocation metadata required to relocate the
> +          kernel binary at runtime to a different virtual address than the
> +          address it was linked at.
> +          Since RISCV uses the RELA relocation format, this requires a
> +          relocation pass at runtime even if the kernel is loaded at the
> +          same address it was linked at.
> +
>  source "arch/riscv/Kconfig.socs"
>
>  menu "Platform type"
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index fb6e37db836d..1406416ea743 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -9,7 +9,10 @@
>  #
>
>  OBJCOPYFLAGS    := -O binary
> -LDFLAGS_vmlinux :=
> +ifeq ($(CONFIG_RELOCATABLE),y)
> +LDFLAGS_vmlinux := -shared -Bsymbolic -z notext -z norelro
> +KBUILD_CFLAGS += -fPIE
> +endif
>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>         LDFLAGS_vmlinux := --no-relax
>  endif
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index a9abde62909f..e8ffba8c2044 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -85,8 +85,10 @@ SECTIONS
>
>         BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
>
> -       .rel.dyn : {
> -               *(.rel.dyn*)
> +       .rela.dyn : ALIGN(8) {
> +               __rela_dyn_start = .;
> +               *(.rela .rela*)
> +               __rela_dyn_end = .;
>         }
>
>         _end = .;
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index 363ef01c30b1..dc5cdaa80bc1 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -1,6 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  CFLAGS_init.o := -mcmodel=medany
> +ifdef CONFIG_RELOCATABLE
> +CFLAGS_init.o += -fno-pie
> +endif
> +
>  ifdef CONFIG_FTRACE
>  CFLAGS_REMOVE_init.o = -pg
>  endif
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 17f108baec4f..7074522d40c6 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -13,6 +13,9 @@
>  #include <linux/of_fdt.h>
>  #include <linux/libfdt.h>
>  #include <linux/set_memory.h>
> +#ifdef CONFIG_RELOCATABLE
> +#include <linux/elf.h>
> +#endif
>
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
> @@ -379,6 +382,53 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
>  #endif
>
> +#ifdef CONFIG_RELOCATABLE
> +extern unsigned long __rela_dyn_start, __rela_dyn_end;
> +
> +#ifdef CONFIG_64BIT
> +#define Elf_Rela Elf64_Rela
> +#define Elf_Addr Elf64_Addr
> +#else
> +#define Elf_Rela Elf32_Rela
> +#define Elf_Addr Elf32_Addr
> +#endif
> +
> +void __init relocate_kernel(uintptr_t load_pa)
> +{
> +       Elf_Rela *rela = (Elf_Rela *)&__rela_dyn_start;
> +       /*
> +        * This holds the offset between the linked virtual address and the
> +        * relocated virtual address.
> +        */
> +       uintptr_t reloc_offset = kernel_virt_addr - KERNEL_LINK_ADDR;
> +       /*
> +        * This holds the offset between kernel linked virtual address and
> +        * physical address.
> +        */
> +       uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - load_pa;
> +
> +       for ( ; rela < (Elf_Rela *)&__rela_dyn_end; rela++) {
> +               Elf_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
> +               Elf_Addr relocated_addr = rela->r_addend;
> +
> +               if (rela->r_info != R_RISCV_RELATIVE)
> +                       continue;
> +
> +               /*
> +                * Make sure to not relocate vdso symbols like rt_sigreturn
> +                * which are linked from the address 0 in vmlinux since
> +                * vdso symbol addresses are actually used as an offset from
> +                * mm->context.vdso in VDSO_OFFSET macro.
> +                */
> +               if (relocated_addr >= KERNEL_LINK_ADDR)
> +                       relocated_addr += reloc_offset;
> +
> +               *(Elf_Addr *)addr = relocated_addr;
> +       }
> +}
> +
> +#endif
> +
>  static uintptr_t load_pa, load_sz;
>
>  void create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> @@ -405,6 +455,19 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>
>         pfn_base = PFN_DOWN(load_pa);
>
> +#ifdef CONFIG_RELOCATABLE
> +#ifdef CONFIG_64BIT
> +       /*
> +        * Early page table uses only one PGDIR, which makes it possible
> +        * to map PGDIR_SIZE aligned on PGDIR_SIZE: if the relocation offset
> +        * makes the kernel cross over a PGDIR_SIZE boundary, raise a bug
> +        * since a part of the kernel would not get mapped.
> +        * This cannot happen on rv32 as we use the entire page directory level.
> +        */
> +       BUG_ON(PGDIR_SIZE - (kernel_virt_addr & (PGDIR_SIZE - 1)) < load_sz);
> +#endif
> +       relocate_kernel(load_pa);
> +#endif
>         /*
>          * Enforce boot alignment requirements of RV32 and
>          * RV64 by only allowing PMD or PGD mappings.
> --
> 2.20.1
>

Looks good to me.

Reviewed-by: Zong Li <zong.li@sifive.com>
