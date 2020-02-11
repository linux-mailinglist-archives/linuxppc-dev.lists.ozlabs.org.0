Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F151589A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:36:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Gs343mQCzDqKs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:36:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TlljJs6L; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs0l4cPXzDqBP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:34:47 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id c23so3798408plz.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rWkvnU+gIxhYcB1ndawLyk0tag0eyiLVR3R/EOjiSMA=;
 b=TlljJs6LfI90GgHu9wAQyLTW5C4lUX9d82ysGcjz8iAyHMdpoNdEf7o6Rx8apkS7lv
 Uv6NfKVBng8KMmMHaKrfH0Dgezkph9+iqD+cRKOM5xHVS+JBgNQb7CvCROpZGhGfeh8S
 A8jupq3xDgxjFHZxqtg/mFcHShEY3maT2R0i7AwwtCKHRx8uU9Z9aAxXxGNCpPOtVuUT
 QCseY7CzDAzgblxL3iDc7KwYAt/2Pc286PXTE/vz0LinLT9g0Y+tzBxD1r+vypNK50LD
 rIyiT0/i4TFxGx1VTlldXT9dQ70HA57No3zpEgp5oDyq2Ec4WCu/HVJx6+u8HLkqOKXD
 y7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rWkvnU+gIxhYcB1ndawLyk0tag0eyiLVR3R/EOjiSMA=;
 b=knRmzcQaIQ3QDYjpzNA27ecd7ltewfxey/M0KLvhgxp0AjCvF0MOKaHXwynjyJDvQ2
 795nWuxP83jFdDw9688zKyVsvsCdJH8YjVqG1Brzq4v94ji4nCu4EOfcNa2rjX5NKPaC
 DQ9RhkHOaLIC25dUY2ZG0F2GBVfkentJkIQlu79Uh2AvqxYa9NHMKRKtUVDYJKmsl5uj
 cRlEpCNhy+LWnWUJB+xU3VwXNzHOHYFwK2Eol/W7wtgLvcW4Tghjf4Ug8CNx/PaiLqcs
 bWOkO0TKLqwPOef8brhPg25gawNxIhrBY8sWoAmT5D5WIEvvtE0HbKcAYE8TMppgkjO4
 9bdQ==
X-Gm-Message-State: APjAAAUPvQs4XXWVRyX/AMrUHlebtJ0cBvfBZMzjdraZPZastr1jxNpS
 mcNJtsXgTZHx318ANon+vxzWYx/9cxo=
X-Google-Smtp-Source: APXvYqz3ip1B1ECw8VvASaedx9JF5nQ8Y/Nu3QFttz94SLuax/tRQqDSNv65QhpHjafSRApZtgIZ4w==
X-Received: by 2002:a17:90a:a385:: with SMTP id
 x5mr1746442pjp.102.1581399284003; 
 Mon, 10 Feb 2020 21:34:44 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:34:43 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/13] Initial Prefixed Instruction support
Date: Tue, 11 Feb 2020 16:33:42 +1100
Message-Id: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net, bala24@linux.ibm.com
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

This v2 incorporates feedback from Daniel Axtens and and Balamuruhan
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

Jordan Niethe (12):
  powerpc: Define new SRR1 bits for a future ISA version
  powerpc sstep: Prepare to support prefixed instructions
  powerpc sstep: Add support for prefixed load/stores
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

 arch/powerpc/include/asm/kprobes.h    |   5 +-
 arch/powerpc/include/asm/ppc-opcode.h |   5 +
 arch/powerpc/include/asm/reg.h        |   7 +-
 arch/powerpc/include/asm/sstep.h      |   9 +-
 arch/powerpc/include/asm/uaccess.h    |  30 +++++
 arch/powerpc/include/asm/uprobes.h    |  16 ++-
 arch/powerpc/kernel/align.c           |   8 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c     |  23 ++++
 arch/powerpc/kernel/hw_breakpoint.c   |   8 +-
 arch/powerpc/kernel/kprobes.c         |  47 +++++--
 arch/powerpc/kernel/mce_power.c       |   6 +-
 arch/powerpc/kernel/optprobes.c       |  31 +++--
 arch/powerpc/kernel/optprobes_head.S  |   6 +
 arch/powerpc/kernel/traps.c           |  22 +++-
 arch/powerpc/kernel/uprobes.c         |   4 +-
 arch/powerpc/kvm/book3s_hv_nested.c   |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c   |   2 +-
 arch/powerpc/kvm/emulate_loadstore.c  |   2 +-
 arch/powerpc/lib/sstep.c              | 181 +++++++++++++++++++++++++-
 arch/powerpc/lib/test_emulate_step.c  |  30 ++---
 arch/powerpc/xmon/xmon.c              | 133 +++++++++++++++----
 21 files changed, 487 insertions(+), 90 deletions(-)

-- 
2.17.1

