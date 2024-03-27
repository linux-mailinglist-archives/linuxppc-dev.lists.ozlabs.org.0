Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDA88EFE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 21:08:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=FPT11Mom;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4d5d2Rqpz3vk4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 07:08:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=FPT11Mom;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4cyW3hkPz3vYR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 07:02:11 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e0fa980d55so2147185ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 13:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569729; x=1712174529; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m88RK+Z/il7UccpWfFZJ13Lz8O1oGIqhXeprohKD33g=;
        b=FPT11MomyT3nQ9sxtgknYh901YpDYF63iz+6MWcMsCKJVVqyD/TVgfeqWTFvmkyysX
         zvv6RSETMJ24QlpcG+dAJfrA7tNxRfscJ4aQCiSQ0ptoWfX2cHqMaGg2rophl/iDlaG8
         N6PoM5aDOq/fgWpYP1xO9oGDAjURxsg5rftSGE+x0zX6l3M8d3mc9UCHTAsmTspGeDfM
         +WDHmARksW+WiQGntKbbEfJUSeSvDxKncNZMI6hgVMPqKvCvvb68ieAhYDDtvXyoj74D
         K5tqW0qXTXCyXF5CEFSEsKxKwZrh37ZKssNKx8E8ffQ+nJmXATe2CLAfT9o1taBhcDCd
         bAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569729; x=1712174529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m88RK+Z/il7UccpWfFZJ13Lz8O1oGIqhXeprohKD33g=;
        b=kOlL4qkyEaKD6wlMwq/8yoD0CMlKNoCu9Mq01gdwF4a2ApW3XhVAXKBbtSoQSzJVcZ
         PQT18oe9trwnCigKQLTL4ghBVUujQQ03vBngZKTf5qb8wEj87EVzooI89HggTk9VToLY
         o/D+KzW6xI98cM2JZ5/kmE2UiLTx5BcwqvtT6DE9BQ86Zjgh/0uGEXZSU+MaIhgPYV4W
         ZUfIsAE8pWnPb5s79GTyHyGv6suMumCtxrnB1M7t3Dden56wipbd6J+G0cMua+afUPtA
         CcJiJBBhV0v/kJW8zQDPGKa6r9Ic85SCcQ2v8EYwkxS0QU0TMpD1L3pgn4MDVEPc+fW7
         FVsw==
X-Forwarded-Encrypted: i=1; AJvYcCX31Fj7NFas5nSrUAE9wQlAEL30xcgjDGpE7yYK7TlrUjSPdiig19YFP/pof2HeRu5r3HhGjqEJIqVFytLbbPf8RRYhNFQk6djPSKUQYg==
X-Gm-Message-State: AOJu0YybjE+OuJDzRrcaf2oKKkuQxjW7B0e7ghwU9SkgO2Y9PwKGs32M
	pLTUnILczLwFY3MtHNtWVLQnEBQphuudbihhtREnJ/kQUICTLtwZSDFAUWhRwss=
X-Google-Smtp-Source: AGHT+IH0VAZKrv/13SGM5UcmUSkWC7Cq+3cYLh6cyOWJKLLcWVjV8z3mPcOJjmVufYLvLYoh5WS5fQ==
X-Received: by 2002:a17:903:245:b0:1e0:e70:4264 with SMTP id j5-20020a170903024500b001e00e704264mr785470plh.33.1711569729552;
        Wed, 27 Mar 2024 13:02:09 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:09 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v3 08/14] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:39 -0700
Message-ID: <20240327200157.1097089-9-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerPC provides an equivalent to the common kernel-mode FPU API, but in
a different header and using different function names. The PowerPC API
also requires a non-preemptible context. Add a wrapper header, and
export the CFLAGS adjustments.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/powerpc/Kconfig           |  1 +
 arch/powerpc/Makefile          |  5 ++++-
 arch/powerpc/include/asm/fpu.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/fpu.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..c42a57b6839d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,6 +137,7 @@ config PPC
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC_FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_64S_HASH_MMU
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 65261cbe5bfd..93d89f055b70 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -153,6 +153,9 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
 
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
+CC_FLAGS_FPU		:= $(call cc-option,-mhard-float)
+CC_FLAGS_NO_FPU		:= $(call cc-option,-msoft-float)
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
@@ -174,7 +177,7 @@ asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
 KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
-KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
+KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
 KBUILD_CFLAGS	+= $(CFLAGS-y)
 CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
diff --git a/arch/powerpc/include/asm/fpu.h b/arch/powerpc/include/asm/fpu.h
new file mode 100644
index 000000000000..ca584e4bc40f
--- /dev/null
+++ b/arch/powerpc/include/asm/fpu.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_POWERPC_FPU_H
+#define _ASM_POWERPC_FPU_H
+
+#include <linux/preempt.h>
+
+#include <asm/cpu_has_feature.h>
+#include <asm/switch_to.h>
+
+#define kernel_fpu_available()	(!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+
+static inline void kernel_fpu_begin(void)
+{
+	preempt_disable();
+	enable_kernel_fp();
+}
+
+static inline void kernel_fpu_end(void)
+{
+	disable_kernel_fp();
+	preempt_enable();
+}
+
+#endif /* ! _ASM_POWERPC_FPU_H */
-- 
2.43.1

