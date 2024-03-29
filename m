Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E64891447
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:28:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=e4vij1Lv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5X7f20Hcz3vqJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 18:28:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=e4vij1Lv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5X3l1CvDz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 18:24:50 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so1061264a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697088; x=1712301888; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaG/5r11zMVVbJK9XMgdhlmzZC0nXZGHxxAlEP5YrDw=;
        b=e4vij1Lv1o0TNeR3dWHQ8j20xADz7rtNfLmgd+chFdRd22v+u2eOKv1Cp99RXuTPi/
         kbfySz9HwhNpNu0T0xdfdqOvBqj1djG5MTactic0l9pd870WSDCk9OMitcaztOMLUEYx
         91X6DCo3d1mwgcr6cDf+j0GwNecv5Crfu5HRPWpKmzNTj/sC/xZQAYk61x80FpweBZNG
         oiMnZ5g33OrrzCWuJSI4EHvX+UNKn/ANlMPyYrxdXYU1QfQTKHJRGsr6gnKgTrpGl2sd
         qH17QZMmy7c35HuLD6eoqz4zLs9c5ckw/b0O6IBJDDYgF7cgDM4/yOZ/wJXLJgN/ESyI
         YnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697088; x=1712301888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaG/5r11zMVVbJK9XMgdhlmzZC0nXZGHxxAlEP5YrDw=;
        b=cljtuovb+KKKF+imkbUWxOuC5g9i3A7VEnMawv24h4CIhXBLO4MvdJDEp6pLo9Y0oR
         TellbvhqNd4QJT/GJw3vTCzTWqkFBwqaOD+rCtVpUui092NP/NSgMCyNIQtWzXXmfAoY
         Lla66e4J9xuePlTZqCwxf8bvS30umBRftXBo+dBFCiwUJ2dZQGCd6cyqzpbOEwjWRsIR
         cz+cNx17HCjrCMyw2TcHPQeCEPjgRhQiDVCULzWHFtleNxAGbSPiPlUUtevhK6sfBe/3
         9oEcx1euABQj+GbKe1S5+1HbqzzO6mvXdwgNnzcYxdhLndRhrOVSM9mgMdIbpDM8K+De
         s8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUisJEbX5d2NjEiokJ90twueqZOsA0RxJd3qhwqMw1cA6OZDnTsz+89GwZk2i3G8BYA2WQ53pke6F6Ko1/luUKgqWZxQE7U0UqunNV2BA==
X-Gm-Message-State: AOJu0YyUXFDcVJothzb3PYHlh1x4a76nsVgZWGbz8aFUO80ExSPdmPaN
	ICy5WOOaivOb9aTU158mEQ18G/GOsgptZtPBnYaVjN5HosJbTTLRgipV6Lv2VhY=
X-Google-Smtp-Source: AGHT+IHyYuok2TNfdiOcE/l5igRa3fLGWQKdU9IqGK1Jb+NsKkae7YWqfCeB+c37aWtPbJ/1sA02qQ==
X-Received: by 2002:a05:6a21:6d9f:b0:1a3:55d2:1489 with SMTP id wl31-20020a056a216d9f00b001a355d21489mr1432790pzb.7.1711697088383;
        Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v4 04/15] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:19 -0700
Message-ID: <20240329072441.591471-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arm64 provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Remove file name from header comment

 arch/arm64/Kconfig           |  1 +
 arch/arm64/Makefile          |  9 ++++++++-
 arch/arm64/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/fpu.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b11c98b3e84..67f0d3b5b7df 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -30,6 +30,7 @@ config ARM64
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 0e075d3c546b..3e863e5b0169 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -36,7 +36,14 @@ ifeq ($(CONFIG_BROKEN_GAS_INST),y)
 $(warning Detected assembler with broken .inst; disassembly will be unreliable)
 endif
 
-KBUILD_CFLAGS	+= -mgeneral-regs-only	\
+# The GCC option -ffreestanding is required in order to compile code containing
+# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
+CC_FLAGS_FPU	:= -ffreestanding
+# Enable <arm_neon.h>
+CC_FLAGS_FPU	+= -isystem $(shell $(CC) -print-file-name=include)
+CC_FLAGS_NO_FPU	:= -mgeneral-regs-only
+
+KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
 		   $(compat_vdso) $(cc_has_k_constraint)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)
diff --git a/arch/arm64/include/asm/fpu.h b/arch/arm64/include/asm/fpu.h
new file mode 100644
index 000000000000..2ae50bdce59b
--- /dev/null
+++ b/arch/arm64/include/asm/fpu.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef __ASM_FPU_H
+#define __ASM_FPU_H
+
+#include <asm/neon.h>
+
+#define kernel_fpu_available()	cpu_has_neon()
+#define kernel_fpu_begin()	kernel_neon_begin()
+#define kernel_fpu_end()	kernel_neon_end()
+
+#endif /* ! __ASM_FPU_H */
-- 
2.44.0

