Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 529AB311D00
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 12:55:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXrLq22LlzDwmF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 22:54:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXrBK4gdKzDqP6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 22:47:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DXrB62Rsjz9v3fM;
 Sat,  6 Feb 2021 12:47:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AswnOSoe00OL; Sat,  6 Feb 2021 12:47:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DXrB56nPYz9v3fL;
 Sat,  6 Feb 2021 12:47:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 16A5B8B784;
 Sat,  6 Feb 2021 12:47:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RE2WZVve7Alt; Sat,  6 Feb 2021 12:47:27 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D5A0A8B766;
 Sat,  6 Feb 2021 12:47:26 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9AF1C672EC; Sat,  6 Feb 2021 11:47:26 +0000 (UTC)
Message-Id: <72c7b9879e2e2e6f5c27dadda6486386c2b50f23.1612612022.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/3] powerpc/32s: Change mfsrin() into a static inline function
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat,  6 Feb 2021 11:47:26 +0000 (UTC)
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

mfsrin() is a macro.

Change in into an inline function to avoid conflicts in KVM
and make it more evolutive.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/reg.h    | 11 ++++++++---
 arch/powerpc/kvm/book3s_emulate.c |  4 ----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index d05dca30604d..f0fb03c9f289 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1414,9 +1414,14 @@ static inline void msr_check_and_clear(unsigned long bits)
 }
 
 #ifdef CONFIG_PPC32
-#define mfsrin(v)	({unsigned int rval; \
-			asm volatile("mfsrin %0,%1" : "=r" (rval) : "r" (v)); \
-					rval;})
+static inline u32 mfsrin(u32 idx)
+{
+	u32 val;
+
+	asm volatile("mfsrin %0, %1" : "=r" (val): "r" (idx));
+
+	return val;
+}
 
 static inline void mtsrin(u32 val, u32 idx)
 {
diff --git a/arch/powerpc/kvm/book3s_emulate.c b/arch/powerpc/kvm/book3s_emulate.c
index b08cc15f31c7..fdb57be71aa6 100644
--- a/arch/powerpc/kvm/book3s_emulate.c
+++ b/arch/powerpc/kvm/book3s_emulate.c
@@ -61,10 +61,6 @@
 #define SPRN_GQR6		918
 #define SPRN_GQR7		919
 
-/* Book3S_32 defines mfsrin(v) - but that messes up our abstract
- * function pointers, so let's just disable the define. */
-#undef mfsrin
-
 enum priv_level {
 	PRIV_PROBLEM = 0,
 	PRIV_SUPER = 1,
-- 
2.25.0

