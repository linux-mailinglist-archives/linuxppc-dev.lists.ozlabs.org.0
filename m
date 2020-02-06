Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3657153EBB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 07:29:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CpRx1SJ6zDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 17:29:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=We1aMY9o; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CpNy0hzVzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 17:26:41 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id j15so2225895pgm.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2020 22:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+CKU3q/wSKm6tOqHSFjsb14Tj10WgTny/z1NuPUFjuw=;
 b=We1aMY9ozbOL8+wA1RiiATcYoksuKnyQ3DerR5Wj2mvyBai0bJfyId2D9gMoUboTlI
 gKSb91nagZgEFpH7dX12g/KdU7wP06sC74oD1RI7+9JvLeR7Fq8zMzvt0bcSPbD85rA1
 sxpDqn9/8J8mPyOq0O3v/MZTcYXqLqrdjlW/wk0vm+RRVxlJHxlvMNKX9DZgKL/ke4QL
 6PIiw4jJShsnLZa+cuh2exPcSKpc6PTeSVfI3RBwMCaO5ukRlZd04298fqemPFH0ooJa
 o6PvX/2bZ1N2KKx9iLQzx3ue1X1Ks3RPceN+6VKpwOl7MuAH7lm4hfXKzIA9zOQSETiJ
 fEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+CKU3q/wSKm6tOqHSFjsb14Tj10WgTny/z1NuPUFjuw=;
 b=siBk/bME54QWmFFpFNiPVsePRsGyvahxX5FNHwiDdEtVregl6hhBwMPiZIBOcoleSo
 VrGcYG1o4IInnXr8xgRp4brnNE8mwh6xx9fihBi0DRlrLnz+swd4jcd35+DUpS998GAX
 lRIbFAu/Wjozwjl6USNdGdesvzn90EADzKTcGH9tVU/OsFFQ97tEUMWbHZlLnfKMOR1u
 sh3ij9NOVakxBrse0UhVJKv2NHEgHf2IqShWNkF/4e+TtZj76DnUDJVL167WBm1vaEQ8
 daGANH/d1Q15MWjxT4cjk7JyxI8VL46AKnBNJ/0KCnLgZFNVL1QPSe7HWeP/ONTu+zfX
 ESXQ==
X-Gm-Message-State: APjAAAVkzEjshjbk0IUr22qcMbnxmc9Z47mEOCliau2ytiKZMwVCE/dF
 XtNDAfQMIhW7I6PuFVjH2YoNmwGc
X-Google-Smtp-Source: APXvYqzNb/9mp+kFnjtGO01tEElRlw0ulSJ5xHQ6YGVK8D7SKf65ErN2adFh962eKgGezD5/bYwfTw==
X-Received: by 2002:a63:a1e:: with SMTP id 30mr2074194pgk.238.1580970400024;
 Wed, 05 Feb 2020 22:26:40 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y24sm1895588pge.72.2020.02.05.22.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 22:26:39 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] cpufreq/powernv: Fix unsafe notifiers
Date: Thu,  6 Feb 2020 17:26:22 +1100
Message-Id: <20200206062622.28235-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206062622.28235-1-oohall@gmail.com>
References: <20200206062622.28235-1-oohall@gmail.com>
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
Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PowerNV cpufreq driver registers two notifiers: one to catch throttle
messages from the OCC and one to bump the CPU frequency back to normal
before a reboot. Both require the cpufreq driver to be registered in order
to function since the notifier callbacks use various cpufreq_*() functions.

Right now we register both notifiers before we've initialised the driver.
This seems to work, but we should head off any protential problems by
registering the notifiers after the driver is initialised.

Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 drivers/cpufreq/powernv-cpufreq.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 1806b1d..03798c4 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -1114,9 +1114,6 @@ static int __init powernv_cpufreq_init(void)
 	if (rc)
 		goto out;
 
-	register_reboot_notifier(&powernv_cpufreq_reboot_nb);
-	opal_message_notifier_register(OPAL_MSG_OCC, &powernv_cpufreq_opal_nb);
-
 	if (powernv_pstate_info.wof_enabled)
 		powernv_cpufreq_driver.boost_enabled = true;
 	else
@@ -1125,15 +1122,17 @@ static int __init powernv_cpufreq_init(void)
 	rc = cpufreq_register_driver(&powernv_cpufreq_driver);
 	if (rc) {
 		pr_info("Failed to register the cpufreq driver (%d)\n", rc);
-		goto cleanup_notifiers;
+		goto cleanup;
 	}
 
 	if (powernv_pstate_info.wof_enabled)
 		cpufreq_enable_boost_support();
 
+	register_reboot_notifier(&powernv_cpufreq_reboot_nb);
+	opal_message_notifier_register(OPAL_MSG_OCC, &powernv_cpufreq_opal_nb);
+
 	return 0;
-cleanup_notifiers:
-	unregister_all_notifiers();
+cleanup:
 	clean_chip_info();
 out:
 	pr_info("Platform driver disabled. System does not support PState control\n");
-- 
2.9.5

