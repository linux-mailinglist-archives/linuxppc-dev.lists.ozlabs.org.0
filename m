Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9C42C5592
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 14:34:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChdyX0r39zDrHG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 00:34:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChdR1187WzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:10:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=V4yghRlX; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4ChdQz6c7Wz9sVV; Fri, 27 Nov 2020 00:10:19 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4ChdQy6Z0Mz9sWR; Fri, 27 Nov 2020 00:10:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606396218;
 bh=doqAUL0YuClF5qT++Q/JIdNw+GsrvYJce28kSIwrYEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V4yghRlXUY1MPA3jnTN/4qpbtRy92sv2XLhnSuQdqlpf1gAWreZhJDHa6XO95CP4U
 EN6ZWSVS7+87nYK3mI+znfuU95nNdbzlcXVlsa96sLKpb3rNYb/Tz8/R37EEv0DJgH
 b/N18jGOJabuHGLpPur/nMyIj55UQrEi07vINO17QMvjzvU/JkPL1zxPAyFfKtIWnq
 dC8iHXHPEvc7Dwlgdk77liSPt3/ybmMnT/Z9xL6sht89QvNPPY2o2bu0hw0+tTT36S
 uHUri/ZeA04MOyEaiN5wYzqj2AY/zDyDzxYxE9cqAm/7OKhHR5inGamWn3tD6s4u3t
 p3NU//IabRGmw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v14 3/9] powerpc/time: Move timebase functions into new
 asm/vdso/timebase.h
Date: Fri, 27 Nov 2020 00:10:00 +1100
Message-Id: <20201126131006.2431205-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126131006.2431205-1-mpe@ellerman.id.au>
References: <20201126131006.2431205-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

In order to easily use get_tb() from C VDSO, move timebase
functions into a new header named asm/vdso/timebase.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[mpe: Move into asm/vdso, drop dubious historical authorship comments,
      move mftb() etc. also]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/2d03f4b466156c0a0bfe5494c8874dcac952445c.1604426550.git.christophe.leroy@csgroup.eu
---
 arch/powerpc/include/asm/reg.h           | 31 -----------
 arch/powerpc/include/asm/time.h          | 30 +---------
 arch/powerpc/include/asm/timex.h         |  2 +-
 arch/powerpc/include/asm/vdso/timebase.h | 71 ++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 61 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vdso/timebase.h

v14: mpe: Move into asm/vdso, drop dubious historical authorship comments, move mftb() etc. also.

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index f877a576b338..602236e223c4 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1419,37 +1419,6 @@ static inline void msr_check_and_clear(unsigned long bits)
 		__msr_check_and_clear(bits);
 }
 
-#if defined(CONFIG_PPC_CELL) || defined(CONFIG_E500)
-#define mftb()		({unsigned long rval;				\
-			asm volatile(					\
-				"90:	mfspr %0, %2;\n"		\
-				ASM_FTR_IFSET(				\
-					"97:	cmpwi %0,0;\n"		\
-					"	beq- 90b;\n", "", %1)	\
-			: "=r" (rval) \
-			: "i" (CPU_FTR_CELL_TB_BUG), "i" (SPRN_TBRL) : "cr0"); \
-			rval;})
-#elif defined(CONFIG_PPC_8xx)
-#define mftb()		({unsigned long rval;	\
-			asm volatile("mftbl %0" : "=r" (rval)); rval;})
-#else
-#define mftb()		({unsigned long rval;	\
-			asm volatile("mfspr %0, %1" : \
-				     "=r" (rval) : "i" (SPRN_TBRL)); rval;})
-#endif /* !CONFIG_PPC_CELL */
-
-#if defined(CONFIG_PPC_8xx)
-#define mftbu()		({unsigned long rval;	\
-			asm volatile("mftbu %0" : "=r" (rval)); rval;})
-#else
-#define mftbu()		({unsigned long rval;	\
-			asm volatile("mfspr %0, %1" : "=r" (rval) : \
-				"i" (SPRN_TBRU)); rval;})
-#endif
-
-#define mttbl(v)	asm volatile("mttbl %0":: "r"(v))
-#define mttbu(v)	asm volatile("mttbu %0":: "r"(v))
-
 #ifdef CONFIG_PPC32
 #define mfsrin(v)	({unsigned int rval; \
 			asm volatile("mfsrin %0,%1" : "=r" (rval) : "r" (v)); \
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 2f566c1a754c..a59f8030f020 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -15,6 +15,7 @@
 
 #include <asm/processor.h>
 #include <asm/cpu_has_feature.h>
+#include <asm/vdso/timebase.h>
 
 /* time.c */
 extern unsigned long tb_ticks_per_jiffy;
@@ -38,12 +39,6 @@ struct div_result {
 	u64 result_low;
 };
 
