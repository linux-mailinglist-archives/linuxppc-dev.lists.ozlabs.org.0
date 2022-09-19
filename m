Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004B5BCDFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:06:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRLk3rm3z3fSy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:06:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iPckU4ke;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iPckU4ke;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRFT4WJnz3bd3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:02:21 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso3305917pjk.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 07:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dcyOzTo3+4GSubbT/ays2/DhJvmpTLsCy3ZjicT/eQ4=;
        b=iPckU4kepBvK3z6ZxhmuckgnhpD7OxqcuFxjRmgK4CZphICrAhtEgu1UMbVygVuaJ4
         5NuTrePhvp2efJTPocs5MreNjGSoum1NawB3GMjXHAx+lFLrerDr7k+LEcK27ToeWf87
         dl0Ol8CbeoyQX+grZjwZXviSpUES3aJrha3l2O+z9hdD7KSVebLyLce+WdSTVOmHp7/B
         b7dBkTC4mHeBvlf8TjOnVdMqVVU7T9llbF2lH6H6nhizF25DFfRaCgSyFHVsv7UMVtQq
         pLb8jTT3kT9wk89YsKAcxHWIihK3jva2cD47Dwdk0XGLU0IdoTxfeP04pE66rtVdonfi
         2m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dcyOzTo3+4GSubbT/ays2/DhJvmpTLsCy3ZjicT/eQ4=;
        b=A4jBbRjHXWqYPKpMuzu1+8uvveoyHdobOTqoOh0eWixwEFxWp6fxoHGk8M77G2T2zH
         gHulRAa1HBCd3Wu2X4FCxnZs+JbUUsCZznK/yEgeDwE25wOV4TZ/Pfo2ymUOrNjDeGQH
         0y6e8CO36fw8cXSJIdBm7fGdGgW8kCjxqyy5oCN/HtPvvhqUs2ZQ+YnzmwXCS38pjTDu
         SlOzVob8Mp4tfqf+OgRC8zQqG6GEbMjU0+btV5s+hDa0MVgA2tL/a/qgS/glFZZvcSAM
         pEgXvsIBFQWUCzB+cOWnVHfKN8sHmSbQJz33pDoPQ1AXAMTSWu8QCjwOqXeFbGh/csoF
         Eugw==
X-Gm-Message-State: ACrzQf1GlvpbEqZYdKfKYfO+T8GezqEt4vWV3m3WrKOt95efMoEEJK6M
	gzgxJYP3szqh8AzSPSe5HrkYvxVlS1w=
X-Google-Smtp-Source: AMsMyM4k92RPbPiMLGSkJUccqrTIboU6MNqH/GOzATm3jkzqve0snEPNN2MjBv6ylYgUx4xsQwPplw==
X-Received: by 2002:a17:90a:c70b:b0:200:4366:d047 with SMTP id o11-20020a17090ac70b00b002004366d047mr31384627pjt.240.1663596138974;
        Mon, 19 Sep 2022 07:02:18 -0700 (PDT)
Received: from bobo.ibm.com (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902780800b001637529493esm20477931pll.66.2022.09.19.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:02:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 7/7] powerpc/64s: Add option to build vmlinux with pcrel addressing
Date: Tue, 20 Sep 2022 00:01:49 +1000
Message-Id: <20220919140149.4018927-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919140149.4018927-1-npiggin@gmail.com>
References: <20220919140149.4018927-1-npiggin@gmail.com>
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

The main trick to this is that the kernel does not pick up the
PAGE_OFFSET (0xc.... load address) from the absolute address TOC load in
early boot so it doesn't load all addresses with the proper PAGE_OFFSET
as a matter of course, and needs to be moved there by hand.

- Extended inline asm memory addresses grow some complexity, so this
  uses a dumb base addressing for now.

- Modules are still using TOC addressing. Building modules with prcrel
  will I think require the loader add pc relative plt stubs, and add a
  GOT section for global variable access.  Would be nice to add though.

- definetely ftrace and probes, possibly BPF and KVM have some breakage.
  I haven't looked closely yet.

- copypage_64.S has an interesting problem, prefixed instructions have
  alignment restrictions so the linker can change their size so
  difference between two local labels may no longer be constant at
  assembly time. Even aligning the prefixed instruction can't generally
  solve it. Fortunately it's only one place in the kernel so far.

