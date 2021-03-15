Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB133C902
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:05:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzr7k2wRQz30hR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:05:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ug6jJkNl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ug6jJkNl; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr6n4WJgz301g
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:15 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso326359pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/LTny7Dqd6lYQHnUAXLQrJOz+mm91DMlgEGFpzaxUo=;
 b=Ug6jJkNlervLMBBOgmasao/+wGvy8vH/f7D/Zvbz5PlE9aB7ytAX+nV1ilq9zzJ/F4
 /GAhiPzSYWhHgH1nIwNh0pRU0116agGkGvehRnhFXPV5TQKuZZj02UOP3A/bmI+KREhn
 +VLi9BDa44JN5CMspiGr+9ucFuzqzfSbkyGhavpty/3UsJrwGfF08GlUINs3wKT8zXM0
 GeJXLlp+bU8SarfenGRzEVIVbcrA9X4LNl7wU1zEJqyxZZ6sBiZwFOpqMSKORFv9d2lT
 220UpVzHCfsA8Mt6sO8ATGqCfckJ29xHWParpRW5Chi7pkT2+m3FWn61+70neFNssFr5
 mnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/LTny7Dqd6lYQHnUAXLQrJOz+mm91DMlgEGFpzaxUo=;
 b=nN8cEvlJFoLFRtc0n97V5P6zjt25T3cCeMfoNGtQNmG4ZcZr5UnHAEx8LXKw+q71rH
 iNOYyFNJ4gR9BSZGQqY9F2u+tcv4krkfxjNs/70lPMDdUCS4WbfrsrEZ59QBzbHpLsAl
 fE54dNQNWfQ5e++Ar1fq9JuOLunOf1Zud0GMom5lbqBpUvvM7HtSG+OH/AobNq0x2/dA
 akfRhbHkI2HpVO/2BHPMXgBb18N6w0pUR1n/xJMZvr9PllvWmb7GERjbQ00cEAEQhFcy
 0eZkhmmTaZeakf1dro+TtsnXGiRfpE9iPRvJijAyW2ScRP8KA7XLpODXBVkz4nW1UrT9
 iIRQ==
X-Gm-Message-State: AOAM531Yij63I6Zc9fKqRUJ9IRa6CYlAqZpmQCRvi/zwuwqUNOMqlA6T
 AURs0DNa7P3Bvu7V6+9ox+PvIYYwMuk=
X-Google-Smtp-Source: ABdhPJwkxscl4RnmOgivx4umRpSir50iuZire+ay+lLQsWSM7j7M/0lZ+dqmZsTT21a6PpDC7BZXMA==
X-Received: by 2002:a17:90a:bb07:: with SMTP id
 u7mr1247077pjr.49.1615845851421; 
 Mon, 15 Mar 2021 15:04:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/14] powerpc/64: fast interrupt exits
Date: Tue, 16 Mar 2021 08:03:48 +1000
Message-Id: <20210315220402.260594-1-npiggin@gmail.com>
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

This applies to powerpc next-test (particularly Christophe's ppc32
interrupt conversion) plus the 64e interrupt conversion patches I
recently posted.

This series attempts to improve the speed of interrupts and system calls
in three major ways.

Firstly, the SRR/HSRR registers do not need to be reloaded if they were
not used or clobbered fur the duration of the interrupt. 64e does not
implement this, but it could.

Secondly, an alternate return location facility is added for soft-masked
asynchronous interrupts and then that's used to set everything up for
return without having to disable MSR RI or EE.

Thirdly, mtmsrd and mtspr are reduced by various means. This is mostly
specific to 64s.

After this series, the entire system call / interrupt handler fast path
executes no mtsprs and one mtmsrd to enable interrupts initially, and
the system call vectored path doesn't even need to do that. This gives a
decent performance benefit. On POWER9 with a powernv_defconfig without
VIRT_CPU_ACCOUNTING_NATIVE, no meltdown workarounds, gettid sc system
call goes from 481 -> 344 cycles, gettid scv 345->299 cycles, and page
fault 1225->1064 cycles.

