Return-Path: <linuxppc-dev+bounces-4188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8419F3268
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 15:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBhgb5frlz30Q3;
	Tue, 17 Dec 2024 01:11:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734358267;
	cv=none; b=E/JsEN8bIWQ5rG4mIHVPC97p4LzeHxngX63pDl6J2uYKhG3wsa48OJGOq/CxAmQTAqMkkxoAlcGUYf5G0uoIg2QFNZdTcNBkiUTtAR8Eiqpm0FH9/aACMW1AnPYDFibea684MeGJk8BDZ6RLGtc7xinLz+H1qk6n/sOwOZUwgRjwtMkaBEGauT355ZZ7Fe23+S28xQlDhtPx7Q+fYgCkw3urdQ6+RGCNTDUf1MEvRZgTIjcUYtT6wS2eoPhVsErQz2+dhgHocc0onk/Yuc+uxwbiFkCQWqkUO51APvbuDE/jhpz2Sba4c2guG9X16VmvyiX/xZdb4Qv3dZzYg/miNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734358267; c=relaxed/relaxed;
	bh=Sj4tX3UA7fUvQAik51BuI5OMMej4WiXonQN64EC9NlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iw8aMSjDNTsnoJVlCMP/4UrQoVGV7LAvQAFh/g6eWinQXgUv18sU2EMjyUE2QuQ9UGIcgR4Zcm8YiRnYJUafOXTcQ1apQt9N/0zCCrlULzKaSLpaeHEiy1XPTO8ra0ZmGUK/BZ/I7z9067itHvvhFwHvzRGc4IA2Uw6wcX7C7Ly6HqrJ1VIXoeQ/nKGqvIUXAB/Vrdp1XerDvesMmdjdpGl3N09PnXFQCXdp1IqYABc933dXEjVI6/xftWjOF1DMEvIgzoLENEpszqSnV/hb0MB09VsqCucyCcift7t/H0llzKyrTNSAkctXyGK7DLgTSSza/rw675TZEL8AFnckzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ODf0CQzn; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Hv9kYq6C; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ODf0CQzn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Hv9kYq6C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBhgV2dcLz305C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 01:11:01 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sj4tX3UA7fUvQAik51BuI5OMMej4WiXonQN64EC9NlE=;
	b=ODf0CQznGZhi4kOXiYQC1b2+iORh72DvOYzhOlif+DDHMkJSX/o2fz/PwQEZbHhEsU2vp/
	kDQRkTmR0yPjFHTWdCvu/NfWJXL48UcwfTlDDQXDfxjRaepNvpGeWKpHl+jNnxwBqm73xA
	cZJOL7gw+PgZAI7+l7ctrsDfqFJd/dE/h5+wDGGdd/rB4UrUsaDT0r5frK6WZe9/x89L9B
	b8eRhdsPU/gCz3Pjy5zpgywXaEJIboODD47dqSvr3NVjtG+uiRkinLuIdHay6lyRr4or2M
	DIn1TxVLY2mavo802ogGYd0lKHC1htnmbRptFSIbTkj3PuVZEu5nVxpn75L98Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sj4tX3UA7fUvQAik51BuI5OMMej4WiXonQN64EC9NlE=;
	b=Hv9kYq6CY05cD1pySHNQp+QWXQcgfTN6MQxPHxfwsQYwNXZC8mEveQkXEf7+4IIylCCSio
	dUED5McQf7fuk9Aw==
Date: Mon, 16 Dec 2024 15:10:04 +0100
Subject: [PATCH 08/17] LoongArch: vDSO: Switch to generic storage
 implementation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-vdso-store-rng-v1-8-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=14014;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Mu7NgGSUc91pJn+HeGH3J6ufU20kqOH08cFGsx4SGEo=;
 b=/MSmwUIdA8One1U/rerYPifsPFAWXYJag2er4xwQ630p6ZbpslfPaznMIpPubdLk0xwVtD2hM
 5vSbasgPzFdBOIpDI8VrCt1QAgs5ZKWD4VSIy9LwiHD9l4rjNmo2SFo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The generic storage implementation provides the same features as the
