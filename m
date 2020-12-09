Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7552D3A95
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 06:33:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrQgd2GRszDqnV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 16:33:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrQbG0MxBzDqhb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 16:29:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CrQb42Tfrz9txjt;
 Wed,  9 Dec 2020 06:29:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 57_lDMTu61yM; Wed,  9 Dec 2020 06:29:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CrQb40886z9txjs;
 Wed,  9 Dec 2020 06:29:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BC5B98B77C;
 Wed,  9 Dec 2020 06:29:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GCZ-bFT9Tc4B; Wed,  9 Dec 2020 06:29:20 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C1EA8B768;
 Wed,  9 Dec 2020 06:29:20 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 20080668FD; Wed,  9 Dec 2020 05:29:20 +0000 (UTC)
Message-Id: <0d37490a067840f53fc5b118869917c0aec9ab87.1607491747.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 1/6] powerpc/book3s64/kuap: Improve error reporting with
 KUAP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Date: Wed,  9 Dec 2020 05:29:20 +0000 (UTC)
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

From: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

This partially reverts commit eb232b162446 ("powerpc/book3s64/kuap: Improve
error reporting with KUAP") and update the fault handler to print

[   55.022514] Kernel attempted to access user page (7e6725b70000) - exploit attempt? (uid: 0)
[   55.022528] BUG: Unable to handle kernel data access on read at 0x7e6725b70000
[   55.022533] Faulting instruction address: 0xc000000000e8b9bc
[   55.022540] Oops: Kernel access of bad area, sig: 11 [#1]
....

when the kernel access userspace address without unlocking AMR.

bad_kuap_fault() is added as part of commit 5e5be3aed230 ("powerpc/mm: Detect
bad KUAP faults") to catch userspace access incorrectly blocked by AMR. Hence
retain the full stack dump there even with hash translation. Also, add a comment
explaining the difference between hash and radix.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     |  4 +--
 arch/powerpc/include/asm/book3s/64/kup.h     | 34 ++++++++++----------
 arch/powerpc/include/asm/kup.h               |  4 +--
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  4 +--
 arch/powerpc/mm/fault.c                      |  4 +--
 5 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index b18cd931e325..32fd4452e960 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -177,8 +177,8 @@ static inline void restore_user_access(unsigned long flags)
 		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
 }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write, unsigned long error_code)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	unsigned long begin = regs->kuap & 0xf0000000;
 	unsigned long end = regs->kuap << 28;
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index f2e6dd78d5e2..7075c92c320c 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -353,29 +353,29 @@ static inline void set_kuap(unsigned long value)
 	isync();
 }
 
-#define RADIX_KUAP_BLOCK_READ	UL(0x4000000000000000)
-#define RADIX_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
-
 static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write, unsigned long error_code)
+				  bool is_write)
 {
 	if (!mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		return false;
-
-	if (radix_enabled()) {
-		/*
-		 * Will be a storage protection fault.
-		 * Only check the details of AMR[0]
-		 */
-		return WARN((regs->kuap & (is_write ? RADIX_KUAP_BLOCK_WRITE : RADIX_KUAP_BLOCK_READ)),
-			    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
-	}
 	/*
-	 * We don't want to WARN here because userspace can setup
-	 * keys such that a kernel access to user address can cause
-	 * fault
+	 * For radix this will be a storage protection fault (DSISR_PROTFAULT).
+	 * For hash this will be a key fault (DSISR_KEYFAULT)
 	 */
-	return !!(error_code & DSISR_KEYFAULT);
+	/*
+	 * We do have exception table entry, but accessing the
+	 * userspace results in fault.  This could be because we
+	 * didn't unlock the AMR or access is denied by userspace
+	 * using a key value that blocks access. We are only interested
+	 * in catching the use case of accessing without unlocking
+	 * the AMR. Hence check for BLOCK_WRITE/READ against AMR.
+	 */
+	if (is_write) {
+		return WARN(((regs->amr & AMR_KUAP_BLOCK_WRITE) == AMR_KUAP_BLOCK_WRITE),
+			    "Bug: Write fault blocked by AMR!");
+	}
+	return WARN(((regs->amr & AMR_KUAP_BLOCK_READ) == AMR_KUAP_BLOCK_READ),
+		    "Bug: Read fault blocked by AMR!");
 }
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index f8ec679bd2de..5a9820c54da9 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -62,8 +62,8 @@ void setup_kuap(bool disabled);
 #else
 static inline void setup_kuap(bool disabled) { }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write, unsigned long error_code)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return false;
 }
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 7bdd9e5b63ed..567cdc557402 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -60,8 +60,8 @@ static inline void restore_user_access(unsigned long flags)
 	mtspr(SPRN_MD_AP, flags);
 }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write, unsigned long error_code)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xff000000),
 		    "Bug: fault blocked by AP register !");
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index c91621df0c61..b12595102525 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -210,7 +210,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 		return true;
 	}
 
-	if (!is_exec && address < TASK_SIZE && (error_code & DSISR_PROTFAULT) &&
+	if (!is_exec && address < TASK_SIZE && (error_code & (DSISR_PROTFAULT | DSISR_KEYFAULT)) &&
 	    !search_exception_tables(regs->nip)) {
 		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: %d)\n",
 				    address,
@@ -227,7 +227,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 
 	// Read/write fault in a valid region (the exception table search passed
 	// above), but blocked by KUAP is bad, it can never succeed.
-	if (bad_kuap_fault(regs, address, is_write, error_code))
+	if (bad_kuap_fault(regs, address, is_write))
 		return true;
 
 	// What's left? Kernel fault on user in well defined regions (extable
-- 
2.25.0

