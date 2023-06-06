Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB8C7235ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 05:53:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZxRP2BY2z3f5H
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 13:53:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KWjvaOtD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=grundler@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KWjvaOtD;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZxQX6Ybcz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 13:53:06 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-653f9c7b3e4so2199915b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 20:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686023583; x=1688615583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8TMuD13iz1+JTkcI0W6rJfcAelcuaGW6bYfzfZtEkI=;
        b=KWjvaOtDIVDZNaWm/wwNioCAPQAQIzsi/qf4qaKorf9By6P7mvXBxsNza8UoM6npDO
         0jsot/kg11j089eqwrgC2PXeJ4FbZKgJbbsWy4cstf3sJCHMISEMTRJ7JZWoTaUaNWxR
         i+NnJoqexiT2/ULkc12zgNqzVjKCtWIaYOh0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686023583; x=1688615583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8TMuD13iz1+JTkcI0W6rJfcAelcuaGW6bYfzfZtEkI=;
        b=iKGpPiEv09PwsTENisgBLhLKAlh8t20o9GVcNcMfb9Bn8oMbR8ivUTekNOVjbYgB4o
         0FKr+2AQv8bfVL4uDHQVK5eOKK3suoTN62ga0Mszj1nf7qYBW4ql1/tWpUU78qnpElW/
         8H6zF7yg4gBTH+m67+HNK5gNMT30PddouHbnrDzlH3jVfGh1lozgipudoy49cxtBeGYs
         TJBWQnR1sr9NTLxwKLyvt1z1WOk33fDHgYFNNwBqn1namTOLc2m3NmNk6Ab5iuWiVVOp
         gHyFTiBTlvtC1XMBQMATUuxLXxXoZ/ZUoTP/jsv66LZ3CQGvkJCds1SF0PPfG5oAfIpS
         VkBQ==
X-Gm-Message-State: AC+VfDzdQ70POdf400YdGnphscH0FZ1eFv8iVv17NURHyblJgTHRyFV3
	5tuqpw7DX66l2u5QDY9SfJ3wkA==
X-Google-Smtp-Source: ACHHUZ6b9KdE3IvpkY34oqh4G2E0vTllw32LgahGnbDkLedJ9c14WNdIKEMPr87qubommjUbO18UYg==
X-Received: by 2002:a05:6a20:9591:b0:10f:8798:9ffd with SMTP id iu17-20020a056a20959100b0010f87989ffdmr856191pzb.55.1686023583666;
        Mon, 05 Jun 2023 20:53:03 -0700 (PDT)
Received: from grundler-glapstation.lan ([70.134.62.80])
        by smtp.gmail.com with ESMTPSA id v71-20020a63894a000000b005439aaf0301sm3418452pgd.64.2023.06.05.20.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 20:53:03 -0700 (PDT)
From: Grant Grundler <grundler@chromium.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O \ 'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/2] PCI/AER: correctable error message as KERN_INFO
Date: Mon,  5 Jun 2023 20:52:55 -0700
Message-ID: <20230606035256.2886098-1-grundler@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
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
 drivers/pci/pcie/aer.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f6c24ded134c..d7bfc6070ddb 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -692,7 +692,7 @@ static void __aer_print_error(struct pci_dev *dev,
 
 	if (info->severity == AER_CORRECTABLE) {
 		strings = aer_correctable_error_string;
-		level = KERN_WARNING;
+		level = KERN_INFO;
 	} else {
 		strings = aer_uncorrectable_error_string;
 		level = KERN_ERR;
@@ -724,7 +724,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
 	agent = AER_GET_AGENT(info->severity, info->status);
 
-	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
+	level = (info->severity == AER_CORRECTABLE) ? KERN_INFO : KERN_ERR;
 
 	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
 		   aer_error_severity_string[info->severity],
@@ -797,14 +797,22 @@ void cper_print_aer(struct pci_dev *dev, int aer_severity,
 	info.mask = mask;
 	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
 
-	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
+	if (aer_severity == AER_CORRECTABLE)
+		pci_info(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
+	else
+		pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
+
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
2.41.0.rc0.172.g3f132b7071-goog

