Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7D2309555
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:26:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSZk86lwQzDrCF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:26:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r6+aIhlf; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZKw47sQzDrRn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:24 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id q2so7098073plk.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=urwJAA8tSck3fcCwGbZlLSb/aJxTZkh9sbovhbvuZ38=;
 b=r6+aIhlfYeMqHcz0jVxgj7oVHpm6AQorJRW6VNtQAY5cEfmyo14d6mtMGQrutSEppg
 Swd+DXI5LM/ABFCJvYwlgtxwmtjsIa1wzfm4kY0ARXKHG4EBAK42LdVal2UbLHYopbyu
 8tzZTzLpRCDOuStiQlKMEVZ28FWo2Vl5RKbCtvknP1d7QNc1W+IgMG6IkoF/U9g6Dpok
 V3gECunhFf8hALJXDgch0rSwHjgftT4HN8lELySY+WBMObQvs5Vo27PlAaXlTNBsQrmy
 a3VWawD3R3ziE8iyN7hMbAwgtEfBVdFlu9Z6fBBAxY0xqaAUyiU+DNMAGR4wpuh13cRE
 /+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=urwJAA8tSck3fcCwGbZlLSb/aJxTZkh9sbovhbvuZ38=;
 b=BTMHltnAdeQPw0pqlQDhlNIIiX5tXF/epOEde9fFM4wNzVhDkPXnZzDSpX8PhdEbhR
 MM5hp5KamOrfl0vuwqivh6edLjZqHThCuWv3MANvd1mH4KH/SDVVkZt3mPoBQ6yX6Nin
 tAOBaVmO90CTHXgXlUZg61yMlsRDIy68XqxIc/6+S4Hk4nrS3z3UWWvUvv8kbVGS9OXU
 XjdxhKLgNzN0JhDOq2UfwQ6sj7a98I+s1uyZOfDQ0306Ij2sUYW15uAN1TVqVsnWGwDb
 SaRoMzUlbd8AwJ8XWH/gtXKMvjBaWFoEql0LmWZ7ABrBULdpBm6yJ8OiAfjPRpSvks91
 wLlg==
X-Gm-Message-State: AOAM531W/C3H0yvZZ+RqlCQMEZUTDbi6XPcmx85yA3UvpCV7oTfZ57iw
 jSKFVl2xEmWHniX2qEh5ArdAjWRonhQ=
X-Google-Smtp-Source: ABdhPJxZYz0fmsIjDL9P8j/8Qf6UIR8Ajh5Yo5huoSHGLIftayTYyPUGJSBhPRIt050mqnqZ6MzaxQ==
X-Received: by 2002:a17:90a:886:: with SMTP id
 v6mr9198154pjc.143.1612012161711; 
 Sat, 30 Jan 2021 05:09:21 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 04/42] powerpc/64s: move DABR match out of handle_page_fault
Date: Sat, 30 Jan 2021 23:08:14 +1000
Message-Id: <20210130130852.2952424-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to the 32/s change, move the test and call to the do_break
handler to the DSI.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 34 +++++++++++++---------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6e53f7638737..a6333b986a57 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1439,6 +1439,8 @@ EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
+	andis.	r0,r5,DSISR_DABRMATCH@h
+	bne-	1f
 BEGIN_MMU_FTR_SECTION
 	ld	r6,_MSR(r1)
 	li	r3,0x300
@@ -1447,6 +1449,18 @@ MMU_FTR_SECTION_ELSE
 	b	handle_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
+1:	/* We have a data breakpoint exception - handle it */
+	ld      r4,_DAR(r1)
+	ld      r5,_DSISR(r1)
+	addi    r3,r1,STACK_FRAME_OVERHEAD
+	bl      do_break
+	/*
+	 * do_break() may have changed the NV GPRS while handling a breakpoint.
+	 * If so, we need to restore them with their updated values.
+	 */
+	REST_NVGPRS(r1)
+	b       interrupt_return
+
 	GEN_KVM data_access
 
 
@@ -3228,7 +3242,7 @@ disable_machine_check:
 	.balign	IFETCH_ALIGN_BYTES
 do_hash_page:
 #ifdef CONFIG_PPC_BOOK3S_64
-	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)@h
+	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_KEYFAULT)@h
 	ori	r0,r0,DSISR_BAD_FAULT_64S@l
 	and.	r0,r5,r0		/* weird error? */
 	bne-	handle_page_fault	/* if not, try to insert a HPTE */
@@ -3262,15 +3276,13 @@ do_hash_page:
 	/* Error */
 	blt-	13f
 
-	/* Reload DAR/DSISR into r4/r5 for the DABR check below */
+	/* Reload DAR/DSISR into r4/r5 for handle_page_fault */
 	ld	r4,_DAR(r1)
 	ld      r5,_DSISR(r1)
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 /* Here we have a page fault that hash_page can't handle. */
 handle_page_fault:
-11:	andis.  r0,r5,DSISR_DABRMATCH@h
-	bne-    handle_dabr_fault
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpdi	r3,0
@@ -3281,20 +3293,6 @@ handle_page_fault:
 	bl	__bad_page_fault
 	b	interrupt_return
 
-/* We have a data breakpoint exception - handle it */
-handle_dabr_fault:
-	ld      r4,_DAR(r1)
-	ld      r5,_DSISR(r1)
-	addi    r3,r1,STACK_FRAME_OVERHEAD
-	bl      do_break
-	/*
-	 * do_break() may have changed the NV GPRS while handling a breakpoint.
-	 * If so, we need to restore them with their updated values.
-	 */
-	REST_NVGPRS(r1)
-	b       interrupt_return
-
-
 #ifdef CONFIG_PPC_BOOK3S_64
 /* We have a page fault that hash_page could handle but HV refused
  * the PTE insertion
-- 
2.23.0

