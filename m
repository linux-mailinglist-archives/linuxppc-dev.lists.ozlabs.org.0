Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E25EC84F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McP3R0Yczz3fKZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:40:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fsCBG+DP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fsCBG+DP;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNzD5Zmtz3dq5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:37:12 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 129so8314278pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=u9XQU41RsTUx8hAj0GByCivfHFYNLe/LcJ7HOx2cRk8=;
        b=fsCBG+DPjSI2nTALjsV1M/duBiunTKI6jkFKOOGmtIR6r5bAo2o2uEDMVUtUArXGVW
         fTKfg77exYvCPT+Mzd0FRfvrUOIrPM0DrH3XCnFfLmLZAzuiZ2q+x3gMaVyQqyuZbgoc
         mGw37ZG9ieu06mhPTRrMnhx0rx5zACS7/QMWCatKRH3/B8MceesI9gSMJlvNlTGtys+s
         ZpK4iFTZ+b88nfx2U5yAVmqtVht2gc9J38/VXFStCvpAzAuNNnvoupyJoxQ0dC/t5q0l
         0LCVpcQakk9Ng6ATtk5ggTfQOe2Fv4tFHfwKswt99YRJayi96CpsLFwM80CWJJkYBuZB
         ajRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u9XQU41RsTUx8hAj0GByCivfHFYNLe/LcJ7HOx2cRk8=;
        b=tSiBxXhEGIWETB8/e7xtiBDCiYlFHdjOKac/PaX4MDBELGLn6xJp+7yCU+Nsa47ysE
         Qk8ZpsliP3vAoKUW0DuLfnmQ7Ey2sUcFovRT9cQ8F1M8HOKr6yBkBks7TzyNyICEUtWV
         kgw/wxzqSY8PYhOgF6OoIicf+6PT3hdM6mxY1hTuALfPiSHwtOx4Fv8gQHvd7w2rZ1W3
         leDn17xGUJWVgilHpitn99ZfirrdpnuqrPimUPfLTVDes271WhTgQL9y18bfTqmLcPxe
         pzS881uqMQA3GsMyuyAUHaItU4tuSdAyZkcuaDC9XGPCOtf+5hM2bv8HwfAu8DvkR9BA
         HL0Q==
X-Gm-Message-State: ACrzQf2xoTK8H8z0J1ZRZMJwH9eLveOmIBdOI6nma8aP6aFNE9zgM6lU
	HjmGdZe/NrzA8qDGMPEXPKuTYw==
X-Google-Smtp-Source: AMsMyM5AGc7YKPpik/CYAdx7+YLoe2LePT9l6+aEGScdw+MnDkvA4e2T5mugdpwTheK1NxozIxwQbQ==
X-Received: by 2002:a63:d40b:0:b0:43b:e86f:d384 with SMTP id a11-20020a63d40b000000b0043be86fd384mr24815734pgh.167.1664293032304;
        Tue, 27 Sep 2022 08:37:12 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b0053639773ad8sm1933087pfj.119.2022.09.27.08.37.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Sep 2022 08:37:12 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH v2 7/9] PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
Date: Tue, 27 Sep 2022 23:35:22 +0800
Message-Id: <20220927153524.49172-8-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
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
Cc: linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, chenzhuo.1@bytedance.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use pcie_aer_is_native() in place of "host->native_aer ||
pcie_ports_native" to judge whether OS owns AER in aer_root_reset().

Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
get_port_device_capability() with pcie_aer_is_native(), which has no
functional changes.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/aer.c          | 5 ++---
 drivers/pci/pcie/portdrv_core.c | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e2320ab27a31..a6d29269ccf2 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1403,7 +1403,6 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	int type = pci_pcie_type(dev);
 	struct pci_dev *root;
 	int aer;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	u32 reg32;
 	int rc;
 
@@ -1424,7 +1423,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	 */
 	aer = root ? root->aer_cap : 0;
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
+	if (aer && pcie_aer_is_native(root)) {
 		/* Disable Root's interrupt in response to error messages */
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &reg32);
 		reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
@@ -1443,7 +1442,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 			pci_is_root_bus(dev->bus) ? "Root" : "Downstream", rc);
 	}
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
+	if (aer && pcie_aer_is_native(root)) {
 		/* Clear Root Error Status */
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &reg32);
 		pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, reg32);
diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
index 1ac7fec47d6f..844297c0c85e 100644
--- a/drivers/pci/pcie/portdrv_core.c
+++ b/drivers/pci/pcie/portdrv_core.c
@@ -221,8 +221,7 @@ static int get_port_device_capability(struct pci_dev *dev)
 	}
 
 #ifdef CONFIG_PCIEAER
-	if (dev->aer_cap && pci_aer_available() &&
-	    (pcie_ports_native || host->native_aer))
+	if (pcie_aer_is_native(dev) && pci_aer_available())
 		services |= PCIE_PORT_SERVICE_AER;
 #endif
 
-- 
2.30.1 (Apple Git-130)

