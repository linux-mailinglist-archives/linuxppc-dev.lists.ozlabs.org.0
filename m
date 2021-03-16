Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B533CBFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzz7L5fX3z3bw7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:20:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=B6uVTpWW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B6uVTpWW; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzz5b10xNz30C1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:18:42 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id x7so7868966pfi.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 20:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7H59t/YcaUtdXxKYfZLvRzPJM2todDbVzkoX+5TuhGE=;
 b=B6uVTpWW7GIRzCt2BT2jcUPddyYyVAwNItJEcVIds2Qw//DaFLUg63YRCjL+g2ReuU
 HsAAKW8erGQuMcNupzeRGlwAOlxfGwHhEyPPMmMRqAWou+Hwnmg9pc/BHxfu9p1e6iF/
 IIgDc8t8UELZKIVF/95BnISiXVYIWeeF4h19SjPUiRkWnQJiulDcYENWfSxVyVwP1Tx9
 o5/POIMG9uOkjEkvEp0jCcxtWwN4luxX35cw36xgw2nKJRA6YMKzyhwr7UG4pmNDq29t
 hmvj0ld8L6fTWYbpmPYBkt/gPPFQStPLZBZmZx/kSdOAMp3g/BMtaSR71ehTyys7iR/6
 X7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7H59t/YcaUtdXxKYfZLvRzPJM2todDbVzkoX+5TuhGE=;
 b=dcggl+mJSYU58Lzb6nchlofsdL2EPjSClLcxOqTfScm7dXvPfwZCW/K3xWqgVvI/TM
 8Z6Fq2/gZsci7o59DPh5EpWUxzpr1Og/ipVh+j0kJhSghqQms1MiHuXGSdmiGJZ8l+og
 LOkv+ITf9v0fkND+aAT+wdgPhGqaLfbSXgeARwe239woSdaW990OdYMemEVd6R4E3P4t
 J3p2X8g8f5yCcXRwE05IqQQ2XolT+1FAtX1Rwgoun8PTW1gaMRiJtu7g72FuD8jz+mSk
 cVuAdr5kI7x2YtJ+HrE5QsqNau3zgprb9lbfBqXDP4fHO1gHYM37rxVIC31Z8uudT4gk
 CYAQ==
X-Gm-Message-State: AOAM530k4mnxrZfmVnWI0w6RZTE5Y+ArFEAYmFOiZErIs5eGYeYTuvaS
 Ruc41y7CXotbQx6mRXfaPw5OpmycUh0u7Q==
X-Google-Smtp-Source: ABdhPJzSOetPKduWc4fhbbyYrmmbymSVFUrHvGSirNKrdSifMok8T4UfvqZbLCyOEGJrROlcBdmWtQ==
X-Received: by 2002:a63:cc49:: with SMTP id q9mr1942090pgi.72.1615864720385;
 Mon, 15 Mar 2021 20:18:40 -0700 (PDT)
Received: from localhost.localdomain
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id o13sm15098809pgv.40.2021.03.15.20.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 20:18:40 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 4/8] powerpc/mm/ptdump: debugfs handler for W+X checks at
 runtime
Date: Tue, 16 Mar 2021 14:17:37 +1100
Message-Id: <20210316031741.1004850-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316031741.1004850-1-jniethe5@gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com,
 Kees Cook <keescook@chromium.org>, npiggin@gmail.com,
 naveen.n.rao@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

Very rudimentary, just

	echo 1 > [debugfs]/check_wx_pages

and check the kernel log.  Useful for testing strict module RWX.

Updated the Kconfig entry to reflect this.

Also fixed a typo.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/Kconfig.debug      |  6 ++++--
 arch/powerpc/mm/ptdump/ptdump.c | 21 ++++++++++++++++++++-
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index ae084357994e..56e99e9a30d9 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -371,7 +371,7 @@ config PPC_PTDUMP
 	  If you are unsure, say N.
 
 config PPC_DEBUG_WX
-	bool "Warn on W+X mappings at boot"
+	bool "Warn on W+X mappings at boot & enable manual checks at runtime"
 	depends on PPC_PTDUMP && STRICT_KERNEL_RWX
 	help
 	  Generate a warning if any W+X mappings are found at boot.
@@ -385,7 +385,9 @@ config PPC_DEBUG_WX
 	  of other unfixed kernel bugs easier.
 
 	  There is no runtime or memory usage effect of this option
-	  once the kernel has booted up - it's a one time check.
+	  once the kernel has booted up, it only automatically checks once.
+
+	  Enables the "check_wx_pages" debugfs entry for checking at runtime.
 
 	  If in doubt, say "Y".
 
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index aca354fb670b..78497d57b66b 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -4,7 +4,7 @@
  *
  * This traverses the kernel pagetables and dumps the
  * information about the used sections of memory to
- * /sys/kernel/debug/kernel_pagetables.
+ * /sys/kernel/debug/kernel_page_tables.
  *
  * Derived from the arm64 implementation:
  * Copyright (c) 2014, The Linux Foundation, Laura Abbott.
@@ -459,6 +459,25 @@ void ptdump_check_wx(void)
 	else
 		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
 }
+
+static int check_wx_debugfs_set(void *data, u64 val)
+{
+	if (val != 1ULL)
+		return -EINVAL;
+
+	ptdump_check_wx();
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(check_wx_fops, NULL, check_wx_debugfs_set, "%llu\n");
+
+static int ptdump_check_wx_init(void)
+{
+	return debugfs_create_file("check_wx_pages", 0200, NULL,
+				   NULL, &check_wx_fops) ? 0 : -ENOMEM;
+}
+device_initcall(ptdump_check_wx_init);
 #endif
 
 static int ptdump_init(void)
-- 
2.25.1