-/* For compatibility, get_tbl() is defined as get_tb() on ppc64 */
-static inline unsigned long get_tbl(void)
-{
-	return mftb();
-}
-
 static inline u64 get_vtb(void)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -53,29 +48,6 @@ static inline u64 get_vtb(void)
 	return 0;
 }
 
-static inline u64 get_tb(void)
-{
-	unsigned int tbhi, tblo, tbhi2;
-
-	if (IS_ENABLED(CONFIG_PPC64))
-		return mftb();
-
-	do {
-		tbhi = mftbu();
-		tblo = mftb();
-		tbhi2 = mftbu();
-	} while (tbhi != tbhi2);
-
-	return ((u64)tbhi << 32) | tblo;
-}
-
-static inline void set_tb(unsigned int upper, unsigned int lower)
-{
-	mtspr(SPRN_TBWL, 0);
-	mtspr(SPRN_TBWU, upper);
-	mtspr(SPRN_TBWL, lower);
-}
-
 /* Accessor functions for the decrementer register.
  * The 4xx doesn't even have a decrementer.  I tried to use the
  * generic timer interrupt code, which seems OK, with the 4xx PIT
diff --git a/arch/powerpc/include/asm/timex.h b/arch/powerpc/include/asm/timex.h
index 95988870a57b..fa2e76e4093a 100644
--- a/arch/powerpc/include/asm/timex.h
+++ b/arch/powerpc/include/asm/timex.h
@@ -9,7 +9,7 @@
  */
 
 #include <asm/cputable.h>
-#include <asm/reg.h>
+#include <asm/vdso/timebase.h>
 
 #define CLOCK_TICK_RATE	1024000 /* Underlying HZ */
 
diff --git a/arch/powerpc/include/asm/vdso/timebase.h b/arch/powerpc/include/asm/vdso/timebase.h
new file mode 100644
index 000000000000..ac6769b348c6
--- /dev/null
+++ b/arch/powerpc/include/asm/vdso/timebase.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Common timebase prototypes and such for all ppc machines.
+ */
+
+#ifndef _ASM_POWERPC_VDSO_TIMEBASE_H
+#define _ASM_POWERPC_VDSO_TIMEBASE_H
+
+#include <asm/reg.h>
+
+#if defined(CONFIG_PPC_CELL) || defined(CONFIG_E500)
+#define mftb()		({unsigned long rval;				\
+			asm volatile(					\
+				"90:	mfspr %0, %2;\n"		\
+				ASM_FTR_IFSET(				\
+					"97:	cmpwi %0,0;\n"		\
+					"	beq- 90b;\n", "", %1)	\
+			: "=r" (rval) \
+			: "i" (CPU_FTR_CELL_TB_BUG), "i" (SPRN_TBRL) : "cr0"); \
+			rval;})
+#elif defined(CONFIG_PPC_8xx)
+#define mftb()		({unsigned long rval;	\
+			asm volatile("mftbl %0" : "=r" (rval)); rval;})
+#else
+#define mftb()		({unsigned long rval;	\
+			asm volatile("mfspr %0, %1" : \
+				     "=r" (rval) : "i" (SPRN_TBRL)); rval;})
+#endif /* !CONFIG_PPC_CELL */
+
+#if defined(CONFIG_PPC_8xx)
+#define mftbu()		({unsigned long rval;	\
+			asm volatile("mftbu %0" : "=r" (rval)); rval;})
+#else
+#define mftbu()		({unsigned long rval;	\
+			asm volatile("mfspr %0, %1" : "=r" (rval) : \
+				"i" (SPRN_TBRU)); rval;})
+#endif
+
+#define mttbl(v)	asm volatile("mttbl %0":: "r"(v))
+#define mttbu(v)	asm volatile("mttbu %0":: "r"(v))
+
+/* For compatibility, get_tbl() is defined as get_tb() on ppc64 */
+static inline unsigned long get_tbl(void)
+{
+	return mftb();
+}
+
+static inline u64 get_tb(void)
+{
+	unsigned int tbhi, tblo, tbhi2;
+
+	if (IS_ENABLED(CONFIG_PPC64))
+		return mftb();
+
+	do {
+		tbhi = mftbu();
+		tblo = mftb();
+		tbhi2 = mftbu();
+	} while (tbhi != tbhi2);
+
+	return ((u64)tbhi << 32) | tblo;
+}
+
+static inline void set_tb(unsigned int upper, unsigned int lower)
+{
+	mtspr(SPRN_TBWL, 0);
+	mtspr(SPRN_TBWU, upper);
+	mtspr(SPRN_TBWL, lower);
+}
+
+#endif /* _ASM_POWERPC_VDSO_TIMEBASE_H */
-- 
2.25.1

