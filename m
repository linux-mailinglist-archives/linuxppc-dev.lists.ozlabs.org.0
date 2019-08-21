Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578B97641
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 11:32:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D2WP0LQ2zDqY0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 19:32:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="xFl6DLld"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D2T51PxGzDr4F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 19:30:31 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id gn20so1039764plb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CeJB/+AXb52jCYt53790aNJHgbnYq05LHOaVbCDjyhE=;
 b=xFl6DLldw42DpUl0ohBQ53k7qO9KIhTMDBQxc7vSgBVgyq6Bv7iqtm4ozwX9yfFWDO
 XtbpN0HYCPv261LXk/7wG06RmYK3hUMTkU/Vt7VZro4Sxp0ea8I4EtoL9SRHPMt/17TV
 kyYfR59dYjwnbrbrLlyGik9JmAu2xpQJFqwnaQ6comThps68GyasQGSVqAHFyDuawWAS
 J0lJlUdudPe8xhcobrarSsoE23zu1YGrFmpcIE/rAIDwlGfFesLKR2t5M8IFQawKcFPy
 fc4hizSLmYmUs8su8l+KCZRcxLpQHXqkqM7kAQBybNpJwvNEj5JcH5n3W63d0cfhQL27
 knCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CeJB/+AXb52jCYt53790aNJHgbnYq05LHOaVbCDjyhE=;
 b=AiiXjYoLQ+bm225A//KfCQ2Pbj4rRnRJiVrmREzPjM9m5U7sMSY0JDmRHS19USFq0H
 X+5NtMvjAyRMFSOP2xc6n0i+Ou7MAPCY5gwcVmmnPiOOsWDV9GRcCzc8cdqm6fpCYUdR
 p/I1VpGLTsB37vzOgUJ1Acr+CSKXEyrcWHSVviyOVo+NJMeIvChGzoj6vKmyw+1/o0mR
 mV7W/uhN8rfsbMYuP6EjlQWKhDwz9knwLYxvQugGwxBdX9vYLSl5oF3jNHcOTVeFUzDR
 7cJPCfRpw6PDHqvqj0jZsuMmm7T225ewjmzz1Kzk1B2L93eJQlE3QVRu+91Dr9o0g4fx
 kzMQ==
X-Gm-Message-State: APjAAAWwkzK83POt2KuxpRQoHrvgBhEMmMo6rmgSGatXv4xg/ho05oWd
 lCq/zdlu2UcJKSplQBaO1A4vcg==
X-Google-Smtp-Source: APXvYqyzq6XEZAK+p0QMVGVrg3ZsEUA4PAQMRPkoOSx9hqBGXAFWuHGTM1zQi+HxaAOaFSdt+GPeUA==
X-Received: by 2002:a17:902:9a8b:: with SMTP id
 w11mr1427747plp.171.1566379827587; 
 Wed, 21 Aug 2019 02:30:27 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.65])
 by smtp.gmail.com with ESMTPSA id d16sm16621140pfd.81.2019.08.21.02.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 02:30:26 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] powerpc/vdso64: inline __get_datapage()
Date: Wed, 21 Aug 2019 14:59:59 +0530
Message-Id: <20190821092959.16066-1-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
References: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__get_datapage() is only a few instructions to retrieve the
address of the page where the kernel stores data to the VDSO.

By inlining this function into its users, a bl/blr pair and
a mflr/mtlr pair is avoided, plus a few reg moves.

clock-gettime-monotonic: syscall: 514 nsec/call  396 nsec/call
clock-gettime-monotonic:    libc: 25 nsec/call   24 nsec/call
clock-gettime-monotonic:    vdso: 20 nsec/call   20 nsec/call
clock-getres-monotonic: syscall: 347 nsec/call   372 nsec/call
clock-getres-monotonic:    libc: 19 nsec/call    19 nsec/call
clock-getres-monotonic:    vdso: 10 nsec/call    10 nsec/call
clock-gettime-monotonic-coarse: syscall: 511 nsec/call   396 nsec/call
clock-gettime-monotonic-coarse:    libc: 23 nsec/call    21 nsec/call
clock-gettime-monotonic-coarse:    vdso: 15 nsec/call    13 nsec/call
clock-gettime-realtime: syscall: 526 nsec/call   405 nsec/call
clock-gettime-realtime:    libc: 24 nsec/call    23 nsec/call
clock-gettime-realtime:    vdso: 18 nsec/call    18 nsec/call
clock-getres-realtime: syscall: 342 nsec/call    372 nsec/call
clock-getres-realtime:    libc: 19 nsec/call     19 nsec/call
clock-getres-realtime:    vdso: 10 nsec/call     10 nsec/call
clock-gettime-realtime-coarse: syscall: 515 nsec/call    373 nsec/call
clock-gettime-realtime-coarse:    libc: 23 nsec/call     22 nsec/call
clock-gettime-realtime-coarse:    vdso: 14 nsec/call     13 nsec/call

Based on the patch by Christophe Leroy <christophe.leroy@c-s.fr> for vdso32.

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---

except for a couple of calls (1 or 2 nsec reduction), there are no
improvements in the call times. Or is 10 nsec the minimum granularity??

