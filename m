Return-Path: <linuxppc-dev+bounces-10906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87365B24023
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 07:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1xZ30vqqz30Sy;
	Wed, 13 Aug 2025 15:21:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.204
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755062507;
	cv=none; b=KMjyOdpME+VdDo7pRIWHFNcG+/5kEMHPND92HTexu8C/0rU/SnBoOYsM/c/EnKMzPvw6QnDFYUfdJTBMV76ZS3AmeWNThZ+w7cFss+7cAuWOpAam0mwirMGqkGCUAnBgqc4alfjowJOiQg1QcW6aNidZyB8sAbr5e8x+juUv8uy7+pcYyZfx1sMuqnwuM/kh6KjMlN5elciqVL+IgsOGoCI/Img5ksoXyq6o+7WnSlut8cXhtU2zFJppJPTNH4mJPsa9Gt1tYiRjMhOXZmrwqK/cA5gQxhKSesJ1mdrpIhgMmamwgll8ZSRBq0RkYtU5gqpgUvq6Vaktr2PECY9Mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755062507; c=relaxed/relaxed;
	bh=STLNBxPM7JpJgkStp4f+zUu17SoO+OJ7jkxquWVqNfw=;
	h=Message-ID:From:Date:Subject:To:Cc; b=Rf2VpZdhszFYrqXIvFqLFwVhMg6UEvLsF680hKahEVGAgvQrpOIzQ3TfPj4RmlK2se4U9TNj4DLCPkNbh6GGlKa5DCc9mD05gszt7QezrujmvYplok5J0q/uCwTrAEdFpOOqcmk2CWroHxddE6c7ump8XYUy1RwUDy2R1bhHqcG8yU1gOfI0ks4Dj1Kb7AIgKU3ds3iNTV5Ap7u2WBQcGWbRPqoYuuby06ZyzYNmUPFqFoIBMTlaEV8dET6aAgS3XaPujH8cuhPw2zpm5VqeBjRTevhVaw0v1ng6WGQxBomboKA9BVNuPCCr2wRr7AVKR55RuFFc8+Pbs+ZQsh2iGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.204; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=83.223.95.204; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 599 seconds by postgrey-1.37 at boromir; Wed, 13 Aug 2025 15:21:46 AEST
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1xZ20T94z2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 15:21:46 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with UTF8SMTPS id 726BB18C48;
	Wed, 13 Aug 2025 07:11:36 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id 3B6E06000EA5;
	Wed, 13 Aug 2025 07:11:36 +0200 (CEST)
X-Mailbox-Line: From 1d72a891a7f57115e78a73046e776f7e0c8cd68f Mon Sep 17 00:00:00 2001
Message-ID: <cover.1755008151.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 13 Aug 2025 07:11:00 +0200
Subject: [PATCH 0/5] PCI: Reduce AER / EEH deviations
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>,
	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
	"Sean C. Dardis" <sean.c.dardis@intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	"Mahesh J Salgaonkar" <mahesh@linux.ibm.com>,
	"Oliver OHalloran" <oohall@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	Shahed Shaikh <shshaikh@marvell.com>,
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	Edward Cree <ecree.xilinx@gmail.com>, linux-net-drivers@amd.com,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vg,
	er.kernel.org@lists.ozlabs.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
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

The kernel supports three different PCI error recovery mechanisms:

* AER per PCIe r7.0 sec 6.2 (drivers/pci/pcie/aer.c + err.c)
* EEH on PowerPC (arch/powerpc/kernel/eeh_driver.c)
* zPCI on s390 (arch/s390/pci/pci_event.c)

In theory, they should all follow Documentation/PCI/pci-error-recovery.rst
to afford uniform behavior to drivers across platforms.

In practice, there are deviations which this series seeks to reduce.

One particular pain point is AER not allowing drivers to opt in to a
Bus Reset on Non-Fatal Errors (patch [1/5]).  EEH allows this and the
"xe" graphics driver would like to take advantage of it on AER-capable
platforms.  Patches [2/5] to [4/5] address various other deviations,
while patch [5/5] cleans up old gunk in code comments.

I've gone through all drivers implementing pci_error_handlers to ascertain
that no regressions are introduced by these changes.  Nevertheless further
reviewing and testing would be appreciated to raise the confidence.
Thanks!

Lukas Wunner (5):
  PCI/AER: Allow drivers to opt in to Bus Reset on Non-Fatal Errors
  PCI/ERR: Fix uevent on failure to recover
  PCI/ERR: Notify drivers on failure to recover
  PCI/ERR: Update device error_state already after reset
  PCI/ERR: Remove remnants of .link_reset() callback

 .../ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c   |  1 -
 .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  |  2 -
 drivers/net/ethernet/sfc/efx_common.c         |  3 --
 drivers/net/ethernet/sfc/falcon/efx.c         |  3 --
 drivers/net/ethernet/sfc/siena/efx_common.c   |  3 --
 drivers/pci/pcie/err.c                        | 40 ++++++++++++++-----
 drivers/scsi/lpfc/lpfc_init.c                 |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                 |  5 ---
 8 files changed, 32 insertions(+), 27 deletions(-)

-- 
2.47.2


