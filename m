Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 670BE1A0684
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:25:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xG8T1PlnzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eSwMkiLE; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG022wnczDqvY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:26 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m17so1169247pgj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObCCMRtKkqm4cLMRI3tfvXaacA0omo0bqALi0UF8jqk=;
 b=eSwMkiLEQVWfVYCO6EqT52Nuu5AC5GO4AFvOdPnm1m5qsV6Qan2nW9a5sj1Zs/w30Y
 H6BhIXEBv2LwaI8TH2ev27GnAl+/ZY86vm7zM30pKW/fLP2Ybj65LDn4g/h/F9w6hnUk
 5rJZSUCY45GubUMSz9aqmQxNOF2GG2lAgcOxJ6pUSuycjl1V6jdngEdVFSViK3siDy6Y
 hape9+7MWRbG83a8fLzQTi6YzGGqokourknK94rqvUxYi3aSIOZ5ZPs9IHNsoVThYDln
 ZeTbzLEK4VgVugAH9Qg/xL3Cl0UFrZuZ1adCt09kSAQuwygZbaLKPcKKQvanmD2djdgW
 VkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObCCMRtKkqm4cLMRI3tfvXaacA0omo0bqALi0UF8jqk=;
 b=XR/3jscElYx33fIM8Cx8btwMiikoXPf5nog6OlVFR5jGssITieeDwADinmpeFSSIJ0
 HojP3bPW/uSyIYn7Eul7yogzDUUeL75hfcCo+1/5iV/8SUs4zdIuP22N/EFhKCWAeaGx
 8pnMQ10S62ArcV0eOkYZGnrbZL9NfjQHO5Sz7KFn6+CEs+1Z20IYmuq/xmKeIFfTO9at
 YF2PNX+7rKFCyGElqRwPGzalBrw27HeEfpXTnFplGmzxXhB5BNCjv9f4ASKajHhUJLCV
 PrPz/KsSFSwdAW02HJYKOaQrRu9E4IFjD4yaZ8GcVTDpG4uk6KXGP6AGV/c7sZUUtbb0
 Yrbg==
X-Gm-Message-State: AGi0PuaNRR8SS/zpHJRTxU17Nh+iYlC9egXv/PPlP18WmapGbWWKRnOp
 1B14AekF1I/Hz3pqdKpBVrJuI44v
X-Google-Smtp-Source: APiQypKOwP8vShBOP3JXkLYLrACMTb3FTeVOClmjr3APBBtmPkWsvJ412CVglzlDle563IOoQ0hw9A==
X-Received: by 2002:a63:fd11:: with SMTP id d17mr341377pgh.213.1586236701795; 
 Mon, 06 Apr 2020 22:18:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/15] powerpc/64s/exceptions: Change irq reconcile for
 NMIs from reusing _DAR to RESULT
Date: Tue,  7 Apr 2020 15:16:24 +1000
Message-Id: <20200407051636.648369-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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

