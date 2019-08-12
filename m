Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D9C899DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 11:32:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466Vxd3JmtzDqVk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 19:32:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="e0nDDZkG"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Vkj2dnnzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 19:23:09 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t132so49172219pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NE1NaEdbx0Ad3W/X+QOOKHTKwGbGj5XSKxU/TTh8Rxs=;
 b=e0nDDZkGKhyiN7ucCz0CdI9M1/9R9UME8nCcYwuYHM2dvmt9pHIIz0kVBZQMlKczx+
 p3/nBcij6anVq1eRVAuqtUNYvWmnL1/NASB4qEVMfVivaW2DcOm19s2dDP4t8XYxILom
 WYnMYtlAJJ03e8tE0K7CTnMFdrLOF+93r5ym689kXw1YjE+hEHlLCP2CNwRI6xIXV1oA
 v54rqtzCUCfYt92lnRiWkOJVstpX3BMkpuOWmMdef32vWeutbxfr2IM9+jJuO7pIG3bl
 z4OE7zB1kNIU4+MeCBps7LNBawhpNIo5j09tx6903NJlu69eLcYR4MUTcPZuhzc2SVX5
 PVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NE1NaEdbx0Ad3W/X+QOOKHTKwGbGj5XSKxU/TTh8Rxs=;
 b=m8l7eCI+4pwm5q1Qez4HwBKjKhB7o9i/7mtBaM8qYzDAJPPOiFOxWthKrALCQghTQF
 zjXz8IFJPCSKkJhHIsHaQzqCxgiPZ0VTVJgq7o8sGaLlyjmn2VY19DrLtUeuJDqzh28o
 skGyE+hQM7l3ewWbLRDhpWocxv7gbh4B0Q+LKHDGCI2R0eGUqd9UDUH51uVaAGexopDL
 /3EtSLqRObclrENtn2jFAnJ4hSmyqbKyZ9Sw2azzkpJrsGmobMi+ONRV51EUdKytBB+f
 kP3/KFus1RuSaLY5hl9aruReNpR8MqeXw9Z3SE/prLHRnyJjkh430e5whbpd2MW0xhzb
 hWEg==
X-Gm-Message-State: APjAAAVw8sfruY9F81SN4TOLuaad+dG9hX7HA1bGFzd+lrF+z32OPDwS
 GRsDjHeXX1wGdKiE/zSgZYK4RyffLEzkbA==
X-Google-Smtp-Source: APXvYqzRCnFEuHoEbfb5ReRDBlw/PEuENuNyKapRe69MEZX2MkBDJynghVq3E/2gP2NsRcqf5LYJ4Q==
X-Received: by 2002:a63:e807:: with SMTP id s7mr28474428pgh.194.1565601786689; 
 Mon, 12 Aug 2019 02:23:06 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.75])
 by smtp.gmail.com with ESMTPSA id y188sm10543517pfb.115.2019.08.12.02.23.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 02:23:06 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 4/7] extable: Add function to search only kernel exception
 table
Date: Mon, 12 Aug 2019 14:52:33 +0530
Message-Id: <20190812092236.16648-5-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812092236.16648-1-santosh@fossix.org>
References: <20190812092236.16648-1-santosh@fossix.org>
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
2.21.0

