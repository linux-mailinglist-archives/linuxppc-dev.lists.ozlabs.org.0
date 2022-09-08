Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E995B24F4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 19:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNmdL1qqwz3dpQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 03:41:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNmZQ36WQz3cDF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 03:38:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNmYp1Ssqz9smH;
	Thu,  8 Sep 2022 19:38:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFePVLDIjnPw; Thu,  8 Sep 2022 19:38:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNmYg07NFz9sm5;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA55D8B799;
	Thu,  8 Sep 2022 19:38:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id RwX3Cd3X7xrM; Thu,  8 Sep 2022 19:38:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B9CC18B796;
	Thu,  8 Sep 2022 19:38:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 288HcAnL3449153
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Sep 2022 19:38:10 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 288HcAUW3449152;
	Thu, 8 Sep 2022 19:38:10 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 05/19] powerpc/cputable: Move __cpu_setup() prototypes out of cputable.h
Date: Thu,  8 Sep 2022 19:37:38 +0200
Message-Id: <10d384156f9ce7c5d146700ce3ad43e8a353e504.1662658653.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
References: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662658667; l=7788; s=20211009; h=from:subject:message-id; bh=sVD1UbssGC3ZWyGiihC1NO31adaAXqH5RcLy0K+cuQU=; b=rFDP0VbuLVlKDkDKBn97+Z4a+2Xltz2dZ8C6Iz07U69ab9LEPXuA1/sVO4BhJwQZ+Kq4qROSnsJY ZdzTbzUxCW4gjohvLBCDB66tCXPNH5W1qFrAl486DhvG+D8LOT04
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move all prototypes out of cputable.h

For that rename cpu_setup_power.h to cpu_setup.h and move all
prototypes in it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cpu_setup.h       | 49 ++++++++++++++++++++++
 arch/powerpc/include/asm/cpu_setup_power.h | 12 ------
 arch/powerpc/kernel/cpu_setup_power.c      |  2 +-
 arch/powerpc/kernel/cputable.c             | 38 +----------------
 4 files changed, 51 insertions(+), 50 deletions(-)
 create mode 100644 arch/powerpc/include/asm/cpu_setup.h
 delete mode 100644 arch/powerpc/include/asm/cpu_setup_power.h

diff --git a/arch/powerpc/include/asm/cpu_setup.h b/arch/powerpc/include/asm/cpu_setup.h
new file mode 100644
index 000000000000..d497b051598f
--- /dev/null
+++ b/arch/powerpc/include/asm/cpu_setup.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 IBM Corporation
+ */
+
+#ifndef _ASM_POWERPC_CPU_SETUP_H
+#define _ASM_POWERPC_CPU_SETUP_H
+void __setup_cpu_power7(unsigned long offset, struct cpu_spec *spec);
+void __setup_cpu_power8(unsigned long offset, struct cpu_spec *spec);
+void __setup_cpu_power9(unsigned long offset, struct cpu_spec *spec);
+void __setup_cpu_power10(unsigned long offset, struct cpu_spec *spec);
+void __restore_cpu_power7(void);
+void __restore_cpu_power8(void);
+void __restore_cpu_power9(void);
+void __restore_cpu_power10(void);
+
+void __setup_cpu_e500v1(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_e500v2(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_e500mc(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_440ep(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_440epx(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_440gx(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_440grx(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_440spe(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_440x5(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_460ex(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_460gt(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_460sx(unsigned long offset, struct cpu_spec *spec);
+void __setup_cpu_apm821xx(unsigned long offset, struct cpu_spec *spec);
+void __setup_cpu_603(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_604(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_750(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_750cx(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_750fx(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_7400(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_7410(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_745x(unsigned long offset, struct cpu_spec* spec);
+
+void __setup_cpu_ppc970(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_ppc970MP(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_pa6t(unsigned long offset, struct cpu_spec* spec);
+void __restore_cpu_pa6t(void);
+void __restore_cpu_ppc970(void);
+
+void __setup_cpu_e5500(unsigned long offset, struct cpu_spec* spec);
+void __setup_cpu_e6500(unsigned long offset, struct cpu_spec* spec);
+void __restore_cpu_e5500(void);
+void __restore_cpu_e6500(void);
+#endif /* _ASM_POWERPC_CPU_SETUP_H */
diff --git a/arch/powerpc/include/asm/cpu_setup_power.h b/arch/powerpc/include/asm/cpu_setup_power.h
deleted file mode 100644
index 24be9131f803..000000000000
--- a/arch/powerpc/include/asm/cpu_setup_power.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2020 IBM Corporation
- */
-void __setup_cpu_power7(unsigned long offset, struct cpu_spec *spec);
-void __restore_cpu_power7(void);
-void __setup_cpu_power8(unsigned long offset, struct cpu_spec *spec);
-void __restore_cpu_power8(void);
-void __setup_cpu_power9(unsigned long offset, struct cpu_spec *spec);
-void __restore_cpu_power9(void);
-void __setup_cpu_power10(unsigned long offset, struct cpu_spec *spec);
-void __restore_cpu_power10(void);
diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
index 3dc61e203f37..097c033668f0 100644
--- a/arch/powerpc/kernel/cpu_setup_power.c
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -11,7 +11,7 @@
 #include <asm/synch.h>
 #include <linux/bitops.h>
 #include <asm/cputable.h>
-#include <asm/cpu_setup_power.h>
+#include <asm/cpu_setup.h>
 
 /* Disable CPU_FTR_HVMODE and return false if MSR:HV is not set */
 static bool init_hvmode_206(struct cpu_spec *t)
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 5ace97cccad8..9229e0930332 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -18,6 +18,7 @@
 #include <asm/mce.h>
 #include <asm/mmu.h>
 #include <asm/setup.h>
+#include <asm/cpu_setup.h>
 
 static struct cpu_spec the_cpu_spec __read_mostly;
 
@@ -34,43 +35,6 @@ const char *powerpc_base_platform;
  * part of the cputable though. That has to be fixed for both ppc32
  * and ppc64
  */
-#ifdef CONFIG_PPC32
-extern void __setup_cpu_e500v1(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_e500v2(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_e500mc(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_440ep(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_440epx(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_440gx(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_440grx(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_440spe(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_440x5(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_460ex(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_460gt(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_460sx(unsigned long offset, struct cpu_spec *spec);
-extern void __setup_cpu_apm821xx(unsigned long offset, struct cpu_spec *spec);
-extern void __setup_cpu_603(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_604(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_750(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_750cx(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_750fx(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_7400(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_7410(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_745x(unsigned long offset, struct cpu_spec* spec);
-#endif /* CONFIG_PPC32 */
-#ifdef CONFIG_PPC64
-#include <asm/cpu_setup_power.h>
-extern void __setup_cpu_ppc970(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_ppc970MP(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_pa6t(unsigned long offset, struct cpu_spec* spec);
-extern void __restore_cpu_pa6t(void);
-extern void __restore_cpu_ppc970(void);
-#endif /* CONFIG_PPC64 */
-#if defined(CONFIG_E500)
-extern void __setup_cpu_e5500(unsigned long offset, struct cpu_spec* spec);
-extern void __setup_cpu_e6500(unsigned long offset, struct cpu_spec* spec);
-extern void __restore_cpu_e5500(void);
-extern void __restore_cpu_e6500(void);
-#endif /* CONFIG_E500 */
 
 /* This table only contains "desktop" CPUs, it need to be filled with embedded
  * ones as well...
-- 
2.37.1

