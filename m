Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A77F5F0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:24:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Pv01Kz3zDqtd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:24:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="noQRHzhB"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMD1hn9zDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:08 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id m9so33386996pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gcTPcgdyDnIxHejDnFYoRoThUyIZ0m+Vv23FWCkt6eE=;
 b=noQRHzhBgD0QtkHFZaXtxz9SAH3d+KgwZe0dYnXf9MRnpCytBcAPkNAcLVjTZ+n8wb
 qwUKSlRbn4ryDlh3UIbXvetD4oKk8F0x15lU2kYPzLBdc56ON0wZfKsvAAM8cQl92Gm2
 BGrgFDNeyLAz8XMFd325Zf344DSOHjhxPnOZc0daq5JiJxWe1kizSPKkkH6irU4Pld14
 UlFfBOYXu8jPls9EDovH7c/nDWHtI6gxssUiYrIIJ1+ifT4VPxn6+1PFbAE1+iC+WQ/F
 YaVX801Shh1O4aOnWK+ZbBn/mth4fiU3xIXO6beRY8HEouhTiKmaT8el5Bu5L101kXc7
 WYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gcTPcgdyDnIxHejDnFYoRoThUyIZ0m+Vv23FWCkt6eE=;
 b=hYMB2k9s4AAYV926ekJjex4ZhK1Myx3rBL8YHnwObCKUqE12kSU9Eob+0dOIe+q1ke
 lyVlMSszr+buGABSNB3/2ND1HXbLaTgIT14Nmcj2sjwhWu741mO8nt0pXAbVfP8i6+oO
 Enjnc/ArCarU9s79dLfHojwuUz0YgheuSm12DltkPhBbgmAbQOJFkn9ffeMrwFPoKSC1
 bNV8rHe2AtJgVxymSqL5ERHB/j4xIT8yHG9+VrqAs078OO2/5rDO7Fh+2RZGfSGfR/RX
 wu+smX0Rx0jswMCYV4ZkqgynT9ADL023LmDs0bFNDt+/DhPGH1evq/FS6+6ogji2apwq
 kzrQ==
X-Gm-Message-State: APjAAAX2KOqH6DJU4BCiu8YEIoNyURwoQFKj3dGqi5gsiLx13nsXu0D8
 IKEUqwNlHDkzGiSLzIgzQtbKbacAcEA=
X-Google-Smtp-Source: APXvYqyLdlKLrpu+PIArHrGcLxYwriPutv1wXRxxtGFUCwVNdQvRzB7y8KTg4xUtjqqjX3BPj61jIw==
X-Received: by 2002:a17:902:968c:: with SMTP id
 n12mr1108220plp.59.1564743604714; 
 Fri, 02 Aug 2019 04:00:04 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/44] powerpc/64s/exception: machine check pseries should
 skip the late handler for kernel MCEs
Date: Fri,  2 Aug 2019 20:56:35 +1000
Message-Id: <20190802105709.27696-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

The powernv machine check handler copes with taking a MCE from one of
three contexts, guest, kernel, and user. In each case the early
handler runs first on a special stack, then:

- The guest case branches to the KVM interrupt handler (via standard
  interrupt macros).
- The user case will run the "late" handler which is like a normal
  interrupt that runs in virtual mode and uses the regular kernel
  stack.
- The kernel case queues the event and schedules it for processing
  with irq work.

The last case is important, it must not enable virtual memory because
the MMU state may not be set up to deal with that (e.g., SLB might be
clear), it must not use the regular kernel stack for similar reasons
(e.g., might be in OPAL with OPAL stack in r1), and the kernel does
not expect anything to touch its stack if interrupts are disabled.

The pseries handler does not do this queueing, but instead it always
runs the late handler for host MCEs, which has some of the same
problems.

Now that pseries is using machine_check_events, change it to do the
same as powernv and queue events for kernel MCEs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 16d4881108d5..b83379cb6d23 100644
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
2.22.0

