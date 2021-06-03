Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C7399CEF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:44:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwfbP5Shyz3dZq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 18:44:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwfXX113Pz3bxx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 18:42:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwfWt3qN6zBC66;
 Thu,  3 Jun 2021 10:41:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95Vggnrg3V0Y; Thu,  3 Jun 2021 10:41:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwfWs4vXszBC5j;
 Thu,  3 Jun 2021 10:41:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DB3C8B848;
 Thu,  3 Jun 2021 10:41:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IwBxoXNh0MHA; Thu,  3 Jun 2021 10:41:45 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 182378B767;
 Thu,  3 Jun 2021 10:41:45 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E8CF864BD2; Thu,  3 Jun 2021 08:41:44 +0000 (UTC)
Message-Id: <d9121f96a7c4302946839a0771f5d1daeeb6968c.1622708530.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1622708530.git.christophe.leroy@csgroup.eu>
References: <cover.1622708530.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 09/12] powerpc/32s: Rework Kernel Userspace Access
 Protection
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 08:41:44 +0000 (UTC)
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

On book3s/32, KUAP is provided by toggling Ks bit in segment registers.
One segment register addresses 256M of virtual memory.

At the time being, KUAP implements a complex logic to apply the
unlock/lock on the exact number of segments covering the user range
to access, with saving the boundaries of the range of segments in
a member of thread struct.

But most if not all user accesses are within a single segment.

Rework KUAP with a different approach:
- Open only one segment, the one corresponding to the starting
address of the range to be accessed.
- If a second segment is involved, it will generate a page fault. The
segment will then be open by the page fault handler.

The kuap member of thread struct will now contain:
- The start address of the current on going user access, that will be
used to know which segment to lock at the end of the user access.
- ~0 when no user access is open
- ~1 when additionnal segments are opened by a page fault.

Then, at lock time
- When only one segment is open, close it.
- When several segments are open, close all user segments.

Almost 100% of the time, only one segment will be involved.

In interrupts, inline the function that unlock/lock all segments,
because not inlining them implies a lot of register save/restore.

With the patch, writing value 128 in userspace in perf_copy_attr() is
done with 16 instructions:

    3890:	93 82 04 dc 	stw     r28,1244(r2)
    3894:	7d 20 e5 26 	mfsrin  r9,r28
    3898:	55 29 00 80 	rlwinm  r9,r9,0,2,0
    389c:	7d 20 e1 e4 	mtsrin  r9,r28
    38a0:	4c 00 01 2c 	isync

    38a4:	39 20 00 80 	li      r9,128
    38a8:	91 3c 00 00 	stw     r9,0(r28)

    38ac:	81 42 04 dc 	lwz     r10,1244(r2)
    38b0:	39 00 ff ff 	li      r8,-1
    38b4:	91 02 04 dc 	stw     r8,1244(r2)
    38b8:	2c 0a ff fe 	cmpwi   r10,-2
    38bc:	41 82 00 88 	beq     3944 <perf_copy_attr+0x36c>
    38c0:	7d 20 55 26 	mfsrin  r9,r10
    38c4:	65 29 40 00 	oris    r9,r9,16384
    38c8:	7d 20 51 e4 	mtsrin  r9,r10
    38cc:	4c 00 01 2c 	isync
...
    3944:	48 00 00 01 	bl      3944 <perf_copy_attr+0x36c>
			3944: R_PPC_REL24	kuap_lock_all_ool

