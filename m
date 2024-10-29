Return-Path: <linuxppc-dev+bounces-2658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F19B3FFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 02:57:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctfN1yzQz2yTy;
	Tue, 29 Oct 2024 12:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167004;
	cv=none; b=PfnBVwuXfyeESsTZfnWZ+1pJCgjaNWbfFpO7PEbCAOQwpHG6YNS8/V9nh+sezbCiFIlNODYO87UQrvJaxTRqqeN82S8bzf4t0E0cLG4GjQDC7d19fEyUnDdHXfVAflUSTA3LFGsDHAco9aAqmgMxZjUCmOtvbacVoMwzT8qaxF+UYqzKfSsXVes2BReKxrbAGDWys21trTwB4bp7PJRvd9Bn4dMr5hMyeBruTsdcZtjkwc5RJoiXMYgsLi00HwaYOivODFoGC+UhnLI0AZImGbZOhoqU4EDNIgSUfYkLP/y22msytd65nJ1kWlhl8QzZ3K7qoOOd7Y4mF+izeKWVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167004; c=relaxed/relaxed;
	bh=rF8JJDg6pY4+mlZMwgcywuD4YchOltVF41py6cdS47Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFaZl4GtpWk7GZJ7HBtic+tuI9STV7KfezQSIbp32rO7VbOcxGTQtRGeLeiS8HM1GFITpleKTpgjFbbEqzqqOIvMYOfOver55nlaMR0nSnxvgcUczUw55ONHOc3rhSQ0lAuHVsgAlDzLLBdKSR3uIF5bsEGTVaCSwSBezKa8OyCOMwd9gtp+ztTs+H68zvHv5yxGNXA2xu59JD3fwnb90ybPX0+pjGQ/a5E//h/9/rJBuwnikr1pvH6JJ5gMs+HM3r0iP3c3rECWbSICs9ndyuMcmEyglUoelDmKBEegAf3poTVER9111NzRzrqlnVSUzjU4mCdgOZrnUOnvKYkPEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OSr+gpm7; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OSr+gpm7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctfL2YJXz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 12:56:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24709A4133D;
	Tue, 29 Oct 2024 01:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3516CC4CECD;
	Tue, 29 Oct 2024 01:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730166997;
	bh=ShKRJi9mJBJXWguLrtPuEJjUJyfAsPmcAibtmIEOQO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OSr+gpm7MdHVwqQbEDhdHQNjCS6PDXg7RsA6vbfcZ0da+Z2j6mO3IMFt2lpXgGpo+
	 z3L2qLDgooiXW3IubLxenWWI3QQYVhnXlwzXII+j54gb74ludg2PqnaiNXeRPbZz5H
	 C3hqFJ4HS9yy8aUUpqkFAOLyNQ512aF5hs/xIjKw2g/vr8yoelLIoRLeWhMrKdBXQe
	 RBjfryVchA2ZFhm0MJFVCl9KIIrmV6Qu03l65FAPhkFbUJNKx4yHRPQn82EmkCYdIn
	 d7+n62u9QJdmmAYNZbSkeklIP22DXp1wbYv7A26Fu/eLN32SA3tAYUnDzTXnR9c8Yn
	 dd3Vm/zhkTVEg==
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
Subject: [PATCH v3 1/6] x86/uaccess: Avoid barrier_nospec() in 64-bit copy_from_user()
Date: Mon, 28 Oct 2024 18:56:14 -0700
Message-ID: <5b887fe4c580214900e21f6c61095adf9a142735.1730166635.git.jpoimboe@kernel.org>
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

The barrier_nospec() in 64-bit copy_from_user() is slow.  Instead use
pointer masking to force the user pointer to all 1's if the access_ok()
mispredicted true for an invalid address.

The kernel test robot reports a 2.6% improvement in the per_thread_ops
benchmark (see link below).

To avoid regressing powerpc and 32-bit x86, move their barrier_nospec()
calls to their respective raw_copy_from_user() implementations so
there's no functional change there.

Note that for safety on some AMD CPUs, this relies on recent commit
86e6b1547b3d ("x86: fix user address masking non-canonical speculation
issue").

Link: https://lore.kernel.org/202410281344.d02c72a2-oliver.sang@intel.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/powerpc/include/asm/uaccess.h | 2 ++
 arch/x86/include/asm/uaccess_32.h  | 1 +
 arch/x86/include/asm/uaccess_64.h  | 1 +
 include/linux/uaccess.h            | 6 ------
 4 files changed, 4 insertions(+), 6 deletions(-)

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
diff --git a/arch/x86/include/asm/uaccess_32.h b/arch/x86/include/asm/uaccess_32.h
index 40379a1adbb8..8393ba104b2c 100644
--- a/arch/x86/include/asm/uaccess_32.h
+++ b/arch/x86/include/asm/uaccess_32.h
@@ -23,6 +23,7 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 static __always_inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
+	barrier_nospec();
 	return __copy_user_ll(to, (__force const void *)from, n);
 }
 
diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index b0a887209400..7ce84090f0ec 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -138,6 +138,7 @@ copy_user_generic(void *to, const void *from, unsigned long len)
 static __always_inline __must_check unsigned long
 raw_copy_from_user(void *dst, const void __user *src, unsigned long size)
 {
+	src = mask_user_address(src);
 	return copy_user_generic(dst, (__force void *)src, size);
 }
 
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


