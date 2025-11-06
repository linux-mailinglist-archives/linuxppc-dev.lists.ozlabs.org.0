Return-Path: <linuxppc-dev+bounces-13864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F36C3A0AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:06:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmq6ZJbz3fLt;
	Thu,  6 Nov 2025 21:02:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423355;
	cv=none; b=l5jV2LVyRSEb1M7tRg/xHMuxV/B6agLlzqQZ5NM++VBC5T9NjgNUjLU2N/F3N+Utkk7K1fYe9gANSRTQw9TSuSzvMEibmFYXhE/Yi5IOqE3R30nYyl+1zoU5IlJw2B3gd0ric7dQXD5r0TgCU9zN6ELtdDsrcmB/seJ/Y5a9ZomSXyOQ6ZMPzK57oS6xS6R7d2AwgtFqtOK/V9MiNqCeIB9PxCY1dFBLnJuouMmhvZ7fJdJD9TM4mfPdWI+sKB8JUuF+G0EbwwVukrG8dxajzaHkxqe2x7qSEshpmWsZEW24w7JjF+fdIvgCkOWlCkfnYWnr8lGI4o9Exa6rTUbXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423355; c=relaxed/relaxed;
	bh=9h2pb1V7ipgZNlCnvpCW+AmTuEcf1Qtqf7GVE2UhA9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSSGWbSj19Gf0AWUVve8D7JqWrSOeHXmxaVeKtMg8vJlD6NuUYn1nT3wSig8MrCE+JtjnzmDR4ReNxrTiCk1r1VOS6RxviUOy5p9DGTKx+QVoD0ZIqyCCnJHqiAiotQmA9yFCgN100JyMlhFuZE2m4wl3Rh31LDF2bQlv6Vrjsr8q1EfLz36ZLHhnHwkFDS2GmvYakkxweBJavkc76WEadJelMtX3G1j27fgXhonsrdG+API0dzI7FbGMINbzvk6uMwCi+SzMOCxFBcI7xMZWP5o/9boz92VIwT/kBXpIUN8UcoBGYfe2moO866MVHpESVE8z//iCWJhpGmP+siKkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nhDhWl1H; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/8WZVdWR; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nhDhWl1H;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/8WZVdWR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hmq1JHcz3fLB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:35 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9h2pb1V7ipgZNlCnvpCW+AmTuEcf1Qtqf7GVE2UhA9Q=;
	b=nhDhWl1Hy+J2FwGreKqIM2FzECo3XwwLQAVOEdBM8gOEmVBz6tVyWrLY3o/dz5Gos+0WOZ
	j1SftwxNaTa2kzwU3VvXnailN0IRw8GrKTk6foKmOZCz8Gg4ams3xV4MFMZVAlcSVboBQo
	dfpmPHc2abnAqFP+Y2BL9IzwADsJwaEr6Q4Q+sRcnI6aO57jQA70VB40VSLf9RTEQTm+O0
	4MA55cdosrqslDUzZCPHKxW0WzFFCo/VjeXEG9IoR7LcZ79a+Zair6Il4kGRRkbZCYFTvW
	6AQ6W06Re/O4cq0tY9f6UtDA36tTd/yOlUzVyXV67g1F/TDhfudhypKIGEAOmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9h2pb1V7ipgZNlCnvpCW+AmTuEcf1Qtqf7GVE2UhA9Q=;
	b=/8WZVdWRyJfnxDSbRyoKS3gb7RfZQo5yJT7eJkBmW9T61AYhhF6QjLdxdchIOBVba1WWEd
	L/sBkUoV+/hYGnAQ==
Date: Thu, 06 Nov 2025 11:02:22 +0100
Subject: [PATCH v5 29/34] sparc64: vdso: Introduce vdso/processor.h
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-29-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=4770;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=69d1+4gsu5NkCOVxynY9ZDBF0HEBmIzlBhmM7Uhwm2U=;
 b=6gdIewuHG3XJugRIyyATke5iOs62aXKBZC0E52Y4jFJZCjp0gJ9wSyDPutjxobM27bAeGHUXL
 6GrxL80fo83AlXuKijShN+0hAXiZ7mHbI5IUO+U3ojKKSsScdljy5k5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic vDSO library expects a vdso/processor.h with an definition of
cpu_relax().

Split out cpu_relax() into this dedicated header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/processor.h      |  3 +++
 arch/sparc/include/asm/processor_32.h   |  2 --
 arch/sparc/include/asm/processor_64.h   | 25 --------------------
 arch/sparc/include/asm/vdso/processor.h | 41 +++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/sparc/include/asm/processor.h b/arch/sparc/include/asm/processor.h
