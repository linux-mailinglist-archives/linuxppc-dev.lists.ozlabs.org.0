Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4D74E232
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 01:23:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TbFXuy5V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0Kn83r8wz3btn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 09:23:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TbFXuy5V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0KlH6hx7z30PN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 09:21:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9BDB66125F;
	Mon, 10 Jul 2023 23:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC17DC433C7;
	Mon, 10 Jul 2023 23:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689031305;
	bh=Y2j5rRb6xpdmsTT+BzTtvIQsL3CFQd80YIp40kH6XWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TbFXuy5Vv0hBg5idN4znCuGKIsX8jEd36bONo9ZEG5NX3lRVvAmZRJcvEJX7yzj2m
	 fFysozuWhwBfcgcnVAgdxH+w7zAJmB89l2samqZD85Ulc65L5S3EYNRdBiub1jSBw1
	 a/Q5ixAAlOG7wRgt9sldqkfPeDfrL3TDKPr4atKjXZmlydnZtyK0FV+HIZss+qddoN
	 PbUlsV22ayeXv7cg3P9vFUr7j6c7lFrlT1RidI64R0VACca3dIrvYbnGVKPN33vXY4
	 c2pyJvns5KNNZWvDvQKfuxU+HwzFMIDwW8Lx0NOBLMW4x+N58p7/iWwFJu8gaUyqFl
	 UfI6ldbMzv/xA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 1/2] PCI/AER: Drop unused pci_disable_pcie_error_reporting()
Date: Mon, 10 Jul 2023 18:21:35 -0500
Message-Id: <20230710232136.233034-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710232136.233034-1-helgaas@kernel.org>
References: <20230710232136.233034-1-helgaas@kernel.org>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

pci_disable_pcie_error_reporting() has no callers.  Remove it.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 12 ------------
 include/linux/aer.h    |  5 -----
 2 files changed, 17 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f6c24ded134c..d4c948b7c449 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -242,18 +242,6 @@ int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 }
 EXPORT_SYMBOL_GPL(pci_enable_pcie_error_reporting);
 
-int pci_disable_pcie_error_reporting(struct pci_dev *dev)
-{
-	int rc;
-
-	if (!pcie_aer_is_native(dev))
-		return -EIO;
-
-	rc = pcie_capability_clear_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
-	return pcibios_err_to_errno(rc);
-}
-EXPORT_SYMBOL_GPL(pci_disable_pcie_error_reporting);
-
 int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 {
 	int aer = dev->aer_cap;
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 3a3ab05e13fd..aadc9242cb20 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -43,17 +43,12 @@ struct aer_capability_regs {
 #if defined(CONFIG_PCIEAER)
 /* PCIe port driver needs this function to enable AER */
 int pci_enable_pcie_error_reporting(struct pci_dev *dev);
-int pci_disable_pcie_error_reporting(struct pci_dev *dev);
 int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
 #else
 static inline int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
-static inline int pci_disable_pcie_error_reporting(struct pci_dev *dev)
-{
-	return -EINVAL;
-}
 static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 {
 	return -EINVAL;
-- 
2.34.1

