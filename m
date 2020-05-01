Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC18A1C0CBF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:44:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cyms2Q4hzDrN9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZKqNa/0z; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CylD5mFrzDrFr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:43:18 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id n16so4027403pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9qRjXZvZQG+JdjlxAx1MV4RzUj4bttYTsDGC3Ejd3i8=;
 b=ZKqNa/0zdBHuAFu07/4v/RKT3wbGqqvdJSapgJAmmMvsHe0P2vAtLW7/b+mxyjImVg
 81plb8OH73cfsBjs44pRHvZJ+GM0aNOQPzrWsm8CDwUPHCnf+UCnOjHF0D2INEhYJGwg
 nHgDldh45q9+kfnigz0b1r0P3Ew2pNlPUhAicUTLLxKwn5t2CVDGNf/IVoBRobckuXD3
 LTYusLLXI299qNG9NclZLqAkKKlKYekUlDqZu1gZEzOI5znpjWNRR9/psrb0APSsEEUu
 dHHekzdM5GUBO4C/93wAFv4WSrlF1eZCu1w9iTGiwj5p7r4iWY1ZV2OvvexhOjbDdNvU
 2WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9qRjXZvZQG+JdjlxAx1MV4RzUj4bttYTsDGC3Ejd3i8=;
 b=QDDM2inbTSiJRM4dZjCBhgrmMRCIWOF5x07Wnmhb4kesz/iPjNd6ZfIWT72eBAc7dW
 Ia7o5XAxxNBVeVr2N3Ke3x68WeWW4sc+Jtmvd/uylvSYv24tqUwdLJCs8RbA87SQkQL7
 EI/VqHT5I0tnLPXxrkWWTG0oDcZS03bX4Sq/QnoDfoR5ItUEywCrGR5270F3qRxBmqdK
 iJtg1dwr4mI962WS+JmmhJPdSjyU5SzqwWfdfji7KFySUmOO0iRB7oDVMwGao4CtIrIj
 pvoXvhxw89BrE+8qmbB41/NytNxjF+IAoCSWctHbq4IQra6kAHLCSwN52AckX17peeXR
 qHVw==
X-Gm-Message-State: AGi0Pua32OHeyCmdOoFdASiGcm1BIlJsl4dtSFGATQtbRu7Xq/1wLZFD
 U82FPQuEIBj4yDjdFm130WOV7r2rDalmtQ==
X-Google-Smtp-Source: APiQypINBpn0tJ7vglH1YIvTSbJtc1cIgZ1LxpDK58KRbezvaOAb7N+MdQ6Bs9f7VIFNFvpEOyRFVQ==
X-Received: by 2002:aa7:9546:: with SMTP id w6mr2205075pfq.114.1588304594668; 
 Thu, 30 Apr 2020 20:43:14 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:43:14 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 00/28] Initial Prefixed Instruction support
Date: Fri,  1 May 2020 13:41:52 +1000
Message-Id: <20200501034220.8982-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A future revision of the ISA will introduce prefixed instructions. A
prefixed instruction is composed of a 4-byte prefix followed by a
4-byte suffix.

All prefixes have the major opcode 1. A prefix will never be a valid
word instruction. A suffix may be an existing word instruction or a
new instruction.

This series enables prefixed instructions and extends the instruction
emulation to support them. Then the places where prefixed instructions
might need to be emulated are updated.

v7 fixes compilation issues for some configs reported by Alistair
Popple.

v6 is based on feedback from Balamuruhan Suriyakumar, Alistair Popple,
Christophe Leroy and Segher Boessenkool.
The major changes:
    - Use the instruction type in more places that had been missed before
    - Fix issues with ppc32
    - Introduce new self tests for code patching and feature fixups

v5 is based on feedback from Nick Piggins, Michael Ellerman, Balamuruhan
Suriyakumar and Alistair Popple.
The major changes:
    - The ppc instruction type is now a struct
    - Series now just based on next
    - ppc_inst_masked() dropped
    - Space for xmon breakpoints allocated in an assembly file
    - "Add prefixed instructions to instruction data type" patch seperated in
      to smaller patches
    - Calling convention for create_branch() is changed
    - Some places which had not been updated to use the data type are now updated

v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel Axtens.
The major changes:
    - Move xmon breakpoints from data section to text section
    - Introduce a data type for instructions on powerpc

v3 is based on feedback from Christophe Leroy. The major changes:
    - Completely replacing store_inst() with patch_instruction() in
      xmon
    - Improve implementation of mread_instr() to not use mread().
    - Base the series on top of
      https://patchwork.ozlabs.org/patch/1232619/ as this will effect
      kprobes.
    - Some renaming and simplification of conditionals.

v2 incorporates feedback from Daniel Axtens and and Balamuruhan
S. The major changes are:
    - Squashing together all commits about SRR1 bits
    - Squashing all commits for supporting prefixed load stores
    - Changing abbreviated references to sufx/prfx -> suffix/prefix
    - Introducing macros for returning the length of an instruction
    - Removing sign extension flag from pstd/pld in sstep.c
    - Dropping patch  "powerpc/fault: Use analyse_instr() to check for
      store with updates to sp" from the series, it did not really fit
      with prefixed enablement in the first place and as reported by Greg
      Kurz did not work correctly.

