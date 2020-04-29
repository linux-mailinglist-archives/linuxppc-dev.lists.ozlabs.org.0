Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C91BD2AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 04:54:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BjlD4xkzzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 12:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fqBcrtUo; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bjj943C5zDqtd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 12:52:13 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id r25so511799oij.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 19:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jt7gNgdXxTUyaPRO5j77sw8AxVZex8kEppxP9SUDLyk=;
 b=fqBcrtUonof66wZ/1p3lcAcjWUaeprmxAt/jJTEl9HFD+5IMBHAc68Yemr//Kl9AoJ
 6rjtGmIU5uPaHO3TvZ7jbJGhU8va+wg7mIT/V7RtZPrOiWXy5B2ITRoDYzXXm3zx1s6T
 HD7NHHlFrU/gHfF07j1flNIDBHb7HU0omQR6P7SCXlXOSvXu5uavM+RqabkHL6xHSUlF
 InnHH94m90RNAfF0mzuVFxm9EEyU5WA1MRGqRPDaQOEN/aOb3DUjj4/yxvYr+dFNj1A8
 AU0CHtd+/5rKhv2uNJNwD/RjR2cUzdhtwWsD8IRBkHM+Sjm/LylisovIX8Ob4BCBxBjA
 1atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jt7gNgdXxTUyaPRO5j77sw8AxVZex8kEppxP9SUDLyk=;
 b=YfHv8NkFmjz+16fdyg5nYe91nqEZlpWe/c/T51hmb/oZGCde/OJUMQLkZ4pMIrkQLM
 vAgjmaqs+iIB3sK/7TzBXFes1UcGa22+AxGqibeAermIQkOQBTH+RlJAlPHeRdE40X8V
 HaBQqz6IqNoz0uMXkanddoNDEAb8HPgL5oqCWvCooBIHGV3wTSGWw5XXV/3zd5wcYHQk
 qpfAnOMibKkbqQr+FU8gr/dg8KoW2wTDjnlJgxGV+zGZNFn1FaPH7CuD/C1xAMc+y+1e
 nNUtwODwc3VdRdA92WbGwxVEPgSpQ8A3LN+ZrOIKbTiOj+CWFLu+qD9NAemeLFMOJLJd
 zwOg==
X-Gm-Message-State: AGi0PuZTd2UDiD3maFXR3gJC1AF49tUNmA5OqOHTJRtnwYhBxLMyi7F8
 bOeQPwxlYMqkmBjgZ8e/KBoCU9nTx33xuH72xjU=
X-Google-Smtp-Source: APiQypLz37Q65ASDxGxTXVa/lkwHZytpXM+RWs1JOXp90IhnctAGSWoFU22C4AsS10kmPvu1G6FV+dPxO4UD1OD/pMs=
X-Received: by 2002:aca:eb88:: with SMTP id j130mr339043oih.12.1588128729639; 
 Tue, 28 Apr 2020 19:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200428015814.15380-1-jniethe5@gmail.com>
 <621da706df99146dbe47bbb3243b4f6ed7f3a15c.camel@linux.ibm.com>
In-Reply-To: <621da706df99146dbe47bbb3243b4f6ed7f3a15c.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 29 Apr 2020 12:51:58 +1000
Message-ID: <CACzsE9rDUui7_00Dk4st8mjniy5iq=DmdSSWYTsezv1G1EXijw@mail.gmail.com>
Subject: Re: [PATCH v6 00/28] Initial Prefixed Instruction support
To: Balamuruhan S <bala24@linux.ibm.com>
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 28, 2020 at 8:07 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Tue, 2020-04-28 at 11:57 +1000, Jordan Niethe wrote:
> > A future revision of the ISA will introduce prefixed instructions. A
> > prefixed instruction is composed of a 4-byte prefix followed by a
> > 4-byte suffix.
> >
> > All prefixes have the major opcode 1. A prefix will never be a valid
> > word instruction. A suffix may be an existing word instruction or a
> > new instruction.
> >
> > This series enables prefixed instructions and extends the instruction
> > emulation to support them. Then the places where prefixed instructions
> > might need to be emulated are updated.
>
> Hi Jordan,
>
> I tried to test Kprobes with prefixed instruction on this patchset and
> observed that kprobe/uprobe enablement patches are missing from v4.
> Till v3 it were available,
>
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200211053355.21574-11-jniethe5@gmail.com/
>
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200211053355.21574-12-jniethe5@gmail.com/
>
> was it missed for any dependencies/reason ? or will you plan it include in next
> version ?
V4 was when I introduced the data type of prefixed instructions, that
along with helper functions covered a lot of what those enablement
patches were doing.
All of the stuff in that uprobes patch gets done without needing a
specific patch now. I'll add back in the checks for prefix
instructions in arch_prepare_kprobe().

