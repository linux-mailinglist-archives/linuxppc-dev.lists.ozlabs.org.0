Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6312755BA3C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:04:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqGY1Vy2z3dx8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:04:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T5IhEEoR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDx6NpHz3bl7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T5IhEEoR;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDv2b7Bz4xR1;
	Tue, 28 Jun 2022 00:02:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338575;
	bh=ajWUqcvZYmYVomcTNyNSA15VhTkG64wTvAnc+OnegGY=;
	h=From:To:Subject:Date:From;
	b=T5IhEEoRnBLSyjK70bjNec4Jt1Wf8irt9zd1y+HaOdbs21ZXM3DrKI5iYZbFSWdjd
	 0PDPSulT9fMhlS2futCmrf46dtfEa3QOWILq/x7JLuhMkU0X88ijmqlFxaPliBfW1j
	 kWFOBlflztPgAQaYl5zMA8imwvdlaq4SKkgKqgv3q8sAQQzavoacfktU458ZiDrnoa
	 tN30NYu+0H4ra2gIjte9LM203nS2HYgV/opbKyFgdMZk2o576ckumHL37r5kl+F1jN
	 UEAsxoJPOEG5aE+JhKtxee9CkQRCGjBzmTGNtdIkjDUD6QGrLsVYQJsltzLBlG/wZn
	 EFjcJBSO55J2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 01/13] selftests/powerpc: Ensure 16-byte stack pointer alignment
Date: Tue, 28 Jun 2022 00:02:27 +1000
Message-Id: <20220627140239.2464900-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PUSH/POP_BASIC_STACK helpers in basic_asm.h do not ensure that the
stack pointer is always 16-byte aligned, which is required per the ABI.

Fix the macros to do the alignment if the caller fails to.

Currently only one caller passes a non-aligned size, tm_signal_self(),
which hasn't been caught in testing, presumably because it's a leaf
function.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/include/basic_asm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/basic_asm.h b/tools/testing/selftests/powerpc/include/basic_asm.h
index 886dc026fe7a..807e83e821ec 100644
--- a/tools/testing/selftests/powerpc/include/basic_asm.h
+++ b/tools/testing/selftests/powerpc/include/basic_asm.h
@@ -58,7 +58,7 @@
 #define PUSH_BASIC_STACK(_extra) \
 	mflr	r0; \
 	std	r0, STACK_FRAME_LR_POS(%r1); \
-	stdu	%r1, -(_extra + STACK_FRAME_MIN_SIZE)(%r1); \
+	stdu	%r1, -(((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE)(%r1); \
 	mfcr	r0; \
 	stw	r0, STACK_FRAME_CR_POS(%r1); \
 	std	%r2, STACK_FRAME_TOC_POS(%r1);
@@ -67,7 +67,7 @@
 	ld	%r2, STACK_FRAME_TOC_POS(%r1); \
 	lwz	r0, STACK_FRAME_CR_POS(%r1); \
 	mtcr	r0; \
-	addi	%r1, %r1, (_extra + STACK_FRAME_MIN_SIZE); \
+	addi	%r1, %r1, (((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE); \
 	ld	r0, STACK_FRAME_LR_POS(%r1); \
 	mtlr	r0;
 
-- 
2.35.3

