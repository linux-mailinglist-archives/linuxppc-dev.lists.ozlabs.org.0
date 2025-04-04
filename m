Return-Path: <linuxppc-dev+bounces-7446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD49A7B6DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 06:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTQY00t9nz30Nl;
	Fri,  4 Apr 2025 15:26:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743740804;
	cv=none; b=Jy661URaNLhCv6rTiMwlSwV76c35Xx86dOYEJh6Z5FoTA8O27UGmxhNlAGj4Wa2dYLjb24oqeNiqGYrfdWRi9vJH5vbUZPsAVAqmxBxIrZx6qz/WXQibfe/lMWeOowa7dGkHfES1JSRKQvILgjX9nd1eozr0I7iglKAsCfvrHvW4aKG2P/c7ua2yKvMvlTUjxiBMeXcRvfENW9wzFWgc1eiQDrzFbHNooUKzgO1sJ0qygwazwnWAoTTn1RMpEI4HkNT/QaGWw4Vh+F5orM868qGyJwn0RNttpq0gQJtwvXDQxL4zQnvSIEqA7/cqeTB4aAK81zZjQs/l9782APhH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743740804; c=relaxed/relaxed;
	bh=R3TEJwuAJZ0klnHkNfJo7ybCDbPTaShTCK/BgFmdm60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h3yx5qHiVHzMbmltULbIs2KsbN1KFs/WOigccqcvdh7tZKlKlGLHc3YWzgTyUbCcEHM0x9ESsLUXvhPtfwq4vdVaJaMwZkeJZwjpNcPxYRemHIrnDZyjAXOkUfKfY0N+JhIllMbhAGB5ZJRAfRqShoyYkKDzdPkcyY9iVKiosIQtsM4vSPivxTHy3vHEFqxZTUIRWL1ma+lGk1Jxyyt7jv3cDMCubxEn1eEYbMtVs669bK6shtYYFA0LoVenw3ksyC2xhsZDtgxsP2mxv1FG8WB9yu6hyD5Ly/+wvIs8l1Hnd7qZ7qiyEGEaSxV7tE5fOKHPxCvhtKNH7j2iwOq0/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ZGJXyuPw; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ZGJXyuPw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 502 seconds by postgrey-1.37 at boromir; Fri, 04 Apr 2025 15:26:39 AEDT
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTQXv2qcTz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 15:26:39 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8BD958288948;
	Thu,  3 Apr 2025 23:18:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id F3ugog3yIHEK; Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C832C8287DC7;
	Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C832C8287DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1743740294; bh=R3TEJwuAJZ0klnHkNfJo7ybCDbPTaShTCK/BgFmdm60=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZGJXyuPw/vyrls4htxAk3M/fQBla3YmcPvyqrIkmVqacNhP6uZOtU5anDmg+h2i2E
	 57mze6ubVXAd39dkvw0BwAcwssPd5yZZ+xTGd7Ye98O2wdxmSB+8FPkunVK0CbZ+s5
	 9hbXD6nrfuXMSKMwsN4u2FhbJXexWmbv+zbPXQAk=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7J193i_wQp1T; Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id 393F38287182;
	Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	tpearson@raptorengineering.com,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/3] pci/hotplug/pnv_php: Work around switches with broken presence detection
Date: Thu,  3 Apr 2025 23:18:09 -0500
Message-Id: <20250404041810.245984-3-sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404041810.245984-1-sanastasio@raptorengineering.com>
References: <20250404041810.245984-1-sanastasio@raptorengineering.com>
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
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The Microsemi Switchtec PM8533 PFX 48xG3 [11f8:8533] PCIe switch system
was observed to incorrectly assert the Presence Detect Set bit in its
capabilities when tested on a Raptor Computing Systems Blackbird system,
resulting in the hot insert path never attempting a rescan of the bus
and any downstream devices not being re-detected.

Work around this by additionally checking whether the PCIe data link is
active or not when performing presence detection on downstream switches'
ports, similar to the pciehp_hpc.c driver.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 drivers/pci/hotplug/pnv_php.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 2c07544216fb..1a734adb5b10 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -390,6 +390,20 @@ static int pnv_php_get_power_state(struct hotplug_slot *slot, u8 *state)
 	return 0;
 }
 
+static int pcie_check_link_active(struct pci_dev *pdev)
+{
+	u16 lnk_status;
+	int ret;
+
+	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
+	if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
+		return -ENODEV;
+
+	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
+
+	return ret;
+}
+
 static int pnv_php_get_adapter_state(struct hotplug_slot *slot, u8 *state)
 {
 	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
@@ -402,6 +416,19 @@ static int pnv_php_get_adapter_state(struct hotplug_slot *slot, u8 *state)
 	 */
 	ret = pnv_pci_get_presence_state(php_slot->id, &presence);
 	if (ret >= 0) {
+		if (pci_pcie_type(php_slot->pdev) == PCI_EXP_TYPE_DOWNSTREAM &&
+			presence == OPAL_PCI_SLOT_EMPTY) {
+			/*
+			 * Similar to pciehp_hpc, check whether the Link Active
+			 * bit is set to account for broken downstream bridges
+			 * that don't properly assert Presence Detect State, as
+			 * was observed on the Microsemi Switchtec PM8533 PFX
+			 * [11f8:8533].
+			 */
+			if (pcie_check_link_active(php_slot->pdev) > 0)
+				presence = OPAL_PCI_SLOT_PRESENT;
+		}
+
 		*state = presence;
 		ret = 0;
 	} else {
-- 
2.30.2


