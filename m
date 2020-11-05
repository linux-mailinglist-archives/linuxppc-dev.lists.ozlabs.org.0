Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7902A8116
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 15:38:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRmNZ2jHhzDr0N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 01:38:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Olrk6qFK; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJ66r3yzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:34:46 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id ie6so169182pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+saBkwSex9exLhKqawXiud33tazcS76U5d/lj0g4RU=;
 b=Olrk6qFKhz//MIrC+raNOutPXijvTZZ44K24SEpADcKcvCAy2Jw535vfOqx/XDNxW6
 H8AnBNpJI+/K4kv5S6GcPU2eGZWlDVaNx6u8Ag84XledTWPFk5Yxe/F/ViDi8eGKGtdB
 aXTRPtIA/+AZjIyUaKvNiPMpKPH1eLxtBfPJ5blI8HR2Bg8A27/0jtwIgrfUdPYxtpWM
 IpBlOkAiVbWfzVQ6olqr6HSDBWHE6+rdg6C+IyWRv3QiG5i4r5BIW2iN81/s6CsqrF0x
 YobbHxwDaaq4+XwxEe9UXhcE2artnJg+arwtQDIeb360bgzlNNe31l7tVz3/QzPl2tS7
 1aXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+saBkwSex9exLhKqawXiud33tazcS76U5d/lj0g4RU=;
 b=UjWLmzt3dtWMVPwm5TiLnZJcajrxTuJEarjrNEd8T8DhXVLITYC9aDkQCTrsYL8nuS
 tJrHzCekTC1c4KJYbL+FFNI3wsYe41nW8jR3Ii68JjBVw+JHm5bqUW+lAO7nKNG+vfn4
 rYRVMATOucCaBi/YE0QB2tjmiHrLBDCClFWWazQXiFAtFlNADO892cfDURFW8VfjdTur
 1LhwvMBh893wkejToyoWHMx/fQ/HLFK13kB6T3+9/6XOqtbBP7/y03Jx9xjG50cj8jV2
 KTJzXT0El4saquE6AiATYSvFnBdVC5S5Xmp5E63212NI+vliiUhwQB6EhdenWjHRgxcz
 NHgw==
X-Gm-Message-State: AOAM533NxmxYjbz/BE31AnMunF4ZjKPlNIxLNLcdRPMNZ90akqs6uW2g
 rW8O33yhJYirxfuQQ/wVVnTzpBBJQQk=
X-Google-Smtp-Source: ABdhPJyHwzVfIHynGV47wyIdyRglnauWxx66hs9KLJXosqcPVqus1jSFE602GMPPofqv0LUzyapOkg==
X-Received: by 2002:a17:90a:4482:: with SMTP id
 t2mr2653625pjg.44.1604586879274; 
 Thu, 05 Nov 2020 06:34:39 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:34:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/18] powerpc: interrupt wrappers
Date: Fri,  6 Nov 2020 00:34:13 +1000
Message-Id: <20201105143431.1874789-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a slightly more polished and tested version. 64e seems to
work okay even with context tracking, and 32s at least boots.

This moves quite a bit more code and C function calls out from asm
to C, it tightens up context tracking significantly on 64s, and
generally moves things closer to the generic entry code.

Thanks,
Nick

Nicholas Piggin (18):
  powerpc/64s: move the last of the page fault handling logic to C
  powerpc: remove arguments from fault handler functions
  powerpc: bad_page_fault, do_break get registers from regs
  powerpc: interrupt handler wrapper functions
  powerpc: add interrupt wrapper entry / exit stub functions
  powerpc: add interrupt_cond_local_irq_enable helper
  powerpc/64: context tracking remove _TIF_NOHZ
  powerpc/64: context tracking move to interrupt wrappers
  powerpc/64: add context tracking to asynchronous interrupts
  powerpc/64s: move context tracking exit to interrupt exit path
  powerpc/64s: reconcile interrupts in C
  powerpc/64: move account_stolen_time into its own function
  powerpc/64: entry cpu time accounting in C
  powerpc: move NMI entry/exit code into wrapper
  powerpc/64s: move NMI soft-mask handling to C
  powerpc/64s: runlatch interrupt handling in C
  powerpc/64s: power4 nap fixup in C
  powerpc/64s: move power4 idle entirely to C

 arch/Kconfig                               |   6 -
 arch/powerpc/Kconfig                       |   1 -
 arch/powerpc/include/asm/asm-prototypes.h  |  29 --
 arch/powerpc/include/asm/bug.h             |   4 +-
 arch/powerpc/include/asm/cputime.h         |  15 +
 arch/powerpc/include/asm/debug.h           |   3 +-
 arch/powerpc/include/asm/hw_irq.h          |   9 -
 arch/powerpc/include/asm/interrupt.h       | 375 +++++++++++++++++++++
 arch/powerpc/include/asm/ppc_asm.h         |  24 --
 arch/powerpc/include/asm/processor.h       |   1 +
 arch/powerpc/include/asm/thread_info.h     |  10 +-
 arch/powerpc/include/asm/time.h            |   2 +
 arch/powerpc/kernel/dbell.c                |   3 +-
 arch/powerpc/kernel/entry_32.S             |  14 +-
 arch/powerpc/kernel/exceptions-64e.S       |   6 +-
 arch/powerpc/kernel/exceptions-64s.S       | 307 ++---------------
 arch/powerpc/kernel/head_40x.S             |  10 +-
 arch/powerpc/kernel/head_8xx.S             |  11 +-
 arch/powerpc/kernel/head_book3s_32.S       |   6 +-
 arch/powerpc/kernel/head_booke.h           |   4 +-
 arch/powerpc/kernel/idle.c                 |  25 +-
 arch/powerpc/kernel/idle_book3s.S          |  18 -
 arch/powerpc/kernel/irq.c                  |   3 +-
 arch/powerpc/kernel/mce.c                  |  16 +-
 arch/powerpc/kernel/process.c              |   7 +-
 arch/powerpc/kernel/ptrace/ptrace.c        |   4 -
 arch/powerpc/kernel/signal.c               |   4 -
 arch/powerpc/kernel/syscall_64.c           |  30 +-
 arch/powerpc/kernel/tau_6xx.c              |   2 +-
 arch/powerpc/kernel/time.c                 |   3 +-
 arch/powerpc/kernel/traps.c                | 200 +++++------
 arch/powerpc/kernel/watchdog.c             |  15 +-
 arch/powerpc/kvm/book3s_hv.c               |   1 +
 arch/powerpc/kvm/book3s_hv_builtin.c       |   1 +
 arch/powerpc/mm/book3s64/hash_utils.c      |  82 +++--
 arch/powerpc/mm/book3s64/slb.c             |  12 +-
 arch/powerpc/mm/fault.c                    |  80 ++++-
 arch/powerpc/platforms/8xx/machine_check.c |   2 +-
 arch/powerpc/platforms/powernv/idle.c      |   1 +
 39 files changed, 719 insertions(+), 627 deletions(-)
 create mode 100644 arch/powerpc/include/asm/interrupt.h

-- 
2.23.0

