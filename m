Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C024719CDBB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:11:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tgMr6zqdzDr4F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:11:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LrvPVNqU; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tgL24pdxzDrbt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 11:10:02 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id t25so4588470oij.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 17:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wHoPIrM14nmx2sMDEVEJUcjnxHBj6pXXHcRUTNiqnaM=;
 b=LrvPVNqUAkuIkvRkeYRHrl3y7UAI/9t0k/2hiY8B9HhcZqY/3LOdhWe19tVLHSeWL9
 xEiQ/m23B9TyTU4DawpOk8cKtwkZM+nvFNWOzunTM2MYs2fUGL5SA8XLZM62e4rZff3z
 Cc0p2IMlx4HgmRKQ/OW33GEQv1BixjNbh73lCSCC6FPRhie8FYfI4H7ZsfvclQOrEKt1
 qa866urqsz04KrpMxlIoO5nmOWIxAf/kpmpDxOpdbMrpsdp5kGlayJvCy1VrwzTcMTgJ
 B9D/oT4+z4TZHa2PrzZD336KLCbKxgXNcJ4I5+7FUIEfu8MK830hfQcOUrvQS96HmjNf
 gkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wHoPIrM14nmx2sMDEVEJUcjnxHBj6pXXHcRUTNiqnaM=;
 b=GbQRjyXKk1T4IxBuj03eh7w7mffIkgYZzEfhc8q+nj69xuK9mIDngCNTLt4OP4Dcta
 SsMUpUwwcVx3HkR9Loa8eBk45P0pY1DUrzFc4lRd/381kFx231m8T1eTVWEcSPMr0XfR
 cAtJnSm5cbkPIEpjyTXpAd6OG7pY81jcgOjyD8khVP3pnIP6rre5UXni+tgXntYLdvjm
 00gNewt5k4iNvRAFzv/L17hdoXZUB4BfZ913C7q6qtp3EOxW0dtc4ust1WC9gv0+P8YU
 nDivS9yeftx3IaZgjj7sUOG7SCNneqdVYYZZXhhsh4JfuzwiBjwvdtdPlGEhEvJt63gV
 vojw==
X-Gm-Message-State: AGi0PuaeFWaVGhsYVc1h+3sPwDN7hWd8aIINmlbfEPbjg5jY9POlPKVi
 MZk5nu191dwFfT6/TsbhK5N+/FuZw5dWE3UO88g=
X-Google-Smtp-Source: APiQypLnbISSj6sg7TswZp6oWHTlKlSWWskRXLl3nkq7yY1IAOEDTQnP3RG0mAsduLKDRy+dToz4YTXWR/Yfpq5Pd50=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr1278125oig.40.1585872597971; 
 Thu, 02 Apr 2020 17:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <1b00d41261edb8ce259978ff57c8c7d174fc7834.camel@linux.ibm.com>
 <CACzsE9rrEx9YaqiLt=yQReQjK=EEdv0Fw7=VUYE6nU8-0RFHZg@mail.gmail.com>
 <2945912.kUBOMaOL64@townsend>
