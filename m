Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E266DB81D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 04:21:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptf9p04XBz3fff
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 12:21:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jdxxy2k3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jdxxy2k3;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptf6F1bN6z3fWn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 12:18:13 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 60-20020a17090a09c200b0023fcc8ce113so2697005pjo.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 19:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680920291; x=1683512291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw1mbwBNy9otf/zNS0CGo+Qrz1tbS9TlYwkGqXtPzHQ=;
        b=Jdxxy2k35TF8VuQ7JI9qP4SiXDx+w1ZKMlNFPi7UT6u6Kj37osyBVAppCsq8WoU2hG
         v5HXonkNfaXsgbzQ+jR6nC0bJnA0rQWODkzlmEflt37g2gpCS42ryZdoQf7WEIn+C9eB
         161C9de6qZ5ZXOAKuXsDka5fYQjovD3DhMUbnLUlK7zaZIqMCkzETq2LL4oyGNeen7f2
         kAePwT57XlbbRJ1o7QNmI2Pa0Zi4ZaDPF/J5stW2QJKW3Wg+hbChE3eZd7qjK+DhwKEp
         +y/+Ko/WNQJyCGhSm2SOUGtm7N3Vbo4Z4WSZLiGidgxnNGG7UfdZxjjS+HFE0ElCWbr+
         FxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680920291; x=1683512291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw1mbwBNy9otf/zNS0CGo+Qrz1tbS9TlYwkGqXtPzHQ=;
        b=Qu0fN/L9Yq83lZ2al4U37J+ehE9xNPNV8qHTb9jDYeBIHlQI09pIKZVaO17MdFlR3y
         Fik2z2pNeN+fc0zycnR2UlV6iw5J1K0yMx9yzQL2XeWmJkgK5sJrCyWXneXsl1H+5k4s
         8rqH8+YkVGb0QgfsZzBg5vLZDkY/WHAJAtUV1V+/8cIPOYcVYtOPy8Of9Md2kTv4yvHi
         IvXOzZV6Ypp9VLnrzwQLT+Ln67KmxNYlkqGEJQlTiNBmAb84QQrMV4peiRe/Em67fV8U
         iT5a3GeGyo74m2Ssm2+j7/3DXLHvbksSdyGAkHWqKVPtUm6SHrG/kmMNGHhXrCLnTRmu
         hnng==
X-Gm-Message-State: AAQBX9dSQ7mUxIWPrzGITY7WPV4Xs/kod7eYVtdzX6hIgyd7RESYuXFj
	vpGM47cDeCgSy/A2WxOhRLEl1colhOTWqQ==
X-Google-Smtp-Source: AKy350Y8fH/qvdd9UR2Kul4yVGWrUfDhMVf6ekg4MTUDNUNiTXmFpuXEnZPYAl8AHQQHtoak5dTTtg==
X-Received: by 2002:a17:902:e5c4:b0:19b:107b:698e with SMTP id u4-20020a170902e5c400b0019b107b698emr5427242plf.14.1680920290848;
        Fri, 07 Apr 2023 19:18:10 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001a19f3a661esm3498577pln.138.2023.04.07.19.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 19:18:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/64: Add support to build with prefixed instructions
Date: Sat,  8 Apr 2023 12:17:49 +1000
Message-Id: <20230408021752.862660-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230408021752.862660-1-npiggin@gmail.com>
References: <20230408021752.862660-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add an option to build kernel and module with prefixed instructions if
the CPU and toolchain support it.

This is not related to kernel support for userspace execution of
prefixed instructions.

Building with prefixed instructions breaks some extended inline asm
memory addressing, for example it will provide immediates that exceed
the range of simple load/store displacement. Whether this is a
toolchain or a kernel asm problem remains to be seen. For now, these
are replaced with simpler and less efficient direct register addressing
when compiling with prefixed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   |  3 +++
 arch/powerpc/Makefile                  |  4 +++
 arch/powerpc/include/asm/atomic.h      | 24 ++++++++++++++---
 arch/powerpc/include/asm/io.h          | 37 ++++++++++++++++++++++++++
 arch/powerpc/include/asm/uaccess.h     | 28 +++++++++++++++++--
 arch/powerpc/kernel/trace/ftrace.c     |  2 ++
 arch/powerpc/platforms/Kconfig.cputype | 20 ++++++++++++++
 7 files changed, 112 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a6c4407d3ec8..19c13733a4ed 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -4,6 +4,9 @@ source "arch/powerpc/platforms/Kconfig.cputype"
 config CC_HAS_ELFV2
 	def_bool PPC64 && $(cc-option, -mabi=elfv2)
 
