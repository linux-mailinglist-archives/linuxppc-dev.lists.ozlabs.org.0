Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D99E235
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 10:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HhZY0nX2zDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 18:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jvkbNv9j"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HhT75SdwzDqG8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 18:13:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HhT06QfmzB09Zv;
 Tue, 27 Aug 2019 10:13:08 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jvkbNv9j; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7eBVHiy23uDi; Tue, 27 Aug 2019 10:13:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HhT053zkzB09Zn;
 Tue, 27 Aug 2019 10:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566893588; bh=yekcWG/d0H4aoizUdD+G2UyFFVKONjNMIvJn30XRWwU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=jvkbNv9jN3Ov0/K9ifNJDh8Zpw0XKxesk5hWFsH7qYmmjxmeNZsgT6TRW8+9z3IXI
 n2uHEZ4mZW8KatCHUT601Dj3H+Te/qoJvZ8W2Nk77TKwxDo3qhEly8f0RE6aLYsyDR
 UXha5+UwGWkzEOLpHQDOlMLL90xYjniDirT0AH64=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD2088B7F6;
 Tue, 27 Aug 2019 10:13:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DhOBYalMqP8m; Tue, 27 Aug 2019 10:13:09 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FEA88B74C;
 Tue, 27 Aug 2019 10:13:09 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EC1CD696D8; Tue, 27 Aug 2019 08:13:08 +0000 (UTC)
Message-Id: <81f39fa06ae582f4a783d26abd2b310204eba8f4.1566893505.git.christophe.leroy@c-s.fr>
In-Reply-To: <0f7e164afb5d1b022441559fe5a999bb6d3c0a23.1566893505.git.christophe.leroy@c-s.fr>
References: <0f7e164afb5d1b022441559fe5a999bb6d3c0a23.1566893505.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] powerpc: cleanup hw_irq.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 27 Aug 2019 08:13:08 +0000 (UTC)
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

SET_MSR_EE() is just use in this file and doesn't provide
any added value compared to mtmsr(). Drop it.

Add macros to use wrtee/wrteei insn.

Replace #ifdefs by IS_ENABLED()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/hw_irq.h | 57 ++++++++++++++++++---------------------
 arch/powerpc/include/asm/reg.h    |  2 ++
 2 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 32a18f2f49bc..c25d57f25a8b 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -226,8 +226,8 @@ static inline bool arch_irqs_disabled(void)
 #endif /* CONFIG_PPC_BOOK3S */
 
 #ifdef CONFIG_PPC_BOOK3E
-#define __hard_irq_enable()	asm volatile("wrteei 1" : : : "memory")
-#define __hard_irq_disable()	asm volatile("wrteei 0" : : : "memory")
+#define __hard_irq_enable()	wrteei(1)
+#define __hard_irq_disable()	wrteei(0)
 #else
 #define __hard_irq_enable()	__mtmsrd(MSR_EE|MSR_RI, 1)
 #define __hard_irq_disable()	__mtmsrd(MSR_RI, 1)
@@ -280,8 +280,6 @@ extern void force_external_irq_replay(void);
 
 #else /* CONFIG_PPC64 */
 
-#define SET_MSR_EE(x)	mtmsr(x)
-
 static inline unsigned long arch_local_save_flags(void)
 {
 	return mfmsr();
@@ -289,47 +287,44 @@ static inline unsigned long arch_local_save_flags(void)
 
 static inline void arch_local_irq_restore(unsigned long flags)
 {
-#if defined(CONFIG_BOOKE)
-	asm volatile("wrtee %0" : : "r" (flags) : "memory");
-#else
-	mtmsr(flags);
-#endif
+	if (IS_ENABLED(CONFIG_BOOKE))
+		wrtee(flags);
+	else
+		mtmsr(flags);
 }
 
 static inline unsigned long arch_local_irq_save(void)
 {
 	unsigned long flags = arch_local_save_flags();
-#ifdef CONFIG_BOOKE
-	asm volatile("wrteei 0" : : : "memory");
-#elif defined(CONFIG_PPC_8xx)
-	wrtspr(SPRN_EID);
-#else
-	SET_MSR_EE(flags & ~MSR_EE);
-#endif
+
+	if (IS_ENABLED(CONFIG_BOOKE))
+		wrteei(0);
+	else if (IS_ENABLED(CONFIG_PPC_8xx))
+		wrtspr(SPRN_EID);
+	else
+		mtmsr(flags & ~MSR_EE);
+
 	return flags;
 }
 
 static inline void arch_local_irq_disable(void)
 {
-#ifdef CONFIG_BOOKE
-	asm volatile("wrteei 0" : : : "memory");
-#elif defined(CONFIG_PPC_8xx)
-	wrtspr(SPRN_EID);
-#else
-	arch_local_irq_save();
-#endif
+	if (IS_ENABLED(CONFIG_BOOKE))
+		wrteei(0);
+	else if (IS_ENABLED(CONFIG_PPC_8xx))
+		wrtspr(SPRN_EID);
+	else
+		mtmsr(mfmsr() & ~MSR_EE);
 }
 
 static inline void arch_local_irq_enable(void)
 {
-#ifdef CONFIG_BOOKE
-	asm volatile("wrteei 1" : : : "memory");
-#elif defined(CONFIG_PPC_8xx)
-	wrtspr(SPRN_EIE);
-#else
-	unsigned long msr = mfmsr();
-	SET_MSR_EE(msr | MSR_EE);
-#endif
+	if (IS_ENABLED(CONFIG_BOOKE))
+		wrteei(1);
+	else if (IS_ENABLED(CONFIG_PPC_8xx))
+		wrtspr(SPRN_EIE);
+	else
+		mtmsr(mfmsr() | MSR_EE);
 }
 
 static inline bool arch_irqs_disabled_flags(unsigned long flags)
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index b17ee25df226..04896dd09455 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1361,6 +1361,8 @@ static inline void mtmsr_isync(unsigned long val)
 #endif
 #define wrtspr(rn)	asm volatile("mtspr " __stringify(rn) ",0" : \
 				     : : "memory")
+#define wrtee(val)	asm volatile("wrtee %0" : : "r" (val) : "memory")
+#define wrteei(val)	asm volatile("wrteei %0" : : "i" (val) : "memory")
 
 extern unsigned long msr_check_and_set(unsigned long bits);
 extern bool strict_msr_control;
-- 
2.13.3

