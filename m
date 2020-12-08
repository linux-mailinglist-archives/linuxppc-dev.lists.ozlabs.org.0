Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC12D2671
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:42:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqtwQ3FpzzDqGt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 19:42:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqtpD135xzDqWT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 19:37:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Cqtp61G8Lz9txrm;
 Tue,  8 Dec 2020 09:37:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CbF01VgNo7DC; Tue,  8 Dec 2020 09:37:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Cqtp60S89z9txrj;
 Tue,  8 Dec 2020 09:37:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 068148B773;
 Tue,  8 Dec 2020 09:37:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TEMjkJ9FYafu; Tue,  8 Dec 2020 09:37:02 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E38C8B7B6;
 Tue,  8 Dec 2020 09:37:02 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5CB4966928; Tue,  8 Dec 2020 08:37:02 +0000 (UTC)
Message-Id: <1997d67070847346bc1d55a7e51f23991e4b73ad.1607416578.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0d37490a067840f53fc5b118869917c0aec9ab87.1607416578.git.christophe.leroy@csgroup.eu>
References: <0d37490a067840f53fc5b118869917c0aec9ab87.1607416578.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 5/5] powerpc/fault: Perform exception fixup in
 do_page_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Date: Tue,  8 Dec 2020 08:37:02 +0000 (UTC)
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

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Add prototype of __bad_page_fault() in asm/bug.h
---
 arch/powerpc/include/asm/bug.h       |  1 +
 arch/powerpc/kernel/entry_32.S       |  2 +-
 arch/powerpc/kernel/exceptions-64e.S |  2 +-
 arch/powerpc/kernel/exceptions-64s.S |  2 +-
 arch/powerpc/mm/fault.c              | 33 ++++++++++++++++++++--------
 5 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index ba0500872cce..464f8ca8a5c9 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -113,6 +113,7 @@
 struct pt_regs;
 extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long);
 extern void bad_page_fault(struct pt_regs *, unsigned long, int);
+void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
 extern void die(const char *, struct pt_regs *, long);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 58177c71dfd4..1c9b0ccc2172 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -684,7 +684,7 @@ handle_page_fault:
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	lwz	r4,_DAR(r1)
-	bl	bad_page_fault
+	bl	__bad_page_fault
 	b	ret_from_except_full
 
 #ifdef CONFIG_PPC_BOOK3S_32
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index f579ce46eef2..74d07dc0bb48 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1023,7 +1023,7 @@ storage_fault_common:
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
-	bl	bad_page_fault
+	bl	__bad_page_fault
 	b	ret_from_except
 
 /*
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1c8f1b90e174..e02ad6fefa46 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3259,7 +3259,7 @@ handle_page_fault:
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
-	bl	bad_page_fault
+	bl	__bad_page_fault
 	b	interrupt_return
 
 /* We have a data breakpoint exception - handle it */
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 1770b41e4730..2e50bc1c3783 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -538,10 +538,20 @@ NOKPROBE_SYMBOL(__do_page_fault);
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
 
@@ -550,17 +560,10 @@ NOKPROBE_SYMBOL(do_page_fault);
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
@@ -594,3 +597,15 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 
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

