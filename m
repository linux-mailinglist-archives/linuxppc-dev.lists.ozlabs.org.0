Return-Path: <linuxppc-dev+bounces-14339-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46611C6D9B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 10:10:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBG162FF5z3bpt;
	Wed, 19 Nov 2025 20:10:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763543450;
	cv=none; b=a4QybON+K/BYN5ZjKE3jzmvKjyMyk0FWDYZU7wwSCH3j7wHD0PKEbb2MzWlUAsImhARKtCs5cGKKfKMyRSKX2e35n7mGHo63/A6ambuS+Taf4upy9PnAD4O0xJ0BZOfRWj7fs8VBB0MWFr7bJ4iYFq8BthSi3E6+vGZRd0uKvF6Auydwm9uCZ0O/smsu6jpL+Mg2AF9+KWx3+Mw8WmHCKrvD/EBw3LgWcns6Hj2WI9pp63j+SYbyEkFVjLx8ZKolBTnS0bViDDU7Fu/4K8IivB67c6irN1LLfYmrLDszq8JokPmORlRFQ/WUBiPFn4eN5swj/ZU87LqHjME0LtKs/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763543450; c=relaxed/relaxed;
	bh=Ol7Yca3OwirrWn+clPayPFntNbsnCjfymBMu4YYkhk4=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=V+7PQRoTBBChOjX6rvhAST+zf/06Gee4VF5bQuAKtUlRmijV5qEh/CnVNFqHM3+H6AvHJEqFJy6QWdirnaZjQjMYkGt1WuhVa15/HDcRNFFCmpeauWzpB8Xi/+lth4zZmxUmmKIqtyCHNJR2CZjDwQUs5ZReuInn0KBqumkNAt2HFhyH2StkiyJv7v/kIOHqUvAexs7pmk30Ic4TiD4baQ57HGX+Kf84p+2B5lFQjDdtsDqIbos8T8+2kBOWremNm1PPm5Xxp59fdxrehjXg414DongutPakktGmM0mX23dkV+Pmb/MZbGNgEdxQ2vZKqB/Sd+MBc8+kTbZdq6NdCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 478 seconds by postgrey-1.37 at boromir; Wed, 19 Nov 2025 20:10:49 AEDT
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBG153MNqz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 20:10:49 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id CA1C7200803E;
	Wed, 19 Nov 2025 10:02:43 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id C0714E729; Wed, 19 Nov 2025 10:02:43 +0100 (CET)
Message-ID: <fd167945bd7852e1ca08cd4b202130659eea2c2f.1763483367.git.lukas@wunner.de>
In-Reply-To: <cover.1763483367.git.lukas@wunner.de>
References: <cover.1763483367.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 19 Nov 2025 09:50:02 +0100
Subject: [PATCH v2 2/3] PCI/PM: Stop needlessly clearing state_saved on
 enumeration and thaw
To: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
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

The state_saved flag tells the PCI core whether a driver assumes
responsibility to save Config Space and put the device into a low power
state on suspend.

The flag is currently initialized to false on enumeration, even though it
already is false (because struct pci_dev is zeroed by kzalloc()) and even
though it is set to false before commencing the suspend sequence (the only
code path where it's relevant).

The flag is also set to false in pci_pm_thaw(), i.e. on resume, when it's
no longer relevant.

Drop these two superfluous flag assignments for simplicity.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/pci/pci-driver.c | 2 --
 drivers/pci/probe.c      | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 327b21c48614..7c2d9d596258 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1133,8 +1133,6 @@ static int pci_pm_thaw(struct device *dev)
 		pci_pm_reenable_device(pci_dev);
 	}
 
-	pci_dev->state_saved = false;
-
 	return error;
 }
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index c83e75a0ec12..c7c7a3d5ec0f 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2747,8 +2747,6 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 
 	pci_reassigndev_resource_alignment(dev);
 
-	dev->state_saved = false;
-
 	pci_init_capabilities(dev);
 
 	/*
-- 
2.51.0


