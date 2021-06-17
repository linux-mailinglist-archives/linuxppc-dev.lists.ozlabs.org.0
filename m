Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3D3AB7E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:51:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RPk0kzrz3c3v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:51:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nxHyy+Xp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nxHyy+Xp; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPG5MRnz3bsT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:28 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id x16so5311970pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=duUri5JaxFdzIei79exCySkLTnlH/AZJED2dLMLnOg8=;
 b=nxHyy+XpcZBQCOE+qguCYRg/EV4KxlXPwUNihPskHJvVWJGDl18C3RCKF1v4B7NKzT
 S60biOY1OeNCM5JmfXMoGO88oBIQo3nAnlBvB8uWzbtTF/zA984eL9nP4+qFCyXRkWoX
 psw6rDdIgSGfsyCaV4jyjo5d9iWb0WEu9POc+xkkXgCFzYPpte9mJjfi1jZbD4DAVwjG
 oAb79V244uU25P6ymY4Kv2V1p0dMN5glQyHcOHFm5UKN5KjKWEUK7zFVAZx7PbvwenTn
 wvFJJFTgFrcBNPdic8lTEYRsfscT5uNZV/UW1HZvLVoDspf/S95/i4K5iT41/3VAJqdU
 oNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=duUri5JaxFdzIei79exCySkLTnlH/AZJED2dLMLnOg8=;
 b=s6ciEngWuU+voNIJNAM6cqRX6I5VMVD4OcF7Pk6cwJdwoLGETcq4amnA7gW4Nu3DxH
 XHUL5UWTMAeQrUUd+sarE9tv3o86bwL2n5KWqQMJBzmX8qshknxde9z3haX87KvPfkd4
 KQlaaMJUu6cPBxL3BQLlpV57/JgVgsevlFrangV1gQi/K+y5j9ZhX92PUdGacw+Vdx4b
 RXD2+pxbgbtQUoKVufG3kaPSycz60K2T1QoYwU2yGfH8GSalg+LJjY61PnHDwsm1Hk4X
 21xE9BTaYoJiS2QmqxgjaLeJhI3dj+jC17SStjDEZG8FVvk4GIMC9MxtmquvuMGXKCz3
 u7Dw==
X-Gm-Message-State: AOAM532r95z+pN0FUM/hbVwc7umysdGN7oI5FEsARw2GuB7yM/iMLYVl
 QmAgCBUYWyHRomhImTo81zV//8+j+oU=
X-Google-Smtp-Source: ABdhPJw13+WuGCdUozfpQnOwmDxcUNuCqyaCf+oFnLe+KvNU41j8ebkheqwKFVGWkHQG/PWJZ3GHJg==
X-Received: by 2002:a05:6a00:1741:b029:2f8:dbd5:51d1 with SMTP id
 j1-20020a056a001741b02902f8dbd551d1mr481981pfc.54.1623945084088; 
 Thu, 17 Jun 2021 08:51:24 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 00/17] powerpc/64: fast interrupt exits
Date: Fri, 18 Jun 2021 01:50:59 +1000
Message-Id: <20210617155116.2167984-1-npiggin@gmail.com>
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

Since v3:
- Added Christophe's series to the end (with one broken out patch
  at the start and minor tweaks).
- Fix lbz of SOFTE that broke on BE, should be loaded with ld.
- Fix case where fast_interrupt_return was not marking SRRs as
  clobbered correctly, causing random userspace segfaults etc.
- Fix cpu lock inversion problem in the workaround static branch
  switching code.
- Removed the .L local name from some labels for the restart
  handlers, which makes the disassembly easier to read.
- Fixed several nitpicks found by kbuild robot (duplicate include,
  missing prototypes, etc).
- Fix 64e compile bug [from mpe].
- Fix KUAP re-locking in some restart cases.

Christophe Leroy (6):
  powerpc/interrupt: Fix CONFIG ifdef typo
  powerpc/interrupt: Rename and lightly change
    syscall_exit_prepare_main()
  powerpc/interrupt: Refactor interrupt_exit_user_prepare()
  powerpc/interrupt: Interchange
    prep_irq_for_{kernel_enabled/user}_exit()
  powerpc/interrupt: Refactor prep_irq_for_{user/kernel_enabled}_exit()
  powerpc/interrupt: Remove prep_irq_for_user_exit()

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
 arch/powerpc/include/asm/asm-prototypes.h  |   9 +-
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
 arch/powerpc/kernel/fpu.S                  |   4 +
 arch/powerpc/kernel/head_64.S              |   5 +-
 arch/powerpc/kernel/interrupt.c            | 413 +++++++-----
 arch/powerpc/kernel/interrupt_64.S         | 742 +++++++++++++++++++++
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
 arch/powerpc/kernel/vector.S               |   8 +-
 arch/powerpc/kernel/vmlinux.lds.S          |  10 +
 arch/powerpc/kvm/book3s_hv.c               |   3 +
 arch/powerpc/kvm/book3s_pr.c               |   2 +
 arch/powerpc/lib/Makefile                  |   2 +-
 arch/powerpc/lib/feature-fixups.c          |  52 +-
 arch/powerpc/lib/restart_table.c           |  30 +
 arch/powerpc/lib/sstep.c                   |   4 +-
 arch/powerpc/math-emu/math.c               |   2 +-
 arch/powerpc/platforms/powernv/opal-call.c |   4 +
 arch/powerpc/platforms/pseries/hvCall.S    |  29 +
 arch/powerpc/sysdev/fsl_pci.c              |   2 +-
 39 files changed, 1622 insertions(+), 858 deletions(-)
 create mode 100644 arch/powerpc/kernel/interrupt_64.S
 create mode 100644 arch/powerpc/lib/restart_table.c

-- 
2.23.0

