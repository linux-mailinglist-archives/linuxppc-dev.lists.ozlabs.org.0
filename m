Return-Path: <linuxppc-dev+bounces-13316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A6C0C5FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:44:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6Vk2ytvz3dV9;
	Mon, 27 Oct 2025 19:43:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554638;
	cv=none; b=hYW/ZmdBvZNH2+rUg9jGKiII2BObSuxohiuIZ806Iq1f3B3yNWixcpbkw3CMJayp4kJVC5vqnCHwtVNYcrKwX8jrsw4pKlS7YVKMB057UEcKY78J4k++QNKw/DtxxsS77HNFLx4VOCBPEE/jFpkQy5WP0cZp0kH8jnsv8+6nA39UWXhX/3RVvZSgBSV47FCL49b0D273XsCboNF//6YzTCHNkr8Aq2o8yWLZEb0NilNiJDDc4RV25a4WFu3QZfL2vdQAp6JXKh1SF7fWHpxm0LDc1d/HRooUy6nxLHa7o0bu+dS/+u+1dr76pTZpEbG20LDKDcJM8Y6QwCRZoTRnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554638; c=relaxed/relaxed;
	bh=DNQHcterXWXQuFWR5KPGbkzD3Sh/vJk9lLVEwO1xPSA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=RTyPzcgDzxQWuyQ2mkQ6rpy5otljd569qfVq8hEDZx8DE7qR6AWo3dC0PFjMUPtde8pF6itb7ZANb1ykSy1J+p7lnI4rb7gZJql9/u4nYpXY720GOfCJPvU3vz6+9+e/H92IkJ3ur+4OrWdZZSpRRsTQH3X2OeUlUk0v8nVbSvQ3OXzonl75qwSu7y4/qkT1w0OCxBjNtYBax+OujiuGE7ndVSI+B0WL8TcSSNmGzxcikrobbgAOCI8DN8w8jayd0Bft5hmVduqbo1DswwJpwBw5WoT3lWSJV97GkD4i6szRirebvrahFLDfAaCn9auNhbgSyxmNezgE1Q+K+8roXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Shun7IjV; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CjAAJqTB; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Shun7IjV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CjAAJqTB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6Vj1xj8z3d9K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:43:57 +1100 (AEDT)
Message-ID: <20251027083745.356628509@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DNQHcterXWXQuFWR5KPGbkzD3Sh/vJk9lLVEwO1xPSA=;
	b=Shun7IjVfYUPlEkByDviiP8FOOaPtcom7r3qT0QBgoYlkb5vVwr+bQ4W4TGvFBSI3ZaZZR
	+20dugYVw1XjPXkDP5YySKtN01v9L3UhhgPMAozbd9iTr5u/pfXPwlvPDEoj2eN9Rj3tdS
	FgNcCCZMo7m/ESx0d2/P7CcfOtUZByEi1Q5vdVk6Rm9cKUF0/gPodfvQYfARbcL06zSFj8
	EJcAJO5BlCn5G3xT2nW85AxFwE6WyRsbFUVB1x4KZYyo7Y3JTTFgskCCG72B3F2UERG1en
	UpXuHrFLcxh5qeAKwe+AtutqsB/hJ93fVNcggB2CsGQvpnMSloAE9dGSvojtdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DNQHcterXWXQuFWR5KPGbkzD3Sh/vJk9lLVEwO1xPSA=;
	b=CjAAJqTBR4AiPBtCOu7ZrMjj2ByjpD9kOdxzU0+8Jcl/6N+Mh+z+AJN5HxvT1ZXUhXLEd0
	lCdJ913xubPYmqBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
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
Subject: [patch V5 04/12] powerpc/uaccess: Use unsafe wrappers for ASM GOTO
References: <20251027083700.573016505@linutronix.de>
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
Date: Mon, 27 Oct 2025 09:43:48 +0100 (CET)
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/uaccess.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -451,7 +451,7 @@ user_write_access_begin(const void __use
 #define user_write_access_begin	user_write_access_begin
 #define user_write_access_end		prevent_current_write_to_user
 
-#define unsafe_get_user(x, p, e) do {					\
+#define arch_unsafe_get_user(x, p, e) do {			\
 	__long_type(*(p)) __gu_val;				\
 	__typeof__(*(p)) __user *__gu_addr = (p);		\
 								\
@@ -459,7 +459,7 @@ user_write_access_begin(const void __use
 	(x) = (__typeof__(*(p)))__gu_val;			\
 } while (0)
 
-#define unsafe_put_user(x, p, e) \
+#define arch_unsafe_put_user(x, p, e)				\
 	__put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
 
 #define unsafe_copy_from_user(d, s, l, e) \
@@ -504,11 +504,11 @@ do {									\
 		unsafe_put_user(*(u8*)(_src + _i), (u8 __user *)(_dst + _i), e); \
 } while (0)
 
-#define __get_kernel_nofault(dst, src, type, err_label)			\
+#define arch_get_kernel_nofault(dst, src, type, err_label)		\
 	__get_user_size_goto(*((type *)(dst)),				\
 		(__force type __user *)(src), sizeof(type), err_label)
 
-#define __put_kernel_nofault(dst, src, type, err_label)			\
+#define arch_put_kernel_nofault(dst, src, type, err_label)		\
 	__put_user_size_goto(*((type *)(src)),				\
 		(__force type __user *)(dst), sizeof(type), err_label)
 


