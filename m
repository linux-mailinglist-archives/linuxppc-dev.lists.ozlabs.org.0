Return-Path: <linuxppc-dev+bounces-11378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F010B383DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 15:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBm05391pz300M;
	Wed, 27 Aug 2025 23:41:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756302085;
	cv=none; b=nmi0sS1yOiSyuqIYq9zLDAI/heYk3NwU3AnTmOno8PwEvfzG99U1ufOhuIfRwwnkvN2oWrs5wCF1fDetLmdcinGuHyBoIwDchtCiW5LqwqwjJEoOK2QZxVtQteTAaLc6AWJvxQ0MEGECAYrrOITyNSWQejBEMYet+VgIv/mX7Hxba6ukNsL45ijKohoJlMfS82e4Vy090Leehj6NtWUySvMJKIaLdKwPEJQmCIsXEPns5NNruhRzFdMbSZ0tiUEHPQP5iSW8BdvvZMw2r/r2LVkecy+WDAk71AKO/WtWiPPQod4u1XgmROJcQHsp0DLlGhHX5DdtiSliWLwwOi8PLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756302085; c=relaxed/relaxed;
	bh=2uniMGUwYVEOB37oks1mk7ka8f7EMl70bjyao4ka2A0=;
	h=Message-Id:From:Date:Subject:To:Cc; b=M8WHKr8tr6qJ7vGgyWNOuw3l0zVjBgWcGkF/R9xDRiwt0JBANmsKj6dLG8Q1COMpP6aXTjRENCAqNS7IWz3NlI6L51q+g1FhLJscvbQNThgEG4UzXNLqLwaGkosyj7vng8SbuqhwTPcxSu4B6YNULa4kFylWXe93vS3los4iSezNI4WryCi/yJhiLt2XA8EtWKp54lsuu3EPpEy+UXr4ruHXqXHJheViZ2LOMdnULpuVwZZW5U/oFNwHI1MVxL3d8RFNmb/MSEr4oHCgom9Ug4VmorfpW95v+nP0toeIgD9QmVo8Nyo0fCPa+u9uNTXqGQV8FjIBkTMZ2M+Bsr+dLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBm043YhXz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 23:41:24 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id E24FC2009195;
	Wed, 27 Aug 2025 15:41:12 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id CCCE34E5500; Wed, 27 Aug 2025 15:41:12 +0200 (CEST)
Message-Id: <21f1875b18d4078c99353378f37dcd6b994f6d4e.1756301211.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 27 Aug 2025 15:41:09 +0200
Subject: [PATCH] PCI/AER: Support errors introduced by PCIe r6.0
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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

PCIe r6.0 defined five additional errors in the Uncorrectable Error
Status, Mask and Severity Registers (PCIe r7.0 sec 7.8.4.2ff).

lspci has been supporting them since commit 144b0911cc0b ("ls-ecaps:
extend decode support for more fields for AER CE and UE status"):

https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/commit/?id=144b0911cc0b

Amend the AER driver to recognize them as well, instead of logging them as
"Unknown Error Bit".

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: stable@vger.kernel.org
---
Last amendment of aer_uncorrectable_error_string[] was in 2019 for an
error introduced in PCIe r3.1, see commit 6458b438ebc1 ("PCI/AER: Add
PoisonTLPBlocked to Uncorrectable error counters").

 drivers/pci/pcie/aer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c19..15ed541 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -43,7 +43,7 @@
 #define AER_ERROR_SOURCES_MAX		128
 
 #define AER_MAX_TYPEOF_COR_ERRS		16	/* as per PCI_ERR_COR_STATUS */
-#define AER_MAX_TYPEOF_UNCOR_ERRS	27	/* as per PCI_ERR_UNCOR_STATUS*/
+#define AER_MAX_TYPEOF_UNCOR_ERRS	32	/* as per PCI_ERR_UNCOR_STATUS*/
 
 struct aer_err_source {
 	u32 status;			/* PCI_ERR_ROOT_STATUS */
@@ -525,11 +525,11 @@ void pci_aer_exit(struct pci_dev *dev)
 	"AtomicOpBlocked",		/* Bit Position 24	*/
 	"TLPBlockedErr",		/* Bit Position 25	*/
 	"PoisonTLPBlocked",		/* Bit Position 26	*/
-	NULL,				/* Bit Position 27	*/
-	NULL,				/* Bit Position 28	*/
-	NULL,				/* Bit Position 29	*/
-	NULL,				/* Bit Position 30	*/
-	NULL,				/* Bit Position 31	*/
+	"DMWrReqBlocked",		/* Bit Position 27	*/
+	"IDECheck",			/* Bit Position 28	*/
+	"MisIDETLP",			/* Bit Position 29	*/
+	"PCRC_CHECK",			/* Bit Position 30	*/
+	"TLPXlatBlocked",		/* Bit Position 31	*/
 };
 
 static const char *aer_agent_string[] = {
-- 
2.47.2


