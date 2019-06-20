Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5D4C7A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:49:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsqW3zt4zDqSJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIf7KfRT"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqmk1jrzzDqwD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:38 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id m30so960728pff.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N+E/s9QGZrOj3hw0DaEbCdHGSUFcxrXt0PaS0S9Cgvs=;
 b=UIf7KfRTWfmRX+fX5tE/WUaSFHJeZMT5MVHO0PQQo9C7a4TDOtz9pJZFC48o9hYKb8
 J28pFurX4WFtAYK6D5WkiWL0cA2zSAdEzYqqvZRYgJDaX5zCwC/aIr41/KYEf4SvyihZ
 XCTB2TB0zZM8rSLq3W3WfJE0VErlUEu8Ai1H9hsnqqbgwloLmcLlyCxk5rNpgUUeKEvI
 yW/rs2TIhs50tpqrRZPH4OFIsgaYFgY67ClNqnDTds8P79N8vcrjRIDqp5i5vu2VOP43
 SrtMIF8sK5Es3tihTeR+K+TqFGhYMKrdHBZXgFw5KqVqZ+vsLumOqxQrtufKc4rGDdcg
 z5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N+E/s9QGZrOj3hw0DaEbCdHGSUFcxrXt0PaS0S9Cgvs=;
 b=d7clWh2JeJW7rhQ8leN/9vZ2FX5XHU9pMUUZ2HMmWIR768rHsThl2+UfuT4XpfFRby
 Wc3/L95bWxhVACZvCjza61uY5ulFr+QV+CBb7c7vLalO4XYwDEtqr9Gei4TmDND3PYaG
 8wkb6aJY9cWjC8T9WBtS0ephYctzSaf6Q3t0XGJGEgG+whbeuaUo7Q1Qh43ptS++ehF3
 pGuURlswF1iklbhA2ktfNQHyYig8Omi9+fNgSGIWq3ljAlhf2aXPHUqDVb4hcczgaJOT
 zd4x+LnLby4DraixBvwO36sDz3A1QAOk1uNVBeyOCXXzOlGDDzoXQx+wfLiyyqmbFFj0
 /o+w==
X-Gm-Message-State: APjAAAUZNZCvB9LqHj8Mp2Q1sKFGAnnDJ9jMrzr9Gs8edjTLiUyNVdOn
 +b8CUYyDle7v8n3OBhzXOsjRK+Is
X-Google-Smtp-Source: APXvYqwj0KkO9a5DwFMQk9nKSeaIdWri2e3YpiMpFEU5MzLyJLtvOeFBlDxc5nzZy7oDWDM6JYqZvg==
X-Received: by 2002:a63:d24f:: with SMTP id t15mr10065918pgi.301.1561007795780; 
 Wed, 19 Jun 2019 22:16:35 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 44/52] powerpc/64s/exception: separate pseries and powernv
 mce delivery paths
Date: Thu, 20 Jun 2019 15:14:51 +1000
Message-Id: <20190620051459.29573-45-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

This will allow standardised interrupt entry macros to be used in
future. These paths may be de-duplicated again after that if code
allows.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f3362adc99e6..61c96502d2a8 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -952,11 +952,13 @@ EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	 * vector
 	 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
+#ifdef CONFIG_PPC_PSERIES
 BEGIN_FTR_SECTION
+	/* Some hypervisors inject directly to 0x200 if FWNMI is not enabled */
+	b	machine_check_pseries
+END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
+#endif
 	b	machine_check_common_early
-FTR_SECTION_ELSE
-	b	machine_check_pSeries_0
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
@@ -1033,18 +1035,18 @@ TRAMP_REAL_BEGIN(machine_check_common_early)
 	b	1b
 	b	.	/* prevent speculative execution */
 
-TRAMP_REAL_BEGIN(machine_check_pSeries)
-	.globl machine_check_fwnmi
-machine_check_fwnmi:
+#ifdef CONFIG_PPC_PSERIES
+TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	EXCEPTION_PROLOG_0 PACA_EXMC
-machine_check_pSeries_0:
+machine_check_pseries:
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
+	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
 	 * MSR_RI.
 	 */
-	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
+#endif
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
 
@@ -1205,7 +1207,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
 	/* Deliver the machine check to host kernel in V mode. */
 	MACHINE_CHECK_HANDLER_WINDUP
 	EXCEPTION_PROLOG_0 PACA_EXMC
-	b	machine_check_pSeries_0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
+	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
 
 EXC_COMMON_BEGIN(unrecover_mce)
 	/* Invoke machine_check_exception to print MCE event and panic. */
-- 
2.20.1

