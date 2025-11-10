Return-Path: <linuxppc-dev+bounces-14020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ED0C49908
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 23:30:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d549H2hbPz3060;
	Tue, 11 Nov 2025 09:29:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762813795;
	cv=none; b=au4QlUHN19ONvvtBZgmtfQsWoHLX+L1UkOyDANVUOuj7Obgm1LzG1+TJbETYBeLHrKxFJvzKvIiNMefFVnR4YFGTp/AsiIwLvMo5q+tGYJUUfxp8KcNNwfM43QvGkOq1XQKwbvsUF52o2+gbmYYIVfiCjVkMiU1VcvKSYt/T3dBI7EjqgWrStb/gIXozj+0NZagTj2ablw63cntTbvieRiuIcRdKd6qbpZBBWWOx/oDitl7u+lSLls6rc7C7xQJ0JK+2zlmES8WnnFDDWOMnvfwjpPTXw7T3WUbEUUwIWzLDt4tK7s41V/XANaLH8ThT4Y257HiNs13wl3JyMKdQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762813795; c=relaxed/relaxed;
	bh=Nhvm1QdvokVke6+gopUrHeUnwSeZx2fQVGizWKlz9x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMcQ/VmSamyeWr5wv4A3IwOIImnphuz/grQjQMM4yKMsbyq0FL8n/ORsn9cBOg2Z578iG1/GkfE3uwZwBTzc9HGFtD6vWnwOWJTEyyioN6Gd+USH9zDx0K1RO2MJPrQ5qINaQkdXf/ACJwR0qaTlP6wzWREiypgMeH5oedQEeh0vJpx/rJXSJGqyYAnGxGRH7PQRRLHaRyGiAh6HPkLUDRDK3GQm05N21uDNr2VTU6zr4irfWYJzL56mPKDVG7/X+tVaHZ/KHCaA0X28d8WXPGG+yU/DWNNwWKCWQeiI7B2cbTHml1HM/Aptl771W2rdQoGX15xXD7cvuPF5YPqCuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rmwSZj/R; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rmwSZj/R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d549G5phkz308g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 09:29:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F192A601F1;
	Mon, 10 Nov 2025 22:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D44C19423;
	Mon, 10 Nov 2025 22:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762813792;
	bh=psqvw1U6/SBJm+8SC9eq36+YROk3NZIjyrzaiC/0Ys0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rmwSZj/Rzf9cPQBKu+Fe1z4KaQXQxyTON//wGOlmmhHpzxrYpozRO3vbbIppWtMCj
	 gWOy+RTwukP3QWrVKfR7FARDJppBvELnHxBg85I8TqFqPq7eEhaXWGtdMOwIQNdYQX
	 fr0IuMxKP37DvWYFQ826uoe2IMag5HpP/FPxjxwNKXreN14pJ6yIxtDtVWJIkkHHnW
	 uNE4EhGfEsYZWuMz3WuK3VfgwsPttdYdzzyLBSxsWJ3c69R6P5Gp7jN5F13ls10HVx
	 tC1xyAXUjkxxI7QGikQsZoQVt+XfqcEkQuKCJseFBmwqNZtg0+scUe1qN+HnF1rIhD
	 ztVLNbx+Bwlfw==
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
Subject: [PATCH v2 4/4] PCI/ASPM: Avoid L0s and L1 on Freescale Root Ports
Date: Mon, 10 Nov 2025 16:22:28 -0600
Message-ID: <20251110222929.2140564-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110222929.2140564-1-helgaas@kernel.org>
References: <20251110222929.2140564-1-helgaas@kernel.org>
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

Override the L0s and L1 Support advertised in Link Capabilities by the
X5000 Root Ports ([1957:0451]) so we don't try to enable those states.

Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Fixes: df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 922c77c627a1..b94264cd3833 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2523,6 +2523,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  * disable both L0s and L1 for now to be safe.
  */
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1);
 
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
-- 
2.43.0