So I don't know if its even worth updating vdso64 except to keep vdso32 and
vdso64 equal.


 arch/powerpc/kernel/vdso64/cacheflush.S   | 10 ++++----
 arch/powerpc/kernel/vdso64/datapage.S     | 29 ++++-------------------
 arch/powerpc/kernel/vdso64/datapage.h     | 10 ++++++++
 arch/powerpc/kernel/vdso64/gettimeofday.S |  8 ++++---
 4 files changed, 24 insertions(+), 33 deletions(-)
 create mode 100644 arch/powerpc/kernel/vdso64/datapage.h

diff --git a/arch/powerpc/kernel/vdso64/cacheflush.S b/arch/powerpc/kernel/vdso64/cacheflush.S
index 3f92561a64c4..30e8b0d29bea 100644
--- a/arch/powerpc/kernel/vdso64/cacheflush.S
+++ b/arch/powerpc/kernel/vdso64/cacheflush.S
@@ -10,6 +10,8 @@
 #include <asm/vdso.h>
 #include <asm/asm-offsets.h>
 
+#include "datapage.h"
+
 	.text
 
 /*
@@ -24,14 +26,12 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	mr	r11,r3
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r11, r0
 	mtlr	r12
-	mr	r10,r3
 
 	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
 	addi	r5,r7,-1
-	andc	r6,r11,r5		/* round low to line bdy */
+	andc	r6,r3,r5		/* round low to line bdy */
 	subf	r8,r6,r4		/* compute length */
 	add	r8,r8,r5		/* ensure we get enough */
 	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
@@ -48,7 +48,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
 
 	lwz	r7,CFG_ICACHE_BLOCKSZ(r10)
 	addi	r5,r7,-1
-	andc	r6,r11,r5		/* round low to line bdy */
+	andc	r6,r3,r5		/* round low to line bdy */
 	subf	r8,r6,r4		/* compute length */
 	add	r8,r8,r5
 	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
diff --git a/arch/powerpc/kernel/vdso64/datapage.S b/arch/powerpc/kernel/vdso64/datapage.S
index dc84f5ae3802..8712f57c931c 100644
--- a/arch/powerpc/kernel/vdso64/datapage.S
+++ b/arch/powerpc/kernel/vdso64/datapage.S
@@ -11,34 +11,13 @@
 #include <asm/unistd.h>
 #include <asm/vdso.h>
 
+#include "datapage.h"
+
 	.text
 .global	__kernel_datapage_offset;
 __kernel_datapage_offset:
 	.long	0
 
-V_FUNCTION_BEGIN(__get_datapage)
-  .cfi_startproc
-	/* We don't want that exposed or overridable as we want other objects
-	 * to be able to bl directly to here
-	 */
-	.protected __get_datapage
-	.hidden __get_datapage
-
-	mflr	r0
-  .cfi_register lr,r0
-
-	bcl	20,31,data_page_branch
-data_page_branch:
-	mflr	r3
-	mtlr	r0
-	addi	r3, r3, __kernel_datapage_offset-data_page_branch
-	lwz	r0,0(r3)
-  .cfi_restore lr
-	add	r3,r0,r3
-	blr
-  .cfi_endproc
-V_FUNCTION_END(__get_datapage)
-
 /*
  * void *__kernel_get_syscall_map(unsigned int *syscall_count) ;
  *
@@ -53,7 +32,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
 	mflr	r12
   .cfi_register lr,r12
 	mr	r4,r3
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r3, r0
 	mtlr	r12
 	addi	r3,r3,CFG_SYSCALL_MAP64
 	cmpldi	cr0,r4,0
@@ -75,7 +54,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r3, r0
 	ld	r3,CFG_TB_TICKS_PER_SEC(r3)
 	mtlr	r12
 	crclr	cr0*4+so
diff --git a/arch/powerpc/kernel/vdso64/datapage.h b/arch/powerpc/kernel/vdso64/datapage.h
new file mode 100644
index 000000000000..f2f0da0f65f3
--- /dev/null
+++ b/arch/powerpc/kernel/vdso64/datapage.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+.macro get_datapage ptr, tmp
+	bcl	20,31,888f
+888:
+	mflr	\ptr
+	addi	\ptr, \ptr, __kernel_datapage_offset - 888b
+	lwz	\tmp, 0(\ptr)
+	add	\ptr, \tmp, \ptr
+.endm
diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
index 07bfe33fe874..7bcc879392cc 100644
--- a/arch/powerpc/kernel/vdso64/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
@@ -12,6 +12,8 @@
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
 
+#include "datapage.h"
+
 	.text
 /*
  * Exact prototype of gettimeofday
@@ -26,7 +28,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
 
 	mr	r11,r3			/* r11 holds tv */
 	mr	r10,r4			/* r10 holds tz */
-	bl	V_LOCAL_FUNC(__get_datapage)	/* get data page */
+	get_datapage	r3, r0
 	cmpldi	r11,0			/* check if tv is NULL */
 	beq	2f
 	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
@@ -71,7 +73,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	mflr	r12			/* r12 saves lr */
   .cfi_register lr,r12
 	mr	r11,r4			/* r11 saves tp */
-	bl	V_LOCAL_FUNC(__get_datapage)	/* get data page */
+	get_datapage	r3, r0		/* get data page */
 	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
 	ori	r7,r7,NSEC_PER_SEC@l
 	beq	cr5,70f
@@ -218,7 +220,7 @@ V_FUNCTION_BEGIN(__kernel_time)
   .cfi_register lr,r12
 
 	mr	r11,r3			/* r11 holds t */
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r3, r0
 
 	ld	r4,STAMP_XTIME+TSPC64_TV_SEC(r3)
 
-- 
2.21.0