Before the patch it was 118 instructions. In reality only 42 are
executed in most cases, but GCC is not able to see that a properly
aligned user access cannot involve more than one segment.

    5060:	39 1d 00 04 	addi    r8,r29,4
    5064:	3d 20 b0 00 	lis     r9,-20480
    5068:	7c 08 48 40 	cmplw   r8,r9
    506c:	40 81 00 08 	ble     5074 <perf_copy_attr+0x2cc>
    5070:	3d 00 b0 00 	lis     r8,-20480
    5074:	39 28 ff ff 	addi    r9,r8,-1
    5078:	57 aa 00 06 	rlwinm  r10,r29,0,0,3
    507c:	55 29 27 3e 	rlwinm  r9,r9,4,28,31
    5080:	39 29 00 01 	addi    r9,r9,1
    5084:	7d 29 53 78 	or      r9,r9,r10
    5088:	91 22 04 dc 	stw     r9,1244(r2)
    508c:	7d 20 ed 26 	mfsrin  r9,r29
    5090:	55 29 00 80 	rlwinm  r9,r9,0,2,0
    5094:	7c 08 50 40 	cmplw   r8,r10
    5098:	40 81 00 c0 	ble     5158 <perf_copy_attr+0x3b0>
    509c:	7d 46 50 f8 	not     r6,r10
    50a0:	7c c6 42 14 	add     r6,r6,r8
    50a4:	54 c6 27 be 	rlwinm  r6,r6,4,30,31
    50a8:	7d 20 51 e4 	mtsrin  r9,r10
    50ac:	3c ea 10 00 	addis   r7,r10,4096
    50b0:	39 29 01 11 	addi    r9,r9,273
    50b4:	7f 88 38 40 	cmplw   cr7,r8,r7
    50b8:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    50bc:	40 9d 00 9c 	ble     cr7,5158 <perf_copy_attr+0x3b0>

    50c0:	2f 86 00 00 	cmpwi   cr7,r6,0
    50c4:	41 9e 00 4c 	beq     cr7,5110 <perf_copy_attr+0x368>
    50c8:	2f 86 00 01 	cmpwi   cr7,r6,1
    50cc:	41 9e 00 2c 	beq     cr7,50f8 <perf_copy_attr+0x350>
    50d0:	2f 86 00 02 	cmpwi   cr7,r6,2
    50d4:	41 9e 00 14 	beq     cr7,50e8 <perf_copy_attr+0x340>
    50d8:	7d 20 39 e4 	mtsrin  r9,r7
    50dc:	39 29 01 11 	addi    r9,r9,273
    50e0:	3c e7 10 00 	addis   r7,r7,4096
    50e4:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    50e8:	7d 20 39 e4 	mtsrin  r9,r7
    50ec:	39 29 01 11 	addi    r9,r9,273
    50f0:	3c e7 10 00 	addis   r7,r7,4096
    50f4:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    50f8:	7d 20 39 e4 	mtsrin  r9,r7
    50fc:	3c e7 10 00 	addis   r7,r7,4096
    5100:	39 29 01 11 	addi    r9,r9,273
    5104:	7f 88 38 40 	cmplw   cr7,r8,r7
    5108:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    510c:	40 9d 00 4c 	ble     cr7,5158 <perf_copy_attr+0x3b0>
    5110:	7d 20 39 e4 	mtsrin  r9,r7
    5114:	39 29 01 11 	addi    r9,r9,273
    5118:	3c c7 10 00 	addis   r6,r7,4096
    511c:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    5120:	7d 20 31 e4 	mtsrin  r9,r6
    5124:	39 29 01 11 	addi    r9,r9,273
    5128:	3c c6 10 00 	addis   r6,r6,4096
    512c:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    5130:	7d 20 31 e4 	mtsrin  r9,r6
    5134:	39 29 01 11 	addi    r9,r9,273
    5138:	3c c7 30 00 	addis   r6,r7,12288
    513c:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    5140:	7d 20 31 e4 	mtsrin  r9,r6
    5144:	3c e7 40 00 	addis   r7,r7,16384
    5148:	39 29 01 11 	addi    r9,r9,273
    514c:	7f 88 38 40 	cmplw   cr7,r8,r7
    5150:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    5154:	41 9d ff bc 	bgt     cr7,5110 <perf_copy_attr+0x368>

    5158:	4c 00 01 2c 	isync
    515c:	39 20 00 80 	li      r9,128
    5160:	91 3d 00 00 	stw     r9,0(r29)

    5164:	38 e0 00 00 	li      r7,0
    5168:	90 e2 04 dc 	stw     r7,1244(r2)
    516c:	7d 20 ed 26 	mfsrin  r9,r29
    5170:	65 29 40 00 	oris    r9,r9,16384
    5174:	40 81 00 c0 	ble     5234 <perf_copy_attr+0x48c>
    5178:	7d 47 50 f8 	not     r7,r10
    517c:	7c e7 42 14 	add     r7,r7,r8
    5180:	54 e7 27 be 	rlwinm  r7,r7,4,30,31
    5184:	7d 20 51 e4 	mtsrin  r9,r10
    5188:	3d 4a 10 00 	addis   r10,r10,4096
    518c:	39 29 01 11 	addi    r9,r9,273
    5190:	7c 08 50 40 	cmplw   r8,r10
    5194:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    5198:	40 81 00 9c 	ble     5234 <perf_copy_attr+0x48c>

    519c:	2c 07 00 00 	cmpwi   r7,0
    51a0:	41 82 00 4c 	beq     51ec <perf_copy_attr+0x444>
    51a4:	2c 07 00 01 	cmpwi   r7,1
    51a8:	41 82 00 2c 	beq     51d4 <perf_copy_attr+0x42c>
    51ac:	2c 07 00 02 	cmpwi   r7,2
    51b0:	41 82 00 14 	beq     51c4 <perf_copy_attr+0x41c>
    51b4:	7d 20 51 e4 	mtsrin  r9,r10
    51b8:	39 29 01 11 	addi    r9,r9,273
    51bc:	3d 4a 10 00 	addis   r10,r10,4096
    51c0:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    51c4:	7d 20 51 e4 	mtsrin  r9,r10
    51c8:	39 29 01 11 	addi    r9,r9,273
    51cc:	3d 4a 10 00 	addis   r10,r10,4096
    51d0:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    51d4:	7d 20 51 e4 	mtsrin  r9,r10
    51d8:	3d 4a 10 00 	addis   r10,r10,4096
    51dc:	39 29 01 11 	addi    r9,r9,273
    51e0:	7c 08 50 40 	cmplw   r8,r10
    51e4:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    51e8:	40 81 00 4c 	ble     5234 <perf_copy_attr+0x48c>
    51ec:	7d 20 51 e4 	mtsrin  r9,r10
    51f0:	39 29 01 11 	addi    r9,r9,273
    51f4:	3c ea 10 00 	addis   r7,r10,4096
    51f8:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    51fc:	7d 20 39 e4 	mtsrin  r9,r7
    5200:	39 29 01 11 	addi    r9,r9,273
    5204:	3c e7 10 00 	addis   r7,r7,4096
    5208:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    520c:	7d 20 39 e4 	mtsrin  r9,r7
    5210:	39 29 01 11 	addi    r9,r9,273
    5214:	3c ea 30 00 	addis   r7,r10,12288
    5218:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    521c:	7d 20 39 e4 	mtsrin  r9,r7
    5220:	3d 4a 40 00 	addis   r10,r10,16384
    5224:	39 29 01 11 	addi    r9,r9,273
    5228:	7c 08 50 40 	cmplw   r8,r10
    522c:	55 29 02 06 	rlwinm  r9,r9,0,8,3
    5230:	41 81 ff bc 	bgt     51ec <perf_copy_attr+0x444>

    5234:	4c 00 01 2c 	isync

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 150 ++++++++++++-----------
 arch/powerpc/include/asm/processor.h     |  10 +-
 arch/powerpc/kernel/process.c            |   3 +
 arch/powerpc/mm/book3s32/kuap.c          |  12 +-
 4 files changed, 102 insertions(+), 73 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 68fbe28c6d7e..bac7edae64bf 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -42,36 +42,69 @@ static inline void kuep_unlock(void)
 
 #include <linux/sched.h>
 
