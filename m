Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3676A6CE0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 14:15:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRZTy64CKz3cMN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:15:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PQl3CKAc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com; envelope-from=grundler@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PQl3CKAc;
	dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRNxf3Jnqz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 17:05:08 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id l13-20020a0568301d6d00b0068f24f576c5so6953780oti.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 22:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7kVT/oItrmYbZ6vjI5pXv35SY2pScZG5pla4txXLGUY=;
        b=PQl3CKAcs5i1UuCdr43Q0EBCuIOFz0kxigPphBJQy0Fc1oosErTNFQBOy0uFTzq7Mp
         6we6/MWuXVzgzTDB2BvRXd3pTL+hDBecMULY0T7vrYcXWZ2D8CBllogx22dlZF+Wjg6A
         AYh4Fe0vyRU/4l6aRAz5q+L2I6+UiAWEKLSyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kVT/oItrmYbZ6vjI5pXv35SY2pScZG5pla4txXLGUY=;
        b=Vn6itFwN8x0qB4pi9B1vKP5EljMP6lc38qdiHHUu0NT/2q4frnGWVqu+lV1tUXQSxM
         GMNz8hMC1LpzF9TLW2zlQS+M+0/WtFKtIuaggQSMJSQQnM69V8WtQhRunFY+oIbUdfuF
         9r2U2CJStg9iXtA8pADlh+aYw+nXwAw7tcEuWZWQoNBNgRGac6ZP7ZBpC2/PK/rSh16W
         oohxSsb1vY4NnyQwC1zmJVk8cBtk94FLvJpN9paGipbD2Df5q6PkNxjNZvR0Rgy6xoVz
         G3MNM5M2GjFKar5+26HC5HhCAtoaXbSqml0zCF8ytYhU0dCodwH2KLMHZozI/d95B3Ag
         2L/w==
X-Gm-Message-State: AO0yUKV3kj4FBEj2ilSiU0yKGiTt/RHuCeDWGtz3QY/eEImnPGIqmfFL
	4+YT2UgmgOYKuu2dCEH1mEmFtw==
X-Google-Smtp-Source: AK7set8ZnCu/zmySz52YJsLN8IT9WjXKXUtbDOsW2C0cBroFnnvstBXnX4kQoVqUGCDznnm2HGc3DQ==
X-Received: by 2002:a05:6830:4414:b0:68b:dfcc:bed with SMTP id q20-20020a056830441400b0068bdfcc0bedmr3489242otv.15.1677650701532;
        Tue, 28 Feb 2023 22:05:01 -0800 (PST)
Received: from grundler-glapstation.lan ([70.134.62.80])
        by smtp.gmail.com with ESMTPSA id g21-20020a056830309500b0068bc48c61a5sm4599539ots.19.2023.02.28.22.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 22:05:01 -0800 (PST)
From: Grant Grundler <grundler@chromium.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O \ 'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI/AER: correctable error message as KERN_INFO
Date: Tue, 28 Feb 2023 22:04:53 -0800
Message-Id: <20230301060453.4031503-1-grundler@chromium.org>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 00:14:32 +1100
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
This patch will likely conflict with:
  https://lore.kernel.org/all/20230103165548.570377-1-rajat.khandelwal@linux.intel.com/

which I'd also like to see upstream. Please let me know to resubmit mine if Rajat's patch lands first. Or feel free to fix up this one.

 drivers/pci/pcie/aer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f6c24ded134c..e4cf3ec40d66 100644
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
-- 
2.39.2.722.g9855ee24e9-goog

