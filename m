Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACE88EFAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 21:02:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=TQFqRuSj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4cz54mzvz3vb4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 07:02:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=TQFqRuSj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4cyM6Tfvz3dXg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 07:02:03 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dee5ef2a7bso1953915ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569721; x=1712174521; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im7zmQeDt7pZodE0p+VySjAa7DBv0KaW+gKoLu+LS/g=;
        b=TQFqRuSjPZQrKwtEBtev3Ox8HR0Yp9PCd3uW2aYUa1S5jyKOC0hqH0vQ8384Vsgzw+
         euRlv0CuFyKES7Gb9RrkvYKh/7UZ2ziTyENoP3Z8qW4wFjiniw5cNpX4pujnSIPVCh6G
         Rv9HAVf1AI34VOTG0c8IPWZwefPMtidwUi2LX+08K5DLPt4hhwITfp7g26qisels6yrO
         Wt1Qhr6/UGZDyFnLucTICFVCuF4UnN2CFrhgjej6Uyyei4OJRxHLbLDvdhzm5g9swlac
         hAVCD86Ir6/AxIkxvZZ21zNzOkVLylBBaQ86zoCuBGccuiqIhlDqqC+IdaSJqa6L2xS7
         M9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569721; x=1712174521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=im7zmQeDt7pZodE0p+VySjAa7DBv0KaW+gKoLu+LS/g=;
        b=Baohb2VbLqrVE4oey4Bs+Ql8pUXCB0HtpdqJ6KSfjsXtBZhkyecMR6k2N1hGym6VIs
         Q1s1pq5NYuwsoPUYw1VibblBxiZO4ui23sS7FZ8zeodztRvgRj4/eYWZ5B7oBC4bkfZ6
         94yI2+dxu26vKy15csADyg38D2PqFFARuN6xnW4qAeP0Fgku9zhBf0NYN3UQpVc6o5nT
         KiJXQ0E3MDyal4bxK6B/WU8puGixPLQ/ge6UHn5hcPFeZmW7budxV+WNg3sTew5zhXWN
         0ig8pdY4KAOZucoal3whaiM68fstYJY18C8Kolre7Gt/z9s6i7a18RQP7MuiXIjI+0dl
         RUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKLNlaJ+SVpioZqQAMnvBnB+6LIVeOkQCQVJ046MXoP368vgMZWTkb223uhlWv5v0gpWU04+DPW8N7UZlBOJdKFH/PbPil4XL8CgXIgA==
X-Gm-Message-State: AOJu0YzIMXwLVrx2A7yqeP+il27ROjdqUBW9KX6/6AcYFxPTkPNsOGIJ
	KvUJOzSwN9dY++C43i+T3sUTvNczQIncvKPamFlBKsTepNHzOkYBxqak/cGAyIQ=
X-Google-Smtp-Source: AGHT+IF+ykWlXq/2p9fLdxe5qiT+fQJVLXU8yD1cTqgZWIiJ9yzpflW/8jhLl1LVX7Yz7XdGYJsgng==
X-Received: by 2002:a17:903:28e:b0:1e0:d6ce:7e16 with SMTP id j14-20020a170903028e00b001e0d6ce7e16mr805365plr.15.1711569721663;
        Wed, 27 Mar 2024 13:02:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:01 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v3 02/14] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:33 -0700
Message-ID: <20240327200157.1097089-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, Russell King <linux@armlinux.org.uk>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ARM provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Remove file name from header comment

 arch/arm/Kconfig           |  1 +
 arch/arm/Makefile          |  7 +++++++
 arch/arm/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/arm/include/asm/fpu.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b14aed3a17ab..b1751c2cab87 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index d82908b1b1bb..71afdd98ddf2 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -130,6 +130,13 @@ endif
 # Accept old syntax despite ".syntax unified"
 AFLAGS_NOWARN	:=$(call as-option,-Wa$(comma)-mno-warn-deprecated,-Wa$(comma)-W)
 
+# The GCC option -ffreestanding is required in order to compile code containing
+# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
+CC_FLAGS_FPU	:= -ffreestanding
+# Enable <arm_neon.h>
+CC_FLAGS_FPU	+= -isystem $(shell $(CC) -print-file-name=include)
+CC_FLAGS_FPU	+= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
+
 ifeq ($(CONFIG_THUMB2_KERNEL),y)
 CFLAGS_ISA	:=-Wa,-mimplicit-it=always $(AFLAGS_NOWARN)
 AFLAGS_ISA	:=$(CFLAGS_ISA) -Wa$(comma)-mthumb
diff --git a/arch/arm/include/asm/fpu.h b/arch/arm/include/asm/fpu.h
new file mode 100644
index 000000000000..2ae50bdce59b
--- /dev/null
+++ b/arch/arm/include/asm/fpu.h
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
2.43.1

