Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC48A649EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:44:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kNlj18qZzDqQ5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M8UsyO7k"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNH760qSzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:22:59 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y15so1266868pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5nzEZzoD8r4bBmmvSx3fN5G38mG8QhyHILVVojissE=;
 b=M8UsyO7kN2iS3GvbeNTBlWwKbtUG6X/xxNQz56ptd71hlBcBLLiEhK208LW/OSv+uX
 Bk0dfdMnl5r/YbXa6KZWsbmPedo9MeB8Qkl5QI8/txVzwtmJcdbIOZEFkKskgyR9SjRt
 fK+57w7kG8vkhHYNFBttp2vgWfiN2H7ct5UnUReZsyo9KnORq+8hKuybxHWKY5dKjNcP
 uUr9nN14qZvOT12SRY9gFu+4fCceXFFwoNZu/w3BL3eW+ti0/InT773WzhzROd7Jh6pS
 IF92JMwb9B3tq234h7frYycLTfLsTdGPAsm8EaXXLD6WQPDYTbxkdbEdpnvKPntZowVO
 jTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5nzEZzoD8r4bBmmvSx3fN5G38mG8QhyHILVVojissE=;
 b=hzZrI7urqxHjs0Kk3X/wWEeydjHiOJV9gX6LgnBectvx7MidSW8k2A9fIZS6fQboTm
 4c3a1EGAuGfLp9zp7bF8kTMvRCgOL/VcJ5s2XcT+B8CpRCFmfq5Y41TaWa6QzHsd8D5C
 REKZl61BHmVrUrDpKcil4lOy6FqUmBlkmQQ3BDRgU0ICqt5Gi0swyPacsacV9+6cJ1XP
 ySIHZWDJh7d5OOkWOic+w3+/COQ3JAO4FEQsfeil3QVeDYGfpn37SBeBlDlTFeHFixQd
 d6TxVHyOa2BgNv2vxq0vFU/NOhD++gDR17KwVqD3vWY/qifSY30JXf4WhwcEcyxWn4Uf
 HdRQ==
X-Gm-Message-State: APjAAAWJ3PsPsehsDsZDD7ON1nxXF8ztobkbJMVyCi0PW+ES1gq++oua
 JFk5VkV7X0MexKd+XIxO0PJWogiCeiI=
X-Google-Smtp-Source: APXvYqwRpD2HACuBFdxWh00uiJ6h5N+hU6LOvHNi9WzllqRnX/6O1h+P5RFCKKrGmipmV588Ckdyfg==
X-Received: by 2002:a63:595e:: with SMTP id j30mr35833529pgm.2.1562772177434; 
 Wed, 10 Jul 2019 08:22:57 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.22.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:22:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/16] powerpc/64s/exception: machine check remove
 machine_check_pSeries_0 branch
Date: Thu, 11 Jul 2019 01:19:40 +1000
Message-Id: <20190710151950.31906-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This label has only one caller, so unwind the branch and move it
inline. The location of the comment is adjusted to match similar
one in system reset.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a69ceb28cf4c..54ca2b189d43 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1014,20 +1014,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	b	1b
 	b	.	/* prevent speculative execution */
 
-TRAMP_REAL_BEGIN(machine_check_pSeries)
-	.globl machine_check_fwnmi
-machine_check_fwnmi:
+#ifdef CONFIG_PPC_PSERIES
+TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	EXCEPTION_PROLOG_0 PACA_EXMC
 	b	machine_check_common_early
-
-machine_check_pSeries_0:
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
-	/*
-	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
-	 * nested machine check corrupts it. machine_check_common enables
-	 * MSR_RI.
-	 */
-	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
+#endif
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
 
@@ -1197,7 +1188,13 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 	/* Deliver the machine check to host kernel in V mode. */
 	MACHINE_CHECK_HANDLER_WINDUP
 	EXCEPTION_PROLOG_0 PACA_EXMC
-	b	machine_check_pSeries_0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
+	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
+	/*
+	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
+	 * nested machine check corrupts it. machine_check_common enables
+	 * MSR_RI.
+	 */
 
 EXC_COMMON_BEGIN(unrecover_mce)
 	/* Invoke machine_check_exception to print MCE event and panic. */
-- 
2.20.1

