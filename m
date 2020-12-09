Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C52D3A87
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 06:31:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrQdg6qVfzDqkR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 16:31:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrQbG0BkfzDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 16:29:27 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CrQb76zg2z9tyPb;
 Wed,  9 Dec 2020 06:29:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jDaPcZ2Rk1Li; Wed,  9 Dec 2020 06:29:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CrQb75zv0z9tyPY;
 Wed,  9 Dec 2020 06:29:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F5858B77C;
 Wed,  9 Dec 2020 06:29:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2haLK1bzF0zy; Wed,  9 Dec 2020 06:29:24 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C17D8B768;
 Wed,  9 Dec 2020 06:29:24 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 39D76668FD; Wed,  9 Dec 2020 05:29:24 +0000 (UTC)
Message-Id: <9870f01e293a5a76c4f4e4ddd4a6b0f63038c591.1607491748.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0d37490a067840f53fc5b118869917c0aec9ab87.1607491747.git.christophe.leroy@csgroup.eu>
References: <0d37490a067840f53fc5b118869917c0aec9ab87.1607491747.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 5/6] powerpc/fault: Avoid heavy search_exception_tables()
 verification
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Date: Wed,  9 Dec 2020 05:29:24 +0000 (UTC)
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
When it is blocked by KUAP, check whether we are in an expected
userspace access place. If so, emit a warning to spot something is
going work. Otherwise, just remain silent, it will likely Oops soon.

When KUAP is not selected, it behaves just as if the address was
already in the TLBs and no fault was generated.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
v4: keep the search once we hit kuap_bad_fault() in order to warn or not
v3: rebased
v2: Squashed with the preceeding patch which was re-ordering tests that get removed in this patch.
---
 arch/powerpc/mm/fault.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 04505f938bbc..389a2a875262 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -210,28 +210,26 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 		return true;
 	}
 
-	if (!is_exec && address < TASK_SIZE && (error_code & (DSISR_PROTFAULT | DSISR_KEYFAULT)) &&
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
+	// Read/write fault blocked by KUAP is bad, it can never succeed.
+	if (bad_kuap_fault(regs, address, is_write)) {
+		pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
+				    is_write ? "write" : "read", address,
+				    from_kuid(&init_user_ns, current_uid()));
+
+		// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
+		if (!search_exception_tables(regs->nip))
+			return true;
 
-	// Read/write fault in a valid region (the exception table search passed
-	// above), but blocked by KUAP is bad, it can never succeed.
-	if (bad_kuap_fault(regs, address, is_write))
+		// Read/write fault in a valid region (the exception table search passed
+		// above), but blocked by KUAP is bad, it can never succeed.
 		return WARN(true, "Bug: %s fault blocked by KUAP!", is_write ? "Write" : "Read");
+	}
 
-	// What's left? Kernel fault on user in well defined regions (extable
-	// matched), and allowed by KUAP in the faulting context.
+	// What's left? Kernel fault on user and allowed by KUAP in the faulting context.
 	return false;
 }
 
-- 
2.25.0