-static inline void kuap_update_sr(u32 sr, u32 addr, u32 end)
-{
-	addr &= 0xf0000000;	/* align addr to start of segment */
-	barrier();	/* make sure thread.kuap is updated before playing with SRs */
-	for (;;) {
-		mtsr(sr, addr);
-		addr += 0x10000000;	/* address of next segment */
-		if (addr >= end)
-			break;
-		sr += 0x111;		/* next VSID */
-		sr &= 0xf0ffffff;	/* clear VSID overflow */
-	}
+#define KUAP_NONE	(~0UL)
+#define KUAP_ALL	(~1UL)
+
+static inline void kuap_lock_one(unsigned long addr)
+{
+	mtsr(mfsr(addr) | SR_KS, addr);
+	isync();	/* Context sync required after mtsr() */
+}
+
+static inline void kuap_unlock_one(unsigned long addr)
+{
+	mtsr(mfsr(addr) & ~SR_KS, addr);
+	isync();	/* Context sync required after mtsr() */
+}
+
+static inline void kuap_lock_all(void)
+{
+	update_user_segments(mfsr(0) | SR_KS);
 	isync();	/* Context sync required after mtsr() */
 }
 
+static inline void kuap_unlock_all(void)
+{
+	update_user_segments(mfsr(0) & ~SR_KS);
+	isync();	/* Context sync required after mtsr() */
+}
+
+void kuap_lock_all_ool(void);
+void kuap_unlock_all_ool(void);
+
+static inline void kuap_lock(unsigned long addr, bool ool)
+{
+	if (likely(addr != KUAP_ALL))
+		kuap_lock_one(addr);
+	else if (!ool)
+		kuap_lock_all();
+	else
+		kuap_lock_all_ool();
+}
+
+static inline void kuap_unlock(unsigned long addr, bool ool)
+{
+	if (likely(addr != KUAP_ALL))
+		kuap_unlock_one(addr);
+	else if (!ool)
+		kuap_unlock_all();
+	else
+		kuap_unlock_all_ool();
+}
+
 static inline void kuap_save_and_lock(struct pt_regs *regs)
 {
 	unsigned long kuap = current->thread.kuap;
-	u32 addr = kuap & 0xf0000000;
-	u32 end = kuap << 28;
 
 	if (kuap_is_disabled())
 		return;
 
 	regs->kuap = kuap;
-	if (unlikely(!kuap))
+	if (unlikely(kuap == KUAP_NONE))
 		return;
 
-	current->thread.kuap = 0;
-	kuap_update_sr(mfsr(addr) | SR_KS, addr, end);	/* Set Ks */
+	current->thread.kuap = KUAP_NONE;
+	kuap_lock(kuap, false);
 }
 
 static inline void kuap_user_restore(struct pt_regs *regs)
@@ -80,18 +113,12 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 
 static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 {
-	u32 addr = regs->kuap & 0xf0000000;
-	u32 end = regs->kuap << 28;
-
 	if (kuap_is_disabled())
 		return;
 
 	current->thread.kuap = regs->kuap;
 
-	if (unlikely(regs->kuap == kuap))
-		return;
-
-	kuap_update_sr(mfsr(addr) & ~SR_KS, addr, end);	/* Clear Ks */
+	kuap_unlock(regs->kuap, false);
 }
 
 static inline unsigned long kuap_get_and_assert_locked(void)
@@ -99,9 +126,9 @@ static inline unsigned long kuap_get_and_assert_locked(void)
 	unsigned long kuap = current->thread.kuap;
 
 	if (kuap_is_disabled())
-		return 0;
+		return KUAP_NONE;
 
-	WARN_ON_ONCE(IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && kuap != 0);
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && kuap != KUAP_NONE);
 
 	return kuap;
 }
