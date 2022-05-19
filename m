Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7DD52D25F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 14:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3pt764ZNz3c4v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 22:23:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Jn2Q7bqu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3prw32m4z2xTb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 22:22:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Jn2Q7bqu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3prn4Djmz4xDh;
 Thu, 19 May 2022 22:22:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652962937;
 bh=0sTjmmDYbg+JcQI984bMigqe+S+bv3jBDvIQk1H4sFk=;
 h=From:To:Subject:Date:From;
 b=Jn2Q7bquNSkmB4PKOslnicJUi3EgWr2ux7S0Vybs12tGn4acSSbKMLoM7IrVTcosz
 OOGYOqfAuHJaI28Af8cRBptCuCWs9hceFmg4skVMPEhcLKte6359VeOFQ53oSmGIZ3
 cmyvcrUdpidlIh3lK7BuuWtYrDnfVYNEKQ/5qycm7D3HQWnoA+UXGQoS8Ck6uF7vYW
 uw1Z4Bac6lo/3r5PwUQovNS2Lynj1X5rkKV16Q3bpjxm3T2mEuPhP+5+qRpmmh4Yhi
 vMDswJpMH+xD9zLfCqGe2pVW4l3ilUPIZ4k2WWbbid+ynT3T9FGJ4uD6C2o/WGvjyA
 JXYazf5ZjNZwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/64s: Add CPU_FTRS_POWER9_DD2_2 to CPU_FTRS_ALWAYS
 mask
Date: Thu, 19 May 2022 22:22:04 +1000
Message-Id: <20220519122205.746276-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CPU_FTRS_POWER9_DD2_2 is missing from CPU_FTRS_ALWAYS.

That doesn't cause any bug, because CPU_FTRS_POWER9_DD2_2 adds new bits
that don't appear in other values, so when anded with the other masks
the result is the same.

But for consistency we should have all values in the CPU_FTRS_ALWAYS
mask, so that the logic is robust against the values being changed in
future.

Fixes: b5af4f279323 ("powerpc: Add CPU feature bits for TM bug workarounds on POWER9 v2.2")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/cputable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index e85c849214a2..4457052d7450 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -541,14 +541,14 @@ enum {
 #define CPU_FTRS_ALWAYS \
 	    (CPU_FTRS_POSSIBLE & ~CPU_FTR_HVMODE & CPU_FTRS_POWER7 & \
 	     CPU_FTRS_POWER8E & CPU_FTRS_POWER8 & CPU_FTRS_POWER9 & \
-	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_DT_CPU_BASE)
+	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & CPU_FTRS_DT_CPU_BASE)
 #else
 #define CPU_FTRS_ALWAYS		\
 	    (CPU_FTRS_PPC970 & CPU_FTRS_POWER5 & \
 	     CPU_FTRS_POWER6 & CPU_FTRS_POWER7 & CPU_FTRS_CELL & \
 	     CPU_FTRS_PA6T & CPU_FTRS_POWER8 & CPU_FTRS_POWER8E & \
 	     ~CPU_FTR_HVMODE & CPU_FTRS_POSSIBLE & CPU_FTRS_POWER9 & \
-	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_DT_CPU_BASE)
+	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & CPU_FTRS_DT_CPU_BASE)
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
 #endif
 #else
-- 
2.35.3