index 18295ea625dd7271617c15caa003a173099dd4d0..e34de956519aaca0e9bf82a22000d9096f868968 100644
--- a/arch/sparc/include/asm/processor.h
+++ b/arch/sparc/include/asm/processor.h
@@ -1,6 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef ___ASM_SPARC_PROCESSOR_H
 #define ___ASM_SPARC_PROCESSOR_H
+
+#include <asm/vdso/processor.h>
+
 #if defined(__sparc__) && defined(__arch64__)
 #include <asm/processor_64.h>
 #else
diff --git a/arch/sparc/include/asm/processor_32.h b/arch/sparc/include/asm/processor_32.h
index ba8b70ffec085feb17de9050f37de98e0039f7c3..a074d313f4f80621c1bc42733529c6d9450b1275 100644
--- a/arch/sparc/include/asm/processor_32.h
+++ b/arch/sparc/include/asm/processor_32.h
@@ -91,8 +91,6 @@ unsigned long __get_wchan(struct task_struct *);
 extern struct task_struct *last_task_used_math;
 int do_mathemu(struct pt_regs *regs, struct task_struct *fpt);
 
-#define cpu_relax()	barrier()
-
 extern void (*sparc_idle)(void);
 
 #endif
diff --git a/arch/sparc/include/asm/processor_64.h b/arch/sparc/include/asm/processor_64.h
index 321859454ca4c55817bfcd0c627dae4f51d12041..4850704952634133aad143327bcbaa618fe66fde 100644
--- a/arch/sparc/include/asm/processor_64.h
+++ b/arch/sparc/include/asm/processor_64.h
@@ -182,31 +182,6 @@ unsigned long __get_wchan(struct task_struct *task);
 #define KSTK_EIP(tsk)  (task_pt_regs(tsk)->tpc)
 #define KSTK_ESP(tsk)  (task_pt_regs(tsk)->u_regs[UREG_FP])
 
-/* Please see the commentary in asm/backoff.h for a description of
- * what these instructions are doing and how they have been chosen.
- * To make a long story short, we are trying to yield the current cpu
- * strand during busy loops.
- */
-#ifdef	BUILD_VDSO
-#define	cpu_relax()	asm volatile("\n99:\n\t"			\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     ::: "memory")
-#else /* ! BUILD_VDSO */
-#define cpu_relax()	asm volatile("\n99:\n\t"			\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     ".section	.pause_3insn_patch,\"ax\"\n\t"\
-				     ".word	99b\n\t"		\
-				     "wr	%%g0, 128, %%asr27\n\t"	\
-				     "nop\n\t"				\
-				     "nop\n\t"				\
-				     ".previous"			\
-				     ::: "memory")
-#endif
-
 /* Prefetch support.  This is tuned for UltraSPARC-III and later.
  * UltraSPARC-I will treat these as nops, and UltraSPARC-II has
  * a shallower prefetch queue than later chips.
diff --git a/arch/sparc/include/asm/vdso/processor.h b/arch/sparc/include/asm/vdso/processor.h
new file mode 100644
index 0000000000000000000000000000000000000000..f7a9adc807f7c9a0444afa51aeb47649a9bdb079
--- /dev/null
+++ b/arch/sparc/include/asm/vdso/processor.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_SPARC_VDSO_PROCESSOR_H
+#define _ASM_SPARC_VDSO_PROCESSOR_H
+
+#include <linux/compiler.h>
+
+#if defined(__arch64__)
+
+/* Please see the commentary in asm/backoff.h for a description of
+ * what these instructions are doing and how they have been chosen.
+ * To make a long story short, we are trying to yield the current cpu
+ * strand during busy loops.
+ */
+#ifdef	BUILD_VDSO
+#define	cpu_relax()	asm volatile("\n99:\n\t"			\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     ::: "memory")
+#else /* ! BUILD_VDSO */
+#define cpu_relax()	asm volatile("\n99:\n\t"			\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     ".section	.pause_3insn_patch,\"ax\"\n\t"\
+				     ".word	99b\n\t"		\
+				     "wr	%%g0, 128, %%asr27\n\t"	\
+				     "nop\n\t"				\
+				     "nop\n\t"				\
+				     ".previous"			\
+				     ::: "memory")
+#endif /* BUILD_VDSO */
+
+#else /* ! __arch64__ */
+
+#define cpu_relax()	barrier()
+
+#endif /* __arch64__ */
+
+#endif /* _ASM_SPARC_VDSO_PROCESSOR_H */

-- 
2.51.0


