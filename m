Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A0784F79
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 17:09:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463Zg80zWwzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 01:09:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="KVVHNX5J"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463ZNr0RDnzDqnn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 00:57:31 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id k8so41231265plt.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2019 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCjlN6WUVTqi9Ls8DV65kSTfioWg+e5KAofys5HWp+8=;
 b=KVVHNX5JdgxTMcjfH2tXB/29kUpAfAhrmRoufpzO/vtZ+qISQnJpPJLnpWCoPCzTMN
 XfnRticIn8zT0uTjjmBEV9iB7ftUuef53x68wIjX4F6D7OwQnzfMyBJvyza0UESjjVN5
 0t7qBjnklPraDRg4XG8rqnojS3soobzpNE4PR0V5tJ3MkBLvx8u6pppKqee2H/mz0huX
 W/kBRB3alG00YfDaJoi3BEVZtip71Afa/UFamFeqwMoLULNzSRXbi3ymWfSG+7XMPJER
 c3C29nDYU8CTMWY0Vr/k3Haoxl9zrW+zoqLYJPvxXmnM+ge5crRQcBmTdqnDkD5CReHD
 n6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCjlN6WUVTqi9Ls8DV65kSTfioWg+e5KAofys5HWp+8=;
 b=BxI8sps+zgCvkyXb19BHzx94Gam2zRqo65GAS1I7OXgI7Gb56lDqN/rrf/Pgt+Is9m
 0A1Ytfu1lbGJyOgD6QPV1f3CQig+pSnpdeg5gYwi17K1E3OzQU7VfnnaYAJ461gIew72
 s3G8TzuzXJSUKgkyrkDpKcgVkWQ3Sfy2tWLFVKA07W6GAqmojZIz089GyTemKGIjlWSO
 j/W0ZaZk5KAdq+cC2bBBLRD8SAqZWvmnp5FMsPwk8pUI9ILBJQbEo6V4W6eeQg1iBsIz
 ZH772inteaPt+P/rLjAUvH4LDDGVAI34oKdGFWHD6N1ffYw43iNOQsuAyKbnTAnyxtKB
 RoRA==
X-Gm-Message-State: APjAAAX0ajQjNo2ZpIA9TgF1MFB5Cxolo14oQ6GpNrhhNmJrscfyfA/F
 adc15cIVGqB22gqhH6GURsbq0NYB39vtrA==
X-Google-Smtp-Source: APXvYqwgdGhG+bvstw2uSm2Nqd/uqXQrbMhYKPt9/CeAGqfLRAOLhojclnU6sDuu6tNz/RCahuCq7Q==
X-Received: by 2002:a17:902:8490:: with SMTP id
 c16mr8748173plo.1.1565189849100; 
 Wed, 07 Aug 2019 07:57:29 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([183.82.17.96])
 by smtp.gmail.com with ESMTPSA id l4sm93617475pff.50.2019.08.07.07.57.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:57:28 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 4/7] extable: Add function to search only kernel exception
 table
Date: Wed,  7 Aug 2019 20:26:57 +0530
Message-Id: <20190807145700.25599-5-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807145700.25599-1-santosh@fossix.org>
References: <20190807145700.25599-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Certain architecture specific operating modes (e.g., in powerpc machine
check handler that is unable to access vmalloc memory), the
search_exception_tables cannot be called because it also searches the
module exception tables if entry is not found in the kernel exception
table.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/extable.h |  2 ++
 kernel/extable.c        | 11 +++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/extable.h b/include/linux/extable.h
index 41c5b3a25f67..81ecfaa83ad3 100644
--- a/include/linux/extable.h
+++ b/include/linux/extable.h
@@ -19,6 +19,8 @@ void trim_init_extable(struct module *m);
 
 /* Given an address, look for it in the exception tables */
 const struct exception_table_entry *search_exception_tables(unsigned long add);
+const struct exception_table_entry *
+search_kernel_exception_table(unsigned long addr);
 
 #ifdef CONFIG_MODULES
 /* For extable.c to search modules' exception tables. */
diff --git a/kernel/extable.c b/kernel/extable.c
index e23cce6e6092..f6c9406eec7d 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -40,13 +40,20 @@ void __init sort_main_extable(void)
 	}
 }
 
+/* Given an address, look for it in the kernel exception table */
+const
+struct exception_table_entry *search_kernel_exception_table(unsigned long addr)
+{
+	return search_extable(__start___ex_table,
+			      __stop___ex_table - __start___ex_table, addr);
+}
+
 /* Given an address, look for it in the exception tables. */
 const struct exception_table_entry *search_exception_tables(unsigned long addr)
 {
 	const struct exception_table_entry *e;
 
-	e = search_extable(__start___ex_table,
-			   __stop___ex_table - __start___ex_table, addr);
+	e = search_kernel_exception_table(addr);
 	if (!e)
 		e = search_module_extables(addr);
 	return e;
-- 
2.20.1

