Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29047C10A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 14:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJHwF2tS9z3069
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 00:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=by7iycom;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJHtF1x1Jz2y7Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 00:51:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=by7iycom; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJHtC2bpPz4xbd;
 Wed, 22 Dec 2021 00:51:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1640094675;
 bh=VkegTdsz50hBFtARFdPFEYLF5Ii3nTvOaWgksXVdTG8=;
 h=From:To:Cc:Subject:Date:From;
 b=by7iycomqZv0o3L5DgjtnRHyEsPLAM9Mas4P66EKN6WarpI+VBW+EIlGYJUgYG/iW
 Kj/oA9zxhbCL89ZIYK1I/qeI3xKErrSAFZy0rf6EUrm6rB6vSj/BGXyYnzRlCCWSxJ
 086IgR0hqAXEE8GGPT9htqDiZClfxknQPCtJBfNbBT8EuEAHK5tspvGxA982wl2JBq
 6qJJy7sljeiUaGYvBYiPFmWDZRYoEAqP5pXftiEbguKxAaDXNyg3f/VSJaRGP6gsp2
 vlTRtGl2UpXUdpClEPQvm9S/AOB1FmQFdekfBjRPj9SBIBEMfvb8+frj223u1W6Gd1
 PSUAbylYAVF/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/3] powerpc/64s: Mask NIP before checking against SRR0
Date: Wed, 22 Dec 2021 00:50:59 +1100
Message-Id: <20211221135101.2085547-1-mpe@ellerman.id.au>
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
Cc: sachinp@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_PPC_RFI_SRR_DEBUG=y we check that NIP and SRR0 match when
returning from interrupts. This can trigger falsely if NIP has either of
its two low bits set via sigreturn or ptrace, while SRR0 has its low two
bits masked in hardware.

As a quick fix make sure to mask the low bits before doing the check.

Fixes: 59dc5bfca0cb ("powerpc/64s: avoid reloading (H)SRR registers if they are still valid")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/interrupt_64.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 2ad223597ca2..4fd65d39d5d3 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -30,6 +30,7 @@
 	.ifc \srr,srr
 	mfspr	r11,SPRN_SRR0
 	ld	r12,_NIP(r1)
+	clrrdi  r12,r12,2
 100:	tdne	r11,r12
 	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	mfspr	r11,SPRN_SRR1
@@ -39,6 +40,7 @@
 	.else
 	mfspr	r11,SPRN_HSRR0
 	ld	r12,_NIP(r1)
+	clrrdi  r12,r12,2
 100:	tdne	r11,r12
 	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	mfspr	r11,SPRN_HSRR1
-- 
2.31.1

