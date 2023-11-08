Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1E77E600E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 22:41:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hdJmX6Tf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQdpF5Pnqz3cZd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 08:41:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hdJmX6Tf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQQC42D1tz3c40
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Nov 2023 23:59:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74CD6CE10CA;
	Wed,  8 Nov 2023 12:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397CEC433C7;
	Wed,  8 Nov 2023 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448345;
	bh=mCKY7B1NUlBI0NuotW3ba1ch9AEY8/W0fCgPLr2mO8c=;
	h=From:To:Cc:Subject:Date:From;
	b=hdJmX6TfcykocaTr5OrRW3LbdILEh0itmqr9P21mwGlg6MNeeNmqG3lC80LfvXy6g
	 VtUPAhXRHS6nGjOfsUwjv4hGM05Gke0gSh30zzdYv1zPY1K/pw/ewTT8Yp/pFtHxgA
	 CqlBBLPXwAyP7VR93PLJDWmmif9jbReJ7JLAXEI1K/cSXYfGNGTUY0jhDW7DQKkLkv
	 3fLnVWbGfEdWbODApTbzfegitWoXOm7yzXOFjF2nGEbrSRbNtAzwlzPk6EFXSXbWOk
	 /dWaNDETcJ9PdXN+Cgh02YBuiyQScJCQc1vmxaWB0AVd7HB7HFVPq6/I5aemCJlBbV
	 L+fUTsc/kSZfw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 00/22] -Wmissing-prototype warning fixes
Date: Wed,  8 Nov 2023 13:58:21 +0100
Message-Id: <20231108125843.3806765-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Nov 2023 08:41:16 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>
 , linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-mips@vger.kernel.org, Sudip Mukherjee <sudipm.mukherj
 ee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

I slightly dropped the ball on this since last sending the series in
August, but a number of warning fixes have made it into the kernel in
the meantime, both from my earlier submission and from architecture
maintainers.

I have none patches that remain from the previous submission, with
two of them reworked according to comments. The additional patches
are from more testing across architectures and configurations that
I had previously missed.

At least one patch is for a newly added warning in recent kernels.

Regarding the regressions in terms of added warnings, there are
now only five architectures left that add warnings (alpha, mips,
nios2, sh and sparc) rather than 15, so I think we can apply
the Kbuild change directly and have the architecture maintainers
take care of the warnings just like the others did already.

As before, my preference would be for the patches to make it
through the respective subsystem maintainer trees, though I
can apply the architecture specific ones to the asm-generic
tree as well.

Sorry for posting these during the merge window, I wanted to
get them out before LPC so we can have them in linux-next
as early as possible.

    Arnd

Link: https://lore.kernel.org/lkml/20230810141947.1236730-1-arnd@kernel.org/

