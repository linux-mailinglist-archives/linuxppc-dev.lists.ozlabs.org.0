Return-Path: <linuxppc-dev+bounces-1934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E162E997E49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:03:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKf5ZW9z3bqW;
	Thu, 10 Oct 2024 18:02:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543734;
	cv=none; b=iqVX8yB85ihTnZPBloeMqgHsZ1kEFdPR6GeYyHulOPLGGEzqjXof7M056QrK81EFPNorFIw5Bu/T/PI52Ft60xJ3/kdRSIr6NTTFuMd+bnhfB7RBaXGXRgfQRncebQl8yYlAt3RvdbxBF3I5xyiVSj/WAIQPsgrxuYMXywSaCcYff5rIlCDE/Efgk5670hGAtBRwrIm2+b+9SDk0kw4CxM6zYee+emkKzKq/7fDV8YNFBgLlDSRmdmCdtoanHQiwIU/7PGsiily6LdaDW+gH4AQ3f3aFrLkBDDk33+I0Gk5ia2/YW0KhHHxXo/4HgJpkDmurtKe2W9K1xNBhYKDUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543734; c=relaxed/relaxed;
	bh=fSNmDOR8mNkMRWq28GYqTKs82l0VUrUkubx6cM1vMzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I/865+BvgZ8/1b+TcpvvUXHCxUCAkaeQ8fwLPPStorAlqYwI+luf1slj0jgE7hReuUCnYzkksKi83RC4RAZAaKvpNBbiRSHWLB4+Nl/i0CXYgZUadzbA+gxi9cBhwNV4GKr6p5dG9Rmc4GmQqutqTFbfvh9aNPs/xBTa5f5Qt+D/eE1n8xgIPZXGA7zRvXlwnNvra7asK5QzPRrIy2PEzsWEwfAdUOlOdK8sWKp6eCgs6kkhqzG/Hs9G91ZCf5losVuEfvlERzySjRsExmgVMMIwyNeDwJ00o2a2q+NzpZu5khakLGWwpWyMDe9FSTHgcKQIj3+yhZbJ2vpttYQlKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JOkVyuu8; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AVwC1K9c; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JOkVyuu8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AVwC1K9c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKd06Drz3bqp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:13 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSNmDOR8mNkMRWq28GYqTKs82l0VUrUkubx6cM1vMzU=;
	b=JOkVyuu8+7haw1iCeHChIsq68EC1aZ52K0BIUTFKSbeQBBJEUxi312+lOZEntDZeRqi55i
	uPfwqC6MUWoo1hIr/jOFy6UINkmmLclazsQfxOlNbU20Cp81nv/mQXg5Lw9HDsOQdNHFCP
	LpJfynDUc4QyF7vVaG8T1GCx8XEi7L6alOQghxtEvPLNw1z779j7IhCnusT1ZSoki2sRyl
	Q+SPTwcLo2JzuNFf/IM/k2hrg1g2PwSHv6M76K5bNbp4sftQFnCi2Fx9uCCLYINR/NIVdz
	ki/30EscNkMx57JeSpOGozsepAcPW63TEvULocoEomkcVzyTqUWmvWvwqpJ88g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSNmDOR8mNkMRWq28GYqTKs82l0VUrUkubx6cM1vMzU=;
	b=AVwC1K9c5Whn9Va23Yb9J5KSgfAiDM4xWIG2FptaGnWTq9kCeAxZSYBEP2n6BjXznVhhK2
	c+8VOjydf1tjswAw==
Date: Thu, 10 Oct 2024 09:01:10 +0200
Subject: [PATCH 08/28] LoongArch: vDSO: Use vdso/datapage.h to access vDSO
 data
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
Message-Id: <20241010-vdso-generic-base-v1-8-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=5262;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=FYM4tk82QHVuu/f72Iv7XeP9evNNkMSpW3FoFzuNH7o=;
 b=3bKRUZ5iIdKtZuSy+qOYQwMpqk7fk6/fhq1nYjszxR3DIB4+fVnS5JyZWYVwlBQHQ3aq2KaGg
 dwVWIKtF6RjBgsj72diQERGVQ6Iyc3ErSTAx+eZvjNZs2RfAquBYG3J
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

vdso/datapage.h provides symbols and functions to ease the access to
shared vDSO data from both the kernel and the vDSO.
Make use of it to simplify the current code and also prepare for further
changes unifying the vDSO data storage between architectures.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/include/asm/vdso/getrandom.h    |  3 +--
 arch/loongarch/include/asm/vdso/gettimeofday.h |  4 ++--
 arch/loongarch/include/asm/vdso/vdso.h         | 18 +-----------------
 arch/loongarch/kernel/asm-offsets.c            |  9 +++++++++
 arch/loongarch/vdso/vdso.lds.S                 |  8 +++++++-
 arch/loongarch/vdso/vgetcpu.c                  |  2 +-
 6 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/arch/loongarch/include/asm/vdso/getrandom.h b/arch/loongarch/include/asm/vdso/getrandom.h
