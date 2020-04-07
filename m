Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D98961A0690
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:29:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGDp0fX3zDr1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:29:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e5N9eDDR; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG092M0dzDqx0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:33 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c20so261254pfi.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=000qLJcM9UmThdlyGYrm2N/2aeTJ82pdzdzyPCumz7c=;
 b=e5N9eDDRIhykFRZE3fYZcRqMjKB02lM3k7lgMmwjh2yhCsPNWPq75xYa0W/7sfBbfB
 6c828Y6gkGgcC8qMlfh7kfotdzRC7Tg5N+88vHAGRQ7x55+LClLJAqoswz/SePUng+WA
 L5oQw8MGARA45AAgx7Z1+Y/7RyixsbW5g6jFS6kIQ0ynHG81FwBPkd48Nj7oNBKPbnFS
 2g5NckV8fM/RI3DVZUK4TqjmzWznf4Dr8GpwYzi05xrGtAX0kkjrIpz/pBZp6wRZRRwv
 y2QjuRkE70zDaBAfEMT/FnYvVd7EsUwvd3G+bLhxxAvh0uvqAsREJcN+JNoU6kMUxrTr
 kzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=000qLJcM9UmThdlyGYrm2N/2aeTJ82pdzdzyPCumz7c=;
 b=F5hmJoaBKx4rFUQiJ9/j8MSHkcUeo5Ws0yWQ1VV2eV9/1VtWQREry7jWSf9uZfIRMf
 K/wgmhYqKtDyEqg5gixw3zqAkN3VzHYNXzKh4aBqQL7YBb7AdORsJ1AavGZ0xJbtToaK
 OR+Fr+dOxlOjD7wGemi2rUv7E7iAr1xq+rwrC98T7Vxz6akTUdrZlFRHPSlxqNbwMUsM
 um0o//jsVmRrESTBZCpqwH/0UC1jGzmQ3Hn9ZT5HgHclrK+5K1fQSX1/EKeT7CA0f183
 hV4Ln+oFdddL4ECS60T3d24mVPby2oooEr5mA8L1A2iaRy+U1YjBaN/D4dI4JllAxsAC
 YWzA==
X-Gm-Message-State: AGi0PuaX1R7QF/17dZAB1fksp/o5Siaodi5CkVWZ5tvMmcGqh5d5Yhb3
 Gveqb97mOITH62Nxupq8WAKpAdvi
X-Google-Smtp-Source: APiQypIk/QxeOzepsxjvGsOzfkOEMYAQJkQS0PpUBltGT3L18MkwC7oxduBohtXXYCknkNMH7SvXdQ==
X-Received: by 2002:a63:a502:: with SMTP id n2mr298448pgf.449.1586236708986;
 Mon, 06 Apr 2020 22:18:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/15] powerpc/pseries/ras: avoid calling rtas_token in NMI
 paths
Date: Tue,  7 Apr 2020 15:16:26 +1000
Message-Id: <20200407051636.648369-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the interest of reducing code and possible failures in the
machine check and system reset paths, grab the "ibm,nmi-interlock"
token at init time.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/firmware.h    |  1 +
 arch/powerpc/platforms/pseries/ras.c   |  2 +-
 arch/powerpc/platforms/pseries/setup.c | 14 ++++++++++----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index ca33f4ef6cb4..6003c2e533a0 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -128,6 +128,7 @@ extern void machine_check_fwnmi(void);
 
 /* This is true if we are using the firmware NMI handler (typically LPAR) */
 extern int fwnmi_active;
+extern int ibm_nmi_interlock_token;
 
 extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
 
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index aa6208c8d4f0..972b95ebc867 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
  */
 static void fwnmi_release_errinfo(void)
 {
-	int ret = rtas_call(rtas_token("ibm,nmi-interlock"), 0, 1, NULL);
+	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
 	if (ret != 0)
 		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
 }
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0c8421dd01ab..dd234095ae4f 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -83,6 +83,7 @@ unsigned long CMO_PageSize = (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K);
 EXPORT_SYMBOL(CMO_PageSize);
 
 int fwnmi_active;  /* TRUE if an FWNMI handler is present */
+int ibm_nmi_interlock_token;
 
 static void pSeries_show_cpuinfo(struct seq_file *m)
 {
@@ -113,9 +114,14 @@ static void __init fwnmi_init(void)
 	struct slb_entry *slb_ptr;
 	size_t size;
 #endif
+	int ibm_nmi_register_token;
 
-	int ibm_nmi_register = rtas_token("ibm,nmi-register");
-	if (ibm_nmi_register == RTAS_UNKNOWN_SERVICE)
+	ibm_nmi_register_token = rtas_token("ibm,nmi-register");
+	if (ibm_nmi_register_token == RTAS_UNKNOWN_SERVICE)
+		return;
+
+	ibm_nmi_interlock_token = rtas_token("ibm,nmi-interlock");
+	if (WARN_ON(ibm_nmi_interlock_token == RTAS_UNKNOWN_SERVICE))
 		return;
 
 	/* If the kernel's not linked at zero we point the firmware at low
@@ -123,8 +129,8 @@ static void __init fwnmi_init(void)
 	system_reset_addr  = __pa(system_reset_fwnmi) - PHYSICAL_START;
 	machine_check_addr = __pa(machine_check_fwnmi) - PHYSICAL_START;
 
-	if (0 == rtas_call(ibm_nmi_register, 2, 1, NULL, system_reset_addr,
-				machine_check_addr))
+	if (0 == rtas_call(ibm_nmi_register_token, 2, 1, NULL,
+			   system_reset_addr, machine_check_addr))
 		fwnmi_active = 1;
 
 	/*
-- 
2.23.0

