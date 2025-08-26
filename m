Return-Path: <linuxppc-dev+bounces-11290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78469B35434
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yD11tqTz3dJp;
	Tue, 26 Aug 2025 16:18:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189132;
	cv=none; b=PKWZbz7WvMeeBaP/9Rp0T6nLSqb32BFB6Gz3q7VxJl0W+8d45q52Hj6kdUiVrEyCPlg/WmBFfp8DrrltcgUVK06ejFT7+OlTD1SAULA19Eaq5PXhV4doP9Jpenfk85Qc1BXZttTmjIW6jY2QDJOgtDi0TwLU3FNU51YKCBARjP0JnnIaBwx6mRQ+8+nCh25OuOZBIUNzdkAWKr0qX1va9EI7tv7fVire2esjPjfm2c7vN/GlbiEJIaHLbog8O5QLHBrthif9+AaLrObnvWyWrm8SyUD8oHM3zggFmMb2oD8+dK+B08jTS8Pb/lYeXCXxKfDQE0lRLUoRSAnKM2oPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189132; c=relaxed/relaxed;
	bh=K6H2kK7oB9XL3kf3qEPW1KLZGm1z/W4mCckKnzb/rKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4SWKKyG0MmsV1b2wVh1HaCiHLFqt19CCbkblwFiFjHGGBuzg2AMX7F1yQ/KVO3E2DGgof6fKLA5dHyJ/CZAOWf0/Y0j+SSVLwmLruXI1Bgr47OMs8NXgr7Rgq5iPyLvKziEO2o86du+jIo+dmE8dTsN2+NbNi9aza++jGL+eZ0vbLvk4iLV/J9tsGpCCS5a6dsHGNz4OQOSClBXkaZr+b4+uzsWOkJ+aUuEjblaCZCT/F5PrTbabgaXO/k5F1rx/Kq6kXKP75UFkrqXRtJIceI77H6HnY90yAfVg2tvjO5zgckweatIWgwpOIcVFNl32guRumDCndzDoQDtH1iGSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qt50fHhk; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4r2qNWGA; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qt50fHhk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4r2qNWGA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yCQ0lfcz3dHw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:25 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6H2kK7oB9XL3kf3qEPW1KLZGm1z/W4mCckKnzb/rKs=;
	b=qt50fHhkADqQAuGueYGo1TQTCS9pRKukjkJcKGMOVdY+09d6hUTKCyc1AyfhiAYF831YBL
	4q99aXnzXtByc6BFg3oxoOao3aYxAJC/4V4yv6pRmF5M82cdIFMVR2cYlHIKLsm2rpv9id
	oUjPKAO+oKu1SN3APxKQuqKX/DGssbMKCw4Xz2n4zZRJ7UN5maoM+zI/Lf0RlegSXAgyuq
	/yWxcu5VK+/r04Tbb+GtsRhZKDrv/mWRyQGwmgm3a7+vendx0i7Ty/I1Fshrv0+b0ZWwlG
	SH+n/VsvVlEtE2tm2DP+xUhGKNTJBp08j1K4fjgxsZPCn8yrdRPmmOis69Lp3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6H2kK7oB9XL3kf3qEPW1KLZGm1z/W4mCckKnzb/rKs=;
	b=4r2qNWGAXu/UOi8WftkYX57YkiorzJNR/wCQ1OowTx3aIeHRybvVVg1TQp7nZhB0xzChNO
	mlSahIjP53UFu/BQ==
Date: Tue, 26 Aug 2025 08:17:06 +0200
Subject: [PATCH 03/11] vdso: Move ENABLE_COMPAT_VDSO from core to arm64
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
Message-Id: <20250826-vdso-cleanups-v1-3-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=4201;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jRrDQXs97w6WapLhaOa7Pkm+jLScLDYfjSl6yi3XN18=;
 b=zVe/bWMXPBpBICIiM3Xs7CuOoAOqkdw7N9nfQnVMF1yQFhNpPWnyujMRcuO3pxZbGv51ey0DT
 uPROdPxZB3gDVO9rZsFSY0vOzcTTDPeOEOBO9SI9WjiLictQ4yCGkTS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The ENABLE_COMAPT_VDSO symbol is only used by arm64 and only for the