Arnd Bergmann (22):
  [RESEND^2] ida: make 'ida_dump' static
  [RESEND^2] jffs2: mark __jffs2_dbg_superblock_counts() static
  [RESEND] kprobes: unify kprobes_exceptions_nofify() prototypes
  [RESEND] time: make sysfs_get_uname() function visible in header
  [RESEND] parport: gsc: mark init function static
  [RESEND] stackleak: add declarations for global functions
  [RESEND] sched: fair: move unused stub functions to header
  [v2] arch: consolidate arch_irq_work_raise prototypes
  [v2] arch: fix asm-offsets.c building with -Wmissing-prototypes
  microblaze: include linux/cpu.h for trap_init() prototype
  x86: sta2x11: include header for sta2x11_get_instance() prototype
  csky: fix arch_jump_label_transform_static override
  arch: add do_page_fault prototypes
  arch: add missing prepare_ftrace_return() prototypes
  arch: vdso: consolidate gettime prototypes
  bcachefs: mark bch2_target_to_text_sb() static
  powerpc: ps3: move udbg_shutdown_ps3gelic prototype
  powerpc: pasemi: mark pas_shutdown() static
  powerpc: powermac: mark smp_psurge_{give,take}_timebase static
  usb: fsl-mph-dr-of: mark fsl_usb2_mpc5121_init() static
  fbdev/fsl-diu-fb: mark wr_reg_wa() static
  Makefile.extrawarn: turn on missing-prototypes globally

 arch/alpha/include/asm/mmu_context.h         |  2 ++
 arch/alpha/kernel/asm-offsets.c              |  2 +-
 arch/alpha/kernel/traps.c                    |  1 +
 arch/arc/include/asm/kprobes.h               |  3 ---
 arch/arm/include/asm/irq_work.h              |  2 --
 arch/arm/include/asm/kprobes.h               |  2 --
 arch/arm/include/asm/vdso.h                  |  5 ----
 arch/arm/vdso/vgettimeofday.c                |  1 +
 arch/arm64/include/asm/irq_work.h            |  2 --
 arch/arm64/include/asm/kprobes.h             |  2 --
 arch/arm64/kernel/vdso32/vgettimeofday.c     |  1 +
 arch/csky/include/asm/ftrace.h               |  4 +++
 arch/csky/include/asm/irq_work.h             |  2 +-
 arch/csky/include/asm/jump_label.h           |  5 ++++
 arch/csky/include/asm/traps.h                |  2 +-
 arch/csky/kernel/traps.c                     |  1 +
 arch/csky/kernel/vdso/vgettimeofday.c        | 11 +--------
 arch/loongarch/kernel/asm-offsets.c          | 26 ++++++++++----------
 arch/loongarch/vdso/vgettimeofday.c          |  7 +-----
 arch/m68k/coldfire/vectors.c                 |  3 +--
 arch/m68k/coldfire/vectors.h                 |  3 ---
 arch/microblaze/include/asm/ftrace.h         |  1 +
 arch/microblaze/kernel/traps.c               |  1 +
 arch/mips/include/asm/ftrace.h               |  4 +++
 arch/mips/include/asm/kprobes.h              |  2 --
 arch/mips/include/asm/traps.h                |  3 +++
 arch/mips/vdso/vgettimeofday.c               |  1 +
 arch/nios2/include/asm/traps.h               |  2 ++
 arch/powerpc/include/asm/irq_work.h          |  1 -
 arch/powerpc/include/asm/kprobes.h           |  2 --
 arch/powerpc/include/asm/ps3.h               |  6 +++++
 arch/powerpc/platforms/pasemi/setup.c        |  2 +-
 arch/powerpc/platforms/powermac/smp.c        |  4 +--
 arch/powerpc/platforms/ps3/gelic_udbg.c      |  1 +
 arch/riscv/include/asm/irq_work.h            |  2 +-
 arch/riscv/kernel/vdso/vgettimeofday.c       |  7 +-----
 arch/s390/include/asm/irq_work.h             |  2 --
 arch/s390/include/asm/kprobes.h              |  2 --
 arch/sh/include/asm/kprobes.h                |  2 --
 arch/sh/include/asm/traps_32.h               |  3 +++
 arch/sparc/include/asm/kprobes.h             |  2 --
 arch/sparc/kernel/asm-offsets.c              |  6 ++---
 arch/sparc/kernel/traps_32.c                 |  1 +
 arch/sparc/kernel/traps_64.c                 |  1 +
 arch/x86/entry/vdso/vclock_gettime.c         | 10 +-------
 arch/x86/include/asm/irq_work.h              |  1 -
 arch/x86/include/asm/kprobes.h               |  2 --
 arch/x86/include/asm/traps.h                 |  1 -
 arch/x86/include/asm/vdso/gettimeofday.h     |  2 --
 arch/x86/kernel/traps.c                      |  1 +
 arch/x86/pci/sta2x11-fixup.c                 |  1 +
 arch/x86/um/vdso/um_vdso.c                   |  1 +
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  6 -----
 drivers/parport/parport_gsc.c                |  2 +-
 drivers/usb/host/fsl-mph-dr-of.c             |  2 +-
 drivers/video/fbdev/fsl-diu-fb.c             |  2 +-
 fs/bcachefs/disk_groups.c                    |  2 +-
 fs/jffs2/debug.c                             |  2 +-
 include/linux/irq_work.h                     |  3 +++
 include/linux/kprobes.h                      |  4 +++
 include/linux/stackleak.h                    |  6 +++++
 include/vdso/gettime.h                       | 23 +++++++++++++++++
 kernel/sched/fair.c                          | 13 ----------
 kernel/sched/sched.h                         | 11 +++++++++
 kernel/time/tick-internal.h                  |  3 ++-
 lib/test_ida.c                               |  2 +-
 scripts/Makefile.extrawarn                   |  4 +--
 67 files changed, 127 insertions(+), 122 deletions(-)
 delete mode 100644 arch/m68k/coldfire/vectors.h
 create mode 100644 include/vdso/gettime.h

-- 
2.39.2
Cc: Matt Turner <mattst88@gmail.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: Helge Deller <deller@gmx.de>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Timur Tabi <timur@kernel.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-csky@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-bcachefs@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-kbuild@vger.kernel.org

