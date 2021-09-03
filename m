Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7903FFEE0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 13:21:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1FjF6xZ1z3cXV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 21:21:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1Fft3MWcz2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 21:19:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H1FfT5B4fz9sTt;
 Fri,  3 Sep 2021 13:18:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FuMy-xG9P-QH; Fri,  3 Sep 2021 13:18:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H1FfS4GTvz9sTN;
 Fri,  3 Sep 2021 13:18:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DBF08B8E3;
 Fri,  3 Sep 2021 13:18:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id i5Sf6cF5lbMz; Fri,  3 Sep 2021 13:18:40 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F9AC8B764;
 Fri,  3 Sep 2021 13:18:40 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 205DB63D74; Fri,  3 Sep 2021 11:18:40 +0000 (UTC)
Message-Id: <7dd5ead4bbca749e2da089ff6fe2b1878d6bf40e.1630667612.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1630667612.git.christophe.leroy@csgroup.eu>
References: <cover.1630667612.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 05/11] powerpc/machdep: Move sys_ctrler_t definition
 into pmac.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  3 Sep 2021 11:18:40 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sys_ctrler_t definitions are tied to pmac. Move it in pmac.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/machdep.h     | 15 ---------------
 arch/powerpc/platforms/powermac/pmac.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index a50aed6170c3..9f31281095ab 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -230,21 +230,6 @@ extern struct machdep_calls *machine_id;
 		machine_id == &mach_##name; \
 	})
 
-#ifdef CONFIG_PPC_PMAC
-/*
- * Power macintoshes have either a CUDA, PMU or SMU controlling
- * system reset, power, NVRAM, RTC.
- */
-typedef enum sys_ctrler_kind {
-	SYS_CTRLER_UNKNOWN = 0,
-	SYS_CTRLER_CUDA = 1,
-	SYS_CTRLER_PMU = 2,
-	SYS_CTRLER_SMU = 3,
-} sys_ctrler_t;
-extern sys_ctrler_t sys_ctrler;
-
-#endif /* CONFIG_PPC_PMAC */
-
 static inline void log_error(char *buf, unsigned int err_type, int fatal)
 {
 	if (ppc_md.log_error)
diff --git a/arch/powerpc/platforms/powermac/pmac.h b/arch/powerpc/platforms/powermac/pmac.h
index 0d715db434dc..34496e078e0f 100644
--- a/arch/powerpc/platforms/powermac/pmac.h
+++ b/arch/powerpc/platforms/powermac/pmac.h
@@ -5,6 +5,18 @@
 #include <linux/pci.h>
 #include <linux/irq.h>
 
+/*
+ * Power macintoshes have either a CUDA, PMU or SMU controlling
+ * system reset, power, NVRAM, RTC.
+ */
+typedef enum sys_ctrler_kind {
+	SYS_CTRLER_UNKNOWN = 0,
+	SYS_CTRLER_CUDA = 1,
+	SYS_CTRLER_PMU = 2,
+	SYS_CTRLER_SMU = 3,
+} sys_ctrler_t;
+extern sys_ctrler_t sys_ctrler;
+
 /*
  * Declaration for the various functions exported by the
  * pmac_* files. Mostly for use by pmac_setup
-- 
2.25.0

