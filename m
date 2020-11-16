Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD472B4A38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 17:03:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZYkv0VpTzDqLt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 03:03:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZYWk0CLdzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 02:53:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CZYWW4mDBz9vDFf;
 Mon, 16 Nov 2020 16:53:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lPEeDEEJLeLo; Mon, 16 Nov 2020 16:53:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CZYWW3QgNz9vDFc;
 Mon, 16 Nov 2020 16:53:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D66388B7A3;
 Mon, 16 Nov 2020 16:53:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id svikFLoYArVj; Mon, 16 Nov 2020 16:53:16 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 16F788B7A9;
 Mon, 16 Nov 2020 16:53:16 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BCFF966884; Mon, 16 Nov 2020 15:53:15 +0000 (UTC)
Message-Id: <9d67fe038feb6b3e88cc1013efe7d070bf1e9d9f.1605541983.git.christophe.leroy@csgroup.eu>
In-Reply-To: <40ae19c2bf013e3815a6ae0d6016963fdb0f51b7.1605541983.git.christophe.leroy@csgroup.eu>
References: <40ae19c2bf013e3815a6ae0d6016963fdb0f51b7.1605541983.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/5] powerpc/fault: Avoid heavy search_exception_tables()
 verification
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Nov 2020 15:53:15 +0000 (UTC)
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

search_exception_tables() is an heavy operation, we have to avoid it.
When KUAP is selected, we'll know the fault has been blocked by KUAP.
Otherwise, it behaves just as if the address was already in the TLBs
and no fault was generated.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Squashed with the preceeding patch which was re-ordering tests that get removed in this patch.
---
 arch/powerpc/mm/fault.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 17665ff97469..1770b41e4730 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -210,28 +210,19 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 		return true;
 	}
 
-	if (!is_exec && address < TASK_SIZE && (error_code & DSISR_PROTFAULT) &&
-	    !search_exception_tables(regs->nip)) {
-		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: %d)\n",
-				    address,
-				    from_kuid(&init_user_ns, current_uid()));
-	}
-
 	// Kernel fault on kernel address is bad
 	if (address >= TASK_SIZE)
 		return true;
 
-	// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
-	if (!search_exception_tables(regs->nip))
-		return true;
-
-	// Read/write fault in a valid region (the exception table search passed
-	// above), but blocked by KUAP is bad, it can never succeed.
-	if (bad_kuap_fault(regs, address, is_write))
+	// Read/write fault blocked by KUAP is bad, it can never succeed.
+	if (bad_kuap_fault(regs, address, is_write)) {
+		pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
+				    is_write ? "write" : "read", address,
+				    from_kuid(&init_user_ns, current_uid()));
 		return true;
+	}
 
-	// What's left? Kernel fault on user in well defined regions (extable
-	// matched), and allowed by KUAP in the faulting context.
+	// What's left? Kernel fault on user and allowed by KUAP in the faulting context.
 	return false;
 }
 
-- 
2.25.0

