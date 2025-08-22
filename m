Return-Path: <linuxppc-dev+bounces-11191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D3FB31B2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7j5m0GKRz3chR;
	Sat, 23 Aug 2025 00:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755872443;
	cv=none; b=Pp4Zb3V5hZSbrOVR98fkDLKvJUH0hPGWq+uqrSZVRZ4CiC/Ar03KbRxrJvxcVTgEIE8ABDHsXaTP1yLL6go3Zkk+b1QaTF9P1jlenI6t1MyKib1NYC556kyL4VEHZMlcHH9cNkIZ6oyxaWvQPWdTBdx9idl65AAixg61sl3dZr6wFHc6VSbZY18u8YZWZ0jJWP0RMhgtKMe+x+rPh4quQfM5srUcu6UOr0TPH5s+7f6M4423bny7kkV2N8BgBVN97ZpB3xVKrfyaaniTjEhGAQUGfBG7TL4rAlwYIDFdTyQruT9KMKa/jmbRwktk5wJwGW7r+p2ZFeALAHWAdFOGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755872443; c=relaxed/relaxed;
	bh=MFG8KH6sJFPKd6Y/257k0rKMxlU0LD4tABKQyvpqMnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0uFU8FxH0fGOMbLDV5RPjOb+qdpqEW79hyJkI3WRjrc4BEFdXxVUgfKoUj2JbVar273vI/Ua/bx5LQhrqvqBJEShsN0HuH+XqkC5LE1bZ854D4ycOxEneHBxIu2rUip6aU/xnMyjecKLEpBcRpMiQ3DeEbN9hwpuRAFgA9gzattwfccXFV5DNzfSBUexlNLLYLUoW9WeOwbwb0pyNLuE9nhHRy3h1FszvALms6rtWyM08mQ8s1rKwqWgjle7vJ76s1NnmTlXPvLNSbNkFLlTcuaUS6zWzDza7yfRnG45fG6dCigcYf63+qGVFUzsiLW7wi5a/aM2Ht3T4qHS7XRTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7j5j47R6z3chK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:20:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c7bGt1fvqz9sSd;
	Fri, 22 Aug 2025 11:58:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nA9tiptLvbS4; Fri, 22 Aug 2025 11:58:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c7bGt0fxTz9sSc;
	Fri, 22 Aug 2025 11:58:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2A058B781;
	Fri, 22 Aug 2025 11:58:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xGJtbDV9gyfJ; Fri, 22 Aug 2025 11:58:13 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 00A1D8B775;
	Fri, 22 Aug 2025 11:58:12 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
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
	Linus Torvalds <torvalds@linux-foundation.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-block@vger.kernel.org
Subject: [PATCH v2 07/10] powerpc/uaccess: Refactor user_{read/write/}_access_begin()
Date: Fri, 22 Aug 2025 11:58:03 +0200
Message-ID: <cd88a8e7b9af97c0cab84fc4b9dec74f10932568.1755854833.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755854833.git.christophe.leroy@csgroup.eu>
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755856679; l=3531; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=f9F9/cRuytydLUtTkyZlSioNNHJr4smVC+NwESq3LiE=; b=iGg6YdGAsWyUK0iNyg6FWIwUKR9y2x0CwCJ+wXEjuvZEm5CU7Pic2aw23YM8P5L+Yc1baQWjs 9Okn+6PeCsDCvFYf0Q9gOtBhSQ0ERuHaxTeQbnXZTGDNJug9EN2Om79
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

user_read_access_begin() and user_write_access_begin() and
user_access_begin() are now very similar. Create a common
__user_access_begin() that take direction as parameter.

In order to avoid a warning with the conditional call of
barrier_nospec() which is sometimes an empty macro, change it to a
do {} while (0).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: New
---
 arch/powerpc/include/asm/barrier.h |  2 +-
 arch/powerpc/include/asm/uaccess.h | 46 +++++++++---------------------
 2 files changed, 14 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index b95b666f0374..7acbf27cac6c 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -102,7 +102,7 @@ do {									\
 
 #else /* !CONFIG_PPC_BARRIER_NOSPEC */
 #define barrier_nospec_asm
-#define barrier_nospec()
+#define barrier_nospec()	do {} while (0)
 #endif /* CONFIG_PPC_BARRIER_NOSPEC */
 
 /*
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 698996f34891..49254f7d9069 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -410,50 +410,30 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
 extern long __copy_from_user_flushcache(void *dst, const void __user *src,
 		unsigned size);
 
-static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
+static __must_check __always_inline bool __user_access_begin(const void __user *ptr, size_t len,
+							     unsigned long dir)
 {
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
 
 	might_fault();
 
-	barrier_nospec();
-	allow_read_write_user((void __user *)ptr, ptr, len);
+	if (dir & KUAP_READ)
+		barrier_nospec();
+	allow_user_access((void __user *)ptr, dir);
 	return true;
 }
-#define user_access_begin	user_access_begin
-#define user_access_end		prevent_current_access_user
-#define user_access_save	prevent_user_access_return
-#define user_access_restore	restore_user_access
 
-static __must_check __always_inline bool
-user_read_access_begin(const void __user *ptr, size_t len)
-{
-	if (unlikely(!access_ok(ptr, len)))
-		return false;
+#define user_access_begin(p, l)		__user_access_begin(p, l, KUAP_READ_WRITE)
+#define user_read_access_begin(p, l)	__user_access_begin(p, l, KUAP_READ)
+#define user_write_access_begin(p, l)	__user_access_begin(p, l, KUAP_WRITE)
 
-	might_fault();
-
-	barrier_nospec();
-	allow_read_from_user(ptr, len);
-	return true;
-}
-#define user_read_access_begin	user_read_access_begin
-#define user_read_access_end		prevent_current_read_from_user
+#define user_access_end()		prevent_user_access(KUAP_READ_WRITE)
+#define user_read_access_end()		prevent_user_access(KUAP_READ)
+#define user_write_access_end()		prevent_user_access(KUAP_WRITE)
 
-static __must_check __always_inline bool
-user_write_access_begin(const void __user *ptr, size_t len)
-{
-	if (unlikely(!access_ok(ptr, len)))
-		return false;
-
-	might_fault();
-
-	allow_write_to_user((void __user *)ptr, len);
-	return true;
-}
-#define user_write_access_begin	user_write_access_begin
-#define user_write_access_end		prevent_current_write_to_user
+#define user_access_save	prevent_user_access_return
+#define user_access_restore	restore_user_access
 
 #define unsafe_get_user(x, p, e) do {					\
 	__long_type(*(p)) __gu_val;				\
-- 
2.49.0


