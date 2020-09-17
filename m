Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1E26D0F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 04:11:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsL7S4GP1zF35J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 12:11:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.194;
 helo=mail-pg1-f194.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BpBpw5b4; dkim-atps=neutral
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsL295n2yzDqKP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 12:07:13 +1000 (AEST)
Received: by mail-pg1-f194.google.com with SMTP id k14so427829pgi.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 19:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s1GDjxF3uEb8BnbZ4as8ah83nno0wPN/dQZGnSW/EkM=;
 b=BpBpw5b4J6E1UJpZs7PT67L23GMhd11fif1IvMfZ+J8q4Pb+KOlAp1sJTxiomuyRCL
 I6M5oetmqccAnod061Jv1ohslOILxNN7THzkfxP7mG9ndoqVFx7NaNqQcvm1keOPJ/Ox
 90i0rA2ELmvY21xollFRx8ogCaF3zjaRB0tKWmhEUmCawP/VrReG/Sqz9C6puOkBKaZK
 GKSCyqZ8C7pZzvxR48ysh/PdFT1b1+V4A9JzrH2z4JeqNSf90RbqwXspko2eJTH0ShFQ
 KlrTLlHcDNhOrTc76tk0fTAELL7NoKWFKxhxPwXsi0Mv5lzQRb45ZHGj7vRDF2lOIfQU
 tbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s1GDjxF3uEb8BnbZ4as8ah83nno0wPN/dQZGnSW/EkM=;
 b=DFEUffC0k2EXfm3s35+9g4Q51oCzcWgzV0oRU60bbFM4dgKUJM8iNfv8IYFSjrpFMP
 RETDvDOi8o8lhNYh/dt2VrvlnQKkAqhw1tWIzIcZIihH7DlyVUKUUMHa95RqtXxdDfWe
 7o6+tTfBCB95h1alW9Jkm31V0ByYFeWIcc7Wz8euUyiC2YeSRefnpQnbqlbU8bsUb48o
 3rzD+tVk5sPO81CWXyqnr6HPLDLBaXn2ZsaAbkqfPh9o9YpsOAHCstDxUe+4T0gQXOP4
 mH0Inc1DxcbFi4INHvZPHjrD6KOX9iDpBzTgAZ0xgWzU9Vvpv5xd6vi7BE6BH/Rm1OEL
 Aakw==
X-Gm-Message-State: AOAM5306UM/TnG9Om4gIpTppLwW5RdcqVPBjyqVaaRTKskCAi/4wuWdr
 Okfud4cr8hM75yAQlFuU6wpo24f/vZw=
X-Google-Smtp-Source: ABdhPJzjdhReOefXYr26mhLsRKC+InfF274oTptnlY1zuq1cEu8jByqzA/OgT0oxKGWpCbcvjoNMlQ==
X-Received: by 2002:aa7:908b:0:b029:142:2501:34ee with SMTP id
 i11-20020aa7908b0000b0290142250134eemr8948661pfa.71.1600308371241; 
 Wed, 16 Sep 2020 19:06:11 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c201sm19540354pfb.216.2020.09.16.19.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 19:06:10 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: Convert some cpu_setup() and cpu_restore()
 functions to C
