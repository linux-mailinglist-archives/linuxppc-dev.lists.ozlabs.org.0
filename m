Return-Path: <linuxppc-dev+bounces-9611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C3AE2F86
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 13:21:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQ80k0lNdz30VR;
	Sun, 22 Jun 2025 21:21:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750591270;
	cv=none; b=nKvDSJtltW4d/DqRYtdf/8T1ffN+KuvP4OEMLBWSQEOLb5qsV6JNJxBX/kNQRGVxXtkIzvpSngVQVeCQdSFpVkgRLD4/2XFnQ9c02aEBN/Xum7slxqHr0uPJ+Dtq7RpIuvuWN3xvPm+QjzK+Tt+2DS86mP4rq40gl/4iJ7gj7QnkApslCZ8COoxLiSCkTibnHmmc+QwdY6iiZCwWNu9gEhz8/jgtQCJjgwG1cABmBHOuRj01XBoHWuM+fCPCKhJhiag5xQioRTnW5fp0YTwrwpzSrXBYnVFEegfLm0OaigWJO+NLbRaD/J0FFfw8cc9Qyo3CL+5tU27Y6yEPI4hb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750591270; c=relaxed/relaxed;
	bh=kfRb+TmvSKUex7PbD1TUJ7CY38Zs+MGTcdXYSTPr1Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMuV3hYylVQv743m8cYrVVHB4QdshXzPNXpJHj0kOapfpx4+K+dciRY8Y+fJkZ6jpSBv3+951LFDmAhk32cBmzWH0FmG6GkU0PtcChnOFdV8rmdkSQQUfKABT+KY6GmzFFng2LhSC58RwfdLDJ+oB50AHdaaJTJN9+bG/yew/DpC4c0Q6QOifAp/0RVw8D5+axg0QLvyMZ/N9/q6MybeAvpkEeEiLH2qjFq1X3xVteGxgzLMvWpSSEflmGXUYkl9aJTScORx1N8nAVRvEGbc1wVhUM7dC9570Xvmt8Ov0j/k7wQ91NfG6St68uLMv1zY4di6qdr9e1JIpWSjSmLKdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQ80j2V2Qz30VM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 21:21:07 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQ62p3Ttmz9sZD;
	Sun, 22 Jun 2025 11:52:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FkHDcQTmUzv; Sun, 22 Jun 2025 11:52:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQ62p2bPnz9sXD;
	Sun, 22 Jun 2025 11:52:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 50BE08B765;
	Sun, 22 Jun 2025 11:52:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id B7f7mpVTx9fe; Sun, 22 Jun 2025 11:52:50 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 598B58B764;
	Sun, 22 Jun 2025 11:52:49 +0200 (CEST)
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
Subject: [PATCH 1/5] uaccess: Add masked_user_{read/write}_access_begin
Date: Sun, 22 Jun 2025 11:52:39 +0200
Message-ID: <6fddae0cf0da15a6521bb847b63324b7a2a067b1.1750585239.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750585958; l=3699; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=aBr5ug3pbfIIRk62LUQKZ+EqAMQWAhKPmPnsru18T2w=; b=aJLPxkFnAJjAAnY0M+etgKWknkSFXagT8tFBPQmYzWl+GOTm3envK6GdDSt+ZAJhzvqm23pRc 8C2dbv0jA/oBse2u5aACyUyBHpCpJRg5EdA/oAqEDbh/PIRmkp3wF2J
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Allthough masked_user_access_begin() seems to only be used when reading
data from user at the moment, introduce masked_user_read_access_begin()
and masked_user_write_access_begin() in order to match
user_read_access_begin() and user_write_access_begin().

Have them default to masked_user_access_begin() when they are
not defined.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 fs/select.c             | 2 +-
 include/linux/uaccess.h | 8 ++++++++
 kernel/futex/futex.h    | 4 ++--
 lib/strncpy_from_user.c | 2 +-
 lib/strnlen_user.c      | 2 +-
 5 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/select.c b/fs/select.c
index 9fb650d03d52..d8547bedf5eb 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -777,7 +777,7 @@ static inline int get_sigset_argpack(struct sigset_argpack *to,
 	// the path is hot enough for overhead of copy_from_user() to matter
 	if (from) {
 		if (can_do_masked_user_access())
-			from = masked_user_access_begin(from);
+			from = masked_user_read_access_begin(from);
 		else if (!user_read_access_begin(from, sizeof(*from)))
 			return -EFAULT;
 		unsafe_get_user(to->p, &from->p, Efault);
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 7c06f4795670..682a0cd2fe51 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -41,6 +41,14 @@
  #define mask_user_address(src) (src)
 #endif
 
+#ifndef masked_user_write_access_begin
+#define masked_user_write_access_begin masked_user_access_begin
+#endif
+#ifndef masked_user_read_access_begin
+#define masked_user_read_access_begin masked_user_access_begin
+#endif
+
+
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
  * and get rid of their private instances of copy_{to,from}_user() and
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index fcd1617212ee..6cfcafa00736 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -305,7 +305,7 @@ static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
 	u32 val;
 
 	if (can_do_masked_user_access())
-		from = masked_user_access_begin(from);
+		from = masked_user_read_access_begin(from);
 	else if (!user_read_access_begin(from, sizeof(*from)))
 		return -EFAULT;
 	unsafe_get_user(val, from, Efault);
@@ -320,7 +320,7 @@ static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
 static __always_inline int futex_put_value(u32 val, u32 __user *to)
 {
 	if (can_do_masked_user_access())
-		to = masked_user_access_begin(to);
+		to = masked_user_read_access_begin(to);
 	else if (!user_read_access_begin(to, sizeof(*to)))
 		return -EFAULT;
 	unsafe_put_user(val, to, Efault);
diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index 6dc234913dd5..5bb752ff7c61 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -126,7 +126,7 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 	if (can_do_masked_user_access()) {
 		long retval;
 
-		src = masked_user_access_begin(src);
+		src = masked_user_read_access_begin(src);
 		retval = do_strncpy_from_user(dst, src, count, count);
 		user_read_access_end();
 		return retval;
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 6e489f9e90f1..4a6574b67f82 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -99,7 +99,7 @@ long strnlen_user(const char __user *str, long count)
 	if (can_do_masked_user_access()) {
 		long retval;
 
-		str = masked_user_access_begin(str);
+		str = masked_user_read_access_begin(str);
 		retval = do_strnlen_user(str, count, count);
 		user_read_access_end();
 		return retval;
-- 
2.49.0


