Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE223DEE4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 19:34:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMwbZ5kX6zDqs3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 03:34:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMw9j68H3zDqNR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 03:15:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMw9Z5jNlz9vCxy;
 Thu,  6 Aug 2020 19:15:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L3ZlJ7WF5SWB; Thu,  6 Aug 2020 19:15:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMw9Z4r22z9vCql;
 Thu,  6 Aug 2020 19:15:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CCE768B816;
 Thu,  6 Aug 2020 19:15:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qTDg0lNOKxWO; Thu,  6 Aug 2020 19:15:32 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E68E8B7FC;
 Thu,  6 Aug 2020 19:15:32 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6271665A68; Thu,  6 Aug 2020 17:15:32 +0000 (UTC)
Message-Id: <5748c8f5cf0a9b3686169e2c7709107e6aaec408.1596734105.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 5/5] powerpc/fault: Perform exception fixup in
 do_page_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Thu,  6 Aug 2020 17:15:32 +0000 (UTC)
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

Exception fixup doesn't require the heady full regs saving,
do it from do_page_fault() directly.

For that, split bad_page_fault() in two parts.

As bad_page_fault() can also be called from other places than
handle_page_fault(), it will still perform exception fixup and
fallback on __bad_page_fault().

handle_page_fault() directly calls __bad_page_fault() as the
exception fixup will now be done by do_page_fault()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S       |  2 +-
 arch/powerpc/kernel/exceptions-64e.S |  2 +-
 arch/powerpc/kernel/exceptions-64s.S |  2 +-
 arch/powerpc/mm/fault.c              | 33 ++++++++++++++++++++--------
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index f4d0af8e1136..c198786591f9 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -678,7 +678,7 @@ handle_page_fault:
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	lwz	r4,_DAR(r1)
-	bl	bad_page_fault
+	bl	__bad_page_fault
 	b	ret_from_except_full
 
 #ifdef CONFIG_PPC_BOOK3S_32
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index d9ed79415100..dd9161ea5da8 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1024,7 +1024,7 @@ storage_fault_common:
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
-	bl	bad_page_fault
+	bl	__bad_page_fault
 	b	ret_from_except
 
 /*
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f7d748b88705..2cb3bcfb896d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3254,7 +3254,7 @@ handle_page_fault:
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
-	bl	bad_page_fault
+	bl	__bad_page_fault
 	b	interrupt_return
 
 /* We have a data breakpoint exception - handle it */
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index edde169ba3a6..bd6e397eb84a 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -542,10 +542,20 @@ NOKPROBE_SYMBOL(__do_page_fault);
 int do_page_fault(struct pt_regs *regs, unsigned long address,
 		  unsigned long error_code)
 {
+	const struct exception_table_entry *entry;
 	enum ctx_state prev_state = exception_enter();
 	int rc = __do_page_fault(regs, address, error_code);
 	exception_exit(prev_state);
-	return rc;
+	if (likely(!rc))
+		return 0;
+
+	entry = search_exception_tables(regs->nip);
+	if (unlikely(!entry))
+		return rc;
+
+	instruction_pointer_set(regs, extable_fixup(entry));
+
+	return 0;
 }
 NOKPROBE_SYMBOL(do_page_fault);
 
@@ -554,17 +564,10 @@ NOKPROBE_SYMBOL(do_page_fault);
  * It is called from the DSI and ISI handlers in head.S and from some
  * of the procedures in traps.c.
  */
-void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
+void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 {
-	const struct exception_table_entry *entry;
 	int is_write = page_fault_is_write(regs->dsisr);
 
-	/* Are we prepared to handle this fault?  */
-	if ((entry = search_exception_tables(regs->nip)) != NULL) {
-		regs->nip = extable_fixup(entry);
-		return;
-	}
-
 	/* kernel has accessed a bad area */
 
 	switch (TRAP(regs)) {
@@ -598,3 +601,15 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 
 	die("Kernel access of bad area", regs, sig);
 }
+
+void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
+{
+	const struct exception_table_entry *entry;
+
+	/* Are we prepared to handle this fault?  */
+	entry = search_exception_tables(instruction_pointer(regs));
+	if (entry)
+		instruction_pointer_set(regs, extable_fixup(entry));
+	else
+		__bad_page_fault(regs, address, sig);
+}
-- 
2.25.0

