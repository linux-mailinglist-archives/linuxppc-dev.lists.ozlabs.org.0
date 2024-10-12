Return-Path: <linuxppc-dev+bounces-2143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A099B0BE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 06:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQVQB2xDrz30Bp;
	Sat, 12 Oct 2024 15:10:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728706210;
	cv=none; b=Z4tH1MOkHFp8giApPHy2lYKCwc84J/rSZaC3aVaFLKXek+iTMOczLI4sKtBwy985IulYOWw+zt1jEsg15OJ+Ky+a+MkkYzKcMCq9Syfaq2K2dZQG0y0pJKUct0rO0v9t6fk5werhxG0kFi3VP7LQ92BChYr+grxCSBYDgwDRtChSz+IqxpbQ+GWnmObxEe+LJFwQwTQjV+ZOOlpt+H1/lcecqk4tyrgd4+TGAQJwUyod0gBed2xRMnKT7cgGLiob3Sza756bMd2xlTTCOL+58cVAYlcQGF/XsT7NkYrRiRTu7c7ySOvvIrkb8PC/YfWIN0ahxJHvguFEbbsTvYsmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728706210; c=relaxed/relaxed;
	bh=/VDr4MmjxyOpEqNzwc3cstrC+R1nZ8ssa9d92dUWO5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=amNTzhIIimPaQ8e+emrfd8flU24iMFnNj/gvjV55KWRtqltAXl94hHrftGf3WZjlibGcBCZ691md3bsFYYqBlECXHZVXzMEq0zfGafG7F5tZJ/LFgQw39iUMOIUUbIksmK6CQok1iL8zZZHcbor9Lq/0b5GlyR5QyK/IQfTntF2WIbcB6lqDqNR+H5yY5kLK31osXxELXoJdMKszrXoiA0J4A2v08SrmqIoVxIjpMnSoILNgHUi6UfXQGeHgfb0d8NmRO5sOHn5X+kbNslQ0wd7WJq5++MaT7ZOuydG2qeC0on0zC1FLF3/SJUBFNW8eyDi98sVpFUYyr1TdY2DmHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T7GcXG6/; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T7GcXG6/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQVQ90PYCz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 15:10:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 156D3A40112;
	Sat, 12 Oct 2024 04:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FC3C4CEC6;
	Sat, 12 Oct 2024 04:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728706204;
	bh=b0tdLd6p2Kx9EHk9gTMgvSI+akCuCWB3cnFbSmxwFPU=;
	h=From:To:Cc:Subject:Date:From;
	b=T7GcXG6/MEphAKA9ACcQENK/OsvjZTooqo5Q2Kt5IBAH7mFx3d4i9v7teoyGaCKQ8
	 Fmn2mEvClQtA+AK6nTQPPn2KWpompRGbNs1BA/nTFKYfH0S8+YEs1PDRlOq+h4g+KC
	 BYqwDRxB6mDjge08euDXriOAilF4u8D6eLaNmI5zgbBoychWSvnKo136jOgk0bNAWJ
	 KPYFw5E2IBjD6QWSgE60Qb2AmYuCTSVCg9USj9fg57mUNgiIKuYLcRi8SRH+0Rml6R
	 qFzEBJJlbdNwFOduqtI8Vk11mfwFHerCZLUXOBPur59EjjTYaZtdjG+nggnv9xVgU2
	 Kpd/L223+d4QA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Date: Fri, 11 Oct 2024 23:09:39 -0500
Message-ID: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.46.2
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
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For x86-64, the barrier_nospec() in copy_from_user() is overkill and
painfully slow.  Instead, use pointer masking to force the user pointer
to a non-kernel value even in speculative paths.

While at it, harden the x86 implementations of raw_copy_to_user() and
clear_user(): a write in a mispredicted access_ok() branch to a
user-controlled kernel address can populate the rest of the affected
cache line with kernel data.

To avoid regressing powerpc, move the barrier_nospec() to the powerpc
raw_copy_from_user() implementation so there's no functional change.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/powerpc/include/asm/uaccess.h | 2 ++
 arch/x86/include/asm/uaccess_64.h  | 4 +++-
 arch/x86/lib/getuser.S             | 2 +-
 arch/x86/lib/putuser.S             | 2 +-
 include/linux/uaccess.h            | 6 ------
 5 files changed, 7 insertions(+), 9 deletions(-)

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
index afce8ee5d7b7..39199eef26be 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -133,12 +133,14 @@ copy_user_generic(void *to, const void *from, unsigned long len)
 static __always_inline __must_check unsigned long
 raw_copy_from_user(void *dst, const void __user *src, unsigned long size)
 {
+	src = mask_user_address(src);
 	return copy_user_generic(dst, (__force void *)src, size);
 }
 
 static __always_inline __must_check unsigned long
 raw_copy_to_user(void __user *dst, const void *src, unsigned long size)
 {
+	dst = mask_user_address(dst);
 	return copy_user_generic((__force void *)dst, src, size);
 }
 
@@ -197,7 +199,7 @@ static __always_inline __must_check unsigned long __clear_user(void __user *addr
 static __always_inline unsigned long clear_user(void __user *to, unsigned long n)
 {
 	if (__access_ok(to, n))
-		return __clear_user(to, n);
+		return __clear_user(mask_user_address(to), n);
 	return n;
 }
 #endif /* _ASM_X86_UACCESS_64_H */
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
2.46.2


