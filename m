Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D637E603A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 22:53:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZSU1cs3l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQf4451NVz3vj8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 08:53:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZSU1cs3l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQQHH0Ljwz3cJN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 00:02:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61DD4CE109D;
	Wed,  8 Nov 2023 13:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6686C43395;
	Wed,  8 Nov 2023 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448564;
	bh=CS6e6zSkIntvKZkjb0BzjLIyZ+ieD5cCMYLYOT+4n9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZSU1cs3liK78MFymmSIWKNoHLZEh37UVOfnpPjZ5eE+EKhj2opLJiGtjPFbmNOKhD
	 MXjt+qgelKwrWmMzXOwmVOfndkaOhSnuRrVz3KdXbxdcD3RFiPJ5ACHXV4MCxXs+RW
	 JZHXRhSHlajIDFPKaWioUHaBK5vV+3eA+FPsjgBsPDYBZxtWdTe+PnoQgeAWgFFiGw
	 bwvRbyyRnrWhUwz5U23cxufbJ7eT+jMxXFT2zMaQxN+P+nGsYPpfHIe2Sht+QN8e/v
	 yua31o+aYhmtaqKBNtOVLl5769Q5bKyqMDSaIM1JGrFO8DDFlqOJszZvDY43R84CCB
	 PVlRQQ75ucAHQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Date: Wed,  8 Nov 2023 13:58:36 +0100
Message-Id: <20231108125843.3806765-16-arnd@kernel.org>
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

The VDSO functions are defined as globals in the kernel sources but intended
to be called from userspace, so there is no need to declare them in a kernel
side header.

Without a prototype, this now causes warnings such as

arch/mips/vdso/vgettimeofday.c:14:5: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]
arch/mips/vdso/vgettimeofday.c:28:5: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]
arch/mips/vdso/vgettimeofday.c:36:5: error: no previous prototype for '__vdso_clock_getres' [-Werror=missing-prototypes]
arch/mips/vdso/vgettimeofday.c:42:5: error: no previous prototype for '__vdso_clock_gettime64' [-Werror=missing-prototypes]
arch/sparc/vdso/vclock_gettime.c:254:1: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]
arch/sparc/vdso/vclock_gettime.c:282:1: error: no previous prototype for '__vdso_clock_gettime_stick' [-Werror=missing-prototypes]
arch/sparc/vdso/vclock_gettime.c:307:1: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]
arch/sparc/vdso/vclock_gettime.c:343:1: error: no previous prototype for '__vdso_gettimeofday_stick' [-Werror=missing-prototypes]

Most architectures have already added workarounds for these by adding
declarations somewhere, but since these are all compatible, we should
really just have one copy, with an #ifdef check for the 32-bit vs
64-bit variant and use that everywhere.

Unfortunately, the sparc version is currently incompatible since
that never added support for __vdso_clock_gettime64() in 32-bit
userland. For the moment, I'm leaving this one out, as I can't
easily test it and it requires a larger rework.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/vdso.h              |  5 -----
 arch/arm/vdso/vgettimeofday.c            |  1 +
 arch/arm64/kernel/vdso32/vgettimeofday.c |  1 +
 arch/csky/kernel/vdso/vgettimeofday.c    | 11 +----------
 arch/loongarch/vdso/vgettimeofday.c      |  7 +------
 arch/mips/vdso/vgettimeofday.c           |  1 +
 arch/riscv/kernel/vdso/vgettimeofday.c   |  7 +------
 arch/x86/entry/vdso/vclock_gettime.c     | 10 +---------
 arch/x86/include/asm/vdso/gettimeofday.h |  2 --
 arch/x86/um/vdso/um_vdso.c               |  1 +
 include/vdso/gettime.h                   | 23 +++++++++++++++++++++++
 11 files changed, 31 insertions(+), 38 deletions(-)
 create mode 100644 include/vdso/gettime.h

diff --git a/arch/arm/include/asm/vdso.h b/arch/arm/include/asm/vdso.h
index 422c3afa806a..5b85889f82ee 100644
--- a/arch/arm/include/asm/vdso.h
+++ b/arch/arm/include/asm/vdso.h
@@ -24,11 +24,6 @@ static inline void arm_install_vdso(struct mm_struct *mm, unsigned long addr)
 
 #endif /* CONFIG_VDSO */
 
-int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts);
-int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts);
-int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
-int __vdso_clock_getres(clockid_t clock_id, struct old_timespec32 *res);
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/arm/vdso/vgettimeofday.c b/arch/arm/vdso/vgettimeofday.c
index a003beacac76..3554aa35f1ba 100644
--- a/arch/arm/vdso/vgettimeofday.c
+++ b/arch/arm/vdso/vgettimeofday.c
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include <asm/vdso.h>
 #include <asm/unwind.h>
+#include <vdso/gettime.h>
 
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
diff --git a/arch/arm64/kernel/vdso32/vgettimeofday.c b/arch/arm64/kernel/vdso32/vgettimeofday.c
index 5acff29c5991..e23c7f4ef26b 100644
--- a/arch/arm64/kernel/vdso32/vgettimeofday.c
+++ b/arch/arm64/kernel/vdso32/vgettimeofday.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2018 ARM Limited
  *
  */
