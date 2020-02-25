Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1A16EE82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:59:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RpBJ5RvqzDqbl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:59:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WutpSeRp; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSW6sVjzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:41:15 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id a6so85249plm.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KU9VKTOgXYDrAa8kjzX5dVBgeXvu9j/CjilNchUpeRU=;
 b=WutpSeRpzEsYOF319e5VeHfe8TLrKrayN9O9C86V8H68rjVrrVlmeVeZp1+ugXncnr
 a1odh1/JkuJheYzrdcu2Boi2M2fLlQ+dNieaytYfxJe/L1iuQVTULyOXKXKcb24IEHDE
 TJ9+8jMjKvsfIew22kGJ/u+q4fc9lIvAoFptmpJ3DypteU3+UNuGPcTzJEkaTd7kj9Z5
 uwtfKWzH9SUf9jf465+ONQGhybFiOPbuY4z4fzdrzM0YU70BYAw1A3ThHxZNVayd0q6O
 e7ykzEzCpp+a1m6vGzYUMBrIARBZDw01WQEYgao0pzQh3raW8Q0cjpuQuLZ6WA1rq7GU
 i5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KU9VKTOgXYDrAa8kjzX5dVBgeXvu9j/CjilNchUpeRU=;
 b=XXPE4YK2yLaEACCztBJghQDt1CLwT5gAyLMfKvTujZXA8Sv67fDPoML77QYGP6NBr5
 juFMj2+wyFyoxBy5HQ84W/HxCbyjZs79DfX8A/8wpfIGl1Paa74AdbVOR3pekansIGXF
 00aHKSQPqgoQMPtuVvNR3mc7rCDuHTooUURTx0sT2QqA41UdOgYLl7hDRJ4K40YyrpJm
 DTD6A7RmykyZCWYgIEAjhJ3ln1w/Dn4DlnNUSjaNxiBf60OtnHm8IEhvbkY0guYjdKYk
 v+KGCFmROfZiYllw2juFfjuT5Whi+lrwdDZydmycYknSH93O3DLirtEVAmtNqqO40s+R
 XEdQ==
X-Gm-Message-State: APjAAAWi0GEt92IPU9JCVRZ9UTc0TtGdqzphFguJJ11DduuUZm7oHMEk
 vqDAbsvKXhaIzkMPEptRdERIGxHT
X-Google-Smtp-Source: APXvYqwhqCj66AVJIHfZXy+DIXZ6dYFSd+EfcReHQBRK0LD/ufEMB4LXShe9eLQczJwI/vg/o1XCIA==
X-Received: by 2002:a17:90a:b386:: with SMTP id
 e6mr106812pjr.106.1582652472937; 
 Tue, 25 Feb 2020 09:41:12 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:41:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 31/32] powerpc/64s/exception: treat NIA below
 __end_interrupts as soft-masked
Date: Wed, 26 Feb 2020 03:35:40 +1000
Message-Id: <20200225173541.1549955-32-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The scv instruction causes an interrupt which can enter the kernel with
MSR[EE]=1, thus allowing interrupts to hit at any time. These must not
be taken as normal interrupts, because they come from MSR[PR]=0 context,
and yet the kernel stack is not yet set up and r13 is not set to the
PACA).

Treat this as a soft-masked interrupt regardless of the soft masked
state. This does not affect behaviour yet, because currently all
interrupts are taken with MSR[EE]=0.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b53e452cbca0..7a6be3f32973 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -494,8 +494,24 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 
 .macro __GEN_COMMON_BODY name
 	.if IMASK
+		.if ! ISTACK
+		.error "No support for masked interrupt to use custom stack"
+		.endif
+
+		/* If coming from user, skip soft-mask tests. */
+		andi.	r10,r12,MSR_PR
+		bne	2f
+
+		/* Kernel code running below __end_interrupts is implicitly
+		 * soft-masked */
+		LOAD_HANDLER(r10, __end_interrupts)
+		cmpd	r11,r10
+		li	r10,IMASK
+		blt-	1f
+
+		/* Test the soft mask state against our interrupt's bit */
 		lbz	r10,PACAIRQSOFTMASK(r13)
-		andi.	r10,r10,IMASK
+1:		andi.	r10,r10,IMASK
 		/* Associate vector numbers with bits in paca->irq_happened */
 		.if IVEC == 0x500 || IVEC == 0xea0
 		li	r10,PACA_IRQ_EE
@@ -526,7 +542,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 
 	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
-	mr	r10,r1			/* Save r1			*/
+2:	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
 	beq-	100f
 	ld	r1,PACAKSAVE(r13)	/* kernel stack to use		*/
@@ -2791,7 +2807,8 @@ masked_interrupt:
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
 	ld	r12,PACA_EXGEN+EX_R12(r13)
-	/* returns to kernel where r13 must be set up, so don't restore it */
+	ld	r13,PACA_EXGEN+EX_R13(r13)
+	/* May return to masked low address where r13 is not set up */
 	.if \hsrr
 	HRFI_TO_KERNEL
 	.else
@@ -2950,6 +2967,10 @@ EXC_COMMON_BEGIN(ppc64_runlatch_on_trampoline)
 
 USE_FIXED_SECTION(virt_trampolines)
 	/*
+	 * All code below __end_interrupts is treated as soft-masked. If
+	 * any code runs here with MSR[EE]=1, it must then cope with pending
+	 * soft interrupt being raised (i.e., by ensuring it is replayed).
+	 *
 	 * The __end_interrupts marker must be past the out-of-line (OOL)
 	 * handlers, so that they are copied to real address 0x100 when running
 	 * a relocatable kernel. This ensures they can be reached from the short
-- 
2.23.0

