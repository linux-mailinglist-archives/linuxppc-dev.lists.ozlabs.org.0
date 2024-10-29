Return-Path: <linuxppc-dev+bounces-2659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06D9B3FFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 02:57:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctfN6ty9z2yQj;
	Tue, 29 Oct 2024 12:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167004;
	cv=none; b=NDV/jkI+V21C0u7mmRe6lH0eCN/uS6RMrT6jjBpllyInYvh1emmwzwLZNQYxQQDKQP2kgAcGEEZbMWuTppUO3zb8FjXhTPIAx9UhmHxHsVk4TG8BeI+i353ADAUdTpYqmGp4WX+CZh9PVNXV4In5/VtWyIPt+1Rc8jaFm1QZpar9hxwYuhhliy76BjaGiURtsUuXrxSERSS4dFSOpysxS+xSp+0Ws23vdosjeuYK1C5Jg75zdeqjYnhYvreO0s+ZP9wZQBQaS+enYPiG6dZggDYp6zyPwsTL5RJJcTfjQ8jZ7B7mMPXqK1aU5Huu1tGw+3PVBIkN1atbpGuslWcVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167004; c=relaxed/relaxed;
	bh=N/EholqtKx+zv6sn/eKIFQuXL6mRtX46aga53aJtY9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFxtgzGeKcnykSpvlc2e9kYmT6+I5wR10I3c+dWo/56+9s5EdVthuaLQJl6icRLYJtcLqpARWlTeMeDTLAaVZ9Rby7KDQ3e/xJtN/LInZ1J/zfhgIxtgYpb6f4ef39epfIdFen/9i5uuJdDBXaKEH4Poi5Mxm3SlMlcw/s3V8yHtuqujOR2OOSMJ/nBkzhyQINhFk3Wf45tNxjwSZCJMnhB0y+7xDuduhXWcn/mQG8JYLwXaIHAxR1aCJoDIp36Kz14C1C9zyfXaXWpYbUYwoTs/ziXYN93OtByJFhwMAv8glZzkO/nMLRFGnkFatkqjBC9MbwdcMX4ecUliuzmsLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=idHj/cGY; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=idHj/cGY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctfL3SL7z2xpl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 12:56:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8AA2AA41346;
	Tue, 29 Oct 2024 01:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B512EC4CEEA;
	Tue, 29 Oct 2024 01:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730166999;
	bh=9rAK2frXr102qAp2BxkbEMrPlcwloGU9JexTUWLRWdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=idHj/cGYvZmY39VLR4VVUqKkiqy6kvzvZH4FIxdWPrCXtEM8XkhEBWtz0W5vUjmcY
	 Uz7OsUN4oOijkx+PlGoDF7atcx1MhS+kXwGQ7y6mntpPB8xZMZnJ+rNbRaIeB2kaa6
	 4BLj0AfzgiecryPuzJehIRehKDq9smwxIQxpSasBkYh4YHbN0mfzUgzRevi8YCSAgt
	 E1Fxa4uPv8fcd9vuYnzljzzk6A4uXXCpSBNamPPouBwGH5fPh6zckII8kjApbMxF5E
	 nRKe8pFkbrMkTTRO8g9u3z530B5CpnSBbckZ6UYsHHmeJdiKfAnuf9zjeKbopUxkJa
	 LDFX/7CcQfPpA==
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
Subject: [PATCH v3 3/6] x86/uaccess: Avoid barrier_nospec() in 32-bit copy_from_user()
Date: Mon, 28 Oct 2024 18:56:16 -0700
Message-ID: <5abde43491039b577294b0b94877f3a1db1235d7.1730166635.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730166635.git.jpoimboe@kernel.org>
References: <cover.1730166635.git.jpoimboe@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The barrier_nospec() in 32-bit copy_from_user() is slow.  Instead use
pointer masking to force the user pointer to all 1's if a previous
access_ok() mispredicted true for an invalid address.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/uaccess.h    | 34 +++++++++++++++++++++++++++++++
 arch/x86/include/asm/uaccess_32.h |  2 +-
 arch/x86/include/asm/uaccess_64.h | 29 +-------------------------
 3 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 3a7755c1a441..e7ac97d42bc2 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -15,6 +15,40 @@
 #include <asm/smap.h>
 #include <asm/extable.h>
 #include <asm/tlbflush.h>
