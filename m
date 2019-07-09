Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 186C6635E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 14:30:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jhV31QxmzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 22:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="WEJjn3sL"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jh9x3VrTzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 22:16:05 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id b7so10013779pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 05:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/D6q9IqqnCEzUrYRXPENA3CK9dVtXBM9qraf2QWS3cw=;
 b=WEJjn3sLVMMM3G8F3q0pi5X+7zVo+wy1uS2MncY8uprFUFCsiDqJn7M0uGznLEo9k1
 zTWo+dAv6u+rHQ4QFhWqEAEKtkPFA5bxtJ1kmTL6PVrfjoDjGnOpwZBu+UcLaES1NRuh
 jp4rGE4KUTOIVMa9e+XvozV5BvHS/2k5bBSW85BmmIBbfmnk7NInLhR2SLvCyeTWzoWD
 ZTbFqdJajckNS54NRHSMJKq0VZ3cK4JUqET1JUmUqRs1HUaefEkP0LasrySTbpnFg6FJ
 pSmjS1GiBLfd1kD82Lco3aQyd2FeOHcB8o0pj9a0dKmK2zr0UV0qoVqgOCcCu1M8SIcD
 +7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/D6q9IqqnCEzUrYRXPENA3CK9dVtXBM9qraf2QWS3cw=;
 b=uCzGqk3oC+ut5NbQ+r/owXFvsR193q06VzlyxI5f+yw7nfmhxN2zDzXHwAFzBOdF/8
 aUbvB/XTnElcUvbK461NjeJ4hVhLrDemD04tJePEO+zxsjgWdHQjGHojYX4N3HcbhWo2
 VJ0jEThorWCUXbCDuerTtNUfDceBede5vpZrRScMQfht+yZY42vEXC0cj6QRogQBeoLa
 ixIvo99Qcy+T655BYSHyHn84bo0UqDV2eUbM2+x5aHuksTi+P3rTphSsyqB/2OTy52/j
 l5b/sY5SSIaBJOVovmXnPmAp8ZBQAFh0b7FnO3VjZ7NqWkzYgcnxoXnIzUGFR2/E/vZG
 xq/Q==
X-Gm-Message-State: APjAAAVSP+JCK/X3Rm74YE3piuL5UymCBicZqyWeECZAmv/sIM416sHY
 0cQ7NGqOFbtGpFjd28pBds0h3XM+CJ5R2nN2
X-Google-Smtp-Source: APXvYqxLH/fsm+5ph64L/SdYOrJ1SjqBJSSYJsWOK2/V2bl4VN5e1fFMneN0NSUGDoXmU6TsAaIQkA==
X-Received: by 2002:a17:902:204:: with SMTP id
 4mr31128589plc.178.1562674563091; 
 Tue, 09 Jul 2019 05:16:03 -0700 (PDT)
Received: from santosiv.in.ibm.com ([223.186.121.175])
 by smtp.gmail.com with ESMTPSA id o15sm21243933pgj.18.2019.07.09.05.15.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 05:16:02 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v5 4/6] extable: Add function to search only kernel exception table
Date: Tue,  9 Jul 2019 17:45:22 +0530
Message-Id: <20190709121524.18762-5-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709121524.18762-1-santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
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

In real mode, the search_exception tables cannot be called because
it also searches the module exception tables if entry is not found
in the kernel exception tables.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 include/linux/extable.h |  2 ++
 kernel/extable.c        | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/linux/extable.h b/include/linux/extable.h
index 41c5b3a25f67..0c2819ba67f0 100644
--- a/include/linux/extable.h
+++ b/include/linux/extable.h
@@ -19,6 +19,8 @@ void trim_init_extable(struct module *m);
 
 /* Given an address, look for it in the exception tables */
 const struct exception_table_entry *search_exception_tables(unsigned long add);
+const struct
+exception_table_entry *search_kernel_exception_table(unsigned long addr);
 
 #ifdef CONFIG_MODULES
 /* For extable.c to search modules' exception tables. */
diff --git a/kernel/extable.c b/kernel/extable.c
index e23cce6e6092..6d544cb79fff 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -40,13 +40,23 @@ void __init sort_main_extable(void)
 	}
 }
 
-/* Given an address, look for it in the exception tables. */
+/* For the given address, look for it in the kernel exception table */
+const
+struct exception_table_entry *search_kernel_exception_table(unsigned long addr)
+{
+	return search_extable(__start___ex_table,
+			      __stop___ex_table - __start___ex_table, addr);
+}
+
+/*
+ * Given an address, look for it in the kernel and the module exception
+ * tables.
+ */
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

