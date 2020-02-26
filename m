Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A8616F65C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:12:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2Sz1qvwzDqQd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:12:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H1FCCQSo; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2Mv2t2PzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:11 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id t14so732769plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yYMf2LxbA7xgi7+LRn48rrRU5dVgPL3Xl9J1yczVt8s=;
 b=H1FCCQSoy5IqFJFSsuACsKkuKd0LycEIsOOebA0vbpOKgm0IVkVD11w/ZjPCUpgY57
 F23I5Xflu5M2A/q4bfpCMofNyfSGNtj88lYKwKhGUHGdYS5WLXXmkSM3ncpREd8L3Thb
 viBpzOukMnuFqPNhZw1QyCBWVwfr+x+KLNsrGh8ytF38EpXZdCVIGYaMWReCHv4G2lYU
 /ZACs3JPDQSOqhwK8AbKr2kquWXEuuHQtNys2y0UkraCmv0rr7mLOD8k28xBWVIjzEYd
 DatijV0qAer39+0ZWUCv1eghz2PqU/01ud+31hejCGOvuE6HwLRbBkkP6KBmWTryVHbu
 wZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yYMf2LxbA7xgi7+LRn48rrRU5dVgPL3Xl9J1yczVt8s=;
 b=qb0UrPlCG3QC6ULRiHGQhXJm+hBQd/VW+U74vlct3kpFKtSbSHuf1Iz84GJDSiSc3c
 qN0RWQec133M9zYj4rBbrRwN4SH61Q6I86oYAYCjjEmLUSsy56xsZJjcbTff7o0irX4O
 NA79xQKpBBBa79tQ4BV65slDoGH+1N1HmgosqOAtkmEZlgdN6lXct9Egd44RFW3YQQN+
 5kd6e6zALMBKUmsPd7EP0r/TxD0QphKRV6YvTmeXnGC8u6p0OR1KPZtYiHyQd+q7ZEP4
 I0S9UkscNcAX+tOC0rRyeQKIot+Iwozo4jiYrZRglJknhah5weIF3RiKGGCsnJ7nmIGa
 CLlw==
X-Gm-Message-State: APjAAAWRpxR/7RfABdbnFUDe73VrZvi/5lejsKbfaYTptb5AkX1ZGeTr
 WNARQPk+pbmgAj6/qoaelh/dIhrf2cE=
X-Google-Smtp-Source: APXvYqxkNg1eqkwPFl4gVbq/WTW6Xqb63Y4LnEKO9Fyp1lQgDGjBj+bCVSE7dOZG6gTQQlD5UaHJCQ==
X-Received: by 2002:a17:902:7004:: with SMTP id
 y4mr1968559plk.263.1582690088120; 
 Tue, 25 Feb 2020 20:08:08 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:07 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/14] Initial Prefixed Instruction support
Date: Wed, 26 Feb 2020 15:07:02 +1100
Message-Id: <20200226040716.32395-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
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

Jordan Niethe (13):
  powerpc: Define new SRR1 bits for a future ISA version
  powerpc sstep: Prepare to support prefixed instructions
  powerpc sstep: Add support for prefixed load/stores
  powerpc sstep: Add support for prefixed fixed-point arithmetic
  powerpc: Support prefixed instructions in alignment handler
  powerpc/traps: Check for prefixed instructions in
    facility_unavailable_exception()
  powerpc/xmon: Remove store_inst() for patch_instruction()
  powerpc/xmon: Add initial support for prefixed instructions
  powerpc/xmon: Dump prefixed instructions
  powerpc/kprobes: Support kprobes on prefixed instructions
  powerpc/uprobes: Add support for prefixed instructions
  powerpc/hw_breakpoints: Initial support for prefixed instructions
  powerpc: Add prefix support to mce_find_instr_ea_and_pfn()

 arch/powerpc/include/asm/kprobes.h    |   5 +-
 arch/powerpc/include/asm/ppc-opcode.h |  13 ++
 arch/powerpc/include/asm/reg.h        |   7 +-
 arch/powerpc/include/asm/sstep.h      |   9 +-
 arch/powerpc/include/asm/uaccess.h    |  25 ++++
 arch/powerpc/include/asm/uprobes.h    |  16 ++-
 arch/powerpc/kernel/align.c           |   8 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c     |  23 ++++
 arch/powerpc/kernel/hw_breakpoint.c   |   9 +-
 arch/powerpc/kernel/kprobes.c         |  43 ++++--
 arch/powerpc/kernel/mce_power.c       |   6 +-
 arch/powerpc/kernel/optprobes.c       |  31 +++--
 arch/powerpc/kernel/optprobes_head.S  |   6 +
 arch/powerpc/kernel/traps.c           |  22 ++-
 arch/powerpc/kernel/uprobes.c         |   4 +-
 arch/powerpc/kvm/book3s_hv_nested.c   |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c   |   2 +-
 arch/powerpc/kvm/emulate_loadstore.c  |   2 +-
 arch/powerpc/lib/sstep.c              | 191 +++++++++++++++++++++++++-
 arch/powerpc/lib/test_emulate_step.c  |  30 ++--
 arch/powerpc/xmon/xmon.c              | 140 +++++++++++++++----
 21 files changed, 497 insertions(+), 97 deletions(-)

-- 
2.17.1

