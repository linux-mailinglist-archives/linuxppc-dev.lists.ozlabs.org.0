Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB9074E235
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 01:24:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O03pMjvF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0Kp565nRz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 09:24:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O03pMjvF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0KlK2lW9z30PN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 09:21:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADA0461262;
	Mon, 10 Jul 2023 23:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E15C433C8;
	Mon, 10 Jul 2023 23:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689031307;
	bh=2JtYW2FAXLQ8IiaHZeQqlEM207zTV5RiNltF8zVSvU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O03pMjvFDkEjJ3HPx3J+xO4wSgoopx28xH9hy2035xQf5My4oVQDFXaYb2xclrUPz
	 v/+ZifdXxQwENMyRcnRqXpV1IlgXe0cumqQkJowQs1dM0kuymbNurQ7pPHAKtCxDIK
	 W8WZuurCq482vy7OehgQki2u7+HybImsKEds+PV1D0oBF5LHZWsnr0Nz4XkLyHPL3Q
	 V9BtS6YhfFpbrVgZPoCKdvsjHkqR7e7AO+cVW2B0AB3/5ulC3dlhCkR06RhRnk3tyg
	 fhK/ln78tFhL4mp7ecpVedBD5U7r4XoQNuM4wRZyLHy399MLBN3I+BzRIgRTShMSRb
	 xwnYPJyNh7ObQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 2/2] PCI/AER: Unexport pci_enable_pcie_error_reporting()
Date: Mon, 10 Jul 2023 18:21:36 -0500
Message-Id: <20230710232136.233034-3-helgaas@kernel.org>
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

pci_enable_pcie_error_reporting() is used only inside aer.c.  Stop exposing
it outside the file.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 3 +--
 include/linux/aer.h    | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d4c948b7c449..645149608054 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -230,7 +230,7 @@ int pcie_aer_is_native(struct pci_dev *dev)
 	return pcie_ports_native || host->native_aer;
 }
 
-int pci_enable_pcie_error_reporting(struct pci_dev *dev)
+static int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 {
 	int rc;
 
@@ -240,7 +240,6 @@ int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 	rc = pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
 	return pcibios_err_to_errno(rc);
 }
-EXPORT_SYMBOL_GPL(pci_enable_pcie_error_reporting);
 
 int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 {
diff --git a/include/linux/aer.h b/include/linux/aer.h
index aadc9242cb20..2dd175f5debd 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -41,14 +41,8 @@ struct aer_capability_regs {
 };
 
 #if defined(CONFIG_PCIEAER)
-/* PCIe port driver needs this function to enable AER */
-int pci_enable_pcie_error_reporting(struct pci_dev *dev);
 int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
 #else
-static inline int pci_enable_pcie_error_reporting(struct pci_dev *dev)
-{
-	return -EINVAL;
-}
 static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 {
 	return -EINVAL;
-- 
2.34.1

