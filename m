Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B657235F6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 05:56:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZxVJ2X2cz3fbG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 13:56:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c6TZBnZm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=grundler@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c6TZBnZm;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZxSX5Qbtz3f4W
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 13:54:52 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-543c692db30so1204631a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 20:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686023690; x=1688615690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl0xSYFVXihxlFwU2GI1A7DmXGMBSodJ+vcgxYeTY0Q=;
        b=c6TZBnZm4tjQlimIKuxQRIpQb8QaOyqNIC3Ybs3R1I6QmAUHBdQ6VrOpRmH5sJzlHl
         yNmYpXjlJeKbgoxlirqPmoAAXwNKYE025hH6CtoReVgEIf39AnRgPxBYn8s75U2Dz/3p
         LMG/pkrnhM1SXB7U+oq9nukDzv5jxXZm9PchQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686023690; x=1688615690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl0xSYFVXihxlFwU2GI1A7DmXGMBSodJ+vcgxYeTY0Q=;
        b=djmDwl5azMyBzn/rp6GKFsQy+6Uys1YNSWoEY9/GsAorBUkkeM0iM9l8lwCPK4ZyHk
         l8ONIwOVCWvHtgvwQvQV70cbvqJaAeeGl2mUbiWnryxFQh0Aks1AjVq387U6gxI0Rw0L
         yAm4bg0qLc0oP+gtPtlrGS/gHST0US+l40x+jI7avr+XnzzChXtt4HY0qlJIFFGPoP48
         LnSXCpgMOHCrEcxR78vIoBxDE7qG9Sj7cbKevQhE+x4p+c0xZGQKtjZF7ejuPUFW2NFz
         jhvcGWHUISiuWYC/qsoey3z5KNGsY4qpQVXvsu5VmAhJa/IWumeo8PwFYKFy79lKocwV
         imng==
X-Gm-Message-State: AC+VfDxIuGVDXKbambTEQJpPmvuRS5ghE/PCqcVWBLKcXq1yJqjBDhnr
	m9BRGnUWUbSrqds+ziiQVbuEmg==
X-Google-Smtp-Source: ACHHUZ7/CrXntbChZr3gqIpdTn+xlRnOrx/HP0LFPjZRwolM/ohxcYZ6OUGoLPPIj8t4jX8e+O5LZQ==
X-Received: by 2002:a05:6a20:d806:b0:101:73a9:1683 with SMTP id iv6-20020a056a20d80600b0010173a91683mr1218950pzb.33.1686023690390;
        Mon, 05 Jun 2023 20:54:50 -0700 (PDT)
Received: from grundler-glapstation.lan ([70.134.62.80])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090301cb00b001ac5b0a959bsm7346636plh.24.2023.06.05.20.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 20:54:50 -0700 (PDT)
From: Grant Grundler <grundler@chromium.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O \ 'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCHv3 pci-next 2/2] PCI/AER: Rate limit the reporting of the correctable errors
Date: Mon,  5 Jun 2023 20:54:42 -0700
Message-ID: <20230606035442.2886343-2-grundler@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230606035442.2886343-1-grundler@chromium.org>
References: <20230606035442.2886343-1-grundler@chromium.org>
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

From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>

There are many instances where correctable errors tend to inundate
the message buffer. We observe such instances during thunderbolt PCIe
tunneling.

It's true that they are mitigated by the hardware and are non-fatal
but we shouldn't be spamming the logs with such correctable errors as it
confuses other kernel developers less familiar with PCI errors, support
staff, and users who happen to look at the logs, hence rate limit them.

A typical example log inside an HP TBT4 dock:
[54912.661142] pcieport 0000:00:07.0: AER: Multiple Corrected error received: 0000:2b:00.0
[54912.661194] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
[54912.661203] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001100/00002000
[54912.661211] igc 0000:2b:00.0:    [ 8] Rollover
[54912.661219] igc 0000:2b:00.0:    [12] Timeout
[54982.838760] pcieport 0000:00:07.0: AER: Corrected error received: 0000:2b:00.0
[54982.838798] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
[54982.838808] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001000/00002000
[54982.838817] igc 0000:2b:00.0:    [12] Timeout

This gets repeated continuously, thus inundating the buffer.

