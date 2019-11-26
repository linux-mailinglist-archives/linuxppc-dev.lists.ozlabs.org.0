Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E71931098AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:26:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXSS00hfzDqBs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:26:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="inamUJ8I"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXN97545zDqBs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:30 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id z188so8373154pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkZ6ivCZqkKAehepgllab1ym8y1J5g593ht8YeOUxgA=;
 b=inamUJ8IF21aY5kjykIjaZDpMzJeA/qd1eh1ymocoqjpSwcmpjUbLMcy9z+8O1xXTf
 U/jck0lmVK8Be4D60F5akgpOiANcnI5ZK7znydzG2dNY/kcVcsNW7QTt64TKxyM6VvEt
 NyqSq6faEeHSchGR+UzPUkt6BFREzyPZLsx+cVQBd3+//KIar0wsVpnEQ5HUc416HctO
 bQw6Pjxyqh6Y7Zx8A9kjFEVM1tUPaPBi90qg7wL6QPitdPnTN+a0wcOp29ngWMBLOyZq
 Kpr7yyJjpiC8zL7kJ/m+4xKypO4/ijLJdfA7JHvjnetQHHhbjO8Se7ahm2cervw/CSGy
 rgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkZ6ivCZqkKAehepgllab1ym8y1J5g593ht8YeOUxgA=;
 b=aDOqcjGKHL6wT9dRTOcCcXhyGVeYRi0JP64PUxn+5MxdArAS13lLtRfbrMISXFubWA
 n6DOM/5QyzuIrCwvvw98c2ZS3Qt05PLMuemHauvR2tlyPo09UO5vFun3eDkAiWcr61bv
 uG2kU/SFLQ3jf9A4MrOOFvPX/PjwXEYjmUh7Ae8knv1LqDoh8S17b6hy5QQ1jLpGbCem
 lmWNhsL3qaacZ59FGVKgy7ZCB2KkFMOuaa9rWE0Nk4hCHW+eVMCwdedGBekQtCE0Cp5+
 jbmjpt5lVw7EOaqmqRBAd1DoxODqGMRl+Yu4YIR+Olif8I3Qy6CoWOF0zhPFt5GXv6of
 B0nQ==
X-Gm-Message-State: APjAAAW1fg+wXY4U7xMoIFkv9SZebHOXma0mmzmCDNoqe+B5n/8Em3yz
 L6LbHeIxZH2m0Jv006BI0cpIuTRt
X-Google-Smtp-Source: APXvYqwAI0QsffSnbLJVl+GoEctZLkcyQVjUzVi6gfOrffl0VeExYmueIV1GyIXS+09BIWXhn3NBQA==
X-Received: by 2002:a63:fb15:: with SMTP id o21mr36232597pgh.193.1574745746766; 
 Mon, 25 Nov 2019 21:22:26 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:26 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/18] Initial Prefixed Instruction support
Date: Tue, 26 Nov 2019 16:21:23 +1100
Message-Id: <20191126052141.28009-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A future revision of the ISA will introduce prefixed instructions. A
prefixed instruction is composed of a 4-byte prefix followed by a
4-byte suffix.

All prefixes have the major opcode 1. A prefix will never be a valid
word instruction. A suffix may be an existing word instruction or a new
instruction.

The new instruction formats are:
    * Eight-Byte Load/Store Instructions
    * Eight-Byte Register-to-Register Instructions
    * Modified Load/Store Instructions
    * Modified Register-to-Register Instructions

This series enables prefixed instructions and extends the instruction
emulation to support them. Then the places where prefixed instructions
might need to be emulated are updated.

A future series will add prefixed instruction support to guests running
in KVM.

Alistair Popple (1):
  powerpc: Enable Prefixed Instructions

Jordan Niethe (17):
  powerpc: Add BOUNDARY SRR1 bit for future ISA version
  powerpc: Add PREFIXED SRR1 bit for future ISA version
  powerpc: Rename Bit 35 of SRR1 to indicate new purpose
  powerpc sstep: Prepare to support prefixed instructions
  powerpc sstep: Add support for prefixed integer load/stores
  powerpc sstep: Add support for prefixed floating-point load/stores
  powerpc sstep: Add support for prefixed VSX load/stores
  powerpc sstep: Add support for prefixed fixed-point arithmetic
  powerpc: Support prefixed instructions in alignment handler
  powerpc/traps: Check for prefixed instructions in
    facility_unavailable_exception()
  powerpc/xmon: Add initial support for prefixed instructions
  powerpc/xmon: Dump prefixed instructions
  powerpc/kprobes: Support kprobes on prefixed instructions
  powerpc/uprobes: Add support for prefixed instructions
  powerpc/hw_breakpoints: Initial support for prefixed instructions
  powerpc: Add prefix support to mce_find_instr_ea_and_pfn()
  powerpc/fault: Use analyse_instr() to check for store with updates to
    sp

 arch/powerpc/include/asm/kprobes.h    |   5 +-
 arch/powerpc/include/asm/ppc-opcode.h |   3 +
 arch/powerpc/include/asm/reg.h        |   7 +-
 arch/powerpc/include/asm/sstep.h      |   8 +-
 arch/powerpc/include/asm/uaccess.h    |  30 +++++
 arch/powerpc/include/asm/uprobes.h    |  18 ++-
 arch/powerpc/kernel/align.c           |   8 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c     |  23 ++++
 arch/powerpc/kernel/hw_breakpoint.c   |   8 +-
 arch/powerpc/kernel/kprobes.c         |  46 +++++--
 arch/powerpc/kernel/mce_power.c       |   6 +-
 arch/powerpc/kernel/optprobes.c       |  31 +++--
 arch/powerpc/kernel/optprobes_head.S  |   6 +
 arch/powerpc/kernel/traps.c           |  18 ++-
 arch/powerpc/kernel/uprobes.c         |   4 +-
 arch/powerpc/kvm/book3s_hv_nested.c   |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c   |   2 +-
 arch/powerpc/kvm/emulate_loadstore.c  |   2 +-
 arch/powerpc/lib/sstep.c              | 180 +++++++++++++++++++++++++-
 arch/powerpc/lib/test_emulate_step.c  |  30 ++---
 arch/powerpc/mm/fault.c               |  39 ++----
 arch/powerpc/xmon/xmon.c              | 132 +++++++++++++++----
 22 files changed, 490 insertions(+), 118 deletions(-)

-- 
2.20.1

