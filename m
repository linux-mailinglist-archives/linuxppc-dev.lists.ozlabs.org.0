Return-Path: <linuxppc-dev+bounces-9614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24926AE2FF4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 14:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQ9zz4tSnz30Tf;
	Sun, 22 Jun 2025 22:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750596639;
	cv=none; b=TMs4k9ArnG9ceHXB99+jgosHNnKXENc/5e+spT9hhPQLh6dn/3oaENU6dDAEoyNAjt0UzjTBEse3xnKBlrdJJvXz/rx4LGXM8NSg3zlEo/EbzoAbfnhiC1rHOIEznvLkdZbRcCuodyx1koPwAE1TNxgQ3gYw0xTdB+3qr8c1sEHfIQRYC7z4ZQa1OgcaPTP+JDKqobxbMS+G2w86slqmLdwzX/fO/wPB2VGiDrtP2KddJYiYA0QJdz1kN5KBmsKWMcy4geWo/+93mHLB1jVcFbG3wCywu4cblCqeEkrxWQ2T0R4S9SybxMbJkY88lZJS3PgLP6R9zWT1FOPWT4L/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750596639; c=relaxed/relaxed;
	bh=enzeZUj+kKxYmtyCZSW9Sx+o5ZoEi/BDEDgBPT3rIG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dtmx+DmGJWlrw2CZM3dG2c93qhBa8boW1+7p7XfduBq7/stlu4PjIVRnO2MF5Lo4oSINsH3fd945Hw5cQbEt3WUXznxZxt+kp7ElOLcJ1JmRHepSr3m0SM1Z94ZECBSOrWOiTNvc0VE4RoWuNGwzwas6VBiWpS6iGyaZwb6fr3rz6/SxLYzue8cKKV5DqHk2STeZVKtwQJNr3fDcW4pechz6dv81WWz+7NXBhTm/JCZrhypYqUC30lbWAvwvBdYbxx6CH6kpldsRVto4yQtnoyV32xq/HqUrQyCVWr46MfEwUbmF6yFZGTw4zD4OBdJcTBnJAvnvdOjIZqa9lroeqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQ9zy2myjz30GV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 22:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQ62r3M2Lz9sd1;
	Sun, 22 Jun 2025 11:52:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7xjR-bygz_Z; Sun, 22 Jun 2025 11:52:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQ62r2Lkzz9scZ;
	Sun, 22 Jun 2025 11:52:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 48ECC8B765;
	Sun, 22 Jun 2025 11:52:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LyA231yFeiNX; Sun, 22 Jun 2025 11:52:52 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 43EF68B763;
	Sun, 22 Jun 2025 11:52:51 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 3/5] powerpc: Remove unused size parametre to KUAP enabling/disabling functions
Date: Sun, 22 Jun 2025 11:52:41 +0200
Message-ID: <6b6667bce077c6a55c93142695cb54efbedf1578.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750585239.git.christophe.leroy@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750585958; l=9539; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2Vc/SRI5ImEjhEPkBWs4KWXB6VDzEnBrqeyy8uayrnc=; b=pgIyHdQmTj0l2CprTPPslHZ/hvyn8SgStdIZt2ews0GTf9CH5MYRSSYqe5Vw5e5H0LC9wCo3y 0/f8jyZNx7+CcFCgf4PL0e7aYJchjIdzOSMr/hHGxCc0DlVvkX8LxsZ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since commit 16132529cee5 ("powerpc/32s: Rework Kernel Userspace
Access Protection") the size parameter is unused on all platforms.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     |  2 +-
 arch/powerpc/include/asm/book3s/64/kup.h     |  4 +--
 arch/powerpc/include/asm/kup.h               | 22 ++++++------
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  2 +-
 arch/powerpc/include/asm/nohash/kup-booke.h  |  2 +-
 arch/powerpc/include/asm/uaccess.h           | 36 ++++++++++----------
 6 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 4e14a5427a63..8ea68d136152 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -98,7 +98,7 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 #define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      u32 size, unsigned long dir)
+					      unsigned long dir)
 {
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 497a7bd31ecc..853fa2fb12be 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -354,7 +354,7 @@ __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 }
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+					      unsigned long dir)
 {
 	unsigned long thread_amr = 0;
 
@@ -384,7 +384,7 @@ static __always_inline unsigned long get_kuap(void)
 static __always_inline void set_kuap(unsigned long value) { }
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+					      unsigned long dir)
 { }
 
 #endif /* !CONFIG_PPC_KUAP */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 2bb03d941e3e..4c70be11b99a 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -73,7 +73,7 @@ static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned
  */
 #ifndef CONFIG_PPC_BOOK3S_64
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir) { }
+					      unsigned long dir) { }
 static __always_inline void prevent_user_access(unsigned long dir) { }
 static __always_inline unsigned long prevent_user_access_return(void) { return 0UL; }
 static __always_inline void restore_user_access(unsigned long flags) { }
@@ -132,36 +132,34 @@ static __always_inline void kuap_assert_locked(void)
 		kuap_get_and_assert_locked();
 }
 
-static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
+static __always_inline void allow_read_from_user(const void __user *from)
 {
 	barrier_nospec();
-	allow_user_access(NULL, from, size, KUAP_READ);
+	allow_user_access(NULL, from, KUAP_READ);
 }
 
-static __always_inline void allow_write_to_user(void __user *to, unsigned long size)
+static __always_inline void allow_write_to_user(void __user *to)
 {
-	allow_user_access(to, NULL, size, KUAP_WRITE);
+	allow_user_access(to, NULL, KUAP_WRITE);
 }
 
