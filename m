Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 395708125F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 08:33:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4627Ht5kfmzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 16:33:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="Eho+brQh"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46273w1s5yzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 16:22:52 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id i18so39159515pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Aug 2019 23:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwFeAlQ6IuYgXIVYtx8CQnkRCdX32iDrGGlWM20HRkk=;
 b=Eho+brQhzJydpVnUPuw9YbBLL4VaxwgoHLETt98sxch+Lo919BKFoGXOfsq8ftacph
 m4HcYoA5BQSimaMSd4rHOIIzt/ezpm/gpX0EAuy065a445CUrmQRXkRCw7AzTNpFymvX
 UfMlO5B7riL8iZYXfvoFAIEhkLmvqkPM3Uybsib5fyUqfd0shKRvhUnABa2eFP44dKzh
 6PdWuYXvzdk1P1vMY51blSUCw8TA4H42xCg9ws9uSMg7FhHjUQ3L5ywLHCWvv4gwG2To
 giDz7Lw8OUQhx1BMQ5E7wU4/UvUv2MuFfSArRKiU+vKgeAq8xYRpoIqPJ2xuNC9x340G
 09Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwFeAlQ6IuYgXIVYtx8CQnkRCdX32iDrGGlWM20HRkk=;
 b=dYedEpNhn2qo4El+trz8Z22S/r3Lv54RW9uV75TYbvsAjc9X2ITL1fMbkctOe64tKA
 aWytbW+2atORmHafeinxlN/D33Jm/zhd3nz3dJ49Y99oebffst4drtM6A05MljGQnvH0
 HJAHLIsoRCBqDI1FDQ3OsVi5MlfKJjKv8YWMUuhqaHa0tyu8ArAHhDXws+PsH7xbLKPk
 Umsow4Oq70VlaF37M4lWOqZyNucfjZuvDSh25xGShjVWSIlNJGUMGm4n+9Y8OY6LrHxm
 G9AZ4r8m/uEerGD2nlFs4PnAFGG1Pwo6AASEbmD2pY53MSXxpD9Z0cEcHYxP0CxweT9A
 5VpQ==
X-Gm-Message-State: APjAAAXaC2vxxQaElFDzV6q8vJ9tqsHub9fEPQYrgzoElZ7dDxAgFzpD
 wnLWCHBp/eIIAkvV9WdW3PPhFqgDw9s=
X-Google-Smtp-Source: APXvYqx7K+ONyEzdf0Lqszdy5CwUdI5/P0s0j8L1dhasXmKvbPzGbzeYcM4vVZlMnCnJpuYA3ucrxQ==
X-Received: by 2002:aa7:8102:: with SMTP id b2mr30531102pfi.105.1564986169679; 
 Sun, 04 Aug 2019 23:22:49 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.66])
 by smtp.gmail.com with ESMTPSA id i14sm124680082pfk.0.2019.08.04.23.22.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 23:22:49 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/7] extable: Add function to search only kernel exception
 table
Date: Mon,  5 Aug 2019 11:52:22 +0530
Message-Id: <20190805062225.4354-5-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805062225.4354-1-santosh@fossix.org>
References: <20190805062225.4354-1-santosh@fossix.org>
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
search_exception_tables cannot be called because it also searches the module
exception tables if entry is not found in the kernel exception table.

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

