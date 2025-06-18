Return-Path: <linuxppc-dev+bounces-9441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C039CADE257
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 06:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMVxK4WCSz30WQ;
	Wed, 18 Jun 2025 14:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750220645;
	cv=none; b=Zoi1M+NL3ieNe5WzyC7AejUSOQJ9ZeFJZHB6kWVyeZwl7yjrpso9E8yKrwalEw2T+4C5GTA8Vf4st/aNplyhQWxl/wETEwCd62CRi65MnqkJJD63d3kd5gwQL8oewNHvVUwV05sPeTox4Zj0Ovu9gOiVt1kIsWjb9+CaysnuAL3BPUzT8mWoQv0jfJj/c+wCCBJr1VU/kRFRJoqPGXFu2QaKmos7PzUWLdZtL3wjudirAvW94qqOvoOY+bZ/TymYLqEdNcqQgc6ZJDmADn3E3OSG1Dg7KyFRJP9GoHoPbpoiK+h6AiIctPJ+PPASSpGeHjsJHQKXf4XlYsYsMP/Skw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750220645; c=relaxed/relaxed;
	bh=o/1IBINWMrVso6KNgb8gMd8huCPM66zxZkZ7bvMLpVQ=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=bxUpLIzQRVMjadYotd0PZ+6pplxg6MyvvdATuQ/mxdZ8Q99/ogHt6Y/3X9CDAHa/KodTlHDaNSiLgeMeCgIuF+upjgmK7mPTiFsjdqtbu2fsgtC1gvjRq9LyFtexuxVyiN/7DbEKVLo8WyuexosRZ0RR8CeCSGzVE0dJeWRJBv432BJrbIzQCJNaWGCDn/ygVwilOWPKd/SDfx+zgrifYhJsAz2CyzZ4DN315FtUrgQroEZs2jDqg0f9qV6dHurV/AvVijVpuambwH9VECksrGzhKCzNbXkH8eR34dV+eiVK3bi5hDXKnlVcKgiKWOUGbUzokTJ/422UQpH1L2rigw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=RW36JUNL; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=RW36JUNL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMVxJ50NCz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 14:24:04 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E18E48288AE9;
	Tue, 17 Jun 2025 23:24:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SHe2gD1KcKYp; Tue, 17 Jun 2025 23:24:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2D8B0828884A;
	Tue, 17 Jun 2025 23:24:02 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2D8B0828884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750220642; bh=o/1IBINWMrVso6KNgb8gMd8huCPM66zxZkZ7bvMLpVQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=RW36JUNLcwayc7jLDx4GGxx7gpPVeCgX7oRK9NAHzdXjX3NlU2uTf2M0zh+meeOkr
	 BbL5v/HpIJTvlA0dwagL8ZTWhq9ox2vo6fh12OSC6njlxTAHqx6++MkngJKN7ktOC6
	 RWvUpioRJsl7IOWxhc8f9F4B4SYoU2jRcSl0LHxE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9wY7-oK45MhH; Tue, 17 Jun 2025 23:24:02 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0748082887A2;
	Tue, 17 Jun 2025 23:24:02 -0500 (CDT)
Date: Tue, 17 Jun 2025 23:24:01 -0500 (CDT)
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
Message-ID: <1984998826.1309773.1750220641884.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 6/6] pci/hotplug/pnv_php: Enable third attention indicator
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
Thread-Index: eLJahenhbKp2Kz5NYOtowJbZINMJBw==
Thread-Topic: pci/hotplug/pnv_php: Enable third attention indicator
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

 state

The PCIe specification allows three attention indicator states,
on, off, and blink.  Enable all three states instead of basic
on / off control.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/pci/hotplug/pnv_php.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 32f26f0d1ca6..c9003dec91c3 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -3,6 +3,7 @@
  * PCI Hotplug Driver for PowerPC PowerNV platform.
  *
  * Copyright Gavin Shan, IBM Corporation 2016.
+ * Copyright (C) 2025 Raptor Engineering, LLC
  */
 
 #include <linux/bitfield.h>
@@ -439,10 +440,23 @@ static int pnv_php_get_adapter_state(struct hotplug_slot *slot, u8 *state)
 	return ret;
 }
 
+static int pnv_php_get_raw_indicator_status(struct hotplug_slot *slot, u8 *state)
+{
+	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
+	struct pci_dev *bridge = php_slot->pdev;
+	u16 status;
+
+	pcie_capability_read_word(bridge, PCI_EXP_SLTCTL, &status);
+	*state = (status & (PCI_EXP_SLTCTL_AIC | PCI_EXP_SLTCTL_PIC)) >> 6;
+	return 0;
+}
+
+
 static int pnv_php_get_attention_state(struct hotplug_slot *slot, u8 *state)
 {
 	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
 
+	pnv_php_get_raw_indicator_status(slot, &php_slot->attention_state);
 	*state = php_slot->attention_state;
 	return 0;
 }
@@ -460,7 +474,7 @@ static int pnv_php_set_attention_state(struct hotplug_slot *slot, u8 state)
 	mask = PCI_EXP_SLTCTL_AIC;
 
 	if (state)
-		new = PCI_EXP_SLTCTL_ATTN_IND_ON;
+		new = FIELD_PREP(PCI_EXP_SLTCTL_AIC, state);
 	else
 		new = PCI_EXP_SLTCTL_ATTN_IND_OFF;
 
-- 
2.39.5