Alistair Popple (1):
  powerpc: Enable Prefixed Instructions

Jordan Niethe (27):
  powerpc/xmon: Remove store_inst() for patch_instruction()
  powerpc/xmon: Move breakpoint instructions to own array
  powerpc/xmon: Move breakpoints to text section
  powerpc/xmon: Use bitwise calculations in_breakpoint_table()
  powerpc: Change calling convention for create_branch() et. al.
  powerpc: Use a macro for creating instructions from u32s
  powerpc: Use an accessor for instructions
  powerpc: Use a function for getting the instruction op code
  powerpc: Use a function for byte swapping instructions
  powerpc: Introduce functions for instruction equality
  powerpc: Use a datatype for instructions
  powerpc: Use a function for reading instructions
  powerpc: Add a probe_user_read_inst() function
  powerpc: Add a probe_kernel_read_inst() function
  powerpc/kprobes: Use patch_instruction()
  powerpc: Define and use __get_user_instr{,inatomic}()
  powerpc: Introduce a function for reporting instruction length
  powerpc/xmon: Use a function for reading instructions
  powerpc/xmon: Move insertion of breakpoint for xol'ing
  powerpc: Make test_translate_branch() independent of instruction
    length
  powerpc: Define new SRR1 bits for a future ISA version
  powerpc: Add prefixed instructions to instruction data type
  powerpc: Test prefixed code patching
  powerpc: Test prefixed instructions in feature fixups
  powerpc: Support prefixed instructions in alignment handler
  powerpc sstep: Add support for prefixed load/stores
  powerpc sstep: Add support for prefixed fixed-point arithmetic

 arch/powerpc/include/asm/code-patching.h |  37 +-
 arch/powerpc/include/asm/inst.h          | 106 ++++++
 arch/powerpc/include/asm/kprobes.h       |   2 +-
 arch/powerpc/include/asm/reg.h           |   7 +-
 arch/powerpc/include/asm/sstep.h         |  15 +-
 arch/powerpc/include/asm/uaccess.h       |  35 ++
 arch/powerpc/include/asm/uprobes.h       |   7 +-
 arch/powerpc/kernel/align.c              |  13 +-
 arch/powerpc/kernel/asm-offsets.c        |   8 +
 arch/powerpc/kernel/epapr_paravirt.c     |   7 +-
 arch/powerpc/kernel/hw_breakpoint.c      |   5 +-
 arch/powerpc/kernel/jump_label.c         |   5 +-
 arch/powerpc/kernel/kgdb.c               |   9 +-
 arch/powerpc/kernel/kprobes.c            |  24 +-
 arch/powerpc/kernel/mce_power.c          |   5 +-
 arch/powerpc/kernel/module_64.c          |   3 +-
 arch/powerpc/kernel/optprobes.c          |  91 +++--
 arch/powerpc/kernel/optprobes_head.S     |   3 +
 arch/powerpc/kernel/security.c           |   9 +-
 arch/powerpc/kernel/setup_32.c           |   8 +-
 arch/powerpc/kernel/trace/ftrace.c       | 160 ++++----
 arch/powerpc/kernel/traps.c              |  20 +-
 arch/powerpc/kernel/uprobes.c            |   5 +-
 arch/powerpc/kernel/vecemu.c             |  20 +-
 arch/powerpc/kvm/book3s_hv_nested.c      |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c      |   2 +-
 arch/powerpc/kvm/emulate_loadstore.c     |   2 +-
 arch/powerpc/lib/Makefile                |   2 +-
 arch/powerpc/lib/code-patching.c         | 308 ++++++++-------
 arch/powerpc/lib/feature-fixups-test.S   |  68 ++++
 arch/powerpc/lib/feature-fixups.c        | 159 ++++++--
 arch/powerpc/lib/inst.c                  |  69 ++++
 arch/powerpc/lib/sstep.c                 | 461 ++++++++++++++++-------
 arch/powerpc/lib/test_code-patching.S    |  19 +
 arch/powerpc/lib/test_emulate_step.c     |  56 +--
 arch/powerpc/mm/fault.c                  |  15 +-
 arch/powerpc/perf/core-book3s.c          |   4 +-
 arch/powerpc/xmon/Makefile               |   2 +-
 arch/powerpc/xmon/xmon.c                 |  94 +++--
 arch/powerpc/xmon/xmon_bpts.S            |  11 +
 arch/powerpc/xmon/xmon_bpts.h            |  14 +
 41 files changed, 1308 insertions(+), 584 deletions(-)
 create mode 100644 arch/powerpc/include/asm/inst.h
 create mode 100644 arch/powerpc/lib/inst.c
 create mode 100644 arch/powerpc/lib/test_code-patching.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.h

-- 
2.17.1

