Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3CF3A2C87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 15:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G148L2CfTz3c08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 23:10:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gWxrlLXS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gWxrlLXS; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G147m4jVzz307J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 23:09:39 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id o9so19717155pgd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nZQRZ0tonjPCI8SQrIn7GdjJ8AXK3CYGOxRwGSLK+GA=;
 b=gWxrlLXS5eCVyptOs3gLJ1NfVTBXebDMnkJTteFqAdpzf0u20bW2GXSx/79rsLaQLi
 9Log+jkg/ptnksWxJsPpCnBDC5JcXTV3Ndv0RUv71INVd1YsrjGejF4HETR2HeH5N1lY
 Q/AWjjHH0sUOJyPVfQYBpVvoV6geHJHKFWe3CyIraQJVvp8NBRGawqVmzC2JiszgO99U
 2tykotAx9XJUe7US9v93VpiLMNNZefpW519kQrlqGTVRHh5fmEPS490BKsGDUQVUSBVd
 IXRM83iFb4+TEzYrS4m0CdPvCuBt1QNV9dxaxQpDlWUTsPeyRvqSAbOpNfhMb9Ducbap
 QtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nZQRZ0tonjPCI8SQrIn7GdjJ8AXK3CYGOxRwGSLK+GA=;
 b=ceRJYgVujjD4CWX4rpWfGEXRqBwyQzdLKKvI3IZ5kNJN5tjx7fCl9+odIJcq4opgX4
 V7wqkkzjIi54qk83awDJlHzHssXxvtYNubMSV4dv1BtmBdPxYGRKzZPNYLrDRVqu2AXQ
 Zhkhu0F2P6gZ1jqoS6AUOEs1dle0CMs5Ot3zKv9KKhidqJhCyWnmDk9YKxvUO+fY/La/
 nI+Kobi2/I4etaRyEwQN2/lHxdvisAt4AgNLWumH62L5tKvGG5s7XRWpDaTE+AT9fqNb
 zZ6S58wxK4Atdm7I/v0dUZTu28mnRG1tZRGTWygRfjJh6hD3eGySblH80e0vkrNCe/2g
 aANA==
X-Gm-Message-State: AOAM533RIsdV2jZo1eJ/Vjoodb+NkahGUwpX4XyQvNDYC1zegaAGkw/z
 fgZlUxKP4Jv7asX6WKWaFTRMEnHwndE=
X-Google-Smtp-Source: ABdhPJxr0xbIMNRm0i5p0CkHJN0gIHpZOue86A4BLctCWJRfu0A4vXBMXxtkVPPRpaZLjxfqQ7m3eA==
X-Received: by 2002:a63:5f8b:: with SMTP id t133mr4813846pgb.411.1623330573690; 
 Thu, 10 Jun 2021 06:09:33 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id bv3sm7012173pjb.1.2021.06.10.06.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:09:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/11] powerpc/64: fast interrupt exits
Date: Thu, 10 Jun 2021 23:09:10 +1000
Message-Id: <20210610130921.706938-1-npiggin@gmail.com>
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

Changes since v2:
- KVM PR compile fix
- Missed SRR clobbers from hcalls causing pseries crashes
- Add program check recursion test to interrupt entry assert,
  which prevented pseries crash bug being cleanly reported.

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
 arch/powerpc/include/asm/interrupt.h       |  60 +-
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
 arch/powerpc/kernel/prom_init.c            |   3 +
 arch/powerpc/kernel/rtas.c                 |  14 +-
 arch/powerpc/kernel/signal.c               |   2 +-
 arch/powerpc/kernel/signal_64.c            |   9 +
 arch/powerpc/kernel/syscalls.c             |   3 +-
 arch/powerpc/kernel/traps.c                |  18 +-
 arch/powerpc/kernel/vector.S               |   6 +-
 arch/powerpc/kernel/vmlinux.lds.S          |  10 +
 arch/powerpc/kvm/book3s_hv.c               |   3 +
 arch/powerpc/kvm/book3s_pr.c               |   2 +
 arch/powerpc/lib/Makefile                  |   2 +-
 arch/powerpc/lib/feature-fixups.c          |  38 +-
 arch/powerpc/lib/restart_table.c           |  29 +
 arch/powerpc/lib/sstep.c                   |   4 +-
 arch/powerpc/math-emu/math.c               |   2 +-
 arch/powerpc/platforms/powernv/opal-call.c |   4 +
 arch/powerpc/platforms/pseries/hvCall.S    |  29 +
 arch/powerpc/sysdev/fsl_pci.c              |   2 +-
 39 files changed, 1631 insertions(+), 808 deletions(-)
 create mode 100644 arch/powerpc/kernel/interrupt_64.S
 create mode 100644 arch/powerpc/lib/restart_table.c

-- 
2.23.0

