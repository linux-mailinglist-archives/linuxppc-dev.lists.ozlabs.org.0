Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860B1A0680
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:21:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xG3x4XT5zDqb1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:21:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O5VXA3h9; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xFzt40CmzDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:18 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id h11so790974plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLkpYa6ReHSstSFQCnO6w0riXaLuQvV4SStND/UEf1Y=;
 b=O5VXA3h9s2yRkCYIcZzdXtB6l2KW678hT0C//MiaT7pbuzVk5XPkop0Tv35CWoZyyL
 Z9qxi9c2Oq4AIIPmeQuspmYKEl3NHbEnzzgGTI2rQP2Q27fOGKZ6sWK5LxDWUwEfbSFW
 KP+iynHGiwQhVJ+S1AZoJc7ymYvhRmGZV62PCzvqsFUgHypFtRXlqbS2PE5sibVPAgr0
 j7ESN26cfpaNWCyYxnm/3x9KxddM5OX01aWgfcURPtU4COXSImCqAZvdc/uIF6DQYF/7
 3xDSXdAwwX/5rERVsxDOC/dFBq2hqgDXIIE5zSOq1vZIoYN3za7OgKY1Sk9kWIVJ0ffd
 zssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLkpYa6ReHSstSFQCnO6w0riXaLuQvV4SStND/UEf1Y=;
 b=LRwE7f5ltB7ZTPc86WrIaaJ5Wahe4bICIQYUOau5Tp/B4i7eJf7hANgj1sSg3BMKXZ
 zyXsB9I+IydWfwQZygaKRM/vjKjHKWcy88nMXlemBCeM/JD3mFLzjEEDIsVUrA8g7Kzb
 x/66oPUziYB9qlbmX9AROBSig7/lFN9QUOct6i2nTE5oxenLt2OvF73Vtid5IxOjvqbM
 allp7O3FVpdKHbhg+zMxdeGeqYUIShECFd+q8ilRU5j086ezOXjD7hQ81Fue5oDF0jeU
 2KLckqdq2SCvLLgkheYXL1s80F4DVdvqqriUV7cZvzWhTpO/be8n02R0bII5xvABDjBj
 /GkA==
X-Gm-Message-State: AGi0PubAKU6Tl+ZV5oXWsWf/l0vi1TJQ9zqIA6zzdwpgV5B4kDeYPu3Q
 wg2zQHQG+GkR+3sPCGuGrdc+osxz
X-Google-Smtp-Source: APiQypLVu4XZhLByHh7sS/IrodVkgykSFnIfIYYpuGY2qSwS/7JwJu8gmhcAgfgyd3BNoEebhVYsdA==
X-Received: by 2002:a17:90b:3752:: with SMTP id
 ne18mr646324pjb.143.1586236694630; 
 Mon, 06 Apr 2020 22:18:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 01/15] powerpc/64s/exception: Fix machine check no-loss
 idle wakeup
Date: Tue,  7 Apr 2020 15:16:22 +1000
Message-Id: <20200407051636.648369-2-npiggin@gmail.com>
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

