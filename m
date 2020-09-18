Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C833926F963
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 11:36:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt7y71mlnzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:36:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K2T7fgE9; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt7qy53bGzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:31:10 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id n14so3072145pff.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8LbWJcYWp+sA/luW3wR/BtuDPwIW9fptoPje7qw8n0=;
 b=K2T7fgE9/RVCRv55bk08xGQNE2RiYKJ5p1+udIP7fMecJP8zg4ZnUz/HLihq/yvi4h
 cALpBIMC9Z8POUAaUlVAjXR2UIONzq4Ap9l/BXqU5uyyvNB4/JLJTq50X9DnaBnysvYF
 t5JQo+n0LQzbutWyczOh6bV2Q66nir1DGNGAeW398GCBW+o8SOHoivPE3dSchQsSqD54
 4RuIChwV5sBM3T2Ib5UAElqb+FCoEgeogO06vdqZQ2USwy49B4sqr6CbSBlDJhiW/fHR
 NHdB81acoRMZ7nID4BvjpUEOanPAUxf9CqyHzF8C44PN1Tt/KKr0442Lk76CN0tg09SO
 rR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8LbWJcYWp+sA/luW3wR/BtuDPwIW9fptoPje7qw8n0=;
 b=ncO2M/R2cwTBEpiDfqOqGW5nQN8p5RGeBw0VDyaw5KcKd6xaMpB5vLWS1On+PE2pQg
 PWo3fWoPl9uNI0KqK5A2mBC+Zgxp24S37y8K/iXiSZ9c+DxYz0gaiukoPU0aqQK+SOjz
 afRzMG5Y8gop+6jeiEl3onmHe9yp6dG+fdKZG/WI0mfyRaj+LkIsEwFQYcUX4SxKE4SQ
 WZpS/oRzv1ZoqTNHbELbxiOZ1qVjV7BpOAsoGrFegG6h4/z5GbQiQeR056lqZFx8fHdM
 F6rIlsCgrtQazm4TW2aaGQQcA1Q/n1Iiu13NdpvYVMZx4WVfFPNlIuZ7lTvFI8qwRxjO
 YGZA==
X-Gm-Message-State: AOAM530QjwKISxmt5r5WSlp492rsEaExnIdW+L/xNFsc1JREYPIZyy5q
 yGMt28sYOp2krYvJ58WJuYPQXBGG67lBjA==
X-Google-Smtp-Source: ABdhPJxSxrK6XJCudhQVKRSjvFdYoaELB5nzjr7GQMuD7AHhVtKHQhgdXkoI1Ws6z327+lE91gD4Nw==
X-Received: by 2002:a65:5ac1:: with SMTP id d1mr23859899pgt.230.1600421467320; 
 Fri, 18 Sep 2020 02:31:07 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id cf7sm2258853pjb.52.2020.09.18.02.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:31:06 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/9] powerpc/pseries: Stop using eeh_ops->init()
Date: Fri, 18 Sep 2020 19:30:44 +1000
Message-Id: <20200918093050.37344-3-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200918093050.37344-1-oohall@gmail.com>
References: <20200918093050.37344-1-oohall@gmail.com>
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

