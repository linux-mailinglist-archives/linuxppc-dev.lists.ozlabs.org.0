Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A92593D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:54:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZmDx4wT3zDr6c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VU9lJQru"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmv6MrPzDqnc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:51 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id e5so2561548pls.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qi+gU4bdS1324GMD/HpQ+oVtyQ4HGJmZVo7c1VMCmPY=;
 b=VU9lJQru3aElWliW3XsuI76o4ZGv1ee0C0p7sWW5+9BpoqKRVB0JUrMc7aAhzSaQkY
 VLozNsgb2Bi/wnJSKcH4EB7Njqq0chgWjYdh0M18Ptjk1FFBwEaakWUOdoTBM+cec4X7
 +BU+rkVcOhgEOLXYLBCbhQkQvz614mHf9BrnwJ2kELjk2uiTJVmMW0KF8jooDA6qVNDU
 Mvi6PnlVbHIfDtR6WvISI97wfrnBWtOOCHMZRvFZFss+P98a+a+msF0p+KS+o29j1Qpd
 ni7e9R+++AJN37gOaSsOAFw1IvkOVb1BVpiZYQ/st7bL86HKiBdcTt6O7z6c7y77R0aM
 HRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qi+gU4bdS1324GMD/HpQ+oVtyQ4HGJmZVo7c1VMCmPY=;
 b=FvvF3xJFi6uDUek5vdqEdu17t4gpvrl75OqmGmFE6Y72z0ab8txNPlIllRIB+a2JAi
 DH0cW5BJdNlEu1Ob0PBeLW3F9DOkYvo4VC1tB0KAaa78b2tNWkB72aCu9+ch346ycfij
 znMgN7CTPQUFC4f3ycaGvuQB+6O9mJ8U2TXHaq+EieYKnzA0bwOglPVkQSYy4ZruDMf9
 L1ZQOxVfnZdkKRaj+L1VxWe3s8v4RkfJMOOQ7bBJPAyuGL/ljHOpCrCuQBPDzQ4wIDvK
 +OdaJdJR+QJZbcKjJaNJpOn0qMJbnON6hrJ3XzrIIJXPoaI0sl6PjEkL8KjF9XYH6uC7
 N4Ng==
X-Gm-Message-State: APjAAAXVS9XxckNkcNjcM6KhlZY0iBiojehrNZtVQhp2oQ4x95djn2Rs
 kVcyC7kCvbO/ubw1Gt4XwjPzMAYR
X-Google-Smtp-Source: APXvYqwuxrjVbk+uzzWW7OHVmsIFdLbT8YM9ORrDjHL9ksIjghtk/oIiEWKJzb91K2OMBlqhyGd9hA==
X-Received: by 2002:a17:902:8a8a:: with SMTP id
 p10mr9496148plo.88.1561700030100; 
 Thu, 27 Jun 2019 22:33:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/13] powerpc/tm: update comment about interrupt
 re-entrancy
Date: Fri, 28 Jun 2019 15:33:32 +1000
Message-Id: <20190628053332.22366-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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

Since the system reset interrupt began to use its own stack, and
machine check interrupts have done so for some time, r1 can be
changed without clearing MSR[RI], provided no other interrupts
(including SLB misses) are taken.

MSR[RI] does have to be cleared when using SCRATCH0, however.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/tm.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/tm.S b/arch/powerpc/kernel/tm.S
index 9fabdce255cd..6ba0fdd1e7f8 100644
--- a/arch/powerpc/kernel/tm.S
+++ b/arch/powerpc/kernel/tm.S
@@ -148,7 +148,7 @@ _GLOBAL(tm_reclaim)
 	/* Stash the stack pointer away for use after reclaim */
 	std	r1, PACAR1(r13)
 
-	/* Clear MSR RI since we are about to change r1, EE is already off. */
+	/* Clear MSR RI since we are about to use SCRATCH0, EE is already off */
 	li	r5, 0
 	mtmsrd	r5, 1
 
@@ -474,7 +474,7 @@ restore_gprs:
 
 	REST_GPR(7, r7)
 
-	/* Clear MSR RI since we are about to change r1. EE is already off */
+	/* Clear MSR RI since we are about to use SCRATCH0. EE is already off */
 	li	r5, 0
 	mtmsrd	r5, 1
 
-- 
2.20.1

