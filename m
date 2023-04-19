Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B446C6E91E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 13:08:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2FJ03t0sz3cd1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 21:08:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Hf8STPeT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Hf8STPeT;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1x4c1cb9z3cB1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 08:57:01 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1a6bc48aec8so4253615ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 15:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681945019; x=1684537019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EfHs6iQcu6f/xzGNIRNs/Y6zNI7wkCv1JLv9sFf5g1M=;
        b=Hf8STPeTqcCEMBqR/MDrmp1HtnPk6GIH5PFNOTsUN7tPgWqWR1ZyBP8GwDsJkkLKG8
         AYhZdFrgwCV8MqXtRmCQi31cmL6jiSjz3Nhdqbn+Ydb7KtggmVC0mWLgTkV8h5LrocTx
         JMSiKPmPNqI9PaMzeCfkSLedwLBMwC/49yavs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681945019; x=1684537019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfHs6iQcu6f/xzGNIRNs/Y6zNI7wkCv1JLv9sFf5g1M=;
        b=QVcfyb1zeS1uZmBV+WcgNorPFgWQOVpAjty1zj5S8dUuwgAY5Z0rnuzCNgD9fXcr64
         wqGzYRstMRMh0n1IOy3Qzi6VmJQnHVxBM1mXBly0/Hn3Uak6IJmIiO8wf1oJ3Vq0QsUa
         sBYlMY6jesIbL0ITCk6slJTyX08pQFJdHUdLwnTR0NIfqcl4c69Yt7Kf7zNBhrWcDXKo
         zRRTJJPFze4SiBMMy3zONufD1cUZ7kCYZv5RkwpEldPTEYguGcS+MfCyekSeTJT8Lik0
         rw9YLxPYZ4TNXilQxForRf8lH4W7yqWUu+4VQDXdWM/JC5A81iKwobW3i+5G/u5DNhie
         P9DA==
X-Gm-Message-State: AAQBX9e3yUjbz9p9IeSicwNSOe9CHN/SQamU6xTCc4zzug8UepfHRfF6
	5q6I/xVoHEgeSpBnSlQQrZRm9Q==
X-Google-Smtp-Source: AKy350ZiPT69ec5g7FHlxHkgLJsXu49t1r2PGDTeEGKpYVM7Qe0rm8s8+T+i58n9/utMvufCZU7NAA==
X-Received: by 2002:a17:902:e74a:b0:1a6:46d7:77dc with SMTP id p10-20020a170902e74a00b001a646d777dcmr7987289plf.43.1681945018669;
        Wed, 19 Apr 2023 15:56:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
        by smtp.gmail.com with ESMTPSA id h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:56:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v8 00/10] arm64: Add framework to turn an IPI as NMI
Date: Wed, 19 Apr 2023 15:55:54 -0700
Message-ID: <20230419225604.21204-1-dianders@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 21:06:30 +1000
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net, Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Ingo Molnar <mingo@kernel.org
 >, Pierre Gondois <Pierre.Gondois@arm.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>, Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>, x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ito-yuichi@fujitsu.com, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Eric W. Biederman" <ebi
 ederm@xmission.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an attempt to resurrect Sumit's old patch series [1] that
allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
also to round up CPUs in kdb/kgdb. The last post from Sumit that I
could find was v7, so I called this series v8. I haven't copied all of
his old changelongs here, but you can find them from the link.

Since v7, I have:
* Addressed the small amount of feedback that was there for v7.
* Rebased.
* Added a new patch that prevents us from spamming the logs with idle
  tasks.
* Added an extra patch to gracefully fall back to regular IPIs if
  pseudo-NMIs aren't there.

Since there appear to be a few different patches series related to
being able to use NMIs to get stack traces of crashed systems, let me
try to organize them to the best of my understanding:

a) This series. On its own, a) will (among other things) enable stack
   traces of all running processes with the soft lockup detector if
   you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace". On
   its own, a) doesn't give a hard lockup detector.

b) A different recently-posted series [2] that adds a hard lockup
   detector based on perf. On its own, b) gives a stack crawl of the
   locked up CPU but no stack crawls of other CPUs (even if they're
   locked too). Together with a) + b) we get everything (full lockup
   detect, full ability to get stack crawls).

c) The old Android "buddy" hard lockup detector [3] that I'm
   considering trying to upstream. If b) lands then I believe c) would
   be redundant (at least for arm64). c) on its own is really only
   useful on arm64 for platforms that can print CPU_DBGPCSR somehow
   (see [4]). a) + c) is roughly as good as a) + b).

[1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-email-sumit.garg@linaro.org/
[2] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecopzer.chen@mediatek.com/
[3] https://issuetracker.google.com/172213097
[4] https://issuetracker.google.com/172213129

Changes in v8:
- dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
- dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
- Add loongarch support, too
- Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
- "Tag the arm64 idle functions as __cpuidle" new for v8
- "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8
- "Fallback to a regular IPI if NMI isn't enabled" new for v8

Douglas Anderson (3):
  arm64: idle: Tag the arm64 idle functions as __cpuidle
  kgdb: Provide a stub kgdb_nmicallback() if !CONFIG_KGDB
  arm64: ipi_nmi: Fallback to a regular IPI if NMI isn't enabled

Sumit Garg (7):
  arm64: Add framework to turn IPI as NMI
  irqchip/gic-v3: Enable support for SGIs to act as NMIs
  arm64: smp: Assign and setup an IPI as NMI
  nmi: backtrace: Allow runtime arch specific override
  arm64: ipi_nmi: Add support for NMI backtrace
  kgdb: Expose default CPUs roundup fallback mechanism
  arm64: kgdb: Roundup cpus using IPI as NMI

 arch/arm/include/asm/irq.h       |   2 +-
 arch/arm/kernel/smp.c            |   3 +-
 arch/arm64/include/asm/irq.h     |   4 ++
 arch/arm64/include/asm/nmi.h     |  17 +++++
 arch/arm64/kernel/Makefile       |   2 +-
 arch/arm64/kernel/idle.c         |   4 +-
 arch/arm64/kernel/ipi_nmi.c      | 103 +++++++++++++++++++++++++++++++
 arch/arm64/kernel/kgdb.c         |  18 ++++++
 arch/arm64/kernel/smp.c          |   8 +++
 arch/loongarch/include/asm/irq.h |   2 +-
 arch/loongarch/kernel/process.c  |   3 +-
 arch/mips/include/asm/irq.h      |   2 +-
 arch/mips/kernel/process.c       |   3 +-
 arch/powerpc/include/asm/nmi.h   |   2 +-
 arch/powerpc/kernel/stacktrace.c |   3 +-
 arch/sparc/include/asm/irq_64.h  |   2 +-
 arch/sparc/kernel/process_64.c   |   4 +-
 arch/x86/include/asm/irq.h       |   2 +-
 arch/x86/kernel/apic/hw_nmi.c    |   3 +-
 drivers/irqchip/irq-gic-v3.c     |  29 ++++++---
 include/linux/kgdb.h             |  13 ++++
 include/linux/nmi.h              |  12 ++--
 kernel/debug/debug_core.c        |   8 ++-
 23 files changed, 217 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/include/asm/nmi.h
 create mode 100644 arch/arm64/kernel/ipi_nmi.c

-- 
2.40.0.634.g4ca3ef3211-goog

