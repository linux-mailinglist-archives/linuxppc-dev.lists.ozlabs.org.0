Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C66C2A98FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:01:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQ9x4tYYzDrMJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ig7leB3p; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ7c3pH1zDrGs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 02:59:40 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 13so1720712pfy.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 07:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x9mecnqU+Qo5ugUHRKe87bu3BMFzbFu8QIOYTqtpHXA=;
 b=Ig7leB3pEfT1GM+ZxjP8s+MXvSgYu9LpVMCG45CCQ1mBjhufeE8YDEY58NuyBiBD8Z
 Cwu0qf8ocF0ioTNQyViexUanPqnO/z2p/rEyzKfjEy2m+doxNS1/q3XlUCjBdPfFX0Kh
 tlCo5nUkFMD+FNHq6o8dqlQXzTrS9mhLhJeeszTrMEk3lLHM9dkBgBQAQREuXLXSmUb5
 Ofl3hm1NaCqGNef6cv+K/2isCrfxp4qUXV3o2G+wd4TijXuNFYkwahyHs/J43ZTa+tFG
 o1Ne6B49dX2CD0TA067B51Iiy+RWoqwSPXvEwHhn0Luxjqaf/KCz9mFDZX19NbOaHw4X
 ejag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x9mecnqU+Qo5ugUHRKe87bu3BMFzbFu8QIOYTqtpHXA=;
 b=od8XrWPdhX9rvhd/OMVJwkhGLvTmPIsRYiNuVA2eqwvmOMtyO7vn3OmxGqZR+O5khb
 xKLCB8n+XsHX3KkVJmf+qzjC4ustC8te6Xv18L+lhURGH9TFGcxcxZdDRjVYHQT0qeT+
 BG6UgBg05B2Rg9G0rGuKpddFbtR5TPOZue3kJATGVUCODr3fxinxjgN9ITVIdCAjLcTb
 HZc6AO3ojopH3OnN16i7074nMYZp6E23FW2rrVIRy49vlfABudEH4wjC4fRPlqY4lbdt
 xKcDBaXGpSw0p3I5jAwqHy96A6jILMDSHSyScCuc+ywyqk/cYsHAnYPK6HkSXuHGlKR/
 78Xw==
X-Gm-Message-State: AOAM530Q8N/2inXCmH3rO7CtBsvikgfKFlHzgIOXxwbsbimK9SYzYMxI
 6w76x6NagxLa7YpqH7t6Bb7nMNsVBs4=
X-Google-Smtp-Source: ABdhPJy7n3Ez/D2FBysUFG2kiDOSnJlmQwb2qVJ2mC6T2LpW5hBdRclJL8lZabwue5UZB4vJijusJw==
X-Received: by 2002:a17:90a:f206:: with SMTP id
 bs6mr179144pjb.219.1604678375917; 
 Fri, 06 Nov 2020 07:59:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/9] powerpc/64s: fast interrupt exit
Date: Sat,  7 Nov 2020 01:59:20 +1000
Message-Id: <20201106155929.2246055-1-npiggin@gmail.com>
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
in two major ways.

Firstly, the SRR/HSRR registers do not need to be reloaded if they were
not used or clobbered fur the duration of the interrupt.

Secondly, an alternate return location facility is added for soft-masked
asynchronous interrupts and then that's used to set everything up for
return without having to disable MSR RI or EE.

After this series, the entire system call / interrupt handler fast path
executes no mtsprs and one mtmsrd to enable interrupts initially, and
the system call vectored path doesn't even need to do that.

Thanks,
Nick

Nicholas Piggin (9):
  powerpc/64s: syscall real mode entry use mtmsrd rather than rfid
  powerpc/64s: system call avoid setting MSR[RI] until we set MSR[EE]
  powerpc/64s: introduce different functions to return from SRR vs HSRR
    interrupts
  powerpc/64s: avoid reloading (H)SRR registers if they are still valid
  powerpc/64: move interrupt return asm to interrupt_64.S
  powerpc/64s: save one more register in the masked interrupt handler
  powerpc/64s: allow alternate return locations for soft-masked
    interrupts
  powerpc/64s: interrupt soft-enable race fix
  powerpc/64s: use interrupt restart table to speed up return from
    interrupt

 arch/powerpc/Kconfig.debug                 |   5 +
 arch/powerpc/include/asm/asm-prototypes.h  |   4 +-
 arch/powerpc/include/asm/head-64.h         |   2 +-
 arch/powerpc/include/asm/interrupt.h       |  18 +
 arch/powerpc/include/asm/paca.h            |   3 +
 arch/powerpc/include/asm/ppc_asm.h         |   8 +
 arch/powerpc/include/asm/ptrace.h          |  28 +-
 arch/powerpc/kernel/asm-offsets.c          |   5 +
 arch/powerpc/kernel/entry_64.S             | 508 ---------------
 arch/powerpc/kernel/exceptions-64s.S       | 180 ++++--
 arch/powerpc/kernel/fpu.S                  |   2 +
 arch/powerpc/kernel/head_64.S              |   5 +-
 arch/powerpc/kernel/interrupt_64.S         | 720 +++++++++++++++++++++
 arch/powerpc/kernel/irq.c                  |  79 ++-
 arch/powerpc/kernel/kgdb.c                 |   2 +-
 arch/powerpc/kernel/kprobes-ftrace.c       |   2 +-
 arch/powerpc/kernel/kprobes.c              |  10 +-
 arch/powerpc/kernel/process.c              |  21 +-
 arch/powerpc/kernel/rtas.c                 |  13 +-
 arch/powerpc/kernel/signal.c               |   2 +-
 arch/powerpc/kernel/signal_64.c            |  14 +
 arch/powerpc/kernel/syscall_64.c           | 242 ++++---
 arch/powerpc/kernel/syscalls.c             |   2 +
 arch/powerpc/kernel/traps.c                |  18 +-
 arch/powerpc/kernel/vector.S               |   6 +-
 arch/powerpc/kernel/vmlinux.lds.S          |  10 +
 arch/powerpc/lib/Makefile                  |   2 +-
 arch/powerpc/lib/restart_table.c           |  26 +
 arch/powerpc/lib/sstep.c                   |   5 +-
 arch/powerpc/math-emu/math.c               |   2 +-
 arch/powerpc/mm/fault.c                    |   2 +-
 arch/powerpc/perf/core-book3s.c            |  19 +-
 arch/powerpc/platforms/powernv/opal-call.c |   3 +
 arch/powerpc/sysdev/fsl_pci.c              |   2 +-
 34 files changed, 1244 insertions(+), 726 deletions(-)
 create mode 100644 arch/powerpc/kernel/interrupt_64.S
 create mode 100644 arch/powerpc/lib/restart_table.c

-- 
2.23.0

