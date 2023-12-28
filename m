Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FED81F3D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 02:45:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=jqVRKYVV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0rtZ6hwPz3d8y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 12:45:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=jqVRKYVV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0rq964JMz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 12:42:29 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bbc648bed4so789103b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 17:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727747; x=1704332547; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB0U1us+sHbYZzCVyIg23Xjh36gyEMV3F74ABUc7NA8=;
        b=jqVRKYVVDBNVu7Km4/89KJn0nR3/4PYJA4UPFl6Pv4kfrDKFZg/RMzfTVMnRNWdRAY
         BvyU0qMn6QPyZbRX9QQj8JCEn9/zQnS752cfZhB6NqddATT4YBsJjsPllxZsu46okDk+
         Ma+Uyj9CMBFbZt97L7NXglzs2UP92zdG7WAmi+Q+3UDTWeIl0I250O/GDuuont8myZ2p
         xYlep5m0hwVjgUuGQx1v7Fueds/XuHkqjIT6jj4PivX+X5/+CypxMFIvNyoN+6TK2p1o
         FXGKYg0od1WM1zbuuGJf8HYhw28qgwpgPnKUN6nuo+pJt4dMtsSdRqsYDN/Xo5U0ESdh
         fJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727747; x=1704332547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB0U1us+sHbYZzCVyIg23Xjh36gyEMV3F74ABUc7NA8=;
        b=lbeX/QAc5iKLuXf88Fyolxrchx6/Tpoe8lxns85kff3FnbH4DzWcV5fDVdGebtOVqL
         ppwTz2E3O4snVYO430yTIaFu9MCdoqGS2aMlRX0wj4yj66N0R1i9UPSaQ88EH0UM8BBd
         2zlytTAsN420zS2lhoF7g7qaSV9uwRhirenNf2LHNdfRkuIN5TPI2wNjpCsICf3v7A2P
         PaepJWvVPEFguu+3LMoDqXXkxuI7aq5vtFs211lVZUa/zh4wHpS+iHDzXJMEo+yB9fgY
         cNWYPtaPHD6DsZhwy0L39pQp5Y4Ql22sXNUy2qYeJCeLlBNf84ewMJmiNAowYXRLmaY3
         0XjQ==
X-Gm-Message-State: AOJu0Yw2YyfdTOpeyriEY7FQsCgwXOb3EfipWdmK+TdTVDvKaNMY1rHv
	RTroNYJ5XAZz+ERMFZO4OEqmnXkImklQlw==
X-Google-Smtp-Source: AGHT+IGpivtFhMAB3UbcfS1StWXrUWSkj+hLT17JMH2Q4rov0k82hYGdvWTiR/shQbloO22mN5mO3A==
X-Received: by 2002:a05:6808:148e:b0:3bb:c453:df38 with SMTP id e14-20020a056808148e00b003bbc453df38mr2614480oiw.60.1703727747728;
        Wed, 27 Dec 2023 17:42:27 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:27 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 04/14] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:54 -0800
Message-ID: <20231228014220.3562640-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Samuel Holland <samuel.holland@sifive.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arm64 provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Remove file name from header comment

 arch/arm64/Kconfig           |  1 +
 arch/arm64/Makefile          |  9 ++++++++-
 arch/arm64/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/fpu.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b071a00425d..485ac389ac11 100644
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
index 9a2d3723cd0f..4a65f24c7998 100644
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
2.42.0

