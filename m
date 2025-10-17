Return-Path: <linuxppc-dev+bounces-12987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC2EBE7F54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:09:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0sb61Cyz3cfg;
	Fri, 17 Oct 2025 21:09:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695747;
	cv=none; b=lKYQq4jHbWWiLXq9IGjhD6LY18tFf6S07NWTu/cLyTfAJWYZ8s3Euy67R3YqmVfU60/PPgCyjsv6uJHuxTrKl5zvqNmu4l4PwxGn2+9hN7N7ica8TVZejcqGPFUX9H6/MqXrteE4zPnPdi2wyJ4I6ignYDBfPU+BADhiZc4x3yzBkkdPxbK4HfBKz+a36Sg+Is0pFdKFhajqh1Jrai1rfd4r9gCUruY0VWcY2ecs4++22AiHixI1pjP51jFQERk09XlnCs8fRx9vvFXkbEhhb4dakxkyHiO9giSodlRjk+CA8TJHAOK4xhSLbDpnx1er6VTzMuRYNTBRjkTbJKPnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695747; c=relaxed/relaxed;
	bh=fZFzuFe1kZwWOtUDwXLfQwu5MJAw6qMRRDC36ZwVfYw=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=QnDYhOWRfKo1DmcpQar5aX1RLMF7Nb36AhjJIU2xdA3QY9YcHezyc5nn8l+NG6zU4j5SgSoGOc5WtBvfyBKkOZ+cJGuDTw9jcTOeUoCQBwTfRrH0rHWP5EgOt02w5H5PY7L01Ks1nUoQqPig72/Nodr3tHFSJa1irP7uQssIhMJ14I7Z5BKpiqeQ8Dm4ikyqXH5KM6831MCcj4FMtYJFnj7qDaIML7q1b1fq/0AqLEJh1Syd7jDaN/RsTKd7T91Cty98WXZjR6QAd+0/qW9ywG3f5iiUNItoksZtWxpPdQXN9FbwIITZnGBE6Tv+fV1b5peeGWClvQ6f5o9hnjwtrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ytPCOBNE; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8f0yU993; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ytPCOBNE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8f0yU993;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0sY5m1Qz3cZ1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:05 +1100 (AEDT)
Message-ID: <20251017093029.874834505@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=fZFzuFe1kZwWOtUDwXLfQwu5MJAw6qMRRDC36ZwVfYw=;
	b=ytPCOBNE1TkvJTWpLy78QusdxvVV4Ds58RKvhJHsf/croUeiGvx9UnV4mNMdoBRVg07oHB
	4+32mu7/3RJxShsIPe6JWBz5/FrJfOZGgzsUfIDkj+3q1xMnmtZgpTWyromcSbAF8Xv274
	FkV/c0yAHYbltKBm+ghXeCxDak+NWmvJPnXPfMhkj/1G0WGZ/rLPBaFrj917XRVqjV/Kqd
	dvKhMtlzqqxyQdha8CX/xxPGIDZ4upmI/c5f9i+386qXdlQKjcAWLAvTaQeifJ8F/2voYJ
	mhvw6eRvaSu0a/m6bo4SZbAHuXSegaKyNol/l9f+YG/bs3UKrtYmohJd5Aay1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=fZFzuFe1kZwWOtUDwXLfQwu5MJAw6qMRRDC36ZwVfYw=;
	b=8f0yU993CYFDRwGspwr1ZKCjnjUpxYp+aRgJMGfWayi/6XrP0VvvNNmJISqFj4Wkr7Otd+
	Te+PwI9NuQKM1+Cw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
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
Subject: [patch V3 01/12] ARM: uaccess: Implement missing
 __get_user_asm_dword()
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
Date: Fri, 17 Oct 2025 12:08:56 +0200 (CEST)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When CONFIG_CPU_SPECTRE=n then get_user() is missing the 8 byte ASM variant
for no real good reason. This prevents using get_user(u64) in generic code.

Implement it as a sequence of two 4-byte reads with LE/BE awareness and
make the unsigned long (or long long) type for the intermediate variable to
read into dependend on the the target type.

The __long_type() macro and idea was lifted from PowerPC. Thanks to
Christophe for pointing it out.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Closes: https://lore.kernel.org/oe-kbuild-all/202509120155.pFgwfeUD-lkp@intel.com/
---
V2a: Solve the *ptr issue vs. unsigned long long - Russell/Christophe
V2: New patch to fix the 0-day fallout
---
 arch/arm/include/asm/uaccess.h |   26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -283,10 +283,17 @@ extern int __put_user_8(void *, unsigned
 	__gu_err;							\
 })
 
+/*
+ * This is a type: either unsigned long, if the argument fits into
+ * that type, or otherwise unsigned long long.
+ */
+#define __long_type(x) \
+	__typeof__(__builtin_choose_expr(sizeof(x) > sizeof(0UL), 0ULL, 0UL))
+
 #define __get_user_err(x, ptr, err, __t)				\
 do {									\
 	unsigned long __gu_addr = (unsigned long)(ptr);			\
-	unsigned long __gu_val;						\
+	__long_type(x) __gu_val;					\
 	unsigned int __ua_flags;					\
 	__chk_user_ptr(ptr);						\
 	might_fault();							\
@@ -295,6 +302,7 @@ do {									\
 	case 1:	__get_user_asm_byte(__gu_val, __gu_addr, err, __t); break;	\
 	case 2:	__get_user_asm_half(__gu_val, __gu_addr, err, __t); break;	\
 	case 4:	__get_user_asm_word(__gu_val, __gu_addr, err, __t); break;	\
+	case 8:	__get_user_asm_dword(__gu_val, __gu_addr, err, __t); break;	\
 	default: (__gu_val) = __get_user_bad();				\
 	}								\
 	uaccess_restore(__ua_flags);					\
@@ -353,6 +361,22 @@ do {									\
 #define __get_user_asm_word(x, addr, err, __t)			\
 	__get_user_asm(x, addr, err, "ldr" __t)
 
+#ifdef __ARMEB__
+#define __WORD0_OFFS	4
+#define __WORD1_OFFS	0
+#else
+#define __WORD0_OFFS	0
+#define __WORD1_OFFS	4
+#endif
+
+#define __get_user_asm_dword(x, addr, err, __t)				\
+	({								\
+	unsigned long __w0, __w1;					\
+	__get_user_asm(__w0, addr + __WORD0_OFFS, err, "ldr" __t);	\
+	__get_user_asm(__w1, addr + __WORD1_OFFS, err, "ldr" __t);	\
+	(x) = ((u64)__w1 << 32) | (u64) __w0;				\
+})
+
 #define __put_user_switch(x, ptr, __err, __fn)				\
 	do {								\
 		const __typeof__(*(ptr)) __user *__pu_ptr = (ptr);	\


