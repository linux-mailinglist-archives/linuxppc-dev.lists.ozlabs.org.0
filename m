Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FF38C5EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:45:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmlCN5n0yz30BJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:45:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ROA7sQAD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ROA7sQAD; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmlBs4hTwz303P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:44:36 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id v12so10823723plo.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ibt0b0FVCHliSzvlaYNqLZTAr6k3wCUyfIKCmHkIsF8=;
 b=ROA7sQADBV1Ah5ikfnaxV9z/oSbLuCk76AxRYSi5nizwZQuQxf0rw4rUZIY2y7iMmh
 v4fueofVIXbGYmnQXMl6R8XvbeLv9FAjYFmVEE5y9AwCPeXVZVA0ky1o2LBWT07FaLLI
 d33yycA/Sp7Axj11oNdK9CM0a1DZojIxzGSkfK0anGJF2FfSY02v6/VB2e2wXpeVhfiY
 eKkuRYR2/JViFiliE22TAJqFO+GUXQzJYiL4xIraEt2gEJjc7Y9SIO0+IstIFOdSLmgL
 ZnVRw1m3c5deSld9e6zx0HLm057ro7r1OO3mKx4g3CNKNYminIS17ogujiykE7JIuSDT
 NQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ibt0b0FVCHliSzvlaYNqLZTAr6k3wCUyfIKCmHkIsF8=;
 b=PYJm0CyzNamUkv/JQ4WTOhme3e5ndjO/4T4aCtMHV+LohzyQil37RR9d76CbiLjyp/
 4xnJ/eNMeh9Uv3d7csUsgh7daLIqAZmhv1wRlVpQvLBwuc7+gM6Lmpbtmya2Fi07un+u
 PCr7y8sHyIlo8ycPm8CUYHFnroWMWPyujWaE5tS1x7j7TMZkyB/UuxfEqpYBH+lCk7ng
 99qvW5qon7TCzoANTeAWwAPkMin0Wyoj6PsF6v8t9bFaltt3T16zj3BaGohtrTYqigH6
 vw8mf1RhUfgtUo2xAbGjBxpluullOtq9zf90FtcswBajTpf5YR3KaGSmnKIiXY8UcqlJ
 sBiw==
X-Gm-Message-State: AOAM530LsVvr1sogVSsIF8eEe9Jh/Ci4rYDXenmhsIV48/bQedeLWMRy
 KxeYQg5JVlwGndEqIHeNTzWKX/HNvfs=
X-Google-Smtp-Source: ABdhPJxJDtJsW2CylmxWXixM1cMQ6MBTORtxJvjtaF5sf4gq5RgeIrq70raI/stv1BZFAjcmKel+vg==
X-Received: by 2002:a17:902:c94a:b029:f4:ad23:7e59 with SMTP id
 i10-20020a170902c94ab02900f4ad237e59mr11546375pla.73.1621597472788; 
 Fri, 21 May 2021 04:44:32 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id f5sm8681390pjp.37.2021.05.21.04.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:44:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/11] powerpc/64: fast interrupt exits
Date: Fri, 21 May 2021 21:44:11 +1000
Message-Id: <20210521114422.3179350-1-npiggin@gmail.com>
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

This series attempts to improve the speed of interrupts and system calls
in three major ways.

Firstly, the SRR/HSRR registers do not need to be reloaded if they were
clobbered for the duration of the interrupt and the return NIP and MSR
did not changed. 64e does not implement this part, but it could quite
easily.

Secondly, mtmsrd and mtspr are reduced by various means, this is mostly
specific to 64s.

Lastly, an alternate interrupt return location facility is added for
soft-masked asynchronous interrupts, and then that's used to set
everything up for return without having to disable MSR RI or EE.

After this series, the entire system call / interrupt handler fast path
can execute with no mtsprs and one mtmsrd to enable interrupts
initially, and the system call vectored path doesn't even need to do
that. This gives a decent performance benefit. On POWER9 with a
powernv_defconfig without VIRT_CPU_ACCOUNTING_NATIVE, no meltdown
workarounds, gettid sc system call goes from 481 -> 344 cycles, gettid
scv 345->299 cycles, and page fault 1225->1064 cycles.