+#include <asm/runtime-const.h>
+
+#ifdef CONFIG_X86_64
+/*
+ * Virtual variable: there's no actual backing store for this,
+ * it can purely be used as 'runtime_const_ptr(USER_PTR_MAX)'
+ */
+extern unsigned long USER_PTR_MAX;
+# define USER_PTR_MAX_CONST runtime_const_ptr(USER_PTR_MAX)
+#else
+# define USER_PTR_MAX_CONST TASK_SIZE_MAX-1
+#endif
+
+/*
+ * Masking the user address is an alternative to a conditional
+ * user_access_begin that can avoid the fencing. This only works
+ * for dense accesses starting at the address.
+ */
+static inline void __user *mask_user_address(const void __user *ptr)
+{
+	unsigned long mask;
+	asm("cmp %1,%0\n\t"
+	    "sbb %0,%0"
+		:"=r" (mask)
+		:"r" (ptr),
+		 "0" (USER_PTR_MAX_CONST));
+	return (__force void __user *)(mask | (__force unsigned long)ptr);
+}
+
+#define masked_user_access_begin(x) ({				\
+	__auto_type __masked_ptr = (x);				\
+	__masked_ptr = mask_user_address(__masked_ptr);		\
+	__uaccess_begin(); __masked_ptr; })
+
 
 #ifdef CONFIG_X86_32
 # include <asm/uaccess_32.h>
diff --git a/arch/x86/include/asm/uaccess_32.h b/arch/x86/include/asm/uaccess_32.h
index 8393ba104b2c..6ec2d73f8bba 100644
--- a/arch/x86/include/asm/uaccess_32.h
+++ b/arch/x86/include/asm/uaccess_32.h
@@ -23,7 +23,7 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 static __always_inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	barrier_nospec();
+	from = mask_user_address(from);
 	return __copy_user_ll(to, (__force const void *)from, n);
 }
 
diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index 7ce84090f0ec..dfb78154ac26 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -12,13 +12,6 @@
 #include <asm/cpufeatures.h>
 #include <asm/page.h>
 #include <asm/percpu.h>
-#include <asm/runtime-const.h>
-
-/*
- * Virtual variable: there's no actual backing store for this,
- * it can purely be used as 'runtime_const_ptr(USER_PTR_MAX)'
- */
-extern unsigned long USER_PTR_MAX;
 
 #ifdef CONFIG_ADDRESS_MASKING
 /*
@@ -54,27 +47,7 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
 #endif
 
 #define valid_user_address(x) \
-	((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX))
-
-/*
- * Masking the user address is an alternative to a conditional
- * user_access_begin that can avoid the fencing. This only works
- * for dense accesses starting at the address.
- */
-static inline void __user *mask_user_address(const void __user *ptr)
-{
-	unsigned long mask;
-	asm("cmp %1,%0\n\t"
-	    "sbb %0,%0"
-		:"=r" (mask)
-		:"r" (ptr),
-		 "0" (runtime_const_ptr(USER_PTR_MAX)));
-	return (__force void __user *)(mask | (__force unsigned long)ptr);
-}
-#define masked_user_access_begin(x) ({				\
-	__auto_type __masked_ptr = (x);				\
-	__masked_ptr = mask_user_address(__masked_ptr);		\
-	__uaccess_begin(); __masked_ptr; })
+	((__force unsigned long)(x) <= USER_PTR_MAX_CONST)
 
 /*
  * User pointers can have tag bits on x86-64.  This scheme tolerates
-- 
2.47.0