@@ -114,8 +141,6 @@ static inline void kuap_assert_locked(void)
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 					      u32 size, unsigned long dir)
 {
-	u32 addr, end;
-
 	if (kuap_is_disabled())
 		return;
 
@@ -125,88 +150,71 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 	if (!(dir & KUAP_WRITE))
 		return;
 
-	addr = (__force u32)to;
-
-	if (unlikely(addr >= TASK_SIZE || !size))
-		return;
-
-	end = min(addr + size, TASK_SIZE);
-
-	current->thread.kuap = (addr & 0xf0000000) | ((((end - 1) >> 28) + 1) & 0xf);
-	kuap_update_sr(mfsr(addr) & ~SR_KS, addr, end);	/* Clear Ks */
+	current->thread.kuap = (__force u32)to;
+	kuap_unlock_one((__force u32)to);
 }
 
 static __always_inline void prevent_user_access(void __user *to, const void __user *from,
 						u32 size, unsigned long dir)
 {
-	u32 addr, end;
+	u32 kuap = current->thread.kuap;
 
 	if (kuap_is_disabled())
 		return;
 
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
-	if (dir & KUAP_CURRENT_WRITE) {
-		u32 kuap = current->thread.kuap;
-
-		if (unlikely(!kuap))
-			return;
-
-		addr = kuap & 0xf0000000;
-		end = kuap << 28;
-	} else if (dir & KUAP_WRITE) {
-		addr = (__force u32)to;
-		end = min(addr + size, TASK_SIZE);
-
-		if (unlikely(addr >= TASK_SIZE || !size))
-			return;
-	} else {
+	if (!(dir & KUAP_WRITE))
 		return;
-	}
 
-	current->thread.kuap = 0;
-	kuap_update_sr(mfsr(addr) | SR_KS, addr, end);	/* set Ks */
+	current->thread.kuap = KUAP_NONE;
+	kuap_lock(kuap, true);
 }
 
 static inline unsigned long prevent_user_access_return(void)
 {
 	unsigned long flags = current->thread.kuap;
-	unsigned long addr = flags & 0xf0000000;
-	unsigned long end = flags << 28;
-	void __user *to = (__force void __user *)addr;
 
 	if (kuap_is_disabled())
-		return 0;
+		return KUAP_NONE;
 
-	if (flags)
-		prevent_user_access(to, to, end - addr, KUAP_READ_WRITE);
+	if (flags != KUAP_NONE) {
+		current->thread.kuap = KUAP_NONE;
+		kuap_lock(flags, true);
+	}
 
 	return flags;
 }
 
 static inline void restore_user_access(unsigned long flags)
 {
-	unsigned long addr = flags & 0xf0000000;
-	unsigned long end = flags << 28;
-	void __user *to = (__force void __user *)addr;
-
 	if (kuap_is_disabled())
 		return;
 
-	if (flags)
-		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
+	if (flags != KUAP_NONE) {
+		current->thread.kuap = flags;
+		kuap_unlock(flags, true);
+	}
 }
 
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	unsigned long begin = regs->kuap & 0xf0000000;
-	unsigned long end = regs->kuap << 28;
+	unsigned long kuap = regs->kuap;
 
 	if (kuap_is_disabled())
 		return false;
 
