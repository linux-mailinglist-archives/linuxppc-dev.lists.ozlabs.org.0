Return-Path: <linuxppc-dev+bounces-13004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2803BE873F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 13:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp36B1CLwz3chJ;
	Fri, 17 Oct 2025 22:50:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760701810;
	cv=none; b=gTi7tAUPSXrpSSOZ9P0DgD+e7ZPZO2nRYwd1Bp6dhlnQmrs41OZW97UU5pkkimc4Rqp0EHURf0a/XTOrfcqrAeqZnBPXovxaINtp/ZZx8N2kHoTr6nCFU8atueWAaJsqjpaQg19CWMsInrj3rxOWa/m+f8CQv2zavoJR5Gjl+AOYBUEsEkbYCEIAcfa8FU8fAL7fVpZAaBpxwRiDPMeT/owBSIwOb00bFZ8mWDv9BePPlE9QHYZ8iHq4/kd1ZuHmT41MnJQuOtb41l365EfEissapz5wVqoBFzUh/2Ftj3I1z9FtEL/QcI0+gQX6WVSpD9RIChozdehOFzKwr14AnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760701810; c=relaxed/relaxed;
	bh=+pDOafSUkhdSsJ1BAQNGiLr6EaDHlFORAUCSViqv5SM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohwuQT75ugo1l7/8MmfJunPg96P+WVNj0Xbgoy1nXuUV73k4bszOarTWWwSpmmcYQ1TnrIkOEjcqxwnhir1eF/iuYSKMJFl0ppY+7By5uBTVm9Dj4MrqpbKPttgz089p/eL1aEiqyFngzFHYoxzAVyfUNaPJyFNyi1v1v5OIQn+I9+je/KmXyxSxyJeDq5TD6FEa2Au+goveYR1l4EqZbjZyQELmOBgdGswbrBH2ye3zUvuTKImPkOa4zPzcSjj3PQ2gX+UMpyKDQWPmdRdu45HQexmyJnsHYXHoAR4S9UwcXRyr/JUBowUaOmcJOlrtv157X13RKdC+9GmNru5nWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp3693ng3z3cgk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 22:50:09 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cp17x1RJQz9sSq;
	Fri, 17 Oct 2025 12:21:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnSLQg-DIa5r; Fri, 17 Oct 2025 12:21:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cp17x0RxVz9sSp;
	Fri, 17 Oct 2025 12:21:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EE2B88B786;
	Fri, 17 Oct 2025 12:21:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8c1X3xpv_Dtf; Fri, 17 Oct 2025 12:21:32 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BD4418B776;
	Fri, 17 Oct 2025 12:21:31 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/10] powerpc/32s: Fix segments setup when TASK_SIZE is not a multiple of 256M
Date: Fri, 17 Oct 2025 12:21:04 +0200
Message-ID: <43ca51e6005cd102389ad18f362d0f552210ad0a.1760529207.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1760529207.git.christophe.leroy@csgroup.eu>
References: <cover.1760529207.git.christophe.leroy@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4823; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=zuDbabfiUqTOLj4mSt5xh9aoc6FtrRisXd/DqchyYms=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR8kpgS03Bzr9E8uZs8H98yXhHmyl+8sOp5Wg9H/u7LU ps/bn4Z3lHKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAm4nyfkeEg3+k7NcHvHU87 ff/3ddH9+fmZ2kvq1svyrUmw//xB76Yyw/+ADwVlrxVVDA8lmD09uPTmxx09IpoeXJlv8nbqhHP ksbADAA==
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For book3s/32 it is assumed that TASK_SIZE is a multiple of 256 Mbytes,
but Kconfig allows any value for TASK_SIZE.

In all relevant calculations, align TASK_SIZE to the upper 256 Mbytes
boundary.

Also use ASM_CONST() in the definition of TASK_SIZE to ensure it is
seen as an unsigned constant.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/mmu-hash.h | 5 ++++-
 arch/powerpc/include/asm/task_size_32.h       | 2 +-
 arch/powerpc/kernel/asm-offsets.c             | 2 +-
 arch/powerpc/kernel/head_book3s_32.S          | 6 +++---
 arch/powerpc/mm/book3s32/mmu.c                | 2 +-
 arch/powerpc/mm/ptdump/segment_regs.c         | 2 +-
 6 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index 8435bf3cdabfa..387d370c8a358 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -192,12 +192,15 @@ extern s32 patch__hash_page_B, patch__hash_page_C;
 extern s32 patch__flush_hash_A0, patch__flush_hash_A1, patch__flush_hash_A2;
 extern s32 patch__flush_hash_B;
 
