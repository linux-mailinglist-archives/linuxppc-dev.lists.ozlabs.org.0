Return-Path: <linuxppc-dev+bounces-10911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712DB240A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 07:51:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1yDg6Wnvz30Sy;
	Wed, 13 Aug 2025 15:51:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755064307;
	cv=none; b=HGxM9IvPUQf7qFlp2Bj2J4sDT/+G6YM2SMSvvDe2O7v++LCZlTyLd9A2IT2kqi2mvTzicLz6r276DpZb6bO8gdqcf+x6BLilTirA8oPIi6roQLuSmOGpmEuFvR4L9psCzW0tnnFfJzqvpkU7N2zPqE7x8gBooXvPAcb4MEyI76Cl4YmaZ/xJe5oFXiYCbc5ZygrbyU9VMXzmkKtYyNhPorBjtOR6DCC0QTyh8EYf305NvkBbJIAOdrpGCYZPQiqrS55Sic4zVRwgShOl3/OPkN9bXGdK0vm65H+6bYAkKuhyKnXUh6hIaasrQh71n3aaUtX0pf2NGfx0NpfePYXtuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755064307; c=relaxed/relaxed;
	bh=RAY9/t3Qk5CNoZCNn+tSlK1iiWBcUVJABbgyJ2JD2es=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=n1GL4P4QhGRZkJBexlpbid2MJ5ycGn5Tow1qFV8l5bFbRj6jEJHUYK/aXaKbsrNKIklJmSDave8zPlt3iBgul0kmMPXBTIUgOVchqB+uzoqaf+vUaPURax7v2EaTLiTh3kw3A84Nn7A1jwHaRBW3VtyJVUqjKd1NihbopuQX3B7OcD9a5878GevV9f+JUUsRUfU+Bcv1qF/5prkKxu54fBpr0K50B0deKmHt743hhstO377y+f8doYPKrxKQUbU202rEhRa3isbwPg9JJpNWm+LTozuN2WPHGh1MWa6TZQhIs/FY95qTQ+nmCaqZ0XwqJ3uuh0Z6TAA9iFpZ1/qZNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.54; helo=mailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=176.9.242.54; helo=mailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 424 seconds by postgrey-1.37 at boromir; Wed, 13 Aug 2025 15:51:47 AEST
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1yDg1Twqz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 15:51:47 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with UTF8SMTPS id 624AE3006AC8;
	Wed, 13 Aug 2025 07:44:37 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id 0DAAF6031F22;
	Wed, 13 Aug 2025 07:44:37 +0200 (CEST)
X-Mailbox-Line: From 1d72a891a7f57115e78a73046e776f7e0c8cd68f Mon Sep 17 00:00:00 2001
Message-ID: <1d72a891a7f57115e78a73046e776f7e0c8cd68f.1755008151.git.lukas@wunner.de>
In-Reply-To: <cover.1755008151.git.lukas@wunner.de>
References: <cover.1755008151.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 13 Aug 2025 07:11:05 +0200
Subject: [PATCH 5/5] PCI/ERR: Remove remnants of .link_reset() callback
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, Terry Bowman <terry.bowman@amd.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, "Oliver OHalloran" <oohall@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, Edward Cree <ecree.xilinx@gmail.com>, linux-net-drivers@amd.com, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni
 @redhat.com>, netdev@vger.kernel.org
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

Back in 2017, commit 2fd260f03b6a ("PCI/AER: Remove unused .link_reset()
callback") removed .link_reset() from struct pci_error_handlers, but left
a few code comments behind which still mention it.  Remove them.

The code comments in the SolarFlare Ethernet drivers point out that no
.mmio_enabled() callback is needed because the driver's .error_detected()
callback always returns PCI_ERS_RESULT_NEED_RESET, which causes
pcie_do_recovery() to skip .mmio_enabled().  That's not quite correct
because efx_io_error_detected() does return PCI_ERS_RESULT_RECOVERED under
certain conditions and then .mmio_enabled() would indeed be called if it
were implemented.  Remove this misleading portion of the code comment as
well.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/net/ethernet/sfc/efx_common.c       | 3 ---
 drivers/net/ethernet/sfc/falcon/efx.c       | 3 ---
 drivers/net/ethernet/sfc/siena/efx_common.c | 3 ---
 drivers/scsi/lpfc/lpfc_init.c               | 2 +-
 4 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/sfc/efx_common.c b/drivers/net/ethernet/sfc/efx_common.c
index 5a14d94163b1..e8fdbb62d872 100644
--- a/drivers/net/ethernet/sfc/efx_common.c
+++ b/drivers/net/ethernet/sfc/efx_common.c
@@ -1258,9 +1258,6 @@ static void efx_io_resume(struct pci_dev *pdev)
 
 /* For simplicity and reliability, we always require a slot reset and try to
  * reset the hardware when a pci error affecting the device is detected.
- * We leave both the link_reset and mmio_enabled callback unimplemented:
- * with our request for slot reset the mmio_enabled callback will never be
- * called, and the link_reset callback is not used by AER or EEH mechanisms.
  */
 const struct pci_error_handlers efx_err_handlers = {
 	.error_detected = efx_io_error_detected,
diff --git a/drivers/net/ethernet/sfc/falcon/efx.c b/drivers/net/ethernet/sfc/falcon/efx.c
index b07f7e4e2877..0c784656fde9 100644
--- a/drivers/net/ethernet/sfc/falcon/efx.c
+++ b/drivers/net/ethernet/sfc/falcon/efx.c
@@ -3128,9 +3128,6 @@ static void ef4_io_resume(struct pci_dev *pdev)
 
 /* For simplicity and reliability, we always require a slot reset and try to
  * reset the hardware when a pci error affecting the device is detected.
- * We leave both the link_reset and mmio_enabled callback unimplemented:
- * with our request for slot reset the mmio_enabled callback will never be
- * called, and the link_reset callback is not used by AER or EEH mechanisms.
  */
 static const struct pci_error_handlers ef4_err_handlers = {
 	.error_detected = ef4_io_error_detected,
diff --git a/drivers/net/ethernet/sfc/siena/efx_common.c b/drivers/net/ethernet/sfc/siena/efx_common.c
index a0966f879664..35036cc902fe 100644
--- a/drivers/net/ethernet/sfc/siena/efx_common.c
+++ b/drivers/net/ethernet/sfc/siena/efx_common.c
@@ -1285,9 +1285,6 @@ static void efx_io_resume(struct pci_dev *pdev)
 
 /* For simplicity and reliability, we always require a slot reset and try to
  * reset the hardware when a pci error affecting the device is detected.
- * We leave both the link_reset and mmio_enabled callback unimplemented:
- * with our request for slot reset the mmio_enabled callback will never be
- * called, and the link_reset callback is not used by AER or EEH mechanisms.
  */
 const struct pci_error_handlers efx_siena_err_handlers = {
 	.error_detected = efx_io_error_detected,
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 4081d2a358ee..cf08bb5b37c3 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -14377,7 +14377,7 @@ lpfc_sli_prep_dev_for_perm_failure(struct lpfc_hba *phba)
  * as desired.
  *
  * Return codes
- * 	PCI_ERS_RESULT_CAN_RECOVER - can be recovered with reset_link
+ *	PCI_ERS_RESULT_CAN_RECOVER - can be recovered without reset
  * 	PCI_ERS_RESULT_NEED_RESET - need to reset before recovery
  * 	PCI_ERS_RESULT_DISCONNECT - device could not be recovered
  **/
-- 
2.47.2


