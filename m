Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B4B42F401
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 15:40:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW6pz3JGwz3cHh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 00:40:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kSZ7fuFH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW6nj1Z6xz2xt1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 00:39:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kSZ7fuFH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW6nh0B3Rz4xbZ;
 Sat, 16 Oct 2021 00:39:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634305176;
 bh=aT+4RSZsIeEUk+iQDrJV/Xn4f0gDbD4FWrcoDbnT2aA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kSZ7fuFHAxMta2X5UdfEzR2fyTVtBAjrNKs5EMGNAx6xt2rgkF0n5Qtf/ETNYUMyB
 /pWKV5sLiJyIFVFLSBJzAzDhm2+sSeG6VOKHsd0+NWuGpUhx/+Lw0+9WXu6Qp4mFFQ
 IBnXo7Pl60EuFXwXQnngh4x4vcjhKURxE0IxjYI4xlEBvaR8983ftXWmONYheqbt2f
 k5TZbr2u/lxadhABYY+uzME1jaDSk4e/hxN/FWHp4otiIbadgVHO78ORdOT3ovavMj
 OUFybbsx23r/WU8SOnfT7rMqt3zl2SzYU/20WMzXa5mCupUZFx1ZLAYAGHR0D1XGEX
 xopuNgllwgQ9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0
 if it went to guest
Date: Sat, 16 Oct 2021 00:39:29 +1100
Message-Id: <20211015133929.832061-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015133929.832061-1-mpe@ellerman.id.au>
References: <20211015133929.832061-1-mpe@ellerman.id.au>
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

We call idle_kvm_start_guest() from power7_offline() if the thread has
been requested to enter KVM. We pass it the SRR1 value that was returned
from power7_idle_insn() which tells us what sort of wakeup we're
processing.

Depending on the SRR1 value we pass in, the KVM code might enter the
guest, or it might return to us to do some host action if the wakeup
requires it.

If idle_kvm_start_guest() is able to handle the wakeup, and enter the
guest it is supposed to indicate that by returning a zero SRR1 value to
us.

That was the behaviour prior to commit 10d91611f426 ("powerpc/64s:
Reimplement book3s idle code in C"), however in that commit the
handling of SRR1 was reworked, and the zeroing behaviour was lost.

Returning from idle_kvm_start_guest() without zeroing the SRR1 value can
confuse the host offline code, causing the guest to crash and other
weirdness.

Fixes: 10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
Cc: stable@vger.kernel.org # v5.2+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index ec57952b60b0..eb776d0c5d8e 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -264,6 +264,7 @@ _GLOBAL(idle_kvm_start_guest)
 	stdu	r1, -SWITCH_FRAME_SIZE(r4)
 	// Switch to new frame on emergency stack
 	mr	r1, r4
+	std	r3, 32(r1)	// Save SRR1 wakeup value
 	SAVE_NVGPRS(r1)
 
 	/*
@@ -315,6 +316,10 @@ _GLOBAL(idle_kvm_start_guest)
 
 kvm_secondary_got_guest:
 
+	// About to go to guest, clear saved SRR1
+	li	r0, 0
+	std	r0, 32(r1)
+
 	/* Set HSTATE_DSCR(r13) to something sensible */
 	ld	r6, PACA_DSCR_DEFAULT(r13)
 	std	r6, HSTATE_DSCR(r13)
@@ -394,8 +399,8 @@ _GLOBAL(idle_kvm_start_guest)
 	mfspr	r4, SPRN_LPCR
 	rlwimi	r4, r3, 0, LPCR_PECE0 | LPCR_PECE1
 	mtspr	SPRN_LPCR, r4
-	/* set up r3 for return */
-	mfspr	r3,SPRN_SRR1
+	// Return SRR1 wakeup value, or 0 if we went into the guest
+	ld	r3, 32(r1)
 	REST_NVGPRS(r1)
 	ld	r1, 0(r1)	// Switch back to caller stack
 	ld	r0, 16(r1)	// Reload LR
-- 
2.25.1

