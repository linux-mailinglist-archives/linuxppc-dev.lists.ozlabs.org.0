Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7AE187BCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:14:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hSDJ6NZTzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:14:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hx3Kungp; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hS7N3nfCzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:10:24 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 3so3748564pff.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dne2FYboYRGkTTCFl4cucL/oOgiBdHvSMQ950WlMzl8=;
 b=Hx3Kungpoy+CX/hSKwY8rw7qBiJE0ZICiteGkMo+L1ti7JkVzRKmf9W0ogcONeJGn8
 Jq28OdDt0TlleH7X8NmE7GSNlukPULgAXYBurjJ2RgDinIdyq9sFUq9hfAKFS3QZKEv3
 p8Ihrr7G7Ke0tpNgUR36fV+T5SczSuLbXAa12rqCqR/sjEwTCTBLoREo3xay9Z9oezeG
 hjJ1W96pKADsBizifcHY1xhJbrBAtldYTY5tgP9u0FXvtYrGtlXpJyjaqsUuw6LhrzQD
 KxOcp/UyDVV+QrQ960FjWcMKilyc4mcHP7u24doM6A04VHUzw+KVYyqtBCm0J7n2R5XC
 7pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dne2FYboYRGkTTCFl4cucL/oOgiBdHvSMQ950WlMzl8=;
 b=VCKxlb8708LW5LlsgwWxZbtbZhI2l3KpN0/rrgdKcEXuM4efwiCFOjBd9cC4LY2lZV
 gbx7sxd2BcHT4Sv4VrQf9ViMy832GDeW06UmUNYKzjvP2f+TMn9dhEcIRG3UG8dDcX/9
 B9x9PUa8+8FNWGARhR8lcroxc1mCrAxaonxpaqoW3YF+efZ5DDCDuQnUx9XxZYlu9qEW
 Eo+BttLbs5Yrqq1ETCJZw8pWPvm5hynxj8yICmSE3r9rN22ydRL/dZqOYeL/oWkjh0nH
 fvMzRYetE48qENoPuccI3XgQqFbisRjkJGNxblMgcIRBes0J5NYvNn7qJAGc1/z349pG
 RBJA==
X-Gm-Message-State: ANhLgQ2a8r9+DYCVQafSYTG1g83Ppmfggab/NDaeQALRCDfed2nYeb2E
 GaQ0GidkuFUG7Ybll1n6BLnc0eW1
X-Google-Smtp-Source: ADFU+vuKoZVouBNRyyTxgXvx/Bni6OnCK5W3TCCLaqZnu6ZeubgsHJmth1L+yTyiQ32m7WvkdDppMw==
X-Received: by 2002:a63:7359:: with SMTP id d25mr3938896pgn.2.1584436221387;
 Tue, 17 Mar 2020 02:10:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i13sm2463745pfd.180.2020.03.17.02.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:10:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/7] powerpc/pseries/ras: avoid calling rtas_token in NMI paths
Date: Tue, 17 Mar 2020 19:09:08 +1000
Message-Id: <20200317090913.343097-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317090913.343097-1-npiggin@gmail.com>
References: <20200317090913.343097-1-npiggin@gmail.com>
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
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the interest of reducing code and possible failures in the
machine check and system reset paths, grab the "ibm,nmi-interlock"
token at init time.

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
index 17d17f064a2d..c31acd7ce0c0 100644
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

