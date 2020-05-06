Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7E1C6667
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 05:43:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H2WT5FHvzDqjV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 13:43:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Eyd6uLmp; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2Tb4MBBzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:42:11 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id q24so210196pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JsXOKm0puHIxD78ttNkrZeHUGKDxS0088GRZUR5bDSM=;
 b=Eyd6uLmpXWhX+OrGLUDRvzaRlu4p/yNi6spbIi9UmowMuFvFKQaW2khieIRHTI28b5
 IWYHbplKrXZVUsbfiEg6hpQWdUhjBX8G1t0w/wNZqlC7mTZPjT8CoT0mv+jSozCWzyeu
 JviaigLXV5c6NPZP2NIODzquN8dIEFJOAi63cSX6DtoXa7uSQdhwNDOsQmUaSCOK0QhC
 4McbbOX8QXDFpLsXLtZAblK4Squ57+5HOk6Tf5FI/M4ydJBRcVgNcmSDqrZMUfEn2wcu
 u1MkZGFspyar2QRdiuv/Prl7HcJ7uwEwv7LdiTkTXGfSTmX5aqtvvylM7frLgEfMQdxj
 NmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JsXOKm0puHIxD78ttNkrZeHUGKDxS0088GRZUR5bDSM=;
 b=DQ/x0030qJ5QjZ0P0qZGpv5na00BytjsYbdoX70unj2W8336Jt8D1srEwYhS8gYdNq
 mqfQsDfdRJ7PruCE/EgN4UJLySnOuXrdDwyjElN3UpbnsPi4v4zRlC4TwkWD4hJeNhQ5
 9U0Nea7vXGfk2w0ZFB/CUCLRmr6b2bBqI362eB4wrfIeqRT3D1b6P0EyO/Wlb0n1TlYM
 S50J/lGFhrLJGa7n0izfrYbG4NnwFX6CFwYUQccJae6wYRL7oTPNuYW62s7TDI0EwINy
 15KQuvT1QeXpoJzhTyZjRvuZL0oIe8TFPY+Tqb2Kpaveu5VCc7l9lVkn7QBeIRdrC6AO
 cakA==
X-Gm-Message-State: AGi0PuYJqatMavZbwceJ5bx5yFjnYiNhuq1wAgZMV9vJ1U/OZ+JrVrJG
 KrE/uRJzdMJqoBJ25HHvDTcp3dEErohaRw==
X-Google-Smtp-Source: APiQypLpdiPiF9IV64z0Ha3NtSsXUtPiVEIR65D8q+JdM47Gx2wRJUKY7XItTMiaogW+hkU/uy6Pug==
X-Received: by 2002:a17:902:6909:: with SMTP id
 j9mr6135560plk.190.1588736527612; 
 Tue, 05 May 2020 20:42:07 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:42:06 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 00/30] Initial Prefixed Instruction support
Date: Wed,  6 May 2020 13:40:20 +1000
Message-Id: <20200506034050.24806-1-jniethe5@gmail.com>
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

v8 incorporates feedback from Alistair Popple and Balamuruhan Suriyakumar.
The major changes:
    - Fix some style issues
    - Fix __patch_instruction() on big endian
    - Reintroduce v3's forbidding breakpoints on second word of prefix
      instructions for kprobes and xmon. Missed this when changing to
      using a data type.
    - Use the data type in some places that were missed.

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

Jordan Niethe (29):
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
  powerpc/xmon: Don't allow breakpoints on suffixes
  powerpc/kprobes: Don't allow breakpoints on suffixes
  powerpc: Support prefixed instructions in alignment handler
  powerpc sstep: Add support for prefixed load/stores
  powerpc sstep: Add support for prefixed fixed-point arithmetic

 arch/powerpc/include/asm/code-patching.h  |  37 +-
 arch/powerpc/include/asm/inst.h           | 107 +++++
 arch/powerpc/include/asm/kprobes.h        |   2 +-
 arch/powerpc/include/asm/ppc-opcode.h     |   3 +
 arch/powerpc/include/asm/reg.h            |   7 +-
 arch/powerpc/include/asm/sstep.h          |  15 +-
 arch/powerpc/include/asm/uaccess.h        |  43 ++
 arch/powerpc/include/asm/uprobes.h        |   7 +-
 arch/powerpc/kernel/align.c               |  13 +-
 arch/powerpc/kernel/asm-offsets.c         |   8 +
 arch/powerpc/kernel/crash_dump.c          |   7 +-
 arch/powerpc/kernel/epapr_paravirt.c      |   7 +-
 arch/powerpc/kernel/hw_breakpoint.c       |   5 +-
 arch/powerpc/kernel/jump_label.c          |   5 +-
 arch/powerpc/kernel/kgdb.c                |   9 +-
 arch/powerpc/kernel/kprobes.c             |  37 +-
 arch/powerpc/kernel/mce_power.c           |   5 +-
 arch/powerpc/kernel/module_64.c           |   3 +-
 arch/powerpc/kernel/optprobes.c           | 102 +++--
 arch/powerpc/kernel/optprobes_head.S      |   3 +
 arch/powerpc/kernel/security.c            |  12 +-
 arch/powerpc/kernel/setup_32.c            |   8 +-
 arch/powerpc/kernel/trace/ftrace.c        | 168 ++++----
 arch/powerpc/kernel/traps.c               |  20 +-
 arch/powerpc/kernel/uprobes.c             |   5 +-
 arch/powerpc/kernel/vecemu.c              |  20 +-
 arch/powerpc/kvm/book3s_hv_nested.c       |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c       |   2 +-
 arch/powerpc/kvm/emulate_loadstore.c      |   2 +-
 arch/powerpc/lib/Makefile                 |   2 +-
 arch/powerpc/lib/code-patching.c          | 319 +++++++++------
 arch/powerpc/lib/feature-fixups-test.S    |  69 ++++
 arch/powerpc/lib/feature-fixups.c         | 160 ++++++--
 arch/powerpc/lib/inst.c                   |  70 ++++
 arch/powerpc/lib/sstep.c                  | 459 +++++++++++++++-------
 arch/powerpc/lib/test_code-patching.S     |  20 +
 arch/powerpc/lib/test_emulate_step.c      |  56 +--
 arch/powerpc/mm/fault.c                   |  15 +-
 arch/powerpc/mm/nohash/8xx.c              |   5 +-
 arch/powerpc/perf/8xx-pmu.c               |   9 +-
 arch/powerpc/perf/core-book3s.c           |   4 +-
 arch/powerpc/platforms/86xx/mpc86xx_smp.c |   5 +-
 arch/powerpc/platforms/powermac/smp.c     |   5 +-
 arch/powerpc/xmon/Makefile                |   2 +-
 arch/powerpc/xmon/xmon.c                  | 122 ++++--
 arch/powerpc/xmon/xmon_bpts.S             |  11 +
 arch/powerpc/xmon/xmon_bpts.h             |  14 +
 47 files changed, 1409 insertions(+), 602 deletions(-)
 create mode 100644 arch/powerpc/include/asm/inst.h
 create mode 100644 arch/powerpc/lib/inst.c
 create mode 100644 arch/powerpc/lib/test_code-patching.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.h

-- 
2.17.1

