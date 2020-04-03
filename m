Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E719D7DC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:42:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v1MV54cFzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 00:42:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m7VpLdF8; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11S4J5NzDrgP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:26:52 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id v13so2995952pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObCCMRtKkqm4cLMRI3tfvXaacA0omo0bqALi0UF8jqk=;
 b=m7VpLdF8XMRDL9gjRx34CgmmpWEvZjGfNEd5dCwjQfhXXKK2YUG+R4q1QJuqYX2sDD
 GigIuUuK3n2hN+Czj3Gi4NvwjZD0o1zqpEmuzCScOXH0rsZhfVBeu7M2X4zuWIxtdTv6
 RbUHryEmJP3M6xfN07v2qaTaF0dsjyWAdC0BG0IPPy7hS1Jo6u4VgK44xoC/q5v+TNqD
 Q0tGrm/a3Syt9XkS/fAYGhytiBLLPJPLa8RYLSaTnCGjHjtk6/tDpvuQ9WDqVpvZ6QLF
 K+VY6jaOYQ8yBfQSeqFev5fTiQsfl+Qa07qRvTXwpwTbVTAJf7asT+9OsJdf/eUDwn1k
 KVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObCCMRtKkqm4cLMRI3tfvXaacA0omo0bqALi0UF8jqk=;
 b=Gzgnh4+nkQaYszptufjpW2m9lfLs2L3P+JMpvjWIbz6OCGapTP7bxCwCp747zzCXyD
 bS4HG9Q3t1DdDb0X7GOeXmjTkr0x6IaP4uJL+b+GDwvjyIKNDIQqgq0dnhRawG0+SwhE
 YCoNiphZodryWhPhENIOykfq3h7LvZHk4QEZ9M68Nlho/JaZelEItQTM6+GX1wjfMiOG
 PFLZIkSqJ8H+4Vq275eO2qWf6FynGrQ8JtQbXG90ciGTXcD2Cb7Qg9HthdLy8Hx/fMs4
 UEG+oo1GbAn6aPrbr6w+CrmQCXsxrPwmOc8VerBTlrwwS+FWtNLMoyfwzcayK6UFmTsN
 4xCA==
X-Gm-Message-State: AGi0PubzEAvopOIIYDSXPOMxIcaIUeqR0K1xJl3fk+nwLj87HF6euzez
 P0CJlfJkKSbC8FS4+YG17vDtb89T
X-Google-Smtp-Source: APiQypLWY1eBQ/utPXFAy8Cmb55lnI+YX7RXQ3ye2roAziod8RVz86AOIignl3Z79BJkO9hZ9EU/pg==
X-Received: by 2002:a17:902:32b:: with SMTP id 40mr7646433pld.22.1585920410262; 
 Fri, 03 Apr 2020 06:26:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:26:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/14] powerpc/64s/exceptions: Change irq reconcile for
 NMIs from reusing _DAR to RESULT
Date: Fri,  3 Apr 2020 23:26:11 +1000
Message-Id: <20200403132622.130394-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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

