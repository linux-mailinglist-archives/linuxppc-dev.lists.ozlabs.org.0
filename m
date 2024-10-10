Return-Path: <linuxppc-dev+bounces-1939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435C997E58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKj4mSdz3btt;
	Thu, 10 Oct 2024 18:02:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543737;
	cv=none; b=BKehu11a9pyzpoVWE2QE5hwVGkDxoiopr3RRzTyfhSskgOVk2VEE8D6SflKJWcmdNi3Frh3ofeIb4/r8DfMazKe4UXT91u6GEHaIYZtTIl1iWv3Cra2DDxLqfNwFHM4uVte83yGDhklKUPIRfwKqYaMpPjXup4ApgID/v0qEnD21goOfAGdYlU+98k2zTezwBSe2EcaLVxBUWwMcbxWFGodq7MqfV0J9ghAud5C/qRrf/ZhmqjwS6nOuSsC+N5yKI5eU9wQW7iQ+DD8jhdeZtgnOfKW5nOzJZ/J9Mdss1TV2ep8ysaWjbmZ9Y20Ae+MHQasgprCxPIbC+eM0M318TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543737; c=relaxed/relaxed;
	bh=pTDHXF1sOudHK9HTgJ3ZTP/z4LvNJlDw5+zHCbtMvNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bIfq/CKWgs/l0ysW7AoiiI/iRxM2OOpMmbvaEPLgotvJB2RpmUGNIVr2T2agLPBs33lNYQAh3mqFY/sXO4ISufM7QlViSfJk5iEjBDNM24GCgH52v6Vsc4CDPwgEasRLXhbM6p6lGKkDpQXFq4s995mI8HmB54kFKoZhu/Gdg9DPuMnvCxoG97iEBTNHUYylphHTn0D5PmDzIf9YlOdPKuoBU/nwpUjpwBB5GR2bMqGT6MeE/frkbYvod1O0HDC+mfJZX5gDzoiKAa+BlyGTHitDubHtHwYCM7tlO3OtBBmH66YAF8mPa0rqiye032ur17DGqisWQRO8tN2jlTiQYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IXPj8BsB; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/pXZLgo9; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IXPj8BsB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/pXZLgo9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKh3ZXWz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:16 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTDHXF1sOudHK9HTgJ3ZTP/z4LvNJlDw5+zHCbtMvNM=;
	b=IXPj8BsBAaBJJo6BSnCng0U9zvdKWSexCp/crIPo01FLTZ3KLknEHD05xs2zGGyyGEwG6A
	hIbbfRja/Dcy7E/Zvjjx7Xi96P8RkS17Lxa+cdFgxgcti2TkPG/Ec4ZyTTN71dMn7D2iFS
	HqKrDqHpAf+mtMU37wFllkN+XvVj1lDsK5Eb4knhaA7ilJjK2YoCbJzSh8V8i/byIXNRei
	GbwHMWUiZoKERjEuK9GqCNMuQuSx3XNpX8Ss9WMBVkLa/2PiIXcqweN9EDkMW7pqswVMqo
	oGYnunOLuA9mjVGKNNd3lYgB4h3K5umej4H4/6vuZnbO905CmaX6tCzcHXmm7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTDHXF1sOudHK9HTgJ3ZTP/z4LvNJlDw5+zHCbtMvNM=;
	b=/pXZLgo9teG+rpHkWGFQdrgLKaFfaO3Fy4aaVilmn7MMBZyqnuuk0hC/lmBDVh98h1zpkr
	xDB7CM44QmWupDDw==
Date: Thu, 10 Oct 2024 09:01:21 +0200
Subject: [PATCH 19/28] x86: vdso: Delete vvar.h
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
Message-Id: <20241010-vdso-generic-base-v1-19-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2578;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=GYrZ3540s+yI5XrDQH6lzPIgpeuMXgvmbbzBwr4UTdY=;
 b=cNDbhwtIfZQJl4q90Ucvyl7QhSMhfxxnVr9lAnUgI3D3zJ3nXxxrBLs/Lik9O3tOnAZKXtlXH
 m/pkG9UlHaICKCxx+pnrXebwBNjf8QJF5447iEn5RV+2yQ7yg/FWVsi
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

All users have been removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/asm/vvar.h | 66 ---------------------------------------------
 1 file changed, 66 deletions(-)

diff --git a/arch/x86/include/asm/vvar.h b/arch/x86/include/asm/vvar.h
deleted file mode 100644
index d95cf92296ef6acf66089a734465eda4cba9154c..0000000000000000000000000000000000000000
--- a/arch/x86/include/asm/vvar.h
+++ /dev/null
@@ -1,66 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * vvar.h: Shared vDSO/kernel variable declarations
- * Copyright (c) 2011 Andy Lutomirski
- *
- * A handful of variables are accessible (read-only) from userspace
- * code in the vsyscall page and the vdso.  They are declared here.
- * Some other file must define them with DEFINE_VVAR.
- *
- * In normal kernel code, they are used like any other variable.
- * In user code, they are accessed through the VVAR macro.
- *
- * These variables live in a page of kernel data that has an extra RO
- * mapping for userspace.  Each variable needs a unique offset within
- * that page; specify that offset with the DECLARE_VVAR macro.  (If
- * you mess up, the linker will catch it.)
- */
-
-#ifndef _ASM_X86_VVAR_H
-#define _ASM_X86_VVAR_H
-
-#ifdef EMIT_VVAR
-/*
- * EMIT_VVAR() is used by the kernel linker script to put vvars in the
- * right place. Also, it's used by kernel code to import offsets values.
- */
-#define DECLARE_VVAR(offset, type, name) \
-	EMIT_VVAR(name, offset)
-#define DECLARE_VVAR_SINGLE(offset, type, name) \
-	EMIT_VVAR(name, offset)
-
-#else
-
-extern char __vvar_page;
-
-#define DECLARE_VVAR(offset, type, name)				\
-	extern type vvar_ ## name[CS_BASES]				\
-	__attribute__((visibility("hidden")));				\
-	extern type timens_ ## name[CS_BASES]				\
-	__attribute__((visibility("hidden")));				\
-
-#define DECLARE_VVAR_SINGLE(offset, type, name)				\
-	extern type vvar_ ## name					\
-	__attribute__((visibility("hidden")));				\
-
-#define VVAR(name) (vvar_ ## name)
-#define TIMENS(name) (timens_ ## name)
-
-#define DEFINE_VVAR(type, name)						\
-	type name[CS_BASES]						\
-	__attribute__((section(".vvar_" #name), aligned(16))) __visible
-
-#define DEFINE_VVAR_SINGLE(type, name)					\
-	type name							\
-	__attribute__((section(".vvar_" #name), aligned(16))) __visible
-
-#endif
-
-/* DECLARE_VVAR(offset, type, name) */
-
-DECLARE_VVAR(0, struct vdso_data, _vdso_data)
-
-#undef DECLARE_VVAR
-#undef DECLARE_VVAR_SINGLE
-
-#endif

-- 
2.47.0


