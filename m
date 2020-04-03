Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBFC19D801
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:53:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v1bm4wqmzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 00:53:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qAHW1Yit; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11c5xndzDrfT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:00 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id c23so3515617pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFpUU+o0mzvW30vjII+BqNpnNgyGiMXC6vjgaoJYz/A=;
 b=qAHW1YitfbFANghV1k8Qo077xx3mCXz6Kz6WOKehcgfNKVGZB9me+pNmesbYsRdXRh
 Se15WSARlcXJiuAMJ+B9w6RjC3C//870h3UgguxxKMxnmD07c0FxDLNeJqisKw6GgT51
 2lb7l617RJPf8mTmTI77csBlmLNpErxYw0TB5hPRDUV6IISl9rQAc9dsyba2vg9G5rmR
 jHC6TnmLp3QiDxQDslR6+1qJRQu2mFPfv2wcTi1RZ3Bgr4AsMn+X03WKazmT8iwA/Rkp
 kZfCWSlWQxLDHaFjiSsJ14hrLrfFQx81W6F6iZ2+p0j9v4WaEZxJYAhUEf5a5nXLd2Rr
 qnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFpUU+o0mzvW30vjII+BqNpnNgyGiMXC6vjgaoJYz/A=;
 b=LXZA1FOeodQwJNCJjbMCRroyCLY894HqLiEqSK1wwvk6jt7jPhBBBaxW1KwDMtZhR3
 cciHbF4TRzz5IGlcE+odXQLDNFK4GV4hrMWPYeYuOrWYCfoqmALZDMttbvjf0S3djLpH
 x69TkWaTCiFzExnUseslqkIRGcL+YbXKsufX/0WDLYZNDDIgHZ/NQrYlTnadvjMkj/7Y
 /QgxbLhWfXLQcVStVsPyNfs15yHAMA39cPBSpOON3RJAxD0DS1ZutftQlNqCWScqiCIn
 q4ZmzzDi+Hw7BSb7eQ9e7fvLTkYdM9II/Z8RabDW1yvAxf8UEWKa6F56C1zpLuxYL8oc
 Ap+g==
X-Gm-Message-State: AGi0PubRJD+2te/p6A+Byn4q0s0u4EvhulO3p4KAQc1sNchi2ynivEDd
 /9WamfN+h21yBCqYsyAE2aZGvkyu
X-Google-Smtp-Source: APiQypKrrQxn9KADeGqymB7ZsQkRrLQwYSOCVMjzQBV298pIyEYYDjaR6pWgHzjacPPe3X9sRzIiDQ==
X-Received: by 2002:a65:5881:: with SMTP id d1mr8183378pgu.378.1585920417467; 
 Fri, 03 Apr 2020 06:26:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:26:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/14] powerpc/pseries/ras: avoid calling rtas_token in NMI
 paths
Date: Fri,  3 Apr 2020 23:26:13 +1000
Message-Id: <20200403132622.130394-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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
 arch/powerpc/platforms/pseries/setup.c | 13 ++++++++++---
 3 files changed, 12 insertions(+), 4 deletions(-)

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
index 1d7f973c647b..c74d5e740922 100644
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
index 0c8421dd01ab..b582198be284 100644
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
@@ -123,7 +129,8 @@ static void __init fwnmi_init(void)
 	system_reset_addr  = __pa(system_reset_fwnmi) - PHYSICAL_START;
 	machine_check_addr = __pa(machine_check_fwnmi) - PHYSICAL_START;
 
-	if (0 == rtas_call(ibm_nmi_register, 2, 1, NULL, system_reset_addr,
+	if (0 == rtas_call(ibm_nmi_register_token, 2, 1, NULL,
+				system_reset_addr,
 				machine_check_addr))
 		fwnmi_active = 1;
 
-- 
2.23.0

