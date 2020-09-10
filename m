Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78382263CC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 07:53:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7My3Qk7zDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:53:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bdBlo1w/; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Ck35z4zDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:45:54 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id l191so3643082pgd.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8LbWJcYWp+sA/luW3wR/BtuDPwIW9fptoPje7qw8n0=;
 b=bdBlo1w/CMjZZyjo4eIFUoW1pAz7BFAuVk9meAmXBMfMppxTMwTtVBoYN3YyWG4GVt
 504cjOGKo9A8I1ZgBjmrPUCU1+PksvQKUm1KwIDyDtTGZE4sEwEPAvPxRRrWXJ0xYoqi
 sEAa+Z6Wou6nZIsqBJwSVBeZont0aMLJ07ShTv0NmVZHjuAQnSfuMcLUNRoGGivpMb6/
 56sjlyQv/NyaQkK0mxQVuCJ94v63EeS4mHlVkfKz6dUcV1eEu0Ou8vWv+X6ew0blGbx5
 HCnnIBp5yFo99ZNNOBDVLrmhcD1LMQqK2ZpOcJoGPW+IlcC8isYbFVwcAs9aHhqA4aKQ
 kROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8LbWJcYWp+sA/luW3wR/BtuDPwIW9fptoPje7qw8n0=;
 b=jtNfxwQLRm+OJjuhBiI8b98Z98cYP3fc0mIyku5o7eMjnJ2PuVjDNhYBcYcrGROX8L
 9cyHITQKPF0Fx6mpClW4tL3zE7M8hwdAfs+sDwyMdYZ5AHIUEmgf1nqO6JZxquIggyFX
 RbxQgfht+dEeQuDPAyUs07eigcNoiiOI4bcAyAtYeSumUaaOGLygQEL34YLJ89UmAmtR
 dik22VGZCIYxr35YOXUrI3RwuriUDpfVvwhPMs2onfR2ncicI8BiaMxLmQcR55R+hmaq
 S8zCCHhMZz8Qn0vSpq7OqZ5T0u7178F0/742SfgBjo2JELf/h0qxCLJseLPRHYN8H7CN
 i6dw==
X-Gm-Message-State: AOAM533QeB5mDqBx18ePPeA6eDDhj+Nc/Eoa+PRbVqJzWptSlVfGgDJW
 fnr/TR91MuHegGEYlJgQfesnOLKWP3adOw==
X-Google-Smtp-Source: ABdhPJxBQuRDW3tBLv2huKri9QvTzNsfskkjcS8zdg3+t8NyDY6Hwk43IBRg1d++rzWNEONMvVhXOg==
X-Received: by 2002:aa7:9409:: with SMTP id x9mr4038827pfo.142.1599716751795; 
 Wed, 09 Sep 2020 22:45:51 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:45:51 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/9] powerpc/pseries: Stop using eeh_ops->init()
Date: Thu, 10 Sep 2020 15:45:26 +1000
Message-Id: <20200910054532.2043724-4-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910054532.2043724-1-oohall@gmail.com>
References: <20200910054532.2043724-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fold pseries_eeh_init() into eeh_pseries_init() rather than having
eeh_init() call it via eeh_ops->init(). It's simpler and it'll let us
delete eeh_ops.init.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 155 +++++++++----------
 1 file changed, 71 insertions(+), 84 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 3cc569e8b6d4..fd3444428632 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -239,88 +239,6 @@ static unsigned char slot_errbuf[RTAS_ERROR_LOG_MAX];
 static DEFINE_SPINLOCK(slot_errbuf_lock);
 static int eeh_error_buf_size;
 
