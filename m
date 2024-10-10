Return-Path: <linuxppc-dev+bounces-1946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4FF997E63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKq6fm7z3bwd;
	Thu, 10 Oct 2024 18:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543743;
	cv=none; b=Ulxxcy394vaUPENXPyMTTOCO3t4YUiZqRcAMAvy5ZKWi5vuESYGRaRPtteyM+XC9F1QGj2T2C/gUFVdIEedC7tar2WcXD4Do6GHrUw1BbAEOxT0U8HHPexm4ntNFf5E/hVhEoYPDDkqJjdus2mj7nBb7YQsZNroI5KgkHdn2CPfhGzruS1s0Feo3V64zVcaUSdEmh8o6xNjoirAlO1UsNXS3ITl10EsihwJVnVYyEf51Nn81sEJv9MQl4OCQXQ6JR0g+6irxDD7s+yEUryqJDWVqbX+lstKUgVB+tpdWhlUw6/Rxrgl/0xBLTazcwEjjU0qKp7w3zfRnnRwi8gCg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543743; c=relaxed/relaxed;
	bh=XgNqPrqTfzE/nrwDzxpoMeBypcAJxCtM0sTQTc7P/sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGt/ngeFUZvoG0YglSNPeYrtKlBFts8GL5hGhom0LQqscOns1Ja9DYivfTMMoY0t+bTAP6kMOqbKrnHrakGXNBx+2r9WgSP65Zaqchzj5iu/5cr/m4CbF4vkAPxOUaWUyWfVvlfT44YaLUW/SqizMGnWzi5HV4V32i7n3Gm14rVwvxM3Q0dTs87XokWHJccaZoun4bG6T3Vddk/yaV9zfY6mJ6rh1B5DjUqXElVqTHbe+r2/Fi5uKnj6WGZA27Gt059F3mjftfVo3XEQ6wnohtqo0F0Z2PVAgS0CjfxVKeKuHFSOu3VKY+rDEztRyG5p31wUoj34KRMIH5bx+dcVCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wU9epZns; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8lghaYE2; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wU9epZns;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8lghaYE2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKq07Qgz3bmq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:23 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgNqPrqTfzE/nrwDzxpoMeBypcAJxCtM0sTQTc7P/sg=;
	b=wU9epZnsfrpzNFO+fzyusZ4op8eCsVICWYnnzOS6Q/CFu8t1sDiTxogdYYJeFx7i87f6hW
	b7znkXHrks9a10ItUOf4ojO/2bPzBrYaLOWb7G60PV16jMfzGSPrUGxOlLz26Q3xQjp8xV
	8GdUeZa2jFMU90wPzlRhnnE1IxMdmVjhkClOTpHSoTNmzk3tJR2dVeeSkdakJephza6Pt1
	VQnFRrwhwvs9pmHKVha3pPxt1Nxdb/O2XNaIkACwSvORgr53IGYe1dvcvXADwRU/72rTxR
	tD1ImfS0ZTer3dahy/P5mSKsjLl2D2YkDlW5v15sTHKH6QJy80jsGcl70g0yew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgNqPrqTfzE/nrwDzxpoMeBypcAJxCtM0sTQTc7P/sg=;
	b=8lghaYE26ry3lrwI3DqFKFYDGEeWUmAwJ53eesaFeTGKFndo006oWnBPca8hmvSD+MNVvz
	CHa8CO4DchrHUTAA==
Date: Thu, 10 Oct 2024 09:01:29 +0200
Subject: [PATCH 27/28] powerpc: Split systemcfg struct definitions out from
 vdso
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-27-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=7462;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=yNJj26tJsjc+mxczFd91wneA+G5AUhG1qynicaUOvCU=;
 b=ye4bvn06ziioQWEwHInA8TCQjz/vGUSBKcbszX6pxWLGUoAdN8oTviJO71DzcWGG2o6WiAPSq
 MpW5Jway+KJCf0rMgplhNrfWg4Q1bwSsiaRNld8cC3UHkTfgcrC5ymF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The systemcfg data has nothing to do anymore with the vdso.
