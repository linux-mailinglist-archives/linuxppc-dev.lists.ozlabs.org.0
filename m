Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DB164A27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:54:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kNzY4HGnzDqPB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:54:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JJQgfxev"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNHM4vS2zDqkX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:23:11 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id w10so1421122pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i6zXHqdz8hmEZ9yIOE9VYTMPvF4UPstKWHj2r1mxwjI=;
 b=JJQgfxevlDOTApxoNnPOGg/Z8XKr11LRi4OaJhbveAfzu0eQxRC4r+Du4b8nB79A7N
 7YBScbysnfhEDA1ARaTLTsElBSrgQuqcj2bSBMYwpMHjU1LnqgYwY+QMuCyru4dHQTFM
 z9zpRIS6MQivKBd6itLjO7+Rdhy3Z42Cj4Mxj0nPd7PwOL9p7xYFxY0rXoBJryeizbKh
 b9gmklA7inOI25EdHSQXBz2TPm8WL1E2kZrYAoeicJhQlJt7jqds32ne3iEzosJmQegK
 hliXqf7iginrBxqjnYNlfJfzoG2KNp60RB8/S91VHOyQ/TttCeNMAT98Sf2FNsHfvk24
 k68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i6zXHqdz8hmEZ9yIOE9VYTMPvF4UPstKWHj2r1mxwjI=;
 b=psvDFtmgpDyXYvs/UYlblAyPhcQEE9jsUkvpfB2packeqbirBojmDdtqa6UfR0qNlW
 lJI1UgsEUVAW7ajYxFips1z90R5M7zt7azlyaO4k5qe5dkdSuUjEDm+h3bVSaj06AF9M
 h2e2MtIxhoNN4+3xzNU8JgKUdfg5Hncgt1qsiaNFz89V/CO9eISahjnHJCxNYXgdOSNG
 /q3uN85oQmXSinfi3iNXe1qcBFUEPPZ2GIhY3cbN/FdrFoeDODJVCeDMeBQo51JvD4yN
 YTc53fExggJewHFdIzNhf2A8a+7TFwkDd9hsmc6Vso8vKwyDgTBwMfOq3XnvTa286JNc
 u5yA==
X-Gm-Message-State: APjAAAX+xra5vJ7fA6tgQpMSYAYOnLw2U5/PI4fuuwAf0upr2rF77/Qa
 FG8QgkKZZz94wC0JYfk/+tRPhvbu3LI=
X-Google-Smtp-Source: APXvYqzztKCQFNQlcSDaZpNS7EO5mRU4yPrgjsrlCFP4G2M2gX81gWEdMIF10SERMAeCXXiKW1n95w==
X-Received: by 2002:a17:90a:2648:: with SMTP id
 l66mr7468200pje.65.1562772189227; 
 Wed, 10 Jul 2019 08:23:09 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.23.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:23:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/16] powerpc/64s/exception: machine check pseries should
 skip the late handler for host kernel MCEs
Date: Thu, 11 Jul 2019 01:19:44 +1000
Message-Id: <20190710151950.31906-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powernv machine check handler copes with taking a MCE from one of
three contexts, guest, host kernel, and host user. In each case the
early handler runs first on a special stack. Then:

- The guest case branches to the KVM interrupt handler (via standard
  interrupt macros).
- The host user case will run the "late" handler which is like a
  normal interrupt that runs in virtual mode and uses the regular
  kernel stack.
- The host kernel case queues the event and schedules it for
  processing with irq work.

The last case is important, it must not enable virtual memory because
the MMU state may not be set up to deal with that (e.g., SLB might be
clear), it must not use the regular kernel stack for similar reasons
(e.g., might be in OPAL with OPAL stack in r1), and the kernel does
not expect anything to touch its stack if interrupts are disabled.

The pseries handler does not do this queueing, but instead it always
runs the late handler for host MCEs, which has some of the same
problems.

Now that pseries is using machine_check_events, it can just do the
same as powernv and queue up kernel-mode MCE events.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f2c24a4ae723..ac7b5bb614d9 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1163,7 +1163,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	cmpdi	r3,0		/* see if we handled MCE successfully */
 
 	beq	1b		/* if !handled then panic */
-BEGIN_FTR_SECTION
+
 	/*
 	 * Return from MC interrupt.
 	 * Queue up the MCE event so that we can log it later, while
@@ -1172,18 +1172,7 @@ BEGIN_FTR_SECTION
 	bl	machine_check_queue_event
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_KERNEL
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
 BEGIN_FTR_SECTION
@@ -1212,13 +1201,6 @@ EXC_COMMON_BEGIN(unrecover_mce)
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

