Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C932494E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:13:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHts6XhPz3dLH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:13:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=ouf5D+bv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ouf5D+bv; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHq81n1dz3d2m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:10:44 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d12so133713pfo.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8kLCG5Xf2rldTZLpgMUjTs8QdJPGExRp8Y6d/UJveAk=;
 b=ouf5D+bv4GixdA8LtkSBYDaaxFPcSTo0+rJ26xQKnou+cH1GKu5WmgNPre+hVc57mZ
 nMrllgvVSpjf1xWvXrTl8yn+Fie+ySHYELg3Ae017J0fCEQptZZ6eHWS/KKn2AKp+4/l
 495OoqDGYA29btc2ThrMIMJOB6/P5gPZPOuvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8kLCG5Xf2rldTZLpgMUjTs8QdJPGExRp8Y6d/UJveAk=;
 b=nZGZt8xu9uOOmShZzZdbtMhD1wkjZVVyVWFLt1yWvGoRBhRUZVm7L3PRADBHMxmXuU
 sDkvePhy5VL06+qnFMxb9XpbcW9JNzlBwRUpW3Jaup0zzsbe4qKprg1lcFuFmiJBmtIy
 L6S3iAD12bAj3OyCavq0LWHsc3zYLmH1kAGVbDJ9EQTpv36JuVq1Y4Wkmu4Qu1E0eouL
 0ZSJMIzYrcs4qjyy8F2ZFcb2L5WPg6WWp1npwL7m5njzDPKLF7Hy/ZmoQVzSzm129yhB
 qqtmUa85vazfhQJYnP/q73TvSGbjSSLPsKdz4T+u1QmAPmiWhOzw0EREhR5qrBh4aEfu
 zt9A==
X-Gm-Message-State: AOAM530ZznKoA+XsNTll57xQqbmBDCKvj4GYtE+dNq4Qh3VbeCCTYVR0
 C4yPWGPDfsbrRKQwors/kqG2RxacE8zxcitV
X-Google-Smtp-Source: ABdhPJzeTgBZ7BGBAFBdK6Vqp13rIf5VA3VPAUEMYa2TfHcoqc3Txuc2+nyG8WuyktdUtSMZSJ8jtg==
X-Received: by 2002:a65:5806:: with SMTP id g6mr1018694pgr.112.1614222641942; 
 Wed, 24 Feb 2021 19:10:41 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-6e65-7e50-8dac-f7ef.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:6e65:7e50:8dac:f7ef])
 by smtp.gmail.com with ESMTPSA id o129sm3927279pgo.27.2021.02.24.19.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:10:41 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: llvmlinux@lists.linuxfoundation.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 8/8] powerpc/64/asm: don't reassign labels
Date: Thu, 25 Feb 2021 14:10:06 +1100
Message-Id: <20210225031006.1204774-9-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225031006.1204774-1-dja@axtens.net>
References: <20210225031006.1204774-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The assembler really does not like us reassigning things to the same
label:

<instantiation>:7:9: error: invalid reassignment of non-absolute variable 'fs_label'

This happens across a bunch of platforms:
https://github.com/ClangBuiltLinux/linux/issues/1043
https://github.com/ClangBuiltLinux/linux/issues/1008
https://github.com/ClangBuiltLinux/linux/issues/920
https://github.com/ClangBuiltLinux/linux/issues/1050

There is no hope of getting this fixed in LLVM, so if we want to build
with LLVM_IAS, we need to hack around it ourselves.

For us the big problem comes from this:

\#define USE_FIXED_SECTION(sname)				\
	fs_label = start_##sname;				\
	fs_start = sname##_start;				\
	use_ftsec sname;

\#define USE_TEXT_SECTION()
	fs_label = start_text;					\
	fs_start = text_start;					\
	.text

and in particular fs_label.

I have tried to work around it by not setting those 'variables', and
requiring that users of the variables instead track for themselves
what section they are in. This isn't amazing, by any stretch, but it
gets us further in the compilation.

I'm still stuck with the following from head_64.S:

.balign 8
p_end: .8byte _end - copy_to_here

4:
	/*
	 * Now copy the rest of the kernel up to _end, add
	 * _end - copy_to_here to the copy limit and run again.
	 */
	addis   r8,r26,(ABS_ADDR(p_end, text))@ha
	ld      r8,(ABS_ADDR(p_end, text))@l(r8)
	add	r5,r5,r8
5:	bl	copy_and_flush		/* copy the rest */

9:	b	start_here_multiplatform

Clang does not like this code - in particular it complains about the addis, saying

