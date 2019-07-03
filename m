Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C985DF55
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:12:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dv3T71f7zDqHl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:12:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AuQAhq9y"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthh2sT3zDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:56:04 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 81so811253pfy.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QAqLvOiIWa2iF2XzugUdl7vcFvizV1HF8RoF45ufhkQ=;
 b=AuQAhq9yoaJY1iCG+ToFqmZ6KNIckjajtB26sN6wz6RzfLh/nnXjZ8HXBdmLNfxrLN
 eENcMy1XowWc/y0JhjloxTHm+m2jnyzPVRJlu3InfP6VkdxLxY+5J70AR8mmhbem0GL1
 PfedACtzcGmDq01yQGiLrdk+comaaHLnSR384Q5tHinKOapI4vXbvVO5ujetrq3/Jxsj
 4DJ/HqTONxzMGI9kMBDd0staG15joF3BF5Cty8ZEJFGVSP+gRiXX3TJC1qJ3We0jN+ks
 PNQjEhBaX/Ogj0PLOuGHYhqWLFS+beZ/1HgwcPVaK9TD1Oq+Rl8Re7s/duduM1+xVdv8
 2kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QAqLvOiIWa2iF2XzugUdl7vcFvizV1HF8RoF45ufhkQ=;
 b=dufTqLxtMj54NCz06ra5Qz4JOSyq0qTQqO7F79ZtnzRrHdIbW6AgyaYYHrPZF/80S9
 cvfuYN6uFq0AG5Utr7P504ZEuLq3mrlSmtUk7VK2FbiN1TmR8Urm7LPHkHHzg+krcVQX
 gGUrwc4ow4DtxpH63+u1FOmv552hwbjSbuMlOyEDwFe7dJIL7CZd5DF0oqY29PBwVSq7
 2MQCpVA5E/szqi3nNfKI/P1iOt7g0PawmD+ptTGNAzCIaKCv0vNjz/nXBwbN1eQqppHQ
 sUqjEoHWdX5eKsnt7pwsUQcKKgSTH7b/FGNyewFn3shmUjP34TB7tKR/BcfLVU0Z5s4M
 gaFw==
X-Gm-Message-State: APjAAAXf8G6qtUu9L5bWoMf84H2VEBAt29l4ORw+Zaq4L8LF0QYVw4jF
 5ve8ch7nqQEySq/S7yhcAAB082iY
X-Google-Smtp-Source: APXvYqykfTX8TEhvpmIx1sBbyH13sogAga6GJNJaeINYLKjgtGYJt1N0W+d+dnmgTUe3QQJ1XYcjdQ==
X-Received: by 2002:a17:90a:3590:: with SMTP id
 r16mr11195517pjb.44.1562140561749; 
 Wed, 03 Jul 2019 00:56:01 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.55.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:56:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/14] powerpc/64s/exception: machine check pseries should
 skip the late handler for host kernel MCEs
Date: Wed,  3 Jul 2019 17:54:38 +1000
Message-Id: <20190703075444.19005-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
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

Rather than special casing pseries, just have it follow what powernv
is doing and queue up these events.

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