This reduces kernel text size by about 6%.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile                  |  7 +++
 arch/powerpc/include/asm/atomic.h      | 20 +++++--
 arch/powerpc/include/asm/io.h          | 36 ++++++++++++
 arch/powerpc/include/asm/ppc_asm.h     | 77 ++++++++++++++++++++++++++
 arch/powerpc/include/asm/uaccess.h     | 22 ++++++++
 arch/powerpc/kernel/head_64.S          | 35 ++++++++++++
 arch/powerpc/kernel/irq.c              |  4 ++
 arch/powerpc/kernel/vmlinux.lds.S      |  6 ++
 arch/powerpc/lib/copypage_64.S         |  4 +-
 arch/powerpc/platforms/Kconfig.cputype | 20 +++++++
 10 files changed, 226 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 8c233f0894ba..a33ce1cf75ce 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -107,6 +107,9 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
 ifdef CONFIG_PPC64
+ifdef CONFIG_PPC_KERNEL_PCREL
+	KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-pcrel)
+endif
 ifeq ($(call cc-option-yn,-mcmodel=medium),y)
 	# -mcmodel=medium breaks modules because it uses 32bit offsets from
 	# the TOC pointer to create pointers where possible. Pointers into the
@@ -194,8 +197,12 @@ ifdef CONFIG_476FPE_ERR46
 endif
 
 # No prefix or pcrel
+ifndef CONFIG_PPC_KERNEL_PREFIXED
 KBUILD_CFLAGS += $(call cc-option,-mno-prefixed)
+endif
+ifndef CONFIG_PPC_KERNEL_PCREL
 KBUILD_CFLAGS += $(call cc-option,-mno-pcrel)
+endif
 
 # No AltiVec or VSX or MMA instructions when building kernel
 KBUILD_CFLAGS += $(call cc-option,-mno-altivec)
diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 486ab7889121..4124e5795872 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -27,14 +27,20 @@ static __inline__ int arch_atomic_read(const atomic_t *v)
 {
 	int t;
 
-	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		__asm__ __volatile__("lwz %0,0(%1)" : "=r"(t) : "b"(&v->counter));
+	else
+		__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
 
 	return t;
 }
 
 static __inline__ void arch_atomic_set(atomic_t *v, int i)
 {
-	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		__asm__ __volatile__("stw %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
+	else
+		__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
 }
 
 #define ATOMIC_OP(op, asm_op, suffix, sign, ...)			\
@@ -226,14 +232,20 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
 {
 	s64 t;
 
-	__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		__asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter));
+	else
+		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
 
 	return t;
 }
 
 static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
 {
-	__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		__asm__ __volatile__("std %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
+	else
+		__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
 }
 
 #define ATOMIC64_OP(op, asm_op)						\
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index fc112a91d0c2..4dc95872bffc 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -97,6 +97,41 @@ extern bool isa_io_special;
  *
  */
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
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
@@ -130,6 +165,7 @@ static inline void name(volatile u##size __iomem *addr, u##size val)	\
 		: "=m<>" (*addr) : "r" (val) : "memory");	\
 	mmiowb_set_pending();						\
 }
+#endif
 
 DEF_MMIO_IN_D(in_8,     8, lbz);
 DEF_MMIO_OUT_D(out_8,   8, stb);
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index ab8adf2b833f..effaed790f37 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -142,7 +142,11 @@
 /*
  * Used to name C functions called from asm
  */
+#ifdef CONFIG_PPC_KERNEL_PCREL
+#define CFUNC(name) name@notoc
+#else
 #define CFUNC(name) name
