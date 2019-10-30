Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B337E9A9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 12:14:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4735T11JbwzF45l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 22:14:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4735QX1hv5zF3rX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 22:12:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="nYkUlM5d"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4735QX0d9Gz9sPJ; Wed, 30 Oct 2019 22:12:36 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4735QW6ySSz9sPL; Wed, 30 Oct 2019 22:12:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572433955;
 bh=Lsiyyh10zXvk4oJvC3ncI2mz0t7ExyWcPTYGGcsR0oE=;
 h=From:To:Subject:Date:From;
 b=nYkUlM5dtfNQejDvMmQAsBt5GXu8SLORjbXcUTebmRRkqIxXxc2ky0lkHHnhvEVO0
 TFm8aEZR3K91XF/ViIK/JMOxdtDIsimUS1tcm5GhMwKG8+rB0/fZn1f5jvzAlEBdGx
 Ot9bYWpRTgltnUVjjoxo+sUuVuVxS4L553VRLz9gX9mgICKdrO94YJyg/46qYp+QjV
 puQg+rsRYc4hqKMgbUTtFA4RFxHqWsW9/v5lXAY2+/94jWFX2QeR8otfjlHVpsK7Zh
 D8iEyuEQ8LLxYLUoixlxBroQQ80CpLCr4dq1PE5/kRLKlVlwLmalU4yJDMS7firJ7E
 iTpTdPwMGgA7g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Add build-time check of ptrace PT_xx defines
Date: Wed, 30 Oct 2019 22:12:31 +1100
Message-Id: <20191030111231.22720-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of the uapi we export a lot of PT_xx defines for each register
in struct pt_regs. These are expressed as an index from gpr[0], in
units of unsigned long.

Currently there's nothing tying the values of those defines to the
actual layout of the struct.

But we *don't* want to change the uapi defines to derive the PT_xx
values based on the layout of the struct, those values are ABI and
must never change.

Instead we want to do the reverse, make sure that the layout of the
struct never changes vs the PT_xx defines. So add build time checks of
that.

This probably seems paranoid, but at least once in the past someone
has sent a patch that would have broken the ABI if it hadn't been
spotted. Although it probably would have been detected via testing,
it's preferable to just quash any issues at the source.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/ptrace.c | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index 8c92febf5f44..abd888bada03 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -3398,4 +3398,67 @@ void __init pt_regs_check(void)
 		     offsetof(struct user_pt_regs, result));
 
 	BUILD_BUG_ON(sizeof(struct user_pt_regs) > sizeof(struct pt_regs));
+
+	// Now check that the pt_regs offsets match the uapi #defines
+	#define CHECK_REG(_pt, _reg) \
+		BUILD_BUG_ON(_pt != (offsetof(struct user_pt_regs, _reg) / \
+				     sizeof(unsigned long)));
+
+	CHECK_REG(PT_R0,  gpr[0]);
+	CHECK_REG(PT_R1,  gpr[1]);
+	CHECK_REG(PT_R2,  gpr[2]);
+	CHECK_REG(PT_R3,  gpr[3]);
+	CHECK_REG(PT_R4,  gpr[4]);
+	CHECK_REG(PT_R5,  gpr[5]);
+	CHECK_REG(PT_R6,  gpr[6]);
+	CHECK_REG(PT_R7,  gpr[7]);
+	CHECK_REG(PT_R8,  gpr[8]);
+	CHECK_REG(PT_R9,  gpr[9]);
+	CHECK_REG(PT_R10, gpr[10]);
+	CHECK_REG(PT_R11, gpr[11]);
+	CHECK_REG(PT_R12, gpr[12]);
+	CHECK_REG(PT_R13, gpr[13]);
+	CHECK_REG(PT_R14, gpr[14]);
+	CHECK_REG(PT_R15, gpr[15]);
+	CHECK_REG(PT_R16, gpr[16]);
+	CHECK_REG(PT_R17, gpr[17]);
+	CHECK_REG(PT_R18, gpr[18]);
+	CHECK_REG(PT_R19, gpr[19]);
+	CHECK_REG(PT_R20, gpr[20]);
+	CHECK_REG(PT_R21, gpr[21]);
+	CHECK_REG(PT_R22, gpr[22]);
+	CHECK_REG(PT_R23, gpr[23]);
+	CHECK_REG(PT_R24, gpr[24]);
+	CHECK_REG(PT_R25, gpr[25]);
+	CHECK_REG(PT_R26, gpr[26]);
+	CHECK_REG(PT_R27, gpr[27]);
+	CHECK_REG(PT_R28, gpr[28]);
+	CHECK_REG(PT_R29, gpr[29]);
+	CHECK_REG(PT_R30, gpr[30]);
+	CHECK_REG(PT_R31, gpr[31]);
+	CHECK_REG(PT_NIP, nip);
+	CHECK_REG(PT_MSR, msr);
+	CHECK_REG(PT_ORIG_R3, orig_gpr3);
+	CHECK_REG(PT_CTR, ctr);
+	CHECK_REG(PT_LNK, link);
+	CHECK_REG(PT_XER, xer);
+	CHECK_REG(PT_CCR, ccr);
+#ifdef CONFIG_PPC64
+	CHECK_REG(PT_SOFTE, softe);
+#else
+	CHECK_REG(PT_MQ, mq);
+#endif
+	CHECK_REG(PT_TRAP, trap);
+	CHECK_REG(PT_DAR, dar);
+	CHECK_REG(PT_DSISR, dsisr);
+	CHECK_REG(PT_RESULT, result);
+	#undef CHECK_REG
+
+	BUILD_BUG_ON(PT_REGS_COUNT != sizeof(struct user_pt_regs) / sizeof(unsigned long));
+
+	/*
+	 * PT_DSCR isn't a real reg, but it's important that it doesn't overlap the
+	 * real registers.
+	 */
+	BUILD_BUG_ON(PT_DSCR < sizeof(struct user_pt_regs) / sizeof(unsigned long));
 }
-- 
2.21.0

