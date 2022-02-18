Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4B4BB738
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 11:48:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0T1V2Nqgz3cZc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 21:47:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=hjizy4Gv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=hjizy4Gv; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0T0p22Mcz3cM5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 21:47:21 +1100 (AEDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3BD8340017
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645181234;
 bh=m68SKHYVMkKLCgGuzXph2sMvJL2KX6jKnMiXWjiPty0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=hjizy4GvyUtBmNUCtS6tIX3wV99GjeWI9BZyKMVfEnxwJyCIBZa3GbH9QJ/orGfGP
 Q4ZZCrt3YxgdGV3q8N4S0jtxZXOnkRLuiHty7UIRSJg8dE/CuTTB5322psukJflvWf
 HS4t+9fKzkT0dtNBCn/eqagph6yZlknlnh6JMwvfoI9FoEhkZyJ4rTiAY42pjmE3T1
 PEinkAz14QinbSR58C/eR892T/Lwon7zXVn1aM5xUTQ5dKNiCs3YOSelGmFCE1PxXq
 kCjbhYkANFn20EApFYbXlERXroiTl2Pnz0FsM7oAKKWaPTfmZpdh1R7w9QqjyyYT+S
 37hrsTv9NY8+A==
Received: by mail-ed1-f71.google.com with SMTP id
 m11-20020a056402430b00b00410678d119eso5261112edc.21
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 02:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m68SKHYVMkKLCgGuzXph2sMvJL2KX6jKnMiXWjiPty0=;
 b=tFA+rnNhSUhW+MkqqN6byEEoXvpkPFQ4W3CuT1Rql2B1UlUrsL+xpPe5upuILD/Mx/
 0r+ouEBaOmC8XY2sb2Zx23e5DcQKu1f4N5658i6nclVsnnAXti8sdMkZODRwvQ8yyLS6
 KhyIznzKh/2A7q6GMFr7cvs0sthreV+PRyqaYi6pbMFR74/wOnVTYomdse3VAjDuY2CK
 EPsGfHUIhV2KcRIpZRgvZ1U0/kXRni2lI0FSr6rrloc/fG7DcBhyEd1OCCNvL9nTXW+a
 X+9mUQr3BxJkDHYcI1kST4ofw5AI49l8UUzvp1dUrjiEuRII0irspJdmsQuTYqPKkyBz
 JrLg==
X-Gm-Message-State: AOAM531XJv3s7PECrUPNqn5G7rcSz/Evf4zoiI1EmMyepQow0GsZOAlB
 2seEtZ/ClobgqHTJTA61l3SrTxvJCZQ2YOVtvha/MmKgzZVEsk17YGpXeo2Ar7r77LvIU/QzxK0
 USrz2RmhWqbMyCV/9nToJSgJJGe4Zzy8Tda48bx9nJjb2PfOk1mmqSw/N920=
X-Received: by 2002:a05:6402:3591:b0:412:95d3:4aed with SMTP id
 y17-20020a056402359100b0041295d34aedmr7657705edc.450.1645181232018; 
 Fri, 18 Feb 2022 02:47:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZakqcqW/WkAeatJRwTX0nv59DdaEoUz6vOXj4o9GihRBs5oIctYAUQPJEUwQR+VW8I32/k6d2oLi0k9y2OXw=
X-Received: by 2002:a05:6402:3591:b0:412:95d3:4aed with SMTP id
 y17-20020a056402359100b0041295d34aedmr7657668edc.450.1645181231665; Fri, 18
 Feb 2022 02:47:11 -0800 (PST)
MIME-Version: 1.0
References: <mhng-4d503326-d18d-4155-a595-91dc15cfb4f1@palmerdabbelt-glaptop>
 <5846825d-cd7e-5085-569e-17cfaf36630f@ghiti.fr>
 <c6da1d52-380a-715a-8432-87e6a79bf7be@ghiti.fr>
 <b67e091d-7be0-7f8b-4ef2-0a97936a1d34@ghiti.fr>
In-Reply-To: <b67e091d-7be0-7f8b-4ef2-0a97936a1d34@ghiti.fr>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 18 Feb 2022 11:47:00 +0100
Message-ID: <CA+zEjCurCYeOdPdfJ23MwhJXE4ApQ+m3oHvs_ge8Jz5PYM45OA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] riscv: Introduce CONFIG_RELOCATABLE
To: Alexandre ghiti <alex@ghiti.fr>
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 paulus@samba.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Palmer,

