Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C93AB1E050B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 05:07:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vhpl0RXBzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 13:07:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DdJ0ML4y; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vhfv3Z0HzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 13:00:39 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id t8so5810670pju.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 20:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QQRjsqcXmPBAO542GKWkWbFxNq95qqDJkH5tvxA5/NE=;
 b=DdJ0ML4yaOxA8FDP4TVBuN4kNiegPQsSeth32YGNcDlvtX3o4QB+o3mD3ZiWMUXmUd
 KyZD5DC010ulgYJEmXtCqMK7Rr+fhtrr0parIjAllePISW8OaSKx/QUDf6AGfSqvBeIN
 NQ7lm/oXZhTC0ikq0RIvSflOyaBwxTyxPrpVUj0zeSSLe9zw4HODuhVeSdA6H7BQCnxm
 8hMThcHXwhUWICauCGk0veF9RBfMe2kWcp52X5X9JMrmtCUx2I87in9e0OqBgxB0RaZG
 2C0y6gGNedLt2WbQC1f5S8vXZrvP3G3tun7I2CFFbKb9hKqTnU1l+E97g/rUwqRARcoE
 Gbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QQRjsqcXmPBAO542GKWkWbFxNq95qqDJkH5tvxA5/NE=;
 b=PwZY0UbNozFEDReS0lWsrqBwjqGpbhjlFXW/iKKO32KJt9zLkx7tzKYu8gq4+vIsnO
 urT+slAgyiroiCRkLjDuM26wESO15uiymbKz6KUq6NhhYdwsI7J9VMJEW+rBaAE3lWlG
 xMwXryp79EXJZQgcw5zVvf9OnpkdUdRrbX5aa3a0HJk89aZQmJaGTEgh5GqvoUCXslpp
 rqW+Vn8C2U2SnxxAUnYeJbS8Zr5DwGGr6deVIHKvLj7pCZAiSm5N4djyt9ukD2ttsBVD
 ZCCu4u+7Rf+XVlNDq8i6kUPvxVSU/fWmL+OXP2+JsaMwm9L+BmxEJTz/qqx0SEFdbIVy
 EfRw==
X-Gm-Message-State: AOAM532Pyz6/5rbqI7m5cp1T67aQ2OZSCnSsT7KIB0sWE6DnfjkvoH1S
 7tHBW7azijsBtYvFfIsB+Stavb3I3WU=
X-Google-Smtp-Source: ABdhPJyfn0yNXzO1wHIQXr38m+NLjrtL2P4jiq61ChQqwFo5xw0OrooxyYUlgBs4887iGEykDyxiqg==
X-Received: by 2002:a17:90a:1485:: with SMTP id
 k5mr13460741pja.108.1590375637148; 
 Sun, 24 May 2020 20:00:37 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id p8sm10790452pgm.73.2020.05.24.20.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 20:00:36 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc sstep: Let compute tests specify a required cpu
 feature
Date: Mon, 25 May 2020 12:59:22 +1000
Message-Id: <20200525025923.19843-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525025923.19843-1-jniethe5@gmail.com>
References: <20200525025923.19843-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>,
 bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An a array of struct compute_test's are used to declare tests for
compute instructions. Add a cpu_feature field to struct compute_test as
an optional way to specify a cpu feature that must be present. If not
present then skip the test.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/lib/test_emulate_step.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 427c2ca8191e..579b5db80674 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -690,6 +690,7 @@ static void __init run_tests_load_store(void)
 
 struct compute_test {
 	char *mnemonic;
+	unsigned long cpu_feature;
 	struct {
 		char *descr;
 		unsigned long flags;
@@ -1133,6 +1134,11 @@ static void __init run_tests_compute(void)
 	for (i = 0; i < ARRAY_SIZE(compute_tests); i++) {
 		test = &compute_tests[i];
 
+		if (test->cpu_feature && !early_cpu_has_feature(test->cpu_feature)) {
+			show_result(test->mnemonic, "SKIP (!CPU_FTR)");
+			continue;
+		}
+
 		for (j = 0; j < MAX_SUBTESTS && test->subtests[j].descr; j++) {
 			instr = test->subtests[j].instr;
 			flags = test->subtests[j].flags;
-- 
2.17.1

