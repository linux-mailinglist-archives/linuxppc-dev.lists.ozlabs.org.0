Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 203174C79B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:46:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tsmf4dxvzDqy6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:46:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VtkyAquY"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqmg2mFqzDqwH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:35 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d126so979709pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/W8K+qohxkx+D3swqbTjCFwxXyzIJZDWgEvfqOcj5M=;
 b=VtkyAquYv6YNWPKImaiNiOG1kpYluuqu+qvhxLuzrNJ6YjoM8/faKg1eCDNE3idYRa
 0x3pTBNU5hOnBJfZXwSLi/yWIaFT1LdRZlqfB5vlm6Ew6ffkQAhVFH09MdD/zZDCXfUC
 6FgsHjxwJfhYTG/deoQhQONlfZg0YQNOcUrY8q1eszOWrn684I3BGdxsSHm2Qst8WqJ9
 xgbF2SOZdwZzrsV6arZbB5X4QpjqbBK/Obq+ZJFx4reMG4T/bXDFAjD1QL9JaZZ+OF1a
 GxuN66rf4QyKSRO789SVKAPiByu89cnFlEjK0jqjIoHoZLT9phGVvIZRX9+mJTyI9dL6
 WJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/W8K+qohxkx+D3swqbTjCFwxXyzIJZDWgEvfqOcj5M=;
 b=TnBRKKvFHe+ztdd0iXQwLjYPOhAMb2+hYLE8aXe021Vp8zMZDwMzD2/L6WfXrDs78W
 vfH2NojJq9wvWD0DJ9r/2o7TNS717HmFFlnsk1Rri00tST6pa6TbCGHn0NcwuO2ov+ki
 6r5EiIOgDHrKgeGnMfO9/pcdCyowXWnkcZYGKMO3gllAGzRQRvyVEiPbZfsEH6gaN9J3
 vDWzbknfYCbLqnk2gQDzRW1CNFp49tkUkDclYcG581DGZ8Ps+cwE2xXvPg3jLl/6awrs
 97K5scD23zV0hPWkKnjd2A0SsyycN7N2cvrv9hzHzBeTB5Zcwk+5HCtUGfuV5KAIiwYj
 lV9Q==
X-Gm-Message-State: APjAAAU+yAv8nm+NJgY7wMIwp0s+DscL8SQyhvIht20/E8UBExLH5k6j
 o1Sp7Z043wrAP8ByFbJdXGOt+viD
X-Google-Smtp-Source: APXvYqwrkU8RekM2WdZztTJu83DLcv7vrX/a57yzS2ipnkcz9QCIIcx80QnfpRlNkE4Yv2GQeMctmQ==
X-Received: by 2002:a65:5006:: with SMTP id f6mr6311247pgo.402.1561007793205; 
 Wed, 19 Jun 2019 22:16:33 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 43/52] powerpc/64s/exception: machine check early only runs
 in HV mode
Date: Thu, 20 Jun 2019 15:14:50 +1000
Message-Id: <20190620051459.29573-44-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

machine_check_common_early and machine_check_handle_early only run in
HVMODE. Remove dead code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 38 +++++-----------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b12755a4f884..f3362adc99e6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1014,10 +1014,7 @@ TRAMP_REAL_BEGIN(machine_check_common_early)
 	/* Save r9 through r13 from EXMC save area to stack frame. */
 	EXCEPTION_PROLOG_COMMON_2(PACA_EXMC)
 	mfmsr	r11			/* get MSR value */
-BEGIN_FTR_SECTION
-	ori	r11,r11,MSR_ME		/* turn on ME bit */
-END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-	ori	r11,r11,MSR_RI		/* turn on RI bit */
+	ori	r11,r11,MSR_ME|MSR_RI	/* turn on ME, RI */
 	LOAD_HANDLER(r12, machine_check_handle_early)
 1:	mtspr	SPRN_SRR0,r12
 	mtspr	SPRN_SRR1,r11
@@ -1124,11 +1121,8 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
-BEGIN_FTR_SECTION
-	b	4f
-END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 
-#ifdef	CONFIG_PPC_P7_NAP
+#ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * Check if thread was in power saving mode. We come here when any
 	 * of the following is true:
@@ -1141,7 +1135,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 BEGIN_FTR_SECTION
 	rlwinm.	r11,r12,47-31,30,31
 	bne	machine_check_idle_common
-END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
 #endif
 
 	/*
@@ -1150,12 +1144,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 */
 	rldicl.	r11,r12,4,63		/* See if MC hit while in HV mode. */
 	beq	5f
-4:	andi.	r11,r12,MSR_PR		/* See if coming from user. */
+	andi.	r11,r12,MSR_PR		/* See if coming from user. */
 	bne	9f			/* continue in V mode if we are. */
 
 5:
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-BEGIN_FTR_SECTION
 	/*
 	 * We are coming from kernel context. Check if we are coming from
 	 * guest. if yes, then we can continue. We will fall through
@@ -1164,7 +1157,6 @@ BEGIN_FTR_SECTION
 	lbz	r11,HSTATE_IN_GUEST(r13)
 	cmpwi	r11,0			/* Check if coming from guest */
 	bne	9f			/* continue if we are. */
-END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 #endif
 	/*
 	 * At this point we are not sure about what context we come from.
@@ -1199,7 +1191,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	cmpdi	r3,0		/* see if we handled MCE successfully */
 
 	beq	1b		/* if !handled then panic */
-BEGIN_FTR_SECTION
+
 	/*
 	 * Return from MC interrupt.
 	 * Queue up the MCE event so that we can log it later, while
@@ -1208,18 +1200,7 @@ BEGIN_FTR_SECTION
 	bl	machine_check_queue_event
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_USER_OR_KERNEL
-FTR_SECTION_ELSE
-	/*
-	 * pSeries: Return from MC interrupt. Before that stay on emergency
-	 * stack and call machine_check_exception to log the MCE event.
-	 */
-	LOAD_HANDLER(r10,mce_return)
-	mtspr	SPRN_SRR0,r10
-	ld	r10,PACAKMSR(r13)
-	mtspr	SPRN_SRR1,r10
-	RFI_TO_KERNEL
-	b	.
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
+
 9:
 	/* Deliver the machine check to host kernel in V mode. */
 	MACHINE_CHECK_HANDLER_WINDUP
@@ -1238,13 +1219,6 @@ EXC_COMMON_BEGIN(unrecover_mce)
 	bl	unrecoverable_exception
 	b	1b
 
-EXC_COMMON_BEGIN(mce_return)
-	/* Invoke machine_check_exception to print MCE event and return. */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	machine_check_exception
-	MACHINE_CHECK_HANDLER_WINDUP
-	RFI_TO_KERNEL
-	b	.
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-- 
2.20.1