Do you intend to pull that in for-next or not yet? Can I do something to help?

Thanks,

Alex

On Mon, Jan 10, 2022 at 9:05 AM Alexandre ghiti <alex@ghiti.fr> wrote:
>
> Hi Palmer,
>
> Do you think this could go in for-next?
>
> Thanks,
>
> Alex
>
> On 12/6/21 10:44, Alexandre ghiti wrote:
> > @Palmer, can I do anything for that to be pulled in 5.17?
> >
> > Thanks,
> >
> > Alex
> >
> > On 10/27/21 07:04, Alexandre ghiti wrote:
> >> Hi Palmer,
> >>
> >> On 10/26/21 11:29 PM, Palmer Dabbelt wrote:
> >>> On Sat, 09 Oct 2021 10:20:20 PDT (-0700), alex@ghiti.fr wrote:
> >>>> Arf, I have sent this patchset with the wrong email address. @Palmer
> >>>> tell me if you want me to resend it correctly.
> >>> Sorry for being kind of slow here.  It's fine: there's a "From:" in
> >>> the patch, and git picks those up so it'll match the signed-off-by
> >>> line.  I send pretty much all my patches that way, as I never managed
> >>> to get my Google address working correctly.
> >>>
> >>>> Thanks,
> >>>>
> >>>> Alex
> >>>>
> >>>> On 10/9/21 7:12 PM, Alexandre Ghiti wrote:
> >>>>> From: Alexandre Ghiti <alex@ghiti.fr>
> >>>>>
> >>>>> This config allows to compile 64b kernel as PIE and to relocate it at
> >>>>> any virtual address at runtime: this paves the way to KASLR.
> >>>>> Runtime relocation is possible since relocation metadata are
> >>>>> embedded into
> >>>>> the kernel.
> >>> IMO this should really be user selectable, at a bare minimum so it's
> >>> testable.
> >>> I just sent along a patch to do that (my power's off at home, so email
> >>> is a bit
> >>> wacky right now).
> >>>
> >>> I haven't put this on for-next yet as I'm not sure if you had a fix
> >>> for the
> >>> kasan issue (which IIUC would conflict with this).
> >>
> >> The kasan issue only revealed that I need to move the kasan shadow
> >> memory around with sv48 support, that's not related to the relocatable
> >> kernel.
> >>
> >> Thanks,
> >>
> >> Alex
> >>
> >>
> >>>>> Note that relocating at runtime introduces an overhead even if the
> >>>>> kernel is loaded at the same address it was linked at and that the
> >>>>> compiler
> >>>>> options are those used in arm64 which uses the same RELA relocation
> >>>>> format.
> >>>>>
> >>>>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> >>>>> ---
> >>>>>   arch/riscv/Kconfig              | 12 ++++++++
> >>>>>   arch/riscv/Makefile             |  7 +++--
> >>>>>   arch/riscv/kernel/vmlinux.lds.S |  6 ++++
> >>>>>   arch/riscv/mm/Makefile          |  4 +++
> >>>>>   arch/riscv/mm/init.c            | 54
> >>>>> ++++++++++++++++++++++++++++++++-
> >>>>>   5 files changed, 80 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>>>> index ea16fa2dd768..043ba92559fa 100644
> >>>>> --- a/arch/riscv/Kconfig
> >>>>> +++ b/arch/riscv/Kconfig
> >>>>> @@ -213,6 +213,18 @@ config PGTABLE_LEVELS
> >>>>>   config LOCKDEP_SUPPORT
> >>>>>       def_bool y
> >>>>>
> >>>>> +config RELOCATABLE
> >>>>> +    bool
> >>>>> +    depends on MMU && 64BIT && !XIP_KERNEL
> >>>>> +    help
> >>>>> +          This builds a kernel as a Position Independent Executable
> >>>>> (PIE),
> >>>>> +          which retains all relocation metadata required to
> >>>>> relocate the
> >>>>> +          kernel binary at runtime to a different virtual address
> >>>>> than the
> >>>>> +          address it was linked at.
> >>>>> +          Since RISCV uses the RELA relocation format, this
> >>>>> requires a
> >>>>> +          relocation pass at runtime even if the kernel is loaded
> >>>>> at the
> >>>>> +          same address it was linked at.
> >>>>> +
> >>>>>   source "arch/riscv/Kconfig.socs"
> >>>>>   source "arch/riscv/Kconfig.erratas"
> >>>>>
> >>>>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> >>>>> index 0eb4568fbd29..2f509915f246 100644
> >>>>> --- a/arch/riscv/Makefile
> >>>>> +++ b/arch/riscv/Makefile
> >>>>> @@ -9,9 +9,12 @@
> >>>>>   #
> >>>>>
> >>>>>   OBJCOPYFLAGS    := -O binary
> >>>>> -LDFLAGS_vmlinux :=
> >>>>> +ifeq ($(CONFIG_RELOCATABLE),y)
> >>>>> +    LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro
> >>>>> +    KBUILD_CFLAGS += -fPIE
> >>>>> +endif
> >>>>>   ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
> >>>>> -    LDFLAGS_vmlinux := --no-relax
> >>>>> +    LDFLAGS_vmlinux += --no-relax
> >>>>>       KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> >>>>>       CC_FLAGS_FTRACE := -fpatchable-function-entry=8
> >>>>>   endif
> >>>>> diff --git a/arch/riscv/kernel/vmlinux.lds.S
> >>>>> b/arch/riscv/kernel/vmlinux.lds.S
> >>>>> index 5104f3a871e3..862a8c09723c 100644
> >>>>> --- a/arch/riscv/kernel/vmlinux.lds.S
> >>>>> +++ b/arch/riscv/kernel/vmlinux.lds.S
> >>>>> @@ -133,6 +133,12 @@ SECTIONS
> >>>>>
> >>>>>       BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
> >>>>>
> >>>>> +    .rela.dyn : ALIGN(8) {
> >>>>> +        __rela_dyn_start = .;
> >>>>> +        *(.rela .rela*)
> >>>>> +        __rela_dyn_end = .;
> >>>>> +    }
> >>>>> +
> >>>>>   #ifdef CONFIG_EFI
> >>>>>       . = ALIGN(PECOFF_SECTION_ALIGNMENT);
> >>>>>       __pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
> >>>>> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> >>>>> index 7ebaef10ea1b..2d33ec574bbb 100644
> >>>>> --- a/arch/riscv/mm/Makefile
> >>>>> +++ b/arch/riscv/mm/Makefile
> >>>>> @@ -1,6 +1,10 @@
> >>>>>   # SPDX-License-Identifier: GPL-2.0-only
> >>>>>
> >>>>>   CFLAGS_init.o := -mcmodel=medany
> >>>>> +ifdef CONFIG_RELOCATABLE
> >>>>> +CFLAGS_init.o += -fno-pie
> >>>>> +endif
> >>>>> +
> >>>>>   ifdef CONFIG_FTRACE
> >>>>>   CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
> >>>>>   CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
> >>>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> >>>>> index c0cddf0fc22d..42041c12d496 100644
> >>>>> --- a/arch/riscv/mm/init.c
> >>>>> +++ b/arch/riscv/mm/init.c
> >>>>> @@ -20,6 +20,9 @@
> >>>>>   #include <linux/dma-map-ops.h>
> >>>>>   #include <linux/crash_dump.h>
> >>>>>   #include <linux/hugetlb.h>
> >>>>> +#ifdef CONFIG_RELOCATABLE
> >>>>> +#include <linux/elf.h>
> >>>>> +#endif
> >>>>>
> >>>>>   #include <asm/fixmap.h>
> >>>>>   #include <asm/tlbflush.h>
> >>>>> @@ -103,7 +106,7 @@ static void __init print_vm_layout(void)
> >>>>>       print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
> >>>>>             (unsigned long)high_memory);
> >>>>>   #ifdef CONFIG_64BIT
> >>>>> -    print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
> >>>>> +    print_mlm("kernel", (unsigned long)kernel_map.virt_addr,
> >>>>>             (unsigned long)ADDRESS_SPACE_END);
> >>>>>   #endif
> >>>>>   }
> >>>>> @@ -518,6 +521,44 @@ static __init pgprot_t pgprot_from_va(uintptr_t
> >>>>> va)
> >>>>>   #error "setup_vm() is called from head.S before relocate so it
> >>>>> should not use absolute addressing."
> >>>>>   #endif
> >>>>>
> >>>>> +#ifdef CONFIG_RELOCATABLE
> >>>>> +extern unsigned long __rela_dyn_start, __rela_dyn_end;
> >>>>> +
> >>>>> +static void __init relocate_kernel(void)
> >>>>> +{
> >>>>> +    Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
> >>>>> +    /*
> >>>>> +     * This holds the offset between the linked virtual address and
> >>>>> the
> >>>>> +     * relocated virtual address.
> >>>>> +     */
> >>>>> +    uintptr_t reloc_offset = kernel_map.virt_addr -
> >>>>> KERNEL_LINK_ADDR;
> >>>>> +    /*
> >>>>> +     * This holds the offset between kernel linked virtual
> >>>>> address and
> >>>>> +     * physical address.
> >>>>> +     */
> >>>>> +    uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR -
> >>>>> kernel_map.phys_addr;
> >>>>> +
> >>>>> +    for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
> >>>>> +        Elf64_Addr addr = (rela->r_offset -
> >>>>> va_kernel_link_pa_offset);
> >>>>> +        Elf64_Addr relocated_addr = rela->r_addend;
> >>>>> +
> >>>>> +        if (rela->r_info != R_RISCV_RELATIVE)
> >>>>> +            continue;
> >>>>> +
> >>>>> +        /*
> >>>>> +         * Make sure to not relocate vdso symbols like rt_sigreturn
> >>>>> +         * which are linked from the address 0 in vmlinux since
> >>>>> +         * vdso symbol addresses are actually used as an offset from
> >>>>> +         * mm->context.vdso in VDSO_OFFSET macro.
> >>>>> +         */
> >>>>> +        if (relocated_addr >= KERNEL_LINK_ADDR)
> >>>>> +            relocated_addr += reloc_offset;
> >>>>> +
> >>>>> +        *(Elf64_Addr *)addr = relocated_addr;
> >>>>> +    }
> >>>>> +}
> >>>>> +#endif /* CONFIG_RELOCATABLE */
> >>>>> +
> >>>>>   #ifdef CONFIG_XIP_KERNEL
> >>>>>   static void __init create_kernel_page_table(pgd_t *pgdir,
> >>>>>                           __always_unused bool early)
> >>>>> @@ -625,6 +666,17 @@ asmlinkage void __init setup_vm(uintptr_t
> >>>>> dtb_pa)
> >>>>>       BUG_ON((kernel_map.virt_addr + kernel_map.size) >
> >>>>> ADDRESS_SPACE_END - SZ_4K);
> >>>>>   #endif
> >>>>>
> >>>>> +#ifdef CONFIG_RELOCATABLE
> >>>>> +    /*
> >>>>> +     * Early page table uses only one PGDIR, which makes it possible
> >>>>> +     * to map PGDIR_SIZE aligned on PGDIR_SIZE: if the relocation
> >>>>> offset
> >>>>> +     * makes the kernel cross over a PGDIR_SIZE boundary, raise a
> >>>>> bug
> >>>>> +     * since a part of the kernel would not get mapped.
> >>>>> +     */
> >>>>> +    BUG_ON(PGDIR_SIZE - (kernel_map.virt_addr & (PGDIR_SIZE - 1)) <
> >>>>> kernel_map.size);
> >>>>> +    relocate_kernel();
> >>>>> +#endif
> >>>>> +
> >>>>>       pt_ops.alloc_pte = alloc_pte_early;
> >>>>>       pt_ops.get_pte_virt = get_pte_virt_early;
> >>>>>   #ifndef __PAGETABLE_PMD_FOLDED
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