index 02f36772541b7deb89aa294f13e4d539d6e6626d..e80f3c4ac7481ba7f9f5d9210fefa78c3293243b 100644
--- a/arch/loongarch/include/asm/vdso/getrandom.h
+++ b/arch/loongarch/include/asm/vdso/getrandom.h
@@ -30,8 +30,7 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
 
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
 {
-	return (const struct vdso_rng_data *)(get_vdso_data() + VVAR_LOONGARCH_PAGES_START *
-	       PAGE_SIZE + offsetof(struct loongarch_vdso_data, rng_data));
+	return &_loongarch_data.rng_data;
 }
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/loongarch/include/asm/vdso/gettimeofday.h b/arch/loongarch/include/asm/vdso/gettimeofday.h
index 89e6b222c2f2d1ce240198f2fbc14553d0d6b94d..7eb3f041af764d141b005f821593a358096874ba 100644
--- a/arch/loongarch/include/asm/vdso/gettimeofday.h
+++ b/arch/loongarch/include/asm/vdso/gettimeofday.h
@@ -91,14 +91,14 @@ static inline bool loongarch_vdso_hres_capable(void)
 
 static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
 {
-	return (const struct vdso_data *)get_vdso_data();
+	return _vdso_data;
 }
 
 #ifdef CONFIG_TIME_NS
 static __always_inline
 const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
 {
-	return (const struct vdso_data *)(get_vdso_data() + VVAR_TIMENS_PAGE_OFFSET * PAGE_SIZE);
+	return _timens_data;
 }
 #endif
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/loongarch/include/asm/vdso/vdso.h b/arch/loongarch/include/asm/vdso/vdso.h
index e31ac7474513c737fcc0071d6f2554dc4d447101..1c183a9b2115a29a997ec8db0e788d87fb191dce 100644
--- a/arch/loongarch/include/asm/vdso/vdso.h
+++ b/arch/loongarch/include/asm/vdso/vdso.h
@@ -48,23 +48,7 @@ enum vvar_pages {
 
 #define VVAR_SIZE (VVAR_NR_PAGES << PAGE_SHIFT)
 
-static inline unsigned long get_vdso_base(void)
-{
-	unsigned long addr;
-
-	__asm__(
-	" la.pcrel %0, _start\n"
-	: "=r" (addr)
-	:
-	:);
-
-	return addr;
-}
-
-static inline unsigned long get_vdso_data(void)
-{
-	return get_vdso_base() - VVAR_SIZE;
-}
+extern struct loongarch_vdso_data _loongarch_data __attribute__((visibility("hidden")));
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kernel/asm-offsets.c
index bee9f7a3108f0e6f6d8251651d12df677529bda7..049c5c3e370cbb00fdaf6730f7777847c7325fb4 100644
--- a/arch/loongarch/kernel/asm-offsets.c
+++ b/arch/loongarch/kernel/asm-offsets.c
@@ -14,6 +14,7 @@
 #include <asm/ptrace.h>
 #include <asm/processor.h>
 #include <asm/ftrace.h>
+#include <vdso/datapage.h>
 
 static void __used output_ptreg_defines(void)
 {
@@ -321,3 +322,11 @@ static void __used output_kvm_defines(void)
 	OFFSET(KVM_GPGD, kvm, arch.pgd);
 	BLANK();
 }
+
+static void __used output_vdso_defines(void)
+{
+	COMMENT("LoongArch vDSO offsets.");
+
+	DEFINE(__VVAR_PAGES, VVAR_NR_PAGES);
+	BLANK();
+}
diff --git a/arch/loongarch/vdso/vdso.lds.S b/arch/loongarch/vdso/vdso.lds.S
index 6b441bde4026ea8acda969e7c3205a9350a76cd7..160cfaef2de45b1243502c7356f8a913658548fe 100644
--- a/arch/loongarch/vdso/vdso.lds.S
+++ b/arch/loongarch/vdso/vdso.lds.S
@@ -3,6 +3,8 @@
  * Author: Huacai Chen <chenhuacai@loongson.cn>
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
+#include <asm/page.h>
+#include <generated/asm-offsets.h>
 
 OUTPUT_FORMAT("elf64-loongarch", "elf64-loongarch", "elf64-loongarch")
 
@@ -10,7 +12,11 @@ OUTPUT_ARCH(loongarch)
 
 SECTIONS
 {
-	PROVIDE(_start = .);
+	PROVIDE(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
+#ifdef CONFIG_TIME_NS
+	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
+#endif
+	PROVIDE(_loongarch_data = _vdso_data + 2 * PAGE_SIZE);
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
diff --git a/arch/loongarch/vdso/vgetcpu.c b/arch/loongarch/vdso/vgetcpu.c
index 9e445be39763aebc75e9e97d77b40e14a018deea..0db51258b2a7ca7e44d2eb68ea514face48393f7 100644
--- a/arch/loongarch/vdso/vgetcpu.c
+++ b/arch/loongarch/vdso/vgetcpu.c
@@ -21,7 +21,7 @@ static __always_inline int read_cpu_id(void)
 
 static __always_inline const struct vdso_pcpu_data *get_pcpu_data(void)
 {
-	return (struct vdso_pcpu_data *)(get_vdso_data() + VVAR_LOONGARCH_PAGES_START * PAGE_SIZE);
+	return _loongarch_data.pdata;
 }
 
 extern

-- 
2.47.0


