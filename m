Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3362AEE65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 11:05:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWL2Z5hn2zDqFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 21:05:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kgZ/GVKr; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWKZH1XcHzDqlB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:44:21 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id w6so1309336pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AXnPSJi6i8MvfIPNKC8dMDV7plxTzs6RfojRNbU+/6g=;
 b=kgZ/GVKr/7MleL/G5yydQ2NP01GNs1Vdto5oLyuUUPGKUKdmxzG3r59HM+uxGO3x2r
 mwTC5uG79HbU9Z369e+3wqYrv6sFTOb2RZm6VIvhGa3M1o5TIuekBQHkeozXoHycJW3H
 xHD5RMl1PM88Ggm4lSxtzlUwRRl6iGr1mTEvBO+ICTxMWhmHV2FsihokI5w6bYR3HWfL
 eQpL9sbsH/bnWUGqGRicMg63JksA4WBIrYdvokD/Hocz5R+OE+Qndqyeno/nAje1pZai
 JFN152QR1+DWGgfLAul9G/pAna8v8SR2nsU6EQPdK+uPcELqQJLmxHgaUwbkMTxHXycR
 TWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AXnPSJi6i8MvfIPNKC8dMDV7plxTzs6RfojRNbU+/6g=;
 b=aqfpezyCDra4yLVB5sxuiDTJoO83FHz6QaV7vCG3B9Xwxa2y13sF1ej/RVoXaLZZzM
 TFon31bRsaRLvh1pBZJsWOpZM39+X0rl1BYikkyj50LWquJRMezWB/mv33udGmIvkwCH
 aiewas5mfybbsYFsba0iuD7ofbDNe8SZvKGeniQ1C+JvfqHjZYf0NT7ENLU9AoxfqvPX
 gN8d5XIAxpVNEoJnzKWFJQRA6tsopjpc3GAaIR9IjOgPLqej/BFERERd3qQgI0ZxlOQW
 iOIKX3bKn42Z+Cd+TT4rM9xPw2jPvN2XQsqnq2duj+YrtTlElnxsG0h3Zv/zdkG+Su2P
 gMZQ==
X-Gm-Message-State: AOAM532Z5XruI796gDPwpbEPLEvMgWv7qVahY2Dqz9j7bgrJRCisw0lu
 H8a5thAdOvhr91skn+UjjepLDYfAamg=
X-Google-Smtp-Source: ABdhPJxQWMkcgFBAavoZIIwbnDMpMfM8NHE8veilUS3CNjBJx4Mlbzkb0asqN6fUtHuV+E8jOZrrXg==
X-Received: by 2002:a62:5406:0:b029:18c:8dac:4a99 with SMTP id
 i6-20020a6254060000b029018c8dac4a99mr1070876pfb.19.1605087856050; 
 Wed, 11 Nov 2020 01:44:16 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a3sm2046129pfd.58.2020.11.11.01.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:44:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/19] powerpc: interrupt wrappers
Date: Wed, 11 Nov 2020 19:43:51 +1000
Message-Id: <20201111094410.3038123-1-npiggin@gmail.com>
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

This adds interrupt handler wrapper functions, similar to the
generic / x86 code, and moves several common operations into them
from either asm or open coded in the individual handlers.

Since v1:
- Fixed a couple of compile issues
- Fixed perf weirdness (sometimes NMI, sometimes not)
- Also move irq_enter/exit into wrappers

Thanks,
Nick

Nicholas Piggin (19):
  powerpc/64s: move the last of the page fault handling logic to C
  powerpc: remove arguments from fault handler functions
  powerpc: bad_page_fault, do_break get registers from regs
  powerpc/perf: move perf irq/nmi handling details into traps.c
  powerpc: interrupt handler wrapper functions
  powerpc: add interrupt wrapper entry / exit stub functions
  powerpc: add interrupt_cond_local_irq_enable helper
  powerpc/64: context tracking remove _TIF_NOHZ
  powerpc/64: context tracking move to interrupt wrappers
  powerpc/64: add context tracking to asynchronous interrupts
  powerpc: handle irq_enter/irq_exit in interrupt handler wrappers
  powerpc/64s: move context tracking exit to interrupt exit path
  powerpc/64s: reconcile interrupts in C
  powerpc/64: move account_stolen_time into its own function
  powerpc/64: entry cpu time accounting in C
  powerpc: move NMI entry/exit code into wrapper
  powerpc/64s: move NMI soft-mask handling to C
  powerpc/64s: runlatch interrupt handling in C
  powerpc/64s: power4 nap fixup in C

 arch/Kconfig                               |   6 -
 arch/powerpc/Kconfig                       |   1 -
 arch/powerpc/include/asm/asm-prototypes.h  |  29 --
 arch/powerpc/include/asm/bug.h             |   5 +-
 arch/powerpc/include/asm/cputime.h         |  15 +
 arch/powerpc/include/asm/debug.h           |   3 +-
 arch/powerpc/include/asm/hw_irq.h          |   9 -
 arch/powerpc/include/asm/interrupt.h       | 403 +++++++++++++++++++++
 arch/powerpc/include/asm/ppc_asm.h         |  24 --
 arch/powerpc/include/asm/processor.h       |   1 +
 arch/powerpc/include/asm/thread_info.h     |  10 +-
 arch/powerpc/include/asm/time.h            |   2 +
 arch/powerpc/kernel/dbell.c                |  15 +-
 arch/powerpc/kernel/entry_32.S             |  14 +-
 arch/powerpc/kernel/exceptions-64e.S       |   6 +-
 arch/powerpc/kernel/exceptions-64s.S       | 307 ++--------------
 arch/powerpc/kernel/head_40x.S             |  10 +-
 arch/powerpc/kernel/head_8xx.S             |  11 +-
 arch/powerpc/kernel/head_book3s_32.S       |  12 +-
 arch/powerpc/kernel/head_booke.h           |   4 +-
 arch/powerpc/kernel/idle_book3s.S          |   4 +
 arch/powerpc/kernel/irq.c                  |   7 +-
 arch/powerpc/kernel/mce.c                  |  16 +-
 arch/powerpc/kernel/process.c              |   7 +-
 arch/powerpc/kernel/ptrace/ptrace.c        |   4 -
 arch/powerpc/kernel/signal.c               |   4 -
 arch/powerpc/kernel/syscall_64.c           |  30 +-
 arch/powerpc/kernel/tau_6xx.c              |   5 +-
 arch/powerpc/kernel/time.c                 |   7 +-
 arch/powerpc/kernel/traps.c                | 227 ++++++------
 arch/powerpc/kernel/watchdog.c             |  15 +-
 arch/powerpc/kvm/book3s_hv.c               |   1 +
 arch/powerpc/kvm/book3s_hv_builtin.c       |   1 +
 arch/powerpc/mm/book3s64/hash_utils.c      |  82 +++--
 arch/powerpc/mm/book3s64/slb.c             |  12 +-
 arch/powerpc/mm/fault.c                    |  80 +++-
 arch/powerpc/perf/core-book3s.c            |  35 +-
 arch/powerpc/perf/core-fsl-emb.c           |  25 --
 arch/powerpc/platforms/8xx/machine_check.c |   2 +-
 arch/powerpc/platforms/powernv/idle.c      |   1 +
 40 files changed, 766 insertions(+), 686 deletions(-)
 create mode 100644 arch/powerpc/include/asm/interrupt.h

-- 
2.23.0

