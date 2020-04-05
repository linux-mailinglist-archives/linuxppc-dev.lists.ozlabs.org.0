Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B815219ED23
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 19:50:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wLmX09cRzDqvY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:50:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=cpg2PhiG; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wLf421SczDqp5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 03:44:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wLdw1v3qz9ty3M;
 Sun,  5 Apr 2020 19:44:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cpg2PhiG; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IaekJmipcYYf; Sun,  5 Apr 2020 19:44:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wLdw0l9Qz9ty2y;
 Sun,  5 Apr 2020 19:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586108676; bh=F2/RVlouzPGEXiwWmPWSCHuMmTRF+zWBqELEpJbUcas=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=cpg2PhiGQgPo9UXrjpkhr/HficJpXMWctMEdHjOxwPgbY9M318g2ZRkYmeb46sooe
 EzPhduP2Mjv/S0kuYgXGW78pFUUzg6K2ubcsNOJNFG7kxa6DVJRHhYUSep5W3J/PQ8
 QxFJuAyABv7tL69F1hpsrjNVU2p3k81q6cxdf9gM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B18DF8B783;
 Sun,  5 Apr 2020 19:44:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Vc7s3mfu--yN; Sun,  5 Apr 2020 19:44:39 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D84F8B774;
 Sun,  5 Apr 2020 19:44:39 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 52B8F6571C; Sun,  5 Apr 2020 17:44:39 +0000 (UTC)
Message-Id: <be1e4e10a2f3699e2478fc736cbcdef380736859.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 04/13] powerpc/irq: Add new helpers to play with MSR_EE
 and MSR_RI on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Sun,  5 Apr 2020 17:44:39 +0000 (UTC)
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

In preparation of porting PPC32 to C syscall entry/exit,
add PPC32 version of following helpers:
	__hard_irq_enable()
	__hard_irq_disable()
	__hard_EE_RI_disable()
	__hard_RI_enable()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/hw_irq.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index e0e71777961f..6ccf07de6665 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -321,6 +321,16 @@ static inline void arch_local_irq_disable(void)
 		mtmsr(mfmsr() & ~MSR_EE);
 }
 
+static inline void arch_local_recovery_disable(void)
+{
+	if (IS_ENABLED(CONFIG_BOOKE))
+		wrtee(0);
+	else if (IS_ENABLED(CONFIG_PPC_8xx))
+		wrtspr(SPRN_NRI);
+	else
+		mtmsr(mfmsr() & ~(MSR_EE | MSR_RI));
+}
+
 static inline void arch_local_irq_enable(void)
 {
 	if (IS_ENABLED(CONFIG_BOOKE))
@@ -343,6 +353,11 @@ static inline bool arch_irqs_disabled(void)
 
 #define hard_irq_disable()		arch_local_irq_disable()
 
+#define __hard_irq_enable()		arch_local_irq_enable()
+#define __hard_irq_disable()		arch_local_irq_disable()
+#define __hard_EE_RI_disable()		arch_local_recovery_disable()
+#define __hard_RI_enable()		arch_local_irq_disable()
+
 static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
 {
 	return !(regs->msr & MSR_EE);
-- 
2.25.0

