Return-Path: <linuxppc-dev+bounces-12988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470CBE7F5C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0sc3W5Cz3chc;
	Fri, 17 Oct 2025 21:09:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695748;
	cv=none; b=GKhIcuuAtnkEw7kDi1172D7qJNM27BrL4qkNfIX/X7oe7kMHRYef4LQMYkWedYn/32XZx9N4KeBgZZLNhNAoPjNJLuYX4enGMwqlR/AwqNa6GYR8hbFwOFqWas4EIxCs8ImBoPNqOLWIUdVV6PcfTwJF6qAJwxI+CglIcEETWzhCSxmUpy/ks2ikajiuaUXq0smZ12rR2pBkNU95gkPlqF82oHWM2qcthXiRH+0zUZsK02KzJvJ8VUTZHGzfHQyQomwLnPiAd4GW/2b3X8OnhrA8or5ZZxK8SoJfihuQhVUWg2wbURweLyts0egOjHtCsiXYqGaAz22vUupPfg8STQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695748; c=relaxed/relaxed;
	bh=EKzyB0lrI1vv7+y80GeaggsaapcXMx0ewLMg7+vmnx4=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=oRinr2pBh1iEWTrqwve/PlozL2K7zfBPvFMRMQg/EMGW7IHynNM6c6SWAGlhGecT6uglnDri+hSpu/3lme6IxPL9ZVMgwfUDytJ0NPUFxZETZMgC2TPtAWmNXXzKbvb3jYr0QQ6whasPI5xwADYJPDlws/psQnNq6FKTbxdAMIJeToSigqaLDbdKbDhDYGSq/0wH2gyoBWbupmHrFR9DKPYNyshuRRH8TXzPPXhVueWu03sY6rEL1oRYAoXEi3doqy3W2k2mJuhZqACILRsv4ft6/xooInyGkJIoKs0aQBs4JshdDETwh4vNzKk5dC7n55OXjAQeGyVDqgla+9C0+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GTvRGyk6; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wLsGC9RL; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GTvRGyk6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wLsGC9RL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0sZ2Dp4z2yMh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:05 +1100 (AEDT)
Message-ID: <20251017093030.001666876@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EKzyB0lrI1vv7+y80GeaggsaapcXMx0ewLMg7+vmnx4=;
	b=GTvRGyk6DjoMxDt+fYkyakO6ycdq3eWKJ5DLVvdla9gpLRlLAUtCHv3+2OCSBITMNRhjV+
	6R5tlN403YJ0IfDxjOVq4z3XEeIW/8FaVPYWQFIdq4ALG+Iag8vKidxOVW51jHPDlm3vjB
	nP7wsoZz7ZXJA2YRNabZ9OZ3Bd9HbSwPqRx+nTnL6R9ljmWGRkc5qFj/+L6OiUpoptPLXr
	lCw3HWo3QxWP24rkonxwBYynALATxasmSCuenpjqG+BEHbdLziuS9rHmOHHoGRaT+SSkJG
	xKPV0L9VPCcB90+j30+g4MmmbnMU6jRSjCrYOvAuK1Y6XoE1XS7zW9KZUlKnYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EKzyB0lrI1vv7+y80GeaggsaapcXMx0ewLMg7+vmnx4=;
	b=wLsGC9RLzsjb5HJDs0ah7GifEriO3GgBtZB6KgEAeIJj2b6wMW7RITABes1j7sh8PjBhxD
	SPwii5s8wN3IgXCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
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
Subject: [patch V3 03/12] x86/uaccess: Use unsafe wrappers for ASM GOTO
References: <20251017085938.150569636@linutronix.de>
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
Date: Fri, 17 Oct 2025 12:09:00 +0200 (CEST)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
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
Cc: x86@kernel.org
---
 arch/x86/include/asm/uaccess.h |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -528,18 +528,18 @@ static __must_check __always_inline bool
 #define user_access_save()	smap_save()
 #define user_access_restore(x)	smap_restore(x)
 
-#define unsafe_put_user(x, ptr, label)	\
+#define arch_unsafe_put_user(x, ptr, label)	\
 	__put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), label)
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-#define unsafe_get_user(x, ptr, err_label)					\
+#define arch_unsafe_get_user(x, ptr, err_label)					\
 do {										\
 	__inttype(*(ptr)) __gu_val;						\
 	__get_user_size(__gu_val, (ptr), sizeof(*(ptr)), err_label);		\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
 } while (0)
 #else // !CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-#define unsafe_get_user(x, ptr, err_label)					\
+#define arch_unsafe_get_user(x, ptr, err_label)					\
 do {										\
 	int __gu_err;								\
 	__inttype(*(ptr)) __gu_val;						\
@@ -618,11 +618,11 @@ do {									\
 } while (0)
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-#define __get_kernel_nofault(dst, src, type, err_label)			\
+#define arch_get_kernel_nofault(dst, src, type, err_label)		\
 	__get_user_size(*((type *)(dst)), (__force type __user *)(src),	\
 			sizeof(type), err_label)
 #else // !CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-#define __get_kernel_nofault(dst, src, type, err_label)			\
+#define arch_get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	int __kr_err;							\
 									\
@@ -633,7 +633,7 @@ do {									\
 } while (0)
 #endif // CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 
-#define __put_kernel_nofault(dst, src, type, err_label)			\
+#define arch_put_kernel_nofault(dst, src, type, err_label)		\
 	__put_user_size(*((type *)(src)), (__force type __user *)(dst),	\
 			sizeof(type), err_label)
 


