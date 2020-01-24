Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D949148520
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 13:25:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483yz93TDMzDqP8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 23:25:41 +1100 (AEDT)
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
 header.s=mail header.b=VhVS76BL; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483yHY3n8lzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 22:54:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483yHS5Mk3z9tyMx;
 Fri, 24 Jan 2020 12:54:44 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VhVS76BL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9aePS3j3XYfQ; Fri, 24 Jan 2020 12:54:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483yHS42bsz9tyMv;
 Fri, 24 Jan 2020 12:54:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579866884; bh=K+rJXLvKLhEXW6x/OC3sboi3DWloT83ulrteIzzb3Rk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=VhVS76BLS/CZmKDAnsrYShUw62XXulqByufQDd125U9eayBO1lsIEQ3RAhp2eKYa1
 4U7OV8RTqZoe7Y7RMIoQ3iGCDYs2TxhFCXnRZNhasZhEFwk2IDskzS0fnLImjB/+KN
 zh/9NXFK0aOojpsN2WZLaanqt2CD2ufEaLYqQn98=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF5F28B85C;
 Fri, 24 Jan 2020 12:54:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Mu-PjnmSDGiX; Fri, 24 Jan 2020 12:54:45 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EE6B8B84A;
 Fri, 24 Jan 2020 12:54:45 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 80E4D651F0; Fri, 24 Jan 2020 11:54:45 +0000 (UTC)
Message-Id: <54f2f74938006b33c55a416674807b42ef222068.1579866752.git.christophe.leroy@c-s.fr>
In-Reply-To: <b6f97231868c43b90ae7abe7f68f84d176a8ebe1.1579866752.git.christophe.leroy@c-s.fr>
References: <b6f97231868c43b90ae7abe7f68f84d176a8ebe1.1579866752.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 7/7] powerpc: Implement user_access_save() and
 user_access_restore()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 24 Jan 2020 11:54:45 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement user_access_save() and user_access_restore()

On 8xx and radix:
- On save, get the value of the associated special register
then prevent user access.
- On restore, set back the saved value to the associated special
register.

On book3s/32:
- On save, get the value stored in current->thread.kuap and prevent
user access.
- On restore, regenerate address range from the stored value and
reopen read/write access for that range.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v4: new
---
 arch/powerpc/include/asm/book3s/32/kup.h      | 23 +++++++++++++++++++
 .../powerpc/include/asm/book3s/64/kup-radix.h | 22 ++++++++++++++++++
 arch/powerpc/include/asm/kup.h                |  2 ++
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  | 14 +++++++++++
 arch/powerpc/include/asm/uaccess.h            |  5 ++--
 5 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 17e069291c72..3c0ba22dc360 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -153,6 +153,29 @@ static __always_inline void prevent_user_access(void __user *to, const void __us
 	kuap_update_sr(mfsrin(addr) | SR_KS, addr, end);	/* set Ks */
 }
 
+static inline unsigned long prevent_user_access_return(void)
+{
+	unsigned long flags = current->thread.kuap;
+	unsigned long addr = flags & 0xf0000000;
+	unsigned long end = flags << 28;
+	void __user *to = (__force void __user *)addr;
+
+	if (flags)
+		prevent_user_access(to, to, end - addr, KUAP_READ_WRITE);
+
+	return flags;
+}
+
+static inline void restore_user_access(unsigned long flags)
+{
+	unsigned long addr = flags & 0xf0000000;
+	unsigned long end = flags << 28;
+	void __user *to = (__force void __user *)addr;
+
+	if (flags)
+		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
+}
+
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index a0263e94df33..90dd3a3fc8c7 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -63,6 +63,14 @@
  * because that would require an expensive read/modify write of the AMR.
  */
 
+static inline unsigned long get_kuap(void)
+{
+	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+		return 0;
+
+	return mfspr(SPRN_AMR);
+}
+
 static inline void set_kuap(unsigned long value)
 {
 	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
@@ -98,6 +106,20 @@ static inline void prevent_user_access(void __user *to, const void __user *from,
 	set_kuap(AMR_KUAP_BLOCKED);
 }
 
+static inline unsigned long prevent_user_access_return(void)
+{
+	unsigned long flags = get_kuap();
+
+	set_kuap(AMR_KUAP_BLOCKED);
+
+	return flags;
+}
+
+static inline void restore_user_access(unsigned long flags)
+{
+	set_kuap(flags);
+}
+
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index c3ce7e8ae9ea..92bcd1a26d73 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -55,6 +55,8 @@ static inline void allow_user_access(void __user *to, const void __user *from,
 				     unsigned long size, unsigned long dir) { }
 static inline void prevent_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir) { }
+static inline unsigned long prevent_user_access_return(void) { return 0UL; }
+static inline void restore_user_access(unsigned long flags) { }
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 1d70c80366fd..85ed2390fb99 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -46,6 +46,20 @@ static inline void prevent_user_access(void __user *to, const void __user *from,
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
 
+static inline unsigned long prevent_user_access_return(void)
+{
+	unsigned long flags = mfspr(SPRN_MD_AP);
+
+	mtspr(SPRN_MD_AP, MD_APG_KUAP);
+
+	return flags;
+}
+
+static inline void restore_user_access(unsigned long flags)
+{
+	mtspr(SPRN_MD_AP, flags);
+}
+
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index af905d7fc1df..2f500debae21 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -465,9 +465,8 @@ static __must_check inline bool user_access_begin(const void __user *ptr, size_t
 }
 #define user_access_begin	user_access_begin
 #define user_access_end		prevent_current_access_user
-
-static inline unsigned long user_access_save(void) { return 0UL; }
-static inline void user_access_restore(unsigned long flags) { }
+#define user_access_save	prevent_user_access_return
+#define user_access_restore	restore_user_access
 
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
 #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
-- 
2.25.0

