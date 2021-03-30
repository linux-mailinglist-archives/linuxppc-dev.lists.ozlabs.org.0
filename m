Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A034E061
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:54:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cZ03nLKz3c9c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:54:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WsFqR19q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WsFqR19q; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cW347f3z304Y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:52:15 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id f3so1633928pgv.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsJ9qc8ve5CySqkneBjhXJ6tnGnyvRveXyvW8UpChMo=;
 b=WsFqR19q/ZzvQUiKAWxcofbTahR9HDJoybSssNXozfHYtX6qjV/4HI14r4y5z9OnzD
 LmCDi7CZg2nseEF3Bl9qGyZR6JMpxSLDrce9vtJ37yFM5T2gKIijx7CT2OmIEi7NZh3q
 DSZD4YszlzJU36KoqcT0vL5MP5mT8V4nj9tF5ldxns2Zx9t5nN+LEk12dAptiPqbhKNP
 v4bFhm9pxoDkDb9EAoWSAbBnnCMhyGLzlRIdBmOqa9vVrKPz3QuBZsnuwpdazq/sfV9R
 y+Tjw5gQ8/r/sKkVZWnR0STbrNe1Ys+vYTqFo79WjjGQ5t2NfFrz+hB+Ym4XjQOnLZMs
 0lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsJ9qc8ve5CySqkneBjhXJ6tnGnyvRveXyvW8UpChMo=;
 b=Aonkj5xNaESV4lXaiM7Bp/HjHPVWXZmTNWK4T+5eBS4hkdKpbc9Yp1SoxJzbfPB434
 lbppUhcsjudvN82vZUIfGarBZysGsIJDOICRqpyL/1CWtrxRbpZeYpyYeaWs7tTExszS
 f6RXwz9F9IyqcretItJlpfQ5FfglxAs+WAcZjr+ffHjQQgLWfto1i+AfRhvyWmVCySOW
 lmhgnxOVE0/rZFoQxR7cgQuNyd9H9Bo7GpsqgPIdtmDpo31gmZP1edXtTWIx44WnBfn6
 JRcF9K3ny5cyefDpECz5vx5GuJTrL2DOKDFPTJCxRe9qlLiM5yTYpJqACqttTK92Jhu3
 w8gA==
X-Gm-Message-State: AOAM533q8va9mWe35LQx9YKMvF7uP9DUYVMwCrti5s1VzakYKZ/1McXQ
 neqcJDmI8F4sNrhwMgyq5fQqVfgtM6CxdQ==
X-Google-Smtp-Source: ABdhPJzx6cnlXVPC77GCT4S9rxhD2OspG6Ktm4Srs8pM9VpUktbT7FYEYu38gvnk63TKtM6kogk8sQ==
X-Received: by 2002:a63:2321:: with SMTP id j33mr26733297pgj.120.1617079933111; 
 Mon, 29 Mar 2021 21:52:13 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:52:12 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 06/10] powerpc/mm/ptdump: debugfs handler for W+X checks
 at runtime
Date: Tue, 30 Mar 2021 15:51:28 +1100
Message-Id: <20210330045132.722243-7-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, Kees Cook <keescook@chromium.org>, cmr@codefail.de,
 npiggin@gmail.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

Optionally run W+X checks when dumping pagetable information to
debugfs' kernel_page_tables.

To use:
    $ echo 1 > /sys/kernel/debug/check_wx_pages
    $ cat /sys/kernel/debug/kernel_page_tables

and check the kernel log.  Useful for testing strict module RWX.

To disable W+X checks:
	$ echo 0 > /sys/kernel/debug/check_wx_pages

Update the Kconfig entry to reflect this.

Also fix a typo.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Russell Currey <ruscur@russell.cc>
[jpn: Change check_wx_pages to act as mode bit affecting
      kernel_page_tables instead of triggering action on its own]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: check_wx_pages now affects kernel_page_tables rather then triggers
     its own action.
---
 arch/powerpc/Kconfig.debug      |  6 ++++--
 arch/powerpc/mm/ptdump/ptdump.c | 34 ++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 3 deletions(-)

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
index aca354fb670b..6592f7a48c96 100644
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
@@ -27,6 +27,8 @@
 
 #include "ptdump.h"
 
+static bool check_wx;
+
 /*
  * To visualise what is happening,
  *
@@ -410,6 +412,9 @@ static int ptdump_show(struct seq_file *m, void *v)
 	/* Traverse kernel page tables */
 	walk_pagetables(&st);
 	note_page(&st, 0, 0, 0, 0);
+
+	if (check_wx)
+		ptdump_check_wx();
 	return 0;
 }
 
@@ -459,6 +464,33 @@ void ptdump_check_wx(void)
 	else
 		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
 }
+
+static int check_wx_debugfs_set(void *data, u64 val)
+{
+	if (val == 1ULL)
+		check_wx = true;
+	else if (val == 0ULL)
+		check_wx = false;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int check_wx_debugfs_get(void *data, u64 *val)
+{
+	*val = check_wx ? 1 : 0;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(check_wx_fops, check_wx_debugfs_get, check_wx_debugfs_set, "%llu\n");
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

