Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DE5E984A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 05:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbT9T4VXcz3drn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 13:42:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=llXFrtfX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=llXFrtfX;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbT7b27fTz2yX3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 13:41:15 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso5455661pjm.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 20:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TDSj4qjotdRznn+ITqT+mEsGn4TSnDWjqEqL+xP7CHw=;
        b=llXFrtfXqI97LaTN92f9QbRUqkwFs4O/o4+1m8FQnyq+w/X//bR62KJEwoLByhL/aa
         5l7pag97vNhvpAVz9ZaP9NAFlj5mYtin2Spo1KmJuth/0GTfDgESXUqJvIUISwKQRLbp
         WNoCoZLLs+W/BbJvEL18FoIYIiRp7LR/wXs2SLP8GQ7xuph071wc76NmIiygBhGvHXm5
         jnoXYC7jxt1B/ZEboxwLsn/bUpsBKFDjuXwmeLfK5tMQG2vi9EVoqjVhUJLkZrXKCDIu
         Ug6m31WMcs3aNbp43tsYsNemEcevPLDlIRvPqqCZH65wIBvk3T1f1aGkCntF5BG6oP3f
         paFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TDSj4qjotdRznn+ITqT+mEsGn4TSnDWjqEqL+xP7CHw=;
        b=NcqN+alnyvlxBl3K+J1KqAFRPzi7iv97vo68M6PscaxjYTrvHBgtqSv0zRKS5aBL1b
         8Gl07UpknBuirW5F7Vi69t01XPbLalF81KFUl11INctrkwUXqwARjxL8/wl8c5x1fXCH
         odlxMm/CVK+gymCmo3SNfz5qbKsYtSNw4b9HGRMnCSIXm2dkwdIgm668n07OKEdRJZz+
         TbeuJsRgoxK6zuPIRdCd0v1phMhgq/9I3yLqGCnj8z7Wo2cwkwtpebTCUyyJWGj7sQqU
         n6+ifUx0kJuX8NhXNzz8CzWlo8fQu74Ep34Rcwkk5sk2D+8kFuYQ1vhEPt4yaYC/JAN5
         hvZw==
X-Gm-Message-State: ACrzQf0u8mzfY23d99c68RwC4skmDxQCHFcePXgsteRNlN5gru/GCV8t
	sirN1CiKi0YQ9HXtTHRcPsAiEbU1VzQ=
X-Google-Smtp-Source: AMsMyM4jTiQLJqY8Igcx3oIEvHziqGmAQ8YQVjzyRDtk+OWlaF4nx0xn0PeAAsMVOMU6+blrcSXYLw==
X-Received: by 2002:a17:902:7589:b0:178:4ded:a90a with SMTP id j9-20020a170902758900b001784deda90amr20262546pll.74.1664163672965;
        Sun, 25 Sep 2022 20:41:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b001746f66244asm10122907pll.18.2022.09.25.20.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 20:41:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/5] powerpc/64: asm use consistent global variable declaration and access
Date: Mon, 26 Sep 2022 13:40:54 +1000
Message-Id: <20220926034057.2360083-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926034057.2360083-1-npiggin@gmail.com>
References: <20220926034057.2360083-1-npiggin@gmail.com>
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

Use helper macros to access global variables, and place them in .data
sections rather than in .toc. Putting addresses in TOC is not required
because the kernel is linked with a single TOC.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/opal-calls.S              |  6 +++---
 arch/powerpc/boot/ppc_asm.h                 |  9 +++++++++
 arch/powerpc/kernel/interrupt_64.S          | 10 ----------
 arch/powerpc/kernel/swsusp_asm64.S          | 16 +++++-----------
 arch/powerpc/kernel/trace/ftrace_mprofile.S |  3 +--
 arch/powerpc/kernel/vector.S                | 15 +++++++--------
 arch/powerpc/lib/copypage_64.S              |  7 +------
 arch/powerpc/lib/string_64.S                |  7 +------
 arch/powerpc/perf/bhrb.S                    |  2 +-
 arch/powerpc/platforms/pseries/hvCall.S     |  4 ++--
 arch/powerpc/xmon/spr_access.S              |  4 ++--
 11 files changed, 32 insertions(+), 51 deletions(-)

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
index 192b97523b05..2824a3e32aab 100644
--- a/arch/powerpc/boot/ppc_asm.h
+++ b/arch/powerpc/boot/ppc_asm.h
@@ -84,4 +84,13 @@
 #define MFTBU(dest)			mfspr dest, SPRN_TBRU
 #endif
 
+#ifdef CONFIG_PPC64_BOOT_WRAPPER
+#define LOAD_REG_ADDR(reg,name)			\
+	ld	reg,name@got(r2)
+#else
+#define LOAD_REG_ADDR(reg,name)			\
+	lis	reg,name@ha;			\
+	addi	reg,reg,name@l
+#endif
+
 #endif /* _PPC64_PPC_ASM_H */
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index ee2d2d410c5a..fbfb72a62da9 100644
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
index 9f1903c7f540..f645652c2654 100644
--- a/arch/powerpc/kernel/swsusp_asm64.S
+++ b/arch/powerpc/kernel/swsusp_asm64.S
@@ -76,16 +76,10 @@
 swsusp_save_area:
 	.space SL_SIZE
 
-	.section ".toc","aw"
-swsusp_save_area_ptr:
-	.tc	swsusp_save_area[TC],swsusp_save_area
-restore_pblist_ptr:
-	.tc	restore_pblist[TC],restore_pblist
-
 	.section .text
 	.align  5
 _GLOBAL(swsusp_arch_suspend)
