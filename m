Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F104D43484C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 11:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZ5RZ4fG0z301B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 20:49:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qoyHM4r6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZ5Qw4Hxvz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:48:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qoyHM4r6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZ5Qv0WT6z4xb9;
 Wed, 20 Oct 2021 20:48:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634723319;
 bh=yrsVAUODqbT1Kig4Jeti7vBlyyWb8oQHopqazA+I77I=;
 h=From:To:Cc:Subject:Date:From;
 b=qoyHM4r647UOikwesgO+kqUgGdJc3w4qo0hmA0y0w2DCtLomkbVU/zbMGZgbOk1cy
 hGtfz+I84en9ldjO51my5vQyhYv3F7Ct3ZkmZPYeboPjJe31XzCxFOzUuPLfUzoCZJ
 M8wczt7XOhL5l+X10QFsHbKZWjjsfFGsJ+s22X4mzeNxfgpAKJmYV+QEUUNIpokIP9
 7pEz2uLKDu2hGcOP9eJI8QVDQTIK44TuAYQC7u7C1mZ/lvJdeiqkXo+L+TgKFloAax
 M0pMpUgzXV63rf+4JnGWa3UmWDo+w50GEcgip51W1iV5G753Cs9X8QprBiDNykXXLz
 ZtYlUPqWcGTzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/idle: Don't corrupt back chain when going idle
Date: Wed, 20 Oct 2021 20:48:26 +1100
Message-Id: <20211020094826.3222052-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
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
Cc: kvm-ppc@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In isa206_idle_insn_mayloss() we store various registers into the stack
red zone, which is allowed.

However inside the IDLE_STATE_ENTER_SEQ_NORET macro we save r2 again,
to 0(r1), which corrupts the stack back chain.

We used to do the same in isa206_idle_insn_mayloss() itself, but we
fixed that in 73287caa9210 ("powerpc64/idle: Fix SP offsets when saving
GPRs"), however we missed that the macro also corrupts the back chain.

Corrupting the back chain is bad for debuggability but doesn't
necessarily cause a bug.

However we recently changed the stack handling in some KVM code, and it
now relies on the stack back chain being valid when it returns. The
corruption causes that code to return with r1 pointing somewhere in
kernel data, at some point LR is restored from the stack and we branch
to NULL or somewhere else invalid.

Only affects Power8 hosts running KVM guests, with dynamic_mt_modes
enabled (which it is by default).

The fixes tag below points to the commit that changed the KVM stack
handling, exposing this bug. The actual corruption of the back chain has
always existed since 948cf67c4726 ("powerpc: Add NAP mode support on
Power7 in HV mode").

Fixes: 9b4416c5095c ("KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/idle_book3s.S | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
index abb719b21cae..3d97fb833834 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -126,14 +126,16 @@ _GLOBAL(idle_return_gpr_loss)
 /*
  * This is the sequence required to execute idle instructions, as
  * specified in ISA v2.07 (and earlier). MSR[IR] and MSR[DR] must be 0.
- *
- * The 0(r1) slot is used to save r2 in isa206, so use that here.
+ * We have to store a GPR somewhere, ptesync, then reload it, and create
+ * a false dependency on the result of the load. It doesn't matter which
+ * GPR we store, or where we store it. We have already stored r2 to the
+ * stack at -8(r1) in isa206_idle_insn_mayloss, so use that.
  */
 #define IDLE_STATE_ENTER_SEQ_NORET(IDLE_INST)			\
 	/* Magic NAP/SLEEP/WINKLE mode enter sequence */	\
-	std	r2,0(r1);					\
+	std	r2,-8(r1);					\
 	ptesync;						\
-	ld	r2,0(r1);					\
+	ld	r2,-8(r1);					\
 236:	cmpd	cr0,r2,r2;					\
 	bne	236b;						\
 	IDLE_INST;						\
-- 
2.31.1