<unknown>:0: error: expected relocatable expression

I don't know what's special about p_end, because just above we do an
ABS_ADDR(4f, text) and that seems to work just fine.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/include/asm/head-64.h   | 12 +++++------
 arch/powerpc/kernel/exceptions-64s.S | 31 ++++++++++++++--------------
 arch/powerpc/kernel/head_64.S        | 16 +++++++-------
 3 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 7d8ccab47e86..43849a777f91 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -98,13 +98,9 @@ linker_stub_catch:						\
 	. = sname##_len;
 
 #define USE_FIXED_SECTION(sname)				\
-	fs_label = start_##sname;				\
-	fs_start = sname##_start;				\
 	use_ftsec sname;
 
 #define USE_TEXT_SECTION()					\
-	fs_label = start_text;					\
-	fs_start = text_start;					\
 	.text
 
 #define CLOSE_FIXED_SECTION(sname)				\
@@ -161,13 +157,15 @@ end_##sname:
  * - ABS_ADDR is used to find the absolute address of any symbol, from within
  *   a fixed section.
  */
-#define DEFINE_FIXED_SYMBOL(label)				\
-	label##_absolute = (label - fs_label + fs_start)
+// define label as being _in_ sname
+#define DEFINE_FIXED_SYMBOL(label, sname) \
+	label##_absolute = (label - start_ ## sname + sname ## _start)
 
 #define FIXED_SYMBOL_ABS_ADDR(label)				\
 	(label##_absolute)
 
-#define ABS_ADDR(label) (label - fs_label + fs_start)
+// find label from _within_ sname
+#define ABS_ADDR(label, sname) (label - start_ ## sname + sname ## _start)
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 720fb9892745..295d90202665 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -64,7 +64,7 @@
 	.balign IFETCH_ALIGN_BYTES;				\
 	.global name;						\
 	_ASM_NOKPROBE_SYMBOL(name);				\
-	DEFINE_FIXED_SYMBOL(name);				\
+	DEFINE_FIXED_SYMBOL(name, text);			\
 name:
 
 #define TRAMP_REAL_BEGIN(name)					\
@@ -92,18 +92,18 @@ name:
 	ld	reg,PACAKBASE(r13);	/* get high part of &label */	\
 	ori	reg,reg,FIXED_SYMBOL_ABS_ADDR(label)
 
-#define __LOAD_HANDLER(reg, label)					\
+#define __LOAD_HANDLER(reg, label, section)					\
 	ld	reg,PACAKBASE(r13);					\
-	ori	reg,reg,(ABS_ADDR(label))@l
+	ori	reg,reg,(ABS_ADDR(label, section))@l
 
 /*
  * Branches from unrelocated code (e.g., interrupts) to labels outside
  * head-y require >64K offsets.
  */
-#define __LOAD_FAR_HANDLER(reg, label)					\
+#define __LOAD_FAR_HANDLER(reg, label, section)					\
 	ld	reg,PACAKBASE(r13);					\
-	ori	reg,reg,(ABS_ADDR(label))@l;				\
-	addis	reg,reg,(ABS_ADDR(label))@h
+	ori	reg,reg,(ABS_ADDR(label, section))@l;				\
+	addis	reg,reg,(ABS_ADDR(label, section))@h
 
 /*
  * Branch to label using its 0xC000 address. This results in instruction
@@ -113,8 +113,9 @@ name:
  * This could set the 0xc bits for !RELOCATABLE as an immediate, rather than
  * load KBASE for a slight optimisation.
  */
+// only called once
 #define BRANCH_TO_C000(reg, label)					\
-	__LOAD_FAR_HANDLER(reg, label);					\
+	__LOAD_FAR_HANDLER(reg, label, real_trampolines);					\
 	mtctr	reg;							\
 	bctr
 
@@ -458,7 +459,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
  * This switches to virtual mode and sets MSR[RI].
  */
 .macro __GEN_COMMON_ENTRY name
-DEFINE_FIXED_SYMBOL(\name\()_common_real)
+DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 \name\()_common_real:
 	.if IKVM_REAL
 		KVMTEST \name
@@ -481,7 +482,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 	.endif
 
 	.balign IFETCH_ALIGN_BYTES
-DEFINE_FIXED_SYMBOL(\name\()_common_virt)
+DEFINE_FIXED_SYMBOL(\name\()_common_virt, text)
 \name\()_common_virt:
 	.if IKVM_VIRT
 		KVMTEST \name
@@ -495,7 +496,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
  * want to run in real mode.
  */
 .macro __GEN_REALMODE_COMMON_ENTRY name
-DEFINE_FIXED_SYMBOL(\name\()_common_real)
+DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 \name\()_common_real:
 	.if IKVM_REAL
 		KVMTEST \name
@@ -856,12 +857,12 @@ EXC_VIRT_END(system_call_vectored, 0x3000, 0x1000)
 
 #ifdef CONFIG_RELOCATABLE
 TRAMP_VIRT_BEGIN(system_call_vectored_tramp)
-	__LOAD_HANDLER(r10, system_call_vectored_common)
+	__LOAD_HANDLER(r10, system_call_vectored_common, virt_trampolines)
 	mtctr	r10
 	bctr
 
 TRAMP_VIRT_BEGIN(system_call_vectored_sigill_tramp)
-	__LOAD_HANDLER(r10, system_call_vectored_sigill)
+	__LOAD_HANDLER(r10, system_call_vectored_sigill, virt_trampolines)
 	mtctr	r10
 	bctr
 #endif
@@ -1968,14 +1969,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	HMT_MEDIUM
 
 	.if ! \virt
-	__LOAD_HANDLER(r10, system_call_common_real)
+	__LOAD_HANDLER(r10, system_call_common_real, real_vectors)
 	mtctr	r10
 	bctr
 	.else
 	li	r10,MSR_RI
 	mtmsrd 	r10,1			/* Set RI (EE=0) */
 #ifdef CONFIG_RELOCATABLE
-	__LOAD_HANDLER(r10, system_call_common)
+	__LOAD_HANDLER(r10, system_call_common, virt_vectors)
 	mtctr	r10
 	bctr
 #else
@@ -3075,7 +3076,7 @@ USE_FIXED_SECTION(virt_trampolines)
 	.align	7
 	.globl	__end_interrupts
 __end_interrupts:
-DEFINE_FIXED_SYMBOL(__end_interrupts)
+DEFINE_FIXED_SYMBOL(__end_interrupts, virt_trampolines)
 
 #ifdef CONFIG_PPC_970_NAP
 	/*
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ece7f97bafff..3a10e9f55baa 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -156,7 +156,7 @@ __secondary_hold:
 	/* Tell the master cpu we're here */
 	/* Relocation is off & we are located at an address less */
 	/* than 0x100, so only need to grab low order offset.    */
-	std	r24,(ABS_ADDR(__secondary_hold_acknowledge))(0)
+	std	r24,(ABS_ADDR(__secondary_hold_acknowledge, first_256B))(0)
 	sync
 
 	li	r26,0
@@ -164,7 +164,7 @@ __secondary_hold:
 	tovirt(r26,r26)
 #endif
 	/* All secondary cpus wait here until told to start. */
-100:	ld	r12,(ABS_ADDR(__secondary_hold_spinloop))(r26)
+100:	ld	r12,(ABS_ADDR(__secondary_hold_spinloop, first_256B))(r26)
 	cmpdi	0,r12,0
 	beq	100b
 
@@ -646,15 +646,15 @@ __after_prom_start:
 3:
 #endif
 	/* # bytes of memory to copy */
-	lis	r5,(ABS_ADDR(copy_to_here))@ha
-	addi	r5,r5,(ABS_ADDR(copy_to_here))@l
+	lis	r5,(ABS_ADDR(copy_to_here, text))@ha
+	addi	r5,r5,(ABS_ADDR(copy_to_here, text))@l
 
 	bl	copy_and_flush		/* copy the first n bytes	 */
 					/* this includes the code being	 */
 					/* executed here.		 */
 	/* Jump to the copy of this code that we just made */
-	addis	r8,r3,(ABS_ADDR(4f))@ha
-	addi	r12,r8,(ABS_ADDR(4f))@l
+	addis	r8,r3,(ABS_ADDR(4f, text))@ha
+	addi	r12,r8,(ABS_ADDR(4f, text))@l
 	mtctr	r12
 	bctr
 
@@ -666,8 +666,8 @@ p_end: .8byte _end - copy_to_here
 	 * Now copy the rest of the kernel up to _end, add
 	 * _end - copy_to_here to the copy limit and run again.
 	 */
-	addis   r8,r26,(ABS_ADDR(p_end))@ha
-	ld      r8,(ABS_ADDR(p_end))@l(r8)
+	addis   r8,r26,(ABS_ADDR(p_end, text))@ha
+	ld      r8,(ABS_ADDR(p_end, text))@l(r8)
 	add	r5,r5,r8
 5:	bl	copy_and_flush		/* copy the rest */
 
-- 
2.27.0