Split it into a dedicated header file.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/systemcfg.h         | 52 ++++++++++++++++++++++++++++
 arch/powerpc/include/asm/vdso_datapage.h     | 37 --------------------
 arch/powerpc/kernel/proc_powerpc.c           |  1 +
 arch/powerpc/kernel/setup-common.c           |  1 +
 arch/powerpc/kernel/smp.c                    |  1 +
 arch/powerpc/kernel/time.c                   |  1 +
 arch/powerpc/platforms/powernv/smp.c         |  1 +
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  1 +
 8 files changed, 58 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/include/asm/systemcfg.h b/arch/powerpc/include/asm/systemcfg.h
new file mode 100644
index 0000000000000000000000000000000000000000..2f9b1d6a5c98d10469f8533fe6781be437712eff
--- /dev/null
+++ b/arch/powerpc/include/asm/systemcfg.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _SYSTEMCFG_H
+#define _SYSTEMCFG_H
+
+/*
+ * Copyright (C) 2002 Peter Bergner <bergner@vnet.ibm.com>, IBM
+ * Copyright (C) 2005 Benjamin Herrenschmidy <benh@kernel.crashing.org>,
+ * 		      IBM Corp.
+ */
+
+#ifdef CONFIG_PPC64
+
+/*
+ * If the major version changes we are incompatible.
+ * Minor version changes are a hint.
+ */
+#define SYSTEMCFG_MAJOR 1
+#define SYSTEMCFG_MINOR 1
+
+#include <linux/types.h>
+
+struct systemcfg {
+	__u8  eye_catcher[16];		/* Eyecatcher: SYSTEMCFG:PPC64	0x00 */
+	struct {			/* Systemcfg version numbers	     */
+		__u32 major;		/* Major number			0x10 */
+		__u32 minor;		/* Minor number			0x14 */
+	} version;
+
+	/* Note about the platform flags: it now only contains the lpar
+	 * bit. The actual platform number is dead and buried
+	 */
+	__u32 platform;			/* Platform flags		0x18 */
+	__u32 processor;		/* Processor type		0x1C */
+	__u64 processorCount;		/* # of physical processors	0x20 */
+	__u64 physicalMemorySize;	/* Size of real memory(B)	0x28 */
+	__u64 tb_orig_stamp;		/* (NU) Timebase at boot	0x30 */
+	__u64 tb_ticks_per_sec;		/* Timebase tics / sec		0x38 */
+	__u64 tb_to_xs;			/* (NU) Inverse of TB to 2^20	0x40 */
+	__u64 stamp_xsec;		/* (NU)				0x48 */
+	__u64 tb_update_count;		/* (NU) Timebase atomicity ctr	0x50 */
+	__u32 tz_minuteswest;		/* (NU) Min. west of Greenwich	0x58 */
+	__u32 tz_dsttime;		/* (NU) Type of dst correction	0x5C */
+	__u32 dcache_size;		/* L1 d-cache size		0x60 */
+	__u32 dcache_line_size;		/* L1 d-cache line size		0x64 */
+	__u32 icache_size;		/* L1 i-cache size		0x68 */
+	__u32 icache_line_size;		/* L1 i-cache line size		0x6C */
+};
+
+extern struct systemcfg *systemcfg;
+
+#endif /* CONFIG_PPC64 */
+#endif /* _SYSTEMCFG_H */
diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 8b91b1d34ff639a0efb80b9cdd7274f785643153..a9686310be2cb8c8229d67fed31f332d04919557 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -9,14 +9,6 @@
  * 		      IBM Corp.
  */
 
-
-/*
- * If the major version changes we are incompatible.
- * Minor version changes are a hint.
- */
-#define SYSTEMCFG_MAJOR 1
-#define SYSTEMCFG_MINOR 1
-
 #ifndef __ASSEMBLY__
 
 #include <linux/unistd.h>
@@ -27,35 +19,6 @@
 
 #ifdef CONFIG_PPC64
 
