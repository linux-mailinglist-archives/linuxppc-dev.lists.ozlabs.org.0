Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9DA6BF02A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 18:52:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdWt30jkGz3f4K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 04:52:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=at5KvBs/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=grundler@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=at5KvBs/;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdWs46DmCz3chZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 04:51:18 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id h14so3152047pgj.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679075475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=43JEK5+W42TYEVE1MBp+nwf6FlyScDxxoIeOAiKETT4=;
        b=at5KvBs/SsIFLhrCajDj+2ic58nt7EptrKDtknXhQyBiYh/rAUI3ogSmrYqt6r3Gzn
         bHrDDY5UIhKRqNAowpUUTxn0EYu+FC9AqeqqAFiQKIDeAas23IEFiA67dTSaXCdSBU9l
         ItdKt7AaQIyuqKDwisBPlp2zCArEIOipSriZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679075475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43JEK5+W42TYEVE1MBp+nwf6FlyScDxxoIeOAiKETT4=;
        b=JoxQrZf5EMvhW+uThJlaCv4Z9R/yZl1TuPjkbGguIZnu1LrUbOYMieypAL4hKobN3f
         3xadt+N/ymTGv9V7JMrTWcaY99onmQGj8YNQcQ+j61z+ZhjpzAOXZ3azjrLoR30oxkDT
         IuOUis6Ptxoc2tqPnn0SaqPcownvzDvIIztWmcdLaQVrXca9vu9SoqL2F3QaSHs/Ewzw
         BOt3QBbu+fSLLJRDcSEy5NsYFaPEs18N8pU8XvfQX096gEF7ZIOTzYyFwRIOXZir5TGt
         H6cXU6OeF5EPBpSzPovHEtb0jDdr1xmYysqUYt13PBgdVPsleWz6rSil13M10TV6oSuL
         dWpw==
X-Gm-Message-State: AO0yUKUzzW2+0+9YRV7XXB2eZyMrrNb4llAfRDEYsunWa8jO63duKKwf
	yq1IU82JLtD6C2R7SQDPtu6MvA==
X-Google-Smtp-Source: AK7set/sYgh4Viredkz8vxjuTOp+i2zpVLHfDM0VoUKo3EbkAWqX4wGgB33MW0KiGOp4ARCopur8Ew==
X-Received: by 2002:a62:6105:0:b0:626:237c:bcfe with SMTP id v5-20020a626105000000b00626237cbcfemr3032153pfb.8.1679075475442;
        Fri, 17 Mar 2023 10:51:15 -0700 (PDT)
Received: from grundler-glapstation.lan ([70.134.62.80])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm1848113pfh.22.2023.03.17.10.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 10:51:15 -0700 (PDT)
From: Grant Grundler <grundler@chromium.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O \ 'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCHv2 pci-next 1/2] PCI/AER: correctable error message as KERN_INFO
Date: Fri, 17 Mar 2023 10:51:08 -0700
Message-Id: <20230317175109.3859943-1-grundler@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since correctable errors have been corrected (and counted), the dmesg output
should not be reported as a warning, but rather as "informational".

Otherwise, using a certain well known vendor's PCIe parts in a USB4 docking
station, the dmesg buffer can be spammed with correctable errors, 717 bytes
per instance, potentially many MB per day.

Given the "WARN" priority, these messages have already confused the typical
user that stumbles across them, support staff (triaging feedback reports),
and more than a few linux kernel devs. Changing to INFO will hide these
messages from most audiences.

Signed-off-by: Grant Grundler <grundler@chromium.org>
---
 drivers/pci/pcie/aer.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f6c24ded134c..cb6b96233967 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -687,23 +687,29 @@ static void __aer_print_error(struct pci_dev *dev,
 {
 	const char **strings;
 	unsigned long status = info->status & ~info->mask;
-	const char *level, *errmsg;
 	int i;
 
 	if (info->severity == AER_CORRECTABLE) {
 		strings = aer_correctable_error_string;
-		level = KERN_WARNING;
+		pci_info(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
+			info->status, info->mask);
 	} else {
 		strings = aer_uncorrectable_error_string;
-		level = KERN_ERR;
+		pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
+			info->status, info->mask);
 	}
 
 	for_each_set_bit(i, &status, 32) {
-		errmsg = strings[i];
+		const char *errmsg = strings[i];
+
 		if (!errmsg)
 			errmsg = "Unknown Error Bit";
 
-		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
+		if (info->severity == AER_CORRECTABLE)
+			pci_info(dev, "   [%2d] %-22s%s\n", i, errmsg,
+				info->first_error == i ? " (First)" : "");
+		else
+			pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
 				info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
@@ -724,7 +730,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
 	agent = AER_GET_AGENT(info->severity, info->status);
 
-	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
+	level = (info->severity == AER_CORRECTABLE) ? KERN_INFO : KERN_ERR;
 
 	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
 		   aer_error_severity_string[info->severity],
@@ -797,14 +803,17 @@ void cper_print_aer(struct pci_dev *dev, int aer_severity,
 	info.mask = mask;
 	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
 
-	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
 	__aer_print_error(dev, &info);
-	pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
-		aer_error_layer[layer], aer_agent_string[agent]);
 
-	if (aer_severity != AER_CORRECTABLE)
+	if (aer_severity == AER_CORRECTABLE) {
+		pci_info(dev, "aer_layer=%s, aer_agent=%s\n",
+			aer_error_layer[layer], aer_agent_string[agent]);
+	} else {
+		pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
+			aer_error_layer[layer], aer_agent_string[agent]);
 		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
 			aer->uncor_severity);
+	}
 
 	if (tlp_header_valid)
 		__print_tlp_header(dev, &aer->header_log);
-- 
2.40.0.rc1.284.g88254d51c5-goog

