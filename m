Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E591E89145A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:31:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Jev976fS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5XBx4wCfz3w10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 18:31:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Jev976fS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5X3w3lZgz3vZt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 18:25:00 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so1029689a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697099; x=1712301899; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miBOSRWGIbztCOf3acmBaICqQz/+WnlSIiHBb+4Rl8M=;
        b=Jev976fSZVnIwNjwmcgDb2dx4967iQiGRRwa38wUN+NBmQvd77D7aMogA6D9esDMx+
         hXnOfTuyfWfEWB93lIaQT5R8oT3yeWy2eiCVSjz8EPukdEg/6yqIZkSH08rAqD5pjqQL
         ZHzq5UfV55YMq6SohSSxMsm+pyjRyNtZjx7hi+2IqmQq59rwgR8OuQJa/zt5VyrzHYY/
         xEGAT/JBbkSC9ILvQ5HAyzImlq9Mb2u7u/XDgY8EW1rgQ35VLJZ7+yHoA+W7lEykL2Qe
         l9dr/waWV2Mevv9IJB5PEEhKmZIp/SFMoTXUEaruMcSjxMiwld27Lzn7TL+C41Y8DtsI
         QrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697099; x=1712301899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miBOSRWGIbztCOf3acmBaICqQz/+WnlSIiHBb+4Rl8M=;
        b=Cdgvv61gV9TyuzKGKKTJf1QIoXOdyC/AHOIMZZJx+xB4RugxGxRzOf5ZpflGHydT4c
         m6vr0C+NrbTfSf3c+IrSCL6KKIxA14hROe38016IhIiCFAAKsgmyl1m8K/r9xEpS/oaG
         CnwGIMyGTqxqA8Xhqoke8r3jYV2ZhRvBYc+ugRxmNDu45f25EuL94ePa4X+bcAoVskGb
         kFHfoQlpu89asPiSt6sXMgO/wFJFGMk6gosW73owg90G645y/waiue4STdXVI+dqC87C
         1GylYgvGGsLFp+yIBh6W10ZMXH84dGhokhGHT2HPb1m1GRFvcrJvPzAaXyQsKh/VBT4X
         Bk4w==
X-Forwarded-Encrypted: i=1; AJvYcCXumTZDIpxAuT1rY8qZ4ugXiy2sqeyJH703oF4+TmcqYnSqVtyYB8BaQRaeLz0BNaIB6rVwHqgOKvTHgJ5X+8tBAmSk7IPqa5LBp1MYYw==
X-Gm-Message-State: AOJu0YwgkCT8cR/oS1itb+rQezpT+SPXICFzir+bq7iszqHsNYfchXbv
	bToLpQ1PK4IgX3GBoTcBwD2z4Jk8MW4PDJYFpu2qhIjg0DoDru3dgZD5XIO0+A4=
X-Google-Smtp-Source: AGHT+IHGvAdAnX/0WDZVeXS0a7ZQ/motGWeac64eqKBau0xYaG382zqiN+0tE34St5zugVtRmJL1tg==
X-Received: by 2002:a05:6a20:549c:b0:1a3:baad:d566 with SMTP id i28-20020a056a20549c00b001a3baadd566mr1487303pzk.40.1711697098883;
        Fri, 29 Mar 2024 00:24:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:53 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v4 08/15] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:23 -0700
Message-ID: <20240329072441.591471-9-samuel.holland@sifive.com>
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
2.44.0

