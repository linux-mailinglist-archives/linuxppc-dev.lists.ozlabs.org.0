Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B755BCDDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRH1285Gz3bWD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:03:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=USOADQoq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=USOADQoq;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRFD03Tpz3bSV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:02:07 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id c198so28181652pfc.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Pw35zAuLYoq0YQzkHsOS/DMw8QBEgeBNadwb5llTLtE=;
        b=USOADQoqkqyyzt/72Af6LO7aX18GGUgJYiwY9fBS+/Nv/wc0Y5ox+zutr4dxbVvlMH
         1gNhHYcl3N9NXcdXMDf64GtbTYMjskb6Wf+9N7CPcgXxp7zYm67zAv2ulOejKp04FouX
         qF1GDtXC6565xFhMP6MmSCMADFe5Wa26VRNP4vd7IcrRgv8hmBeXzACaHilnXcovHmTw
         tHaat9ZKAnrViP1aw/D1/vOsJcFI9OD5GG8d6OpYtNJGxHz48qT8ttLTT0yNlw7I3Jfa
         KD/b8Kxj+V2ourfwwhMFMuH9HarA5im+4z+gG3095J1bS9YTh1GtzUi1VfU+nPoaeYrH
         6DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Pw35zAuLYoq0YQzkHsOS/DMw8QBEgeBNadwb5llTLtE=;
        b=KQrVlUGK4e6vy1xT3WLf27pZnxaOAdhWtZt4i0k/aRQVYZ6Da5mEjUQEQ2gjQegH4o
         c9kM+NFxuu/LsgVbZxWodKgtnM3vkuFgmKsPsaOZJxJ7E9sIk7UGZPFsWNh868XwOtmA
         JUh4GjAnGPhlybhgMg2tZW6dc+jfotXz7qBRVRatFokkJeEz07Ew/SSA+BRF6ra9rRp+
         9alm/9+YQLeKQn/CYBxaSFTko/rXqryUcX0fRAZ0K5wLHDXkLcBhS95xe67YYKy9b8wj
         FA6z1gKgjzDWBOQDDNNAoWJtOcluorI6VCJEB2Wr6pO1TzdIk0HL3ATscNGtyiGX7Xol
         onEQ==
X-Gm-Message-State: ACrzQf1O9+hZBOYCWVPkCHyF2aP8lWjU4t+tsdVR9Vl4WOiOnUWwhKvW
	Diyq8byGWpGxqkbysKUbsO+MIZ7Y04Y=
X-Google-Smtp-Source: AMsMyM4lFAyHbZIgLEBKd0tYUCjGXf3T7nScgEm5QsAwllmW94k5n3Wlyd+YvkG4/JdciYT2to6Csg==
X-Received: by 2002:a05:6a00:cd6:b0:546:d03:3dd7 with SMTP id b22-20020a056a000cd600b005460d033dd7mr18312810pfv.19.1663596124951;
        Mon, 19 Sep 2022 07:02:04 -0700 (PDT)
Received: from bobo.ibm.com (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902780800b001637529493esm20477931pll.66.2022.09.19.07.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:02:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/7] powerpc/64: abstract asm global variable declaration and access
Date: Tue, 20 Sep 2022 00:01:44 +1000
Message-Id: <20220919140149.4018927-3-npiggin@gmail.com>
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

Use asm helpers to access global variables and to define them in asm.
Stop using got addressing and use the more common @toc offsets. 32-bit
already does this so that should be unchanged.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/opal-calls.S              |  6 +-
 arch/powerpc/boot/ppc_asm.h                 |  4 ++
 arch/powerpc/include/asm/ppc_asm.h          | 72 ++++++++++++++++++++-
 arch/powerpc/kernel/interrupt_64.S          | 10 ---
 arch/powerpc/kernel/swsusp_asm64.S          | 22 ++++---
 arch/powerpc/kernel/trace/ftrace_mprofile.S |  3 +-
 arch/powerpc/kernel/vector.S                | 41 ++++--------
 arch/powerpc/lib/copypage_64.S              |  9 ++-
 arch/powerpc/lib/string_64.S                |  9 ++-
 arch/powerpc/perf/bhrb.S                    |  2 +-
 arch/powerpc/platforms/pseries/hvCall.S     | 10 +--
 arch/powerpc/xmon/spr_access.S              |  4 +-
 12 files changed, 118 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/boot/opal-calls.S b/arch/powerpc/boot/opal-calls.S
