Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EBC11DCB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:55:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YxdG1BZ4zDqg7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 14:54:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YxXH14SNzDr74
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 14:50:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="V63zkgOB"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47YxXG6Tlwz9sPc; Fri, 13 Dec 2019 14:50:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47YxXG4mGlz9sPh; Fri, 13 Dec 2019 14:50:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576209038;
 bh=wSknKRhiA5JcDSNt6mIyag39vNwmsZdCLDKcnSpPRqw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V63zkgOBALI21O4kNQJomzvAHrTWafNh86k7UELX3+jCJguwTY25AgWPL9Mu9dWup
 Zy6pb4JzgSbZ9m+1l3njpmRFGmk9+Exg7pXcbXtVRfhgI5yYySWkdH9i5zo6xcrE5W
 g5gJ9Srr15G8s0w+zk/aSTyxkdk57Wed7VfqYYN1OHVwHdfsjypqxq2fiH0S1aadYj
 pLi1cQnJL12j2Gp+sa2026SD9KHdvm+PlkW0G2Cl80vo8jvJ738+XWN5E2Nxb12tqI
 juebfWDdte1pHN6moiivE1ycrJxdwL2CA13GOI8Yb+EChesMIEw2o6jpVUwlN3r2qI
 4XitJAwP7M+UQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v5 2/2] powerpc/shared: Use static key to detect shared
 processor
Date: Fri, 13 Dec 2019 14:50:36 +1100
Message-Id: <20191213035036.6913-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191213035036.6913-1-mpe@ellerman.id.au>
References: <20191213035036.6913-1-mpe@ellerman.id.au>
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
Cc: juri.lelli@redhat.com, parth@linux.ibm.com, pauld@redhat.com,
 srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com, Ihor.Pasichnyk@ibm.com,
 longman@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

With the static key shared processor available, is_shared_processor()
can return without having to query the lppaca structure.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Acked-by: Phil Auld <pauld@redhat.com>
Acked-by: Waiman Long <longman@redhat.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191205083218.25824-2-srikar@linux.vnet.ibm.com
---
 arch/powerpc/include/asm/spinlock.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

v5: No change.

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index cac95a3f30c2..1b55fc08f853 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -112,13 +112,8 @@ static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
 
 static inline bool is_shared_processor(void)
 {
-/*
- * LPPACA is only available on Pseries so guard anything LPPACA related to
- * allow other platforms (which include this common header) to compile.
- */
-#ifdef CONFIG_PPC_PSERIES
-	return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
-		lppaca_shared_proc(local_paca->lppaca_ptr));
+#ifdef CONFIG_PPC_SPLPAR
+	return static_branch_unlikely(&shared_processor);
 #else
 	return false;
 #endif
-- 
2.21.0