-/**
- * pseries_eeh_init - EEH platform dependent initialization
- *
- * EEH platform dependent initialization on pseries.
- */
-static int pseries_eeh_init(void)
-{
-	struct pci_controller *phb;
-	struct pci_dn *pdn;
-	int addr, config_addr;
-
-	/* figure out EEH RTAS function call tokens */
-	ibm_set_eeh_option		= rtas_token("ibm,set-eeh-option");
-	ibm_set_slot_reset		= rtas_token("ibm,set-slot-reset");
-	ibm_read_slot_reset_state2	= rtas_token("ibm,read-slot-reset-state2");
-	ibm_read_slot_reset_state	= rtas_token("ibm,read-slot-reset-state");
-	ibm_slot_error_detail		= rtas_token("ibm,slot-error-detail");
-	ibm_get_config_addr_info2	= rtas_token("ibm,get-config-addr-info2");
-	ibm_get_config_addr_info	= rtas_token("ibm,get-config-addr-info");
-	ibm_configure_pe		= rtas_token("ibm,configure-pe");
-
-	/*
-	 * ibm,configure-pe and ibm,configure-bridge have the same semantics,
-	 * however ibm,configure-pe can be faster.  If we can't find
-	 * ibm,configure-pe then fall back to using ibm,configure-bridge.
-	 */
-	if (ibm_configure_pe == RTAS_UNKNOWN_SERVICE)
-		ibm_configure_pe 	= rtas_token("ibm,configure-bridge");
-
-	/*
-	 * Necessary sanity check. We needn't check "get-config-addr-info"
-	 * and its variant since the old firmware probably support address
-	 * of domain/bus/slot/function for EEH RTAS operations.
-	 */
-	if (ibm_set_eeh_option == RTAS_UNKNOWN_SERVICE		||
-	    ibm_set_slot_reset == RTAS_UNKNOWN_SERVICE		||
-	    (ibm_read_slot_reset_state2 == RTAS_UNKNOWN_SERVICE &&
-	     ibm_read_slot_reset_state == RTAS_UNKNOWN_SERVICE)	||
-	    ibm_slot_error_detail == RTAS_UNKNOWN_SERVICE	||
-	    ibm_configure_pe == RTAS_UNKNOWN_SERVICE) {
-		pr_info("EEH functionality not supported\n");
-		return -EINVAL;
-	}
-
-	/* Initialize error log lock and size */
-	spin_lock_init(&slot_errbuf_lock);
-	eeh_error_buf_size = rtas_token("rtas-error-log-max");
-	if (eeh_error_buf_size == RTAS_UNKNOWN_SERVICE) {
-		pr_info("%s: unknown EEH error log size\n",
-			__func__);
-		eeh_error_buf_size = 1024;
-	} else if (eeh_error_buf_size > RTAS_ERROR_LOG_MAX) {
-		pr_info("%s: EEH error log size %d exceeds the maximal %d\n",
-			__func__, eeh_error_buf_size, RTAS_ERROR_LOG_MAX);
-		eeh_error_buf_size = RTAS_ERROR_LOG_MAX;
-	}
-
-	/* Set EEH probe mode */
-	eeh_add_flag(EEH_PROBE_MODE_DEVTREE | EEH_ENABLE_IO_FOR_LOG);
-
-	/* Set EEH machine dependent code */
-	ppc_md.pcibios_bus_add_device = pseries_pcibios_bus_add_device;
-
-	if (is_kdump_kernel() || reset_devices) {
-		pr_info("Issue PHB reset ...\n");
-		list_for_each_entry(phb, &hose_list, list_node) {
-			pdn = list_first_entry(&PCI_DN(phb->dn)->child_list, struct pci_dn, list);
-			addr = (pdn->busno << 16) | (pdn->devfn << 8);
-			config_addr = pseries_eeh_get_config_addr(phb, addr);
-			/* invalid PE config addr */
-			if (config_addr == 0)
-				continue;
-
-			pseries_eeh_phb_reset(phb, config_addr, EEH_RESET_FUNDAMENTAL);
-			pseries_eeh_phb_reset(phb, config_addr, EEH_RESET_DEACTIVATE);
-			pseries_eeh_phb_configure_bridge(phb, config_addr);
-		}
-	}
-
-	return 0;
-}
-
 static int pseries_eeh_cap_start(struct pci_dn *pdn)
 {
 	u32 status;
@@ -967,7 +885,6 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
-	.init			= pseries_eeh_init,
 	.probe			= pseries_eeh_probe,
 	.set_option		= pseries_eeh_set_option,
 	.get_state		= pseries_eeh_get_state,
@@ -992,7 +909,77 @@ static struct eeh_ops pseries_eeh_ops = {
  */
 static int __init eeh_pseries_init(void)
 {
-	int ret;
+	struct pci_controller *phb;
+	struct pci_dn *pdn;
+	int ret, addr, config_addr;
+
+	/* figure out EEH RTAS function call tokens */
+	ibm_set_eeh_option		= rtas_token("ibm,set-eeh-option");
+	ibm_set_slot_reset		= rtas_token("ibm,set-slot-reset");
+	ibm_read_slot_reset_state2	= rtas_token("ibm,read-slot-reset-state2");
+	ibm_read_slot_reset_state	= rtas_token("ibm,read-slot-reset-state");
+	ibm_slot_error_detail		= rtas_token("ibm,slot-error-detail");
+	ibm_get_config_addr_info2	= rtas_token("ibm,get-config-addr-info2");
+	ibm_get_config_addr_info	= rtas_token("ibm,get-config-addr-info");
+	ibm_configure_pe		= rtas_token("ibm,configure-pe");
+
+	/*
+	 * ibm,configure-pe and ibm,configure-bridge have the same semantics,
+	 * however ibm,configure-pe can be faster.  If we can't find
+	 * ibm,configure-pe then fall back to using ibm,configure-bridge.
+	 */
+	if (ibm_configure_pe == RTAS_UNKNOWN_SERVICE)
+		ibm_configure_pe	= rtas_token("ibm,configure-bridge");
+
+	/*
+	 * Necessary sanity check. We needn't check "get-config-addr-info"
+	 * and its variant since the old firmware probably support address
+	 * of domain/bus/slot/function for EEH RTAS operations.
+	 */
+	if (ibm_set_eeh_option == RTAS_UNKNOWN_SERVICE		||
+	    ibm_set_slot_reset == RTAS_UNKNOWN_SERVICE		||
+	    (ibm_read_slot_reset_state2 == RTAS_UNKNOWN_SERVICE &&
+	     ibm_read_slot_reset_state == RTAS_UNKNOWN_SERVICE)	||
+	    ibm_slot_error_detail == RTAS_UNKNOWN_SERVICE	||
+	    ibm_configure_pe == RTAS_UNKNOWN_SERVICE) {
+		pr_info("EEH functionality not supported\n");
+		return -EINVAL;
+	}
+
+	/* Initialize error log lock and size */
+	spin_lock_init(&slot_errbuf_lock);
+	eeh_error_buf_size = rtas_token("rtas-error-log-max");
+	if (eeh_error_buf_size == RTAS_UNKNOWN_SERVICE) {
+		pr_info("%s: unknown EEH error log size\n",
+			__func__);
+		eeh_error_buf_size = 1024;
+	} else if (eeh_error_buf_size > RTAS_ERROR_LOG_MAX) {
+		pr_info("%s: EEH error log size %d exceeds the maximal %d\n",
+			__func__, eeh_error_buf_size, RTAS_ERROR_LOG_MAX);
+		eeh_error_buf_size = RTAS_ERROR_LOG_MAX;
+	}
+
+	/* Set EEH probe mode */
+	eeh_add_flag(EEH_PROBE_MODE_DEVTREE | EEH_ENABLE_IO_FOR_LOG);
+
+	/* Set EEH machine dependent code */
+	ppc_md.pcibios_bus_add_device = pseries_pcibios_bus_add_device;
+
+	if (is_kdump_kernel() || reset_devices) {
+		pr_info("Issue PHB reset ...\n");
+		list_for_each_entry(phb, &hose_list, list_node) {
+			pdn = list_first_entry(&PCI_DN(phb->dn)->child_list, struct pci_dn, list);
+			addr = (pdn->busno << 16) | (pdn->devfn << 8);
+			config_addr = pseries_eeh_get_config_addr(phb, addr);
+			/* invalid PE config addr */
+			if (config_addr == 0)
+				continue;
+
+			pseries_eeh_phb_reset(phb, config_addr, EEH_RESET_FUNDAMENTAL);
+			pseries_eeh_phb_reset(phb, config_addr, EEH_RESET_DEACTIVATE);
+			pseries_eeh_phb_configure_bridge(phb, config_addr);
+		}
+	}
 
 	ret = eeh_init(&pseries_eeh_ops);
 	if (!ret)
-- 
2.26.2

