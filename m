Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BB7E602E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 22:49:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DibXsoaT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQdzS3n1pz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 08:49:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DibXsoaT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQQFq1fVCz3cD5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 00:01:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60564611F4;
	Wed,  8 Nov 2023 13:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F555C433CC;
	Wed,  8 Nov 2023 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448493;
	bh=8DpN0VlV8K0lsnX0jmMrJn6Kymi6tbSMkafnHnRNAHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DibXsoaTqClDsrfxEF6YTCHmf235I4T7HCqVtaKAjpPv8VgPEU3X4AUaF1ASprk/m
	 weD+C7Ay/0NB6yjSr50XXvaJ5uTmd+LY00KBbUnVkEX7yF5CwlNDuaqYEOmUpdQRC8
	 fx5xBIsRtMo/aqDY0+zoYmD+5w9Fiqhy9IIhFJSgdWz6H2xuqbrvux8ZIcp8+EMwoT
	 JpiE4JyUZmE9fBObjEeuKItp5JK71O3s7lLVEvMpV/TsKTME/wbTew8fpQcfi2Rx2b
	 5fTvleCWpucJRTv0OM5lInLKMpnGhVyH3Cxd8iUqz4UTYm+qzeRi5SjUZgPgXeaAW+
	 aI/4daUSnxQJw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
Date: Wed,  8 Nov 2023 13:58:31 +0100
Message-Id: <20231108125843.3806765-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
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

Microblaze runs into a single -Wmissing-prototypes warning when that is
enabled:

arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]

Include the right header to avoid this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/kernel/traps.c      | 1 +
 arch/csky/include/asm/traps.h  | 2 --
 arch/csky/kernel/traps.c       | 1 +
 arch/m68k/coldfire/vectors.c   | 3 +--
 arch/m68k/coldfire/vectors.h   | 3 ---
 arch/microblaze/kernel/traps.c | 1 +
 arch/sparc/kernel/traps_32.c   | 1 +
 arch/sparc/kernel/traps_64.c   | 1 +
 arch/x86/include/asm/traps.h   | 1 -
 arch/x86/kernel/traps.c        | 1 +
 10 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 arch/m68k/coldfire/vectors.h

diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index d9a67b370e04..7fc72aeb7398 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -9,6 +9,7 @@
  * This file initializes the trap entry points
  */
 
+#include <linux/cpu.h>
 #include <linux/jiffies.h>
 #include <linux/mm.h>
 #include <linux/sched/signal.h>
diff --git a/arch/csky/include/asm/traps.h b/arch/csky/include/asm/traps.h
index 732c4aaa2e26..495ce318d569 100644
--- a/arch/csky/include/asm/traps.h
+++ b/arch/csky/include/asm/traps.h
@@ -55,6 +55,4 @@ asmlinkage void trap_c(struct pt_regs *regs);
 asmlinkage void do_notify_resume(struct pt_regs *regs,
 			unsigned long thread_info_flags);
 
-void trap_init(void);
-
 #endif /* __ASM_CSKY_TRAPS_H */
diff --git a/arch/csky/kernel/traps.c b/arch/csky/kernel/traps.c
index 6e426fba0119..c2246b07cc9c 100644
--- a/arch/csky/kernel/traps.c
+++ b/arch/csky/kernel/traps.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2018 Hangzhou C-SKY Microsystems co.,ltd.
 
+#include <linux/cpu.h>
 #include <linux/sched.h>
 #include <linux/signal.h>
 #include <linux/kernel.h>
diff --git a/arch/m68k/coldfire/vectors.c b/arch/m68k/coldfire/vectors.c
index c26c255b530d..4321fd89d83e 100644
--- a/arch/m68k/coldfire/vectors.c
+++ b/arch/m68k/coldfire/vectors.c
@@ -12,14 +12,13 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/irq.h>
+#include <linux/cpu.h>
 #include <asm/traps.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfwdebug.h>
 
-#include "vectors.h"
-
 /***************************************************************************/
 
 #ifdef TRAP_DBG_INTERRUPT
diff --git a/arch/m68k/coldfire/vectors.h b/arch/m68k/coldfire/vectors.h
deleted file mode 100644
index 0b01450a4353..000000000000
--- a/arch/m68k/coldfire/vectors.h
+++ /dev/null
@@ -1,3 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-void trap_init(void);
diff --git a/arch/microblaze/kernel/traps.c b/arch/microblaze/kernel/traps.c
index 94b6fe93147d..080aa769218d 100644
--- a/arch/microblaze/kernel/traps.c
+++ b/arch/microblaze/kernel/traps.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/cpu.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/kallsyms.h>
diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
index 179aabfa712e..bb149f6cc34b 100644
--- a/arch/sparc/kernel/traps_32.c
+++ b/arch/sparc/kernel/traps_32.c
@@ -10,6 +10,7 @@
  * I hate traps on the sparc, grrr...
  */
 
+#include <linux/cpu.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/debug.h>
 #include <linux/mm_types.h>
diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index 08ffd17d5ec3..3631899f2394 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -9,6 +9,7 @@
  * I like traps on v9, :))))
  */
 
+#include <linux/cpu.h>
 #include <linux/extable.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/debug.h>
diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index b1c9cea6ba88..1f1deaecd364 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -14,7 +14,6 @@
 asmlinkage __visible notrace struct pt_regs *sync_regs(struct pt_regs *eregs);
 asmlinkage __visible notrace
 struct pt_regs *fixup_bad_iret(struct pt_regs *bad_regs);
-void __init trap_init(void);
 asmlinkage __visible noinstr struct pt_regs *vc_switch_off_ist(struct pt_regs *eregs);
 #endif
 
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index c876f1d36a81..b0737a15c470 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -37,6 +37,7 @@
 #include <linux/nmi.h>
 #include <linux/mm.h>
 #include <linux/smp.h>
+#include <linux/cpu.h>
 #include <linux/io.h>
 #include <linux/hardirq.h>
 #include <linux/atomic.h>
-- 
2.39.2