In-Reply-To: <2945912.kUBOMaOL64@townsend>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 3 Apr 2020 11:09:45 +1100
Message-ID: <CACzsE9oFa8J+zc7be+EDBtyZU6MPE59vMVf6wHMmZSsOz1V7Ug@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] powerpc: Use a datatype for instructions
To: Alistair Popple <alistair@popple.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 3, 2020 at 10:45 AM Alistair Popple <alistair@popple.id.au> wrote:
>
> On Thursday, 2 April 2020 10:52:37 AM AEDT Jordan Niethe wrote:
> > On Wed, Apr 1, 2020 at 9:32 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
> > > On Fri, 2020-03-20 at 16:17 +1100, Jordan Niethe wrote:
> > > > Currently unsigned ints are used to represent instructions on powerpc.
> > > > This has worked well as instructions have always been 4 byte words.
> > > > However, a future ISA version will introduce some changes to
> > > > instructions that mean this scheme will no longer work as well. This
> > > > change is Prefixed Instructions. A prefixed instruction is made up of a
> > > > word prefix followed by a word suffix to make an 8 byte double word
> > > > instruction. No matter the endianess of the system the prefix always
> > > > comes first. Prefixed instructions are only planned for powerpc64.
> > > >
> > > > Introduce a ppc_inst type to represent both prefixed and word
> > > > instructions on powerpc64 while keeping it possible to exclusively have
> > > > word instructions on powerpc32, A latter patch will expand the type to
> > > > include prefixed instructions but for now just typedef it to a u32.
> > > >
> > > > Later patches will introduce helper functions and macros for
> > > > manipulating the instructions so that powerpc64 and powerpc32 might
> > > > maintain separate type definitions.
> > > >
> > > > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > > > ---
> > > >
> > > >  arch/powerpc/include/asm/code-patching.h | 31 +++++------
> > > >  arch/powerpc/include/asm/inst.h          | 53 +++++++++++++++++++
> > > >  arch/powerpc/include/asm/sstep.h         |  5 +-
> > > >  arch/powerpc/kernel/align.c              |  2 +-
> > > >  arch/powerpc/kernel/hw_breakpoint.c      |  3 +-
> > > >  arch/powerpc/kernel/kprobes.c            |  2 +-
> > > >  arch/powerpc/kernel/mce_power.c          |  5 +-
> > > >  arch/powerpc/kernel/optprobes.c          | 10 ++--
> > > >  arch/powerpc/kernel/trace/ftrace.c       | 66 ++++++++++++------------
> > > >  arch/powerpc/kvm/emulate_loadstore.c     |  1 +
> > > >  arch/powerpc/lib/code-patching.c         | 54 +++++++++----------
> > > >  arch/powerpc/lib/sstep.c                 |  4 +-
> > > >  arch/powerpc/lib/test_emulate_step.c     |  9 ++--
> > > >  arch/powerpc/xmon/xmon.c                 | 12 ++---
> > > >  14 files changed, 160 insertions(+), 97 deletions(-)
> > > >  create mode 100644 arch/powerpc/include/asm/inst.h
> > > >
> > > > diff --git a/arch/powerpc/include/asm/code-patching.h
> > > > b/arch/powerpc/include/asm/code-patching.h
> > > > index 898b54262881..cb5106f92d67 100644
> > > > --- a/arch/powerpc/include/asm/code-patching.h
> > > > +++ b/arch/powerpc/include/asm/code-patching.h
> > > > @@ -11,6 +11,7 @@
> > > >
> > > >  #include <linux/string.h>
> > > >  #include <linux/kallsyms.h>
> > > >  #include <asm/asm-compat.h>
> > > >
> > > > +#include <asm/inst.h>
> > > >
> > > >  /* Flags for create_branch:
> > > >   * "b"   == create_branch(addr, target, 0);
> > > >
> > > > @@ -22,27 +23,27 @@
> > > >
> > > >  #define BRANCH_ABSOLUTE      0x2
> > > >
> > > >  bool is_offset_in_branch_range(long offset);
> > > >
> > > > -unsigned int create_branch(const unsigned int *addr,
> > > > +ppc_inst create_branch(const ppc_inst *addr,
> > > >
> > > >                          unsigned long target, int flags);
> > > >
> > > > -unsigned int create_cond_branch(const unsigned int *addr,
> > > > +unsigned int create_cond_branch(const ppc_inst *addr,
> > > >
> > > >                               unsigned long target, int flags);
> > > >
> > > > -int patch_branch(unsigned int *addr, unsigned long target, int flags);
> > > > -int patch_instruction(unsigned int *addr, unsigned int instr);
> > > > -int raw_patch_instruction(unsigned int *addr, unsigned int instr);
> > > > +int patch_branch(ppc_inst *addr, unsigned long target, int flags);
> > > > +int patch_instruction(ppc_inst *addr, ppc_inst instr);
> > >
> > > we need to handle this change for its user in epapr_paravirt.c,
>
> Seeing a similar issue in kgdb.c:
>
> In file included from /linux/include/linux/kgdb.h:20,
>                  from /linux/arch/powerpc/kernel/kgdb.c:18:
> /linux/arch/powerpc/kernel/kgdb.c: In function 'kgdb_arch_set_breakpoint':
> /linux/arch/powerpc/include/asm/kgdb.h:30:22: error: incompatible type for argument 2 of 'patch_instruction'
>  #define BREAK_INSTR  0x7d821008 /* twge r2, r2 */
>                       ^~~~~~~~~~
> /linux/arch/powerpc/kernel/kgdb.c:427:32: note: in expansion of macro 'BREAK_INSTR'
>   err = patch_instruction(addr, BREAK_INSTR);
>                                 ^~~~~~~~~~~
> In file included from /linux/arch/powerpc/kernel/kgdb.c:27:
> /linux/arch/powerpc/include/asm/code-patching.h:31:44: note: expected 'ppc_inst' {aka 'struct ppc_inst'} but argument is of type 'int'
>  int patch_instruction(void *addr, ppc_inst instr);
>                                    ~~~~~~~~~^~~~~
> /linux/arch/powerpc/kernel/kgdb.c: In function 'kgdb_arch_remove_breakpoint':
> /linux/arch/powerpc/kernel/kgdb.c:442:32: error: incompatible type for argument 2 of 'patch_instruction'
>   err = patch_instruction(addr, instr);
>                                 ^~~~~
> In file included from /linux/arch/powerpc/kernel/kgdb.c:27:
> /linux/arch/powerpc/include/asm/code-patching.h:31:44: note: expected 'ppc_inst' {aka 'struct ppc_inst'} but argument is of type 'unsigned int'
>  int patch_instruction(void *addr, ppc_inst instr);
>                                    ~~~~~~~~~^~~~~
> make[3]: *** [/linux/scripts/Makefile.build:267: arch/powerpc/kernel/kgdb.o] Error 1
>
> - Alistair
Thanks, I will check it out.
>
> > Thanks, good catch.
> >
> > > arch/powerpc/kernel/epapr_paravirt.c: In function
> > > 'early_init_dt_scan_epapr': arch/powerpc/kernel/epapr_paravirt.c:40:48:
> > > error: incompatible type for argument 2 of 'patch_instruction'
> > >
> > >    40 |   patch_instruction(epapr_hypercall_start + i, inst);
> > >
> > >       |                                                ^~~~
> > >       |
> > >       |                                                u32 {aka unsigned
> > >       |                                                int}
> > >
> > > In file included from arch/powerpc/kernel/epapr_paravirt.c:12:
> > > ./arch/powerpc/include/asm/code-patching.h:31:44: note: expected
> > > 'ppc_inst'
> > > {aka 'struct ppc_inst'} but argument is of type 'u32' {aka 'unsigned int'}
> > >
> > >    31 | int patch_instruction(void *addr, ppc_inst instr);
> > >
> > >       |                                   ~~~~~~~~~^~~~~
> > >
> > > make[2]: *** [scripts/Makefile.build:268:
> > > arch/powerpc/kernel/epapr_paravirt.o] Error 1
> > > make[1]: *** [scripts/Makefile.build:505: arch/powerpc/kernel] Error 2
> > > make: *** [Makefile:1683: arch/powerpc] Error 2
> > >
> > >
> > > -- Bala
> > >
> > > > +int raw_patch_instruction(ppc_inst *addr, ppc_inst instr);
> > > >
> > > >  static inline unsigned long patch_site_addr(s32 *site)
> > > >  {
> > > >
> > > >       return (unsigned long)site + *site;
> > > >
> > > >  }
> > > >
> > > > -static inline int patch_instruction_site(s32 *site, unsigned int instr)
> > > > +static inline int patch_instruction_site(s32 *site, ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > > -     return patch_instruction((unsigned int *)patch_site_addr(site),
> > > > instr); +     return patch_instruction((ppc_inst
> > > > *)patch_site_addr(site), instr);> >
> > > >  }
> > > >
> > > >  static inline int patch_branch_site(s32 *site, unsigned long target,
> > > >  int
> > > >
> > > > flags)
> > > >
> > > >  {
> > > >
> > > > -     return patch_branch((unsigned int *)patch_site_addr(site), target,
> > > > flags);
> > > > +     return patch_branch((ppc_inst *)patch_site_addr(site), target,
> > > > flags);> >
> > > >  }
> > > >
> > > >  static inline int modify_instruction(unsigned int *addr, unsigned int
> > > >  clr,
> > > >
> > > > @@ -56,13 +57,13 @@ static inline int modify_instruction_site(s32 *site,
> > > > unsigned int clr, unsigned
> > > >
> > > >       return modify_instruction((unsigned int *)patch_site_addr(site),
> > > >       clr,
> > > >
> > > > set);
> > > >
> > > >  }
> > > >
> > > > -int instr_is_relative_branch(unsigned int instr);
> > > > -int instr_is_relative_link_branch(unsigned int instr);
> > > > -int instr_is_branch_to_addr(const unsigned int *instr, unsigned long
> > > > addr); -unsigned long branch_target(const unsigned int *instr);
> > > > -unsigned int translate_branch(const unsigned int *dest,
> > > > -                           const unsigned int *src);
> > > > -extern bool is_conditional_branch(unsigned int instr);
> > > > +int instr_is_relative_branch(ppc_inst instr);
> > > > +int instr_is_relative_link_branch(ppc_inst instr);
> > > > +int instr_is_branch_to_addr(const ppc_inst *instr, unsigned long addr);
> > > > +unsigned long branch_target(const ppc_inst *instr);
> > > > +ppc_inst translate_branch(const ppc_inst *dest,
> > > > +                           const ppc_inst *src);
> > > > +extern bool is_conditional_branch(ppc_inst instr);
> > > >
> > > >  #ifdef CONFIG_PPC_BOOK3E_64
> > > >  void __patch_exception(int exc, unsigned long addr);
> > > >  #define patch_exception(exc, name) do { \
> > > >
> > > > diff --git a/arch/powerpc/include/asm/inst.h
> > > > b/arch/powerpc/include/asm/inst.h
> > > > new file mode 100644
> > > > index 000000000000..7c8596ee411e
> > > > --- /dev/null
> > > > +++ b/arch/powerpc/include/asm/inst.h
> > > > @@ -0,0 +1,53 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > > +#ifndef _ASM_INST_H
> > > > +#define _ASM_INST_H
> > > > +
> > > > +/*
> > > > + * Instruction data type for POWER
> > > > + */
> > > > +
> > > > +typedef u32 ppc_inst;
> > > > +
> > > > +#define PPC_INST(x) (x)
> > > > +
> > > > +static inline int ppc_inst_len(ppc_inst x)
> > > > +{
> > > > +     return sizeof(ppc_inst);
> > > > +}
> > > > +
> > > > +static inline int ppc_inst_opcode(ppc_inst x)
> > > > +{
> > > > +     return x >> 26;
> > > > +}
> > > > +
> > > > +static inline u32 ppc_inst_word(ppc_inst x)
> > > > +{
> > > > +     return x;
> > > > +}
> > > > +
> > > > +static inline ppc_inst ppc_inst_read(const ppc_inst *ptr)
> > > > +{
> > > > +     return *(ppc_inst *)ptr;
> > > > +}
> > > > +
> > > > +static inline void ppc_inst_write(void *ptr, ppc_inst x)
> > > > +{
> > > > +     *(ppc_inst *)ptr = x;
> > > > +}
> > > > +
> > > > +static inline bool ppc_inst_equal(ppc_inst x, ppc_inst y)
> > > > +{
> > > > +     return x == y;
> > > > +}
> > > > +
> > > > +static inline bool ppc_inst_null(ppc_inst x)
> > > > +{
> > > > +     return x == 0;
> > > > +}
> > > > +
> > > > +static inline u32 ppc_inst_mask(ppc_inst x, u32 mask)
> > > > +{
> > > > +     return ppc_inst_word(x) & mask;
> > > > +}
> > > > +
> > > > +#endif /* _ASM_INST_H */
> > > > diff --git a/arch/powerpc/include/asm/sstep.h
> > > > b/arch/powerpc/include/asm/sstep.h
> > > > index 769f055509c9..9353916fcba7 100644
> > > > --- a/arch/powerpc/include/asm/sstep.h
> > > > +++ b/arch/powerpc/include/asm/sstep.h
> > > > @@ -2,6 +2,7 @@
> > > >
> > > >  /*
> > > >
> > > >   * Copyright (C) 2004 Paul Mackerras <paulus@au.ibm.com>, IBM
> > > >   */
> > > >
> > > > +#include <asm/inst.h>
> > > >
> > > >  struct pt_regs;
> > > >
> > > > @@ -132,7 +133,7 @@ union vsx_reg {
> > > >
> > > >   * otherwise.
> > > >   */
> > > >
> > > >  extern int analyse_instr(struct instruction_op *op, const struct
> > > >  pt_regs
> > > >
> > > > *regs,
> > > > -                      unsigned int instr);
> > > > +                      ppc_inst instr);
> > > >
> > > >  /*
> > > >
> > > >   * Emulate an instruction that can be executed just by updating
> > > >
> > > > @@ -149,7 +150,7 @@ void emulate_update_regs(struct pt_regs *reg, struct
> > > > instruction_op *op);
> > > >
> > > >   * 0 if it could not be emulated, or -1 for an instruction that
> > > >   * should not be emulated (rfid, mtmsrd clearing MSR_RI, etc.).
> > > >   */
> > > >
> > > > -extern int emulate_step(struct pt_regs *regs, unsigned int instr);
> > > > +extern int emulate_step(struct pt_regs *regs, ppc_inst instr);
> > > >
> > > >  /*
> > > >
> > > >   * Emulate a load or store instruction by reading/writing the
> > > >
> > > > diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> > > > index 92045ed64976..34594aaa44de 100644
> > > > --- a/arch/powerpc/kernel/align.c
> > > > +++ b/arch/powerpc/kernel/align.c
> > > > @@ -293,7 +293,7 @@ static int emulate_spe(struct pt_regs *regs,
> > > > unsigned int reg,
> > > >
> > > >  int fix_alignment(struct pt_regs *regs)
> > > >  {
> > > >
> > > > -     unsigned int instr;
> > > > +     ppc_inst instr;
> > > >
> > > >       struct instruction_op op;
> > > >       int r, type;
> > > >
> > > > diff --git a/arch/powerpc/kernel/hw_breakpoint.c
> > > > b/arch/powerpc/kernel/hw_breakpoint.c
> > > > index 2462cd7c565c..06b97353d231 100644
> > > > --- a/arch/powerpc/kernel/hw_breakpoint.c
> > > > +++ b/arch/powerpc/kernel/hw_breakpoint.c
> > > > @@ -24,6 +24,7 @@
> > > >
> > > >  #include <asm/debug.h>
> > > >  #include <asm/debugfs.h>
> > > >  #include <asm/hvcall.h>
> > > >
> > > > +#include <asm/inst.h>
> > > >
> > > >  #include <linux/uaccess.h>
> > > >
> > > >  /*
> > > >
> > > > @@ -243,7 +244,7 @@ dar_range_overlaps(unsigned long dar, int size,
> > > > struct
> > > > arch_hw_breakpoint *info)
> > > >
> > > >  static bool stepping_handler(struct pt_regs *regs, struct perf_event
> > > >  *bp,
> > > >
> > > >                            struct arch_hw_breakpoint *info)
> > > >
> > > >  {
> > > >
> > > > -     unsigned int instr = 0;
> > > > +     ppc_inst instr = 0;
> > > >
> > > >       int ret, type, size;
> > > >       struct instruction_op op;
> > > >       unsigned long addr = info->address;
> > > >
> > > > diff --git a/arch/powerpc/kernel/kprobes.c
> > > > b/arch/powerpc/kernel/kprobes.c
> > > > index 337516df17d4..e7205adc9820 100644
> > > > --- a/arch/powerpc/kernel/kprobes.c
> > > > +++ b/arch/powerpc/kernel/kprobes.c
> > > > @@ -225,7 +225,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
> > > >
> > > >  static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
> > > >  {
> > > >
> > > >       int ret;
> > > >
> > > > -     unsigned int insn = *p->ainsn.insn;
> > > > +     ppc_inst insn = *p->ainsn.insn;
> > > >
> > > >       /* regs->nip is also adjusted if emulate_step returns 1 */
> > > >       ret = emulate_step(regs, insn);
> > > >
> > > > diff --git a/arch/powerpc/kernel/mce_power.c
> > > > b/arch/powerpc/kernel/mce_power.c
> > > > index 1cbf7f1a4e3d..e65616bb3a3e 100644
> > > > --- a/arch/powerpc/kernel/mce_power.c
> > > > +++ b/arch/powerpc/kernel/mce_power.c
> > > > @@ -20,6 +20,7 @@
> > > >
> > > >  #include <asm/sstep.h>
> > > >  #include <asm/exception-64s.h>
> > > >  #include <asm/extable.h>
> > > >
> > > > +#include <asm/inst.h>
> > > >
> > > >  /*
> > > >
> > > >   * Convert an address related to an mm to a PFN. NOTE: we are in real
> > > >
> > > > @@ -365,7 +366,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs
> > > > *regs, uint64_t *addr,
> > > >
> > > >        * in real-mode is tricky and can lead to recursive
> > > >        * faults
> > > >        */
> > > >
> > > > -     int instr;
> > > > +     ppc_inst instr;
> > > >
> > > >       unsigned long pfn, instr_addr;
> > > >       struct instruction_op op;
> > > >       struct pt_regs tmp = *regs;
> > > >
> > > > @@ -373,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs
> > > > *regs, uint64_t *addr,
> > > >
> > > >       pfn = addr_to_pfn(regs, regs->nip);
> > > >       if (pfn != ULONG_MAX) {
> > > >
> > > >               instr_addr = (pfn << PAGE_SHIFT) + (regs->nip &
> > > >               ~PAGE_MASK);
> > > >
> > > > -             instr = *(unsigned int *)(instr_addr);
> > > > +             instr = *(ppc_inst *)(instr_addr);
> > > >
> > > >               if (!analyse_instr(&op, &tmp, instr)) {
> > > >
> > > >                       pfn = addr_to_pfn(regs, op.ea);
> > > >                       *addr = op.ea;
> > > >
> > > > diff --git a/arch/powerpc/kernel/optprobes.c
> > > > b/arch/powerpc/kernel/optprobes.c
> > > > index 024f7aad1952..f5e8cce438a3 100644
> > > > --- a/arch/powerpc/kernel/optprobes.c
> > > > +++ b/arch/powerpc/kernel/optprobes.c
> > > > @@ -189,8 +189,8 @@ void patch_imm64_load_insns(unsigned long val,
> > > > kprobe_opcode_t *addr)
> > > >
> > > >  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct
> > > >  kprobe> >
> > > > *p)
> > > >
> > > >  {
> > > >
> > > > -     kprobe_opcode_t *buff, branch_op_callback, branch_emulate_step;
> > > > -     kprobe_opcode_t *op_callback_addr, *emulate_step_addr;
> > > > +     ppc_inst branch_op_callback, branch_emulate_step;
> > > > +     kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
> > > >
> > > >       long b_offset;
> > > >       unsigned long nip, size;
> > > >       int rc, i;
> > > >
> > > > @@ -251,11 +251,11 @@ int arch_prepare_optimized_kprobe(struct
> > > > optimized_kprobe *op, struct kprobe *p)
> > > >
> > > >               goto error;
> > > >
> > > >       }
> > > >
> > > > -     branch_op_callback = create_branch((unsigned int *)buff +
> > > > TMPL_CALL_HDLR_IDX,
> > > > +     branch_op_callback = create_branch((ppc_inst *)buff +
> > > > TMPL_CALL_HDLR_IDX,
> > > >
> > > >                               (unsigned long)op_callback_addr,
> > > >                               BRANCH_SET_LINK);
> > > >
> > > > -     branch_emulate_step = create_branch((unsigned int *)buff +
> > > > TMPL_EMULATE_IDX,
> > > > +     branch_emulate_step = create_branch((ppc_inst *)buff +
> > > > TMPL_EMULATE_IDX,
> > > >
> > > >                               (unsigned long)emulate_step_addr,
> > > >                               BRANCH_SET_LINK);
> > > >
> > > > @@ -316,7 +316,7 @@ void arch_optimize_kprobes(struct list_head *oplist)
> > > >
> > > >               memcpy(op->optinsn.copied_insn, op->kp.addr,
> > > >
> > > >                                              RELATIVEJUMP_SIZE);
> > > >
> > > >               patch_instruction(op->kp.addr,
> > > >
> > > > -                     create_branch((unsigned int *)op->kp.addr,
> > > > +                     create_branch((ppc_inst *)op->kp.addr,
> > > >
> > > >                                     (unsigned long)op->optinsn.insn,
> > > >                                     0));
> > > >
> > > >               list_del_init(&op->list);
> > > >
> > > >       }
> > > >
> > > > diff --git a/arch/powerpc/kernel/trace/ftrace.c
> > > > b/arch/powerpc/kernel/trace/ftrace.c
> > > > index 7ea0ca044b65..5787ccffb4df 100644
> > > > --- a/arch/powerpc/kernel/trace/ftrace.c
> > > > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > > > @@ -27,6 +27,7 @@
> > > >
> > > >  #include <asm/code-patching.h>
> > > >  #include <asm/ftrace.h>
> > > >  #include <asm/syscall.h>
> > > >
> > > > +#include <asm/inst.h>
> > > >
> > > >  #ifdef CONFIG_DYNAMIC_FTRACE
> > > >
> > > > @@ -40,23 +41,23 @@
> > > >
> > > >  #define      NUM_FTRACE_TRAMPS       8
> > > >  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> > > >
> > > > -static unsigned int
> > > > +static ppc_inst
> > > >
> > > >  ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
> > > >  {
> > > >
> > > > -     unsigned int op;
> > > > +     ppc_inst op;
> > > >
> > > >       addr = ppc_function_entry((void *)addr);
> > > >
> > > >       /* if (link) set op to 'bl' else 'b' */
> > > >
> > > > -     op = create_branch((unsigned int *)ip, addr, link ? 1 : 0);
> > > > +     op = create_branch((ppc_inst *)ip, addr, link ? 1 : 0);
> > > >
> > > >       return op;
> > > >
> > > >  }
> > > >
> > > >  static int
> > > >
> > > > -ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int
> > > > new)
> > > > +ftrace_modify_code(unsigned long ip, ppc_inst old, ppc_inst new)
> > > >
> > > >  {
> > > >
> > > > -     unsigned int replaced;
> > > > +     ppc_inst replaced;
> > > >
> > > >       /*
> > > >
> > > >        * Note:
> > > > @@ -78,7 +79,7 @@ ftrace_modify_code(unsigned long ip, unsigned int old,
> > > > unsigned int new)
> > > >
> > > >       }
> > > >
> > > >       /* replace the text with the new text */
> > > >
> > > > -     if (patch_instruction((unsigned int *)ip, new))
> > > > +     if (patch_instruction((ppc_inst *)ip, new))
> > > >
> > > >               return -EPERM;
> > > >
> > > >       return 0;
> > > >
> > > > @@ -87,25 +88,25 @@ ftrace_modify_code(unsigned long ip, unsigned int
> > > > old,
> > > > unsigned int new)
> > > >
> > > >  /*
> > > >
> > > >   * Helper functions that are the same for both PPC64 and PPC32.
> > > >   */
> > > >
> > > > -static int test_24bit_addr(unsigned long ip, unsigned long addr)
> > > > +static ppc_inst test_24bit_addr(unsigned long ip, unsigned long addr)
> > > >
> > > >  {
> > > >
> > > >       addr = ppc_function_entry((void *)addr);
> > > >
> > > >       /* use the create_branch to verify that this offset can be
> > > >       branched */
> > > >
> > > > -     return create_branch((unsigned int *)ip, addr, 0);
> > > > +     return create_branch((ppc_inst *)ip, addr, 0);
> > > >
> > > >  }
> > > >
> > > > -static int is_bl_op(unsigned int op)
> > > > +static int is_bl_op(ppc_inst op)
> > > >
> > > >  {
> > > >
> > > >       return (op & 0xfc000003) == 0x48000001;
> > > >
> > > >  }
> > > >
> > > > -static int is_b_op(unsigned int op)
> > > > +static int is_b_op(ppc_inst op)
> > > >
> > > >  {
> > > >
> > > >       return (op & 0xfc000003) == 0x48000000;
> > > >
> > > >  }
> > > >
> > > > -static unsigned long find_bl_target(unsigned long ip, unsigned int op)
> > > > +static unsigned long find_bl_target(unsigned long ip, ppc_inst op)
> > > >
> > > >  {
> > > >
> > > >       int offset;
> > > >
> > > > @@ -125,7 +126,7 @@ __ftrace_make_nop(struct module *mod,
> > > >
> > > >  {
> > > >
> > > >       unsigned long entry, ptr, tramp;
> > > >       unsigned long ip = rec->ip;
> > > >
> > > > -     unsigned int op, pop;
> > > > +     ppc_inst op, pop;
> > > >
> > > >       /* read where this goes */
> > > >       if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
> > > >
> > > > @@ -204,7 +205,7 @@ __ftrace_make_nop(struct module *mod,
> > > >
> > > >       }
> > > >
> > > >  #endif /* CONFIG_MPROFILE_KERNEL */
> > > >
> > > > -     if (patch_instruction((unsigned int *)ip, pop)) {
> > > > +     if (patch_instruction((ppc_inst *)ip, pop)) {
> > > >
> > > >               pr_err("Patching NOP failed.\n");
> > > >               return -EPERM;
> > > >
> > > >       }
> > > >
> > > > @@ -217,7 +218,7 @@ static int
> > > >
> > > >  __ftrace_make_nop(struct module *mod,
> > > >
> > > >                 struct dyn_ftrace *rec, unsigned long addr)
> > > >
> > > >  {
> > > >
> > > > -     unsigned int op;
> > > > +     ppc_inst op;
> > > >
> > > >       unsigned int jmp[4];
> > > >       unsigned long ip = rec->ip;
> > > >       unsigned long tramp;
> > > >
> > > > @@ -276,7 +277,7 @@ __ftrace_make_nop(struct module *mod,
> > > >
> > > >       op = PPC_INST_NOP;
> > > >
> > > > -     if (patch_instruction((unsigned int *)ip, op))
> > > > +     if (patch_instruction((ppc_inst *)ip, op))
> > > >
> > > >               return -EPERM;
> > > >
> > > >       return 0;
> > > >
> > > > @@ -322,7 +323,8 @@ static int add_ftrace_tramp(unsigned long tramp)
> > > >
> > > >   */
> > > >
> > > >  static int setup_mcount_compiler_tramp(unsigned long tramp)
> > > >  {
> > > >
> > > > -     int i, op;
> > > > +     int i;
> > > > +     ppc_inst op;
> > > >
> > > >       unsigned long ptr;
> > > >       static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
> > > >
> > > > @@ -388,7 +390,7 @@ static int setup_mcount_compiler_tramp(unsigned long
> > > > tramp)
> > > >
> > > >  static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned
> > > >  long
> > > >
> > > > addr)
> > > >
> > > >  {
> > > >
> > > >       unsigned long tramp, ip = rec->ip;
> > > >
> > > > -     unsigned int op;
> > > > +     ppc_inst op;
> > > >
> > > >       /* Read where this goes */
> > > >       if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
> > > >
> > > > @@ -416,7 +418,7 @@ static int __ftrace_make_nop_kernel(struct
> > > > dyn_ftrace
> > > > *rec, unsigned long addr)
> > > >
> > > >               }
> > > >
> > > >       }
> > > >
> > > > -     if (patch_instruction((unsigned int *)ip, PPC_INST_NOP)) {
> > > > +     if (patch_instruction((ppc_inst *)ip, PPC_INST_NOP)) {
> > > >
> > > >               pr_err("Patching NOP failed.\n");
> > > >               return -EPERM;
> > > >
> > > >       }
> > > >
> > > > @@ -428,7 +430,7 @@ int ftrace_make_nop(struct module *mod,
> > > >
> > > >                   struct dyn_ftrace *rec, unsigned long addr)
> > > >
> > > >  {
> > > >
> > > >       unsigned long ip = rec->ip;
> > > >
> > > > -     unsigned int old, new;
> > > > +     ppc_inst old, new;
> > > >
> > > >       /*
> > > >
> > > >        * If the calling address is more that 24 bits away,
> > > >
> > > > @@ -481,7 +483,7 @@ int ftrace_make_nop(struct module *mod,
> > > >
> > > >   */
> > > >
> > > >  #ifndef CONFIG_MPROFILE_KERNEL
> > > >  static int
> > > >
> > > > -expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
> > > > +expected_nop_sequence(void *ip, ppc_inst op0, ppc_inst op1)
> > > >
> > > >  {
> > > >
> > > >       /*
> > > >
> > > >        * We expect to see:
> > > > @@ -510,7 +512,7 @@ expected_nop_sequence(void *ip, unsigned int op0,
> > > > unsigned int op1)
> > > >
> > > >  static int
> > > >  __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> > > >  {
> > > >
> > > > -     unsigned int op[2];
> > > > +     ppc_inst op[2];
> > > >
> > > >       void *ip = (void *)rec->ip;
> > > >       unsigned long entry, ptr, tramp;
> > > >       struct module *mod = rec->arch.mod;
> > > >
> > > > @@ -574,7 +576,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned
> > > > long addr)
> > > >
> > > >  static int
> > > >  __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> > > >  {
> > > >
> > > > -     unsigned int op;
> > > > +     ppc_inst op;
> > > >
> > > >       unsigned long ip = rec->ip;
> > > >
> > > >       /* read where this goes */
> > > >
> > > > @@ -594,7 +596,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned
> > > > long addr)
> > > >
> > > >       }
> > > >
> > > >       /* create the branch to the trampoline */
> > > >
> > > > -     op = create_branch((unsigned int *)ip,
> > > > +     op = create_branch((ppc_inst *)ip,
> > > >
> > > >                          rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
> > > >
> > > >       if (!op) {
> > > >
> > > >               pr_err("REL24 out of range!\n");
> > > >
> > > > @@ -613,7 +615,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned
> > > > long addr)
> > > >
> > > >  static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned
> > > >  long
> > > >
> > > > addr)
> > > >
> > > >  {
> > > >
> > > > -     unsigned int op;
> > > > +     ppc_inst op;
> > > >
> > > >       void *ip = (void *)rec->ip;
> > > >       unsigned long tramp, entry, ptr;
> > > >
> > > > @@ -661,7 +663,7 @@ static int __ftrace_make_call_kernel(struct
> > > > dyn_ftrace
> > > > *rec, unsigned long addr)
> > > >
> > > >  int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> > > >  {
> > > >
> > > >       unsigned long ip = rec->ip;
> > > >
> > > > -     unsigned int old, new;
> > > > +     ppc_inst old, new;
> > > >
> > > >       /*
> > > >
> > > >        * If the calling address is more that 24 bits away,
> > > >
> > > > @@ -700,7 +702,7 @@ static int
> > > >
> > > >  __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
> > > >
> > > >                                       unsigned long addr)
> > > >
> > > >  {
> > > >
> > > > -     unsigned int op;
> > > > +     ppc_inst op;
> > > >
> > > >       unsigned long ip = rec->ip;
> > > >       unsigned long entry, ptr, tramp;
> > > >       struct module *mod = rec->arch.mod;
> > > >
> > > > @@ -748,7 +750,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec,
> > > > unsigned
> > > > long old_addr,
> > > >
> > > >       /* The new target may be within range */
> > > >       if (test_24bit_addr(ip, addr)) {
> > > >
> > > >               /* within range */
> > > >
> > > > -             if (patch_branch((unsigned int *)ip, addr,
> > > > BRANCH_SET_LINK)) { +             if (patch_branch((ppc_inst *)ip,
> > > > addr, BRANCH_SET_LINK)) {> >
> > > >                       pr_err("REL24 out of range!\n");
> > > >                       return -EINVAL;
> > > >
> > > >               }
> > > >
> > > > @@ -776,7 +778,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec,
> > > > unsigned
> > > > long old_addr,
> > > >
> > > >       }
> > > >
> > > >       /* Ensure branch is within 24 bits */
> > > >
> > > > -     if (!create_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
> > > > +     if (!create_branch((ppc_inst *)ip, tramp, BRANCH_SET_LINK)) {
> > > >
> > > >               pr_err("Branch out of range\n");
> > > >               return -EINVAL;
> > > >
> > > >       }
> > > >
> > > > @@ -794,7 +796,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec,
> > > > unsigned
> > > > long old_addr,
> > > >
> > > >                       unsigned long addr)
> > > >
> > > >  {
> > > >
> > > >       unsigned long ip = rec->ip;
> > > >
> > > > -     unsigned int old, new;
> > > > +     ppc_inst old, new;
> > > >
> > > >       /*
> > > >
> > > >        * If the calling address is more that 24 bits away,
> > > >
> > > > @@ -834,7 +836,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec,
> > > > unsigned
> > > > long old_addr,
> > > >
> > > >  int ftrace_update_ftrace_func(ftrace_func_t func)
> > > >  {
> > > >
> > > >       unsigned long ip = (unsigned long)(&ftrace_call);
> > > >
> > > > -     unsigned int old, new;
> > > > +     ppc_inst old, new;
> > > >
> > > >       int ret;
> > > >
> > > >       old = *(unsigned int *)&ftrace_call;
> > > >
> > > > @@ -919,7 +921,7 @@ int ftrace_enable_ftrace_graph_caller(void)
> > > >
> > > >       unsigned long ip = (unsigned long)(&ftrace_graph_call);
> > > >       unsigned long addr = (unsigned long)(&ftrace_graph_caller);
> > > >       unsigned long stub = (unsigned long)(&ftrace_graph_stub);
> > > >
> > > > -     unsigned int old, new;
> > > > +     ppc_inst old, new;
> > > >
> > > >       old = ftrace_call_replace(ip, stub, 0);
> > > >       new = ftrace_call_replace(ip, addr, 0);
> > > >
> > > > @@ -932,7 +934,7 @@ int ftrace_disable_ftrace_graph_caller(void)
> > > >
> > > >       unsigned long ip = (unsigned long)(&ftrace_graph_call);
> > > >       unsigned long addr = (unsigned long)(&ftrace_graph_caller);
> > > >       unsigned long stub = (unsigned long)(&ftrace_graph_stub);
> > > >
> > > > -     unsigned int old, new;
> > > > +     ppc_inst old, new;
> > > >
> > > >       old = ftrace_call_replace(ip, addr, 0);
> > > >       new = ftrace_call_replace(ip, stub, 0);
> > > >
> > > > diff --git a/arch/powerpc/kvm/emulate_loadstore.c
> > > > b/arch/powerpc/kvm/emulate_loadstore.c
> > > > index 1139bc56e004..1c9bcbfeb924 100644
> > > > --- a/arch/powerpc/kvm/emulate_loadstore.c
> > > > +++ b/arch/powerpc/kvm/emulate_loadstore.c
> > > > @@ -21,6 +21,7 @@
> > > >
> > > >  #include <asm/disassemble.h>
> > > >  #include <asm/ppc-opcode.h>
> > > >  #include <asm/sstep.h>
> > > >
> > > > +#include <asm/inst.h>
> > > >
> > > >  #include "timing.h"
> > > >  #include "trace.h"
> > > >
> > > > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> > > > patching.c
> > > > index 3345f039a876..8492b9e2b8db 100644
> > > > --- a/arch/powerpc/lib/code-patching.c
> > > > +++ b/arch/powerpc/lib/code-patching.c
> > > > @@ -17,9 +17,10 @@
> > > >
> > > >  #include <asm/page.h>
> > > >  #include <asm/code-patching.h>
> > > >  #include <asm/setup.h>
> > > >
> > > > +#include <asm/inst.h>
> > > >
> > > > -static int __patch_instruction(unsigned int *exec_addr, unsigned int
> > > > instr, -                            unsigned int *patch_addr)
> > > > +static int __patch_instruction(ppc_inst *exec_addr, ppc_inst instr,
> > > > +                            ppc_inst *patch_addr)
> > > >
> > > >  {
> > > >
> > > >       int err = 0;
> > > >
> > > > @@ -33,7 +34,7 @@ static int __patch_instruction(unsigned int
> > > > *exec_addr,
> > > > unsigned int instr,
> > > >
> > > >       return 0;
> > > >
> > > >  }
> > > >
> > > > -int raw_patch_instruction(unsigned int *addr, unsigned int instr)
> > > > +int raw_patch_instruction(ppc_inst *addr, ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       return __patch_instruction(addr, instr, addr);
> > > >
> > > >  }
> > > >
> > > > @@ -136,10 +137,10 @@ static inline int unmap_patch_area(unsigned long
> > > > addr)> >
> > > >       return 0;
> > > >
> > > >  }
> > > >
> > > > -static int do_patch_instruction(unsigned int *addr, unsigned int instr)
> > > > +static int do_patch_instruction(ppc_inst *addr, ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       int err;
> > > >
> > > > -     unsigned int *patch_addr = NULL;
> > > > +     ppc_inst *patch_addr = NULL;
> > > >
> > > >       unsigned long flags;
> > > >       unsigned long text_poke_addr;
> > > >       unsigned long kaddr = (unsigned long)addr;
> > > >
> > > > @@ -176,7 +177,7 @@ static int do_patch_instruction(unsigned int *addr,
> > > > unsigned int instr)
> > > >
> > > >  }
> > > >  #else /* !CONFIG_STRICT_KERNEL_RWX */
> > > >
> > > > -static int do_patch_instruction(unsigned int *addr, unsigned int instr)
> > > > +static int do_patch_instruction(ppc_inst *addr, ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       return raw_patch_instruction(addr, instr);
> > > >
> > > >  }
> > > >
> > > > @@ -194,7 +195,7 @@ int patch_instruction(unsigned int *addr, unsigned
> > > > int
> > > > instr)
> > > >
> > > >  }
> > > >  NOKPROBE_SYMBOL(patch_instruction);
> > > >
> > > > -int patch_branch(unsigned int *addr, unsigned long target, int flags)
> > > > +int patch_branch(ppc_inst *addr, unsigned long target, int flags)
> > > >
> > > >  {
> > > >
> > > >       return patch_instruction(addr, create_branch(addr, target,
> > > >       flags));
> > > >
> > > >  }
> > > >
> > > > @@ -225,7 +226,7 @@ bool is_offset_in_branch_range(long offset)
> > > >
> > > >   * Helper to check if a given instruction is a conditional branch
> > > >   * Derived from the conditional checks in analyse_instr()
> > > >   */
> > > >
> > > > -bool is_conditional_branch(unsigned int instr)
> > > > +bool is_conditional_branch(ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       unsigned int opcode = instr >> 26;
> > > >
> > > > @@ -243,10 +244,10 @@ bool is_conditional_branch(unsigned int instr)
> > > >
> > > >  }
> > > >  NOKPROBE_SYMBOL(is_conditional_branch);
> > > >
> > > > -unsigned int create_branch(const unsigned int *addr,
> > > > +ppc_inst create_branch(const ppc_inst *addr,
> > > >
> > > >                          unsigned long target, int flags)
> > > >
> > > >  {
> > > >
> > > > -     unsigned int instruction;
> > > > +     ppc_inst instruction;
> > > >
> > > >       long offset;
> > > >
> > > >       offset = target;
> > > >
> > > > @@ -266,7 +267,7 @@ unsigned int create_branch(const unsigned int *addr,
> > > >
> > > >  unsigned int create_cond_branch(const unsigned int *addr,
> > > >
> > > >                               unsigned long target, int flags)
> > > >
> > > >  {
> > > >
> > > > -     unsigned int instruction;
> > > > +     ppc_inst instruction;
> > > >
> > > >       long offset;
> > > >
> > > >       offset = target;
> > > >
> > > > @@ -283,22 +284,22 @@ unsigned int create_cond_branch(const unsigned int
> > > > *addr,
> > > >
> > > >       return instruction;
> > > >
> > > >  }
> > > >
> > > > -static unsigned int branch_opcode(unsigned int instr)
> > > > +static unsigned int branch_opcode(ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       return (instr >> 26) & 0x3F;
> > > >
> > > >  }
> > > >
> > > > -static int instr_is_branch_iform(unsigned int instr)
> > > > +static int instr_is_branch_iform(ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       return branch_opcode(instr) == 18;
> > > >
> > > >  }
> > > >
> > > > -static int instr_is_branch_bform(unsigned int instr)
> > > > +static int instr_is_branch_bform(ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       return branch_opcode(instr) == 16;
> > > >
> > > >  }
> > > >
> > > > -int instr_is_relative_branch(unsigned int instr)
> > > > +int instr_is_relative_branch(ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       if (instr & BRANCH_ABSOLUTE)
> > > >
> > > >               return 0;
> > > >
> > > > @@ -306,12 +307,12 @@ int instr_is_relative_branch(unsigned int instr)
> > > >
> > > >       return instr_is_branch_iform(instr) ||
> > > >       instr_is_branch_bform(instr);
> > > >
> > > >  }
> > > >
> > > > -int instr_is_relative_link_branch(unsigned int instr)
> > > > +int instr_is_relative_link_branch(ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       return instr_is_relative_branch(instr) && (instr &
> > > >       BRANCH_SET_LINK);
> > > >
> > > >  }
> > > >
> > > > -static unsigned long branch_iform_target(const unsigned int *instr)
> > > > +static unsigned long branch_iform_target(const ppc_inst *instr)
> > > >
> > > >  {
> > > >
> > > >       signed long imm;
> > > >
> > > > @@ -327,7 +328,7 @@ static unsigned long branch_iform_target(const
> > > > unsigned
> > > > int *instr)
> > > >
> > > >       return (unsigned long)imm;
> > > >
> > > >  }
> > > >
> > > > -static unsigned long branch_bform_target(const unsigned int *instr)
> > > > +static unsigned long branch_bform_target(const ppc_inst *instr)
> > > >
> > > >  {
> > > >
> > > >       signed long imm;
> > > >
> > > > @@ -343,7 +344,7 @@ static unsigned long branch_bform_target(const
> > > > unsigned
> > > > int *instr)
> > > >
> > > >       return (unsigned long)imm;
> > > >
> > > >  }
> > > >
> > > > -unsigned long branch_target(const unsigned int *instr)
> > > > +unsigned long branch_target(const ppc_inst *instr)
> > > >
> > > >  {
> > > >
> > > >       if (instr_is_branch_iform(*instr))
> > > >
> > > >               return branch_iform_target(instr);
> > > >
> > > > @@ -353,7 +354,7 @@ unsigned long branch_target(const unsigned int
> > > > *instr)
> > > >
> > > >       return 0;
> > > >
> > > >  }
> > > >
> > > > -int instr_is_branch_to_addr(const unsigned int *instr, unsigned long
> > > > addr)
> > > > +int instr_is_branch_to_addr(const ppc_inst *instr, unsigned long addr)
> > > >
> > > >  {
> > > >
> > > >       if (instr_is_branch_iform(*instr) ||
> > > >       instr_is_branch_bform(*instr))
> > > >
> > > >               return branch_target(instr) == addr;
> > > >
> > > > @@ -361,7 +362,7 @@ int instr_is_branch_to_addr(const unsigned int
> > > > *instr,
> > > > unsigned long addr)
> > > >
> > > >       return 0;
> > > >
> > > >  }
> > > >
> > > > -unsigned int translate_branch(const unsigned int *dest, const unsigned
> > > > int
> > > > *src)
> > > > +ppc_inst translate_branch(const ppc_inst *dest, const ppc_inst *src)
> > > >
> > > >  {
> > > >
> > > >       unsigned long target;
> > > >
> > > > @@ -403,7 +404,7 @@ static void __init test_trampoline(void)
> > > >
> > > >  static void __init test_branch_iform(void)
> > > >  {
> > > >
> > > > -     unsigned int instr;
> > > > +     ppc_inst instr;
> > > >
> > > >       unsigned long addr;
> > > >
> > > >       addr = (unsigned long)&instr;
> > > >
> > > > @@ -478,11 +479,11 @@ static void __init test_branch_iform(void)
> > > >
> > > >  static void __init test_create_function_call(void)
> > > >  {
> > > >
> > > > -     unsigned int *iptr;
> > > > +     ppc_inst *iptr;
> > > >
> > > >       unsigned long dest;
> > > >
> > > >       /* Check we can create a function call */
> > > >
> > > > -     iptr = (unsigned int *)ppc_function_entry(test_trampoline);
> > > > +     iptr = (ppc_inst *)ppc_function_entry(test_trampoline);
> > > >
> > > >       dest = ppc_function_entry(test_create_function_call);
> > > >       patch_instruction(iptr, create_branch(iptr, dest,
> > > >       BRANCH_SET_LINK));
> > > >       check(instr_is_branch_to_addr(iptr, dest));
> > > >
> > > > @@ -491,7 +492,8 @@ static void __init test_create_function_call(void)
> > > >
> > > >  static void __init test_branch_bform(void)
> > > >  {
> > > >
> > > >       unsigned long addr;
> > > >
> > > > -     unsigned int *iptr, instr, flags;
> > > > +     ppc_inst *iptr, instr;
> > > > +     unsigned int flags;
> > > >
> > > >       iptr = &instr;
> > > >       addr = (unsigned long)iptr;
> > > >
> > > > @@ -561,7 +563,7 @@ static void __init test_branch_bform(void)
> > > >
> > > >  static void __init test_translate_branch(void)
> > > >  {
> > > >
> > > >       unsigned long addr;
> > > >
> > > > -     unsigned int *p, *q;
> > > > +     ppc_inst *p, *q;
> > > >
> > > >       void *buf;
> > > >
> > > >       buf = vmalloc(PAGE_ALIGN(0x2000000 + 1));
> > > >
> > > > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > > > index c077acb983a1..1d9c766a89fe 100644
> > > > --- a/arch/powerpc/lib/sstep.c
> > > > +++ b/arch/powerpc/lib/sstep.c
> > > > @@ -1163,7 +1163,7 @@ static nokprobe_inline int trap_compare(long v1,
> > > > long
> > > > v2)
> > > >
> > > >   * otherwise.
> > > >   */
> > > >
> > > >  int analyse_instr(struct instruction_op *op, const struct pt_regs
> > > >  *regs,
> > > >
> > > > -               unsigned int instr)
> > > > +               ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       unsigned int opcode, ra, rb, rc, rd, spr, u;
> > > >       unsigned long int imm;
> > > >
> > > > @@ -3101,7 +3101,7 @@ NOKPROBE_SYMBOL(emulate_loadstore);
> > > >
> > > >   * or -1 if the instruction is one that should not be stepped,
> > > >   * such as an rfid, or a mtmsrd that would clear MSR_RI.
> > > >   */
> > > >
> > > > -int emulate_step(struct pt_regs *regs, unsigned int instr)
> > > > +int emulate_step(struct pt_regs *regs, ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       struct instruction_op op;
> > > >       int r, err, type;
> > > >
> > > > diff --git a/arch/powerpc/lib/test_emulate_step.c
> > > > b/arch/powerpc/lib/test_emulate_step.c
> > > > index 42347067739c..158efc8a0f53 100644
> > > > --- a/arch/powerpc/lib/test_emulate_step.c
> > > > +++ b/arch/powerpc/lib/test_emulate_step.c
> > > > @@ -460,7 +460,7 @@ struct compute_test {
> > > >
> > > >       struct {
> > > >
> > > >               char *descr;
> > > >               unsigned long flags;
> > > >
> > > > -             unsigned int instr;
> > > > +             ppc_inst instr;
> > > >
> > > >               struct pt_regs regs;
> > > >
> > > >       } subtests[MAX_SUBTESTS + 1];
> > > >
> > > >  };
> > > >
> > > > @@ -841,7 +841,7 @@ static struct compute_test compute_tests[] = {
> > > >
> > > >  };
> > > >
> > > >  static int __init emulate_compute_instr(struct pt_regs *regs,
> > > >
> > > > -                                     unsigned int instr)
> > > > +                                     ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       struct instruction_op op;
> > > >
> > > > @@ -859,7 +859,7 @@ static int __init emulate_compute_instr(struct
> > > > pt_regs
> > > > *regs,
> > > >
> > > >  }
> > > >
> > > >  static int __init execute_compute_instr(struct pt_regs *regs,
> > > >
> > > > -                                     unsigned int instr)
> > > > +                                     ppc_inst instr)
> > > >
> > > >  {
> > > >
> > > >       extern int exec_instr(struct pt_regs *regs);
> > > >       extern s32 patch__exec_instr;
> > > >
> > > > @@ -890,7 +890,8 @@ static void __init run_tests_compute(void)
> > > >
> > > >       unsigned long flags;
> > > >       struct compute_test *test;
> > > >       struct pt_regs *regs, exp, got;
> > > >
> > > > -     unsigned int i, j, k, instr;
> > > > +     unsigned int i, j, k;
> > > > +     ppc_inst instr;
> > > >
> > > >       bool ignore_gpr, ignore_xer, ignore_ccr, passed;
> > > >
> > > >       for (i = 0; i < ARRAY_SIZE(compute_tests); i++) {
> > > >
> > > > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > > > index 7875d1a37770..a0bc442f9557 100644
> > > > --- a/arch/powerpc/xmon/xmon.c
> > > > +++ b/arch/powerpc/xmon/xmon.c
> > > > @@ -892,7 +892,7 @@ static struct bpt *new_breakpoint(unsigned long a)
> > > >
> > > >  static void insert_bpts(void)
> > > >  {
> > > >
> > > >       int i;
> > > >
> > > > -     unsigned int instr;
> > > > +     ppc_inst instr;
> > > >
> > > >       struct bpt *bp;
> > > >
> > > >       bp = bpts;
> > > >
> > > > @@ -914,7 +914,7 @@ static void insert_bpts(void)
> > > >
> > > >               patch_instruction(bp->instr, instr);
> > > >               if (bp->enabled & BP_CIABR)
> > > >
> > > >                       continue;
> > > >
> > > > -             if (patch_instruction((unsigned int *)bp->address,
> > > > +             if (patch_instruction((ppc_inst *)bp->address,
> > > >
> > > >                                                       bpinstr) != 0) {
> > > >
> > > >                       printf("Couldn't write instruction at %lx, "
> > > >
> > > >                              "disabling breakpoint there\n",
> > > >                              bp->address);
> > > >
> > > > @@ -943,7 +943,7 @@ static void remove_bpts(void)
> > > >
> > > >  {
> > > >
> > > >       int i;
> > > >       struct bpt *bp;
> > > >
> > > > -     unsigned instr;
> > > > +     ppc_inst instr;
> > > >
> > > >       bp = bpts;
> > > >       for (i = 0; i < NBPTS; ++i, ++bp) {
> > > >
> > > > @@ -952,7 +952,7 @@ static void remove_bpts(void)
> > > >
> > > >               if (mread(bp->address, &instr, 4) == 4
> > > >
> > > >                   && instr == bpinstr
> > > >                   && patch_instruction(
> > > >
> > > > -                     (unsigned int *)bp->address, bp->instr[0]) != 0)
> > > > +                     (ppc_inst *)bp->address, bp->instr[0]) != 0)
> > > >
> > > >                       printf("Couldn't remove breakpoint at %lx\n",
> > > >
> > > >                              bp->address);
> > > >
> > > >       }
> > > >
> > > > @@ -1159,7 +1159,7 @@ static int do_step(struct pt_regs *regs)
> > > >
> > > >   */
> > > >
> > > >  static int do_step(struct pt_regs *regs)
> > > >  {
> > > >
> > > > -     unsigned int instr;
> > > > +     ppc_inst instr;
> > > >
> > > >       int stepped;
> > > >
> > > >       force_enable_xmon();
> > > >
> > > > @@ -1325,7 +1325,7 @@ csum(void)
> > > >
> > > >   */
> > > >
> > > >  static long check_bp_loc(unsigned long addr)
> > > >  {
> > > >
> > > > -     unsigned int instr;
> > > > +     ppc_inst instr;
> > > >
> > > >       addr &= ~3;
> > > >       if (!is_kernel_addr(addr)) {
>
>
>
>
