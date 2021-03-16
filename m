Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A084C33D1EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 11:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F08xw4hbpz30Cb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 21:42:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pit/4Kb7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pit/4Kb7; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F08xV4lfdz3037
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 21:42:21 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id n10so22323971pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LccFlff8nSrunF6RScDxzGFe3axbpa+s6pxrhfbt2FE=;
 b=pit/4Kb7xXWWwTFgCR1euF6ghTTZY8Ag2ciJgJ1IPjzm/5md3eZ0+rcAcP9ci7VlLW
 pGM3Gkh5XY7sx7Ra+0Jk1kPDlfdKdM/7T0RtKmjA3ANg+TpSoQN3iCv6d2xF9tA2DqL1
 RP1It4293RLT7pVlXt5OYtN/QbPp5za5LQH2Q2k85/T4b2xBIud6W7o/JAx7h0v3pnfQ
 fjztfijggdT0g8iGomkYPYYp6YhM9EbS01V+xYM3S8b7o8BB1wDp3MA/ghx/lqaL62uK
 yBIZh7fKq2PtodPabk+BhDHEFdLPfbHYaqE2e8lP9EI87S6xzBJ3n2ov/5IfUtXJeXzC
 0FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LccFlff8nSrunF6RScDxzGFe3axbpa+s6pxrhfbt2FE=;
 b=L9vi124B3kTg82dET6JcFa+wDziDHXfT0mdZgvnrJj73j83Z465xAlD+ja7BAHMPHL
 CXPqxra/FfV47Xlt64ERNEfqqZolCIoaALcaKkFpaZREWXVZNjiLGkqEAh3aiXv7SijI
 Y/Q99UscScmRnTuGccQkftSsa2nUjyM+g4mPVtN3Do8az/BLPOhIgojjSO/kd6/v1Utg
 ACyIfNcLV8q4TqIGjhWSJ88pCtDoeDbefFuYswyEwddvyc7V3Zt9l016rdw0/7SXei23
 BufGR4/ErOuPYSY+9mkTduuQKsn5b7ZKsM1YBzWMs08MB0S8qaQ7d2jI2VHHJ1obMs5b
 +/Qg==
X-Gm-Message-State: AOAM531u7BUt5978RvEVhYNtQuBqc/k59gSvt4HZcdiLD9yoOpGy7UVi
 A+MkMt4z3VFz4K0IdcOyUk4OIJsJ/G8=
X-Google-Smtp-Source: ABdhPJyQLIktOuIuVsQepebYmCbCl0C4/eV3yNRzywk89MBlZzlhlRIuRmK9xLdsjylRgEiPZG9J1w==
X-Received: by 2002:a63:5416:: with SMTP id i22mr3523894pgb.43.1615891336138; 
 Tue, 16 Mar 2021 03:42:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 r30sm15828489pgu.86.2021.03.16.03.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:42:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/11] Move 64e to new interrupt return code
Date: Tue, 16 Mar 2021 20:41:54 +1000
Message-Id: <20210316104206.407354-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since RFC:
- Rebased on Christophe's v3 ppc32 conversion
- Fixed up small details, adds some powerpc-wide cleanups at the end.

Since v1:
- Christophe's review comments accounted for:
- Split common code interrupt changes for 64e from 64e conversion.
- Removed unnecessary ifdef additions from common interrupt code.
- Keep interrupt return context tracking debug check for 64e when
  it switches to new context tracing.
- __bad_page_fault is made static in page fault cleanup.
- CPU time accounting asm and asm offsets can be removed with 64e
  conversion.

Tested on qemu only (QEMU e500), which is not ideal for interrupt
handling particularly the critical interrupts which I don't know
whether it can generate.

Thanks,
Nick

Nicholas Piggin (11):
  powerpc/syscall: switch user_exit_irqoff and trace_hardirqs_off order
  powerpc/64e/interrupt: always save nvgprs on interrupt
  powerpc/interrupt: update common interrupt code for 64e
  powerpc/64e/interrupt: use new interrupt return
  powerpc/64e/interrupt: NMI save irq soft-mask state in C
  powerpc/64e/interrupt: reconcile irq soft-mask state in C
  powerpc/64e/interrupt: Use new interrupt context tracking scheme
  powerpc/64e/interrupt: handle bad_page_fault in C
  powerpc: clean up do_page_fault
  powerpc: remove partial register save logic
  powerpc: move norestart trap flag to bit 0

 arch/powerpc/include/asm/asm-prototypes.h |   2 -
 arch/powerpc/include/asm/bug.h            |   5 +-
 arch/powerpc/include/asm/interrupt.h      |  66 ++--
 arch/powerpc/include/asm/ppc_asm.h        |  20 -
 arch/powerpc/include/asm/ptrace.h         |  39 +-
 arch/powerpc/kernel/align.c               |   6 -
 arch/powerpc/kernel/asm-offsets.c         |  10 -
 arch/powerpc/kernel/entry_64.S            |  40 +-
 arch/powerpc/kernel/exceptions-64e.S      | 425 ++--------------------
 arch/powerpc/kernel/interrupt.c           |  26 +-
 arch/powerpc/kernel/irq.c                 |  76 ----
 arch/powerpc/kernel/process.c             |  12 -
 arch/powerpc/kernel/ptrace/ptrace-view.c  |  21 --
 arch/powerpc/kernel/ptrace/ptrace.c       |   2 -
 arch/powerpc/kernel/ptrace/ptrace32.c     |   4 -
 arch/powerpc/kernel/signal_32.c           |   3 -
 arch/powerpc/kernel/signal_64.c           |   2 -
 arch/powerpc/kernel/traps.c               |  14 +-
 arch/powerpc/lib/sstep.c                  |   4 -
 arch/powerpc/mm/book3s64/hash_utils.c     |  16 +-
 arch/powerpc/mm/fault.c                   |  30 +-
 arch/powerpc/xmon/xmon.c                  |  23 +-
 22 files changed, 126 insertions(+), 720 deletions(-)

-- 
2.23.0

