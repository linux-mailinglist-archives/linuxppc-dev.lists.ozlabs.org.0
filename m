Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E488F1CA25B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:42:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHk31SyGzDr2c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BImScpD+; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHXy685szDqwV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:26 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 207so294562pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObCCMRtKkqm4cLMRI3tfvXaacA0omo0bqALi0UF8jqk=;
 b=BImScpD+H1EG6PItrTLC2TWKOWjX+zVVIllbuGbe3FaPlWD5D1IP/FNrZP0l+oh7Y/
 eIF81GdqhPXfZQHUkodfwwg56oX2jFDKcqRvdvPex8pHq7slogBCRydoLz/gqn3ACxXG
 6/ftGx2gtrTvvUGxK/MSFYApXYNWgDPED8J2QMFkebNrQmNKtOHbH9ekWk66WcOMENTc
 iQL58cfTY1MW3tiDhCi37D+gQJibN8XGfA7uImcldf3hi0dUpoQj+Dq74HmJz1YX8OHE
 AlzRgu6ZgzveyvSAC+j+0hnwaCsvEWlJe0GzICIEsPcnqFnebRwuYyHJKGRztJJbQgZ5
 2PSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObCCMRtKkqm4cLMRI3tfvXaacA0omo0bqALi0UF8jqk=;
 b=Zs9IFCJmBkl4dpa9MIjO7KbJQlBCqa2c0HAWa/XYZwY8uD0F5KBmMnRaQyTtHjxI6a
 ogfgaztr++cYwv08dHRPx4u+cEnqISOPjZQOUScSaaURXlSQEIZLYdzNAJi4FlZ5Guga
 Iybos4IRHG4tcpxQloyXdwN/csIz67GbZCAPeeTSFmsmZlR8Zi7P9IeAFyxCA5WSWsXQ
 YGRCu/ChXlkIwKjXELTtzMEfMHS7NQe4dldytnPvIw+WhtEZsnhm79Lw+v/iP3vmgchb
 NXPu6aK5TeJkz9Cv3yp+qUhyM8oGUyVFFGAXb4geG8t+zj6EkAEopwpdSpJbZoEb9yGN
 8/Cg==
X-Gm-Message-State: AGi0PuYSpIwRimRnUxS71tYllJW8WpPSV6sP7V7jbzffbxlDFuPTok9w
 DCDiosnYGEegXcsXrgoEOeTafkRf
X-Google-Smtp-Source: APiQypJTsIZiSu7Fv+hwsJiNH4p1CsjU9+bnc8+M2ArTT/K+ju9bfp+Pjsmz74A8XL4lV/phLzk51A==
X-Received: by 2002:a63:2b02:: with SMTP id r2mr568112pgr.346.1588912464071;
 Thu, 07 May 2020 21:34:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 03/16] powerpc/64s/exceptions: Change irq reconcile for
 NMIs from reusing _DAR to RESULT
Date: Fri,  8 May 2020 14:33:55 +1000
Message-Id: <20200508043408.886394-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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

A spare interrupt stack slot is needed to save irq state when
reconciling NMIs (sreset and decrementer soft-nmi). _DAR is used
for this, but we want to reconcile machine checks as well, which
do use _DAR. Switch to using RESULT instead, as it's used by
system calls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3322000316ab..a42b73efb1a9 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -939,13 +939,13 @@ EXC_COMMON_BEGIN(system_reset_common)
 	 * the right thing. We do not want to reconcile because that goes
 	 * through irq tracing which we don't want in NMI.
 	 *
-	 * Save PACAIRQHAPPENED to _DAR (otherwise unused), and set HARD_DIS
+	 * Save PACAIRQHAPPENED to RESULT (otherwise unused), and set HARD_DIS
 	 * as we are running with MSR[EE]=0.
 	 */
 	li	r10,IRQS_ALL_DISABLED
 	stb	r10,PACAIRQSOFTMASK(r13)
 	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,_DAR(r1)
+	std	r10,RESULT(r1)
 	ori	r10,r10,PACA_IRQ_HARD_DIS
 	stb	r10,PACAIRQHAPPENED(r13)
 
@@ -966,7 +966,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	/*
 	 * Restore soft mask settings.
 	 */
-	ld	r10,_DAR(r1)
+	ld	r10,RESULT(r1)
 	stb	r10,PACAIRQHAPPENED(r13)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
@@ -2743,7 +2743,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	li	r10,IRQS_ALL_DISABLED
 	stb	r10,PACAIRQSOFTMASK(r13)
 	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,_DAR(r1)
+	std	r10,RESULT(r1)
 	ori	r10,r10,PACA_IRQ_HARD_DIS
 	stb	r10,PACAIRQHAPPENED(r13)
 
@@ -2757,7 +2757,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	/*
 	 * Restore soft mask settings.
 	 */
-	ld	r10,_DAR(r1)
+	ld	r10,RESULT(r1)
 	stb	r10,PACAIRQHAPPENED(r13)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
-- 
2.23.0