Date: Thu, 17 Sep 2020 12:05:48 +1000
Message-Id: <20200917020548.20386-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917020548.20386-1-jniethe5@gmail.com>
References: <20200917020548.20386-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only thing keeping the cpu_setup() and cpu_restore() functions used
in the cputable entries for Power7, Power8, Power9 and Power10 in
assembly was cpu_restore() being called before there was a stack in
generic_secondary_smp_init(). Commit ("powerpc/64: Set up a kernel stack
for secondaries before cpu_restore()") means that it is now possible to
use C.

Rewrite the functions in C so they are a little bit easier to read. This
is not changing their functionality.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/cpu_setup_power.h |  12 +
 arch/powerpc/kernel/cpu_setup_power.S      | 252 -------------------
 arch/powerpc/kernel/cpu_setup_power.c      | 269 +++++++++++++++++++++
 arch/powerpc/kernel/cputable.c             |   9 +-
 4 files changed, 282 insertions(+), 260 deletions(-)
 create mode 100644 arch/powerpc/include/asm/cpu_setup_power.h
 delete mode 100644 arch/powerpc/kernel/cpu_setup_power.S
 create mode 100644 arch/powerpc/kernel/cpu_setup_power.c

diff --git a/arch/powerpc/include/asm/cpu_setup_power.h b/arch/powerpc/include/asm/cpu_setup_power.h
new file mode 100644
index 000000000000..24be9131f803
--- /dev/null
+++ b/arch/powerpc/include/asm/cpu_setup_power.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 IBM Corporation
+ */
+void __setup_cpu_power7(unsigned long offset, struct cpu_spec *spec);
+void __restore_cpu_power7(void);
+void __setup_cpu_power8(unsigned long offset, struct cpu_spec *spec);
+void __restore_cpu_power8(void);
+void __setup_cpu_power9(unsigned long offset, struct cpu_spec *spec);
+void __restore_cpu_power9(void);
+void __setup_cpu_power10(unsigned long offset, struct cpu_spec *spec);
+void __restore_cpu_power10(void);
diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
deleted file mode 100644
index 704e8b9501ee..000000000000
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ /dev/null
@@ -1,252 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * This file contains low level CPU setup functions.
- *    Copyright (C) 2003 Benjamin Herrenschmidt (benh@kernel.crashing.org)
- */
-
-#include <asm/processor.h>
-#include <asm/page.h>
-#include <asm/cputable.h>
-#include <asm/ppc_asm.h>
-#include <asm/asm-offsets.h>
-#include <asm/cache.h>
-#include <asm/book3s/64/mmu-hash.h>
-
-/* Entry: r3 = crap, r4 = ptr to cputable entry
- *
- * Note that we can be called twice for pseudo-PVRs
- */
-_GLOBAL(__setup_cpu_power7)
-	mflr	r11
-	bl	__init_hvmode_206
-	mtlr	r11
-	beqlr
-	li	r0,0
-	mtspr	SPRN_LPID,r0
-	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
-	mtspr	SPRN_PCR,r0
-	mfspr	r3,SPRN_LPCR
-	li	r4,(LPCR_LPES1 >> LPCR_LPES_SH)
-	bl	__init_LPCR_ISA206
-	mtlr	r11
-	blr
-
-_GLOBAL(__restore_cpu_power7)
-	mflr	r11
-	mfmsr	r3
-	rldicl.	r0,r3,4,63
-	beqlr
-	li	r0,0
-	mtspr	SPRN_LPID,r0
-	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
-	mtspr	SPRN_PCR,r0
-	mfspr	r3,SPRN_LPCR
-	li	r4,(LPCR_LPES1 >> LPCR_LPES_SH)
-	bl	__init_LPCR_ISA206
-	mtlr	r11
-	blr
-
-_GLOBAL(__setup_cpu_power8)
-	mflr	r11
-	bl	__init_FSCR
-	bl	__init_PMU
-	bl	__init_PMU_ISA207
-	bl	__init_hvmode_206
-	mtlr	r11
-	beqlr
-	li	r0,0
-	mtspr	SPRN_LPID,r0
-	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
-	mtspr	SPRN_PCR,r0
-	mfspr	r3,SPRN_LPCR
-	ori	r3, r3, LPCR_PECEDH
-	li	r4,0 /* LPES = 0 */
-	bl	__init_LPCR_ISA206
-	bl	__init_HFSCR
-	bl	__init_PMU_HV
-	bl	__init_PMU_HV_ISA207
-	mtlr	r11
-	blr
-
-_GLOBAL(__restore_cpu_power8)
-	mflr	r11
-	bl	__init_FSCR
-	bl	__init_PMU
-	bl	__init_PMU_ISA207
-	mfmsr	r3
-	rldicl.	r0,r3,4,63
-	mtlr	r11
-	beqlr
-	li	r0,0
-	mtspr	SPRN_LPID,r0
-	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
-	mtspr	SPRN_PCR,r0
-	mfspr   r3,SPRN_LPCR
-	ori	r3, r3, LPCR_PECEDH
-	li	r4,0 /* LPES = 0 */
-	bl	__init_LPCR_ISA206
-	bl	__init_HFSCR
-	bl	__init_PMU_HV
-	bl	__init_PMU_HV_ISA207
-	mtlr	r11
-	blr
-
-_GLOBAL(__setup_cpu_power10)
-	mflr	r11
-	bl	__init_FSCR_power10
-	bl	__init_PMU
-	bl	__init_PMU_ISA31
-	b	1f
-
-_GLOBAL(__setup_cpu_power9)
-	mflr	r11
-	bl	__init_FSCR_power9
-	bl	__init_PMU
-1:	bl	__init_hvmode_206
-	mtlr	r11
-	beqlr
-	li	r0,0
-	mtspr	SPRN_PSSCR,r0
-	mtspr	SPRN_LPID,r0
-	mtspr	SPRN_PID,r0
-	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
-	mtspr	SPRN_PCR,r0
-	mfspr	r3,SPRN_LPCR
-	LOAD_REG_IMMEDIATE(r4, LPCR_PECEDH | LPCR_PECE_HVEE | LPCR_HVICE  | LPCR_HEIC)
-	or	r3, r3, r4
-	LOAD_REG_IMMEDIATE(r4, LPCR_UPRT | LPCR_HR)
-	andc	r3, r3, r4
-	li	r4,0 /* LPES = 0 */
-	bl	__init_LPCR_ISA300
-	bl	__init_HFSCR
-	bl	__init_PMU_HV
-	mtlr	r11
-	blr
-
-_GLOBAL(__restore_cpu_power10)
-	mflr	r11
-	bl	__init_FSCR_power10
-	bl	__init_PMU
-	bl	__init_PMU_ISA31
-	b	1f
-
-_GLOBAL(__restore_cpu_power9)
-	mflr	r11
-	bl	__init_FSCR_power9
-	bl	__init_PMU
-1:	mfmsr	r3
-	rldicl.	r0,r3,4,63
-	mtlr	r11
-	beqlr
-	li	r0,0
-	mtspr	SPRN_PSSCR,r0
-	mtspr	SPRN_LPID,r0
-	mtspr	SPRN_PID,r0
-	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
-	mtspr	SPRN_PCR,r0
-	mfspr   r3,SPRN_LPCR
-	LOAD_REG_IMMEDIATE(r4, LPCR_PECEDH | LPCR_PECE_HVEE | LPCR_HVICE | LPCR_HEIC)
-	or	r3, r3, r4
-	LOAD_REG_IMMEDIATE(r4, LPCR_UPRT | LPCR_HR)
-	andc	r3, r3, r4
-	li	r4,0 /* LPES = 0 */
-	bl	__init_LPCR_ISA300
-	bl	__init_HFSCR
-	bl	__init_PMU_HV
-	mtlr	r11
-	blr
-
-__init_hvmode_206:
-	/* Disable CPU_FTR_HVMODE and exit if MSR:HV is not set */
-	mfmsr	r3
-	rldicl.	r0,r3,4,63
-	bnelr
-	ld	r5,CPU_SPEC_FEATURES(r4)
-	LOAD_REG_IMMEDIATE(r6,CPU_FTR_HVMODE | CPU_FTR_P9_TM_HV_ASSIST)
-	andc	r5,r5,r6
-	std	r5,CPU_SPEC_FEATURES(r4)
-	blr
-
-__init_LPCR_ISA206:
-	/* Setup a sane LPCR:
-	 *   Called with initial LPCR in R3 and desired LPES 2-bit value in R4
-	 *
-	 *   LPES = 0b01 (HSRR0/1 used for 0x500)
-	 *   PECE = 0b111
-	 *   DPFD = 4
-	 *   HDICE = 0
-	 *   VC = 0b100 (VPM0=1, VPM1=0, ISL=0)
-	 *   VRMASD = 0b10000 (L=1, LP=00)
-	 *
-	 * Other bits untouched for now
-	 */
-	li	r5,0x10
-	rldimi	r3,r5, LPCR_VRMASD_SH, 64-LPCR_VRMASD_SH-5
-
-	/* POWER9 has no VRMASD */
-__init_LPCR_ISA300:
-	rldimi	r3,r4, LPCR_LPES_SH, 64-LPCR_LPES_SH-2
-	ori	r3,r3,(LPCR_PECE0|LPCR_PECE1|LPCR_PECE2)
-	li	r5,4
-	rldimi	r3,r5, LPCR_DPFD_SH, 64-LPCR_DPFD_SH-3
-	clrrdi	r3,r3,1		/* clear HDICE */
-	li	r5,4
-	rldimi	r3,r5, LPCR_VC_SH, 0
-	mtspr	SPRN_LPCR,r3
-	isync
-	blr
-
-__init_FSCR_power10:
-	mfspr	r3, SPRN_FSCR
-	ori	r3, r3, FSCR_PREFIX
-	mtspr	SPRN_FSCR, r3
-	// fall through
-
-__init_FSCR_power9:
-	mfspr	r3, SPRN_FSCR
-	ori	r3, r3, FSCR_SCV
-	mtspr	SPRN_FSCR, r3
-	// fall through
-
-__init_FSCR:
-	mfspr	r3,SPRN_FSCR
-	ori	r3,r3,FSCR_TAR|FSCR_EBB
-	mtspr	SPRN_FSCR,r3
-	blr
-
-__init_HFSCR:
-	mfspr	r3,SPRN_HFSCR
-	ori	r3,r3,HFSCR_TAR|HFSCR_TM|HFSCR_BHRB|HFSCR_PM|\
-		      HFSCR_DSCR|HFSCR_VECVSX|HFSCR_FP|HFSCR_EBB|HFSCR_MSGP
-	mtspr	SPRN_HFSCR,r3
-	blr
-
-__init_PMU_HV:
-	li	r5,0
-	mtspr	SPRN_MMCRC,r5
-	blr
-
-__init_PMU_HV_ISA207:
-	li	r5,0
-	mtspr	SPRN_MMCRH,r5
-	blr
-
-__init_PMU:
-	li	r5,0
-	mtspr	SPRN_MMCRA,r5
-	mtspr	SPRN_MMCR0,r5
-	mtspr	SPRN_MMCR1,r5
-	mtspr	SPRN_MMCR2,r5
-	blr
-
-__init_PMU_ISA207:
-	li	r5,0
-	mtspr	SPRN_MMCRS,r5
-	blr
-
-__init_PMU_ISA31:
-	li	r5,0
-	mtspr	SPRN_MMCR3,r5
-	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
-	mtspr	SPRN_MMCRA,r5
-	blr
diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
new file mode 100644
index 000000000000..cf5201b0579d
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 IBM Corporation
+ * This file contains low level CPU setup functions.
+ * Originally written in assembly by
+ * Benjamin Herrenschmidt (benh@kernel.crashing.org)
+ */
+#include <asm/reg.h>
+#include <asm/synch.h>
+#include <linux/bitops.h>
+#include <asm/cputable.h>
+#include <asm/cpu_setup_power.h>
+
+/* Disable CPU_FTR_HVMODE and return false if MSR:HV is not set */
+static bool init_hvmode_206(struct cpu_spec *t)
+{
+	u64 msr;
+
+	msr = mfmsr();
+	if (msr & MSR_HV)
+		return true;
+
+	t->cpu_features &= ~(CPU_FTR_HVMODE | CPU_FTR_P9_TM_HV_ASSIST);
+	return false;
+}
+
+static void init_LPCR_ISA300(u64 lpcr, u64 lpes)
+{
+	/* POWER9 has no VRMASD */
+	lpcr |= (lpes << LPCR_LPES_SH) & LPCR_LPES;
+	lpcr |= LPCR_PECE0|LPCR_PECE1|LPCR_PECE2;
+	lpcr |= (4ull << LPCR_DPFD_SH) & LPCR_DPFD;
+	lpcr &= ~LPCR_HDICE;	/* clear HDICE */
+	lpcr |= (4ull << LPCR_VC_SH);
+	mtspr(SPRN_LPCR, lpcr);
+	isync();
+}
+
+/*
+ * Setup a sane LPCR:
+ *   Called with initial LPCR and desired LPES 2-bit value
+ *
+ *   LPES = 0b01 (HSRR0/1 used for 0x500)
+ *   PECE = 0b111
+ *   DPFD = 4
+ *   HDICE = 0
+ *   VC = 0b100 (VPM0=1, VPM1=0, ISL=0)
+ *   VRMASD = 0b10000 (L=1, LP=00)
+ *
+ * Other bits untouched for now
+ */
+static void init_LPCR_ISA206(u64 lpcr, u64 lpes)
+{
+	lpcr |= (0x10ull << LPCR_VRMASD_SH) & LPCR_VRMASD;
+	init_LPCR_ISA300(lpcr, lpes);
+}
+
+static void init_FSCR(void)
+{
+	u64 fscr;
+
+	fscr = mfspr(SPRN_FSCR);
+	fscr |= FSCR_TAR|FSCR_EBB;
+	mtspr(SPRN_FSCR, fscr);
+}
+
+static void init_FSCR_power9(void)
+{
+	u64 fscr;
+
+	fscr = mfspr(SPRN_FSCR);
+	fscr |= FSCR_SCV;
+	mtspr(SPRN_FSCR, fscr);
+	init_FSCR();
+}
+
+static void init_FSCR_power10(void)
+{
+	u64 fscr;
+
+	fscr = mfspr(SPRN_FSCR);
+	fscr |= FSCR_PREFIX;
+	mtspr(SPRN_FSCR, fscr);
+	init_FSCR_power9();
+}
+
+static void init_HFSCR(void)
+{
+	u64 hfscr;
+
+	hfscr = mfspr(SPRN_HFSCR);
+	hfscr |= HFSCR_TAR|HFSCR_TM|HFSCR_BHRB|HFSCR_PM|HFSCR_DSCR|\
+		 HFSCR_VECVSX|HFSCR_FP|HFSCR_EBB|HFSCR_MSGP;
+	mtspr(SPRN_HFSCR, hfscr);
+}
+
+static void init_PMU_HV(void)
+{
+	mtspr(SPRN_MMCRC, 0);
+}
+
+static void init_PMU_HV_ISA207(void)
+{
+	mtspr(SPRN_MMCRH, 0);
+}
+
+static void init_PMU(void)
+{
+	mtspr(SPRN_MMCRA, 0);
+	mtspr(SPRN_MMCR0, 0);
+	mtspr(SPRN_MMCR1, 0);
+	mtspr(SPRN_MMCR2, 0);
+}
+
+static void init_PMU_ISA207(void)
+{
+	mtspr(SPRN_MMCRS, 0);
+}
+
+static void init_PMU_ISA31(void)
+{
+	mtspr(SPRN_MMCR3, 0);
+	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
+}
+
+/*
+ * Note that we can be called twice of pseudo-PVRs.
+ * The parameter offset is not used.
+ */
+
+void __setup_cpu_power7(unsigned long offset, struct cpu_spec *t)
+{
+	if (!init_hvmode_206(t))
+		return;
+
+	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
+	init_LPCR_ISA206(mfspr(SPRN_LPCR), LPCR_LPES1 >> LPCR_LPES_SH);
+}
+
+void __restore_cpu_power7(void)
+{
+	u64 msr;
+
+	msr = mfmsr();
+	if (!(msr & MSR_HV))
+		return;
+
+	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
+	init_LPCR_ISA206(mfspr(SPRN_LPCR), LPCR_LPES1 >> LPCR_LPES_SH);
+}
+
+void __setup_cpu_power8(unsigned long offset, struct cpu_spec *t)
+{
+	init_FSCR();
+	init_PMU();
+	init_PMU_ISA207();
+
+	if (!init_hvmode_206(t))
+		return;
+
+	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
+	init_LPCR_ISA206(mfspr(SPRN_LPCR) | LPCR_PECEDH, 0); /* LPES = 0 */
+	init_HFSCR();
+	init_PMU_HV();
+	init_PMU_HV_ISA207();
+}
+
+void __restore_cpu_power8(void)
+{
+	u64 msr;
+
+	init_FSCR();
+	init_PMU();
+	init_PMU_ISA207();
+
+	msr = mfmsr();
+	if (!(msr & MSR_HV))
+		return;
+
+	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
+	init_LPCR_ISA206(mfspr(SPRN_LPCR) | LPCR_PECEDH, 0); /* LPES = 0 */
+	init_HFSCR();
+	init_PMU_HV();
+	init_PMU_HV_ISA207();
+}
+
+void __setup_cpu_power9(unsigned long offset, struct cpu_spec *t)
+{
+	init_FSCR_power9();
+	init_PMU();
+
+	if (!init_hvmode_206(t))
+		return;
+
+	mtspr(SPRN_PSSCR, 0);
+	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_PID, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
+	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
+			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
+	init_HFSCR();
+	init_PMU_HV();
+}
+
+void __restore_cpu_power9(void)
+{
+	u64 msr;
+
+	init_FSCR_power9();
+	init_PMU();
+
+	msr = mfmsr();
+	if (!(msr & MSR_HV))
+		return;
+
+	mtspr(SPRN_PSSCR, 0);
+	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_PID, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
+	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
+			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
+	init_HFSCR();
+	init_PMU_HV();
+}
+
+void __setup_cpu_power10(unsigned long offset, struct cpu_spec *t)
+{
+	init_FSCR_power10();
+	init_PMU();
+	init_PMU_ISA31();
+
+	if (!init_hvmode_206(t))
+		return;
+
+	mtspr(SPRN_PSSCR, 0);
+	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_PID, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
+	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
+			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
+	init_HFSCR();
+	init_PMU_HV();
+}
+
+void __restore_cpu_power10(void)
+{
+	u64 msr;
+
+	init_FSCR_power10();
+	init_PMU();
+	init_PMU_ISA31();
+
+	msr = mfmsr();
+	if (!(msr & MSR_HV))
+		return;
+
+	mtspr(SPRN_PSSCR, 0);
+	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_PID, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
+	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
+			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
+	init_HFSCR();
+	init_PMU_HV();
+}
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 3d406a9626e8..bce545280056 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -59,19 +59,12 @@ extern void __setup_cpu_7410(unsigned long offset, struct cpu_spec* spec);
 extern void __setup_cpu_745x(unsigned long offset, struct cpu_spec* spec);
 #endif /* CONFIG_PPC32 */
 #ifdef CONFIG_PPC64
+#include <asm/cpu_setup_power.h>
 extern void __setup_cpu_ppc970(unsigned long offset, struct cpu_spec* spec);
 extern void __setup_cpu_ppc970MP(unsigned long offset, struct cpu_spec* spec);
 extern void __setup_cpu_pa6t(unsigned long offset, struct cpu_spec* spec);
 extern void __restore_cpu_pa6t(void);
 extern void __restore_cpu_ppc970(void);
-extern void __setup_cpu_power7(unsigned long offset, struct cpu_spec* spec);
-extern void __restore_cpu_power7(void);
-extern void __setup_cpu_power8(unsigned long offset, struct cpu_spec* spec);
-extern void __restore_cpu_power8(void);
-extern void __setup_cpu_power9(unsigned long offset, struct cpu_spec* spec);
-extern void __restore_cpu_power9(void);
-extern void __setup_cpu_power10(unsigned long offset, struct cpu_spec* spec);
-extern void __restore_cpu_power10(void);
 extern long __machine_check_early_realmode_p7(struct pt_regs *regs);
 extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
 extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
-- 
2.17.1

