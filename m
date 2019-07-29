Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2F783D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 06:08:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xmPY50mbzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 14:08:01 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="Fxecae3x"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xmDy33pZzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 14:00:34 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c2so26924684plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 21:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwFeAlQ6IuYgXIVYtx8CQnkRCdX32iDrGGlWM20HRkk=;
 b=Fxecae3xqy40byOksy98DwNVQZN9qFp551/NzOq4Phfam/XCTu8WtrrY9s7mcvzImk
 itO4BzaScGz+GvMdZa7H/D/FY/x6QxGFFyXZsQ14s8Ag2WVDs3skBoFUm26JbkETCnTw
 3gQBqiMBDiaj9rHv115aLNkBhy9u6NxJM0BUOlAqy6/jCBxC0I2gmFKH6ZLryt/2rPS0
 p9CB+O6XR91xwhNaHA4NNm7HTU8TIbLb+VHLIMcDBvA3dggBXDeh8PdrCKNHyGIGRnF+
 XbQY3NB+55neS3Ior5YC6LyYP7XPc5wkdTY4ig1waWnr8sJC9+5GqFASHeWnWsANL8r8
 gk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwFeAlQ6IuYgXIVYtx8CQnkRCdX32iDrGGlWM20HRkk=;
 b=JCCiKCqMHXw8EoTMFfgYCxdsUlGjOvmg3ZiAG4zi/9cj95+bjmpjO0at1Xgjdh8EnV
 Z4amrGD4Kic2fR9P1vyRQtiOdt3oNyXoOPFZlUNV1ZfErxRHjlL0LwCHcrz5sy2vE8bY
 ADPr+H6kZ1psvYc6N3kye95bRDhg3v/umpsSvNign8H8EPSslN5YKpUALhcs6H+AXVV0
 WFmkUHnuSVwZ2JpvPg23R9R+a1se+ZLvurpRO/TTNEBAD/z7V0K/6K1suPW5s35hRq11
 vpgz8+A5f+Ve1JhGAgkRcHnU8KvhhBG2QczDrj4jUPIoDGKG2DWqH3kNLBpJwZFTAZCS
 ElJg==
X-Gm-Message-State: APjAAAW1hZGx7cJWVpgWe18QCPIWtsb12if9DRQORb0ov1y9/AuXnl3U
 WSTCFbJXmAOExXvDHGPXyvsDtNzhMuE=
X-Google-Smtp-Source: APXvYqwd9R3GmaUpLLYf1lGgzZM9NR9zEJpKD3gBITjlGHlKJVGKj9KGuL6LQrtgghl/lRVO+1wXfg==
X-Received: by 2002:a17:902:b582:: with SMTP id
 a2mr109947123pls.128.1564372831045; 
 Sun, 28 Jul 2019 21:00:31 -0700 (PDT)
Received: from santosiv.in.ibm.com ([183.82.17.52])
 by smtp.gmail.com with ESMTPSA id g1sm100033948pgg.27.2019.07.28.21.00.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 21:00:30 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v6 3/6] extable: Add function to search only kernel exception table
Date: Mon, 29 Jul 2019 09:30:08 +0530
Message-Id: <20190729040011.5086-4-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729040011.5086-1-santosh@fossix.org>
References: <20190729040011.5086-1-santosh@fossix.org>
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

