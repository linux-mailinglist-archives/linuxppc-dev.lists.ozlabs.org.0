Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 248CD7F614
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:37:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QB66LX2zDqvp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:37:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t4nmS25d"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMR71NPzDqs6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:19 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id az7so33486679plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvUFYZrtb6NsunN7WBmEXQgIvw4pIIPmtchtnwPwSIk=;
 b=t4nmS25dzCwN1NZ8Ud2bihWMi0iv8pIwZHLMXCfdya9g7ds7EjZ5PL+cAwxeEBXIVj
 FEt3jZbFuQCc+lWopgY6YSsU3LbAdor2a1ml9EkWHVceESpVhDTWs/9UBiZMqZq+JM/D
 SwcHDY9BiBNN5LnoblvGyNmRtH/7wHmoRKoqJzVizpWOtbgAVQHcqiG88mqjPsV04jra
 sYiUipBBfnqKLoVs2qlNb5ubbAbj8aa+Z5gO2sGiCi3ig7lQ5QJn47bk0SEf+A2LXypu
 9nskBpFCDTPlR6XSoAnbJJC27Xh7EUbkihrrze6AAMufJDvJ/E8dKNWIDviSZg8wQuMe
 kBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvUFYZrtb6NsunN7WBmEXQgIvw4pIIPmtchtnwPwSIk=;
 b=KCbNbbXd9nGg7Ww3asmRKURla/JnA/0F+3Kr+mb4UfbJXauPldrxn+0dU+o8jIv76R
 bMFd98atZliM2iQdRO5gAQ4uCfgm1C9wnEdr939dEc72LEkBm6ndWzW8HiXpGegGKNPc
 xfr6Ek/pNNQnNYxk6jKaFMcEzj1wz7fMQ92DPscvztdw8zvP50JJF2a5PpvgkL6dXFgL
 ohdxd8MBOPZs91tEfbwZ0wxUrFzaDtrxCPKREIHklTJKLTTM7j43+yrgig8eDPiKH54a
 ap2CfF8CgUNmQ9zTpPl1q0mqSxrtjtJehBBxLH5or/8kfhDtsLXRSOWSyJP+NejXqLyd
 8W8g==
X-Gm-Message-State: APjAAAVmdqOyIaZ98yXfO/yj6OWrOYJRzycBBI5ZQKqDn5F8r/VNykv2
 Eg+IafItbC5Xs+NaB6QwnbVeJbqvuzw=
X-Google-Smtp-Source: APXvYqxoaaXE9kjLW4Fr7pC4TQuW6gviAnvVctCc6IGAjDNgiBP73OCxPbzpMRqAzp419/k5kXnwUw==
X-Received: by 2002:a17:902:d917:: with SMTP id
 c23mr130785295plz.248.1564743618150; 
 Fri, 02 Aug 2019 04:00:18 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/44] powerpc/64s/exception: machine check improve labels
 and comments
Date: Fri,  2 Aug 2019 20:56:41 +1000
Message-Id: <20190802105709.27696-17-npiggin@gmail.com>
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

Short forward and backward branches can be given number labels,
but larger significant divergences in code path a more readable
if they're given descriptive names.

Also adjusts a comment to account for guest delivery.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 706c522e1d1b..6b409d62d36c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1052,7 +1052,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 */
 	lbz	r11,HSTATE_IN_GUEST(r13)
 	cmpwi	r11,0			/* Check if coming from guest */
-	bne	9f			/* continue if we are. */
+	bne	mce_deliver		/* continue if we are. */
 #endif
 
 	/*
@@ -1060,7 +1060,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 * exception handler which will deliver the MC event to this kernel.
 	 */
 	andi.	r11,r12,MSR_PR		/* See if coming from user. */
-	bne	9f			/* continue in V mode if we are. */
+	bne	mce_deliver		/* continue in V mode if we are. */
 
 	/*
 	 * At this point we are coming from kernel context.
@@ -1088,8 +1088,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_KERNEL
 
-9:
-	/* Deliver the machine check to host kernel in V mode. */
+mce_deliver:
+	/*
+	 * This is a host user or guest MCE. Restore all registers, then
+	 * run the "late" handler. For host user, this will run the
+	 * machine_check_exception handler in virtual mode like a normal
+	 * interrupt handler. For guest, this will trigger the KVM test
+	 * and branch to the KVM interrupt similarly to other interrupts.
+	 */
 BEGIN_FTR_SECTION
 	ld	r10,ORIG_GPR3(r1)
 	mtspr	SPRN_CFAR,r10
-- 
2.22.0

