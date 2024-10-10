Return-Path: <linuxppc-dev+bounces-1950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AED79997E67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:05:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKy18b9z3c2C;
	Thu, 10 Oct 2024 18:02:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543750;
	cv=none; b=bhsd5GDCrUkTNVC3BaHe7uXVca1eiQehyRNgevCi6TntzfL4g3lhqMGn6l6L7AeugFhqW9qvVUvY++gPMX22a5l1SHeuRvxgjSBXPowkRAq/FmIEnT9yFA1YSKVXB2PfKLtHcuh4bVaU8ULfGf3fwysoWe4/Bd4GZuyNG18waWddFP35yZ3T5bUJcHF4axZeYr6s7MVJu1rIOEN+lUVEr6Ww12puKBTBq4izGIj6CKPD8D749zqnwscGCe0n00pZo9B5RwYt9yVuN+myGbqf/5iBIjat56UMWiLZrEVAbULA2OFzNvZZ9EiS36p35FADnsl7Tkwk5yXBKCQQdZu7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543750; c=relaxed/relaxed;
	bh=NOmDYcigYQIrIJIh3Um8635h5qr4veQV5uL1dAIYrXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZryfOVCJoKjRydJP4lDnpVbGPKbp8wApewMM9kLgK96ktS+B5Xe0JOUwcTqok5Hht2hO23/Xi33LKZ47/3srH868jA1WlOlQVNAoej5E1AHGEYSZBs0sDTpaTMJxcCqT1pTAGyxaUZEUgS3TUDODwiv1vRDkm7Gg9Eb3kqnwEh2i4c/Uyw0CokKITDE2dfsMxCmzfihhcsgU4opMeDaXzLZZ2lyKt4L28xo8hTY7tWbfrGITljJ4bo8aTa5VflfndWIL5L4RzhxdFcxBDyVmtdA+a6nVi7MoyN+fSONAfrdYf2pBOFRdjGIrJxYlctsnOF/3jOdI79ktCApJDit4vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SVOAmEfp; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fxHYPA0y; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SVOAmEfp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fxHYPA0y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKx00chz3c1S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:28 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOmDYcigYQIrIJIh3Um8635h5qr4veQV5uL1dAIYrXA=;
	b=SVOAmEfpcB9zjCSlIl/abBlZtdgNslJZDJhREX69+DVllRbdyJNzuQ9AUCZ75N6Gz4WpZ7
	ZzujaAdmYucVDATv5ONGlJ2963QEzqFmk/Rk9S6pFIMYiCxodZILexuFmlQMMzMDNC+87s
	K0BdiS1EdKrWR0R5MRBmx7Ffm4zulKbHUGftMJBMzRtA0nmpseK4qzdOKsuVVkSxDG2VHq
	lHdzYfeiBMnlcxyrOurvyj6FQlKxtzMxqhO2rciK5mFv1Nkp817+IPI2195wt4Q35Br1Ea
	wqlXmTuoPsoo1NFKXetYn4Ucz4lsPC0KyLg6pbZvs6LOWRxmNNASWOz5JhGhGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOmDYcigYQIrIJIh3Um8635h5qr4veQV5uL1dAIYrXA=;
	b=fxHYPA0y490ySRRaI+Ew/229aCO/TeUTWvw3My8s0Y/ybAlV0Dr/e+mn6NyTne6zMb0eLm
	w824UqsUTq7vi+BA==
Date: Thu, 10 Oct 2024 09:01:18 +0200
Subject: [PATCH 16/28] x86: vdso: Access rng vdso data without vvar.h
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
Message-Id: <20241010-vdso-generic-base-v1-16-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2664;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mPoW5wkTlEwrk7j/HBgEku1axNP1bE6//krdhLeEj6A=;
 b=SOS85n3wR1QQHupApY/YV5xsjsehWzr0JxWLt8ReYzlvQC1/64wff4+HN/GVvYTspFT1+NgJm
 f2EbWP1fw2vAOLJykZQlYW9djXtP20HkUIkKEWSQ98SEQdV4MsIKmia
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The vdso_rng_data is at a well-known offset in the vvar page.
Make use of this invariant to remove the usage of vvar.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 2 ++
 arch/x86/include/asm/vdso/getrandom.h | 8 ++++----
 arch/x86/include/asm/vvar.h           | 5 -----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index 51c0cc0119748dda0f29d577197c520f272fd02f..acce60732e541f49dfc21d75e1b525c8a74f2341 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -24,6 +24,8 @@ SECTIONS
 #include <asm/vvar.h>
 #undef EMIT_VVAR
 
+	vdso_rng_data = vvar_page + __VDSO_RND_DATA_OFFSET;
+
 	pvclock_page = vvar_start + PAGE_SIZE;
 	hvclock_page = vvar_start + 2 * PAGE_SIZE;
 	timens_page  = vvar_start + 3 * PAGE_SIZE;
diff --git a/arch/x86/include/asm/vdso/getrandom.h b/arch/x86/include/asm/vdso/getrandom.h
index d0713c829254cc8172c5903a1fdba168b52ff1ea..2bf9c0e970c3e7d2a2ddfcb1d007cb73da200494 100644
--- a/arch/x86/include/asm/vdso/getrandom.h
+++ b/arch/x86/include/asm/vdso/getrandom.h
@@ -8,7 +8,6 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/unistd.h>
-#include <asm/vvar.h>
 
 /**
  * getrandom_syscall - Invoke the getrandom() syscall.
@@ -28,13 +27,14 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
 	return ret;
 }
 
-#define __vdso_rng_data (VVAR(_vdso_rng_data))
+extern struct vdso_rng_data vdso_rng_data
+	__attribute__((visibility("hidden")));
 
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
 {
 	if (IS_ENABLED(CONFIG_TIME_NS) && __arch_get_vdso_data()->clock_mode == VDSO_CLOCKMODE_TIMENS)
-		return (void *)&__vdso_rng_data + ((void *)&timens_page - (void *)__arch_get_vdso_data());
-	return &__vdso_rng_data;
+		return (void *)&vdso_rng_data + ((void *)&timens_page - (void *)__arch_get_vdso_data());
+	return &vdso_rng_data;
 }
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/x86/include/asm/vvar.h b/arch/x86/include/asm/vvar.h
index fe3434d3b5b1eef806e8328b86650e001b177de2..b605914f4d4347c16344e5b5e063697538d4895e 100644
--- a/arch/x86/include/asm/vvar.h
+++ b/arch/x86/include/asm/vvar.h
@@ -62,11 +62,6 @@ extern char __vvar_page;
 
 DECLARE_VVAR(0, struct vdso_data, _vdso_data)
 
-#if !defined(_SINGLE_DATA)
-#define _SINGLE_DATA
-DECLARE_VVAR_SINGLE(__VDSO_RND_DATA_OFFSET, struct vdso_rng_data, _vdso_rng_data)
-#endif
-
 #undef DECLARE_VVAR
 #undef DECLARE_VVAR_SINGLE
 

-- 
2.47.0


