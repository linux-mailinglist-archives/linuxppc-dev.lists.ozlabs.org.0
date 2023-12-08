Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0BA809C1F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 07:02:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NM4Seqp+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmgXG5632z3d8R
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:02:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NM4Seqp+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmgN31ngbz3d95
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 16:55:15 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d045097b4cso13297005ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 21:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014912; x=1702619712; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOdH6gQ2/kSr11qF6anDkZP04y2oGGJwChsMHemqfok=;
        b=NM4Seqp+H6qZf7oeoLaWGj9uG5Vq3rIZBZ+SoWWz55TnstDg2K3LVMIrL2fZshuyCw
         u9fnDk0PoLVd3qE9N5ZCO799PYw8LNujpI5Bx7Fgi5CXT2vPp4iiTjJzYxiZJiYrMmZj
         7dxiyDiFMuDyBLPkqE2LAK2pEsRO/PygSEZ/Q631gtb3RwPgl0UkolFea7bBeaFowViG
         14WhC3GmkvWPIECUMynOZxCupR+5zBgyuSzsZZ7GpeSEVVBPX/CLDMdMnPqIcInb+yMZ
         ECRniZkwpAwzUVUKCboy4LQp4RKlDqVyXGCovmcZnORv6Uo/YpEdvUuMWxEDSJvWdfqp
         Fcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014912; x=1702619712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOdH6gQ2/kSr11qF6anDkZP04y2oGGJwChsMHemqfok=;
        b=wsroK35oSeOPjso491JE4MrMqXITJEFf/7FxrCf4TYKAcJHpxlDHpkfHgAb/4iz1B8
         2c4e/m+6ukWtD0j6aCxK9cNfsDMynV9MsmWbI7Z9ca9znOUyg6P9DelTaVHWm/zKwkKr
         Dd+iqCyWKiClozSTkQdWN970XBRrLAEP3nKDmgBm3ctawZWLXr+Ybr6lhUMNWc3CsPb2
         EG0Secktk9wM4BXIjoJGhxyGgRV9ZIFGsICtFGld6Cnh4tTA11IJHKr+yn9zuP2fuebs
         FWgwMaB61AgbaFrE2mhAWzFGgH0Wuk6IW0Uuu/ve6oaYYhvtrl4Us3rK6XjxULIybDnP
         SSsw==
X-Gm-Message-State: AOJu0Yw8SyJNS/pSjFiKKraQ1aL7YamqCSQWKdvOIaSLStlzmu9/LhTA
	IidgJkrOJfiX4IOsS0OgQutFLA==
X-Google-Smtp-Source: AGHT+IF6KW8xi8WlWkg/kkkF64YaWdAU9w8XTSDFOxfj/W9T6fcHp2B4VJ43fwnOYGHYYluHTLhnIQ==
X-Received: by 2002:a17:902:64d0:b0:1d2:eea4:a7d7 with SMTP id y16-20020a17090264d000b001d2eea4a7d7mr180399pli.5.1702014912711;
        Thu, 07 Dec 2023 21:55:12 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:12 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Subject: [RFC PATCH 08/12] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:38 -0800
Message-ID: <20231208055501.2916202-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

x86 already provides kernel_fpu_begin() and kernel_fpu_end(), but in a
different header. Add a wrapper header, and export the CFLAGS
adjustments as found in lib/Makefile.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/x86/Kconfig           |  1 +
 arch/x86/Makefile          | 20 ++++++++++++++++++++
 arch/x86/include/asm/fpu.h | 13 +++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/x86/include/asm/fpu.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3762f41bb092..1fe7f2d8d017 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -81,6 +81,7 @@ config X86
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64
+	select ARCH_HAS_KERNEL_FPU_SUPPORT
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1a068de12a56..71576c8dbe79 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -70,6 +70,26 @@ export BITS
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 
+#
+# CFLAGS for compiling floating point code inside the kernel.
+#
+CC_FLAGS_FPU := -msse -msse2
+ifdef CONFIG_CC_IS_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
+#
+# The "-msse" in the first argument is there so that the
+# -mpreferred-stack-boundary=3 build error:
+#
+#  -mpreferred-stack-boundary=3 is not between 4 and 12
+#
+# can be triggered. Otherwise gcc doesn't complain.
+CC_FLAGS_FPU += -mhard-float
+CC_FLAGS_FPU += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
+endif
+
 ifeq ($(CONFIG_X86_KERNEL_IBT),y)
 #
 # Kernel IBT has S_CET.NOTRACK_EN=0, as such the compilers must not generate
diff --git a/arch/x86/include/asm/fpu.h b/arch/x86/include/asm/fpu.h
new file mode 100644
index 000000000000..b2743fe19339
--- /dev/null
+++ b/arch/x86/include/asm/fpu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_X86_FPU_H
+#define _ASM_X86_FPU_H
+
+#include <asm/fpu/api.h>
+
+#define kernel_fpu_available()	true
+
+#endif /* ! _ASM_X86_FPU_H */
-- 
2.42.0