-static __always_inline void allow_read_write_user(void __user *to, const void __user *from,
-						  unsigned long size)
+static __always_inline void allow_read_write_user(void __user *to, const void __user *from)
 {
 	barrier_nospec();
-	allow_user_access(to, from, size, KUAP_READ_WRITE);
+	allow_user_access(to, from, KUAP_READ_WRITE);
 }
 
-static __always_inline void prevent_read_from_user(const void __user *from, unsigned long size)
+static __always_inline void prevent_read_from_user(const void __user *from)
 {
 	prevent_user_access(KUAP_READ);
 }
 
-static __always_inline void prevent_write_to_user(void __user *to, unsigned long size)
+static __always_inline void prevent_write_to_user(void __user *to)
 {
 	prevent_user_access(KUAP_WRITE);
 }
 
-static __always_inline void prevent_read_write_user(void __user *to, const void __user *from,
-						    unsigned long size)
+static __always_inline void prevent_read_write_user(void __user *to, const void __user *from)
 {
 	prevent_user_access(KUAP_READ_WRITE);
 }
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 46bc5925e5fd..c2b32b392d41 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -50,7 +50,7 @@ static __always_inline void uaccess_end_8xx(void)
 }
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+					      unsigned long dir)
 {
 	uaccess_begin_8xx(MD_APG_INIT);
 }
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 0c7c3258134c..6035d51af3cd 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -74,7 +74,7 @@ static __always_inline void uaccess_end_booke(void)
 }
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+					      unsigned long dir)
 {
 	uaccess_begin_booke(current->thread.pid);
 }
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 4f5a46a77fa2..dd5cf325ecde 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -45,14 +45,14 @@
 	do {							\
 		__label__ __pu_failed;				\
 								\
-		allow_write_to_user(__pu_addr, __pu_size);	\
+		allow_write_to_user(__pu_addr);			\
 		__put_user_size_goto(__pu_val, __pu_addr, __pu_size, __pu_failed);	\
-		prevent_write_to_user(__pu_addr, __pu_size);	\
+		prevent_write_to_user(__pu_addr);		\
 		__pu_err = 0;					\
 		break;						\
 								\
 __pu_failed:							\
-		prevent_write_to_user(__pu_addr, __pu_size);	\
+		prevent_write_to_user(__pu_addr);		\
 		__pu_err = -EFAULT;				\
 	} while (0);						\
 								\
@@ -301,9 +301,9 @@ do {								\
 	__typeof__(sizeof(*(ptr))) __gu_size = sizeof(*(ptr));	\
 								\
 	might_fault();					\
-	allow_read_from_user(__gu_addr, __gu_size);		\
+	allow_read_from_user(__gu_addr);			\
 	__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);	\
-	prevent_read_from_user(__gu_addr, __gu_size);		\
+	prevent_read_from_user(__gu_addr);			\
 	(x) = (__typeof__(*(ptr)))__gu_val;			\
 								\
 	__gu_err;						\
@@ -329,9 +329,9 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 {
 	unsigned long ret;
 
-	allow_read_write_user(to, from, n);
+	allow_read_write_user(to, from);
 	ret = __copy_tofrom_user(to, from, n);
-	prevent_read_write_user(to, from, n);
+	prevent_read_write_user(to, from);
 	return ret;
 }
 #endif /* __powerpc64__ */
@@ -341,9 +341,9 @@ static inline unsigned long raw_copy_from_user(void *to,
 {
 	unsigned long ret;
 
-	allow_read_from_user(from, n);
+	allow_read_from_user(from);
 	ret = __copy_tofrom_user((__force void __user *)to, from, n);
-	prevent_read_from_user(from, n);
+	prevent_read_from_user(from);
 	return ret;
 }
 
@@ -352,9 +352,9 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	unsigned long ret;
 
-	allow_write_to_user(to, n);
+	allow_write_to_user(to);
 	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
-	prevent_write_to_user(to, n);
+	prevent_write_to_user(to);
 	return ret;
 }
 
@@ -365,9 +365,9 @@ static inline unsigned long __clear_user(void __user *addr, unsigned long size)
 	unsigned long ret;
 
 	might_fault();
-	allow_write_to_user(addr, size);
+	allow_write_to_user(addr);
 	ret = __arch_clear_user(addr, size);
-	prevent_write_to_user(addr, size);
+	prevent_write_to_user(addr);
 	return ret;
 }
 
@@ -395,9 +395,9 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
 {
 	if (check_copy_size(from, n, true)) {
 		if (access_ok(to, n)) {
-			allow_write_to_user(to, n);
+			allow_write_to_user(to);
 			n = copy_mc_generic((void __force *)to, from, n);
-			prevent_write_to_user(to, n);
+			prevent_write_to_user(to);
 		}
 	}
 
@@ -415,7 +415,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 
 	might_fault();
 
-	allow_read_write_user((void __user *)ptr, ptr, len);
+	allow_read_write_user((void __user *)ptr, ptr);
 	return true;
 }
 #define user_access_begin	user_access_begin
@@ -431,7 +431,7 @@ user_read_access_begin(const void __user *ptr, size_t len)
 
 	might_fault();
 
-	allow_read_from_user(ptr, len);
+	allow_read_from_user(ptr);
 	return true;
 }
 #define user_read_access_begin	user_read_access_begin
@@ -445,7 +445,7 @@ user_write_access_begin(const void __user *ptr, size_t len)
 
 	might_fault();
 
-	allow_write_to_user((void __user *)ptr, len);
+	allow_write_to_user((void __user *)ptr);
 	return true;
 }
 #define user_write_access_begin	user_write_access_begin
-- 
2.49.0