index ad0e15d930c4..1f2f330a459e 100644
--- a/arch/powerpc/boot/opal-calls.S
+++ b/arch/powerpc/boot/opal-calls.S
@@ -16,7 +16,7 @@ opal_kentry:
 	li	r5, 0
 	li	r6, 0
 	li	r7, 0
-	ld	r11,opal@got(r2)
+	LOAD_REG_ADDR(r11, opal)
 	ld	r8,0(r11)
 	ld	r9,8(r11)
 	bctr
@@ -35,7 +35,7 @@ opal_call:
 	mr	r13,r2
 
 	/* Set opal return address */
-	ld	r11,opal_return@got(r2)
+	LOAD_REG_ADDR(r11, opal_return)
 	mtlr	r11
 	mfmsr	r12
 
@@ -45,7 +45,7 @@ opal_call:
 	mtspr	SPRN_HSRR1,r12
 
 	/* load the opal call entry point and base */
-	ld	r11,opal@got(r2)
+	LOAD_REG_ADDR(r11, opal)
 	ld	r12,8(r11)
 	ld	r2,0(r11)
 	mtspr	SPRN_HSRR0,r12
diff --git a/arch/powerpc/boot/ppc_asm.h b/arch/powerpc/boot/ppc_asm.h
index 192b97523b05..ea290bf78fb2 100644
--- a/arch/powerpc/boot/ppc_asm.h
+++ b/arch/powerpc/boot/ppc_asm.h
@@ -84,4 +84,8 @@
 #define MFTBU(dest)			mfspr dest, SPRN_TBRU
 #endif
 
+#define LOAD_REG_ADDR(reg,name)			\
+	addis	reg,r2,name@toc@ha;		\
+	addi	reg,reg,name@toc@l
+
 #endif /* _PPC64_PPC_ASM_H */
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 83c02f5a7f2a..520c4c9caf7f 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -303,6 +303,75 @@ GLUE(.,name):
 	.endif
 .endm
 
+.macro declare_var name, align
+	.type \name,@object
+#	.section ".toc","aw"
+	.data
+	.balign \align
+\name\():
+.endm
+
+.macro declare_var_end
+	.previous
+.endm
+
+.macro load_var_addr reg, name
+	addis	\reg,%r2,\name\()@toc@ha
+	addi	\reg,\reg,\name\()@toc@l
+.endm
+
+.macro load_var reg, name, size
+	addis	\reg,%r2,\name\()@toc@ha
+	.if \size == 1
+	lbz	\reg,\name\()@toc@l(\reg)
+	.elseif \size == 2
+	lhz	\reg,\name\()@toc@l(\reg)
+	.elseif \size == 4
+	lwz	\reg,\name\()@toc@l(\reg)
+	.elseif \size == 8
+	ld	\reg,\name\()@toc@l(\reg)
+	.else
+	.error "bad size"
+	.endif
+.endm
+
+.macro store_var reg, name, size
+	addis	\reg,%r2,\name\()@toc@ha
+	.if \size == 1
+	pstb	\reg,\name\()@toc@l(\reg)
+	.elseif \size == 2
+	psth	\reg,\name\()@toc@l(\reg)
+	.elseif \size == 4
+	pstw	\reg,\name\()@toc@l(\reg)
+	.elseif \size == 8
+	pstd	\reg,\name\()@toc@l(\reg)
+	.else
+	.error "bad size"
+	.endif
+.endm
+
+.macro fload_var reg, tmpreg, name, size
+	addis	\tmpreg,%r2,\name\()@toc@ha
+	.if \size == 4
+	lfs	\reg,\name\()@toc@l(\tmpreg)
+	.elseif \size == 8
+	lfd	\reg,\name\()@toc@l(\tmpreg)
+	.else
+	.error "bad size"
+	.endif
+.endm
+
+.macro fstore_var reg, tmpreg, name, size
+	addis	\tmpreg,%r2,\name\()@toc@ha
+	.if \size == 4
+	stfs	\reg,\name\()@toc@l(\tmpreg)
+	.elseif \size == 8
+	stfd	\reg,\name\()@toc@l(\tmpreg)
+	.else
+	.error "bad size"
+	.endif
+.endm
+
 #ifdef __powerpc64__
 
 #define LOAD_REG_IMMEDIATE(reg, expr) __LOAD_REG_IMMEDIATE reg, expr