+#endif
 
 /*
  * We use __powerpc64__ here because we want the compat VDSO to use the 32-bit
@@ -171,6 +175,9 @@
 	.globl name; \
 name:
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+#define _GLOBAL_TOC _GLOBAL
+#else
 #define _GLOBAL_TOC(name) \
 	.align 2 ; \
 	.type name,@function; \
@@ -179,6 +186,7 @@ name: \
 0:	addis r2,r12,(.TOC.-0b)@ha; \
 	addi r2,r2,(.TOC.-0b)@l; \
 	.localentry name,.-name
+#endif
 
 #define DOTSYM(a)	a
 
@@ -308,6 +316,69 @@ GLUE(.,name):
 	.endif
 .endm
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+.macro declare_var name, align
+	.type \name,@object
+	.balign \align
+\name\():
+.endm
+
+.macro declare_var_end
+.endm
+
+.macro load_var_addr reg, name
+	pla	\reg,\name\()@pcrel
+.endm
+
+.macro load_var reg, name, size
+	.if \size == 1
+	plbz	\reg,\name\()@pcrel
+	.elseif \size == 2
+	plhz	\reg,\name\()@pcrel
+	.elseif \size == 4
+	plwz	\reg,\name\()@pcrel
+	.elseif \size == 8
+	pld	\reg,\name\()@pcrel
+	.else
+	.error "bad size"
+	.endif
+.endm
+
+.macro store_var reg, name, size
+	.if \size == 1
+	pstb	\reg,\name\()@pcrel
+	.elseif \size == 2
+	psth	\reg,\name\()@pcrel
+	.elseif \size == 4
+	pstw	\reg,\name\()@pcrel
+	.elseif \size == 8
+	pstd	\reg,\name\()@pcrel
+	.else
+	.error "bad size"
+	.endif
+.endm
+
+.macro fload_var reg, tmpreg, name, size
+	.if \size == 4
+	plfs	\reg,\name\()@pcrel
+	.elseif \size == 8
+	plfd	\reg,\name\()@pcrel
+	.else
+	.error "bad size"
+	.endif
+.endm
+
+.macro fstore_var reg, tmpreg, name, size
+	.if \size == 4
+	pstfs	\reg,\name\()@pcrel
+	.elseif \size == 8
+	pstfd	\reg,\name\()@pcrel
+	.else
+	.error "bad size"
+	.endif
+.endm
+
+#else
 .macro declare_var name, align
 	.type \name,@object
 #	.section ".toc","aw"
@@ -376,6 +447,7 @@ GLUE(.,name):
 	.error "bad size"
 	.endif
 .endm
+#endif
 
 #ifdef __powerpc64__
 
@@ -391,6 +463,11 @@ GLUE(.,name):
 	ori	reg, reg, (expr)@l;		\
 	rldimi	reg, tmp, 32, 0
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+#define LOAD_REG_ADDR(reg,name)			\
+	pla	reg,name@pcrel
+
+#else
 #define LOAD_REG_ADDR(reg,name)			\
 	addis	reg,r2,name@toc@ha;		\
 	addi	reg,reg,name@toc@l
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 3ddc65c63a49..88b23bb3bbf3 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -71,6 +71,16 @@ __pu_failed:							\
  * because we do not write to any memory gcc knows about, so there
  * are no aliasing issues.
  */
+#ifdef CONFIG_PPC_KERNEL_PCREL
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
@@ -79,6 +89,7 @@ __pu_failed:							\
 		: "r" (x), "m<>" (*addr)		\
 		:						\
 		: label)
+#endif
 
 #ifdef __powerpc64__
 #define __put_user_asm2_goto(x, ptr, label)			\