custom one. However it can be shared between architectures, making
maintenance easier.

Co-developed-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/Kconfig                         |  2 +
 arch/loongarch/include/asm/vdso.h              |  1 -
 arch/loongarch/include/asm/vdso/arch_data.h    | 25 +++++++
 arch/loongarch/include/asm/vdso/getrandom.h    |  5 --
 arch/loongarch/include/asm/vdso/gettimeofday.h | 14 +---
 arch/loongarch/include/asm/vdso/vdso.h         | 38 +----------
 arch/loongarch/include/asm/vdso/vsyscall.h     | 17 -----
 arch/loongarch/kernel/asm-offsets.c            |  2 +-
 arch/loongarch/kernel/vdso.c                   | 92 +-------------------------
 arch/loongarch/vdso/vdso.lds.S                 |  8 +--
 arch/loongarch/vdso/vgetcpu.c                  |  7 +-
 11 files changed, 38 insertions(+), 173 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index dae3a9104ca6584133d9b6a3059ee666c216d31b..6ec7ef705199fdd4039afd23ec9050a28aa894eb 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -29,6 +29,7 @@ config LOONGARCH
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
+	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_INLINE_READ_LOCK if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION
@@ -104,6 +105,7 @@ config LOONGARCH
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
+	select GENERIC_VDSO_DATA_STORE
 	select GENERIC_VDSO_TIME_NS
 	select GPIOLIB
 	select HAS_IOPORT
diff --git a/arch/loongarch/include/asm/vdso.h b/arch/loongarch/include/asm/vdso.h
index d3ba35eb23e77082ea8ed564fe7378ad80df81b2..f72ec79e2dde52f8888750a53c4af85d6ab77b45 100644
--- a/arch/loongarch/include/asm/vdso.h
+++ b/arch/loongarch/include/asm/vdso.h
@@ -31,7 +31,6 @@ struct loongarch_vdso_info {
 	unsigned long size;
 	unsigned long offset_sigreturn;
 	struct vm_special_mapping code_mapping;
-	struct vm_special_mapping data_mapping;
 };
 
 extern struct loongarch_vdso_info vdso_info;
diff --git a/arch/loongarch/include/asm/vdso/arch_data.h b/arch/loongarch/include/asm/vdso/arch_data.h
new file mode 100644
index 0000000000000000000000000000000000000000..322d0a5f1c844f02de9b074d6021e8e15116f8a2
--- /dev/null
+++ b/arch/loongarch/include/asm/vdso/arch_data.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Author: Huacai Chen <chenhuacai@loongson.cn>
+ * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
+ */
+
+#ifndef _VDSO_ARCH_DATA_H
+#define _VDSO_ARCH_DATA_H
+
+#ifndef __ASSEMBLY__
+
+#include <asm/asm.h>
+#include <asm/vdso.h>
+
+struct vdso_pcpu_data {
+	u32 node;
+} ____cacheline_aligned_in_smp;
+
+struct vdso_arch_data {
+	struct vdso_pcpu_data pdata[NR_CPUS];
+};
+
+#endif /* __ASSEMBLY__ */
+
+#endif
diff --git a/arch/loongarch/include/asm/vdso/getrandom.h b/arch/loongarch/include/asm/vdso/getrandom.h
index e80f3c4ac7481ba7f9f5d9210fefa78c3293243b..48c43f55b039b42168698614d0479b7a872d20f3 100644
--- a/arch/loongarch/include/asm/vdso/getrandom.h
+++ b/arch/loongarch/include/asm/vdso/getrandom.h
@@ -28,11 +28,6 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
 	return ret;
 }
 
