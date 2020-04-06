Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5019F152
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:12:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wjtr0J2KzDq5t
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j6l50Q6n; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjrQ1jYWzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:09:57 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id k18so5613838pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5uSDLy4Masggn8CfObS4WNdapRqg8hDG2OwZ9RhAfcI=;
 b=j6l50Q6nyQ3OOG5xAdnXkhkqBZ2CViupC+UJk+RbuEDwKK8Vlf9hRg6jb6YTou3P/5
 mYTX7k9CI86bQkdj25y/r2G9QVnHaud0r0ObgP0wfmPahti68XohsYtYzHPR1lYPuYSI
 JVT4+uiGtEvjSCfbjxkX2ZcWBBTfn8EVZo4Qc0xkS8Y5hD04spPvva/3/l4vizFpMNfR
 o61aQQfOJ8t+X6cIt29pYTu/7IXT2nQf9NipPFeRHz8xRx4ZcBocJnyIBlQToM1PIRkK
 p8X0Ncr+0aLt24rahr79UcIUdXuI6LBUNmW1YB0OYp3D1Vo8Yv+xmfM4YqrcCo1DF6m+
 fgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5uSDLy4Masggn8CfObS4WNdapRqg8hDG2OwZ9RhAfcI=;
 b=kveqLOFRQQrtCwcJiU/DZgtyTvwTBlhAYSYHzjgYIvEmm6lWT2vZeFApQ13iXzQL1r
 JV0x6QzXny4XNnqaCZSvAYuD/ncFi0NW2pQ8P8RL5Aw8cDIo9MJYwSmzqeI60G2d/B6J
 kUHVI02/7PO2cqhHJxv+QWrcdyTJkgQTuG65xNQdIHucXdG7vUr3GddyRZRYy6KsCwru
 cu2xqolglf3feHNxkGYU77yLdz6bDOPKr8DeSLvlGtpsqGbfoO1pqCyhGHVmaFl726l2
 GQo+oqMZ5dBb/01gazmNzBDJ22CKyHvGLfLJp2VHjIwgTCnK/Y4r4NwVCNPCSTe1lzZk
 rzIw==
X-Gm-Message-State: AGi0PuZdJyLKEr861TVX/iz47YQxHHh7od+KVYtMuHFK1n3s2vIiNspN
 GOgS7cSxXKtTpHWm7ZexuAzt9jZA
X-Google-Smtp-Source: APiQypIgQlzSb9w8zUyC7jmLvHfORwoc/tpK8RyKRwhquQuxkZsqG8Ni93Csm3UGh/2KFQky/5fAJA==
X-Received: by 2002:a17:90a:aa95:: with SMTP id
 l21mr9769865pjq.4.1586160593527; 
 Mon, 06 Apr 2020 01:09:53 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:09:53 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 00/21] Initial Prefixed Instruction support
Date: Mon,  6 Apr 2020 18:09:15 +1000
Message-Id: <20200406080936.7180-1-jniethe5@gmail.com>
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

Jordan Niethe (20):
  powerpc/xmon: Remove store_inst() for patch_instruction()
  powerpc/xmon: Move out-of-line instructions to text section
  powerpc: Change calling convention for create_branch() et. al.
  powerpc: Use a macro for creating instructions from u32s
  powerpc: Use a function for getting the instruction op code
  powerpc: Use an accessor for instructions
  powerpc: Use a function for byte swapping instructions
  powerpc: Introduce functions for instruction equality
  powerpc: Use a datatype for instructions
  powerpc: Use a function for reading instructions
  powerpc: Define and use __get_user_instr{,inatomic}()
  powerpc: Introduce a function for reporting instruction length
  powerpc/xmon: Use a function for reading instructions
  powerpc/xmon: Move insertion of breakpoint for xol'ing
  powerpc: Make test_translate_branch() independent of instruction
    length
  powerpc: Define new SRR1 bits for a future ISA version
  powerpc64: Add prefixed instructions to instruction data type
  powerpc: Support prefixed instructions in alignment handler
  powerpc sstep: Add support for prefixed load/stores
  powerpc sstep: Add support for prefixed fixed-point arithmetic

 arch/powerpc/include/asm/code-patching.h |  37 +-
 arch/powerpc/include/asm/inst.h          | 106 ++++++
 arch/powerpc/include/asm/kprobes.h       |   2 +-
 arch/powerpc/include/asm/reg.h           |   7 +-
 arch/powerpc/include/asm/sstep.h         |  15 +-
 arch/powerpc/include/asm/uaccess.h       |  28 ++
 arch/powerpc/include/asm/uprobes.h       |   7 +-
 arch/powerpc/kernel/align.c              |  13 +-
 arch/powerpc/kernel/epapr_paravirt.c     |   5 +-
 arch/powerpc/kernel/hw_breakpoint.c      |   5 +-
 arch/powerpc/kernel/jump_label.c         |   5 +-
 arch/powerpc/kernel/kgdb.c               |   9 +-
 arch/powerpc/kernel/kprobes.c            |  24 +-
 arch/powerpc/kernel/mce_power.c          |   5 +-
 arch/powerpc/kernel/module_64.c          |   3 +-
 arch/powerpc/kernel/optprobes.c          |  91 +++--
 arch/powerpc/kernel/optprobes_head.S     |   3 +
 arch/powerpc/kernel/security.c           |   9 +-
 arch/powerpc/kernel/setup_32.c           |   4 +-
 arch/powerpc/kernel/trace/ftrace.c       | 190 ++++++----
 arch/powerpc/kernel/traps.c              |  20 +-
 arch/powerpc/kernel/uprobes.c            |   3 +-
 arch/powerpc/kernel/vecemu.c             |  20 +-
 arch/powerpc/kvm/book3s_hv_nested.c      |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c      |   2 +-
 arch/powerpc/kvm/emulate_loadstore.c     |   2 +-
 arch/powerpc/lib/code-patching.c         | 289 +++++++-------
 arch/powerpc/lib/feature-fixups.c        |  69 ++--
 arch/powerpc/lib/sstep.c                 | 455 ++++++++++++++++-------
 arch/powerpc/lib/test_emulate_step.c     |  56 +--
 arch/powerpc/perf/core-book3s.c          |   4 +-
 arch/powerpc/xmon/Makefile               |   2 +-
 arch/powerpc/xmon/xmon.c                 |  94 +++--
 arch/powerpc/xmon/xmon_bpts.S            |  10 +
 arch/powerpc/xmon/xmon_bpts.h            |   8 +
 35 files changed, 1042 insertions(+), 562 deletions(-)
 create mode 100644 arch/powerpc/include/asm/inst.h
 create mode 100644 arch/powerpc/xmon/xmon_bpts.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.h

-- 
2.17.1

