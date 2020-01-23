Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD551468EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 14:19:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483NCR4g1fzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 00:19:15 +1100 (AEDT)
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
 header.s=mail header.b=m8vT+7Vj; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483MnW5BwvzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 23:59:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483Mn554fPz9vB4b;
 Thu, 23 Jan 2020 13:59:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=m8vT+7Vj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ODcJLQQ8KZdO; Thu, 23 Jan 2020 13:59:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483Mn53tM9z9vB4X;
 Thu, 23 Jan 2020 13:59:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579784393; bh=2A+DHD4btbFKfkOs6li2k01GNKK7HnJcrGNXJq6nAh4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=m8vT+7VjBVWNki/Oeh7C7BbraLtfYVArr703qXZL5c2vj5AWSKxjwCbz9BtuuyWR1
 GBQQZ9vzCgDZPZeTu8eiNjIm54B1gFVifdKLURdmXWV1lTt4RBeAY8pYc5TPPIEmqf
 t9E+BFoZEi62/xolOq+fMXM7cb68oLHKfK+h+guE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4F0D8B82E;
 Thu, 23 Jan 2020 13:59:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kZ62ky9AMEwp; Thu, 23 Jan 2020 13:59:54 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 714C98B826;
 Thu, 23 Jan 2020 13:59:54 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 44CEB651C0; Thu, 23 Jan 2020 12:59:54 +0000 (UTC)
Message-Id: <584ce843dc9d1982934c2b64dd9e64f21ac84c9a.1579783936.git.christophe.leroy@c-s.fr>
In-Reply-To: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 3/7] powerpc/32s: Fix bad_kuap_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 23 Jan 2020 12:59:54 +0000 (UTC)
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the moment, bad_kuap_fault() reports a fault only if a bad access
to userspace occurred while access to userspace was not granted.

But if a fault occurs for a write outside the allowed userspace
segment(s) that have been unlocked, bad_kuap_fault() fails to
detect it and the kernel loops forever in do_page_fault().

Fix it by checking that the accessed address is within the allowed
range.

Fixes: a68c31fc01ef ("powerpc/32s: Implement Kernel Userspace Access Protection")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: added missing address parametre to bad_kuap_fault() in asm/kup.h
v3: no change
---
 arch/powerpc/include/asm/book3s/32/kup.h       | 9 +++++++--
 arch/powerpc/include/asm/book3s/64/kup-radix.h | 3 ++-
 arch/powerpc/include/asm/kup.h                 | 6 +++++-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h   | 3 ++-
 arch/powerpc/mm/fault.c                        | 2 +-
 5 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index f9dc597b0b86..d88008c8eb85 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -131,12 +131,17 @@ static inline void prevent_user_access(void __user *to, const void __user *from,
 	kuap_update_sr(mfsrin(addr) | SR_KS, addr, end);	/* set Ks */
 }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, bool is_write)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
+	unsigned long begin = regs->kuap & 0xf0000000;
+	unsigned long end = regs->kuap << 28;
+
 	if (!is_write)
 		return false;
 
-	return WARN(!regs->kuap, "Bug: write fault blocked by segment registers !");
+	return WARN(address < begin || address >= end,
+		    "Bug: write fault blocked by segment registers !");
 }
 
 #endif /* CONFIG_PPC_KUAP */
diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index f254de956d6a..dbbd22cb80f5 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -95,7 +95,8 @@ static inline void prevent_user_access(void __user *to, const void __user *from,
 	set_kuap(AMR_KUAP_BLOCKED);
 }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, bool is_write)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 5b5e39643a27..812e66f31934 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -45,7 +45,11 @@ static inline void allow_user_access(void __user *to, const void __user *from,
 				     unsigned long size) { }
 static inline void prevent_user_access(void __user *to, const void __user *from,
 				       unsigned long size) { }
-static inline bool bad_kuap_fault(struct pt_regs *regs, bool is_write) { return false; }
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+{
+	return false;
+}
 #endif /* CONFIG_PPC_KUAP */
 
 static inline void allow_read_from_user(const void __user *from, unsigned long size)
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 1006a427e99c..f2fea603b929 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -46,7 +46,8 @@ static inline void prevent_user_access(void __user *to, const void __user *from,
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, bool is_write)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xf0000000),
 		    "Bug: fault blocked by AP register !");
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b5047f9b5dec..1baeb045f7f4 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -233,7 +233,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 
 	// Read/write fault in a valid region (the exception table search passed
 	// above), but blocked by KUAP is bad, it can never succeed.
-	if (bad_kuap_fault(regs, is_write))
+	if (bad_kuap_fault(regs, address, is_write))
 		return true;
 
 	// What's left? Kernel fault on user in well defined regions (extable
-- 
2.25.0