-static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
-{
-	return &_loongarch_data.rng_data;
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETRANDOM_H */
diff --git a/arch/loongarch/include/asm/vdso/gettimeofday.h b/arch/loongarch/include/asm/vdso/gettimeofday.h
index 7eb3f041af764d141b005f821593a358096874ba..88cfcf13311630ed5f1a734d23a2bc3f65d79a88 100644
--- a/arch/loongarch/include/asm/vdso/gettimeofday.h
+++ b/arch/loongarch/include/asm/vdso/gettimeofday.h
@@ -72,7 +72,7 @@ static __always_inline int clock_getres_fallback(
 }
 
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
-						 const struct vdso_data *vd)
+						 const struct vdso_time_data *vd)
 {
 	uint64_t count;
 
@@ -89,18 +89,6 @@ static inline bool loongarch_vdso_hres_capable(void)
 }
 #define __arch_vdso_hres_capable loongarch_vdso_hres_capable
 
-static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
-{
-	return _vdso_data;
-}
-
-#ifdef CONFIG_TIME_NS
-static __always_inline
-const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
-{
-	return _timens_data;
-}
-#endif
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/loongarch/include/asm/vdso/vdso.h b/arch/loongarch/include/asm/vdso/vdso.h
index 1c183a9b2115a29a997ec8db0e788d87fb191dce..50c65fb29dafb464f36615f49db8954ee0a775e3 100644
--- a/arch/loongarch/include/asm/vdso/vdso.h
+++ b/arch/loongarch/include/asm/vdso/vdso.h
@@ -12,43 +12,9 @@
 #include <asm/asm.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <vdso/datapage.h>
 
-struct vdso_pcpu_data {
-	u32 node;
-} ____cacheline_aligned_in_smp;
-
-struct loongarch_vdso_data {
-	struct vdso_pcpu_data pdata[NR_CPUS];
-	struct vdso_rng_data rng_data;
-};
-
-/*
- * The layout of vvar:
- *
- *                      high
- * +---------------------+--------------------------+
- * | loongarch vdso data | LOONGARCH_VDSO_DATA_SIZE |
- * +---------------------+--------------------------+
- * |  time-ns vdso data  |        PAGE_SIZE         |
- * +---------------------+--------------------------+
- * |  generic vdso data  |        PAGE_SIZE         |
- * +---------------------+--------------------------+
- *                      low
- */
-#define LOONGARCH_VDSO_DATA_SIZE PAGE_ALIGN(sizeof(struct loongarch_vdso_data))
-#define LOONGARCH_VDSO_DATA_PAGES (LOONGARCH_VDSO_DATA_SIZE >> PAGE_SHIFT)
-
-enum vvar_pages {
-	VVAR_GENERIC_PAGE_OFFSET,
-	VVAR_TIMENS_PAGE_OFFSET,
-	VVAR_LOONGARCH_PAGES_START,
-	VVAR_LOONGARCH_PAGES_END = VVAR_LOONGARCH_PAGES_START + LOONGARCH_VDSO_DATA_PAGES - 1,
-	VVAR_NR_PAGES,
-};
-
-#define VVAR_SIZE (VVAR_NR_PAGES << PAGE_SHIFT)
-
-extern struct loongarch_vdso_data _loongarch_data __attribute__((visibility("hidden")));
+#define VVAR_SIZE (VDSO_NR_PAGES << PAGE_SHIFT)
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/loongarch/include/asm/vdso/vsyscall.h b/arch/loongarch/include/asm/vdso/vsyscall.h
index 8987e951d0a93c34ca75de676fb9c191ff4ef3c2..1140b54b4bc8278d7a322036cd9f84f71258f246 100644
--- a/arch/loongarch/include/asm/vdso/vsyscall.h
+++ b/arch/loongarch/include/asm/vdso/vsyscall.h
@@ -6,23 +6,6 @@
 
 #include <vdso/datapage.h>
 
-extern struct vdso_data *vdso_data;
-extern struct vdso_rng_data *vdso_rng_data;
-
-static __always_inline
-struct vdso_data *__loongarch_get_k_vdso_data(void)
-{
-	return vdso_data;
-}
-#define __arch_get_k_vdso_data __loongarch_get_k_vdso_data
-
-static __always_inline
-struct vdso_rng_data *__loongarch_get_k_vdso_rng_data(void)
-{
-	return vdso_rng_data;
-}
-#define __arch_get_k_vdso_rng_data __loongarch_get_k_vdso_rng_data
-
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
 
diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kernel/asm-offsets.c
index 049c5c3e370cbb00fdaf6730f7777847c7325fb4..7dcf4980dbead0249ef4daeab431c7d482abfeb5 100644
--- a/arch/loongarch/kernel/asm-offsets.c
+++ b/arch/loongarch/kernel/asm-offsets.c
@@ -327,6 +327,6 @@ static void __used output_vdso_defines(void)
 {
 	COMMENT("LoongArch vDSO offsets.");
 
-	DEFINE(__VVAR_PAGES, VVAR_NR_PAGES);
+	DEFINE(__VDSO_PAGES, VDSO_NR_PAGES);
 	BLANK();
 }
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 05e5fbac102a902016e633db75d9aff7ed550c50..10cf1608c7b32f8e03bc2c942b51413cf8b9c505 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -14,7 +14,7 @@
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/time_namespace.h>
+#include <linux/vdso_datastore.h>
 
 #include <asm/page.h>
 #include <asm/vdso.h>
@@ -25,18 +25,6 @@
 
 extern char vdso_start[], vdso_end[];
 
-/* Kernel-provided data used by the VDSO. */
-static union vdso_data_store generic_vdso_data __page_aligned_data;
-
-static union {
-	u8 page[LOONGARCH_VDSO_DATA_SIZE];
-	struct loongarch_vdso_data vdata;
-} loongarch_vdso_data __page_aligned_data;
-
-struct vdso_data *vdso_data = generic_vdso_data.data;
-struct vdso_pcpu_data *vdso_pdata = loongarch_vdso_data.vdata.pdata;
-struct vdso_rng_data *vdso_rng_data = &loongarch_vdso_data.vdata.rng_data;
-
 static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struct *new_vma)
 {
 	current->mm->context.vdso = (void *)(new_vma->vm_start);
@@ -44,53 +32,12 @@ static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struc
 	return 0;
 }
 
-static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
-			     struct vm_area_struct *vma, struct vm_fault *vmf)
-{
-	unsigned long pfn;
-	struct page *timens_page = find_timens_vvar_page(vma);
-
-	switch (vmf->pgoff) {
-	case VVAR_GENERIC_PAGE_OFFSET:
-		if (!timens_page)
-			pfn = sym_to_pfn(vdso_data);
-		else
-			pfn = page_to_pfn(timens_page);
-		break;
-#ifdef CONFIG_TIME_NS
-	case VVAR_TIMENS_PAGE_OFFSET:
-		/*
-		 * If a task belongs to a time namespace then a namespace specific
-		 * VVAR is mapped with the VVAR_GENERIC_PAGE_OFFSET and the real
-		 * VVAR page is mapped with the VVAR_TIMENS_PAGE_OFFSET offset.
-		 * See also the comment near timens_setup_vdso_data().
-		 */
-		if (!timens_page)
-			return VM_FAULT_SIGBUS;
-		else
-			pfn = sym_to_pfn(vdso_data);
-		break;
-#endif /* CONFIG_TIME_NS */
-	case VVAR_LOONGARCH_PAGES_START ... VVAR_LOONGARCH_PAGES_END:
-		pfn = sym_to_pfn(&loongarch_vdso_data) + vmf->pgoff - VVAR_LOONGARCH_PAGES_START;
-		break;
-	default:
-		return VM_FAULT_SIGBUS;
-	}
-
-	return vmf_insert_pfn(vma, vmf->address, pfn);
-}
-
 struct loongarch_vdso_info vdso_info = {
 	.vdso = vdso_start,
 	.code_mapping = {
 		.name = "[vdso]",
 		.mremap = vdso_mremap,
 	},
-	.data_mapping = {
-		.name = "[vvar]",
-		.fault = vvar_fault,
-	},
 	.offset_sigreturn = vdso_offset_sigreturn,
 };
 
@@ -101,7 +48,7 @@ static int __init init_vdso(void)
 	BUG_ON(!PAGE_ALIGNED(vdso_info.vdso));
 
 	for_each_possible_cpu(cpu)