+#include <linux/sizes.h>
+#include <linux/align.h>
+
 #include <asm/reg.h>
 #include <asm/task_size_32.h>
 
 static __always_inline void update_user_segment(u32 n, u32 val)
 {
-	if (n << 28 < TASK_SIZE)
+	if (n << 28 < ALIGN(TASK_SIZE, SZ_256M))
 		mtsr(val + n * 0x111, n << 28);
 }
 
diff --git a/arch/powerpc/include/asm/task_size_32.h b/arch/powerpc/include/asm/task_size_32.h
index de7290ee770fb..30edc21f71fbd 100644
--- a/arch/powerpc/include/asm/task_size_32.h
+++ b/arch/powerpc/include/asm/task_size_32.h
@@ -6,7 +6,7 @@
 #error User TASK_SIZE overlaps with KERNEL_START address
 #endif
 
-#define TASK_SIZE (CONFIG_TASK_SIZE)
+#define TASK_SIZE ASM_CONST(CONFIG_TASK_SIZE)
 
 /*
  * This decides where the kernel will search for a free chunk of vm space during
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a4bc80b30410a..46149f326fd42 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -331,7 +331,7 @@ int main(void)
 
 #ifndef CONFIG_PPC64
 	DEFINE(TASK_SIZE, TASK_SIZE);
-	DEFINE(NUM_USER_SEGMENTS, TASK_SIZE>>28);
+	DEFINE(NUM_USER_SEGMENTS, ALIGN(TASK_SIZE, SZ_256M) >> 28);
 #endif /* ! CONFIG_PPC64 */
 
 	/* datapage offsets for use by vdso */
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index cb2bca76be535..c1779455ea32f 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -420,7 +420,7 @@ InstructionTLBMiss:
 	lwz	r2,0(r2)		/* get pmd entry */
 #ifdef CONFIG_EXECMEM
 	rlwinm	r3, r0, 4, 0xf
-	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
+	subi	r3, r3, NUM_USER_SEGMENTS
 #endif
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
 	beq-	InstructionAddressInvalid	/* return if no mapping */
@@ -475,7 +475,7 @@ DataLoadTLBMiss:
 	lwz	r2,0(r1)		/* get pmd entry */
 	rlwinm	r3, r0, 4, 0xf
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
-	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
+	subi	r3, r3, NUM_USER_SEGMENTS
 	beq-	2f			/* bail if no mapping */
 1:	rlwimi	r2,r0,22,20,29		/* insert next 10 bits of address */
 	lwz	r2,0(r2)		/* get linux-style pte */
@@ -554,7 +554,7 @@ DataStoreTLBMiss:
 	lwz	r2,0(r1)		/* get pmd entry */
 	rlwinm	r3, r0, 4, 0xf
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
-	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
+	subi	r3, r3, NUM_USER_SEGMENTS
 	beq-	2f			/* bail if no mapping */
 1:
 	rlwimi	r2,r0,22,20,29		/* insert next 10 bits of address */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index c42ecdf94e48c..37eefc6786a72 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -225,7 +225,7 @@ int mmu_mark_initmem_nx(void)
 
 	BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE);
 
-	for (i = TASK_SIZE >> 28; i < 16; i++) {
+	for (i = ALIGN(TASK_SIZE, SZ_256M) >> 28; i < 16; i++) {
 		/* Do not set NX on VM space for modules */
 		if (is_module_segment(i << 28))
 			continue;
diff --git a/arch/powerpc/mm/ptdump/segment_regs.c b/arch/powerpc/mm/ptdump/segment_regs.c
index 9df3af8d481f1..c06704b18a2c8 100644
--- a/arch/powerpc/mm/ptdump/segment_regs.c
+++ b/arch/powerpc/mm/ptdump/segment_regs.c
@@ -31,7 +31,7 @@ static int sr_show(struct seq_file *m, void *v)
 	int i;
 
 	seq_puts(m, "---[ User Segments ]---\n");
-	for (i = 0; i < TASK_SIZE >> 28; i++)
+	for (i = 0; i < ALIGN(TASK_SIZE, SZ_256M) >> 28; i++)
 		seg_show(m, i);
 
 	seq_puts(m, "\n---[ Kernel Segments ]---\n");
-- 
2.49.0