@@ -315,7 +384,8 @@ GLUE(.,name):
 	rldimi	reg, tmp, 32, 0
 
 #define LOAD_REG_ADDR(reg,name)			\
-	ld	reg,name@got(r2)
+	addis	reg,r2,name@toc@ha;		\
+	addi	reg,reg,name@toc@l
 
 #define LOAD_REG_ADDRBASE(reg,name)	LOAD_REG_ADDR(reg,name)
 #define ADDROFF(name)			0
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 14c409fd4c38..e95911f49eb8 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -13,16 +13,6 @@
 #include <asm/ppc_asm.h>
 #include <asm/ptrace.h>
 
-	.section	".toc","aw"
-SYS_CALL_TABLE:
-	.tc sys_call_table[TC],sys_call_table
-
-#ifdef CONFIG_COMPAT
-COMPAT_SYS_CALL_TABLE:
-	.tc compat_sys_call_table[TC],compat_sys_call_table
-#endif
-	.previous
-
 	.align 7
 
 .macro DEBUG_SRR_VALID srr
diff --git a/arch/powerpc/kernel/swsusp_asm64.S b/arch/powerpc/kernel/swsusp_asm64.S
index 9f1903c7f540..bc1f8335219b 100644
--- a/arch/powerpc/kernel/swsusp_asm64.S
+++ b/arch/powerpc/kernel/swsusp_asm64.S
@@ -76,16 +76,18 @@
 swsusp_save_area:
 	.space SL_SIZE
 
-	.section ".toc","aw"
-swsusp_save_area_ptr:
-	.tc	swsusp_save_area[TC],swsusp_save_area
-restore_pblist_ptr:
-	.tc	restore_pblist[TC],restore_pblist
+declare_var swsusp_save_area_ptr, 8
+	.quad swsusp_save_area
+declare_var_end
+
+declare_var restore_pblist_ptr, 8
+	.quad restore_pblist
+declare_var_end
 
 	.section .text
 	.align  5
 _GLOBAL(swsusp_arch_suspend)
-	ld	r11,swsusp_save_area_ptr@toc(r2)
+	load_var r11, swsusp_save_area_ptr, 8
 	SAVE_SPECIAL(LR)
 	SAVE_REGISTER(r1)
 	SAVE_SPECIAL(CR)
@@ -131,7 +133,7 @@ END_FW_FTR_SECTION_IFCLR(FW_FEATURE_LPAR)
 	bl swsusp_save
 
 	/* restore LR */
-	ld	r11,swsusp_save_area_ptr@toc(r2)
+	load_var r11, swsusp_save_area_ptr, 8
 	RESTORE_SPECIAL(LR)
 	addi	r1,r1,128
 
@@ -145,7 +147,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	sync
 
-	ld	r12,restore_pblist_ptr@toc(r2)
+	load_var r12, restore_pblist_ptr, 8
 	ld	r12,0(r12)
 
 	cmpdi	r12,0
@@ -187,7 +189,7 @@ nothing_to_copy:
 	tlbia
 #endif
 
-	ld	r11,swsusp_save_area_ptr@toc(r2)
+	load_var r11, swsusp_save_area_ptr, 8
 
 	RESTORE_SPECIAL(CR)
 
@@ -265,7 +267,7 @@ END_FW_FTR_SECTION_IFCLR(FW_FEATURE_LPAR)
 	bl	do_after_copyback
 	addi	r1,r1,128
 
