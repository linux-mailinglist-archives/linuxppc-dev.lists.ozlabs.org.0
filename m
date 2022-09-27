Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984E5EC858
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McP4m72t3z3f6W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:42:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=t97e6+By;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=t97e6+By;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNzY074bz3dtW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:37:28 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id w20so9399820ply.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jrue3xDv2fahH0oRb0ZfoidxKvGLRwE7ZIzpUZAJ4Nw=;
        b=t97e6+ByJ/znAh9op7r/0INVD9/ePdia6obzzM84V/fa4k0PkB8CTggLpqdkmQSQxw
         jPd7dB99HsoumE0BHyoTkal01PjHX2wkJpeP/6HmLwxHhvMSpGCr5ibn6dD8EZ7Sj/rn
         04VNNXm7c68IcpJ6T3+yeEWknEZodWqZ3I31OZesH5Zmc7YMzL/EcDynSOKl5JP9zdPe
         V6dsr5jfhPndCyvIe921MSiKUupw6yBVmtvJgVplkpl+lgCfgsl+uXky/HN/txddQC8i
         QRxcmp/RPPC82K6CC8WaHFIjjhjraR6rlUGNHe5BKYQPpOqfKmOPFXtuNA/EangO43bl
         K+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jrue3xDv2fahH0oRb0ZfoidxKvGLRwE7ZIzpUZAJ4Nw=;
        b=vK/mkyrfSP3qGyTHQxiXeeQHZhyTJVm75CyhJhIVbbAk3Jzxo2yh4Lhz1/SdQQJzpt
         oMwGn2ArcnOmVkT8LekPPGHNeTMW8O/+alI/7/huu2kO0qEGk9D71NS+N3zmw3bguaDa
         Vt5LNd0YdLmWTm23eFNcn4sd+Nld24A6sM27qKygxN26slouvAWSG90FUoGmq/8aUhyd
         V+9BbDLfB0szlivxvE+cD/ngG7D76Ezl9eXrVw7Nj/Jv2OBG0mJ+depBNbf+fVJN67F+
         Tc+a+jYh6v/EpRFxN/toweXPQEMmEi2eQTGrBEx+AfzFkFQpCkTEo3/DacdYNGeT/7p5
         x5vw==
X-Gm-Message-State: ACrzQf28rTCVElTv8eBjdHVstLM6u5UzvIgclhmpv5WhNmId1Az6qG9W
	+uyNmbvxnlqOqnzizGrL1C3Apg==
X-Google-Smtp-Source: AMsMyM4mzGSMzMrGQb4AEYHMI3z1A4zjn9jLaUxhhhISN8nn4Omuv8b/L9w4e1lSWVjTg9NQtpY+TA==
X-Received: by 2002:a17:903:32cf:b0:178:3d49:45b0 with SMTP id i15-20020a17090332cf00b001783d4945b0mr27706370plr.5.1664293046628;
        Tue, 27 Sep 2022 08:37:26 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b0053639773ad8sm1933087pfj.119.2022.09.27.08.37.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Sep 2022 08:37:26 -0700 (PDT)
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
Subject: [PATCH v2 9/9] PCI/AER: Refine status clearing process with api
Date: Tue, 27 Sep 2022 23:35:24 +0800
Message-Id: <20220927153524.49172-10-chenzhuo.1@bytedance.com>
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

Statements clearing status in aer_enable_rootport() is functionally
equivalent with pcie_clear_device_status() and pci_aer_clear_status().
So we replace them, which has no functional changes.

After commit 20e15e673b05 ("PCI/AER: Add pci_aer_raw_clear_status()
to unconditionally clear Error Status"), pci_aer_raw_clear_status()
is only used by the EDR path, so we add note in function comment.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/aer.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index a6d29269ccf2..bd5ecfa4860f 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -306,6 +306,8 @@ EXPORT_SYMBOL_GPL(pci_aer_clear_uncorrect_error_status);
  * Clearing AER error status registers unconditionally, regardless of
  * whether they're owned by firmware or the OS.
  *
+ * Used only by the EDR path. Other paths should use pci_aer_clear_status().
+ *
  * Returns 0 on success, or negative on failure.
  */
 int pci_aer_raw_clear_status(struct pci_dev *dev)
@@ -1277,24 +1279,17 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
 {
 	struct pci_dev *pdev = rpc->rpd;
 	int aer = pdev->aer_cap;
-	u16 reg16;
 	u32 reg32;
 
 	/* Clear PCIe Capability's Device Status */
-	pcie_capability_read_word(pdev, PCI_EXP_DEVSTA, &reg16);
-	pcie_capability_write_word(pdev, PCI_EXP_DEVSTA, reg16);
+	pcie_clear_device_status(pdev);
 
 	/* Disable system error generation in response to error messages */
 	pcie_capability_clear_word(pdev, PCI_EXP_RTCTL,
 				   SYSTEM_ERROR_INTR_ON_MESG_MASK);
 
 	/* Clear error status */
-	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
-	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
-	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
-	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
-	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
-	pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
+	pci_aer_clear_status(pdev);
 
 	/*
 	 * Enable error reporting for the root port device and downstream port
-- 
2.30.1 (Apple Git-130)