@@ -131,6 +142,16 @@ do {								\
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+#define __get_user_asm_goto(x, addr, label, op)			\
+	asm_volatile_goto(					\
+		"1:	"op" %0,0(%1)	# get_user\n"	\
+		EX_TABLE(1b, %l2)				\
+		: "=r" (x)					\
+		: "b" (addr)				\
+		:						\
+		: label)
+#else
 #define __get_user_asm_goto(x, addr, label, op)			\
 	asm_volatile_goto(					\
 		"1:	"op"%U1%X1 %0, %1	# get_user\n"	\
@@ -139,6 +160,7 @@ do {								\
 		: "m<>" (*addr)				\
 		:						\
 		: label)
+#endif
 
 #ifdef __powerpc64__
 #define __get_user_asm2_goto(x, addr, label)			\
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 6b04f327263e..75d11a210244 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -415,6 +415,21 @@ generic_secondary_common_init:
 	mtspr	SPRN_SPRG_TLB_EXFRAME,r12
 #endif
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	/*
+	 * pcrel does not get PAGE_OFFSET because it is out of range. We
+	 * must move there now so other pointers calculated via pcrel are
+	 * valid with PAGE_OFFSET.
+	 */
+	lis	r25,PAGE_OFFSET@highest	/* compute virtual base of kernel */
+	sldi	r25,r25,32
+	LOAD_REG_ADDR(r3, 1f)
+	add	r25,r25,r3
+	mtctr	r25
+	bctr
+1:
+#endif
+
 	/* From now on, r24 is expected to be logical cpuid */
 	mr	r24,r5
 
@@ -888,6 +903,10 @@ enable_64b_mode:
  * sites to handle this.
  */
 _GLOBAL(relative_toc)
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	li	r2,-1
+	blr
+#else
 	mflr	r0
 	bcl	20,31,$+4
 0:	mflr	r11
@@ -895,6 +914,7 @@ _GLOBAL(relative_toc)
 	add	r2,r2,r11
 	mtlr	r0
 	blr
+#endif
 
 .balign 8
 p_toc:	.8byte	.TOC. - 0b
@@ -946,6 +966,21 @@ start_here_multiplatform:
 	std	r0,0(r4)
 #endif
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	/*
+	 * pcrel does not get PAGE_OFFSET because it is out of range. We
+	 * must move there now so other pointers calculated via pcrel are
+	 * valid with PAGE_OFFSET.
+	 */
+	lis	r25,PAGE_OFFSET@highest	/* compute virtual base of kernel */
+	sldi	r25,r25,32
+	LOAD_REG_ADDR(r3, 1f)
+	add	r25,r25,r3
+	mtctr	r25
+	bctr
+1:
+#endif
+
 	/* set up a stack pointer */
 	LOAD_REG_ADDR(r3,init_thread_union)
 	LOAD_REG_IMMEDIATE(r1,THREAD_SIZE)
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 0f17268c1f0b..7c38e4e90f45 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -206,7 +206,11 @@ static __always_inline void call_do_softirq(const void *sp)
 	asm volatile (
 		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
 		"mr		%%r1, %[sp]		;"
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		"bl		%[callee]@notoc		;"
+#else
 		"bl		%[callee]		;"
+#endif
 		 PPC_LL "	%%r1, 0(%%r1)		;"
 		 : // Outputs
 		 : // Inputs
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 3d96d51c8a5f..5e8b29ec4c2f 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -164,12 +164,18 @@ SECTIONS
 	}
 
 #else /* CONFIG_PPC32 */
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	.toc1 : AT(ADDR(.toc1) - LOAD_OFFSET) {
 		*(.toc1)
 	}
+#endif
 
 	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		*(.got)
+#else
 		*(.got .toc)
+#endif
 #ifndef CONFIG_RELOCATABLE
 		__prom_init_toc_start = .;
 		arch/powerpc/kernel/prom_init.o*(.toc)
diff --git a/arch/powerpc/lib/copypage_64.S b/arch/powerpc/lib/copypage_64.S
index cfff67161011..d2b9f3bc3efb 100644
--- a/arch/powerpc/lib/copypage_64.S
+++ b/arch/powerpc/lib/copypage_64.S
@@ -22,8 +22,10 @@ FTR_SECTION_ELSE
 #endif
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
 	ori	r5,r5,PAGE_SIZE@l
-BEGIN_FTR_SECTION
+	/* prefixed instructions cause label difference to be non-constant
+	 * so can't go in FTR sections */
 	load_var	r10, caches, 8
+BEGIN_FTR_SECTION
 	lwz	r11,DCACHEL1LOGBLOCKSIZE(r10)	/* log2 of cache block size */
 	lwz     r12,DCACHEL1BLOCKSIZE(r10)	/* get cache block size */
 	li	r9,0
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 9d4d54fea081..b328c49b3e5f 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -175,6 +175,8 @@ config POWER10_CPU
 	bool "POWER10"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HAVE_PCREL_SUPPORT
+	select PPC_HAVE_PREFIXED_SUPPORT
 
 config E5500_CPU
 	bool "Freescale e5500"
@@ -454,6 +456,18 @@ config PPC_RADIX_MMU_DEFAULT
 
 	  If you're unsure, say Y.
 
+config PPC_KERNEL_PREFIXED
+	depends on PPC_HAVE_PREFIXED_SUPPORT
+	default n
+	bool "Build Kernel with Prefixed Instructions"
+
+config PPC_KERNEL_PCREL
+	depends on PPC_HAVE_PCREL_SUPPORT
+	depends on PPC_HAVE_PREFIXED_SUPPORT
+	default n
+	select PPC_KERNEL_PREFIXED
+	bool "Build Kernel with PC-Relative addressing model"
+
 config PPC_KUEP
 	bool "Kernel Userspace Execution Prevention" if !40x
 	default y if !40x
@@ -494,6 +508,12 @@ config PPC_BOOK3E_MMU
 config PPC_HAVE_PMU_SUPPORT
 	bool
 
+config PPC_HAVE_PCREL_SUPPORT
+	bool
+
+config PPC_HAVE_PREFIXED_SUPPORT
+	bool
+
 config PMU_SYSFS
 	bool "Create PMU SPRs sysfs file"
 	default n
-- 
2.37.2