time-related functionality. There should be no new users, so it doesn't
need to be in the generic vDSO code.

Move the logic into arm64 architecture-specific code and replace the
explicit define by the standard '#ifdef __aarch64__'.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/compat_barrier.h      | 7 +++----
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 6 +++---
 arch/arm64/include/asm/vdso/gettimeofday.h        | 8 ++++++++
 arch/arm64/kernel/vdso32/Makefile                 | 1 -
 include/vdso/datapage.h                           | 4 ----
 5 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/compat_barrier.h b/arch/arm64/include/asm/vdso/compat_barrier.h
index 3ac35f4a667cfc8c03fb6b6913c5a02b230a1659..6d75e03d38274a6b8549ab10a0f3c9732e7fae56 100644
--- a/arch/arm64/include/asm/vdso/compat_barrier.h
+++ b/arch/arm64/include/asm/vdso/compat_barrier.h
@@ -7,11 +7,10 @@
 
 #ifndef __ASSEMBLY__
 /*
- * Warning: This code is meant to be used with
- * ENABLE_COMPAT_VDSO only.
+ * Warning: This code is meant to be used from the compat vDSO only.
  */
-#ifndef ENABLE_COMPAT_VDSO
-#error This header is meant to be used with ENABLE_COMPAT_VDSO only
+#ifdef __arch64__
+#error This header is meant to be used with from the compat vDSO only
 #endif
 
 #ifdef dmb
diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index d60ea7a72a9cb3457c412d0ece21ed76ae77782d..7d1a116549b1b98d6eb7a78d053958c6a71799ec 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -2,8 +2,8 @@
 /*
  * Copyright (C) 2018 ARM Limited
  */
-#ifndef __ASM_VDSO_GETTIMEOFDAY_H
-#define __ASM_VDSO_GETTIMEOFDAY_H
+#ifndef __ASM_VDSO_COMPAT_GETTIMEOFDAY_H
+#define __ASM_VDSO_COMPAT_GETTIMEOFDAY_H
 
 #ifndef __ASSEMBLY__
 
@@ -163,4 +163,4 @@ static inline bool vdso_clocksource_ok(const struct vdso_clock *vc)
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __ASM_VDSO_GETTIMEOFDAY_H */
+#endif /* __ASM_VDSO_COMPAT_GETTIMEOFDAY_H */
diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index da1ab87595925fdfa74fd10d0c9548f109970588..c59e84105b43cdb0c823da3dd793a83781f84302 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -5,6 +5,8 @@
 #ifndef __ASM_VDSO_GETTIMEOFDAY_H
 #define __ASM_VDSO_GETTIMEOFDAY_H
 
+#ifdef __aarch64__
+
 #ifndef __ASSEMBLY__
 
 #include <asm/alternative.h>
@@ -96,4 +98,10 @@ static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(
 
 #endif /* !__ASSEMBLY__ */
 
+#else /* !__aarch64__ */
+
+#include "compat_gettimeofday.h"
+
+#endif /* __aarch64__ */
+
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index f2dfdc7dc8185bc045907283b68ab18fed980312..230fdc26796aa5ba561519bcf2de8ccd7ad3b9f8 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -59,7 +59,6 @@ VDSO_CAFLAGS += -DDISABLE_BRANCH_PROFILING
 VDSO_CAFLAGS += -march=armv8-a
 
 VDSO_CFLAGS := $(VDSO_CAFLAGS)
-VDSO_CFLAGS += -DENABLE_COMPAT_VDSO=1
 # KBUILD_CFLAGS from top-level Makefile
 VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                -fno-strict-aliasing -fno-common \
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 02533038640e53c40291c7e09139e0f9b32f502a..0b1982f15de427723c9ff8502ca1eaa195f9a6a1 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -196,11 +196,7 @@ enum vdso_pages {
  * - clock_gettime_fallback(): fallback for clock_gettime.
  * - clock_getres_fallback(): fallback for clock_getres.
  */
-#ifdef ENABLE_COMPAT_VDSO
-#include <asm/vdso/compat_gettimeofday.h>
-#else
 #include <asm/vdso/gettimeofday.h>
-#endif /* ENABLE_COMPAT_VDSO */
 
 #else /* !__ASSEMBLY__ */
 

-- 
2.50.1