-	ld	r11,swsusp_save_area_ptr@toc(r2)
+	load_var r11, swsusp_save_area_ptr, 8
 	RESTORE_SPECIAL(LR)
 
 	li	r3, 0
diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index 4fa23e260cab..33fcfb2eaded 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -85,8 +85,7 @@
 	std	r2, STK_GOT(r1)
 	ld	r2,PACATOC(r13)	/* get kernel TOC in r2 */
 
-	addis	r3,r2,function_trace_op@toc@ha
-	addi	r3,r3,function_trace_op@toc@l
+	LOAD_REG_ADDR(r3, function_trace_op)
 	ld	r5,0(r3)
 #else
 	lis	r3,function_trace_op@ha
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 5cc24d8cce94..1ccc8aeb29fb 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -155,33 +155,18 @@ _GLOBAL(load_up_vsx)
  * usage of floating-point registers.  These routines must be called
  * with preempt disabled.
  */
-#ifdef CONFIG_PPC32
-	.data
-fpzero:
-	.long	0
-fpone:
-	.long	0x3f800000	/* 1.0 in single-precision FP */
-fphalf:
-	.long	0x3f000000	/* 0.5 in single-precision FP */
-
-#define LDCONST(fr, name)	\
-	lis	r11,name@ha;	\
-	lfs	fr,name@l(r11)
-#else
+declare_var fpzero, 8
+	.quad	0
+declare_var_end
 
-	.section ".toc","aw"
-fpzero:
-	.tc	FD_0_0[TC],0
-fpone:
-	.tc	FD_3ff00000_0[TC],0x3ff0000000000000	/* 1.0 */
-fphalf:
-	.tc	FD_3fe00000_0[TC],0x3fe0000000000000	/* 0.5 */
+declare_var fpone, 8
+	.quad	0x3ff0000000000000
+declare_var_end
 
-#define LDCONST(fr, name)	\
-	lfd	fr,name@toc(r2)
-#endif
+declare_var fphalf, 8
+	.quad	0x3fe0000000000000
+declare_var_end
 
-	.text
 /*
  * Internal routine to enable floating point and set FPSCR to 0.
  * Don't call it from C; it doesn't use the normal calling convention.
@@ -199,7 +184,7 @@ fpenable:
 	stfd	fr0,24(r1)
 	stfd	fr1,16(r1)
 	stfd	fr31,8(r1)
-	LDCONST(fr1, fpzero)
+	fload_var	fr1, r11, fpzero, 4
 	mffs	fr31
 	MTFSF_L(fr1)
 	blr
@@ -297,7 +282,7 @@ _GLOBAL(vrefp)
 	mflr	r12
 	bl	fpenable
 	li	r0,4
-	LDCONST(fr1, fpone)
+	fload_var	fr1, r11, fpone, 4
 	mtctr	r0
 	li	r6,0
 1:	lfsx	fr0,r4,r6
@@ -321,8 +306,8 @@ _GLOBAL(vrsqrtefp)
 	stfd	fr4,48(r1)
 	stfd	fr5,56(r1)
 	li	r0,4
-	LDCONST(fr4, fpone)
-	LDCONST(fr5, fphalf)
+	fload_var	fr4, r11, fpone, 4
+	fload_var	fr5, r11, fphalf, 4
 	mtctr	r0
 	li	r6,0
 1:	lfsx	fr0,r4,r6
diff --git a/arch/powerpc/lib/copypage_64.S b/arch/powerpc/lib/copypage_64.S
index d1091b5ee5da..cfff67161011 100644
--- a/arch/powerpc/lib/copypage_64.S
+++ b/arch/powerpc/lib/copypage_64.S
@@ -9,10 +9,9 @@
 #include <asm/export.h>
 #include <asm/feature-fixups.h>
 
-        .section        ".toc","aw"
-PPC64_CACHES:
-        .tc             ppc64_caches[TC],ppc64_caches
-        .section        ".text"
+declare_var caches, 8
+	.quad ppc64_caches
+declare_var_end
 
 _GLOBAL_TOC(copy_page)
 BEGIN_FTR_SECTION
@@ -24,7 +23,7 @@ FTR_SECTION_ELSE
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
 	ori	r5,r5,PAGE_SIZE@l
 BEGIN_FTR_SECTION
-	ld      r10,PPC64_CACHES@toc(r2)
+	load_var	r10, caches, 8
 	lwz	r11,DCACHEL1LOGBLOCKSIZE(r10)	/* log2 of cache block size */
 	lwz     r12,DCACHEL1BLOCKSIZE(r10)	/* get cache block size */
 	li	r9,0
