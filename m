Return-Path: <linuxppc-dev+bounces-12781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FF4BD02A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Oct 2025 15:25:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cl1SG3zFZz3ccS;
	Mon, 13 Oct 2025 00:25:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760275518;
	cv=none; b=J0MnBXTz41TAOEwuyYjxkb/EuAR3HjjL9YA85kjwIMs+5se/2UOvjQ3CAG+E0PadYZNj3ob+rhcIoprB7tObXEoBxOH05bgp/B4k9yvcemSmyasJjJVBdsw/LrEA3bYWRsAmXVHbiMnbU3SfMVg8CWF1zRomWiTPlOjbn4s3IRSSAJNmXgtKz5NSat341uDJMroU8dGolH1cP9019HITw6XLk5alVbplnIsMoKYYGiAeXAe1QmoPg35zaiCjxqcnmRFhmDGl24GXbi3QzwtIavGyzLNff1km6X3QqtUXd6/xyMh133TIc+kKD2cB97kOafvCe0ePgnBZEl7GHHhNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760275518; c=relaxed/relaxed;
	bh=LmsG+N4BZlaA7NFXXZGQO+tev2GzEgxLbvOa7WBQzZE=;
	h=Message-Id:From:Date:Subject:To:Cc; b=kb/WPN6YPa0HEGW1jeGD4XBdPVZJhgCsTmdpXmQhfwlVgZ2LrgsADDAU/hQ/FP2ImbrVZJCq17m5SwCbZnTeHNWj8gJgCkfYO3Rge+PuX7mwocdXPvMvwxU2TpDRsqG7Wnhlolm6v8r7FwwOsNlSXIgJKmF2fL9E3W+AC8v+OQr5heqlEhD35bXM/kJlfsjoboEA5LT53TLA0RZP6u4aGFKuWMiTHEBVOp5L+Pb3TpiV45AR5RAj5wz4IqS70RGPkbuLrDOqTLmMXnhog8VV2SlpNw/ddXADTrxjX+QPa6A8g2/83x2grxi3yMtfad1ux/yEdg6Q2NOE8z7ETGdWTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cl1SB6Xlnz3cbg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 00:25:14 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 3703D2C02BA0;
	Sun, 12 Oct 2025 15:25:02 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E910D4A12; Sun, 12 Oct 2025 15:25:01 +0200 (CEST)
Message-Id: <cover.1760274044.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 12 Oct 2025 15:25:00 +0200
Subject: [PATCH 0/2] PCI: Universal error recoverability of devices
To: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
    Giovanni Cabiddu <giovanni.cabiddu@intel.com>, qat-linux@intel.com, Dave Jiang <dave.jiang@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
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

When PCI devices are reset -- either to recover from an error or
after a D3hot/D3cold transition -- their Config Space needs to be
restored.

D3hot/D3cold transitions happen under the control of the kernel,
hence it is able to save Config Space before and restore it afterwards.

However errors may occur unexpectedly and it may then be impossible
to save Config Space because the device may be inaccessible (e.g. DPC)
or Config Space may be corrupted.  So it must be saved ahead of time.

This isn't done consistently because the PCI core doesn't take care
of it and only a subset of drivers do.  The situation is aggravated
by the behavior of pci_restore_state(), which only allows restoring
Config Space once and invalidates the saved copy afterwards.

Solve all these problems by saving an initial copy of Config Space
on device addition which drivers may update if they change registers.
Modify pci_restore_state() to allow using the saved copy indefinitely
and drop all the workarounds for its previous behavior that have
accumulated in the tree.

Lukas Wunner (2):
  PCI: Ensure error recoverability at all times
  treewide: Drop pci_save_state() after pci_restore_state()

 drivers/crypto/intel/qat/qat_common/adf_aer.c    | 2 --
 drivers/dma/ioat/init.c                          | 1 -
 drivers/net/ethernet/broadcom/bnx2.c             | 2 --
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 1 -
 drivers/net/ethernet/broadcom/tg3.c              | 1 -
 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c  | 1 -
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c  | 2 --
 drivers/net/ethernet/hisilicon/hibmcge/hbg_err.c | 1 -
 drivers/net/ethernet/intel/e1000e/netdev.c       | 1 -
 drivers/net/ethernet/intel/fm10k/fm10k_pci.c     | 6 ------
 drivers/net/ethernet/intel/i40e/i40e_main.c      | 1 -
 drivers/net/ethernet/intel/ice/ice_main.c        | 2 --
 drivers/net/ethernet/intel/igb/igb_main.c        | 2 --
 drivers/net/ethernet/intel/igc/igc_main.c        | 2 --
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c    | 1 -
 drivers/net/ethernet/mellanox/mlx4/main.c        | 1 -
 drivers/net/ethernet/mellanox/mlx5/core/main.c   | 1 -
 drivers/net/ethernet/meta/fbnic/fbnic_pci.c      | 1 -
 drivers/net/ethernet/microchip/lan743x_main.c    | 1 -
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c | 4 ----
 drivers/net/ethernet/neterion/s2io.c             | 1 -
 drivers/pci/bus.c                                | 7 +++++++
 drivers/pci/pci.c                                | 3 ---
 drivers/pci/pcie/portdrv.c                       | 1 -
 drivers/pci/probe.c                              | 2 --
 drivers/scsi/bfa/bfad.c                          | 1 -
 drivers/scsi/csiostor/csio_init.c                | 1 -
 drivers/scsi/ipr.c                               | 1 -
 drivers/scsi/lpfc/lpfc_init.c                    | 6 ------
 drivers/scsi/qla2xxx/qla_os.c                    | 5 -----
 drivers/scsi/qla4xxx/ql4_os.c                    | 5 -----
 drivers/tty/serial/8250/8250_pci.c               | 1 -
 drivers/tty/serial/jsm/jsm_driver.c              | 1 -
 33 files changed, 7 insertions(+), 62 deletions(-)

-- 
2.51.0