+#include <vdso/gettime.h>
 
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
diff --git a/arch/csky/kernel/vdso/vgettimeofday.c b/arch/csky/kernel/vdso/vgettimeofday.c
index c4831145eed5..55af30e83752 100644
--- a/arch/csky/kernel/vdso/vgettimeofday.c
+++ b/arch/csky/kernel/vdso/vgettimeofday.c
@@ -2,36 +2,27 @@
 
 #include <linux/time.h>
 #include <linux/types.h>
+#include <vdso/gettime.h>
 
 extern
-int __vdso_clock_gettime(clockid_t clock,
-			 struct old_timespec32 *ts);
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
 {
 	return __cvdso_clock_gettime32(clock, ts);
 }
 
-int __vdso_clock_gettime64(clockid_t clock,
-			   struct __kernel_timespec *ts);
 int __vdso_clock_gettime64(clockid_t clock,
 			   struct __kernel_timespec *ts)
 {
 	return __cvdso_clock_gettime(clock, ts);
 }
 
-extern
-int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
-			struct timezone *tz);
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-extern
-int __vdso_clock_getres(clockid_t clock_id,
-			struct old_timespec32 *res);
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
diff --git a/arch/loongarch/vdso/vgettimeofday.c b/arch/loongarch/vdso/vgettimeofday.c
index 8f22863bd7ea..0885c1f3a89d 100644
--- a/arch/loongarch/vdso/vgettimeofday.c
+++ b/arch/loongarch/vdso/vgettimeofday.c
@@ -5,23 +5,18 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 #include <linux/types.h>
+#include <vdso/gettime.h>
 
-extern
-int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
 int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
 {
 	return __cvdso_clock_gettime(clock, ts);
 }
 
-extern
-int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-extern
-int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res);
 int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res)
 {
 	return __cvdso_clock_getres(clock_id, res);
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 6b83b6376a4b..604afea3f336 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -9,6 +9,7 @@
  */
 #include <linux/time.h>
 #include <linux/types.h>
+#include <vdso/gettime.h>
 
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 int __vdso_clock_gettime(clockid_t clock,
diff --git a/arch/riscv/kernel/vdso/vgettimeofday.c b/arch/riscv/kernel/vdso/vgettimeofday.c
index cc0d80699c31..b35057802584 100644
--- a/arch/riscv/kernel/vdso/vgettimeofday.c
+++ b/arch/riscv/kernel/vdso/vgettimeofday.c
@@ -8,23 +8,18 @@
 
 #include <linux/time.h>
 #include <linux/types.h>
+#include <vdso/gettime.h>
 
-extern
-int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
 int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
 {
 	return __cvdso_clock_gettime(clock, ts);
 }
 
-extern
-int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-extern
-int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res);
 int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res)
 {
 	return __cvdso_clock_getres(clock_id, res);
diff --git a/arch/x86/entry/vdso/vclock_gettime.c b/arch/x86/entry/vdso/vclock_gettime.c
index 7d70935b6758..0debc194bd78 100644
--- a/arch/x86/entry/vdso/vclock_gettime.c
+++ b/arch/x86/entry/vdso/vclock_gettime.c
@@ -11,12 +11,10 @@
 #include <linux/time.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
+#include <vdso/gettime.h>
 
 #include "../../../../lib/vdso/gettimeofday.c"
 
-extern int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
-extern __kernel_old_time_t __vdso_time(__kernel_old_time_t *t);
-
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
@@ -35,9 +33,6 @@ __kernel_old_time_t time(__kernel_old_time_t *t)	__attribute__((weak, alias("__v
 
 #if defined(CONFIG_X86_64) && !defined(BUILD_VDSO32_64)
 /* both 64-bit and x32 use these */
-extern int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
-extern int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *res);
-
 int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
 {
 	return __cvdso_clock_gettime(clock, ts);
@@ -56,9 +51,6 @@ int clock_getres(clockid_t, struct __kernel_timespec *)
 
 #else
 /* i386 only */
-extern int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts);
-extern int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res);
-
 int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 {
 	return __cvdso_clock_gettime32(clock, ts);
diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
index c81858d903dc..a46edb0e0cf7 100644
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -337,8 +337,6 @@ u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 }
 #define vdso_calc_delta vdso_calc_delta
 
-int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts);
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/x86/um/vdso/um_vdso.c b/arch/x86/um/vdso/um_vdso.c
index ff0f3b4b6c45..63768dd347ce 100644
--- a/arch/x86/um/vdso/um_vdso.c
+++ b/arch/x86/um/vdso/um_vdso.c
@@ -12,6 +12,7 @@
 #include <linux/time.h>
 #include <linux/getcpu.h>
 #include <asm/unistd.h>
+#include <vdso/gettime.h>
 
 int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
 {
diff --git a/include/vdso/gettime.h b/include/vdso/gettime.h
new file mode 100644
index 000000000000..c50d152e7b3e
--- /dev/null
+++ b/include/vdso/gettime.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _VDSO_GETTIME_H
+#define _VDSO_GETTIME_H
+
+#include <linux/types.h>
+
+struct __kernel_timespec;
+struct timezone;
+
+#if !defined(CONFIG_64BIT) || defined(BUILD_VDSO32_64)
+struct old_timespec32;
+int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res);
+int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts);
+#else
+int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *res);
+int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
+#endif
+
+__kernel_old_time_t __vdso_time(__kernel_old_time_t *t);
+int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
+int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts);
+
+#endif
-- 
2.39.2