-	ld	r11,swsusp_save_area_ptr@toc(r2)
+	LOAD_REG_ADDR(r11, swsusp_save_area)
 	SAVE_SPECIAL(LR)
 	SAVE_REGISTER(r1)
 	SAVE_SPECIAL(CR)
@@ -131,7 +125,7 @@ END_FW_FTR_SECTION_IFCLR(FW_FEATURE_LPAR)
 	bl swsusp_save
 
 	/* restore LR */
-	ld	r11,swsusp_save_area_ptr@toc(r2)
+	LOAD_REG_ADDR(r11, swsusp_save_area)
 	RESTORE_SPECIAL(LR)
 	addi	r1,r1,128
 
@@ -145,7 +139,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	sync
 
-	ld	r12,restore_pblist_ptr@toc(r2)
+	LOAD_REG_ADDR(r11, restore_pblist)
 	ld	r12,0(r12)
 
 	cmpdi	r12,0
@@ -187,7 +181,7 @@ nothing_to_copy:
 	tlbia
 #endif
 
-	ld	r11,swsusp_save_area_ptr@toc(r2)
+	LOAD_REG_ADDR(r11, swsusp_save_area)
 
 	RESTORE_SPECIAL(CR)
 
@@ -265,7 +259,7 @@ END_FW_FTR_SECTION_IFCLR(FW_FEATURE_LPAR)
 	bl	do_after_copyback
 	addi	r1,r1,128
 
-	ld	r11,swsusp_save_area_ptr@toc(r2)
+	LOAD_REG_ADDR(r11, swsusp_save_area)
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
index 5cc24d8cce94..5cf64740edb8 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -155,8 +155,8 @@ _GLOBAL(load_up_vsx)
  * usage of floating-point registers.  These routines must be called
  * with preempt disabled.
  */
-#ifdef CONFIG_PPC32
 	.data
+#ifdef CONFIG_PPC32
 fpzero:
 	.long	0
 fpone:
@@ -169,18 +169,17 @@ fphalf:
 	lfs	fr,name@l(r11)
 #else
 
-	.section ".toc","aw"
 fpzero:
-	.tc	FD_0_0[TC],0
+	.quad	0
 fpone:
-	.tc	FD_3ff00000_0[TC],0x3ff0000000000000	/* 1.0 */
+	.quad	0x3ff0000000000000	/* 1.0 */
 fphalf:
-	.tc	FD_3fe00000_0[TC],0x3fe0000000000000	/* 0.5 */
+	.quad	0x3fe0000000000000	/* 0.5 */
 
-#define LDCONST(fr, name)	\
-	lfd	fr,name@toc(r2)
+#define LDCONST(fr, name)		\
+	addis	r11,r2,name@toc@ha;	\
+	lfd	fr,name@toc@l(r11)
 #endif
-
 	.text
 /*
  * Internal routine to enable floating point and set FPSCR to 0.
diff --git a/arch/powerpc/lib/copypage_64.S b/arch/powerpc/lib/copypage_64.S
index d1091b5ee5da..6812cb19d04a 100644
--- a/arch/powerpc/lib/copypage_64.S
+++ b/arch/powerpc/lib/copypage_64.S
@@ -9,11 +9,6 @@
 #include <asm/export.h>
 #include <asm/feature-fixups.h>
 
-        .section        ".toc","aw"
-PPC64_CACHES:
-        .tc             ppc64_caches[TC],ppc64_caches
-        .section        ".text"
-
 _GLOBAL_TOC(copy_page)
 BEGIN_FTR_SECTION
 	lis	r5,PAGE_SIZE@h
@@ -24,7 +19,7 @@ FTR_SECTION_ELSE
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
 	ori	r5,r5,PAGE_SIZE@l
 BEGIN_FTR_SECTION
-	ld      r10,PPC64_CACHES@toc(r2)
+	LOAD_REG_ADDR(r10, ppc64_caches)
 	lwz	r11,DCACHEL1LOGBLOCKSIZE(r10)	/* log2 of cache block size */
 	lwz     r12,DCACHEL1BLOCKSIZE(r10)	/* get cache block size */
 	li	r9,0
diff --git a/arch/powerpc/lib/string_64.S b/arch/powerpc/lib/string_64.S
index 169872bc0892..df41ce06f86b 100644
--- a/arch/powerpc/lib/string_64.S
+++ b/arch/powerpc/lib/string_64.S
@@ -11,11 +11,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/export.h>
 
-	.section	".toc","aw"
-PPC64_CACHES:
-	.tc		ppc64_caches[TC],ppc64_caches
-	.section	".text"
-
 /**
  * __arch_clear_user: - Zero a block of memory in user space, with less checking.
  * @to:   Destination address, in user space.
@@ -133,7 +128,7 @@ err1;	stb	r0,0(r3)
 	blr
 
 .Llong_clear:
-	ld	r5,PPC64_CACHES@toc(r2)
+	LOAD_REG_ADDR(r5, ppc64_caches)
 
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
index ab9fc6506861..762eb15d3bd4 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -16,7 +16,7 @@
 #ifdef CONFIG_TRACEPOINTS
 
 #ifndef CONFIG_JUMP_LABEL
-	.section	".toc","aw"
+	.data
 
 	.globl hcall_tracepoint_refcount
 hcall_tracepoint_refcount:
@@ -88,7 +88,7 @@ hcall_tracepoint_refcount:
 BEGIN_FTR_SECTION;						\
 	b	1f;						\
 END_FTR_SECTION(0, 1);						\
-	ld	r12,hcall_tracepoint_refcount@toc(r2);		\
+	LOAD_REG_ADDR(r12, hcall_tracepoint_refcount) ;		\
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

