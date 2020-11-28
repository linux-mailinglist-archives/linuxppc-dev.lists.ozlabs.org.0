Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A03D2C6FA9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 15:43:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvPY2HB3zDqQx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 01:43:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ckj6x9tm; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMC6689zDsGv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:27 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id s21so6949796pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hKQDGgkirZA+mrT+5xnjH8j4m19qvd9kKresMvwHa3k=;
 b=Ckj6x9tmlVUomilzvd/EfcI8ROBG730bl427Oqd7gMgXnozPuUXq8Hzs/1cWx5i5uO
 j7O6RdzN0/vMoLIuOo2HlgM0a5xT6wGbD1CfFThSbkdPAbWzx2jnBoWtkCiCWVpzD3tl
 JxuWB3U5i/PwZgZ7txWHZejdYQrZMaPu2m3jPgODhBzi9EH3NnyYfZxUE1yjQqxLlEpp
 g4781Z1rNUcX81mYeawETCQ8yyHvsM1vE0UHOZ/7eYr3Ygl7+KEdLkD70kXgGAViFqRq
 FxP8O15kBSJJDMV+ER3xm42b+E3p/CNVHPOyynktEgMKpRyF6UJiFPCeFXOKM+1tr7pe
 7+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hKQDGgkirZA+mrT+5xnjH8j4m19qvd9kKresMvwHa3k=;
 b=fPidZPAneeo2Misqt0xGyQUE/t3PewqZu2/zUkz8gdJu5DcdBsu47vrtD+K2ZDGhRK
 i8V6vZBZSh/doAHkuDtjolIi2HFtUU07Dz5YQS/8B2iD6pycGzQby3ef1bnvq2DKBeTZ
 CDOOBBRLPOTb5Y+834UWXcDtEmls1Cblqg61NhTTIoD1Z2mwI/a3BTbLJjUDTLfgiAON
 U3XCOrqY0kwm+o+isunN+fKTcnICDMbvYbiZdYC1wI0YsjlExmTcdX/ByBV9CD1mHfbM
 g8FsO+oOiaFw0it1dbFEpUdzww46kTFgMG22KTh/jnOW/nNQSARJipetV+h2zt39sz9D
 uKOw==
X-Gm-Message-State: AOAM5333Hah/6N3qkyYrishGdwyu1TnVJXoU+nObKYu3WCEzF/oNI8tz
 8rJdeIMhuvTdz0B8kZVCm9uBhjyQt/8=
X-Google-Smtp-Source: ABdhPJxWSs8OO+YU6SDP7zycDJ1q8rRcuUMsV3RhKatRFDhUq4Ppqa2Ig2vUWsRboqCdA3e7SumvVg==
X-Received: by 2002:a17:90a:4281:: with SMTP id
 p1mr16684509pjg.87.1606574481397; 
 Sat, 28 Nov 2020 06:41:21 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/19] powerpc: interrupt wrappers
Date: Sun, 29 Nov 2020 00:40:55 +1000
Message-Id: <20201128144114.944000-1-npiggin@gmail.com>
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

Since v2:
- Rebased upstream
- Took code in patch 3 from Christophe
- Fixed some compile errors from 0day

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
 arch/powerpc/include/asm/interrupt.h       | 405 +++++++++++++++++++++
 arch/powerpc/include/asm/ppc_asm.h         |  24 --
 arch/powerpc/include/asm/processor.h       |   1 +
 arch/powerpc/include/asm/thread_info.h     |  10 +-
 arch/powerpc/include/asm/time.h            |   2 +
 arch/powerpc/kernel/dbell.c                |  15 +-
 arch/powerpc/kernel/entry_32.S             |  18 +-
 arch/powerpc/kernel/exceptions-64e.S       |   6 +-
 arch/powerpc/kernel/exceptions-64s.S       | 307 ++--------------
 arch/powerpc/kernel/head_40x.S             |  10 +-
 arch/powerpc/kernel/head_8xx.S             |  11 +-
 arch/powerpc/kernel/head_book3s_32.S       |  15 +-
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
 arch/powerpc/kernel/traps.c                | 231 ++++++------
 arch/powerpc/kernel/watchdog.c             |  15 +-
 arch/powerpc/kvm/book3s_hv.c               |   1 +
 arch/powerpc/kvm/book3s_hv_builtin.c       |   1 +
 arch/powerpc/kvm/booke.c                   |   1 +
 arch/powerpc/mm/book3s64/hash_utils.c      |  82 +++--
 arch/powerpc/mm/book3s64/slb.c             |  12 +-
 arch/powerpc/mm/fault.c                    |  78 +++-
 arch/powerpc/perf/core-book3s.c            |  35 +-
 arch/powerpc/perf/core-fsl-emb.c           |  25 --
 arch/powerpc/platforms/8xx/machine_check.c |   2 +-
 arch/powerpc/platforms/powernv/idle.c      |   1 +
 41 files changed, 772 insertions(+), 692 deletions(-)
 create mode 100644 arch/powerpc/include/asm/interrupt.h

-- 
2.23.0