-		vdso_pdata[cpu].node = cpu_to_node(cpu);
+		vdso_k_arch_data->pdata[cpu].node = cpu_to_node(cpu);
 
 	vdso_info.size = PAGE_ALIGN(vdso_end - vdso_start);
 	vdso_info.code_mapping.pages =
@@ -115,37 +62,6 @@ static int __init init_vdso(void)
 }
 subsys_initcall(init_vdso);
 
-#ifdef CONFIG_TIME_NS
-struct vdso_data *arch_get_vdso_data(void *vvar_page)
-{
-	return (struct vdso_data *)(vvar_page);
-}
-
-/*
- * The vvar mapping contains data for a specific time namespace, so when a
- * task changes namespace we must unmap its vvar data for the old namespace.
- * Subsequent faults will map in data for the new namespace.
- *
- * For more details see timens_setup_vdso_data().
- */
-int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
-{
-	struct mm_struct *mm = task->mm;
-	struct vm_area_struct *vma;
-
-	VMA_ITERATOR(vmi, mm, 0);
-
-	mmap_read_lock(mm);
-	for_each_vma(vmi, vma) {
-		if (vma_is_special_mapping(vma, &vdso_info.data_mapping))
-			zap_vma_pages(vma);
-	}
-	mmap_read_unlock(mm);
-
-	return 0;
-}
-#endif
-
 static unsigned long vdso_base(void)
 {
 	unsigned long base = STACK_TOP;
@@ -181,9 +97,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		goto out;
 	}
 
-	vma = _install_special_mapping(mm, data_addr, VVAR_SIZE,
-				       VM_READ | VM_MAYREAD | VM_PFNMAP,
-				       &info->data_mapping);
+	vma = vdso_install_vvar_mapping(mm, data_addr);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		goto out;
diff --git a/arch/loongarch/vdso/vdso.lds.S b/arch/loongarch/vdso/vdso.lds.S
index 160cfaef2de45b1243502c7356f8a913658548fe..8ff98649994750e74b30a91270d9d9ea2ba751e8 100644
--- a/arch/loongarch/vdso/vdso.lds.S
+++ b/arch/loongarch/vdso/vdso.lds.S
@@ -5,6 +5,7 @@
  */
 #include <asm/page.h>
 #include <generated/asm-offsets.h>
+#include <vdso/datapage.h>
 
 OUTPUT_FORMAT("elf64-loongarch", "elf64-loongarch", "elf64-loongarch")
 
@@ -12,11 +13,8 @@ OUTPUT_ARCH(loongarch)
 
 SECTIONS
 {
-	PROVIDE(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
-#ifdef CONFIG_TIME_NS
-	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
-#endif
-	PROVIDE(_loongarch_data = _vdso_data + 2 * PAGE_SIZE);
+	VDSO_VVAR_SYMS
+
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
diff --git a/arch/loongarch/vdso/vgetcpu.c b/arch/loongarch/vdso/vgetcpu.c
index 0db51258b2a7ca7e44d2eb68ea514face48393f7..3798eebdf798dfa6574a8e51d6f58c206725c312 100644
--- a/arch/loongarch/vdso/vgetcpu.c
+++ b/arch/loongarch/vdso/vgetcpu.c
@@ -19,11 +19,6 @@ static __always_inline int read_cpu_id(void)
 	return cpu_id;
 }
 
-static __always_inline const struct vdso_pcpu_data *get_pcpu_data(void)
-{
-	return _loongarch_data.pdata;
-}
-
 extern
 int __vdso_getcpu(unsigned int *cpu, unsigned int *node, struct getcpu_cache *unused);
 int __vdso_getcpu(unsigned int *cpu, unsigned int *node, struct getcpu_cache *unused)
@@ -37,7 +32,7 @@ int __vdso_getcpu(unsigned int *cpu, unsigned int *node, struct getcpu_cache *un
 		*cpu = cpu_id;
 
 	if (node) {
-		data = get_pcpu_data();
+		data = __arch_get_vdso_u_arch_data()->pdata;
 		*node = data[cpu_id].node;
 	}
 

-- 
2.47.1


