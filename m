Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73801399CED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwfb33kXXz3dHX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 18:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwfXS2PZ7z3bvN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 18:42:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwfWs1NQrzBC5Z;
 Thu,  3 Jun 2021 10:41:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4EBwsJlEyvK; Thu,  3 Jun 2021 10:41:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwfWr4QP3zBC5j;
 Thu,  3 Jun 2021 10:41:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8524A8B84A;
 Thu,  3 Jun 2021 10:41:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4Vp1RjwRe-SV; Thu,  3 Jun 2021 10:41:44 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FCFA8B767;
 Thu,  3 Jun 2021 10:41:44 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E23A164BD2; Thu,  3 Jun 2021 08:41:43 +0000 (UTC)
Message-Id: <cd79e8008455fba5395d099f9bb1305c039b931c.1622708530.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1622708530.git.christophe.leroy@csgroup.eu>
References: <cover.1622708530.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 08/12] powerpc/32s: Allow disabling KUAP at boot time
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 08:41:43 +0000 (UTC)
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

PPC64 uses MMU features to enable/disable KUAP at boot time.
But feature fixups are applied way too early on PPC32.

Now that all KUAP related actions are in C following the
conversion of KUAP initial setup and context switch in C,
static branches can be used to enable/disable KUAP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 27 +++++++++++++++++++++++-
 arch/powerpc/mm/book3s32/kuap.c          | 11 ++++++----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 2854d970dabe..68fbe28c6d7e 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -9,11 +9,12 @@
 
 #include <linux/jump_label.h>
 
+extern struct static_key_false disable_kuap_key;
 extern struct static_key_false disable_kuep_key;
 
 static __always_inline bool kuap_is_disabled(void)
 {
-	return !IS_ENABLED(CONFIG_PPC_KUAP);
+	return !IS_ENABLED(CONFIG_PPC_KUAP) || static_branch_unlikely(&disable_kuap_key);
 }
 
 static __always_inline bool kuep_is_disabled(void)
@@ -62,6 +63,9 @@ static inline void kuap_save_and_lock(struct pt_regs *regs)
 	u32 addr = kuap & 0xf0000000;
 	u32 end = kuap << 28;
 
+	if (kuap_is_disabled())
+		return;
+
 	regs->kuap = kuap;
 	if (unlikely(!kuap))
 		return;
@@ -79,6 +83,9 @@ static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 	u32 addr = regs->kuap & 0xf0000000;
 	u32 end = regs->kuap << 28;
 
+	if (kuap_is_disabled())
+		return;
+
 	current->thread.kuap = regs->kuap;
 
 	if (unlikely(regs->kuap == kuap))
@@ -91,6 +98,9 @@ static inline unsigned long kuap_get_and_assert_locked(void)
 {
 	unsigned long kuap = current->thread.kuap;
 
+	if (kuap_is_disabled())
+		return 0;
+
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && kuap != 0);
 
 	return kuap;
@@ -106,6 +116,9 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 {
 	u32 addr, end;
 
+	if (kuap_is_disabled())
+		return;
+
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 	BUILD_BUG_ON(dir & ~KUAP_READ_WRITE);
 
@@ -128,6 +141,9 @@ static __always_inline void prevent_user_access(void __user *to, const void __us
 {
 	u32 addr, end;
 
+	if (kuap_is_disabled())
+		return;
+
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
 	if (dir & KUAP_CURRENT_WRITE) {
@@ -159,6 +175,9 @@ static inline unsigned long prevent_user_access_return(void)
 	unsigned long end = flags << 28;
 	void __user *to = (__force void __user *)addr;
 
+	if (kuap_is_disabled())
+		return 0;
+
 	if (flags)
 		prevent_user_access(to, to, end - addr, KUAP_READ_WRITE);
 
@@ -171,6 +190,9 @@ static inline void restore_user_access(unsigned long flags)
 	unsigned long end = flags << 28;
 	void __user *to = (__force void __user *)addr;
 
+	if (kuap_is_disabled())
+		return;
+
 	if (flags)
 		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
 }
@@ -181,6 +203,9 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 	unsigned long begin = regs->kuap & 0xf0000000;
 	unsigned long end = regs->kuap << 28;
 
+	if (kuap_is_disabled())
+		return false;
+
 	return is_write && (address < begin || address >= end);
 }
 
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index 5533ed92ab3d..a4ce6cdc28e5 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -3,15 +3,18 @@
 #include <asm/kup.h>
 #include <asm/smp.h>
 
+struct static_key_false disable_kuap_key;
+
 void __init setup_kuap(bool disabled)
 {
-	kuap_update_sr(mfsr(0) | SR_KS, 0, TASK_SIZE);
+	if (!disabled)
+		kuap_update_sr(mfsr(0) | SR_KS, 0, TASK_SIZE);
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
 
-	pr_info("Activating Kernel Userspace Access Protection\n");
-
 	if (disabled)
-		pr_warn("KUAP cannot be disabled yet on 6xx when compiled in\n");
+		static_branch_enable(&disable_kuap_key);
+	else
+		pr_info("Activating Kernel Userspace Access Protection\n");
 }
-- 
2.25.0

