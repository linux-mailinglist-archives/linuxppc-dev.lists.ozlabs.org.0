Return-Path: <linuxppc-dev+bounces-12985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF7FBE7F4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:09:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0sZ3y8zz3cZs;
	Fri, 17 Oct 2025 21:09:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695746;
	cv=none; b=oITaK/RbHxmu9YB7urw13Kyt2N8Zv8wcP4xREOpw9QkFNDzx80Hx/8yW1q1HIhgwfCO7rbTmqLhY48mgja77JbDiYOur8a+BU3IV9Bc6QW71E9VlSaaRahgkLJTa9vm73iaNJmFzl95hl+ka6OYT/5M2a/NnxBcCcKPPaVRI0YLmv3B3sW49dc0U9U6uQZoar+bAm1Rcy9p67EAC6labE0sdNLdKw9Ww3UfMasEbo3hpQepZ57Wj8CzMyZ5yrTQEDhMxKVInZsvu+K4P+TxJIOzL60o0ksp01V28canEHmg0Qkgg8Ft3CuAUJUbRaaaRUn9se7n58OFhfqd+pK+jLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695746; c=relaxed/relaxed;
	bh=DNQHcterXWXQuFWR5KPGbkzD3Sh/vJk9lLVEwO1xPSA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=cxoeoilAYDTqNEqyzVfAe4ZFJ26II38t7O3WfqxytLDO3zHnIX7i0W80II4umine2crP/EjMe0Th/ETG7XkFCl6hxtUB97ugjxTeKtBD5V/h8jdEjVd6rXX+KRA4ZH47Nw/zZB7/OX9DPWyAMjLbwvBGvqJYqo5XIkiN5oeujeZbh3Cx3bWXuAjrGvY0vSG2tEQc7PTImtW1iyJWGLNCZMEZ0Y+LFRyvlrdPDfA5JAqR77VEZx2na1LT84E6Va8kWqzmyFr7XwGvRxoAxEkXIxXOYn6ifwSIZ3Oabkq0WB7sz+x0+kIIlDnmVOzK/cLXVoPHbRAP/9Ax0a5+qkIKBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MnLnslQ4; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rg0WPyLq; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MnLnslQ4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rg0WPyLq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0sY3QWtz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:05 +1100 (AEDT)
Message-ID: <20251017093030.064701062@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DNQHcterXWXQuFWR5KPGbkzD3Sh/vJk9lLVEwO1xPSA=;
	b=MnLnslQ4RTsV85Q3CoH24lxHMQcF21HKHrtG7EOggVFlERWiVpTDR1OV7BLIIXpp85tyM9
	I7IoqOHCLIqnPvnSVsWVb/Tu2jQui1WDunh2r7Qwge4EsFLfN8gkhQuolZ3E+cyqEV0YOw
	6YqRd4+Xv0RBvQT1MNCkfK6e1IcQ8AumHt6pvIbojy2QtqkEaPYDHqHAea5RkXNWGyEpjl
	7xQHleplT3cA3JY0wM9+v9hUdjev9y6y1EgIEzbKs5vYyU4M0DvNL1MGJvittYUZPuSAbA
	0ZX2f3AXVPL23vcIPhkezJfXaQwQ3oOGHCYt8SH/2Beh0cStIp1WXsGlFtUGeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DNQHcterXWXQuFWR5KPGbkzD3Sh/vJk9lLVEwO1xPSA=;
	b=rg0WPyLqAanfBxT81ThSaB9BbJy7x27baok62rRyXXmPsoM3tIHAgK3ol6nAR0EDXBfInK
	mTIojW6IJ53yd1Cw==
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
Subject: [patch V3 04/12] powerpc/uaccess: Use unsafe wrappers for ASM GOTO
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
Date: Fri, 17 Oct 2025 12:09:02 +0200 (CEST)
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
 


