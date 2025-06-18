Return-Path: <linuxppc-dev+bounces-9437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B595CADE24D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 06:22:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMVvT6nb9z30RJ;
	Wed, 18 Jun 2025 14:22:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750220549;
	cv=none; b=IGwvEaatZVsKioblUSRB7geBK97jUp6mQfWb1hX4x+E07xsAUUBm06ZUR/IYwsCejUkytyfL0Q+COdkTDDU0ihtw9UaFy/HVv6CR5i/JYrWqEVE5XKjcSYmPeZhTHjCMw0wcsOzUshncRRGKVuIbSq+zdYkqIkXzo37QkBPiTNTSYXBmQbLlXCTdKGhe30pLjK/ZzLpXB+iFlghy+a5CfOV8OYOetT3OYDWzQgNG28XO9iQCj8+E/n50/a6I3czyG3D44jpNi6JLP7WvvwXpbvUsy/Adq9FCUVHsWvB9pUiAiqi2FQL6X3JgvWEhZkoUgS9EcL0QsZqpvVF/DiYK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750220549; c=relaxed/relaxed;
	bh=IOinkmbct99ihAa2et65ViRn0B/Fv9hQ1/ek84lQs3k=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=eY+Sx3Y9Mivve0kS890EuqJIPvunOOITHlLFM6alVjKw/7VPRswwqbIgKRmPI1xWWUG3DUPWuRWvuds7MuHKjsedJO4I7mHYAYlypuAoUUhlPmuMCq0DUN/4WDEjT1ulc2S+lojbVP1Yo0b8upiDY7SZLYg3oSWw9pqs3hUNwV0bs6hlW4mIxVmgM8gK9k5pBizQK8rbTkjFyrrwzGlMHPC3SRpxS3qSYVcro3BCGbQLYsLVS5EJL+j+mybofn2mJidvlQAkPZK3kNYW+NUsnJej7GFG5uCLZgltYyF/Qq1oZl/eA+3aHf8LWC+GNQ0lDUkZD3J2XG1qITF47SG2jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=M7AcXOah; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=M7AcXOah;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 60 seconds by postgrey-1.37 at boromir; Wed, 18 Jun 2025 14:22:24 AEST
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMVvN1Rkyz309v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 14:22:24 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 5770E82887A2;
	Tue, 17 Jun 2025 23:22:22 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id WHpS5KlGB3rH; Tue, 17 Jun 2025 23:22:21 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A3AAE828884A;
	Tue, 17 Jun 2025 23:22:21 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A3AAE828884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750220541; bh=IOinkmbct99ihAa2et65ViRn0B/Fv9hQ1/ek84lQs3k=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=M7AcXOahGvvCgVkFmVjJ5wRHsSc7qVe3B97YDIrb4hXPtH8cfwFar6RM5kgy8gfoz
	 jJ3WwcPewsAqUfr7fjQpGDqGIUwpCkL8/88AwGVKTrNceX2QfQB+4fOcVjqdkulJ5t
	 wafDb1OBefsFgUDmTu1uHEt5GMonI8bfUjTmmWsA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qzE0J4bKH9Kd; Tue, 17 Jun 2025 23:22:21 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 7F82382887A2;
	Tue, 17 Jun 2025 23:22:21 -0500 (CDT)
Date: Tue, 17 Jun 2025 23:22:21 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Timothy Pearson <tpearson@raptorengineering.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <303034157.1309767.1750220541428.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 2/8] pci/hotplug/pnv_php: Work around switches with broken
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Index: lkiBXds83IiFLz5qs829T9eoZxietg==
Thread-Topic: pci/hotplug/pnv_php: Work around switches with broken
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

 presence detection

The Microsemi Switchtec PM8533 PFX 48xG3 [11f8:8533] PCIe switch system
was observed to incorrectly assert the Presence Detect Set bit in its
capabilities when tested on a Raptor Computing Systems Blackbird system,
resulting in the hot insert path never attempting a rescan of the bus
and any downstream devices not being re-detected.

Work around this by additionally checking whether the PCIe data link is
active or not when performing presence detection on downstream switches'
ports, similar to the pciehp_hpc.c driver.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
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
2.39.5

