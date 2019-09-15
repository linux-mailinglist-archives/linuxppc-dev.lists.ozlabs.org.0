Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D1AB2DD2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 04:21:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WCmD3vZ8zF5Kh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 12:21:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uz56D5lv"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBcf4bNszF1JL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:38 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y72so20244462pfb.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BCBphJn/VmhD6unAclmx7czyRGbhgave5LeVBi1iHHM=;
 b=Uz56D5lvG+f3f44zPwtWSd5zqpIz77VMdKxBzCisYpKBa791hN11ZpHIxaHj5WXBtd
 rRdaHJPhCDTLJ5K0sZ4Jp7hwJG9pQ4UYPVNqSlhU2oESc8ybnNltzZ7DzmaEc10O6lRO
 RHu8bNhBU12XKwR6Yn6A95n0P9SwMzhkSY6kxctRBP6nzQNEr/0Rztzz1Cnkz6ISmcF5
 gDj2nYTFuRlyBY9vlql3KZ8FA1GqqI7V37emSzZdHBkz4FDFHj3LWWwgD7Vn7hWWhPkM
 xr6h3x3zHuRlMn4yeO45K9CtzifMIgwF8iMP639As7gY3jOG2GxUgfG5C9pWoVp82Z+R
 tAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BCBphJn/VmhD6unAclmx7czyRGbhgave5LeVBi1iHHM=;
 b=Z9Lhrz01bL724EjHM701AV8eo7svI9YoLuWo6/H4yZr+PIDn49S30TOXoQVUm9CyU+
 f1U0l7I+eDkQKb183/EXFpGwhQHSmXNEIiWfDS6d4EOvfWTYWQAa8J6d75lPG94FNv4u
 IyybJW+US4SljOlDVvUOAjnSJYl+zAencgiwOcnVjyIYuLKH2FNL759DDDxvoVZ+xXUw
 FR9rrQxj3/NJzUltxBL38WVNY73JYz1hu+OvjejdQQjrRhaQ+4t9drdpZDaGL+huJCox
 +nbvIgtrhnb0uBSyjq9o57klxy6Zjr8zjkaYY7Wt8xuEnpzawKflUrc5gKRYMUY8Etae
 Db9g==
X-Gm-Message-State: APjAAAWcRIwR+bkoG5PVa7p60Nh9bihw4X4W6wCu/JX4QXLbYdqtUFD0
 n8KLUHznvA/IM55HgD1pQ2GIwB04
X-Google-Smtp-Source: APXvYqy67FHQ162+LSE75MEHFcUM/jdWiEpKHN8Rx2Go3f3mVgIiJI8iySbPG+LVnxuT7TWGZaYp8Q==
X-Received: by 2002:a62:5302:: with SMTP id h2mr4644922pfb.237.1568510976519; 
 Sat, 14 Sep 2019 18:29:36 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 25/27] powerpc/64s/exception: remove lite interrupt return
Date: Sun, 15 Sep 2019 11:28:11 +1000
Message-Id: <20190915012813.29317-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The difference between lite and regular returns is that the lite case
restores all NVGPRs, whereas lite skips that. This is quite clumsy
though, most interrupts want the NVGPRs saved for debugging, not to
modify in the caller, so the NVGPRs restore is not necessary most of
the time. Restore NVGPRs explicitly for one case that requires it,
and move everything else over to avoiding the restore unless the
interrupt return demands it (e.g., handling a signal).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S       |  4 ----
 arch/powerpc/kernel/exceptions-64s.S | 21 +++++++++++----------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index b2e68f5ca8f7..00173cc904ef 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -452,10 +452,6 @@ _GLOBAL(fast_interrupt_return)
 
 	.balign IFETCH_ALIGN_BYTES
 _GLOBAL(interrupt_return)
-	REST_NVGPRS(r1)
-
-	.balign IFETCH_ALIGN_BYTES
-_GLOBAL(interrupt_return_lite)
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
 	beq	kernel_interrupt_return
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 269edd1460be..1bccc869ebd3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1507,7 +1507,7 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM hardware_interrupt
 
@@ -1694,7 +1694,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM decrementer
 
@@ -1785,7 +1785,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM doorbell_super
 
@@ -2183,7 +2183,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM h_doorbell
 
@@ -2213,7 +2213,7 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM h_virt_irq
 
@@ -2260,7 +2260,7 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM performance_monitor
 
@@ -3013,7 +3013,7 @@ do_hash_page:
         cmpdi	r3,0			/* see if __hash_page succeeded */
 
 	/* Success */
-	beq	interrupt_return_lite	/* Return from exception on success */
+	beq	interrupt_return	/* Return from exception on success */
 
 	/* Error */
 	blt-	13f
@@ -3027,10 +3027,11 @@ do_hash_page:
 handle_page_fault:
 11:	andis.  r0,r5,DSISR_DABRMATCH@h
 	bne-    handle_dabr_fault
+	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpdi	r3,0
-	beq+	interrupt_return_lite
+	beq+	interrupt_return
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
@@ -3045,9 +3046,9 @@ handle_dabr_fault:
 	bl      do_break
 	/*
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
-	 * If so, we need to restore them with their updated values. Don't use
-	 * interrupt_return_lite here.
+	 * If so, we need to restore them with their updated values.
 	 */
+	REST_NVGPRS(r1)
 	b       interrupt_return
 
 
-- 
2.23.0

