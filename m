Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72A23DEC1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 19:30:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMwVm2C5ZzDqt3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 03:30:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMw9j5l7xzDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 03:15:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMw9X45Q9z9vCxw;
 Thu,  6 Aug 2020 19:15:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id C8H3UNa7GBUz; Thu,  6 Aug 2020 19:15:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMw9X3JYzz9vCql;
 Thu,  6 Aug 2020 19:15:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C682C8B816;
 Thu,  6 Aug 2020 19:15:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id K33SXzQSZM_5; Thu,  6 Aug 2020 19:15:30 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D8448B7FC;
 Thu,  6 Aug 2020 19:15:30 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 560BC65A68; Thu,  6 Aug 2020 17:15:30 +0000 (UTC)
Message-Id: <ef827b73770a7b155079393f8d8430e10a99ec94.1596734104.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/5] powerpc/fault: Reorder tests in bad_kernel_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Thu,  6 Aug 2020 17:15:30 +0000 (UTC)
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

Check address earlier to simplify the following test.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/fault.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 9ef9ee244f72..525e0c2b5406 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -210,17 +210,17 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 		return true;
 	}
 
-	if (!is_exec && address < TASK_SIZE && (error_code & DSISR_PROTFAULT) &&
+	// Kernel fault on kernel address is bad
+	if (address >= TASK_SIZE)
+		return true;
+
+	if (!is_exec && (error_code & DSISR_PROTFAULT) &&
 	    !search_exception_tables(regs->nip)) {
 		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: %d)\n",
 				    address,
 				    from_kuid(&init_user_ns, current_uid()));
 	}
 
-	// Kernel fault on kernel address is bad
-	if (address >= TASK_SIZE)
-		return true;
-
 	// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
 	if (!search_exception_tables(regs->nip))
 		return true;
-- 
2.25.0

