Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 115DB6BF033
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 18:53:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdWv26pKZz3f3r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 04:53:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UBRYAWa0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=grundler@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UBRYAWa0;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdWs46B5dz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 04:51:18 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id o11so6133807ple.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679075476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r1WhvyKSBCJVCHAYDyDm94/mvsRvq4dBSf7I61xoxs=;
        b=UBRYAWa0HLHlLIh4eOYDdiXjSbkgBB4MZb4Mq2Gnlmscik1Joax9SF47VL6Y38yV62
         5WJzPjjlS7dcbf0MpfP7wKFbNGvCB52nxOljJWMjdRcpPuGr2NU993xreY7wp1sRmhMe
         M6k+jXQ/2Paj5NEdkF39VTDAmrUuQL59IT9ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679075476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0r1WhvyKSBCJVCHAYDyDm94/mvsRvq4dBSf7I61xoxs=;
        b=l++4UYEsp1O3SuuH3MXFv8aMl9tdRejDDkGkYtXTJXvfqDvtWgEJBBGRTcE9zvMr6s
         MIWk0/VtGGWzdZhkygwWoOQbXWM0hSAKxFZYff1hp29HSsd05BizH0hbTi5SqDXdkrFh
         3VVBJAXBAMx0xWkOZ+4j3jR2xpO47v8i+p5hi2sRmCzO1S+Sye4DqhebOOWQOT6fk6/A
         T9FSeDx3UbcTZIZAzCOBOkL5tEp56uZjuIe2lc/k6a4EfxvMGe79EqrG4EF06tOATmAI
         4RjiLo696KQkuW+LnbsAxBPCKOfYURNoyjqtUP1eeCAqKbDiQf0747x6amLNPIhkN5zl
         kp3Q==
X-Gm-Message-State: AO0yUKXjeCHJfPGbju2mj2Xduplw1xQqKkxoebrtPfThAr/qXF4vzPE1
	FRK4Zo1HU/ux6fQR/ls3cPFdLw==
X-Google-Smtp-Source: AK7set/sQyoWYUEGFHlwyoIs+exsMbHe/kPJa4crxSUkdewCyt37oTeNx3BFtEY/Jq6XDcZaojzADw==
X-Received: by 2002:a05:6a20:6699:b0:cd:832c:f9c6 with SMTP id o25-20020a056a20669900b000cd832cf9c6mr8447401pzh.1.1679075476474;
        Fri, 17 Mar 2023 10:51:16 -0700 (PDT)
Received: from grundler-glapstation.lan ([70.134.62.80])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm1848113pfh.22.2023.03.17.10.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 10:51:16 -0700 (PDT)
From: Grant Grundler <grundler@chromium.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O \ 'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the correctable errors
Date: Fri, 17 Mar 2023 10:51:09 -0700
Message-Id: <20230317175109.3859943-2-grundler@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317175109.3859943-1-grundler@chromium.org>
References: <20230317175109.3859943-1-grundler@chromium.org>
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
 drivers/pci/pcie/aer.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index cb6b96233967..b592cea8bffe 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -706,8 +706,8 @@ static void __aer_print_error(struct pci_dev *dev,
 			errmsg = "Unknown Error Bit";
 
 		if (info->severity == AER_CORRECTABLE)
-			pci_info(dev, "   [%2d] %-22s%s\n", i, errmsg,
-				info->first_error == i ? " (First)" : "");
+			pci_info_ratelimited(dev, "   [%2d] %-22s%s\n", i, errmsg,
+					     info->first_error == i ? " (First)" : "");
 		else
 			pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
 				info->first_error == i ? " (First)" : "");
@@ -719,7 +719,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int layer, agent;
 	int id = ((dev->bus->number << 8) | dev->devfn);
-	const char *level;
 
 	if (!info->status) {
 		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
@@ -730,14 +729,21 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
 	agent = AER_GET_AGENT(info->severity, info->status);
 
-	level = (info->severity == AER_CORRECTABLE) ? KERN_INFO : KERN_ERR;
+	if (info->severity == AER_CORRECTABLE) {
+		pci_info_ratelimited(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+				     aer_error_severity_string[info->severity],
+				     aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
-		   aer_error_severity_string[info->severity],
-		   aer_error_layer[layer], aer_agent_string[agent]);
+		pci_info_ratelimited(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
+				     dev->vendor, dev->device, info->status, info->mask);
+	} else {
+		pci_err(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+			aer_error_severity_string[info->severity],
+			aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
-		   dev->vendor, dev->device, info->status, info->mask);
+		pci_err(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
+			dev->vendor, dev->device, info->status, info->mask);
+	}
 
 	__aer_print_error(dev, info);
 
@@ -757,11 +763,19 @@ static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
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
-- 
2.40.0.rc1.284.g88254d51c5-goog

