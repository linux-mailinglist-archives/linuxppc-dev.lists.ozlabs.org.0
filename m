Return-Path: <linuxppc-dev+bounces-13219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A8C02D97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 20:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csvBK10Gkz3bfF;
	Fri, 24 Oct 2025 05:07:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761242825;
	cv=none; b=Jv5gvDpFUh+zIHuIXIVaxWz5qfFxvi05BBvRnozGEyBc6mExKUNcdkqKgEerWeBlb+Z1o+Ew/dxTeh1sqfCa0RzA6QoCe8xrlEs5bZl9pO0BDM6Ovfz+lGSWA5LPlzOcVCwZBKRn59phHHPirXQL7MZfQfgfukChhF3B3xpOYTdbMO5k5qsRsXdQxwwYigz2KRVDLQI8zHQVuZLx2fd1eg3zFIwt2rnZAqpbGc7WKhg5P027ZLQToEtpt3MHfcA+KaSJ9kU16n9Jvl1MqDic2vBlquRwO3pmAPK5Qt/aHamNgqKR7yoqrjski+MPMd1/UJHpDhq+tRHQrOjcGDN4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761242825; c=relaxed/relaxed;
	bh=pD4OZ8sTcScrzlsfkjnPhmFjSQEvbzJ3KSCjybNomxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WgjFrgmwRBgvUE1cZSldMulrmLF7x/bOvk3nXKbWKMg3THcDDgr5ddPeCIbmGgjJ3G0K5mHPMhwyPGb7j2o4hkmDgFy2IMdGAWDG8AphxqepVl5wYOXudTUMzOLa7pEUXb5ZAq1F9yASX27POJKPZ6pGCZSVeycVwUhXcpaNL/28g+pTqBR64sKro/bL2KhdFau0bmbbWDjpd0KIVYFaV+cIQLRL//bzqteejcripWC07jPPl9LPTOkVE/jpB+UD5D6+xxdd0l+Z4awZpxYyX1iL+Q+HsKUBQLPOFgVibMKDnDEZVeqlW1Nlx2XoOQvAP5AclC/FWZ63nmF3s/FDOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V5Z6NbT6; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V5Z6NbT6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csvBH6sY4z3bd0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 05:07:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDA6645B0B;
	Thu, 23 Oct 2025 18:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A93C4CEE7;
	Thu, 23 Oct 2025 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761242820;
	bh=b5POU65SI9uBItwU3VrQQapA5Fe5zoNWbwcZVbOTXlo=;
	h=From:To:Cc:Subject:Date:From;
	b=V5Z6NbT6+ZsvBawxRtQxU7LhzI9ILCHAXbufohmEyU04NEMevBNBjSTSRUOGz0Q6M
	 p/J8OXFmnNBJwV8Z7CvorFLum3GOtQkbxP5iqmU671wwUKwqgVNcwVxXHQ/0ddSG4/
	 WnyzlBLS4VlcV8QXxN57mSobGCvmXQUwTGjRneEg77O9umCvyPvHMWxlpsskxpr05i
	 A7EwOXDh3hCDu9JbL1yuX8Zlf41V1lduTmNA4AFpT5PMbdfqRgb0/x7IebHpC7K8Vc
	 xzrTrxOAdhXbQg4kmhjO0yEukjIjPBOAvhN0Q9GtFiCHbacF6o9UEmjW0D+0iLFXg7
	 W7Yne6d0AMhiA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Date: Thu, 23 Oct 2025 13:06:26 -0500
Message-ID: <20251023180645.1304701-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
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

f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
platforms") enabled Clock Power Management and L1 PM Substates, but those
features depend on CLKREQ# and possibly other device-specific
configuration.  We don't know whether CLKREQ# is supported, so we shouldn't
blindly enable Clock PM and L1 PM Substates.

