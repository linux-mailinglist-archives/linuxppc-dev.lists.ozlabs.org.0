Return-Path: <linuxppc-dev+bounces-13024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB99CBEB1DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 19:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpC5Z1ZYdz3cZt;
	Sat, 18 Oct 2025 04:50:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760723410;
	cv=none; b=SW2NTdFOotYZ03AMVCb3mUFetYYixiVJijQLxM//D49sGrolpUlPcYJda53jlfvT+woWshU3n6IWXgYLKmXOy8BhndaQle2kt3fZRkkEM9EfOdN4Xz9+WZq8HijeAj40g2s+5OCuXnNr43pwQXXNSWd088ZF4eauHIoZ7QLdzak2VeBlHLCMKBVNQ54qJU/ERDQO+uEJR7ipZlN9AiJHkAUBgpe4h5QLjxEErnnd2vj4/1REWmtkFD+wsKKM1AjAUgwNsI6eFza1oWDdWLtEGjxfaj6EOY8GJhqQaFIdbCC3pzU8LHRVMwtROr1zwDBL7gwcF6pY8lC9c9w3RAnh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760723410; c=relaxed/relaxed;
	bh=JZ0g8/QEQOfW1bFWJQa+4/RvhR7Tj2t7D98IyuG9u7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xvz3N1eIiHW/8wVw47Yv4w35Wh5vcbvtUxApbDlxNWiwqsUbofuth7u6LBqkQGtcEvk9f/vL5wijQ5oooOSKgC0PXZCokpktb3+xDNaWSkM6+km6A38d43F2AiqOPZgiYgqd4cGK/0WXE89EWFA1bdD4agyI7wizMKVcXChnkRHlKRqU1zvxVX86xGzn+JKpaxZPkPIUS2aHE7W6dfHg/CfGJUFt7EFOGcfCUeelSV5dLdEKOMZ/HrtnIatMlY3bofn/e5r6XLz6LjJSYmySOCmMSVAM1aNKEYwI3tb8hIEspvKzGDbUJMNfOhb67g6R/cemhY0qboWNxDKHwgPcig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpC5Y4tnMz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 04:50:09 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cp17t6Wdvz9sSh;
	Fri, 17 Oct 2025 12:21:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWBO7AuKPMGU; Fri, 17 Oct 2025 12:21:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cp17t5YRjz9sSg;
	Fri, 17 Oct 2025 12:21:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A8CC18B786;
	Fri, 17 Oct 2025 12:21:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5Sd_UtXEJfxn; Fri, 17 Oct 2025 12:21:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D0DA8B776;
	Fri, 17 Oct 2025 12:21:29 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/10] powerpc/uaccess: Remove {allow/prevent}_{read/write/read_write}_{from/to/}_user()
Date: Fri, 17 Oct 2025 12:21:02 +0200
Message-ID: <17a008d24903f50a2ae55df795d1c51c684f5183.1760529207.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1760529207.git.christophe.leroy@csgroup.eu>
References: <cover.1760529207.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5385; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=y3f64tKhN7ET5qx1JK+lbghEU+YrDp/rltVLgFdTK8s=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR8kpj86PdGjql6NumX9O8vYD6j3V247N7WC7qpSss09 mXxrk5a2lHKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAmsmsKwx+u+tgFOa471AyZ G1/U2XzimNz+yyZlj1Lb5PzbRce4FFQZGWaqa6q68lh9ecXJtbF1ik1C58Hds04knZSMXNURV66 cxAQA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The six following functions have become simple single-line fonctions
that do not have much added value anymore:
- allow_read_from_user()
- allow_write_to_user()
- allow_read_write_user()
- prevent_read_from_user()
- prevent_write_to_user()
- prevent_read_write_user()

Directly call allow_user_access() and prevent_user_access(), it doesn't
reduce the readability and it removes unnecessary middle functions.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: New
---
 arch/powerpc/include/asm/kup.h     | 47 ------------------------------
 arch/powerpc/include/asm/uaccess.h | 30 +++++++++----------
 2 files changed, 15 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 3963584ac1cf1..4a4145a244f29 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -131,53 +131,6 @@ static __always_inline void kuap_assert_locked(void)
 		kuap_get_and_assert_locked();
 }
 