-	return is_write && (address < begin || address >= end);
+	if (!is_write || kuap == KUAP_ALL)
+		return false;
+	if (kuap == KUAP_NONE)
+		return true;
+
+	/* If faulting address doesn't match unlocked segment, unlock all */
+	if ((kuap ^ address) & 0xf0000000)
+		regs->kuap = KUAP_ALL;
+
+	return false;
 }
 
 #endif /* CONFIG_PPC_KUAP */
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 7bf8a15af224..aeb1a35163d1 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -276,7 +276,15 @@ struct thread_struct {
 #define SPEFSCR_INIT
 #endif
 
-#ifdef CONFIG_PPC32
+#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
+#define INIT_THREAD { \
+	.ksp = INIT_SP, \
+	.pgdir = swapper_pg_dir, \
+	.kuap = ~0UL, /* KUAP_NONE */ \
+	.fpexc_mode = MSR_FE0 | MSR_FE1, \
+	SPEFSCR_INIT \
+}
+#elif defined(CONFIG_PPC32)
 #define INIT_THREAD { \
 	.ksp = INIT_SP, \
 	.pgdir = swapper_pg_dir, \
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e2..c6d21604457d 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1736,6 +1736,9 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 #ifdef CONFIG_ALTIVEC
 	p->thread.vr_save_area = NULL;
 #endif
+#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
+	p->thread.kuap = KUAP_NONE;
+#endif
 
 	setup_ksp_vsid(p, sp);
 
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index a4ce6cdc28e5..1a764367039e 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -5,10 +5,20 @@
 
 struct static_key_false disable_kuap_key;
 
+void kuap_lock_all_ool(void)
+{
+	kuap_lock_all();
+}
+
+void kuap_unlock_all_ool(void)
+{
+	kuap_unlock_all();
+}
+
 void __init setup_kuap(bool disabled)
 {
 	if (!disabled)
-		kuap_update_sr(mfsr(0) | SR_KS, 0, TASK_SIZE);
+		kuap_lock_all_ool();
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
-- 
2.25.0