Signed-off-by: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
Signed-off-by: Grant Grundler <grundler@chromium.org>
---
 drivers/pci/pcie/aer.c | 80 +++++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 29 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d7bfc6070ddb..830f5a1261c9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -686,26 +686,36 @@ static void __aer_print_error(struct pci_dev *dev,
 			      struct aer_err_info *info)
 {
 	const char **strings;
+	char aer_msg[512];
 	unsigned long status = info->status & ~info->mask;
-	const char *level, *errmsg;
 	int i;
 
-	if (info->severity == AER_CORRECTABLE) {
-		strings = aer_correctable_error_string;
-		level = KERN_INFO;
-	} else {
-		strings = aer_uncorrectable_error_string;
-		level = KERN_ERR;
-	}
+	memset(aer_msg, 0, sizeof(*aer_msg));
+	snprintf(aer_msg, sizeof(*aer_msg), "aer_status: 0x%08x, aer_mask: 0x%08x\n",
+			info->status, info->mask);
+
+	strings = (info->severity == AER_CORRECTABLE) ?
+		aer_correctable_error_string : aer_uncorrectable_error_string;
 
 	for_each_set_bit(i, &status, 32) {
-		errmsg = strings[i];
+		const char *errmsg = strings[i];
+		char bitmsg[64];
+		memset(bitmsg, 0, sizeof(*bitmsg));
+
 		if (!errmsg)
 			errmsg = "Unknown Error Bit";
 
-		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
-				info->first_error == i ? " (First)" : "");
+		snprintf(bitmsg, sizeof(*bitmsg), "   [%2d] %-22s%s\n", i, errmsg,
+			    info->first_error == i ? " (First)" : "");
+
+		strlcat(aer_msg, bitmsg, sizeof(*aer_msg));
 	}
+
+	if (info->severity == AER_CORRECTABLE)
+		pci_info_ratelimited(dev, "%s", aer_msg);
+	else
+		pci_err(dev, "%s", aer_msg):
+
 	pci_dev_aer_stats_incr(dev, info);
 }
 
@@ -713,7 +723,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int layer, agent;
 	int id = ((dev->bus->number << 8) | dev->devfn);
-	const char *level;
 
 	if (!info->status) {
 		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
@@ -724,14 +733,19 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
 	agent = AER_GET_AGENT(info->severity, info->status);
 
-	level = (info->severity == AER_CORRECTABLE) ? KERN_INFO : KERN_ERR;
-
-	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
-		   aer_error_severity_string[info->severity],
-		   aer_error_layer[layer], aer_agent_string[agent]);
-
-	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
-		   dev->vendor, dev->device, info->status, info->mask);
+	if (info->severity == AER_CORRECTABLE) {
+		pci_info_ratelimited(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n"
+				"  device [%04x:%04x] error status/mask=%08x/%08x\n",
+				     aer_error_severity_string[info->severity],
+				     aer_error_layer[layer], aer_agent_string[agent],
+				     dev->vendor, dev->device, info->status, info->mask);
+	} else {
+		pci_err(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+			"  device [%04x:%04x] error status/mask=%08x/%08x\n",
+			aer_error_severity_string[info->severity],
+			aer_error_layer[layer], aer_agent_string[agent],
+			dev->vendor, dev->device, info->status, info->mask);
+	}
 
 	__aer_print_error(dev, info);
 
@@ -751,11 +765,19 @@ static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
 	u8 bus = info->id >> 8;
 	u8 devfn = info->id & 0xff;
 
-	pci_info(dev, "%s%s error received: %04x:%02x:%02x.%d\n",
-		 info->multi_error_valid ? "Multiple " : "",
-		 aer_error_severity_string[info->severity],
-		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
-		 PCI_FUNC(devfn));
+	if (info->severity == AER_CORRECTABLE)
+		pci_info_ratelimited(dev, "%s%s error received: %04x:%02x:%02x.%d\n",
+				     info->multi_error_valid ? "Multiple " : "",
+				     aer_error_severity_string[info->severity],
+				     pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
+				     PCI_FUNC(devfn));
+	else
+		pci_info(dev, "%s%s error received: %04x:%02x:%02x.%d\n",
+			 info->multi_error_valid ? "Multiple " : "",
+			 aer_error_severity_string[info->severity],
+			 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
+			 PCI_FUNC(devfn));
+
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
@@ -798,7 +820,7 @@ void cper_print_aer(struct pci_dev *dev, int aer_severity,
 	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
 
 	if (aer_severity == AER_CORRECTABLE)
-		pci_info(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
+		pci_info_ratelimited(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
 	else
 		pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
 
@@ -808,9 +830,9 @@ void cper_print_aer(struct pci_dev *dev, int aer_severity,
 		pci_info(dev, "aer_layer=%s, aer_agent=%s\n",
 			aer_error_layer[layer], aer_agent_string[agent]);
 	} else {
-		pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
-			aer_error_layer[layer], aer_agent_string[agent]);
-		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
+		pci_err(dev, "aer_layer=%s, aer_agent=%s,"
+			" aer_uncor_severity=0x%08x\n",
+			aer_error_layer[layer], aer_agent_string[agent],
 			aer->uncor_severity);
 	}
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

