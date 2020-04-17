Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 105751ADCD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 14:02:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493ZTl4Y8mzDrhm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 22:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=T6ZcrWl5; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493ZPG26h2zDrgX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 21:58:42 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 493ZP94TH5z9txqC;
 Fri, 17 Apr 2020 13:58:37 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=T6ZcrWl5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L8-nDmWdDGG7; Fri, 17 Apr 2020 13:58:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 493ZP93Nypz9txq9;
 Fri, 17 Apr 2020 13:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587124717; bh=b06zPAdyaI6WB+z5IDxc8Z72FybQU9Qa2n4l+Mw1owo=;
 h=From:Subject:To:Cc:Date:From;
 b=T6ZcrWl5+P4NUf5FR8ygy4zLUxwZvE70tXSVBnVN8rdjKFC/ZuDxQOU87yPoe5Vrh
 yARXC/HP6COUeq01z59E3n80tES0P1ky/O1JmuhJVzP6pL7o8PgNn24y/kV7RWAT0E
 yamtLqNNQoaC6Lvs4hrCGXLtI3uSRingWS6ucLp0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE2BE8B75E;
 Fri, 17 Apr 2020 13:58:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ywUdqUU_tmiC; Fri, 17 Apr 2020 13:58:38 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35D018BB4C;
 Fri, 17 Apr 2020 13:58:38 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 0416F657A3; Fri, 17 Apr 2020 11:58:37 +0000 (UTC)
Message-Id: <6d1f8b6267eed56e7fcaffe68a40ba820a0f28d9.1587124655.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/mm: Kill the task on KUAP fault
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 17 Apr 2020 11:58:37 +0000 (UTC)
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

If a task generates a KUAP fault, even from an acceptable
user access sequence, it is not a simple EFAULT.

Instead of emiting a warning, print a critical message and
kill the task with SIGSEGV.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/kup.h       |  7 +++++--
 arch/powerpc/include/asm/book3s/64/kup-radix.h | 14 +++++++++++---
 arch/powerpc/include/asm/nohash/32/kup-8xx.h   |  8 ++++++--
 arch/powerpc/mm/fault.c                        |  6 +++++-
 4 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 3c0ba22dc360..63422650cb86 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -181,12 +181,15 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	unsigned long begin = regs->kuap & 0xf0000000;
 	unsigned long end = regs->kuap << 28;
+	bool is_fault = address < begin || address >= end;
 
 	if (!is_write)
 		return false;
 
-	return WARN(address < begin || address >= end,
-		    "Bug: write fault blocked by segment registers !");
+	if (is_fault)
+		pr_crit("Bug: write fault blocked by segment registers !");
+
+	return is_fault;
 }
 
 #endif /* CONFIG_PPC_KUAP */
diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 3bcef989a35d..41a450d0aa06 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -137,9 +137,17 @@ static inline void restore_user_access(unsigned long flags)
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
-		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
-		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
+	bool is_fault;
+
+	if (!mmu_has_feature(MMU_FTR_RADIX_KUAP))
+		return false;
+
+	is_fault = regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ);
+
+	if (is_fault)
+		pr_crit("Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
+
+	return is_fault;
 }
 #else /* CONFIG_PPC_KUAP */
 static inline void kuap_restore_amr(struct pt_regs *regs)
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 85ed2390fb99..31419126c2bf 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -63,8 +63,12 @@ static inline void restore_user_access(unsigned long flags)
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xf0000000),
-		    "Bug: fault blocked by AP register !");
+	bool is_fault = !((regs->kuap ^ MD_APG_KUAP) & 0xf0000000);
+
+	if (is_fault)
+		pr_crit("Bug: fault blocked by AP register !\n");
+
+	return is_fault;
 }
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 84af6c8eecf7..91b458aa666e 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -233,8 +233,12 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 
 	// Read/write fault in a valid region (the exception table search passed
 	// above), but blocked by KUAP is bad, it can never succeed.
-	if (bad_kuap_fault(regs, address, is_write))
+	if (bad_kuap_fault(regs, address, is_write)) {
+		pr_crit("kernel %s to userspace (%lx) blocked by KUAP\n",
+			is_write ? "write" : "read", address);
+		_exception(SIGSEGV, regs, SEGV_ACCERR, address);
 		return true;
+	}
 
 	// What's left? Kernel fault on user in well defined regions (extable
 	// matched), and allowed by KUAP in the faulting context.
-- 
2.25.0

