Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEBD7F5D3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:15:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460PhZ2RWNzDqvP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:15:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BMXr5P45"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PM23xdczDqxW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 20:59:58 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id w24so33514239plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 03:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVt8x9U7zPf6niW6zSNerA1IPHIU3guHSG1vUHKPbAA=;
 b=BMXr5P45LKkcfC3mcN1fSp9TYcl+3t5XWOfmAmfWIRCyhoco04WHNwuNzy97uF8XFP
 MJCQkkF1QIC0rN8fJraCBHUuKxwI+/w1pKx3DgOvkPJPmyyQRZS42QIO/NUnx3csWFdH
 W7bm9dCJmtMCLuf+0hjgILGyCXsMbXleBwbe8GFjfJjBLsILKkdXohofBj5v1zWVZZLA
 VQeq7zF5uX7VtV/H6kLOLgls1SlLtuAr9zyOjWWbEcygJ1pv+AZMv0/8Ii/5Wg5zEL3g
 ErH/sswHz5tL0Os5VV/3F2kMkqmEWnSoA3pZEXbaSo4nOav+p/0zpRTSIi3CiK3YkGQ9
 DlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVt8x9U7zPf6niW6zSNerA1IPHIU3guHSG1vUHKPbAA=;
 b=BExfkDzC4DP37ePOwYyjoAY0QZSAZD+TTdWiEFiLTTi2g4C4xM0RSf74e50hL5vHvo
 ISq6hz9jFH3F7/SQe7ngDUD8bcdwhUYM+aLMYeI54/I2CyPcpSXouMdP8xSBPuM1RcAC
 VVYKSLeht2OsMVLDgT9w1CKlUKQ8pLBdR4YQHWZVbRZApmHlJ9d6ttY1ZaGcS5NXJLy6
 bb7rr1FKVrl8k1QK6CBdwL/SA8A1PJuPLBFqOrIX7X6aaeKYN4xqHFK4jz+CcRC9I2D+
 0e1+zcAOPC4TNyo5KL7L/+0oFsh8nFUndF1W8D4MzrvaDyMo1uu9jLkKWhLJC6/YnPwc
 recQ==
X-Gm-Message-State: APjAAAU/oKZf7s8skY5mqte0GqU4F6d/qGneOWhchCVOFcG3oJa7WMDL
 JI53L9iwOGg1rdW1YGV+LIIGN3gwNBI=
X-Google-Smtp-Source: APXvYqyYilo2TpfJ3KKlegyWwHvVNcWM28yCFd5psZ6uu9Tu2BSRXGlIgpS7QxK861JEpPWE0Ozg0Q==
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr133928500plk.14.1564743595381; 
 Fri, 02 Aug 2019 03:59:55 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.03.59.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 03:59:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/44] powerpc/64s/exception: machine check remove
 machine_check_pSeries_0 branch
Date: Fri,  2 Aug 2019 20:56:31 +1000
Message-Id: <20190802105709.27696-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

This label has only one caller, so unwind the branch and move it
inline. The location of the comment is adjusted to match similar
one in system reset.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8188c4ce4a49..6ec296762720 100644
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
2.22.0

