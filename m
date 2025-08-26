Return-Path: <linuxppc-dev+bounces-11295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B16B3543E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yDY5qL7z3dKp;
	Tue, 26 Aug 2025 16:19:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189165;
	cv=none; b=FayN1nee9aEEaTu8mOMjjnnVNqjLUq3n8CX2oD1SgH4UftyKsUkiFyTaHoEEInA7junt4wodcCqHOovLD3H2lJx9mOH7DQT9wlapn5wCUWEs1wfIPBujJRdCGXdzZ/+bqTS4YBZXhbU1v6azD0ZRbh0OHZ8X94D9T22M+fWHOvId0d8krIm0SkcY+OLvQzTcEU8D05bAqQVBmKKD7Dw09mawAdthG0Vn97mL92LFx3tJeP5C6ezlrPDiPGhS4eiQfWNlXSq+R8hIBeeecFsTY1FfKWGIMsG3ecTQRI5lUOw38dVPpBeQuVUNnKHQAxFH7WAGwmezHoFidKL51q6PHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189165; c=relaxed/relaxed;
	bh=00y01OmKPjr+YdPvdy9NsH/C2OJJ9fAEykZ3VyZpYfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAuobJyALfotdwpLARDDwGejH0JnAFqvO9kUPdpx9kruWftKwASUi3z4hhme+deZaOWBp48Q2DpS/78tYFCpUTFIGtFaOTUUoMwSvE2A7wxA1NAR+zjcgAi9UgkoIA4BRScPxX1S/Gb7CAPR2ZcPeNEs+34Ss9nRmbAIFaeJ/3Z4JXQxx7PPCMrepaOGMr1XZ+x0nulZ6oV5t/jMg41WeCDLigON23raZ3K8YhMdcq4BjNbuSCl9toAGyre8yOEn5DbGKV6DBzNDpGdp2c0Zso5rpp8hU8D3hVvslyVReSlwX8INi3ahAna8vzOXgLaR7GEu0fdC0yWODF8tKMM5tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DAc4iLrK; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AX9iVgCX; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DAc4iLrK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AX9iVgCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yDB4bH0z3dK1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:19:03 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00y01OmKPjr+YdPvdy9NsH/C2OJJ9fAEykZ3VyZpYfg=;
	b=DAc4iLrKuN+M+TOt2+xBDr6GUf8Y+cWVjZjW54ZqF9gbyUcomycDMYt0MNd+RCDVDFxGIj
	GWBLzIDOIEBZI2Q3+lI6pDJsjVzN2ky5/94njRSPQaA7XWRC7BOPy1Mz55nIW5YH/9cDx7
	G6899qdmXG1N5aBrGBR5SbfPnYPkKZ8njo6qC7PIonCtPdxCvUB9VNos964+cOQgPbd5r6
	w8cIWWRNKPfx4djdnrulbwrK8dHtTKzVUsXIVZl+HtzorafUAt8NuoNQ1iKJJlZTyBZjSa
	SAC2qNDuNew7qNYdA2d8Y7fs4rF9WW+J9j0qgdNerC8HQxVUXghOykmTYnFhcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00y01OmKPjr+YdPvdy9NsH/C2OJJ9fAEykZ3VyZpYfg=;
	b=AX9iVgCXqKuu4L6HhXkJ+97B1ymhvpjttVlSkJHN09WecyWSAf6K0wAjn4fwnsw/AEPVrD
	zB+AR9YgMKMJ1XAQ==
Date: Tue, 26 Aug 2025 08:17:13 +0200
Subject: [PATCH 10/11] vdso: Drop kconfig GENERIC_VDSO_TIME_NS
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-10-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=5371;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=N7oBdG4JS+7twrqHzr/Z86nbv0D0RBhgF8hDZPGWiNM=;
 b=vy3GZ3Eshc21Vat8tHZboKb1mtEwhlFsFG8/DJ24/IXqJYOQoeYjtQ3coAR4v/XIPXTGTA7XY
 6MLp0cx58eVBMdqbybOMVOS4l6C3HhEy0OibmDevHkFXDXmPSE/hSy/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All architectures implementing time-related functionality in the vDSO are
using the generic vDSO library which handles time namespaces properly.

Remove the now unnecessary kconfig symbol.

