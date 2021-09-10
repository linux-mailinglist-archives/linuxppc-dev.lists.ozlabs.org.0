Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE34060DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5GkD2HxZz2ynk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:20:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kh2C/1H5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kh2C/1H5; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5GfT2xxKz2ywX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:17:37 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B1AC6023D;
 Fri, 10 Sep 2021 00:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233055;
 bh=Ld/8iCWO+7pbktr9mXJ2lHwYBZ4/nqPn0oLCMreQlFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kh2C/1H5n3K9F/9Ew6R+aHpRma2WO92jg0oVLU5SJB0w8LLM7n9pHLQSCh9mVkxNk
 NFaHxrorRK3TwBYKzfIbpJdk/o5X5DFxly1wMRxSiNGBcud2F+E3gKDzVpuUxhJWtc
 lK95LKMZTRzHJHi77I19yqf4ZA/YNaxaL21zc5IWqc611tnjiPl4dMDSSUK91sSlUv
 SLBUZzZ1cxlgAbS1Oy9FLQCKTqfIJ3azT3x5ZwTm99de9XChEzWgu8Fvy8HhT9K+hS
 72Zf5jOdEFaNMsNYxKiz50hgraJoiejNevbViwWd8VPthnld7quzxjtfk5a26iCBN7
 HCO7TibvzFudg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 70/99] powerpc: Avoid link stack corruption in
 misc asm functions
Date: Thu,  9 Sep 2021 20:15:29 -0400
Message-Id: <20210910001558.173296-70-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit 33e1402435cb9f3021439a15935ea2dc69ec1844 ]

bl;mflr is used at several places to get code position.

Use bcl 20,31,+4 instead of bl in order to preserve link stack.

See commit c974809a26a1 ("powerpc/vdso: Avoid link stack corruption
in __get_datapage()") for details.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/c6eabb4fb6c156f75d56dcbcc6f243e5ac0fba42.1629791763.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/misc.S       |  2 +-
 arch/powerpc/kernel/misc_32.S    |  2 +-
 arch/powerpc/kernel/misc_64.S    |  2 +-
 arch/powerpc/kernel/reloc_32.S   |  2 +-
 arch/powerpc/kexec/relocate_32.S | 12 ++++++------
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/misc.S b/arch/powerpc/kernel/misc.S
index 5be96feccb55..fb7de3543c03 100644
--- a/arch/powerpc/kernel/misc.S
+++ b/arch/powerpc/kernel/misc.S
@@ -29,7 +29,7 @@ _GLOBAL(reloc_offset)
 	li	r3, 0
 _GLOBAL(add_reloc_offset)
 	mflr	r0
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r5
 	PPC_LL	r4,(2f-1b)(r5)
 	subf	r5,r4,r5
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 39ab15419592..921d4198bfaa 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -67,7 +67,7 @@ _GLOBAL(reloc_got2)
 	srwi.	r8,r8,2
 	beqlr
 	mtctr	r8
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r0
 	lis	r4,1b@ha
 	addi	r4,r4,1b@l
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 4b761a18a74d..d38a019b38e1 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -255,7 +255,7 @@ _GLOBAL(scom970_write)
  * Physical (hardware) cpu id should be in r3.
  */
 _GLOBAL(kexec_wait)
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r5
 	addi	r5,r5,kexec_flag-1b
 
diff --git a/arch/powerpc/kernel/reloc_32.S b/arch/powerpc/kernel/reloc_32.S
index 10e96f3e22fe..0508c14b4c28 100644
--- a/arch/powerpc/kernel/reloc_32.S
+++ b/arch/powerpc/kernel/reloc_32.S
@@ -30,7 +30,7 @@ R_PPC_RELATIVE = 22
 _GLOBAL(relocate)
 
 	mflr	r0		/* Save our LR */
-	bl	0f		/* Find our current runtime address */
+	bcl	20,31,$+4	/* Find our current runtime address */
 0:	mflr	r12		/* Make it accessible */
 	mtlr	r0
 
diff --git a/arch/powerpc/kexec/relocate_32.S b/arch/powerpc/kexec/relocate_32.S
index 61946c19e07c..cf6e52bdf8d8 100644
--- a/arch/powerpc/kexec/relocate_32.S
+++ b/arch/powerpc/kexec/relocate_32.S
@@ -93,7 +93,7 @@ wmmucr:
 	 * Invalidate all the TLB entries except the current entry
 	 * where we are running from
 	 */
-	bl	0f				/* Find our address */
+	bcl	20,31,$+4			/* Find our address */
 0:	mflr	r5				/* Make it accessible */
 	tlbsx	r23,0,r5			/* Find entry we are in */
 	li	r4,0				/* Start at TLB entry 0 */
@@ -158,7 +158,7 @@ write_out:
 	/* Switch to other address space in MSR */
 	insrwi	r9, r7, 1, 26		/* Set MSR[IS] = r7 */
 
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r8
 	addi	r8, r8, (2f-1b)		/* Find the target offset */
 
@@ -202,7 +202,7 @@ next_tlb:
 	li	r9,0
 	insrwi	r9, r7, 1, 26			/* Set MSR[IS] = r7 */
 
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r8
 	and	r8, r8, r11			/* Get our offset within page */
 	addi	r8, r8, (2f-1b)
@@ -240,7 +240,7 @@ setup_map_47x:
 	sync
 
 	/* Find the entry we are running from */
-	bl	2f
+	bcl	20,31,$+4
 2:	mflr	r23
 	tlbsx	r23, 0, r23
 	tlbre	r24, r23, 0			/* TLB Word 0 */
@@ -296,7 +296,7 @@ clear_utlb_entry:
 	/* Update the msr to the new TS */
 	insrwi	r5, r7, 1, 26
 
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r6
 	addi	r6, r6, (2f-1b)
 
@@ -355,7 +355,7 @@ write_utlb:
 	/* Defaults to 256M */
 	lis	r10, 0x1000
 
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r4
 	addi	r4, r4, (2f-1b)			/* virtual address  of 2f */
 
-- 
2.30.2

