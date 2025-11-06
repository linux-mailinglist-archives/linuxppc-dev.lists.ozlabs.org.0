Return-Path: <linuxppc-dev+bounces-13899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F040C3D159
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 19:37:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2WBJ3cWnz3c8W;
	Fri,  7 Nov 2025 05:36:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762454216;
	cv=none; b=eFGioSJ15J5s8fa49OKyltty/iuQ6GSjvrNTSAnkFRWqz5sgJMvnXQRY4VwEiHTViXw0JJ2ItMPJMJNgIUNRZnYsrbRtf3zueZr+BjZnK9fbxDhQ+TTP0ByLMnOgwlveuBKUj4fkqaK2tFIWC/SAndnsSVz34hfctBhPbKLVaX9535R1bQrIT+dXTbTlZZJz2Xngbgx8oE8ADHTlaP4NQUcHDSSYgaLUWhGwodeBTxVALXTSZIe7ICDs1IO3x3OswReKhviwqwrS/dAHrM92c48IBAuxvNLxJ1Kv3OdOsC5UWu4PSCBO3ve4+HOOTTZfMlSwFhGUb0aXb9IFccedVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762454216; c=relaxed/relaxed;
	bh=xTkOlpA3q7ykHOJbjoRZAPSBFGBd1i7KSj9RcROqJNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5W43fmS0NDrEWpOc66F9Yxv7HOFgLXqZQWohc7QecF4dYzQgGEURMSiuz6wygtzSDPoMZbzkvyuiADupb1vC8V0Ejq/e3tyEQJh7+pQX5vFuwcVeG9Rlf4IEA985YL9TymACX0dlKXBFEr66Cfe8e9jxLFXVHQzuDivSCQroCR2QkHCVJs9l8AyjYO+y9BIBNDeDDTs8FhNJcQjqnbTIsGsV+ObZh/1GtjCa/nGjz9+sU2wV1ZUzBx/8XrQd1/io2gGhXyMb3rC3if8sus3su+hAaYM1vnttAmYkRr1jzdv5guUmN+0KGr9agJxiaAjyKftMrG0VrUBtJ95ZxY3ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rO3Eqy1A; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rO3Eqy1A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2WBH3hJKz3bt7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 05:36:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94AD6618E4;
	Thu,  6 Nov 2025 18:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4714FC4CEF7;
	Thu,  6 Nov 2025 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762454213;
	bh=WZNwtxVV2uegNUg0XelyPK7YX+WuqMbWLKaUnuqlRTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rO3Eqy1A5ms4ZtKiqqFF/KKhlZiVemD/ehVK4HQrTdhA0IzDdc+cAYp88fW/XmBLB
	 qp4PB5+MEOdUSp12T5bQ9tMiGbTJ6gp5IZI9NuTWF0Zy0dd7B6BaGmCXSI3a6jIbwd
	 MsqSlwEVnS3uFqKEU1qkScx9kRyWwILAgpKKBePTiqd2SKU89MfPLlaN+d/Bt1pYqy
	 M/ItazlaE/y7tEar6lx6WawE6Eimz9CfmE+9Bd0kTKG8zVhYyZxi2q2i6ZSlHxl8uF
	 4qAPsRBP/5GZiRTVxABF05VhdqDFtMtP1n6Pnm9igpi06GEeAevhoMWtaQi0UCsC1V
	 qsKWM/V5adPJg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	luigi burdo <intermediadc@hotmail.com>,
	Al <al@datazap.net>,
	Roland <rol7and@gmx.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	hypexed@yahoo.com.au,
	linuxppc-dev@lists.ozlabs.org,
	debian-powerpc@lists.debian.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/2] PCI/ASPM: Avoid L0s and L1 on Freescale Root Ports
Date: Thu,  6 Nov 2025 12:36:39 -0600
Message-ID: <20251106183643.1963801-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106183643.1963801-1-helgaas@kernel.org>
References: <20251106183643.1963801-1-helgaas@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

Christian reported that f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and
ASPM states for devicetree platforms") broke booting on the A-EON X5000.

Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Fixes: df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms"
)
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..44e780718953 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2525,6 +2525,18 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
 
+/*
+ * Remove ASPM L0s and L1 support from cached copy of Link Capabilities so
+ * aspm.c won't try to enable them.
+ */
+static void quirk_disable_aspm_l0s_l1_cap(struct pci_dev *dev)
+{
+	dev->lnkcap &= ~PCI_EXP_LNKCAP_ASPM_L0S;
+	dev->lnkcap &= ~PCI_EXP_LNKCAP_ASPM_L1;
+	pci_info(dev, "ASPM: L0s L1 removed from Link Capabilities to work around device defect\n");
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1_cap);
+
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
  * Link bit cleared after starting the link retrain process to allow this
-- 
2.43.0