-struct systemcfg {
-	__u8  eye_catcher[16];		/* Eyecatcher: SYSTEMCFG:PPC64	0x00 */
-	struct {			/* Systemcfg version numbers	     */
-		__u32 major;		/* Major number			0x10 */
-		__u32 minor;		/* Minor number			0x14 */
-	} version;
-
-	/* Note about the platform flags: it now only contains the lpar
-	 * bit. The actual platform number is dead and buried
-	 */
-	__u32 platform;			/* Platform flags		0x18 */
-	__u32 processor;		/* Processor type		0x1C */
-	__u64 processorCount;		/* # of physical processors	0x20 */
-	__u64 physicalMemorySize;	/* Size of real memory(B)	0x28 */
-	__u64 tb_orig_stamp;		/* (NU) Timebase at boot	0x30 */
-	__u64 tb_ticks_per_sec;		/* Timebase tics / sec		0x38 */
-	__u64 tb_to_xs;			/* (NU) Inverse of TB to 2^20	0x40 */
-	__u64 stamp_xsec;		/* (NU)				0x48 */
-	__u64 tb_update_count;		/* (NU) Timebase atomicity ctr	0x50 */
-	__u32 tz_minuteswest;		/* (NU) Min. west of Greenwich	0x58 */
-	__u32 tz_dsttime;		/* (NU) Type of dst correction	0x5C */
-	__u32 dcache_size;		/* L1 d-cache size		0x60 */
-	__u32 dcache_line_size;		/* L1 d-cache line size		0x64 */
-	__u32 icache_size;		/* L1 i-cache size		0x68 */
-	__u32 icache_line_size;		/* L1 i-cache line size		0x6C */
-};
-
-extern struct systemcfg *systemcfg;
-
 struct vdso_arch_data {
 	__u64 tb_ticks_per_sec;			/* Timebase tics / sec */
 	__u32 dcache_block_size;		/* L1 d-cache block size     */
diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index e8083e05a1d03f74d9f24bac99e3ab526368c8e2..3816a2bf2b844ff49f6fd22cc42e733d5ef72b36 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -13,6 +13,7 @@
 #include <asm/machdep.h>
 #include <asm/vdso_datapage.h>
 #include <asm/rtas.h>
+#include <asm/systemcfg.h>
 #include <linux/uaccess.h>
 
 #ifdef CONFIG_PPC64_PROC_SYSTEMCFG
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index d0b32ff2bc8dedc5aa7afce17f07a5c7c255387c..0b732d3b283b199b19e078d45ffe4cb0325b7e63 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -67,6 +67,7 @@
 #include <asm/cpu_has_feature.h>
 #include <asm/kasan.h>
 #include <asm/mce.h>
+#include <asm/systemcfg.h>
 
 #include "setup.h"
 
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 87ae45bf1045d8974e3eed09e284bc582310f3e2..5ac7084eebc0b8c5ab16d96c89cadde953003431 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -61,6 +61,7 @@
 #include <asm/ftrace.h>
 #include <asm/kup.h>
 #include <asm/fadump.h>
+#include <asm/systemcfg.h>
 
 #include <trace/events/ipi.h>
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 6c53a0153c0d1c7cd74017a4dadb09ba149e456f..f959f4bdde2f5cd886bf7db1f9f65366775f94c7 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -71,6 +71,7 @@
 #include <asm/vdso_datapage.h>
 #include <asm/firmware.h>
 #include <asm/mce.h>
+#include <asm/systemcfg.h>
 
 /* powerpc clocksource/clockevent code */
 
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index 672209428b98459ef0a5595c0ec7128a5c5f17a2..2e9da58195f51ccfc13b5e0b95d2626937186a3e 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -36,6 +36,7 @@
 #include <asm/kexec.h>
 #include <asm/reg.h>
 #include <asm/powernv.h>
+#include <asm/systemcfg.h>
 
 #include "powernv.h"
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 7b80d35d045dc9d947c0b512a58a82ef7398150d..bc6926dbf14890881eacf4eb8df010d2f465c79f 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -33,6 +33,7 @@
 #include <asm/xive.h>
 #include <asm/plpar_wrappers.h>
 #include <asm/topology.h>
+#include <asm/systemcfg.h>
 
 #include "pseries.h"
 

-- 
2.47.0


