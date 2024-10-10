Return-Path: <linuxppc-dev+bounces-1937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF27997E51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:03:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKg4X2sz3brT;
	Thu, 10 Oct 2024 18:02:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543735;
	cv=none; b=nwAA4y6Ccqw27xlC/BlE4TUxijjzlP8pMRASEjsKL+9voCBiY7kESXYfVHit93/mOgR+1hmxsPYt6zK0Xfqb06EOUti6GudWKrXsMamak+CDzk8NRWAC9/OfQxF4Qim8CkeWBsdeM4IErKcY6Mv0u0wHdEhFCjljAqYbkOQ+ODZX42e3BgC3tdk8hDeOBhicSU71rYNs+r2yznwcl9+owO2ari/XaI/CjKQ3yJDyMm256ECgMZN9WZZ6yZqRni1dfMRXBiHo1CW8srcp1IEU5nw7UDNASVYEg9w6QsJM1GYVGO52LH/izYkx68G9gBCBzV3aJp3iO6i6e7dSf6iBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543735; c=relaxed/relaxed;
	bh=t/w4SV1Y0dGlBhI60ju8MIn/OjnT25/XGrSV5vQ9VkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WloBkp+6MSrDuS7xKwA8A2L8Wr7YzSoO6cv7AbITHg9hi2nQAg3V//mgQF7UKavKNhzSSlKeg2Vq8QSuRMxXXWdka6hnLeHpqLeiXyYiUxtidcD4ZWvyRLcsdcSgZ5fOPdYeSlOyOd0O9XJrv5/ctbzPxhBRutF6pCkPu1KjLrP3lDq/rq7+2R8cV29LyQKtBZ1QFT0YehgIRk4ZpzqRuB9Nc+ueyiCcDJaez6JXxJGSLL2l+vlPlLHznRRnUGu3nNa8PJVHAMgvJJx+sN7aaiBR+yEb27ndzCZ15l93S7kLsjNj43Ge1pDiqVfmAmty3IVFylr2d6twRlDp6UJFjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PQ5hRnm0; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gKaavZTX; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PQ5hRnm0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gKaavZTX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKd07z9z3bqy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:13 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/w4SV1Y0dGlBhI60ju8MIn/OjnT25/XGrSV5vQ9VkA=;
	b=PQ5hRnm0f9UYWTlG6LzTHyD9fPH+nQg/xOsRifCFz96D/eNAPAqPG1vBA+wiPeQBZSOGvj
	PiJkIciUllmrR1BAdqOTzJ0qC0U7h+5030uywATEZwmtat7O78cGT6dUaXq2MHSyIe8UKH
	p8zcqSynsG2FcZdBnnt8XPAY7kasrMRHiyCGOJb+FprXjla6Wl9to5Z/TemOIXavYQD3jT
	WPf5SSBn2UDQpYfbpDUOrrv/lSDf3WFW6ahDCJgyQxWmYPyc/+zPU/bRsTwRPmJbEYjwhy
	ZJpqWynPN6oNR5ViTmGWlwH4/zcEAnVBqeNZoCW2oh804ITwSRKmYzCOdSGdYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/w4SV1Y0dGlBhI60ju8MIn/OjnT25/XGrSV5vQ9VkA=;
	b=gKaavZTXqvJRr+jsvjp+bHPm79VyKKOtnY0AApgyLWhsn2XV8oRWjdhXjNPVpgocX6HGVg
	fqI/T7bPpWSeIRDA==
Date: Thu, 10 Oct 2024 09:01:09 +0200
Subject: [PATCH 07/28] arm: vdso: Remove assembly for datapage access
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-7-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2900;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6Re6IPDsg0EiSptRbunZNSRyEEPrHpkzo4P7+ISqDSI=;
 b=RKzw5wvjbgsa0HF8+jBhQrpsnrQU14AOMrv0q2gs2sUrtA4ASsSZO9n0hyTrQHwhxNNzMRWnU
 NgdQkh9BLtwBXU2tIdz7phptwddOwOAyRAkwG7SWrZwL0R1blOuMFQW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

vdso/datapage.h provides a hidden declaration for _vdso_data.
When using it the compiler will automatically generate PC-relative
accesses which avoids the need for a custom assembly-based accessor.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/gettimeofday.h |  4 +---
 arch/arm/vdso/Makefile                   |  2 +-
 arch/arm/vdso/datapage.S                 | 16 ----------------
 arch/arm/vdso/vdso.lds.S                 |  3 ++-
 4 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 2134cbd5469feef020ef30494b667b93972f9fac..592d3d015ca7298b3bc35871387dbb3e7f819827 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -15,8 +15,6 @@
 
 #define VDSO_HAS_CLOCK_GETRES		1
 
-extern struct vdso_data *__get_datapage(void);
-
 static __always_inline int gettimeofday_fallback(
 				struct __kernel_old_timeval *_tv,
 				struct timezone *_tz)
@@ -139,7 +137,7 @@ static __always_inline u64 __arch_get_hw_counter(int clock_mode,
 
 static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
 {
-	return __get_datapage();
+	return _vdso_data;
 }
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 01067a2bc43b74cc3a4c071b4a0fbeb0933e9ff7..8a306bbec4a0c4d4b6580fe88187faf9f5422eed 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -5,7 +5,7 @@ include $(srctree)/lib/vdso/Makefile
 
 hostprogs := vdsomunge
 
-obj-vdso := vgettimeofday.o datapage.o note.o
+obj-vdso := vgettimeofday.o note.o
 
 # Build rules
 targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.so.raw vdso.lds
diff --git a/arch/arm/vdso/datapage.S b/arch/arm/vdso/datapage.S
deleted file mode 100644
index 9cd73b725d9fb89c2b9bb1d1178cce705baff38b..0000000000000000000000000000000000000000
--- a/arch/arm/vdso/datapage.S
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/linkage.h>
-#include <asm/asm-offsets.h>
-
-	.align 2
-.L_vdso_data_ptr:
-	.long	_start - . - VDSO_DATA_SIZE
-
-ENTRY(__get_datapage)
-	.fnstart
-	adr	r0, .L_vdso_data_ptr
-	ldr	r1, [r0]
-	add	r0, r0, r1
-	bx	lr
-	.fnend
-ENDPROC(__get_datapage)
diff --git a/arch/arm/vdso/vdso.lds.S b/arch/arm/vdso/vdso.lds.S
index 165d1d2eb76b3cea9b054ffa8906afdffa0eae57..9bfa0f52923c851b6b9e96d4dbb51eb3d5d0960a 100644
--- a/arch/arm/vdso/vdso.lds.S
+++ b/arch/arm/vdso/vdso.lds.S
@@ -11,6 +11,7 @@
  */
 
 #include <linux/const.h>
+#include <asm/asm-offsets.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
 
@@ -19,7 +20,7 @@ OUTPUT_ARCH(arm)
 
 SECTIONS
 {
-	PROVIDE(_start = .);
+	PROVIDE(_vdso_data = . - VDSO_DATA_SIZE);
 
 	. = SIZEOF_HEADERS;
 

-- 
2.47.0


