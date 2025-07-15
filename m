Return-Path: <linuxppc-dev+bounces-10264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C2B068D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 23:51:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhXv24n0Lz2xgQ;
	Wed, 16 Jul 2025 07:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752589274;
	cv=none; b=G0u6XHmz/i2CX5S33+NKet8rBqzXLyxjYEfzI8zkcYZgY61ecu4ejlRRWLW0TQ/yilhvF9W1GMGEbZvM7nI51fXX392ZXyaBn7yhXEzD1BTsI5CN00Q55onU1F/EQ3Boc/irkocqDWSqdO2JDWSOIeMYttM6b35XgoQVGrnmzBGdh0JAcC3Nj+rX203GEbmzmpys28G08aDzucwGNt5VW/PUCbmkLv5X+hYWzu/hQU86A8R1WsUuStw9sJGILNbs65C+kTcMeYsEXNB6xEEchHoVHzSjIQtmFIaiwoNq7fbD5sP+ibXx6e/lHeU3Peo/1SGJnyKMqW7sgD6DbCsq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752589274; c=relaxed/relaxed;
	bh=8ql62+I002uOMke/pFz+Z+sLepv9NqKCM0/JfSW6o6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+qA4VEdVknmZ1Q3zFUzC4Pqe+rf0RX/853f9VuliFUZybZOLis++pawfo5qT9QCYiJ2Uk90kR/MXwB/dJIDQJE1xD5ftPbslVE4rSfCInb3s9c/152lM49L7NZfuaD84+/EXeN1pkZ8SYF5ULwjQ7uiUEtC4EVm1qX72/JG/FJjoY1grvRiL1eXM0hDIGbIT60eLz2faMgcX7/ChRtA0zT33+3aQNb7REngMhL9c7pmKYXCYb/T+m+Zn0zgzvkZDHUVvLpC0dko3PceYMkd0h2jj4IiAlxJvlH7JmxIWveR0ZtcBblhNsI+JK/l00/a5oZCSRYuxqioWLWH7JGRlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EmlC91Fl; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EmlC91Fl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhLvs4HgJz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 00:21:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9C3CFA542B1;
	Tue, 15 Jul 2025 14:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1A85C4CEF4;
	Tue, 15 Jul 2025 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752589271;
	bh=G4Llr4ESGjruK8vWpxnM41n2mNWvPlgKfuaT3QZitm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EmlC91FlUemG4T8iSwn0YR+Cis7TCmKufMG5GpwD2mozGkYCJ3CcuYBq3J22Fg5gt
	 ECOfrGiyShuCnm7r+zJHgMx7JAFgW3aetfPlHSebZmjCk5MzBsSYtfjWipTvQFGRkH
	 8pr4WW33JxC1wHjN0vFAFBUVbm5JfZ6ba+TrAeJcDF9cp2iANoXGMz0vlnTar3MyKZ
	 ovaGmCRBYDjMz0lE8GmfUbNrrv8dr8Igp7yNNQ0Bc631w5M8aMqsbQly27Tnqh4wE/
	 +B2SEtBQriSRvYhq3Pp6IRlSlyA6NmGkUYjZFX+dXw9mp5PcPVl942cwbmBL91jqkT
	 77bcbTJ6WC26g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B6BC83F17;
	Tue, 15 Jul 2025 14:21:10 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 15 Jul 2025 19:51:04 +0530
Subject: [PATCH v6 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-pci-port-reset-v6-1-6f9cce94e7bb@oss.qualcomm.com>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 mani@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3274;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=vO0v800CGm0YlQFOi4cUiTQ2vqZZXbTs8BWQyyTq7Kc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodmPU7n0J5kTP8lJg9aNe1FZSaO/nXrn/HTEZk
 ZHlRKCt+l6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHZj1AAKCRBVnxHm/pHO
 9RLAB/95sKFXGToL/hcbo9zAzXQnyfkmN2pcsNyW7EhIf4hxdOIRHD8TR0NfjAjRJibAzR9v4cR
 WkIvzUbXTs8/X5JOPjQ3Z1I/uGUk1FIT6of2o+rcWr6qs01QYGxO3IrNudNUZ6CX9mnyYpGM9TV
 Jhd0an56Xhndu3J5KRU8UKD7WyCjLYe4iPyC/Nyb1tiS/GooDWvjMIwvtKjwzoi8HJJeHx6H/wL
 onVysaMSa+1Q/iygv7QB/ywkCFcsX97LWwSjG3bkJtMtj918d3pVARwT2uEXSA542Zhf0QdQ6se
 WWIORNZC3bttW0nKoBxa4VQXUJ1e0WB2jGBVHGwzNLRFxOQh
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Manivannan Sadhasivam <mani@kernel.org>

Some host bridge devices require resetting the Root Ports in a platform
specific way to recover them from error conditions such as Fatal AER
errors, Link Down etc... So introduce pci_host_bridge::reset_root_port()
callback and call it from pcibios_reset_secondary_bus() if available. Also,
save the Root Port config space before reset and restore it afterwards.

The 'reset_root_port' callback is responsible for resetting the given Root
Port referenced by the 'pci_dev' pointer in a platform specific way and
bring it back to the working state if possible. If any error occurs during
the reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pci.c      | 20 ++++++++++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e9448d55113bdfd2263d8e2f6b3ec802f56b712e..b29264aa2be33b18a58b3b3db1d1fb0f6483e5e8 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4964,6 +4964,26 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (pci_is_root_bus(dev->bus) && host->reset_root_port) {
+		/*
+		 * Save the config space of the Root Port before doing the
+		 * reset, since the state could be lost. The Endpoint state
+		 * should've been saved by the caller.
+		 */
+		pci_save_state(dev);
+		ret = host->reset_root_port(host, dev);
+		if (ret)
+			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
+		else
+			/* Now restore it on success */
+			pci_restore_state(dev);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
 }
 
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
index 05e68f35f39238f8b9ce08df97b384d1c1e89bbe..e7c118a961910a307ec365f17b8fe4f2585267e8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_root_port)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.45.2