-static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
-{
-	allow_user_access(NULL, KUAP_READ);
-}
-
-static __always_inline void allow_write_to_user(void __user *to, unsigned long size)
-{
-	allow_user_access(to, KUAP_WRITE);
-}
-
-static __always_inline void allow_read_write_user(void __user *to, const void __user *from,
-						  unsigned long size)
-{
-	allow_user_access(to, KUAP_READ_WRITE);
-}
-
-static __always_inline void prevent_read_from_user(const void __user *from, unsigned long size)
-{
-	prevent_user_access(KUAP_READ);
-}
-
-static __always_inline void prevent_write_to_user(void __user *to, unsigned long size)
-{
-	prevent_user_access(KUAP_WRITE);
-}
-
-static __always_inline void prevent_read_write_user(void __user *to, const void __user *from,
-						    unsigned long size)
-{
-	prevent_user_access(KUAP_READ_WRITE);
-}
-
-static __always_inline void prevent_current_access_user(void)
-{
-	prevent_user_access(KUAP_READ_WRITE);
-}
-
-static __always_inline void prevent_current_read_from_user(void)
-{
-	prevent_user_access(KUAP_READ);
-}
-
-static __always_inline void prevent_current_write_to_user(void)
-{
-	prevent_user_access(KUAP_WRITE);
-}
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_POWERPC_KUAP_H_ */
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 3987a5c33558b..698996f348914 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -45,14 +45,14 @@
 	do {							\
 		__label__ __pu_failed;				\
 								\
-		allow_write_to_user(__pu_addr, __pu_size);	\
+		allow_user_access(__pu_addr, KUAP_WRITE);	\
 		__put_user_size_goto(__pu_val, __pu_addr, __pu_size, __pu_failed);	\
-		prevent_write_to_user(__pu_addr, __pu_size);	\
+		prevent_user_access(KUAP_WRITE);		\
 		__pu_err = 0;					\
 		break;						\
 								\
 __pu_failed:							\
-		prevent_write_to_user(__pu_addr, __pu_size);	\
+		prevent_user_access(KUAP_WRITE);		\
 		__pu_err = -EFAULT;				\
 	} while (0);						\
 								\
@@ -302,9 +302,9 @@ do {								\
 								\
 	might_fault();					\
 	barrier_nospec();					\
-	allow_read_from_user(__gu_addr, __gu_size);		\
+	allow_user_access(NULL, KUAP_READ);		\
 	__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);	\
-	prevent_read_from_user(__gu_addr, __gu_size);		\
+	prevent_user_access(KUAP_READ);				\
 	(x) = (__typeof__(*(ptr)))__gu_val;			\
 								\
 	__gu_err;						\
@@ -331,9 +331,9 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 	unsigned long ret;
 
 	barrier_nospec();
-	allow_read_write_user(to, from, n);
+	allow_user_access(to, KUAP_READ_WRITE);
 	ret = __copy_tofrom_user(to, from, n);
-	prevent_read_write_user(to, from, n);
+	prevent_user_access(KUAP_READ_WRITE);
 	return ret;
 }
 #endif /* __powerpc64__ */
@@ -343,9 +343,9 @@ static inline unsigned long raw_copy_from_user(void *to,
 {
 	unsigned long ret;
 
-	allow_read_from_user(from, n);
+	allow_user_access(NULL, KUAP_READ);
 	ret = __copy_tofrom_user((__force void __user *)to, from, n);
-	prevent_read_from_user(from, n);
+	prevent_user_access(KUAP_READ);
 	return ret;
 }
 
@@ -354,9 +354,9 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	unsigned long ret;
 
-	allow_write_to_user(to, n);
+	allow_user_access(to, KUAP_WRITE);
 	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
-	prevent_write_to_user(to, n);
+	prevent_user_access(KUAP_WRITE);
 	return ret;
 }
 
@@ -367,9 +367,9 @@ static inline unsigned long __clear_user(void __user *addr, unsigned long size)
 	unsigned long ret;
 
 	might_fault();
-	allow_write_to_user(addr, size);
+	allow_user_access(addr, KUAP_WRITE);
 	ret = __arch_clear_user(addr, size);
-	prevent_write_to_user(addr, size);
+	prevent_user_access(KUAP_WRITE);
 	return ret;
 }
 
@@ -397,9 +397,9 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
 {
 	if (check_copy_size(from, n, true)) {
 		if (access_ok(to, n)) {
-			allow_write_to_user(to, n);
+			allow_user_access(to, KUAP_WRITE);
 			n = copy_mc_generic((void __force *)to, from, n);
-			prevent_write_to_user(to, n);
+			prevent_user_access(KUAP_WRITE);
 		}
 	}
 
-- 
2.49.0


