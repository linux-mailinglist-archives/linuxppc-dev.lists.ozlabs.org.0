Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F623DE01
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 19:21:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMwJ45jHDzDqsh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 03:21:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMw9j69tSzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 03:15:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMw9V59Zgz9vCqq;
 Thu,  6 Aug 2020 19:15:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vamTd93RcqFz; Thu,  6 Aug 2020 19:15:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMw9V3Gcjz9vCql;
 Thu,  6 Aug 2020 19:15:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C0BCB8B816;
 Thu,  6 Aug 2020 19:15:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MlhVkdSLcO5I; Thu,  6 Aug 2020 19:15:28 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 865D98B7FC;
 Thu,  6 Aug 2020 19:15:28 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5124665A68; Thu,  6 Aug 2020 17:15:28 +0000 (UTC)
Message-Id: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 1/5] powerpc/mm: sanity_check_fault() should work for all, 
 not only BOOK3S
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Thu,  6 Aug 2020 17:15:28 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The verification and message introduced by commit 374f3f5979f9
("powerpc/mm/hash: Handle user access of kernel address gracefully")
applies to all platforms, it should not be limited to BOOK3S.

Make the BOOK3S version of sanity_check_fault() the one for all,
and bail out earlier if not BOOK3S.

Fixes: 374f3f5979f9 ("powerpc/mm/hash: Handle user access of kernel address gracefully")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/fault.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 925a7231abb3..2efa34d7e644 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -303,7 +303,6 @@ static inline void cmo_account_page_fault(void)
 static inline void cmo_account_page_fault(void) { }
 #endif /* CONFIG_PPC_SMLPAR */
 
-#ifdef CONFIG_PPC_BOOK3S
 static void sanity_check_fault(bool is_write, bool is_user,
 			       unsigned long error_code, unsigned long address)
 {
@@ -320,6 +319,9 @@ static void sanity_check_fault(bool is_write, bool is_user,
 		return;
 	}
 
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S))
+		return;
+
 	/*
 	 * For hash translation mode, we should never get a
 	 * PROTFAULT. Any update to pte to reduce access will result in us
@@ -354,10 +356,6 @@ static void sanity_check_fault(bool is_write, bool is_user,
 
 	WARN_ON_ONCE(error_code & DSISR_PROTFAULT);
 }
-#else
-static void sanity_check_fault(bool is_write, bool is_user,
-			       unsigned long error_code, unsigned long address) { }
-#endif /* CONFIG_PPC_BOOK3S */
 
 /*
  * Define the correct "is_write" bit in error_code based
-- 
2.25.0