+config CC_HAS_PREFIXED
+	def_bool PPC64 && $(cc-option, -mcpu=power10 -mprefixed)
+
 config 32BIT
 	bool
 	default y if PPC32
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index e91d7e91347d..de8bb40b73c0 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -181,7 +181,11 @@ ifdef CONFIG_476FPE_ERR46
 endif
 
 # No prefix or pcrel
+ifdef CONFIG_PPC_KERNEL_PREFIXED
+KBUILD_CFLAGS += $(call cc-option,-mprefixed)
+else
 KBUILD_CFLAGS += $(call cc-option,-mno-prefixed)
+endif
 KBUILD_CFLAGS += $(call cc-option,-mno-pcrel)
 
 # No AltiVec or VSX or MMA instructions when building kernel
diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 486ab7889121..50212c44be2a 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -27,14 +27,22 @@ static __inline__ int arch_atomic_read(const atomic_t *v)
 {
 	int t;
 
-	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
+	/* -mprefixed can generate offsets beyond range, fall back hack */
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
+		__asm__ __volatile__("lwz %0,0(%1)" : "=r"(t) : "b"(&v->counter));
+	else
+		__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
 
 	return t;
 }
 
 static __inline__ void arch_atomic_set(atomic_t *v, int i)
 {
-	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
+	/* -mprefixed can generate offsets beyond range, fall back hack */
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
+		__asm__ __volatile__("stw %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
+	else
+		__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
 }
 
 #define ATOMIC_OP(op, asm_op, suffix, sign, ...)			\
@@ -226,14 +234,22 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
 {
 	s64 t;
 
-	__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
+	/* -mprefixed can generate offsets beyond range, fall back hack */
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
+		__asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter));
+	else
+		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
 
 	return t;
 }
 
 static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
 {
-	__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
+	/* -mprefixed can generate offsets beyond range, fall back hack */
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
+		__asm__ __volatile__("std %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
+	else
+		__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
 }
 
 #define ATOMIC64_OP(op, asm_op)						\
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index fc112a91d0c2..f1e657c9bbe8 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -97,6 +97,42 @@ extern bool isa_io_special;
  *
  */
 
+/* -mprefixed can generate offsets beyond range, fall back hack */
+#ifdef CONFIG_PPC_KERNEL_PREFIXED
+#define DEF_MMIO_IN_X(name, size, insn)				\
+static inline u##size name(const volatile u##size __iomem *addr)	\
+{									\
+	u##size ret;							\
+	__asm__ __volatile__("sync;"#insn" %0,0,%1;twi 0,%0,0;isync"	\
+		: "=r" (ret) : "r" (addr) : "memory");			\
+	return ret;							\
+}
+
+#define DEF_MMIO_OUT_X(name, size, insn)				\
+static inline void name(volatile u##size __iomem *addr, u##size val)	\
+{									\
+	__asm__ __volatile__("sync;"#insn" %1,0,%0"			\
+		: : "r" (addr), "r" (val) : "memory");			\
+	mmiowb_set_pending();						\
+}
+
+#define DEF_MMIO_IN_D(name, size, insn)				\
+static inline u##size name(const volatile u##size __iomem *addr)	\
+{									\
+	u##size ret;							\
+	__asm__ __volatile__("sync;"#insn" %0,0(%1);twi 0,%0,0;isync"\
+		: "=r" (ret) : "b" (addr) : "memory");	\
+	return ret;							\
+}
+
+#define DEF_MMIO_OUT_D(name, size, insn)				\
+static inline void name(volatile u##size __iomem *addr, u##size val)	\
+{									\
+	__asm__ __volatile__("sync;"#insn" %1,0(%0)"			\
+		: : "b" (addr), "r" (val) : "memory");	\
+	mmiowb_set_pending();						\
+}
+#else
 #define DEF_MMIO_IN_X(name, size, insn)				\
 static inline u##size name(const volatile u##size __iomem *addr)	\
 {									\
@@ -130,6 +166,7 @@ static inline void name(volatile u##size __iomem *addr, u##size val)	\
 		: "=m<>" (*addr) : "r" (val) : "memory");	\
 	mmiowb_set_pending();						\
 }
+#endif
 
 DEF_MMIO_IN_D(in_8,     8, lbz);
 DEF_MMIO_OUT_D(out_8,   8, stb);
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 3ddc65c63a49..722b1ec12cff 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -71,14 +71,26 @@ __pu_failed:							\
  * because we do not write to any memory gcc knows about, so there
  * are no aliasing issues.
  */
+/* -mprefixed can generate offsets beyond range, fall back hack */
+#ifdef CONFIG_PPC_KERNEL_PREFIXED
+#define __put_user_asm_goto(x, addr, label, op)			\
+	asm_volatile_goto(					\
+		"1:	" op " %0,0(%1)	# put_user\n"		\
+		EX_TABLE(1b, %l2)				\
+		:						\
+		: "r" (x), "b" (addr)				\
+		:						\
+		: label)
+#else
 #define __put_user_asm_goto(x, addr, label, op)			\
 	asm_volatile_goto(					\
 		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
 		EX_TABLE(1b, %l2)				\
 		:						\
-		: "r" (x), "m<>" (*addr)		\
+		: "r" (x), "m<>" (*addr)			\
 		:						\
 		: label)
+#endif
 
 #ifdef __powerpc64__
 #define __put_user_asm2_goto(x, ptr, label)			\
@@ -131,14 +143,26 @@ do {								\
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 
+/* -mprefixed can generate offsets beyond range, fall back hack */
+#ifdef CONFIG_PPC_KERNEL_PREFIXED
+#define __get_user_asm_goto(x, addr, label, op)			\
+	asm_volatile_goto(					\
+		"1:	"op" %0,0(%1)	# get_user\n"		\
+		EX_TABLE(1b, %l2)				\
+		: "=r" (x)					\
+		: "b" (addr)					\
+		:						\
+		: label)
+#else
 #define __get_user_asm_goto(x, addr, label, op)			\
 	asm_volatile_goto(					\
 		"1:	"op"%U1%X1 %0, %1	# get_user\n"	\
 		EX_TABLE(1b, %l2)				\
 		: "=r" (x)					\
-		: "m<>" (*addr)				\
+		: "m<>" (*addr)					\
 		:						\
 		: label)
+#endif
 
 #ifdef __powerpc64__
 #define __get_user_asm2_goto(x, addr, label)			\
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 7b85c3b460a3..72864fb7a6cc 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -194,6 +194,8 @@ __ftrace_make_nop(struct module *mod,
 	 * get corrupted.
 	 *
 	 * Use a b +8 to jump over the load.
+	 * XXX: could make PCREL depend on MPROFILE_KERNEL
+	 * XXX: check PCREL && MPROFILE_KERNEL calling sequence
 	 */
 	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL) || IS_ENABLED(CONFIG_PPC32))
 		pop = ppc_inst(PPC_RAW_NOP());
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 046b571496b1..aff760e2ff90 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -180,6 +180,7 @@ config POWER10_CPU
 	bool "POWER10"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HAVE_PREFIXED_SUPPORT
 
 config E5500_CPU
 	bool "Freescale e5500"
@@ -454,6 +455,22 @@ config PPC_RADIX_MMU_DEFAULT
 
 	  If you're unsure, say Y.
 
+config PPC_KERNEL_PREFIXED
+	depends on PPC_HAVE_PREFIXED_SUPPORT
+	depends on CC_HAS_PREFIXED
+	default n
+	bool "Build Kernel with Prefixed Instructions"
+	help
+	  POWER10 and later CPUs support prefixed instructions, 8 byte
+	  instructions that include large immediate, pc relative addressing,
+	  and various floating point, vector, MMA.
+
+	  This option builds the kernel with prefixed instructions, and
+	  allows a pc relative addressing option to be selected.
+
+	  Kernel support for prefixed instructions in applications and guests
+          is not affected by this option.
+
 config PPC_KUEP
 	bool "Kernel Userspace Execution Prevention" if !40x
 	default y if !40x
@@ -490,6 +507,9 @@ config PPC_MMU_NOHASH
 config PPC_HAVE_PMU_SUPPORT
 	bool
 
+config PPC_HAVE_PREFIXED_SUPPORT
+	bool
+
 config PMU_SYSFS
 	bool "Create PMU SPRs sysfs file"
 	default n
-- 
2.40.0

