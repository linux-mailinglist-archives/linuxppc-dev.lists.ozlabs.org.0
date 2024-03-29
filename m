Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5389142B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:25:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=exAz6dEw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5X4T5y8tz3vYv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 18:25:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=exAz6dEw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5X3j5mGGz3cNt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 18:24:48 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2a20e595351so643817a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697085; x=1712301885; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJgb6TiBTsQDE1YCv6FX1Cn5RHV4TaKIlUyS6ICHf2c=;
        b=exAz6dEw9Shv2BsSovfAy6R3hnp/y06lftsxVbmUxAMe4s63NBcoQ4rh0ae/WffCJg
         zHeteok4y0ZeKU8calbW+YEw/hMdfZlQcT5CemmTtqQCfSB6bYZngD1t+PAGnHfwobkn
         ePo0MWLMp4ZQDubY+joSrNNpWXc4GFLx0sDqSEqmOKlgRM3ZzL4MJ5gRal7CNlm9RbRV
         2cxdWlf0m9cOK5wCFIuaEihsy120mz3ctq4zgOp6ZR3hYSSGGP4Vdz5VHCjCfBwJ99Pa
         P67wlKi4dXr6zrj5A6GyvB2RCr9ZyxJVWgxkWrfzybRC6bId4m/St0Jf4faWb6/zksuT
         qLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697085; x=1712301885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJgb6TiBTsQDE1YCv6FX1Cn5RHV4TaKIlUyS6ICHf2c=;
        b=iT9SWRJQRjAxE/1acoLGCZcdSS7p/2cxyuIchT1rjVINpKh9NkZcaY28v/z1RDC5t4
         ryjBdElAJtt3UlJfz964jdT1FJPntuxaibs7k+6Y8TRbd8i64krERLEDKYtWghjjH3SM
         Uko9vfZ7RUpPuyqPDX9kbIs7JNCwo7mLpW6M+eY5HXGFU4R0Epgvb2w3ARLMICl+6Pl+
         A4Z5IakLU1+S/6FYfgjUUxbUeQ45h3E2X83R65SVuazDTsJ2sbsJIJ836cj7ZpTU2VDg
         dWzgBHG0vlo79ycI19I/rgtPsUvQq1ErWijAU8NGgCVo1LV6ZpLtkdUc+Gww0EY82luD
         F8UA==
X-Forwarded-Encrypted: i=1; AJvYcCUD5Pa9xuLWp72eJ49kpeaTqWbWrWVq6F6x/DLeyMjQz5yWvdsQOePwli8fwczr/LTSzydZvjn5tVM2uZEqHO3WjN8SIq9kSlSzx2b8AQ==
X-Gm-Message-State: AOJu0YwqXHCeS7s+no0KsMkWFu91ROtIqrruawUQDB/D0otZBChOcxrE
	+hYpTwUyp58y5p+K+Ckm/L1LPMJMzgAasnpeKTiDBs/rvWY93EaCR5Le0+zapC8=
X-Google-Smtp-Source: AGHT+IHa/zXusbJGA4K8cLPLAWn+CnPIA4cHPz+eGb6xCnwX+ovRVMEI/wA60Ad/6sOmnhgR0Mc6ng==
X-Received: by 2002:a17:90b:3c50:b0:2a2:19f:dbc7 with SMTP id pm16-20020a17090b3c5000b002a2019fdbc7mr1989065pjb.0.1711697084840;
        Fri, 29 Mar 2024 00:24:44 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:44 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v4 01/15] arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:16 -0700
Message-ID: <20240329072441.591471-2-samuel.holland@sifive.com>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Several architectures provide an API to enable the FPU and run
floating-point SIMD code in kernel space. However, the function names,
header locations, and semantics are inconsistent across architectures,
and FPU support may be gated behind other Kconfig options.

Provide a standard way for architectures to declare that kernel space
FPU support is available. Architectures selecting this option must
implement what is currently the most common API (kernel_fpu_begin() and
kernel_fpu_end(), plus a new function kernel_fpu_available()) and
provide the appropriate CFLAGS for compiling floating-point C code.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Add documentation explaining the built-time and runtime APIs
 - Add a linux/fpu.h header for generic isolation enforcement

 Documentation/core-api/floating-point.rst | 78 +++++++++++++++++++++++
 Documentation/core-api/index.rst          |  1 +
 Makefile                                  |  5 ++
 arch/Kconfig                              |  6 ++
 include/linux/fpu.h                       | 12 ++++
 5 files changed, 102 insertions(+)
 create mode 100644 Documentation/core-api/floating-point.rst
 create mode 100644 include/linux/fpu.h

