Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA26037B827
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 10:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg7SL5QL6z3cGd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 18:36:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fg7Qj70r0z309C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 18:35:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fg7QN2n86z9sf9;
 Wed, 12 May 2021 10:35:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5xS9jHhKOR7; Wed, 12 May 2021 10:35:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fg7QM0vplz9sf5;
 Wed, 12 May 2021 10:35:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE3278B7D9;
 Wed, 12 May 2021 10:35:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uY2kH147d8en; Wed, 12 May 2021 10:35:06 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F2E18B7D8;
 Wed, 12 May 2021 10:35:06 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 49146641A1; Wed, 12 May 2021 08:35:06 +0000 (UTC)
Message-Id: <7d429c581dc6466c7d9978d0a066cc016c51594e.1620808468.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e457f345843aa36c6f9ef8e6cb988428ae908df5.1620808468.git.christophe.leroy@csgroup.eu>
References: <e457f345843aa36c6f9ef8e6cb988428ae908df5.1620808468.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 5/5] powerpc/kuap: Remove to/from/size parameters of
 prevent_user_access()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 12 May 2021 08:35:06 +0000 (UTC)
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

prevent_user_access() doesn't use anymore to/from/size parameters.

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     |  3 +--
 arch/powerpc/include/asm/book3s/64/kup.h     |  3 +--
 arch/powerpc/include/asm/kup.h               | 15 +++++++--------
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  3 +--
 4 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 7b88f7bdd90f..8149dae165ce 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -109,8 +109,7 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 	kuap_unlock_one((__force u32)to);
 }
 
-static __always_inline void prevent_user_access(void __user *to, const void __user *from,
-						u32 size, unsigned long dir)
+static __always_inline void prevent_user_access(unsigned long dir)
 {
 	u32 kuap = current->thread.kuap;
 
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 9700da3a4093..a1cc73a88710 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -398,8 +398,7 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 
 #endif /* !CONFIG_PPC_KUAP */
 
-static inline void prevent_user_access(void __user *to, const void __user *from,
-				       unsigned long size, unsigned long dir)
+static inline void prevent_user_access(unsigned long dir)
 {
 	set_kuap(AMR_KUAP_BLOCKED);
 	if (static_branch_unlikely(&uaccess_flush_key))
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index aa93eb4e3be5..341a064a7bfa 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -82,8 +82,7 @@ static inline unsigned long kuap_get_and_assert_locked(void)
 #ifndef CONFIG_PPC_BOOK3S_64
 static inline void allow_user_access(void __user *to, const void __user *from,
 				     unsigned long size, unsigned long dir) { }
-static inline void prevent_user_access(void __user *to, const void __user *from,
-				       unsigned long size, unsigned long dir) { }
+static inline void prevent_user_access(unsigned long dir) { }
 static inline unsigned long prevent_user_access_return(void) { return 0UL; }
 static inline void restore_user_access(unsigned long flags) { }
 #endif /* CONFIG_PPC_BOOK3S_64 */
@@ -115,33 +114,33 @@ static __always_inline void allow_read_write_user(void __user *to, const void __
 
 static __always_inline void prevent_read_from_user(const void __user *from, unsigned long size)
 {
-	prevent_user_access(NULL, from, size, KUAP_READ);
+	prevent_user_access(KUAP_READ);
 }
 
 static __always_inline void prevent_write_to_user(void __user *to, unsigned long size)
 {
-	prevent_user_access(to, NULL, size, KUAP_WRITE);
+	prevent_user_access(KUAP_WRITE);
 }
 
 static __always_inline void prevent_read_write_user(void __user *to, const void __user *from,
 						    unsigned long size)
 {
-	prevent_user_access(to, from, size, KUAP_READ_WRITE);
+	prevent_user_access(KUAP_READ_WRITE);
 }
 
 static __always_inline void prevent_current_access_user(void)
 {
-	prevent_user_access(NULL, NULL, ~0UL, KUAP_READ_WRITE);
+	prevent_user_access(KUAP_READ_WRITE);
 }
 
 static __always_inline void prevent_current_read_from_user(void)
 {
-	prevent_user_access(NULL, NULL, ~0UL, KUAP_READ);
+	prevent_user_access(KUAP_READ);
 }
 
 static __always_inline void prevent_current_write_to_user(void)
 {
-	prevent_user_access(NULL, NULL, ~0UL, KUAP_WRITE);
+	prevent_user_access(KUAP_WRITE);
 }
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 295ef5639609..61333e3b5d2b 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -48,8 +48,7 @@ static inline void allow_user_access(void __user *to, const void __user *from,
 	mtspr(SPRN_MD_AP, MD_APG_INIT);
 }
 
-static inline void prevent_user_access(void __user *to, const void __user *from,
-				       unsigned long size, unsigned long dir)
+static inline void prevent_user_access(unsigned long dir)
 {
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
-- 
2.25.0