Enable only ASPM L0s and L1, and only when both ends of the link advertise
support for them.

Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de/
Reported-by: FUKAUMI Naoki <naoki@radxa.com>
Closes: https://lore.kernel.org/r/22594781424C5C98+22cb5d61-19b1-4353-9818-3bb2b311da0b@radxa.com/
Reported-by: Herve Codina <herve.codina@bootlin.com>
Link: https://lore.kernel.org/r/20251015101304.3ec03e6b@bootlin.com/
Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Link: https://lore.kernel.org/r/DDJXHRIRGTW9.GYC2ULZ5WQAL@cknow-tech.com/
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: FUKAUMI Naoki <naoki@radxa.com>
---
I intend this for v6.18-rc3.

I think it will fix the issues reported by Diederik and FUKAUMI Naoki (both
on Rockchip).  I hope it will fix Christian's report on powerpc, but don't
have confirmation.  I think the performance regression Herve reported is
related, but this patch doesn't seem to fix it.

FUKAUMI Naoki's successful testing report:
https://lore.kernel.org/r/4B275FBD7B747BE6+a3e5b367-9710-4b67-9d66-3ea34fc30866@radxa.com/
---
 drivers/pci/pcie/aspm.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 7cc8281e7011..79b965158473 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -243,8 +243,7 @@ struct pcie_link_state {
 	/* Clock PM state */
 	u32 clkpm_capable:1;		/* Clock PM capable? */
 	u32 clkpm_enabled:1;		/* Current Clock PM state */
-	u32 clkpm_default:1;		/* Default Clock PM state by BIOS or
-					   override */
+	u32 clkpm_default:1;		/* Default Clock PM state by BIOS */
 	u32 clkpm_disable:1;		/* Clock PM disabled */
 };
 
@@ -376,18 +375,6 @@ static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
 	pcie_set_clkpm_nocheck(link, enable);
 }
 
-static void pcie_clkpm_override_default_link_state(struct pcie_link_state *link,
-						   int enabled)
-{
-	struct pci_dev *pdev = link->downstream;
-
-	/* For devicetree platforms, enable ClockPM by default */
-	if (of_have_populated_dt() && !enabled) {
-		link->clkpm_default = 1;
-		pci_info(pdev, "ASPM: DT platform, enabling ClockPM\n");
-	}
-}
-
 static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
 {
 	int capable = 1, enabled = 1;
@@ -410,7 +397,6 @@ static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
 	}
 	link->clkpm_enabled = enabled;
 	link->clkpm_default = enabled;
-	pcie_clkpm_override_default_link_state(link, enabled);
 	link->clkpm_capable = capable;
 	link->clkpm_disable = blacklist ? 1 : 0;
 }
@@ -811,19 +797,17 @@ static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
 	struct pci_dev *pdev = link->downstream;
 	u32 override;
 
-	/* For devicetree platforms, enable all ASPM states by default */
+	/* For devicetree platforms, enable L0s and L1 by default */
 	if (of_have_populated_dt()) {
-		link->aspm_default = PCIE_LINK_STATE_ASPM_ALL;
+		if (link->aspm_support & PCIE_LINK_STATE_L0S)
+			link->aspm_default |= PCIE_LINK_STATE_L0S;
+		if (link->aspm_support & PCIE_LINK_STATE_L1)
+			link->aspm_default |= PCIE_LINK_STATE_L1;
 		override = link->aspm_default & ~link->aspm_enabled;
 		if (override)
-			pci_info(pdev, "ASPM: DT platform, enabling%s%s%s%s%s%s%s\n",
-				 FLAG(override, L0S_UP, " L0s-up"),
-				 FLAG(override, L0S_DW, " L0s-dw"),
-				 FLAG(override, L1, " L1"),
-				 FLAG(override, L1_1, " ASPM-L1.1"),
-				 FLAG(override, L1_2, " ASPM-L1.2"),
-				 FLAG(override, L1_1_PCIPM, " PCI-PM-L1.1"),
-				 FLAG(override, L1_2_PCIPM, " PCI-PM-L1.2"));
+			pci_info(pdev, "ASPM: default states%s%s\n",
+				 FLAG(override, L0S, " L0s"),
+				 FLAG(override, L1, " L1"));
 	}
 }
 
-- 
2.43.0


