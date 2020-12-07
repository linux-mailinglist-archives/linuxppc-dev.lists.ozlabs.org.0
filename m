Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6252D13DD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 15:37:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqQrZ4PzbzDqST
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 01:37:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqQpN0hc0zDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 01:35:36 +1100 (AEDT)
Received: from orion.localdomain ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVaQW-1kcPeP1c3Q-00RY6g; Mon, 07 Dec 2020 15:31:53 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] arch: fix 'unexpected IRQ trap at vector' warnings
Date: Mon,  7 Dec 2020 15:31:46 +0100
Message-Id: <20201207143146.30021-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:rMUe2CBEB0YZF4A68VUWmrIH1yNW//gd0c/pQGPWmyMpSA2bX4y
 jHgyHm8GpTs/tCj3iuuCtSypFZR3KU5WIP1wANT4VjPkCyeXDkgjAcw/iCjkQVNTvoUv6E4
 JrZlmcRHyCZI3p4cK57xGz5GXFXaLX/TWpGK+yDTovpnj/nUwC/S6xpXVH7lHGsSjlB2fSc
 SxqVYzYq0T9qMthuTjxCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J8L0KEQhX2Y=:qF988fCH6y7JnTbLOsOL9Y
 cDHv4VjCCTnVaS8fRofG82d8RSJyg0hCUZBXe04Vff61i58PpeCe1a25NSCXgSdLDg6l4AElV
 YnH2BwYLnVCECxT3Z51+SB6AdnfLW9f86zmwUvYDCybaHP87pVrr74FESw5Qn/tQmsFf0c5Ef
 LuxsO6sry9KpPkeE12sB+AEme9yWHuLzKSmAhyhg2M32AWym+GrEeFvppP4FQUcWAhSqEiD4D
 sy7cIo41rIkQVIC1ru4tMi8Qrj+q0078gkhR/bm8epdOJvuEf4TGOFfQJRIfOe87AmVL44MXd
 nzz10f+JCxzpaxI1ZI9FwyaheQN/VGZQlSmyt/CaUCo1PpklvPfaem7nNluAY90S0NcSjU2hF
 2x20AgR7e+j2SDxweyivFQa8+fsD3N6cn/YS3jWKoJbaz9UeBSeFqysSyIs7G
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
Cc: linux-s390@vger.kernel.org, hpa@zytor.com, linux-parisc@vger.kernel.org,
 deller@gmx.de, x86@kernel.org, linux-um@lists.infradead.org,
 James.Bottomley@HansenPartnership.com, mingo@redhat.com, paulus@samba.org,
 richard@nod.at, bp@alien8.de, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, jdike@addtoit.com,
 anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All archs, except Alpha, print out the irq number in hex, but the message
looks like it was a decimal number, which is quite confusing. Fixing this
by adding "0x" prefix.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/arm/include/asm/hw_irq.h      | 2 +-
 arch/parisc/include/asm/hardirq.h  | 2 +-
 arch/powerpc/include/asm/hardirq.h | 2 +-
 arch/s390/include/asm/hardirq.h    | 2 +-
 arch/um/include/asm/hardirq.h      | 2 +-
 arch/x86/kernel/irq.c              | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/hw_irq.h b/arch/arm/include/asm/hw_irq.h
index cecc13214ef1..2749f19271d9 100644
--- a/arch/arm/include/asm/hw_irq.h
+++ b/arch/arm/include/asm/hw_irq.h
@@ -9,7 +9,7 @@ static inline void ack_bad_irq(int irq)
 {
 	extern unsigned long irq_err_count;
 	irq_err_count++;
-	pr_crit("unexpected IRQ trap at vector %02x\n", irq);
+	pr_crit("unexpected IRQ trap at vector 0x%02x\n", irq);
 }
 
 #define ARCH_IRQ_INIT_FLAGS	(IRQ_NOREQUEST | IRQ_NOPROBE)
diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
index 7f7039516e53..c3348af88d3f 100644
--- a/arch/parisc/include/asm/hardirq.h
+++ b/arch/parisc/include/asm/hardirq.h
@@ -35,6 +35,6 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
 #define __IRQ_STAT(cpu, member) (irq_stat[cpu].member)
 #define inc_irq_stat(member)	this_cpu_inc(irq_stat.member)
 #define __inc_irq_stat(member)	__this_cpu_inc(irq_stat.member)
-#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector %02x\n", irq)
+#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector 0x%02x\n", irq)
 
 #endif /* _PARISC_HARDIRQ_H */
diff --git a/arch/powerpc/include/asm/hardirq.h b/arch/powerpc/include/asm/hardirq.h
index f133b5930ae1..ec8cf3cf6e49 100644
--- a/arch/powerpc/include/asm/hardirq.h
+++ b/arch/powerpc/include/asm/hardirq.h
@@ -29,7 +29,7 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
 
 static inline void ack_bad_irq(unsigned int irq)
 {
-	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
+	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
 }
 
 extern u64 arch_irq_stat_cpu(unsigned int cpu);
diff --git a/arch/s390/include/asm/hardirq.h b/arch/s390/include/asm/hardirq.h
index dfbc3c6c0674..aaaec5cdd4fe 100644
--- a/arch/s390/include/asm/hardirq.h
+++ b/arch/s390/include/asm/hardirq.h
@@ -23,7 +23,7 @@
 
 static inline void ack_bad_irq(unsigned int irq)
 {
-	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
+	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
 }
 
 #endif /* __ASM_HARDIRQ_H */
diff --git a/arch/um/include/asm/hardirq.h b/arch/um/include/asm/hardirq.h
index b426796d26fd..2a2e6eae034b 100644
--- a/arch/um/include/asm/hardirq.h
+++ b/arch/um/include/asm/hardirq.h
@@ -15,7 +15,7 @@ typedef struct {
 #ifndef ack_bad_irq
 static inline void ack_bad_irq(unsigned int irq)
 {
-	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
+	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
 }
 #endif
 
diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index c5dd50369e2f..957c716f2df7 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -37,7 +37,7 @@ atomic_t irq_err_count;
 void ack_bad_irq(unsigned int irq)
 {
 	if (printk_ratelimit())
-		pr_err("unexpected IRQ trap at vector %02x\n", irq);
+		pr_err("unexpected IRQ trap at vector 0x%02x\n", irq);
 
 	/*
 	 * Currently unexpected vectors happen only on SMP and APIC.
-- 
2.11.0