diff --git a/arch/powerpc/lib/string_64.S b/arch/powerpc/lib/string_64.S
index 169872bc0892..157b2e73285c 100644
--- a/arch/powerpc/lib/string_64.S
+++ b/arch/powerpc/lib/string_64.S
@@ -11,10 +11,9 @@
 #include <asm/asm-offsets.h>
 #include <asm/export.h>
 
-	.section	".toc","aw"
-PPC64_CACHES:
-	.tc		ppc64_caches[TC],ppc64_caches
-	.section	".text"
+declare_var caches, 8
+	.quad ppc64_caches
+declare_var_end
 
 /**
  * __arch_clear_user: - Zero a block of memory in user space, with less checking.
@@ -133,7 +132,7 @@ err1;	stb	r0,0(r3)
 	blr
 
 .Llong_clear:
-	ld	r5,PPC64_CACHES@toc(r2)
+	load_var	r5, caches, 8
 
 	bf	cr7*4+0,11f
 err2;	std	r0,0(r3)
diff --git a/arch/powerpc/perf/bhrb.S b/arch/powerpc/perf/bhrb.S
index 1aa3259716b8..47ba05d5ae76 100644
--- a/arch/powerpc/perf/bhrb.S
+++ b/arch/powerpc/perf/bhrb.S
@@ -21,7 +21,7 @@
 _GLOBAL(read_bhrb)
 	cmpldi	r3,31
 	bgt	1f
-	ld	r4,bhrb_table@got(r2)
+	LOAD_REG_ADDR(r4, bhrb_table)
 	sldi	r3,r3,3
 	add	r3,r4,r3
 	mtctr	r3
diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index ab9fc6506861..0a42e1e7a577 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -16,13 +16,9 @@
 #ifdef CONFIG_TRACEPOINTS
 
 #ifndef CONFIG_JUMP_LABEL
-	.section	".toc","aw"
-
-	.globl hcall_tracepoint_refcount
-hcall_tracepoint_refcount:
+declare_var hcall_tracepoint_refcount, 8
 	.8byte	0
-
-	.section	".text"
+declare_var_end
 #endif
 
 /*
@@ -88,7 +84,7 @@ hcall_tracepoint_refcount:
 BEGIN_FTR_SECTION;						\
 	b	1f;						\
 END_FTR_SECTION(0, 1);						\
-	ld	r12,hcall_tracepoint_refcount@toc(r2);		\
+	load_var r12, hcall_tracepoint_refcount, 8 ;		\
 	std	r12,32(r1);					\
 	cmpdi	r12,0;						\
 	bne-	LABEL;						\
diff --git a/arch/powerpc/xmon/spr_access.S b/arch/powerpc/xmon/spr_access.S
index 720a52afdd58..c308ddf268fb 100644
--- a/arch/powerpc/xmon/spr_access.S
+++ b/arch/powerpc/xmon/spr_access.S
@@ -4,12 +4,12 @@
 
 /* unsigned long xmon_mfspr(sprn, default_value) */
 _GLOBAL(xmon_mfspr)
-	PPC_LL	r5, .Lmfspr_table@got(r2)
+	LOAD_REG_ADDR(r5, .Lmfspr_table)
 	b	xmon_mxspr
 
 /* void xmon_mtspr(sprn, new_value) */
 _GLOBAL(xmon_mtspr)
-	PPC_LL	r5, .Lmtspr_table@got(r2)
+	LOAD_REG_ADDR(r5, .Lmtspr_table)
 	b	xmon_mxspr
 
 /*
-- 
2.37.2

