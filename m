Return-Path: <linuxppc-dev+bounces-7755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972CA923C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 19:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zdl1T5P4hz3c3w;
	Fri, 18 Apr 2025 03:16:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744910202;
	cv=none; b=RrIAE9hOjmKeyt4hy3zW+4NzwomjjK4j6e8ocvgJIi37HFOQDHhLwJydyKkSSgn6Ga7Nqubq0q5+biAFzEzkfIwoKGyHf+9fjVu4M78lJuYRe0TzaZ6DorVtzXG3zxN2Qv++TwvlqgOuwnEG0VTzrxrdZct03U+/0i4APN3lhwV0koDl9bNtih9tz+/uJo6fVYhJeHKsVdJQAKzpiuAB2ypglp51vyMtiddfiLtLdvYFaTF03MOeIF+kd1kadol/pG8lsVQJFfbmdF/bJN+qpgTNYCodGDKuA5sTNkZVHbG4js/dzCbGBpZrY2d9JmlskJKlxiJCj2cCGZuW5E8pIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744910202; c=relaxed/relaxed;
	bh=vgdQ4ldG8Yd4PsgVO+ZhhIFFPimFbRSky/89G6E5f4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D9lZVfgx1j+4cbe1iVFkmsLtIFijEPfc65pYhbGnhb0W22ErDSXE15+UYVpco4Sjs2RYduDT1cnmCl4/LhrpacVkU1UZ0b6dUemhfVtvxbBGOKgrKkTJfOGlfcCwTkRTOE4/c8WcbLJpuZJjiTyeyFZnpQx3XxFYpTWEci/I+kmWKlc1UTU8RegnPFrSA0DreQ7qPBqdE6BLl4/FOScFdfmZVKSRbyu+7LtfaiMlicUfH8SDJDafWmtH9sLm9BDhiZBkcvlZcfa/hOehuwOPm3VkKr6UUcabnsLfg3A3hGML3oHiYOO/4Flu8wmYLFesuSkW/3NSVXZerjp8QtXKBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gxgP+zhp; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gxgP+zhp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 10521 seconds by postgrey-1.37 at boromir; Fri, 18 Apr 2025 03:16:40 AEST
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zdl1N2lF0z3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 03:16:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 876FC6845F;
	Thu, 17 Apr 2025 17:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04292C4CEEA;
	Thu, 17 Apr 2025 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744910197;
	bh=j7a1MWfbRFpfxfm/Ng5E8w9b6pWr++a/2lyhhriAkgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gxgP+zhpaU7X1ueylO1Luuv59xPMnGK+XkGlxHboBA4LUqOcwRWxBgAWp7A0LZP96
	 O+h8wZB3dRMoXpq/2kUxlh/7YpkckmIacDUHaDc7UDXaBl+Jz9v3UkyXy83wJa1igh
	 EuRR3vMDB6znZWZvZ2S1kOCVek9IhKSy5+KGuzK/FSoi6h1KJ+PHfbmk5HD0lAmNmF
	 kxIV7qOcEMFANjEjqGX63aSFWXmL+AEDzascIB9vA9PdpfrHJn6J3QnliQzOwJeoF2
	 lZqEXbtrrwOWkG0lwzwSodsTEF3J3l0M72sy8Q3SkwpS/FjGguhHAGNyV3BpRJrA7V
	 HScGcjhEYJWqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8408C369D0;
	Thu, 17 Apr 2025 17:16:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 17 Apr 2025 22:46:28 +0530
Subject: [PATCH v3 2/5] PCI/ERR: Add support for resetting the slots in a
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
Message-Id: <20250417-pcie-reset-slot-v3-2-59a10811c962@linaro.org>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
In-Reply-To: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2766;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DxjgbttCz+WbWbTBQh3uh5PZxc6tk82mAeHt4QTMKaE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoATdvYVK0GQzi8sgrm/ZgUCcsXnUDTGn+R5woL
 GlG2618bPiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaAE3bwAKCRBVnxHm/pHO
 9R1nB/4mCdE+kKaobUu8xgqLp12VIK1lyMLUue8d1Oth+RUvL8sS+yxd4LB6Fyzs/mOxUiMk9H/
 ciVe5BciCPKbXJTceNhCr29+4sbd+EorHB0I/OxV2abPOr5PzUno1WHPIGZEwo18l5BjFHBiLDj
 JE7FV2UBmHNq6L/5khv8XpKbKu/uM+0kLdETMu1LQ0PyzvYgzNQknk0jZfBFb4ujvvPJMizNfEF
 1bcqAbBgus7YPWMgcFrKyX1pmC7zonfc0vDo9IQDdnGT8HWat1cRgaH0q0Bg83XYaDl3Lf7p2Ub
 y1D3PjC6s1NXtA22GQWiLKxDEQv79CJFwsq6fqs7jmqCAPEF
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



