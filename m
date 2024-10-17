Return-Path: <linuxppc-dev+bounces-2354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C299A301A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 23:55:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV1q84nrfz2yNJ;
	Fri, 18 Oct 2024 08:55:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729202132;
	cv=none; b=nC5GLrShSEaSrhpy+yi27Q1wDU5wvWKDehniTqG26HMpZKM3Nxcw5jsPRY2KgjjmhVyVBBvwWXH8JrUtom/q9c+jXIBDu0/gnyIzQn7h63ecCoLRAbvliHe4nA+GuHuQ5TQ+7Cgg2xN90YA3UUcpiCxkr5drXesoHMFb0GcRfRkRZanHOjBaZG6qKZRPHcZlWsRLQgfn3/e9yep6bjWAzkk34nl1weQMyRtAYFH6gsNKXZDVNTlFDZfSYvKNHG3pTFBs+8eGLRjguKUl97gYRHl2DoXkD7/YVJEEWX80E3G8Ao471bbFdP8/In3PPUSItnm+z8thkpGmcVSzEdDGug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729202132; c=relaxed/relaxed;
	bh=xZSrk6yZJlcU1f/diA7MgQsxzKkKRPfd3XHK4KyCq8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ba8uTJinGxBX2lZOud9hwNcXAIvKbWTG3rKNaOUSNggy/ZBfv04Uw9QGC9ai4TVt8/OS72h2+KercriE9upBI9okt6gaKhYtTCzWv6zAJ0fyOP7HAUxEoftbaA8Z2RWiY2UgcKztKepUwg7Q/m55NZ9+Fm6JcKxgVS3o+zesvDNGCHNMWLtvWthNdKjMhMNl/EReWqPSi6Ev8APLpAe5Le0FofEyvt8woMhbkFmQE/xxUQo66FK9c4H4G5owgvpNw0ewJnQSyIDrycLwCAlUzHrqrvOw0I94TR2nD0KM9rLw9Lqh3UxRIyq3zi5fCt0hnSgnGV8Kf8Twhh47Lf8F6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uKQDXOec; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uKQDXOec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV1q71f1xz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 08:55:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 147B95C5AF5;
	Thu, 17 Oct 2024 21:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC073C4CED0;
	Thu, 17 Oct 2024 21:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729202128;
	bh=NSb0CuZFRxLsMtRmJayyQ03cyCTlxrCnGaQiC+w0oD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uKQDXOecdhFeWVcjmHYzxDjck9if1H7eA1+6f7NoHaSKzm99ot5/BncF/3PLUnbAh
	 RsJ7nB42/0UWG4+wIvyIna1c/vVySuR/JHzeYr/MJO63eiW2SKqcm4YmcZILD0EMv4
	 YHTgd4DfquTsJNoGTCEUdsUNZ9188sXWqzp2a6fQoIM72e1F929co1n+Mw9ljovj0q
	 wDdpYy1Vg6vEUx1jqAnmhgtzpw6DlmcpWR6hwWzIPCvf3bRNulPzegEizm04h1/bF+
	 cIsU8uiR2lVTLesSQzVBqpt6zepx/S73bzxCEFmtSxfFgGIy3L8IZsoalquT9dLCyn
	 gzwgKm5qNOFFg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: [PATCH v2 1/6] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Date: Thu, 17 Oct 2024 14:55:20 -0700
Message-ID: <e3e3698c7b891811bb1133cc7fde9a30c8b0e00a.1729201904.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729201904.git.jpoimboe@kernel.org>
References: <cover.1729201904.git.jpoimboe@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For x86-64, the barrier_nospec() in copy_from_user() is overkill and
painfully slow.  Instead, use pointer masking to force the user pointer
to a non-kernel value in speculative paths.

To avoid regressing powerpc, move the barrier_nospec() to the powerpc
raw_copy_from_user() implementation so there's no functional change.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/powerpc/include/asm/uaccess.h | 2 ++
 arch/x86/include/asm/uaccess_64.h  | 7 ++++---
 arch/x86/lib/getuser.S             | 2 +-
 arch/x86/lib/putuser.S             | 2 +-
 include/linux/uaccess.h            | 6 ------
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 4f5a46a77fa2..12abb8bf5eda 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -7,6 +7,7 @@
 #include <asm/extable.h>
 #include <asm/kup.h>
 #include <asm/asm-compat.h>
+#include <asm/barrier.h>
 
 #ifdef __powerpc64__
 /* We use TASK_SIZE_USER64 as TASK_SIZE is not constant */
@@ -341,6 +342,7 @@ static inline unsigned long raw_copy_from_user(void *to,
 {
 	unsigned long ret;
 
+	barrier_nospec();
 	allow_read_from_user(from, n);
 	ret = __copy_tofrom_user((__force void __user *)to, from, n);
 	prevent_read_from_user(from, n);
diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index afce8ee5d7b7..61693028ea2b 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -54,11 +54,11 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
 #define valid_user_address(x) ((__force long)(x) >= 0)
 
 /*
- * Masking the user address is an alternative to a conditional
- * user_access_begin that can avoid the fencing. This only works
- * for dense accesses starting at the address.
+ * If it's a kernel address, force it to all 1's.  This prevents a mispredicted
+ * access_ok() from speculatively accessing kernel space.
  */
 #define mask_user_address(x) ((typeof(x))((long)(x)|((long)(x)>>63)))
+
 #define masked_user_access_begin(x) ({				\
 	__auto_type __masked_ptr = (x);				\
 	__masked_ptr = mask_user_address(__masked_ptr);		\
@@ -133,6 +133,7 @@ copy_user_generic(void *to, const void *from, unsigned long len)
 static __always_inline __must_check unsigned long
 raw_copy_from_user(void *dst, const void __user *src, unsigned long size)
 {
+	src = mask_user_address(src);
 	return copy_user_generic(dst, (__force void *)src, size);
 }
 
diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index d066aecf8aeb..094224ec9dca 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -39,7 +39,7 @@
 
 .macro check_range size:req
 .if IS_ENABLED(CONFIG_X86_64)
-	mov %rax, %rdx
+	mov %rax, %rdx		/* mask_user_address() */
 	sar $63, %rdx
 	or %rdx, %rax
 .else
diff --git a/arch/x86/lib/putuser.S b/arch/x86/lib/putuser.S
index 975c9c18263d..09b7e37934ab 100644
--- a/arch/x86/lib/putuser.S
+++ b/arch/x86/lib/putuser.S
@@ -34,7 +34,7 @@
 
 .macro check_range size:req
 .if IS_ENABLED(CONFIG_X86_64)
-	mov %rcx, %rbx
+	mov %rcx, %rbx		/* mask_user_address() */
 	sar $63, %rbx
 	or %rbx, %rcx
 .else
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 39c7cf82b0c2..dda9725a9559 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -160,12 +160,6 @@ _inline_copy_from_user(void *to, const void __user *from, unsigned long n)
 	unsigned long res = n;
 	might_fault();
 	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
-		/*
-		 * Ensure that bad access_ok() speculation will not
-		 * lead to nasty side effects *after* the copy is
-		 * finished:
-		 */
-		barrier_nospec();
 		instrument_copy_from_user_before(to, from, n);
 		res = raw_copy_from_user(to, from, n);
 		instrument_copy_from_user_after(to, from, n, res);
-- 
2.47.0


