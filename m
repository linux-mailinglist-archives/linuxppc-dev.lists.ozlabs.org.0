Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427E16F7BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 06:59:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S4rr0fp9zDqdf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 16:59:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qKa/dj4w; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S4q72T0WzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 16:58:24 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id y1so842565plp.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 21:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BCikeDh+Y0jBlmMyjqG5GrWIniG1yyXXc22clcZ5j7E=;
 b=qKa/dj4w2uMey2imIwyCheYUOcM0LFLmYxPQiCrjYJvBmJcwC2vgzRiBJn9bjQF43t
 +EBg0SLlarbP1kXvJ4HqXOBzqV1GEXl4pFDadtibDuwk0fzBaZMvYRva4wRUBdkSS5iO
 bX5mMq4JbjJ6VE5JunTOrw1KJJzd/mrEyAnBLaQhIO5V2esiDfmQI6aakOanPIs3gyxe
 Nu9WsYd4zTS0IUY1zVohJGVhQBo7ltnb6xm9me42HGpqG5cMh4p6Gq0aZA3/r4FQU2qp
 L6y4HPbbH57r+zBh+TnicIzKhS9XqOO+NyCbEVTYelNRfsPmK/AMcjFzrPNzratJg5yi
 +OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BCikeDh+Y0jBlmMyjqG5GrWIniG1yyXXc22clcZ5j7E=;
 b=OFW58CWj3+XRvBNOpV9aIqy3mFMO70D++TCP7ddIxalN6TeQfexezzA1b4zEzai1TF
 Hs2UAmTYqkK9VdJLBbZhzXdQ5IZe4SJAykTEM5ECkuqeRFgdwNV2b31loRXR5XEOs40T
 AOtxpaao/2kvD4aYQbm1i/6UdJWZU37QL1ysSy3koGZSVgHUiR+UhSvcNcpu55eOsN5f
 qMarJKXSFuEPvg1MpgtKwDRTj8171mC/abgX78HF3H9FIckNyCi870JYX0hvkOzJmH6x
 ez3NSSSsNkOz3LainZpLAexq89AsfVPaRDblROBzDO1ExyVF3kzwmS8zQ8jaEuA3OdZS
 b23w==
X-Gm-Message-State: APjAAAWFS9RW6Drz9DzByhAiB1rdg73Fgsga/2GzSjRm9pMT1xKb9gEj
 WqRbfafVsl4tI1zrFUFG//Dd4Etq
X-Google-Smtp-Source: APXvYqygedqVnxMEIUYwqPzjMtGfQK/E8lt0+OWAC5NIkMnazrKXug6XMKciS0IAKlKwRxf0nH5Pbg==
X-Received: by 2002:a17:90a:7187:: with SMTP id i7mr3138334pjk.6.1582696702573; 
 Tue, 25 Feb 2020 21:58:22 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id e28sm1014471pgn.21.2020.02.25.21.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 21:58:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: fix emulate_step std test
Date: Wed, 26 Feb 2020 15:53:02 +1000
Message-Id: <20200226055302.1577954-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/test_emulate_step.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 42347067739c..00d70253cb5b 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -160,7 +160,7 @@ static void __init test_std(void)
 
 	/* std r5, 0(r3) */
 	stepped = emulate_step(&regs, TEST_STD(5, 3, 0));
-	if (stepped == 1 || regs.gpr[5] == a)
+	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("std", "PASS");
 	else
 		show_result("std", "FAIL");
-- 
2.23.0

