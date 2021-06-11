Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB23A4951
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 21:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1r6b2FPjz3c11
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 05:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1r6G2SRyz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 05:11:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G1r6B1QDYzBB8Q;
 Fri, 11 Jun 2021 21:10:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eH9Pu4L-O0Yk; Fri, 11 Jun 2021 21:10:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G1r6B0HwCzBB8B;
 Fri, 11 Jun 2021 21:10:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DA6B98B84C;
 Fri, 11 Jun 2021 21:10:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id v8zQL_Vn6FaM; Fri, 11 Jun 2021 21:10:57 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 91F748B848;
 Fri, 11 Jun 2021 21:10:57 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4D97366132; Fri, 11 Jun 2021 19:10:57 +0000 (UTC)
Message-Id: <1fff2054e5dfc00329804dbd3f2a91667c9a8aff.1623438544.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc/64: drop redundant defination of spin_until_cond
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 11 Jun 2021 19:10:57 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sudeep Holla <sudeep.holla@arm.com>

linux/processor.h has exactly same defination for spin_until_cond.
Drop the redundant defination in asm/processor.h

Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 That's just a rebase

 arch/powerpc/include/asm/processor.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 7bf8a15af224..0819854eeab9 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -339,17 +339,6 @@ static inline unsigned long __pack_fe01(unsigned int fpmode)
 
 #define spin_end()	HMT_medium()
 
-#define spin_until_cond(cond)					\
-do {								\
-	if (unlikely(!(cond))) {				\
-		spin_begin();					\
-		do {						\
-			spin_cpu_relax();			\
-		} while (!(cond));				\
-		spin_end();					\
-	}							\
-} while (0)
-
 #endif
 
 /* Check that a certain kernel stack pointer is valid in task_struct p */
-- 
2.25.0

