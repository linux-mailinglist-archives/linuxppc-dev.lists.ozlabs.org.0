Return-Path: <linuxppc-dev+bounces-14898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF52CCFC7A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 13:27:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXmxq6R7Pz2yFY;
	Fri, 19 Dec 2025 23:27:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766147231;
	cv=none; b=DoOhmEKPX4VCkJNB+8a2wb+kTRHoxlGowezC/pRwACTAkAZvmo9omjpxOZEwYpvqCStTluXhpk3wG3TfKVfLmfdJh9M5Hfd2HHEGqAEdAtgfV3ioed/RQMzNA9lcf5GAqUXVCysJ6C9QlMONsbC0XQMNeHbTC8EogY9wiyMUnmIANN1c+gHo/Dc2UbICcIkMNdg8wVDoOx8DRKNII44DArFyndz0iU3lotgL1o8ofSpNwiFsjE8liL5Ck1M8dZuXSxNQooumb6MWzcWjdDMkvryJhmzCuUhUKpSFL6zpYziaPxEXaK29vr3rrDVkGEssLZRucEAvEh973p5QNahCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766147231; c=relaxed/relaxed;
	bh=TS6629xueQWyJuWK4TT0eQo/pMsajdGB3hvXxvzldDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LRwrJANmnSQiqvI+8lq+xk01GlU85dFcPB4ewQwfcgOE9stkxcGq/sc2mvDdNq0TYZ2WmbdrhYBkOWV6HbWRO7G4FmcvcPjykqW/m7EZdRL1nbHxo9QBWmQmlUTaOQxmt5l9kLS4dKg+Ylas0P6yr+BPqaxhTCp66OQyJI9nZT3fDMgO9kQZo6W17Z7gfiSSNFL8tzmw+o1cmX6+up3/xN2aLtJ5BqoNE9/N7ZP9a6mKSZSNzqOO6YPhQ3sjDoQtfSeK/JZ9rdoBLUPVHjnoWFN54Ecar/I1hIu2NBgKqw9HwI9uSsp6CAmiVolCTNsFAHjk2nTa+XIFn2qSnVLaYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W409ey83; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W409ey83;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXmxp6bN1z2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 23:27:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64D1C60008;
	Fri, 19 Dec 2025 12:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3E2C4CEF1;
	Fri, 19 Dec 2025 12:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766147198;
	bh=wagqnRdTBbUsILMcJf1f32B9TXZEuDlygQkfjd+mIOM=;
	h=From:To:Cc:Subject:Date:From;
	b=W409ey83NSYeygetEDHGgW3gRH8uE5k8Ba/ue8GfL4NYzoiMyuaxmoFNZcJsWfnS5
	 GyIGgQj+ptkHkcQVnxe4Ss7BL4laJ568Cw4wnzjiBVZUh/i71tzf8e5ln4W6XLDP6y
	 7FF40QCkIvCcy1+r1GX0pupDSJoNzuGAw8cXZmF6bRoqLyuBgtpCrQ58Jl6FibRtSf
	 vJRpaBW7ZA/aAEXPA2MyMxc6Q3kfMkBpsi43zxqJEmDST8hD3KN0w0CDuo2zrOpnIa
	 WtY1eEoqmqCj8ZWXtMOnczIhYstLYg2aUHRmZB1uAcEivC/MWUpb8m0g7wK486cw1O
	 5ktrGe3aTTn6Q==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] powerpc/32: Restore disabling of interrupts at interrupt/syscall exit
Date: Fri, 19 Dec 2025 13:23:52 +0100
Message-ID: <585ea521b2be99d293b539bbfae148366cfb3687.1766146895.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4242; i=chleroy@kernel.org; h=from:subject:message-id; bh=wagqnRdTBbUsILMcJf1f32B9TXZEuDlygQkfjd+mIOM=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWS6Ot/Qb1SozrXRP7G98tXMpdbl2xmZC2s/d4eXT2AMn xdjdNC0o5SFQYyLQVZMkeX4f+5dM7q+pOZP3aUPM4eVCWQIAxenAEwkMJGR4dXBDW82ZiwVklBs +KlUI8Vi3Lx0zyT10t+T7Z4teMPwlp3hD2/q3xtdd3ZcNmN1fWpyM5F7hTlbu1vCeVttT4vzDt5 SHAA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at
interrupt/syscall exit") delayed clearing of MSR[RI], but missed that
both MSR[RI] and MSR[EE] are cleared at the same time, so the commit
also delayed the disabling of interrupts, leading to unexpected
behaviour.