Changes since v1: 
- Rebased to upstream
- Reordered paches, updated comments and changelogs.
- Clean ups, fixed ppc32 compile breakage.
- Fixed missing srr invalidations in KVM guest entry/exit.
- Dropped the security fallback rework from the start of the series
  because it's quite complicated to change. Instead for now the
  incompatible fallbacks just disable the interrupts-enabled exits.

Thanks,
Nick

Nicholas Piggin (11):
  powerpc: remove interrupt exit helpers unused argument
  powerpc/64s: introduce different functions to return from SRR vs HSRR
    interrupts
  powerpc/64s: avoid reloading (H)SRR registers if they are still valid
  powerpc/64: handle MSR EE and RI in interrupt entry wrapper
  powerpc/64: move interrupt return asm to interrupt_64.S
  powerpc/64s: system call avoid setting MSR[RI] until we set MSR[EE]
  powerpc/64s: save one more register in the masked interrupt handler
  powerpc/64: allow alternate return locations for soft-masked
    interrupts
  powerpc/64: interrupt soft-enable race fix
  powerpc/64: treat low kernel text as irqs soft-masked
  powerpc/64: use interrupt restart table to speed up return from
    interrupt

 arch/powerpc/Kconfig.debug                 |   5 +
 arch/powerpc/include/asm/asm-prototypes.h  |   4 +-
 arch/powerpc/include/asm/head-64.h         |   2 +-
 arch/powerpc/include/asm/hw_irq.h          |  23 +-
 arch/powerpc/include/asm/interrupt.h       |  57 +-
 arch/powerpc/include/asm/paca.h            |   7 +
 arch/powerpc/include/asm/ppc_asm.h         |   8 +
 arch/powerpc/include/asm/ptrace.h          |  75 ++-
 arch/powerpc/kernel/asm-offsets.c          |   7 +
 arch/powerpc/kernel/entry_64.S             | 516 --------------
 arch/powerpc/kernel/exceptions-64e.S       |  53 +-
 arch/powerpc/kernel/exceptions-64s.S       | 219 +++---
 arch/powerpc/kernel/fpu.S                  |   2 +
 arch/powerpc/kernel/head_64.S              |   5 +-
 arch/powerpc/kernel/interrupt.c            | 389 +++++++----
 arch/powerpc/kernel/interrupt_64.S         | 749 +++++++++++++++++++++
 arch/powerpc/kernel/irq.c                  |  95 +++
 arch/powerpc/kernel/kgdb.c                 |   2 +-
 arch/powerpc/kernel/kprobes-ftrace.c       |   2 +-
 arch/powerpc/kernel/kprobes.c              |  10 +-
 arch/powerpc/kernel/process.c              |  26 +-
 arch/powerpc/kernel/rtas.c                 |  14 +-
 arch/powerpc/kernel/signal.c               |   2 +-
 arch/powerpc/kernel/signal_64.c            |   9 +
 arch/powerpc/kernel/syscalls.c             |   3 +-
 arch/powerpc/kernel/traps.c                |  18 +-
 arch/powerpc/kernel/vector.S               |   6 +-
 arch/powerpc/kernel/vmlinux.lds.S          |  10 +
 arch/powerpc/kvm/book3s_hv.c               |   3 +
 arch/powerpc/kvm/book3s_pr.c               |   1 +
 arch/powerpc/lib/Makefile                  |   2 +-
 arch/powerpc/lib/feature-fixups.c          |  38 +-
 arch/powerpc/lib/restart_table.c           |  29 +
 arch/powerpc/lib/sstep.c                   |   4 +-
 arch/powerpc/math-emu/math.c               |   2 +-
 arch/powerpc/platforms/powernv/opal-call.c |   4 +
 arch/powerpc/sysdev/fsl_pci.c              |   2 +-
 37 files changed, 1596 insertions(+), 807 deletions(-)
 create mode 100644 arch/powerpc/kernel/interrupt_64.S
 create mode 100644 arch/powerpc/lib/restart_table.c

-- 
2.23.0

