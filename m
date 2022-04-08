Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF754F9996
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 17:33:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZj2L6tYtz3bft
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 01:33:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=NFvwQzSl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.121;
 helo=smtp-relay-canonical-1.canonical.com;
 envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=NFvwQzSl; 
 dkim-atps=neutral
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZj1k4nrTz2yJ9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 01:32:57 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2C69A41DC2; 
 Fri,  8 Apr 2022 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1649431970;
 bh=SEHB8Gr2t8wcvSx8XgT0ofHfG2Fduuwte9ePkJVoBlY=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=NFvwQzSlzqaEx78sYmn6INCxcrKaodKJdWWEnsj3C6eM+JXfk4btowHLO/+4PHY18
 4FEb6ktdW2VCCPP7+KBIwsbZXEJLoIlhQsHsrINYq4RydoSXaDoMqhx4wDw0mtax9T
 3Ao9Dgo/ubU04U8Bs1XS6zBCuwgZS8EUMVgV7BT4k8HOqwVbp2fF8ulO0jUNkzi1kv
 DPnohqjHh83WmE7YDd/XjnGlh89Z4+D1FNNDq18RLvda0QMw2GMH13zccoTuCCO5wP
 TFqeGTZ9Iogz2MFYG83n507nsRp5rUXfQsgjpzIgUaKln2hamuQzSot60/u8olQyuz
 kAn2l8RAj2NcQ==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH v4 1/2] PCI/AER: Disable AER service when link is in L2/L3
 ready, L2 and L3 state
Date: Fri,  8 Apr 2022 23:31:58 +0800
Message-Id: <20220408153159.106741-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Oliver O'Halloran <oohall@gmail.com>, mika.westerberg@linux.intel.com,
 baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Intel Alder Lake platforms, Thunderbolt entering D3cold can cause
some errors reported by AER:
[   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
[   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
[   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
[   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
[   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
[   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
[   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
[   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed

So disable AER service to avoid the noises from turning power rails
on/off when the device is in low power states (D3hot and D3cold), as
PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
(D3hot), L2 (D3cold with aux power) and L3 (D3cold).

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215453
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v4:
 - Explicitly states the spec version.
 - Wording change. 

v3:
 - Remove reference to ACS.
 - Wording change.

v2:
 - Wording change.

 drivers/pci/pcie/aer.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9fa1f97e5b270..e4e9d4a3098d7 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1367,6 +1367,22 @@ static int aer_probe(struct pcie_device *dev)
 	return 0;
 }
 
+static int aer_suspend(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+
+	aer_disable_rootport(rpc);
+	return 0;
+}
+
+static int aer_resume(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+
+	aer_enable_rootport(rpc);
+	return 0;
+}
+
 /**
  * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
  * @dev: pointer to Root Port, RCEC, or RCiEP
@@ -1433,12 +1449,15 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 }
 
 static struct pcie_port_service_driver aerdriver = {
-	.name		= "aer",
-	.port_type	= PCIE_ANY_PORT,
-	.service	= PCIE_PORT_SERVICE_AER,
-
-	.probe		= aer_probe,
-	.remove		= aer_remove,
+	.name			= "aer",
+	.port_type		= PCIE_ANY_PORT,
+	.service		= PCIE_PORT_SERVICE_AER,
+	.probe			= aer_probe,
+	.suspend		= aer_suspend,
+	.resume			= aer_resume,
+	.runtime_suspend	= aer_suspend,
+	.runtime_resume		= aer_resume,
+	.remove			= aer_remove,
 };
 
 /**
-- 
2.34.1