To fix that, mostly revert the blamed commit and restore the clearing
of MSR[RI] in interrupt_exit_kernel_prepare() instead. For 8xx it
implies adding a synchronising instruction after the mtspr in order to
make sure no instruction counter interrupt (used for perf events) will
fire just after clearing MSR[RI].

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closes: https://lore.kernel.org/all/4d0bd05d-6158-1323-3509-744d3fbe8fc7@xenosoft.de/
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/6b05eb1c-fdef-44e0-91a7-8286825e68f1@roeck-us.net/
Fixes: 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 arch/powerpc/include/asm/hw_irq.h |  2 +-
 arch/powerpc/include/asm/reg.h    |  1 +
 arch/powerpc/kernel/entry_32.S    | 15 ---------------
 arch/powerpc/kernel/interrupt.c   |  5 ++++-
 4 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 1078ba88efaf..9cd945f2acaf 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -90,7 +90,7 @@ static inline void __hard_EE_RI_disable(void)
 	if (IS_ENABLED(CONFIG_BOOKE))
 		wrtee(0);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
-		wrtspr(SPRN_NRI);
+		wrtspr_sync(SPRN_NRI);
 	else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
 		__mtmsrd(0, 1);
 	else
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 3fe186635432..3449dd2b577d 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1400,6 +1400,7 @@ static inline void mtmsr_isync(unsigned long val)
 				     : "r" ((unsigned long)(v)) \
 				     : "memory")
 #define wrtspr(rn)	asm volatile("mtspr " __stringify(rn) ",2" : : : "memory")
+#define wrtspr_sync(rn)	asm volatile("mtspr " __stringify(rn) ",2; sync" : : : "memory")
 
 static inline void wrtee(unsigned long val)
 {
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 16f8ee6cb2cd..d8426251b1cd 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -101,17 +101,6 @@ SYM_FUNC_END(__kuep_unlock)
 .endm
 #endif
 
-.macro	clr_ri trash
-#ifndef CONFIG_BOOKE
-#ifdef CONFIG_PPC_8xx
-	mtspr   SPRN_NRI, \trash
-#else
-	li	\trash, MSR_KERNEL & ~MSR_RI
-	mtmsr	\trash
-#endif
-#endif
-.endm
-
 	.globl	transfer_to_syscall
 transfer_to_syscall:
 	stw	r3, ORIG_GPR3(r1)
@@ -160,7 +149,6 @@ ret_from_syscall:
 	cmpwi	r3,0
 	REST_GPR(3, r1)
 syscall_exit_finish:
-	clr_ri	r4
 	mtspr	SPRN_SRR0,r7
 	mtspr	SPRN_SRR1,r8
 
@@ -237,7 +225,6 @@ fast_exception_return:
 	/* Clear the exception marker on the stack to avoid confusing stacktrace */
 	li	r10, 0
 	stw	r10, 8(r11)
-	clr_ri	r10
 	mtspr	SPRN_SRR1,r9
 	mtspr	SPRN_SRR0,r12
 	REST_GPR(9, r11)
@@ -270,7 +257,6 @@ interrupt_return:
 .Lfast_user_interrupt_return:
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
-	clr_ri	r4
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
 
@@ -313,7 +299,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	cmpwi	cr1,r3,0
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
-	clr_ri	r4
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index aea6f7e8e9c6..e63bfde13e03 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -38,7 +38,7 @@ static inline bool exit_must_hard_disable(void)
 #else
 static inline bool exit_must_hard_disable(void)
 {
-	return false;
+	return true;
 }
 #endif
 
@@ -443,6 +443,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 
 		if (unlikely(stack_store))
 			__hard_EE_RI_disable();
+#else
+	} else {
+		__hard_EE_RI_disable();
 #endif /* CONFIG_PPC64 */
 	}
 
-- 
2.49.0


