Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F71A3023
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 09:34:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yXvY1hLnzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 17:34:01 +1000 (AEST)
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
 header.s=20161025 header.b=TlGhgNdO; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yXn260djzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 17:28:21 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id k18so2451162oib.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uOyEVjgFT15u38BRJ4R7bdaewzqnBiQF/G3WYZ3H3KE=;
 b=TlGhgNdOqjXKgPtgJ/FTxS9xHfPp4Hm3uiX1Pi6xDtXq9gn/OY7CFu8oPXWRnZAzk5
 V0qWUqMVC/ji80YaDitOrFzIq6QYPCuntw/r+HsaHZptmN//ZqKARJbtiqpyb+eK5Cxj
 L9WXEaxm4beWozlhgxGR2U+3m1KRQk2n/WkDvWQuEFmyUaTTv8p8v9OQ8FIxmpPL4MS4
 S4ev1DMddzulKilHyAoT2bgEFdympb8d/lajjkva17Qtt251tYpMhgnvBfJIg/9jGyEN
 Hl0oN+aX14NRTrUDKqp9l253xYc6dCQspHh5RswHPPFbeZv+A1gKBhFYyyyJcRudXojL
 +aRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uOyEVjgFT15u38BRJ4R7bdaewzqnBiQF/G3WYZ3H3KE=;
 b=HPjQQiM/VE8rWeyQwWOG5EkxjM+8aJUxHZgNOPAl5viek7WEztYVBqo2Gn/0kFu3Je
 1KDIBFFZw9M/hzsKrPmLMa4OwUjh3qEdtU7jwCm8WNvMulYiIAnccvhCPUDlKaUJv2cO
 bB8mjDslPtPmKQAQt+CHpJplOhocDdojk4P6U5zKc7ZutAXYzdqKF/nBqbjVO6Z4uscJ
 1fNP42IW4XSZ+Q6NxuvAdCbNcfa0tXJPGRbnJA5N/kh6znPSvzZZ/+M+LjI9nW9yMPIK
 N1DGcCH0qdpEEJtTRR5lg4J/HrWUh5guDtopTNbFcKOa5xgQUMfUH+JHKHjO12T4jDue
 xXHQ==
X-Gm-Message-State: AGi0PuZjmeJwTenn4dWcpYmnbTpqvXocBFcrF82ZsjGdtRviQ7+SxsKx
 b52ixiLyCQP/mjFKk5xGclJBCN50a9C1+Wd85+k=
X-Google-Smtp-Source: APiQypKTXLaN9ItKK75qYJsrb5kevr9wF+ARAyoVlMzxUMbcsiQcRvaN0q0q4gcC5g5EQANVeweKAtMCG/1ZMCYoekM=
X-Received: by 2002:aca:f254:: with SMTP id q81mr5366412oih.12.1586417298247; 
 Thu, 09 Apr 2020 00:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <b30787a2-bcb9-de17-759a-9fcb30ac6644@c-s.fr>