Since RFC, this no longer breaks 64e, several techniques for reducing
MSR/SPR updates become possible or tidier with interrupt wrappers, and
security fallback flushes aren't broken, usual bug fixes.

Thanks,
Nick

Nicholas Piggin (14):
  powerpc: remove interrupt exit helpers unused argument
  powerpc/64s: security fallback improvement
  powerpc/64s: introduce different functions to return from SRR vs HSRR
    interrupts
  powerpc/64s: avoid reloading (H)SRR registers if they are still valid
  powerpc/64: move interrupt return asm to interrupt_64.S
  powerpc/64s: save one more register in the masked interrupt handler
  powerpc/64: allow alternate return locations for soft-masked
    interrupts
  powerpc/64: interrupt soft-enable race fix
  powerpc/64: treat low kernel text as irqs soft-masked
  powerpc/64: use interrupt restart table to speed up return from
    interrupt
  powerpc/64e: Remove PPR from pt_regs
  powerpc/64s: system call avoid setting MSR[RI] until we set MSR[EE]
  powerpc/64: handle MSR EE and RI in interrupt entry wrapper
  powerpc/64s: use the same default PPR for user and kernel

 arch/powerpc/Kconfig.debug                 |   5 +
 arch/powerpc/include/asm/asm-prototypes.h  |   4 +-
 arch/powerpc/include/asm/exception-64e.h   |   6 +
 arch/powerpc/include/asm/exception-64s.h   |  52 +-
 arch/powerpc/include/asm/feature-fixups.h  |  18 +
 arch/powerpc/include/asm/head-64.h         |   2 +-
 arch/powerpc/include/asm/interrupt.h       |  41 +-
 arch/powerpc/include/asm/paca.h            |   9 +-
 arch/powerpc/include/asm/ppc_asm.h         |   8 +
 arch/powerpc/include/asm/processor.h       |   4 +-
 arch/powerpc/include/asm/ptrace.h          |  65 +-
 arch/powerpc/kernel/asm-offsets.c          |   7 +-
 arch/powerpc/kernel/entry_64.S             | 516 --------------
 arch/powerpc/kernel/exceptions-64e.S       |  53 +-
 arch/powerpc/kernel/exceptions-64s.S       | 384 +++++------
 arch/powerpc/kernel/fpu.S                  |   2 +
 arch/powerpc/kernel/head_64.S              |   5 +-
 arch/powerpc/kernel/interrupt.c            | 319 +++++----
 arch/powerpc/kernel/interrupt_64.S         | 738 +++++++++++++++++++++
 arch/powerpc/kernel/irq.c                  |  81 ++-
 arch/powerpc/kernel/kgdb.c                 |   2 +-
 arch/powerpc/kernel/kprobes-ftrace.c       |   2 +-
 arch/powerpc/kernel/kprobes.c              |  10 +-
 arch/powerpc/kernel/process.c              |  20 +-
 arch/powerpc/kernel/rtas.c                 |  13 +-
 arch/powerpc/kernel/signal.c               |   2 +-
 arch/powerpc/kernel/signal_64.c            |  14 +
 arch/powerpc/kernel/syscalls.c             |   2 +
 arch/powerpc/kernel/traps.c                |  18 +-
 arch/powerpc/kernel/vector.S               |   6 +-
 arch/powerpc/kernel/vmlinux.lds.S          |  24 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S    |   4 +
 arch/powerpc/lib/Makefile                  |   2 +-
 arch/powerpc/lib/feature-fixups.c          | 241 ++++---
 arch/powerpc/lib/restart_table.c           |  29 +
 arch/powerpc/lib/sstep.c                   |   5 +-
 arch/powerpc/math-emu/math.c               |   2 +-
 arch/powerpc/platforms/powernv/opal-call.c |   3 +
 arch/powerpc/sysdev/fsl_pci.c              |   2 +-
 39 files changed, 1631 insertions(+), 1089 deletions(-)
 create mode 100644 arch/powerpc/kernel/interrupt_64.S
 create mode 100644 arch/powerpc/lib/restart_table.c

-- 
2.23.0

