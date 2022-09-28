Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 343515EDD81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:10:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McxgN1V8Xz3c7d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:10:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jBBqfYXA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McxfZ5kskz3c78
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:09:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jBBqfYXA;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McxfZ4jyFz4xGH;
	Wed, 28 Sep 2022 23:09:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664370582;
	bh=28DZ4+qedXDZqHu/2TRFHVPjjBEdPk3xLq7ATiAEOAY=;
	h=From:To:Subject:Date:From;
	b=jBBqfYXAbCBRRzXGTX87UtVf6NDfdnhsZBNhA4P0HAUneMWWc3BAhMtZn40lXbMa+
	 kW07L9Zr4hyWekEMF4rdAcOmSbxXDMTnfsIRbX30fsdDG0Dy59X6vsS3yUesscVWJ4
	 jMzYVUMBkuehcETMk0UTGo7RObxkOMjjEWeVkNTAdofsmNa4R64mzxnLFTV/PEOwrb
	 ITN3sqgO+XW9f3oMVtzHiYckODTQJJay9+cdaUogg6JEQRJS10ynQuJoPb843c+wlx
	 EIG2KV2/sOrpjhEARujQQvDXJeSsqvyy7XHiyxqmKVg11PNv4qcDH5Cqui20LERBSs
	 weNfihk5NTtkg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Remove lost/old comment
Date: Wed, 28 Sep 2022 23:09:41 +1000
Message-Id: <20220928130941.1732818-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
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

The bulk of this was moved/reworded in:
  57f266497d81 ("powerpc: Use gas sections for arranging exception vectors")

And now appears around line 700 in arch/powerpc/kernel/exceptions-64s.S.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8088134ccb2a..dee434a3e145 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3034,16 +3034,6 @@ EXPORT_SYMBOL(do_uaccess_flush)
 MASKED_INTERRUPT
 MASKED_INTERRUPT hsrr=1
 
-	/*
-	 * Relocation-on interrupts: A subset of the interrupts can be delivered
-	 * with IR=1/DR=1, if AIL==2 and MSR.HV won't be changed by delivering
-	 * it.  Addresses are the same as the original interrupt addresses, but
-	 * offset by 0xc000000000004000.
-	 * It's impossible to receive interrupts below 0x300 via this mechanism.
-	 * KVM: None of these traps are from the guest ; anything that escalated
-	 * to HV=1 from HV=0 is delivered via real mode handlers.
-	 */
-
 USE_FIXED_SECTION(virt_trampolines)
 	/*
 	 * All code below __end_soft_masked is treated as soft-masked. If
-- 
2.37.3

