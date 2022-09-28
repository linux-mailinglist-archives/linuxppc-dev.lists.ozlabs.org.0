Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173C5EDAE2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:01:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MctpG73P4z3cj5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:01:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eFgcRFG8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eFgcRFG8;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mctn51Kcdz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:00:09 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso3074779pjq.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/lUorqWHVGRnAT88EYIdYelQLnJZ6JU0rZvIuXw4R/I=;
        b=eFgcRFG8rZyt+ZzLjBVqt80mtlecZJilGFgBqp58JU1Th4+tjpU45u+gTrJURz6bU5
         PZAKAIfYGUPeGJVCZmJg3vuzIfVwjnpOKC5ZUeOa4l5p7zXBugRQL+YNsLY/0707Lyn9
         +qi4Uy0poKd8Sa4di3uUH+bWu2LaE4sKFOthWF/BkPiaa60pme+zM70DdJ8bi5BHQRrd
         zTgZFxfVJ1KS7X/LARzkICgCaD/+fH3z7w2NTbKIQJuAcpKztxzFV3FqhvJxhvv9Ztsp
         m+we2ILuvR+mw7GbnzjEDY/mut4/9s5b7+B54gO+wZHygWoM1S92vyJYtTH4k9+Pr7DT
         h49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/lUorqWHVGRnAT88EYIdYelQLnJZ6JU0rZvIuXw4R/I=;
        b=1PJ+71x5neN9MA4xyG9uexgNy0utQex8pspD9x5S3og0Cv2xz3csPunjNvsuYRbRd/
         jrhSlgyVIn+Mrs/fSFVhmIU0ZLxi8FD3bOYNQ+ha+XBhieOwQ89Qw/y9c/h1vsoauz1V
         XKMckyAio9QXFE0odrNaLTkef4aMzOef6ytyx5y9tBOiOydcK9BWY5biIF6OUT3vfvH7
         7uQOHqpn1F2x3BLBxrpg0nl7wpCPdKhcWVLArSyhHhjn1/ffx1JCZQ/va7RKRVbk9JC0
         cM2QnX5121tp0svcclyVrGNATMtDtTus7PPaeqieoopw0P/1F0XvGaxmpVLr/StUUvg2
         6vqw==
X-Gm-Message-State: ACrzQf2d+AT2QNBpoBxehAAieo0Rie17C/gllKc/wymINAf1OzgCaR+1
	sAB7RC7TPqdFJ2V6A+XCtXMGcA==
X-Google-Smtp-Source: AMsMyM7nBvyxUePl2eO0BDL+QbLpFrILFxB/8WP0FtnmYokq9Cgk3HqUDyZWcIKuWIYPint1G/hLIg==
X-Received: by 2002:a17:902:e154:b0:17a:606:6431 with SMTP id d20-20020a170902e15400b0017a06066431mr1417596pla.107.1664362806820;
        Wed, 28 Sep 2022 04:00:06 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.04.00.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:00:06 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: sathyanarayanan.kuppuswamy@linux.intel.com,
	bhelgaas@google.com,
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
Subject: [PATCH v3 1/9] PCI/AER: Add pci_aer_clear_uncorrect_error_status() to PCI core
Date: Wed, 28 Sep 2022 18:59:38 +0800
Message-Id: <20220928105946.12469-2-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
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

In lpfc_aer_cleanup_state(), uncorrectable error status needs to be
cleared, which can be done by calling pci_aer_clear_nonfatal_status()
and pci_aer_clear_fatal_status(). Meanwhile they can be combined in
one function (the same in dpc_process_error). So add
pci_aer_clear_uncorrect_error_status() function to PCI core and
export symbol to other modules which wants to use it.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/aer.c | 16 ++++++++++++++++
 include/linux/aer.h    |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e2d8a74f83c3..4e637121be23 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -286,6 +286,22 @@ void pci_aer_clear_fatal_status(struct pci_dev *dev)
 		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
 }
 
+int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
+{
+	int aer = dev->aer_cap;
+	u32 status;
+
+	if (!pcie_aer_is_native(dev))
+		return -EIO;
+
+	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
+	if (status)
+		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_aer_clear_uncorrect_error_status);
+
 /**
  * pci_aer_raw_clear_status - Clear AER error registers.
  * @dev: the PCI device
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 97f64ba1b34a..154690c278cb 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -45,6 +45,7 @@ struct aer_capability_regs {
 int pci_enable_pcie_error_reporting(struct pci_dev *dev);
 int pci_disable_pcie_error_reporting(struct pci_dev *dev);
 int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
+int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev);
 void pci_save_aer_state(struct pci_dev *dev);
 void pci_restore_aer_state(struct pci_dev *dev);
 #else
@@ -60,6 +61,10 @@ static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
+static inline int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
+{
+	return -EINVAL;
+}
 static inline void pci_save_aer_state(struct pci_dev *dev) {}
 static inline void pci_restore_aer_state(struct pci_dev *dev) {}
 #endif
-- 
2.30.1 (Apple Git-130)