Enables the use of time namespaces on architectures, which use the
generic vDSO but did not enable GENERIC_VDSO_TIME_NS, namely MIPS and arm.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
Technically this is still too restrictive, as it prevents architectures
without a real vDSO to enable CONFIG_TIME_NS. Right now this restriction
only protects the SPARC vDSO. I have patches to drop it completely,
as soon as SPARC is usingthe generic vDSO.
---
 arch/arm64/Kconfig                   | 1 -
 arch/loongarch/Kconfig               | 1 -
 arch/powerpc/Kconfig                 | 1 -
 arch/riscv/Kconfig                   | 1 -
 arch/s390/Kconfig                    | 1 -
 arch/x86/Kconfig                     | 1 -
 init/Kconfig                         | 2 +-
 lib/vdso/Kconfig                     | 6 ------
 tools/testing/selftests/pidfd/config | 1 -
 9 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b0f007b396c81906d3a0a66f8a240d97e0ae2d88..e19b006842e223441b87370a5ae23756e0e85883 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -162,7 +162,6 @@ config ARM64
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_GETTIMEOFDAY
-	select GENERIC_VDSO_TIME_NS
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT
 	select HAVE_MOVE_PMD
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d15b201d55f951d95435a38789cf47ea9f0adac9..754626b58b929e605d51c441cfa862bd504b5892 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -108,7 +108,6 @@ config LOONGARCH
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
-	select GENERIC_VDSO_TIME_NS
 	select GPIOLIB
 	select HAS_IOPORT
 	select HAVE_ARCH_AUDITSYSCALL
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 78c82af955616c57ab38ea1241e3471eb8d0a65d..d715e3d65b5c29e0010b0a5e5821aee34e31e176 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -207,7 +207,6 @@ config PPC
 	select GENERIC_PCI_IOMAP		if PCI
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
-	select GENERIC_VDSO_TIME_NS
 	select HAS_IOPORT			if PCI
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f6cf9180ccf2c9774248fea93a8276de3791ad71..6e5efbeb83d7f0fe556bc04ec9f58b80d2780b43 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -121,7 +121,6 @@ config RISCV
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL if GENERIC_GETTIMEOFDAY
-	select GENERIC_VDSO_TIME_NS if GENERIC_GETTIMEOFDAY
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
 	select HAVE_ALIGNED_STRUCT_PAGE
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 696d2243d64b04e77b9b4631fc8bc301916b48ae..e06ebbd860da93a8c838113c3c1b946d51dfe1b4 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -167,7 +167,6 @@ config S390
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
-	select GENERIC_VDSO_TIME_NS
 	select GENERIC_IOREMAP if PCI
 	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1e74b2a356e42bdc0ede258f44e18ba29dd90174..d1961811e291e8adcf0b46fafbd53f0a44b5d25b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -181,7 +181,6 @@ config X86
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_GETTIMEOFDAY
-	select GENERIC_VDSO_TIME_NS
 	select GENERIC_VDSO_OVERFLOW_PROTECT
 	select GUP_GET_PXX_LOW_HIGH		if X86_PAE
 	select HARDIRQS_SW_RESEND
diff --git a/init/Kconfig b/init/Kconfig
index 83632025121937527523f5977a493bd3ae24ed9f..5c429a184d1b0550dda9f075ffcbffb68c6d8f50 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1346,7 +1346,7 @@ config UTS_NS
 
 config TIME_NS
 	bool "TIME namespace"
-	depends on GENERIC_VDSO_TIME_NS
+	depends on GENERIC_GETTIMEOFDAY
 	default y
 	help
 	  In this namespace boottime and monotonic clocks can be set.
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 48ffb0f6fa413ea7da4e43c7f7a24cb232b38ea1..3d2c2b90d193f984e3a202e701fa7f0bfa8f1938 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -12,12 +12,6 @@ config GENERIC_GETTIMEOFDAY
 	  Each architecture that enables this feature has to
 	  provide the fallback implementation.
 
-config GENERIC_VDSO_TIME_NS
-	bool
-	help
-	  Selected by architectures which support time namespaces in the
-	  VDSO
-
 config GENERIC_VDSO_OVERFLOW_PROTECT
 	bool
 	help
diff --git a/tools/testing/selftests/pidfd/config b/tools/testing/selftests/pidfd/config
index 6133524710f790c1f83af6f2b628de9b62eee6c3..cf7cc0ce02484e91799b7cb132447283f818d729 100644
--- a/tools/testing/selftests/pidfd/config
+++ b/tools/testing/selftests/pidfd/config
@@ -4,6 +4,5 @@ CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
 CONFIG_TIME_NS=y
-CONFIG_GENERIC_VDSO_TIME_NS=y
 CONFIG_CGROUPS=y
 CONFIG_CHECKPOINT_RESTORE=y

-- 
2.50.1