> please let me know if you need help on it.
>
> -- Bala
>
> >
> > v6 is based on feedback from Balamuruhan Suriyakumar, Alistair Popple,
> > Christophe Leroy and Segher Boessenkool.
> > The major changes:
> >     - Use the instruction type in more places that had been missed before
> >     - Fix issues with ppc32
> >     - Introduce new self tests for code patching and feature fixups
> >
> > v5 is based on feedback from Nick Piggins, Michael Ellerman, Balamuruhan
> > Suriyakumar and Alistair Popple.
> > The major changes:
> >     - The ppc instruction type is now a struct
> >     - Series now just based on next
> >     - ppc_inst_masked() dropped
> >     - Space for xmon breakpoints allocated in an assembly file
> >     - "Add prefixed instructions to instruction data type" patch seperated in
> >       to smaller patches
> >     - Calling convention for create_branch() is changed
> >     - Some places which had not been updated to use the data type are now
> > updated
> >
> > v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel
> > Axtens.
> > The major changes:
> >     - Move xmon breakpoints from data section to text section
> >     - Introduce a data type for instructions on powerpc
> >
> > v3 is based on feedback from Christophe Leroy. The major changes:
> >     - Completely replacing store_inst() with patch_instruction() in
> >       xmon
> >     - Improve implementation of mread_instr() to not use mread().
> >     - Base the series on top of
> >       https://patchwork.ozlabs.org/patch/1232619/ as this will effect
> >       kprobes.
> >     - Some renaming and simplification of conditionals.
> >
> > v2 incorporates feedback from Daniel Axtens and and Balamuruhan
> > S. The major changes are:
> >     - Squashing together all commits about SRR1 bits
> >     - Squashing all commits for supporting prefixed load stores
> >     - Changing abbreviated references to sufx/prfx -> suffix/prefix
> >     - Introducing macros for returning the length of an instruction
> >     - Removing sign extension flag from pstd/pld in sstep.c
> >     - Dropping patch  "powerpc/fault: Use analyse_instr() to check for
> >       store with updates to sp" from the series, it did not really fit
> >       with prefixed enablement in the first place and as reported by Greg
> >       Kurz did not work correctly.
> >
> > Alistair Popple (1):
> >   powerpc: Enable Prefixed Instructions
> >
> > Jordan Niethe (27):
> >   powerpc/xmon: Remove store_inst() for patch_instruction()
> >   powerpc/xmon: Move breakpoint instructions to own array
> >   powerpc/xmon: Move breakpoints to text section
> >   powerpc/xmon: Use bitwise calculations in_breakpoint_table()
> >   powerpc: Change calling convention for create_branch() et. al.
> >   powerpc: Use a macro for creating instructions from u32s
> >   powerpc: Use an accessor for instructions
> >   powerpc: Use a function for getting the instruction op code
> >   powerpc: Use a function for byte swapping instructions
> >   powerpc: Introduce functions for instruction equality
> >   powerpc: Use a datatype for instructions
> >   powerpc: Use a function for reading instructions
> >   powerpc: Add a probe_user_read_inst() function
> >   powerpc: Add a probe_kernel_read_inst() function
> >   powerpc/kprobes: Use patch_instruction()
> >   powerpc: Define and use __get_user_instr{,inatomic}()
> >   powerpc: Introduce a function for reporting instruction length
> >   powerpc/xmon: Use a function for reading instructions
> >   powerpc/xmon: Move insertion of breakpoint for xol'ing
> >   powerpc: Make test_translate_branch() independent of instruction
> >     length
> >   powerpc: Define new SRR1 bits for a future ISA version
> >   powerpc: Add prefixed instructions to instruction data type
> >   powerpc: Test prefixed code patching
> >   powerpc: Test prefixed instructions in feature fixups
> >   powerpc: Support prefixed instructions in alignment handler
> >   powerpc sstep: Add support for prefixed load/stores
> >   powerpc sstep: Add support for prefixed fixed-point arithmetic
> >
> >  arch/powerpc/include/asm/code-patching.h |  37 +-
> >  arch/powerpc/include/asm/inst.h          | 106 ++++++
> >  arch/powerpc/include/asm/kprobes.h       |   2 +-
> >  arch/powerpc/include/asm/reg.h           |   7 +-
> >  arch/powerpc/include/asm/sstep.h         |  15 +-
> >  arch/powerpc/include/asm/uaccess.h       |  35 ++
> >  arch/powerpc/include/asm/uprobes.h       |   7 +-
> >  arch/powerpc/kernel/align.c              |  13 +-
> >  arch/powerpc/kernel/asm-offsets.c        |   8 +
> >  arch/powerpc/kernel/epapr_paravirt.c     |   7 +-
> >  arch/powerpc/kernel/hw_breakpoint.c      |   5 +-
> >  arch/powerpc/kernel/jump_label.c         |   5 +-
> >  arch/powerpc/kernel/kgdb.c               |   9 +-
> >  arch/powerpc/kernel/kprobes.c            |  24 +-
> >  arch/powerpc/kernel/mce_power.c          |   5 +-
> >  arch/powerpc/kernel/module_64.c          |   3 +-
> >  arch/powerpc/kernel/optprobes.c          |  91 +++--
> >  arch/powerpc/kernel/optprobes_head.S     |   3 +
> >  arch/powerpc/kernel/security.c           |   9 +-
> >  arch/powerpc/kernel/setup_32.c           |   8 +-
> >  arch/powerpc/kernel/trace/ftrace.c       | 160 ++++----
> >  arch/powerpc/kernel/traps.c              |  20 +-
> >  arch/powerpc/kernel/uprobes.c            |   5 +-
> >  arch/powerpc/kernel/vecemu.c             |  20 +-
> >  arch/powerpc/kvm/book3s_hv_nested.c      |   2 +-
> >  arch/powerpc/kvm/book3s_hv_rm_mmu.c      |   2 +-
> >  arch/powerpc/kvm/emulate_loadstore.c     |   2 +-
> >  arch/powerpc/lib/Makefile                |   2 +-
> >  arch/powerpc/lib/code-patching.c         | 305 ++++++++-------
> >  arch/powerpc/lib/feature-fixups-test.S   |  68 ++++
> >  arch/powerpc/lib/feature-fixups.c        | 159 ++++++--
> >  arch/powerpc/lib/inst.c                  |  69 ++++
> >  arch/powerpc/lib/sstep.c                 | 461 ++++++++++++++++-------
> >  arch/powerpc/lib/test_code-patching.S    |  19 +
> >  arch/powerpc/lib/test_emulate_step.c     |  56 +--
> >  arch/powerpc/mm/fault.c                  |  15 +-
> >  arch/powerpc/perf/core-book3s.c          |   4 +-
> >  arch/powerpc/xmon/Makefile               |   2 +-
> >  arch/powerpc/xmon/xmon.c                 |  94 +++--
> >  arch/powerpc/xmon/xmon_bpts.S            |  11 +
> >  arch/powerpc/xmon/xmon_bpts.h            |  14 +
> >  41 files changed, 1307 insertions(+), 582 deletions(-)
> >  create mode 100644 arch/powerpc/include/asm/inst.h
> >  create mode 100644 arch/powerpc/lib/inst.c
> >  create mode 100644 arch/powerpc/lib/test_code-patching.S
> >  create mode 100644 arch/powerpc/xmon/xmon_bpts.S
> >  create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> >
>
