Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6A46EEE08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:07:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pLY5WpGz3fx5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:07:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WXq7seaE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WXq7seaE;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p940dB2z3cd2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:19 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63b4960b015so5336875b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488757; x=1685080757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guOOCtAiG93AJjpXU8UVj1OOgNFx9rEDxCoI9XZCYZs=;
        b=WXq7seaErLicN4G2BnNY4Dr8U8b4qbQvZJtsyESuYDrcFAT0pX0o+IG9MiTjnZDlXo
         Ho19CdzrW7LBqEocwxSprMO/IVbH7gJD3mePWqMK5seQsPWv+N140bNp048u+PsW8ysd
         M/Rb/aPykypr4i4E/mPtqJDwPrUN5yFxJnvJ6jq0vvmi81Hj5YuhSQaRxcsRqfEr/HNS
         DlcuKHvGZO3A3UhGb0/Wfc8bwzFhkODfMmt6jTPQN9C4BPG9QtY/zKo5tKz6ZAUwcZf5
         y3Dx+UxuvPPSW/C9ub974o92xeF2TGakr6d4/0P3ChkVGahUZwrkNPbAA184ceoUEotU
         mDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488757; x=1685080757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guOOCtAiG93AJjpXU8UVj1OOgNFx9rEDxCoI9XZCYZs=;
        b=LNYzOrI4kMscYn3tVnUItV14XF70gMmRARBECiqRp+WbmIM6o5urkJU7kDCqcQimaj
         EAARO9Dw6iRuE8cmRYTqYhbWr+2Ia1wmGgSAJUjXkzotpdS8L/twkEKaoHxc6IjE+xl7
         67FnZ0m+Ig+WtqVdOA7BmSxTYd2CBDAWj4YzylidchvqD0PMG3pGLzW512MvK3ytzECV
         PZYH/flkIKr1zAEQiSPJFK1eoXvb+WQPi19HskQO06EeuLaYC2r292CtzTquWkE0uLAB
         vrkRLqKNunNGhhZsvZCBLu7pVaDhLW2jvPflxxVWjV0oDNUz2bMSDLcqGtqgR1pHoH/D
         /Wnw==
X-Gm-Message-State: AAQBX9cPA9VljvwdhejlI826LVc6GfavFnoUSvI+GKZJAj+ok7KjwzlW
	x+xpgFGHNdZxCoKtQ9zJ69nLyp4KgJ05mA==
X-Google-Smtp-Source: AKy350bcbO4Ww2JUf5KdGl/1t3rNWO+T1QWZwX+rTHMFvLWteLO5Bv0Da4JhZAzejvqePDMSgIum5g==
X-Received: by 2002:a05:6a00:1396:b0:63b:2102:9fc8 with SMTP id t22-20020a056a00139600b0063b21029fc8mr25172945pfg.21.1682488757366;
        Tue, 25 Apr 2023 22:59:17 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:59:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 8/9] powerpc/64s: Permit d-form memops in asm when building with prefix on clang
Date: Wed, 26 Apr 2023 15:58:46 +1000
Message-Id: <20230426055848.402993-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

GCC appears to have a bug where it generates immediate offsets beyond
the 16-bit range of d-form memory operations in extended inline asm
when prefix instructions are enabled. So simpler fallback asm is
implemented for CONFIG_PPC_KERNEL_PREFIXED builds for now.

Clang does not have this bug, so this hack can be restricted to GCC.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig               | 7 +++++++
 arch/powerpc/include/asm/atomic.h  | 8 ++++----
 arch/powerpc/include/asm/io.h      | 2 +-
 arch/powerpc/include/asm/uaccess.h | 4 ++--
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 261e9453b43c..39cd8d3ff846 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -7,6 +7,13 @@ config CC_HAS_ELFV2
 config CC_HAS_PREFIXED
 	def_bool PPC64 && $(cc-option, -mcpu=power10 -mprefixed)
 
+config CC_HAS_BROKEN_DFORM_MEMOP_ASM
+	# GCC has a bug (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108239)
+	# when compiling with prefixed instructions that causes it to generate
+	# out-of-range offsets for d-form loads and stores from memory
+	# operands.
+	def_bool CC_HAS_PREFIXED && CC_IS_GCC
+
 config CC_HAS_PCREL
 	# Clang has a bug (https://github.com/llvm/llvm-project/issues/62372)
 	# where pcrel code is not generated if -msoft-float, -mno-altivec, or
diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 47228b177478..f15c9e54e261 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -28,7 +28,7 @@ static __inline__ int arch_atomic_read(const atomic_t *v)
 	int t;
 
 	/* -mprefixed can generate offsets beyond range, fall back hack */
-	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
+	if (IS_ENABLED(CONFIG_CC_HAS_BROKEN_DFORM_MEMOP_ASM))
 		__asm__ __volatile__("lwz %0,0(%1)" : "=r"(t) : "b"(&v->counter));
 	else
 		__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
@@ -39,7 +39,7 @@ static __inline__ int arch_atomic_read(const atomic_t *v)
 static __inline__ void arch_atomic_set(atomic_t *v, int i)
 {
 	/* -mprefixed can generate offsets beyond range, fall back hack */
-	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
+	if (IS_ENABLED(CONFIG_CC_HAS_BROKEN_DFORM_MEMOP_ASM))
 		__asm__ __volatile__("stw %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
 	else
 		__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
@@ -206,7 +206,7 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
 	s64 t;
 
 	/* -mprefixed can generate offsets beyond range, fall back hack */
-	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
+	if (IS_ENABLED(CONFIG_CC_HAS_BROKEN_DFORM_MEMOP_ASM))
 		__asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter));
 	else
 		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
@@ -217,7 +217,7 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
 static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
 {
 	/* -mprefixed can generate offsets beyond range, fall back hack */
-	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
+	if (IS_ENABLED(CONFIG_CC_HAS_BROKEN_DFORM_MEMOP_ASM))
 		__asm__ __volatile__("std %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
 	else
 		__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index f1e657c9bbe8..2e6061f26c09 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -98,7 +98,7 @@ extern bool isa_io_special;
  */
 
 /* -mprefixed can generate offsets beyond range, fall back hack */
-#ifdef CONFIG_PPC_KERNEL_PREFIXED
+#ifdef CONFIG_CC_HAS_BROKEN_DFORM_MEMOP_ASM
 #define DEF_MMIO_IN_X(name, size, insn)				\
 static inline u##size name(const volatile u##size __iomem *addr)	\
 {									\
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index a2d255aa9627..6fdca4cddcf3 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -72,7 +72,7 @@ __pu_failed:							\
  * are no aliasing issues.
  */
 /* -mprefixed can generate offsets beyond range, fall back hack */
-#ifdef CONFIG_PPC_KERNEL_PREFIXED
+#ifdef CONFIG_CC_HAS_BROKEN_DFORM_MEMOP_ASM
 #define __put_user_asm_goto(x, addr, label, op)			\
 	asm_volatile_goto(					\
 		"1:	" op " %0,0(%1)	# put_user\n"		\
@@ -144,7 +144,7 @@ do {								\
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 
 /* -mprefixed can generate offsets beyond range, fall back hack */
-#ifdef CONFIG_PPC_KERNEL_PREFIXED
+#ifdef CONFIG_CC_HAS_BROKEN_DFORM_MEMOP_ASM
 #define __get_user_asm_goto(x, addr, label, op)			\
 	asm_volatile_goto(					\
 		"1:	"op" %0,0(%1)	# get_user\n"		\
-- 
2.40.0

