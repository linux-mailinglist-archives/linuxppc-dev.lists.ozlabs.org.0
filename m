Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 652588E228
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:51:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4687Dc6nc8zDr37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:51:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="kx/F92EI"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4686zz0xvYzDr0l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:40:15 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id i30so387297pfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NE1NaEdbx0Ad3W/X+QOOKHTKwGbGj5XSKxU/TTh8Rxs=;
 b=kx/F92EIvgVscq26b9mG+oTWkqgH/UgDixb/knVX7AKbZH7UAYjDIAtgmZWN+eEkWC
 QTkpGbyUgPR11u689ZLX0Q1GduPOp13mmdJ/8+yoUETL2QlqysyvxcUH937IqsR8eZTi
 yEKcQ7H7T5fb0YSiRhdxVz3YXtysDzqXQWWje5JWdEQo5XA/RzXmel/vZdHWKeDf9xwy
 es5sisvD5LiTRbegfRlaSRJkq9upAOlAsqQZpkNqBjXWEzbmjOiOE0tuq5B8ot723oO1
 Oq9MkRN3zqftLcjqZYQAxd6H57WVU3RPzdHWgEAMlJ2KScV9HVT2T9XTa/Rwi+ykxz8M
 LZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NE1NaEdbx0Ad3W/X+QOOKHTKwGbGj5XSKxU/TTh8Rxs=;
 b=AAqIB2pl1+sixNm1C4tiyO3VgOp/FW8bz6ukZa8+oSrkVg09v/cghiKw6bjHfWRwdq
 iirST+2/7L6nyPHxI7U1vbWg5gyc1J5fY6GuujqnI2ncX62+5eBqjb/DJSssdbcjBErj
 BOwdF9USmodnWdusn7gB387yqeWbtR+kmReAP1nt13IJy3MEpoGTg53tOrpBUhrlqDNa
 csjGekydBTtrSoBft4HhYHHdVyaA+WT2hLGHC2E7VvYYSor8tliD7NWugzEm4vG4TjXI
 Zjn9+pedAd5omIPANGVm5wZgnqfPh+p3N5oZ6Sytex5dg8xZRXfCpDrbP709nDHS43UC
 ycZg==
X-Gm-Message-State: APjAAAVMbBxAhL2LDnzAa5EJc+NWNL1xQCrvARCTBGn4+Mi7uK4Xr5PQ
 5zzMwv43IsQ0Z3SRLsC0Bl8/2AhDqJGWZQ==
X-Google-Smtp-Source: APXvYqyh9hz5oxKLPRj0zyZyWCZYkTrZdDpWsxydX7vVAWAjqbfcxklr2+JBF6YDzYoBBp3i6GYzUQ==
X-Received: by 2002:a63:58c:: with SMTP id 134mr1598098pgf.106.1565829612820; 
 Wed, 14 Aug 2019 17:40:12 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id g8sm815917pgk.1.2019.08.14.17.40.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:40:12 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 4/7] extable: Add function to search only kernel exception
 table
Date: Thu, 15 Aug 2019 06:09:38 +0530
Message-Id: <20190815003941.18655-5-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815003941.18655-1-santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
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
 Chandan Rajendra <chandan@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Reza Arbab <arbab@linux.ibm.com>, Ingo Molnar <mingo@kernel.org>
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