In-Reply-To: <b30787a2-bcb9-de17-759a-9fcb30ac6644@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 9 Apr 2020 17:28:06 +1000
Message-ID: <CACzsE9qnMayFyTNSw+ANo1y_QP=jHwV7PUXi+UXthemigt=V-g@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Initial Prefixed Instruction support
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 9, 2020 at 4:39 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
>
>
>
> On 04/06/2020 08:09 AM, Jordan Niethe wrote:
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
> >
> > v5 is based on feedback from Nick Piggins, Michael Ellerman, Balamuruha=
n
> > Suriyakumar and Alistair Popple.
> > The major changes:
> >      - The ppc instruction type is now a struct
> >      - Series now just based on next
> >      - ppc_inst_masked() dropped
> >      - Space for xmon breakpoints allocated in an assembly file
> >      - "Add prefixed instructions to instruction data type" patch seper=
ated in
> >        to smaller patches
> >      - Calling convention for create_branch() is changed
> >      - Some places which had not been updated to use the data type are =
now updated
>
> Build fails. I have not investigated why:
Thanks, I will check it out.
>
>    CC      arch/powerpc/kernel/process.o
> In file included from ./arch/powerpc/include/asm/code-patching.h:14:0,
>                   from arch/powerpc/kernel/process.c:60:
> ./arch/powerpc/include/asm/inst.h:69:38: error: unknown type name =E2=80=
=98ppc_inst=E2=80=99
>   static inline bool ppc_inst_prefixed(ppc_inst x)
>                                        ^
> ./arch/powerpc/include/asm/inst.h:79:19: error: redefinition of
> =E2=80=98ppc_inst_val=E2=80=99
>   static inline u32 ppc_inst_val(struct ppc_inst x)
>                     ^
> ./arch/powerpc/include/asm/inst.h:21:19: note: previous definition of
> =E2=80=98ppc_inst_val=E2=80=99 was here
>   static inline u32 ppc_inst_val(struct ppc_inst x)
>                     ^
> ./arch/powerpc/include/asm/inst.h: In function =E2=80=98ppc_inst_len=E2=
=80=99:
> ./arch/powerpc/include/asm/inst.h:103:10: error: implicit declaration of
> function =E2=80=98ppc_inst_prefixed=E2=80=99 [-Werror=3Dimplicit-function=
-declaration]
>    return (ppc_inst_prefixed(x)) ? 8  : 4;
>            ^
>
> Christophe
>
> >
> > v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel =
Axtens.
> > The major changes:
> >      - Move xmon breakpoints from data section to text section
> >      - Introduce a data type for instructions on powerpc
> >
> > v3 is based on feedback from Christophe Leroy. The major changes:
> >      - Completely replacing store_inst() with patch_instruction() in
> >        xmon
> >      - Improve implementation of mread_instr() to not use mread().
> >      - Base the series on top of
> >        https://patchwork.ozlabs.org/patch/1232619/ as this will effect
> >        kprobes.
> >      - Some renaming and simplification of conditionals.
> >
> > v2 incorporates feedback from Daniel Axtens and and Balamuruhan
> > S. The major changes are:
> >      - Squashing together all commits about SRR1 bits
> >      - Squashing all commits for supporting prefixed load stores
> >      - Changing abbreviated references to sufx/prfx -> suffix/prefix
> >      - Introducing macros for returning the length of an instruction
> >      - Removing sign extension flag from pstd/pld in sstep.c
> >      - Dropping patch  "powerpc/fault: Use analyse_instr() to check for
> >        store with updates to sp" from the series, it did not really fit
> >        with prefixed enablement in the first place and as reported by G=
reg
> >        Kurz did not work correctly.
> >
> >
> > Alistair Popple (1):
> >    powerpc: Enable Prefixed Instructions
> >
> > Jordan Niethe (20):
> >    powerpc/xmon: Remove store_inst() for patch_instruction()
> >    powerpc/xmon: Move out-of-line instructions to text section
> >    powerpc: Change calling convention for create_branch() et. al.
> >    powerpc: Use a macro for creating instructions from u32s
> >    powerpc: Use a function for getting the instruction op code
> >    powerpc: Use an accessor for instructions
> >    powerpc: Use a function for byte swapping instructions
> >    powerpc: Introduce functions for instruction equality
> >    powerpc: Use a datatype for instructions
> >    powerpc: Use a function for reading instructions
> >    powerpc: Define and use __get_user_instr{,inatomic}()
> >    powerpc: Introduce a function for reporting instruction length
> >    powerpc/xmon: Use a function for reading instructions
> >    powerpc/xmon: Move insertion of breakpoint for xol'ing
> >    powerpc: Make test_translate_branch() independent of instruction
> >      length
> >    powerpc: Define new SRR1 bits for a future ISA version
> >    powerpc64: Add prefixed instructions to instruction data type
> >    powerpc: Support prefixed instructions in alignment handler
> >    powerpc sstep: Add support for prefixed load/stores
> >    powerpc sstep: Add support for prefixed fixed-point arithmetic
> >
> >   arch/powerpc/include/asm/code-patching.h |  37 +-
> >   arch/powerpc/include/asm/inst.h          | 106 ++++++
> >   arch/powerpc/include/asm/kprobes.h       |   2 +-
> >   arch/powerpc/include/asm/reg.h           |   7 +-
> >   arch/powerpc/include/asm/sstep.h         |  15 +-
> >   arch/powerpc/include/asm/uaccess.h       |  28 ++
> >   arch/powerpc/include/asm/uprobes.h       |   7 +-
> >   arch/powerpc/kernel/align.c              |  13 +-
> >   arch/powerpc/kernel/epapr_paravirt.c     |   5 +-
> >   arch/powerpc/kernel/hw_breakpoint.c      |   5 +-
> >   arch/powerpc/kernel/jump_label.c         |   5 +-
> >   arch/powerpc/kernel/kgdb.c               |   9 +-
> >   arch/powerpc/kernel/kprobes.c            |  24 +-
> >   arch/powerpc/kernel/mce_power.c          |   5 +-
> >   arch/powerpc/kernel/module_64.c          |   3 +-
> >   arch/powerpc/kernel/optprobes.c          |  91 +++--
> >   arch/powerpc/kernel/optprobes_head.S     |   3 +
> >   arch/powerpc/kernel/security.c           |   9 +-
> >   arch/powerpc/kernel/setup_32.c           |   4 +-
> >   arch/powerpc/kernel/trace/ftrace.c       | 190 ++++++----
> >   arch/powerpc/kernel/traps.c              |  20 +-
> >   arch/powerpc/kernel/uprobes.c            |   3 +-
> >   arch/powerpc/kernel/vecemu.c             |  20 +-
> >   arch/powerpc/kvm/book3s_hv_nested.c      |   2 +-
> >   arch/powerpc/kvm/book3s_hv_rm_mmu.c      |   2 +-
> >   arch/powerpc/kvm/emulate_loadstore.c     |   2 +-
> >   arch/powerpc/lib/code-patching.c         | 289 +++++++-------
> >   arch/powerpc/lib/feature-fixups.c        |  69 ++--
> >   arch/powerpc/lib/sstep.c                 | 455 ++++++++++++++++------=
-
> >   arch/powerpc/lib/test_emulate_step.c     |  56 +--
> >   arch/powerpc/perf/core-book3s.c          |   4 +-
> >   arch/powerpc/xmon/Makefile               |   2 +-
> >   arch/powerpc/xmon/xmon.c                 |  94 +++--
> >   arch/powerpc/xmon/xmon_bpts.S            |  10 +
> >   arch/powerpc/xmon/xmon_bpts.h            |   8 +
> >   35 files changed, 1042 insertions(+), 562 deletions(-)
> >   create mode 100644 arch/powerpc/include/asm/inst.h
> >   create mode 100644 arch/powerpc/xmon/xmon_bpts.S
> >   create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> >
