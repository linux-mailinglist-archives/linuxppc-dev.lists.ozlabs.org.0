Return-Path: <linuxppc-dev+bounces-7699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5AA908EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 18:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd61B6vKGz3brl;
	Thu, 17 Apr 2025 02:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744820958;
	cv=none; b=Rf7PZ3/zjSx04m7nCzWSIghZHX/vKyUiHmXeRbfPOA+B8wO5+0XYr1JrIaaBocdSGRNJC0yK1ffzWP3vMZUJ8VSGQcVq/pci9jiYW4upRJpb8vDBb2P9a27SpHNWVxwLB0Z7YrGEvEAzQTqUu2ZfFleh71jm6LanDfq1Bbg4oGqB3hjF8Ck5Ee2m6mbqcPbq4uCdKjpWoHl9eX4WVhKywdzr959HKKyDq5u0Om3LWEXJuYlPUj2ETYjjwm7ZJ89/43I0It91Z3SaERhESvCm7Rk0tfUI+5COgFLzWqqmxbBS+rI6fHXt8Am9lzLX/XY+QMqqxlTJSssbLe1PdUA0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744820958; c=relaxed/relaxed;
	bh=vgdQ4ldG8Yd4PsgVO+ZhhIFFPimFbRSky/89G6E5f4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFFFX2PV6AMBSwTicctor42K5WXuLh4tqpPnZYpuinm+fg93bonPk39l3ZgsfUdGXq3aomV29oL41y2ebN9Fkyt19MAxInQI8gykpLkHscXum/Y4rSvlntb7M7lW5OAPVVrvjvJULeSn3+J1fFJJKdVl+F0+T5//L7Lu8a7kR3hX0SYXxs860YY6YpkmxnFkZJIAEcDEzaYCPcBbYbeYYpYr3ghq0DLx0Str0hpPtpLGXByzN4GedsC6ajPoAL9tbfPBSAWhshK5si9DdEseg3c73SUW8tk7wcv64TjSQdZuWDk1ZMtgN4ObyuAm6NvUlB4usn/m/KboSfjlUD7SiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucPkNdZI; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucPkNdZI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd6195tsXz3bqQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 02:29:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E97D4A300;
	Wed, 16 Apr 2025 16:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5247EC4CEEE;
	Wed, 16 Apr 2025 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744820955;
	bh=j7a1MWfbRFpfxfm/Ng5E8w9b6pWr++a/2lyhhriAkgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ucPkNdZIG2w/r6/fz5JZk/qs61NNDlEpYY7H7aqvoxWCKi7PQZ86Ld0SVT1KjvuDk
	 C0C/7s20L2WV4kZkbRPbyxpPB/vHaxKzkZi/LwjsuU8gt1LRPi+B87zBuVpDkYr3Fj
	 avjfj6uMKCyNy2AmisGa4avLGHD41a2Co91Lawe+Ja7+Q4iwErgBB7cywZQSFVjD9w
	 jNjhIcILWMuGuDL7xItMcyqRC/DrVyMxxH6HP8f8W+F8t9a+5vooe+6/SjjZCIhd2f
	 aUhJe1szUUIaN+m6UDulgc7E9Gue+kPbOOiEQASSCNuSZ+rGm2C3EJS0FJotY0u6L+
	 66zgCckN8q0bg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A00C369C5;
	Wed, 16 Apr 2025 16:29:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 16 Apr 2025 21:59:04 +0530
Subject: [PATCH v2 2/4] PCI/ERR: Add support for resetting the slots in a
 platform specific way
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-pcie-reset-slot-v2-2-efe76b278c10@linaro.org>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
In-Reply-To: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2766;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DxjgbttCz+WbWbTBQh3uh5PZxc6tk82mAeHt4QTMKaE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBn/9rXPir56LKePoLEBXt0d8b+kq7X+ZFgid+RI
 JzzZ1AKKwuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ//a1wAKCRBVnxHm/pHO
 9WTDB/9DvoXiP4Dq0I6q4cMG31g9lImU8jRuTybuyvxvopbn/Mixdu1u8Dy4W5c7xzTqjMNMTIi
 R22LFIph88ll3whCEIsdH7n45oO3SwPgXOvaQlC2imWxUPVKfL9SGTTOlrDX6yRGlXNSxpRpo1F
 TfNNPT2bqFz1knIxaskBgdyollmA67HYaOMXmgW7hEK53TIWWxbSHb/6ASfjm0HyUIVmjLpZAN1
 Sc3z32OoK/DMMvGF1dRxrWuj9Qfz/NeQcHb5uuLXur5L2QlkkDB6YjtjrSM1NTcwS5h7QfKtPxm
 VapGFs7dlSZ7/g/ZJqdw2gr9Z2DMQ8Jmtxqr1RB1jKHmYF4U
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Some host bridge devices require resetting the slots in a platform specific
way to recover them from error conditions such as Fatal AER errors, Link
Down etc... So introduce pci_host_bridge::reset_slot callback and call it
from pcibios_reset_secondary_bus() if available.

The 'reset_slot' callback is responsible for resetting the given slot
referenced by the 'pci_dev' pointer in a platform specific way and bring it
back to the working state if possible. If any error occurs during the slot
reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pci.c      | 12 ++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (host->reset_slot) {
+		ret = host->reset_slot(host, dev);
+		if (ret)
+			pci_err(dev, "failed to reset slot: %d\n", ret);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
+
 }
 
 /**
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.43.0