diff --git a/Documentation/core-api/floating-point.rst b/Documentation/core-api/floating-point.rst
new file mode 100644
index 000000000000..a8d0d4b05052
--- /dev/null
+++ b/Documentation/core-api/floating-point.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Floating-point API
+==================
+
+Kernel code is normally prohibited from using floating-point (FP) registers or
+instructions, including the C float and double data types. This rule reduces
+system call overhead, because the kernel does not need to save and restore the
+userspace floating-point register state.
+
+However, occasionally drivers or library functions may need to include FP code.
+This is supported by isolating the functions containing FP code to a separate
+translation unit (a separate source file), and saving/restoring the FP register
+state around calls to those functions. This creates "critical sections" of
+floating-point usage.
+
+The reason for this isolation is to prevent the compiler from generating code
+touching the FP registers outside these critical sections. Compilers sometimes
+use FP registers to optimize inlined ``memcpy`` or variable assignment, as
+floating-point registers may be wider than general-purpose registers.
+
+Usability of floating-point code within the kernel is architecture-specific.
+Additionally, because a single kernel may be configured to support platforms
+both with and without a floating-point unit, FPU availability must be checked
+both at build time and at run time.
+
+Several architectures implement the generic kernel floating-point API from
+``linux/fpu.h``, as described below. Some other architectures implement their
+own unique APIs, which are documented separately.
+
+Build-time API
+--------------
+
+Floating-point code may be built if the option ``ARCH_HAS_KERNEL_FPU_SUPPORT``
+is enabled. For C code, such code must be placed in a separate file, and that
+file must have its compilation flags adjusted using the following pattern::
+
+    CFLAGS_foo.o += $(CC_FLAGS_FPU)
+    CFLAGS_REMOVE_foo.o += $(CC_FLAGS_NO_FPU)
+
+Architectures are expected to define one or both of these variables in their
+top-level Makefile as needed. For example::
+
+    CC_FLAGS_FPU := -mhard-float
+
+or::
+
+    CC_FLAGS_NO_FPU := -msoft-float
+
+Normal kernel code is assumed to use the equivalent of ``CC_FLAGS_NO_FPU``.
+
+Runtime API
+-----------
+
+The runtime API is provided in ``linux/fpu.h``. This header cannot be included
+from files implementing FP code (those with their compilation flags adjusted as
+above). Instead, it must be included when defining the FP critical sections.
+
+.. c:function:: bool kernel_fpu_available( void )
+
+        This function reports if floating-point code can be used on this CPU or
+        platform. The value returned by this function is not expected to change
+        at runtime, so it only needs to be called once, not before every
+        critical section.
+
+.. c:function:: void kernel_fpu_begin( void )
+                void kernel_fpu_end( void )
+
+        These functions create a floating-point critical section. It is only
+        valid to call ``kernel_fpu_begin()`` after a previous call to
+        ``kernel_fpu_available()`` returned ``true``. These functions are only
+        guaranteed to be callable from (preemptible or non-preemptible) process
+        context.
+
+        Preemption may be disabled inside critical sections, so their size
+        should be minimized. They are *not* required to be reentrant. If the
+        caller expects to nest critical sections, it must implement its own
+        reference counting.
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 7a3a08d81f11..974beccd671f 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -48,6 +48,7 @@ Library functionality that is used throughout the kernel.
    errseq
    wrappers/atomic_t
    wrappers/atomic_bitops
+   floating-point
 
 Low level entry and exit
 ========================
diff --git a/Makefile b/Makefile
index 763b6792d3d5..710f65e4249d 100644
--- a/Makefile
+++ b/Makefile
@@ -964,6 +964,11 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
 export CC_FLAGS_CFI
 endif
 
+# Architectures can define flags to add/remove for floating-point support
+CC_FLAGS_FPU	+= -D_LINUX_FPU_COMPILATION_UNIT
+export CC_FLAGS_FPU
+export CC_FLAGS_NO_FPU
+
 ifneq ($(CONFIG_FUNCTION_ALIGNMENT),0)
 # Set the minimal function alignment. Use the newer GCC option
 # -fmin-function-alignment if it is available, or fall back to -falign-funtions.
diff --git a/arch/Kconfig b/arch/Kconfig
index 9f066785bb71..8e34b3acf73d 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1569,6 +1569,12 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
 	  address translations. Page table walkers that clear the accessed bit
 	  may use this capability to reduce their search space.
 
+config ARCH_HAS_KERNEL_FPU_SUPPORT
+	bool
+	help
+	  Architectures that select this option can run floating-point code in
+	  the kernel, as described in Documentation/core-api/floating-point.rst.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/include/linux/fpu.h b/include/linux/fpu.h
new file mode 100644
index 000000000000..2fb63e22913b
--- /dev/null
+++ b/include/linux/fpu.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_FPU_H
+#define _LINUX_FPU_H
+
+#ifdef _LINUX_FPU_COMPILATION_UNIT
+#error FP code must be compiled separately. See Documentation/core-api/floating-point.rst.
+#endif
+
+#include <asm/fpu.h>
+
+#endif
-- 
2.44.0

