Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D1E52D25E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 14:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3psT5X34z3c2h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 22:22:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J1A09Puj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3prr0wW6z2xTb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 22:22:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=J1A09Puj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3prp1qvHz4xDj;
 Thu, 19 May 2022 22:22:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652962938;
 bh=CDbZqEi6lflyXyaMG1F8VJej3YxchQzrJKTBhJQ0UUg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=J1A09PujoBasDgBfsuo9SfBq4HF75HtNuvdBzbMkFiAeeFqRANJlpxzAGfxFPGrxS
 MoTaijY+DREx+0A4LSUYduw5ftksUEZtyUPaTqLL0I4rgZvffxWAgIBzUU/BjUP3TV
 OT4/pCACufjECuFv7/jG5/JFRoux4ReIa7AbW5kQTIZMnNcg2/oBd1ojItp8PE8EHM
 n4nssZlq43VeWA8HGVy277Pfd8pZ9fdRbh/UoPG6pL9UnEYtTt3UzAEi+JEELbfwJk
 3AtGmr1M9zkYQPAupo/aGUSZ6L7mEJSerJ8WVXmKehG9Cp+HPbOWjwwqf0ULHLGWnK
 X1CQEaK5otHxg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/64s: Add CPU_FTRS_POWER10 to ALWAYS mask
Date: Thu, 19 May 2022 22:22:05 +1000
Message-Id: <20220519122205.746276-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220519122205.746276-1-mpe@ellerman.id.au>
References: <20220519122205.746276-1-mpe@ellerman.id.au>
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

CPU_FTRS_POWER10 is missing from the CPU_FTRS_ALWAYS mask.

Currently that doesn't cause any bug, because it is a superset of the
POWER9 mask, which the exception of CPU_FTR_TM, but POWER7 doesn't have
CPU_FTR_TM, so CPU_FTR_TM is not in the ALWAYS mask to begin with.

However for consistency, and to be robust against future changes, it
should be included in the ALWAYS mask.

Fixes: a3ea40d5c736 ("powerpc: Add POWER10 architected mode")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/cputable.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 4457052d7450..48a55cb1bf5c 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -541,14 +541,16 @@ enum {
 #define CPU_FTRS_ALWAYS \
 	    (CPU_FTRS_POSSIBLE & ~CPU_FTR_HVMODE & CPU_FTRS_POWER7 & \
 	     CPU_FTRS_POWER8E & CPU_FTRS_POWER8 & CPU_FTRS_POWER9 & \
-	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & CPU_FTRS_DT_CPU_BASE)
+	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & \
+	     CPU_FTRS_POWER10 & CPU_FTRS_DT_CPU_BASE)
 #else
 #define CPU_FTRS_ALWAYS		\
 	    (CPU_FTRS_PPC970 & CPU_FTRS_POWER5 & \
 	     CPU_FTRS_POWER6 & CPU_FTRS_POWER7 & CPU_FTRS_CELL & \
 	     CPU_FTRS_PA6T & CPU_FTRS_POWER8 & CPU_FTRS_POWER8E & \
 	     ~CPU_FTR_HVMODE & CPU_FTRS_POSSIBLE & CPU_FTRS_POWER9 & \
-	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & CPU_FTRS_DT_CPU_BASE)
+	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & \
+	     CPU_FTRS_POWER10 & CPU_FTRS_DT_CPU_BASE)
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
 #endif
 #else
-- 
2.35.3

