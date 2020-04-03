Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C59E419D79E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:31:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v1723KYNzDqRY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 00:31:42 +1100 (AEDT)
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
 header.s=20161025 header.b=S9YC/s0U; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11M4DdkzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:26:47 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id m15so2936215pje.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLkpYa6ReHSstSFQCnO6w0riXaLuQvV4SStND/UEf1Y=;
 b=S9YC/s0Uinhh6eo1T5/piQt4BgPhMXsEQlGFLcT/qlN7g8fde3NKAHTNMWjzFlbnuA
 oSUpBXa41PAF0UtVaBeo6TbVtKMIk9qsxepn2xIgQwCJImKqd7KHqpxMCQTrLha9Tghz
 RcJYyqHa0p4fsVCNQdCgYrJa7c9mCp3i2YD5m5TVfvXoES+ETTj3FvrIjx6dWVDOxp8o
 vzIW9ifUmInpaMd4Q/QBFLgHnHGRMJQjvIbi/mZYCwOSR6e3W3okp8msf8psidPL/jRy
 8umrPItrbK2KV09XrceFx0SB9cUeaVZdq+ZVxNEC2YBLkM0s1GU4u3sSU9pV+lYEYBjW
 u/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLkpYa6ReHSstSFQCnO6w0riXaLuQvV4SStND/UEf1Y=;
 b=QOr5q4W1zgoefiP91scSzVtVBeQ8apmQZ0cH250s472lNJvF/2N2lFSI0GEO0KFCX6
 +dJpJzhWI9uCVWlea/+ty/0Ntm5eVIlmgxmLIODCDk/Y516NVG/3rhIz7BzO3pXeTZo0
 2iaH6u9llpl4uKpJYSQc6LL/PG+QeSqijygMdZEaqPwsB73FQvjxhnbp2G4kfOHqy4zl
 AFSgjSwkd6ZDrSe8V+29kKkAMMD44dO2Q67yylMq/oS91XkuBmiH8cuh9N3iAMqZK4oF
 VRD5pRRBFeqIVpfqA4g6s6Zn9VTUAXdOrUvlgdfnEiEP007tYsAIKELnbHJtCmmN/pbu
 sqhQ==
X-Gm-Message-State: AGi0Pub3slNeBKvUWfhOf/OfKZ8MGHd9NgRk74vuNfvaGVKUTXUQPYNY
 KS7sr8C4/76uATi+Knq06ygy/ore
X-Google-Smtp-Source: APiQypKbybpkliHTuilviWulz9/iFclP2Il7PAGV11tZ3aqfWUgHQnP5S7C3dsIKinhq3plfShmYmg==
X-Received: by 2002:a17:902:8d8e:: with SMTP id
 v14mr5009306plo.186.1585920403935; 
 Fri, 03 Apr 2020 06:26:43 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:26:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/14] powerpc/64s/exception: Fix machine check no-loss
 idle wakeup
Date: Fri,  3 Apr 2020 23:26:09 +1000
Message-Id: <20200403132622.130394-2-npiggin@gmail.com>
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

The architecture allows for machine check exceptions to cause idle
wakeups which resume at the 0x200 address which has to return via
the idle wakeup code, but the early machine check handler is run
first.

The case of a no state-loss sleep is broken because the early
handler uses non-volatile register r1 , which is needed for the wakeup
protocol, but it is not restored.

Fix this by loading r1 from the MCE exception frame before returning
to the idle wakeup code. Also update the comment which has become
stale since the idle rewrite in C.

Fixes: 10d91611f426d ("powerpc/64s: Reimplement book3s idle code in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 728ccb0f560c..bbf3109c5cba 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1224,17 +1224,19 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	bl	machine_check_queue_event
 
 	/*
-	 * We have not used any non-volatile GPRs here, and as a rule
-	 * most exception code including machine check does not.
-	 * Therefore PACA_NAPSTATELOST does not need to be set. Idle
-	 * wakeup will restore volatile registers.
+	 * GPR-loss wakeups are relatively straightforward, because the
+	 * idle sleep code has saved all non-volatile registers on its
+	 * own stack, and r1 in PACAR1.
 	 *
-	 * Load the original SRR1 into r3 for pnv_powersave_wakeup_mce.
+	 * For no-loss wakeups the r1 and lr registers used by the
+	 * early machine check handler have to be restored first. r2 is
+	 * the kernel TOC, so no need to restore it.
 	 *
 	 * Then decrement MCE nesting after finishing with the stack.
 	 */
 	ld	r3,_MSR(r1)
 	ld	r4,_LINK(r1)
+	ld	r1,GPR1(r1)
 
 	lhz	r11,PACA_IN_MCE(r13)
 	subi	r11,r11,1
@@ -1243,7 +1245,7 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	mtlr	r4
 	rlwinm	r10,r3,47-31,30,31
 	cmpwi	cr1,r10,2
-	bltlr	cr1	/* no state loss, return to idle caller */
+	bltlr	cr1	/* no state loss, return to idle caller with r3=SRR1 */
 	b	idle_return_gpr_loss
 #endif
 
-- 
2.23.0

