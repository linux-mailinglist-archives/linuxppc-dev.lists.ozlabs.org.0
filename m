Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B485D187BCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:16:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hSFs5MhJzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:16:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pD1l0xRj; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hS7R2NphzDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:10:27 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id b22so5377253pgb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ULyHXrk8ayrUGSC1CYU6alKcYXMb2LcpnoEz4kA/QPg=;
 b=pD1l0xRjUFzQQQq2IB4RwrBqRM6U2YkHW4wjkbRQFwvpIG+WmY1nuORiO1KDgwvA+t
 VVfe3XUASha7oyjNFs8jaD9QEKshZDgauBZoWHgXaD5ZI+LsJvXHGEJavI3NkJU5dY2A
 q6GyO1Zlx+22aCzrMw32OpZyL12F+PyghyLfXxtFE0GJAxnL/0Sa/YZ7CY5I1Jkhg/Wp
 D02iHFI74y2NVx4h9iMEb5k1A55eEI3mwzSxHT8zWKjZN4znYUyO2KcpWNyt9FJ8XcQ8
 7qgNWsf9H1nGBxuTsBFLu8nOzYthAAYEyTgUF7Koxc1IB4jHFPbWbCc/LjmJdWOn3tMl
 8Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ULyHXrk8ayrUGSC1CYU6alKcYXMb2LcpnoEz4kA/QPg=;
 b=ts1HhcEy83arl5pIreAWpoHu9zjViHYeHpbzjxAaLYZT2g/OgKMhQDzVM5FiTQbfDY
 V3aBhlO+xWEYi5L01z5F8hCfQIvT+wqDyW5kI632QvXB2Erm2n78JVWCyymQSLhQJcC2
 7ARjFI7sFVD9/7ljMsGmsSiOMR2OuGffvfvjhde/w3+8QyYbzNkOm5YvXHhGMbe46kqH
 17iW5q2EhLIu/SHy2ndR6k2HzHJ4pq37Cvx0SagqUi5cb6NLa/ipqmc9SCcwY53CtTdX
 Vi2vzoQUm16V2/2lcfnjuPIQmmbHUD0D+j+2ncsoAkBT/uuWcPzKIiXzuy0SjNL+ypER
 WObw==
X-Gm-Message-State: ANhLgQ2nfOLYFw/rcUwPO7WWnW5s/8NUwg2JV/Rv21K3Lg0NWnoBRWt5
 z9q8KPQufXQFW6z7PopBzwUGhMWu
X-Google-Smtp-Source: ADFU+vs+8STcCeQy3RLbwnT71JRBYo5n1dYliTL5KUEe5djkPcQFaGbSvN51sUWC7KyFjGQ1Sw1GrQ==
X-Received: by 2002:a63:1243:: with SMTP id 3mr4045656pgs.146.1584436224311;
 Tue, 17 Mar 2020 02:10:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i13sm2463745pfd.180.2020.03.17.02.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:10:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] powerpc/64s: Change irq reconcile for NMIs from reusing
 _DAR to RESULT
Date: Tue, 17 Mar 2020 19:09:09 +1000
Message-Id: <20200317090913.343097-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317090913.343097-1-npiggin@gmail.com>
References: <20200317090913.343097-1-npiggin@gmail.com>
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
index 6a936c9199d6..d95c4560c038 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1011,13 +1011,13 @@ EXC_COMMON_BEGIN(system_reset_common)
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
 
@@ -1038,7 +1038,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	/*
 	 * Restore soft mask settings.
 	 */
-	ld	r10,_DAR(r1)
+	ld	r10,RESULT(r1)
 	stb	r10,PACAIRQHAPPENED(r13)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
@@ -2805,7 +2805,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	li	r10,IRQS_ALL_DISABLED
 	stb	r10,PACAIRQSOFTMASK(r13)
 	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,_DAR(r1)
+	std	r10,RESULT(r1)
 	ori	r10,r10,PACA_IRQ_HARD_DIS
 	stb	r10,PACAIRQHAPPENED(r13)
 
@@ -2819,7 +2819,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
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

