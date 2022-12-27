Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B316F6568EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 10:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh8bm4dkfz2xdx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 20:33:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PiCPJHtA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PiCPJHtA;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh8Rk1LtJz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 20:26:41 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso12728829pjh.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 01:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi8zkLmgFymAFhWYfeOdEaXk/grgJ4K8aOH6a6Q42t0=;
        b=PiCPJHtA0+JSRiSKeB6smHkC7ILueR5ju2havCVc0WBaU1zmWEKjfhTIOVeVed5fc+
         bdr2h7WOLE8yvTM0j6NMS75laMil0FC5amHhsi49rEsaSnWBAAGHiwOfrq+zFMcvglYh
         08KNfqjJ58rrFbd/5YORhcnpLeAxTKZx54RUuw4XBFfApL8w5aVHXOkpM/awWWfsRnAB
         2qlabiu71CWGz/oxo2x4cHviYxhCywOvN8sBpk/YktQlMLdN2BXo+1qZ3qJIA6F7lrQU
         VrBNfWphMz3uNop3wQZFfKNjpf5ycOQ/7KHLRmMlMo+lVNR9ALUQnTdIXFcbyjPfu9RJ
         YXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi8zkLmgFymAFhWYfeOdEaXk/grgJ4K8aOH6a6Q42t0=;
        b=ukY4FLLkKMcUIli3MC1efzf4S26/P+mIuIAZiR3Kgsz+0A4gy2eywHXSBnww2F8OUb
         pNGeUrVSZZF3kQWmhm+qx/yIyfNa/Dp/mStawhZWo8oGi0ZLkPdV33xWdmhCd8lKJgyv
         bALr1jGU1FLQY4UDj53JQreLmRcBx2ekAtPIdViQG2McRGb7kyZD+dnfdtwVTG/rLBZs
         QMXDNmMzQVt3Tgf//aEzVzaKMHfEYJ7VhkAu2pvWlejn0lEutdzuMjlGtBlddSkEDhAb
         qgDeLndC8LkQ9IuzOX+LYMG1ZEtsO7pRHUwTyV2/Tm/Fj+82nY5TdvuS/27OKGnW/SSx
         S/mQ==
X-Gm-Message-State: AFqh2krxCSeWCQVL0ufGbR/pu3P8G8VW8I9zPZhl2zS+6CejKGofn6Mj
	Spv+Zbz/l88xJUXNCn1za3ZonC4fJPk=
X-Google-Smtp-Source: AMrXdXv3iN94Hv/rOvlweh7TF2OWy8zEKZUkch53q6mgZgyYj7XBb6WVEND6LsrzJOG8wPiivY6QpA==
X-Received: by 2002:a17:902:ebc3:b0:189:361f:89ac with SMTP id p3-20020a170902ebc300b00189361f89acmr26757493plg.64.1672133199291;
        Tue, 27 Dec 2022 01:26:39 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-252-227.tpgi.com.au. [58.6.252.227])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b00189947bd9f7sm8598998plg.50.2022.12.27.01.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:26:38 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 7/9] powerpc/64: Add support to build with prefixed instructions
Date: Tue, 27 Dec 2022 19:26:07 +1000
Message-Id: <20221227092609.2078908-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221227092609.2078908-1-npiggin@gmail.com>
References: <20221227092609.2078908-1-npiggin@gmail.com>
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
index b8c4ac56bddc..f8ee94785f8c 100644
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
index dc4cbf0a5ca9..5b6c276bb690 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -193,7 +193,11 @@ ifdef CONFIG_476FPE_ERR46
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
index 9563336e3348..0d9646101caf 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -180,6 +180,7 @@ config POWER10_CPU
 	bool "POWER10"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HAVE_PREFIXED_SUPPORT
 
 config E5500_CPU
 	bool "Freescale e5500"
@@ -444,6 +445,22 @@ config PPC_RADIX_MMU_DEFAULT
 
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
@@ -480,6 +497,9 @@ config PPC_MMU_NOHASH
 config PPC_HAVE_PMU_SUPPORT
 	bool
 
+config PPC_HAVE_PREFIXED_SUPPORT
+	bool
+
 config PMU_SYSFS
 	bool "Create PMU SPRs sysfs file"
 	default n
-- 
2.37.2

