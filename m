Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B86B346145E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 12:54:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2kL6563Jz3dhg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 22:54:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2kJX5KbZz3cNl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 22:53:32 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J2kJG5ss5z9sSg;
 Mon, 29 Nov 2021 12:53:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsbwTVZeERKv; Mon, 29 Nov 2021 12:53:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J2kJC4Bxwz9sSp;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 73B168B76E;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BSSDdMJ9oaCh; Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 420B68B773;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1ATBr7ch895125
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 12:53:07 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1ATBr7oe895124;
 Mon, 29 Nov 2021 12:53:07 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 4/5] powerpc/inst: Move ppc_inst_t definition in asm/reg.h
Date: Mon, 29 Nov 2021 12:53:04 +0100
Message-Id: <7a63cb77d8ed7345e26ea8fab8e2472987632de5.1638186774.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
References: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638186784; l=2950; s=20211009;
 h=from:subject:message-id; bh=VeNpC9573DBixjDlhWnJfkPoHg5Bhm31V19nTt1yVaU=;
 b=cZo6XRKHJI1oSNLHx+dYFrrgShHedhCnz9TSy/rg12SDJoooAuCT5ynIMrK0xGWVPRZHQSDj8jHG
 uZyt/iP8CjDT34fRmMxyISA38TPNACwAa7YgdnCcU7IdTLUu7xGM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Because of circular inclusion of asm/hw_breakpoint.h, we
need to move definition of asm/reg.h outside of inst.h
so that asm/hw_breakpoint.h gets it without including
asm/inst.h

Also remove asm/inst.h from asm/uprobes.h as it's not
needed anymore.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: New to support inlining of copy_inst_from_kernel_nofault() in following patch.
---
 arch/powerpc/include/asm/hw_breakpoint.h |  1 -
 arch/powerpc/include/asm/inst.h          | 10 +---------
 arch/powerpc/include/asm/reg.h           | 12 ++++++++++++
 arch/powerpc/include/asm/uprobes.h       |  1 -
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 88053d3c68e6..84d39fd42f71 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -10,7 +10,6 @@
 #define _PPC_BOOK3S_64_HW_BREAKPOINT_H
 
 #include <asm/cpu_has_feature.h>
-#include <asm/inst.h>
 
 #ifdef	__KERNEL__
 struct arch_hw_breakpoint {
diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 5c503816ebc0..86074e83d2a5 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -3,6 +3,7 @@
 #define _ASM_POWERPC_INST_H
 
 #include <asm/ppc-opcode.h>
+#include <asm/reg.h>
 
 #define ___get_user_instr(gu_op, dest, ptr)				\
 ({									\
@@ -35,13 +36,6 @@
  */
 
 #if defined(CONFIG_PPC64) || defined(__CHECKER__)
-typedef struct {
-	u32 val;
-#ifdef CONFIG_PPC64
-	u32 suffix;
-#endif
-} __packed ppc_inst_t;
-
 static inline u32 ppc_inst_val(ppc_inst_t x)
 {
 	return x.val;
@@ -50,8 +44,6 @@ static inline u32 ppc_inst_val(ppc_inst_t x)
 #define ppc_inst(x) ((ppc_inst_t){ .val = (x) })
 
 #else
-typedef u32 ppc_inst_t;
-
 static inline u32 ppc_inst_val(ppc_inst_t x)
 {
 	return x;
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index e9d27265253b..85501181f929 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1366,6 +1366,18 @@
 
 /* Macros for setting and retrieving special purpose registers */
 #ifndef __ASSEMBLY__
+
+#if defined(CONFIG_PPC64) || defined(__CHECKER__)
+typedef struct {
+	u32 val;
+#ifdef CONFIG_PPC64
+	u32 suffix;
+#endif
+} __packed ppc_inst_t;
+#else
+typedef u32 ppc_inst_t;
+#endif
+
 #define mfmsr()		({unsigned long rval; \
 			asm volatile("mfmsr %0" : "=r" (rval) : \
 						: "memory"); rval;})
diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
index fe683371336f..a7ae1860115a 100644
--- a/arch/powerpc/include/asm/uprobes.h
+++ b/arch/powerpc/include/asm/uprobes.h
@@ -11,7 +11,6 @@
 
 #include <linux/notifier.h>
 #include <asm/probes.h>
-#include <asm/inst.h>
 
 typedef ppc_opcode_t uprobe_opcode_t;
 
-- 
2.33.1

