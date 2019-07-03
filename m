Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 110C35DF8B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:17:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dv8v67Z7zDqKH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:17:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dEGsuLIW"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthp1bnBzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:56:10 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i8so769681pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aH9Od/uGcopCsR+aSiuxuN3b+LlKfbwQOdrrN08mV8E=;
 b=dEGsuLIWDBUb478R2DHVHUdUJV5763bWpth0Njb9Sx18jBNw5SV+li7ZOiKTbzVyvJ
 zy3AMwIR7lbw4tnOQzwo6sEM3VHF66+P7wCqRptZntjQzt4P7KI3CBgLD3HzKBVdHBUj
 Cu4lUVViCBozGm18VTtFkEA47XGqcW8TkMfs45zVA7lVEp9Mah+ZXkjMBubtOwRQiG7R
 Re/nYMsa3oXMlEVCzocHGSChuzUCqw2YOj38irOsoO4GY7w/ylqHNZq5rLsY3+ajpcf0
 RIMVB7b8NGs7YkCpBkuQCPoAdiRrWKno23ddZLw7xkp3TJqinw8WKBr9da8l/rpzRtii
 rKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aH9Od/uGcopCsR+aSiuxuN3b+LlKfbwQOdrrN08mV8E=;
 b=c+BfB034tGZ1gOWLn7K0pujeud9iDO9TzP+VR6b3A2SdxyVKLG+fvYhG8FyTzCf27s
 QNK4CzWdqHH15BV5Q++vA73up3Tfp4ldQmncX1aI5zDAz4CzvC8juMDpcXd1C8TixAam
 dxNCv2GSDe5F9KGe9YiaaVTlP9DM8RlHowtKB7aKvjeolMbFmnG+dlfvMC/28bItPwIy
 GP1eVjbNVLTfk70E8PgFmLIaUKjOIx5ilxI5bjlvZeNpEVhLnmOxFuERLzq7LRgOqscO
 to5k3LKvFtYv3zL7e58dBdOM+ys7bn1HoXEVkdd9IgdY8nM86VnNvInc53yrncG6iELF
 sI4g==
X-Gm-Message-State: APjAAAUcO2+jTkxKZZY17S8nrLX1akFuoBMTOO9RkaxpRDMwlEu71nlA
 IbZWJihq6+wvvintYeoJUABwy2u3
X-Google-Smtp-Source: APXvYqx18SknUDBd4QCPDSezvxk7Hc0uzD38MyryD7fRhd2kRsMMn0YyeGQsTjreabNvwl1HbETDRA==
X-Received: by 2002:a63:f746:: with SMTP id f6mr35365257pgk.56.1562140567006; 
 Wed, 03 Jul 2019 00:56:07 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.56.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:56:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/14] powerpc/64s/exception: machine check move tramp code
Date: Wed,  3 Jul 2019 17:54:40 +1000
Message-Id: <20190703075444.19005-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following convention, move the tramp code (unrelocated) above the
common handlers (relocated).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3cc5ee6e4b56..9bb8c89e9e77 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -945,6 +945,17 @@ EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 
+#ifdef CONFIG_PPC_PSERIES
+TRAMP_REAL_BEGIN(machine_check_fwnmi)
+	/* See comment at machine_check exception, don't turn on RI */
+	EXCEPTION_PROLOG_0 PACA_EXMC
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
+	mfctr	r10		/* save ctr */
+	BRANCH_TO_C000(r11, machine_check_early_common)
+#endif
+
+TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
+
 EXC_COMMON_BEGIN(machine_check_early_common)
 	mtctr	r10			/* Restore ctr */
 	mfspr	r11,SPRN_SRR0
@@ -1018,17 +1029,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	b	1b
 	b	.	/* prevent speculative execution */
 
-#ifdef CONFIG_PPC_PSERIES
-TRAMP_REAL_BEGIN(machine_check_fwnmi)
-	/* See comment at machine_check exception, don't turn on RI */
-	EXCEPTION_PROLOG_0 PACA_EXMC
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
-	mfctr	r10		/* save ctr */
-	BRANCH_TO_C000(r11, machine_check_early_common)
-#endif
-
-TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
-
 EXC_COMMON_BEGIN(machine_check_common)
 	/*
 	 * Machine check is different because we use a different
-- 
2.20.1

