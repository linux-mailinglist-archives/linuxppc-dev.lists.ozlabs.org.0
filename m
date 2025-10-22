Return-Path: <linuxppc-dev+bounces-13155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C916DBFBEF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 14:49:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs8B229zjz3cZV;
	Wed, 22 Oct 2025 23:49:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761137354;
	cv=none; b=nwqhlgcvfxNiB0kZXVW9ZeFU99kdE2CJG+XR4g8dy/8malvzcRQkpw/OgEOZO+l3aH0LA1XcGwZbN5K8Cd+CisIuaDkDvf2bJYl38dLUj0UuvkXcd4I3qhYdrPQBWKmSCyrsDjHjm8h/4vqVuBm97hDIX5p1uYopsy7VyX2tQyFMQXrbmhPcea5+49d0Y3PiZ4ixQEVlSYHkf+YniW6aRUuOAssMPltI5eik4mcKqTsfNAWnMGuxATzGLN9m8QndkJkTwHMczbQSbPAMVqW4+Do4LJcBbhW5HyTJYSMDcapNSpsheeCJ/oUi66Lr1Joajff8Bhut2KvXxfk99Lem6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761137354; c=relaxed/relaxed;
	bh=Q6hUKo07m0tisXGEHl1vXx2So4mSCWEC1HB29LLd09o=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=at+cW4WQ/+AfLHyu3Qzc589vAcsYtbFgX9BDmHYfFYM+Bo4GuJtttynAe1hEkI6xp0kg8vS/dmV4FieP6Aq/aChnkBQtkPDvB4vmlMG8ErUpWPsLhjX2x8Ik4hJZJqpFIua9JtZBP6KDoORIHshO+B4rqctI1yPfgstan8XwXqHm5rMFsUWNopVRXeGbPXZys5fWReTpu3WLr+8Rm/cL/Qxr2v0ioCvD9iUhMaxQb1L4jcod1ShEw4CM4UNNOjKLNr/MH8UgmBYWrTa4DtOyF46IkyV/eOAeEaxe3ProCVGZg8ZWm5WG5kWQ5pFhh4yrOOnueFSL2tvZXzcnce5JlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KjuwfnEA; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bpRRpTpB; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KjuwfnEA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bpRRpTpB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs8B14JQmz3bv1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 23:49:13 +1100 (AEDT)
Message-ID: <20251022103112.169574299@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Q6hUKo07m0tisXGEHl1vXx2So4mSCWEC1HB29LLd09o=;
	b=KjuwfnEAJn/9/qU6mLzphSJ1eBy5OCSYk+YEtqgaHjf0MCFVufLWwDGiTwac4UgAUJFU3z
	wUSfymrJ01sBokZnAOSZdwCq07UfN0bC0cILvgANZIQNIOyDaDPk7aRdlwNqhD+jyQX3cD
	KTwMlrwM8P5As3h0JhHZfBZhh8xzMxgaRYloNRUGdJCV7gxUj7sc20Stcj4Y7TNvptbG0S
	v6wRFLD5bxKs4duKQju69i+yoKFuilH1+UOmpFQGIA9iJKFD5HXNRmiCVM5eD5ZUThwVow
	pjHP2qxRmnTEmlXIcJfvTR5W0CA1dUWrW2GeVi6ZAFCqSGTELdcdUtAdpvvdSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Q6hUKo07m0tisXGEHl1vXx2So4mSCWEC1HB29LLd09o=;
	b=bpRRpTpBzrTJkfqCgHc7+QAPWrfUyBMcjhHTn6SmniaryBnZ61TU9nDtegzkLPt0zy89tZ
	Q+kiWIrbSLfyiLCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V4 05/12] riscv/uaccess: Use unsafe wrappers for ASM GOTO
References: <20251022102427.400699796@linutronix.de>
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
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 14:49:08 +0200 (CEST)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:

bool foo(u32 __user *p, u32 val)
{
	scoped_guard(pagefault)
		unsafe_put_user(val, p, efault);
	return true;
efault:
	return false;
}

It ends up leaking the pagefault disable counter in the fault path. clang
at least fails the build.

Rename unsafe_*_user() to arch_unsafe_*_user() which makes the generic
uaccess header wrap it with a local label that makes both compilers emit
correct code. Same for the kernel_nofault() variants.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/include/asm/uaccess.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -437,10 +437,10 @@ unsigned long __must_check clear_user(vo
 		__clear_user(untagged_addr(to), n) : n;
 }
 
-#define __get_kernel_nofault(dst, src, type, err_label)			\
+#define arch_get_kernel_nofault(dst, src, type, err_label)			\
 	__get_user_nocheck(*((type *)(dst)), (__force __user type *)(src), err_label)
 
-#define __put_kernel_nofault(dst, src, type, err_label)			\
+#define arch_put_kernel_nofault(dst, src, type, err_label)			\
 	__put_user_nocheck(*((type *)(src)), (__force __user type *)(dst), err_label)
 
 static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
@@ -460,10 +460,10 @@ static inline void user_access_restore(u
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.
  */
-#define unsafe_put_user(x, ptr, label)					\
+#define arch_unsafe_put_user(x, ptr, label)				\
 	__put_user_nocheck(x, (ptr), label)
 
-#define unsafe_get_user(x, ptr, label)	do {				\
+#define arch_unsafe_get_user(x, ptr, label)	do {			\
 	__inttype(*(ptr)) __gu_val;					\
 	__get_user_nocheck(__gu_val, (ptr), label);			\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\


