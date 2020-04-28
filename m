Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 566831BB3AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:00:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B4cP3sdSzDqkC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:00:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HpyEvqmJ; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4ZH5qK1zDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:59:03 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id x15so9938580pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=du2UDdqILKzhvf36FeCCMLmfeesSslaj79o4mP50EgI=;
 b=HpyEvqmJRSvRAK26v70ONPX9PHkawEpO8xFMcxEJo7vpbcy2RwKqomRB/lFajuDrtZ
 2s2oF0mc72sIoFMKqK6zaeS2XYLShFgxOK5Na01F/Aa9L2kQyv2F1eXFYdeC79kVxkDo
 h3371OzTkr92Qp5i7ukTUkLZtY/P83Cb6p7Gq4axtVv+Dt1/B65Nf5ta8OAhWMeosemu
 UuYePNTvzw/zzvaWYrmB29k2aY9yHye1UUBD3Z6lv37/JxOc6R8n52ka0VclSFkTeghq
 kMhPS+HOKNhONhl+vuQY3/bPBGUdDUwLP3ZtPrym8nITtcG76NMmv4nzCgpydhxcsGaR
 2nDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=du2UDdqILKzhvf36FeCCMLmfeesSslaj79o4mP50EgI=;
 b=e3jLZ14xJUsHUfOBoBQPEEe5UeYwuIiJ86b9xLhtKx0QKCp2+tXZdAxpFhataocuYK
 HuZshEaTOHJQnVSrDwYm0a+25JT3Ig9+OvP5Qsyz/fgpOupVy3DcBQUphlYn9TuQ7eZm
 lzoX1SIuBxx6/+zYjuEWUdgjFVtR3sZYbU68fSaqzv0M3+NCDQWrolY2VFxmhHTQC8hK
 xyA2RTaF90nXa/BH+uagL+5r17bM/hoHM5h88Ay/f2sHEmu9Plt86du8GXk8Z6eeTtgm
 PbV6+U1g9ePyKvB3vSVpdo58qDVwxGfGkEZ492At4b0MUHNuxpZqNFL77m61jE0rtsie
 HAuQ==
X-Gm-Message-State: AGi0PuaO3XRyUugJDHaXamaaJtm9jCjBVyC4RVdk/DIE7VxYzvd1SAcT
 xGCcurQIQpFOyJR6LZGLzpMi196r
X-Google-Smtp-Source: APiQypIa7opFK1xf+XE8j+g7UrHv/xvtNdlr3IyY2X2wwHopqzyMk0mqnZs3zfH0yuLP1alP2qVeIw==
X-Received: by 2002:a63:d3:: with SMTP id 202mr25508644pga.378.1588039139957; 
 Mon, 27 Apr 2020 18:58:59 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.18.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 18:58:59 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 00/28] Initial Prefixed Instruction support
Date: Tue, 28 Apr 2020 11:57:46 +1000
Message-Id: <20200428015814.15380-1-jniethe5@gmail.com>
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
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
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
 arch/powerpc/lib/code-patching.c         | 305 ++++++++-------
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
 41 files changed, 1307 insertions(+), 582 deletions(-)
 create mode 100644 arch/powerpc/include/asm/inst.h
 create mode 100644 arch/powerpc/lib/inst.c
 create mode 100644 arch/powerpc/lib/test_code-patching.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.h

-- 
2.17.1

