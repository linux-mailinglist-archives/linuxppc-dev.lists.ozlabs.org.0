Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB755BA40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:05:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqJN6K5mz3dtJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:05:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Grj1ql59;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDy5ZXwz3bbv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Grj1ql59;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDy4ktRz4xNm;
	Tue, 28 Jun 2022 00:02:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338578;
	bh=vh4Ew12gG7EVqT6LbBCqMvdPPAzncK7Cu0dxXfSw6xk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Grj1ql59Q56/svfJmlPjRCD3PICroZO2U/bLwah3PMpIsSu+taBzsPosk357FgmTe
	 LU1fJWPwndUHdbBuJ34X85Dr9ecuIzyhtYOj/1h9N/4ao8wtp/YoPGjqQwxorGf8F2
	 /EQZHLqa92HqDe8vuuPsLCQX67GI6QVaSgLofGgPtwHUpVVif2XaANZPmWkEfEwehC
	 Cbz15BC+Yr+974ZyrLvfOckwWzNppW/G7usNhHk94E+ZNmW+LldcOwPCnBXfPmD67w
	 l4NVOckUMVUB4rhiH+4Fz07BHd99XekDHO/HDb1KJRJ9m/Vaij7LtDeLi+8j+Hs5YP
	 zXAm1MwvgsyQA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 07/13] selftests/powerpc/ptrace: Drop unused load_fpr_single_precision()
Date: Tue, 28 Jun 2022 00:02:33 +1000
Message-Id: <20220627140239.2464900-7-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
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

This function is never called, drop it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/include/reg.h |  1 -
 tools/testing/selftests/powerpc/lib/reg.S     | 37 -------------------
 2 files changed, 38 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/reg.h b/tools/testing/selftests/powerpc/include/reg.h
index c422be8a42b2..bc7f610c2c6d 100644
--- a/tools/testing/selftests/powerpc/include/reg.h
+++ b/tools/testing/selftests/powerpc/include/reg.h
@@ -160,7 +160,6 @@
 #ifndef __ASSEMBLER__
 void store_gpr(unsigned long *addr);
 void load_gpr(unsigned long *addr);
-void load_fpr_single_precision(float *addr);
 void store_fpr_single_precision(float *addr);
 #endif /* end of __ASSEMBLER__ */
 
diff --git a/tools/testing/selftests/powerpc/lib/reg.S b/tools/testing/selftests/powerpc/lib/reg.S
index 9304ea7d59b9..dd37b8e6f84c 100644
--- a/tools/testing/selftests/powerpc/lib/reg.S
+++ b/tools/testing/selftests/powerpc/lib/reg.S
@@ -53,43 +53,6 @@ FUNC_START(store_gpr)
 	blr
 FUNC_END(store_gpr)
 
-/* Single Precision Float - float buf[32] */
-FUNC_START(load_fpr_single_precision)
-	lfs 0, 0*4(3)
-	lfs 1, 1*4(3)
-	lfs 2, 2*4(3)
-	lfs 3, 3*4(3)
-	lfs 4, 4*4(3)
-	lfs 5, 5*4(3)
-	lfs 6, 6*4(3)
-	lfs 7, 7*4(3)
-	lfs 8, 8*4(3)
-	lfs 9, 9*4(3)
-	lfs 10, 10*4(3)
-	lfs 11, 11*4(3)
-	lfs 12, 12*4(3)
-	lfs 13, 13*4(3)
-	lfs 14, 14*4(3)
-	lfs 15, 15*4(3)
-	lfs 16, 16*4(3)
-	lfs 17, 17*4(3)
-	lfs 18, 18*4(3)
-	lfs 19, 19*4(3)
-	lfs 20, 20*4(3)
-	lfs 21, 21*4(3)
-	lfs 22, 22*4(3)
-	lfs 23, 23*4(3)
-	lfs 24, 24*4(3)
-	lfs 25, 25*4(3)
-	lfs 26, 26*4(3)
-	lfs 27, 27*4(3)
-	lfs 28, 28*4(3)
-	lfs 29, 29*4(3)
-	lfs 30, 30*4(3)
-	lfs 31, 31*4(3)
-	blr
-FUNC_END(load_fpr_single_precision)
-
 /* Single Precision Float - float buf[32] */
 FUNC_START(store_fpr_single_precision)
 	stfs 0, 0*4(3)
-- 
2.35.3

