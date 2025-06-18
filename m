Return-Path: <linuxppc-dev+bounces-9455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E517ADF342
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 18:59:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMqhR4xF0z30Vs;
	Thu, 19 Jun 2025 02:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750265942;
	cv=none; b=GPSL1LbQnuHc5YEjsc9cPRYFOuuwGjPF3i+AFqS0GvGIVGjKfNrEshrNq+mtt34NEksM7fgLJpZP3xm9Q7n1O8hZVT6Y+hRtj10Etl59IQkb8q1ZF8fzAkdo3igfFQ2z6RUqxEhfCEGi3OXrc1mLbzc5Bgo1eRs77Y1/6iJ4HHHSrRnwRIfAUxqCIJobLoNbZB8MdYBrqI1DIFTyt8xS7UjrKnqN6K632GKvM5O0ZdK67m4NIy8Xi3a/CkUXzxUOwfe0HGR31jTYk5A0MnZwkrPR5treV/Z/3AF00rCerCPFjr/yWRymsctPp+Pf1HbmqKFhj2B6RN+3kVdzsc2fEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750265942; c=relaxed/relaxed;
	bh=OlONqedgdZu8PeQ6IQKPSJGIJsQmR5PwabMbkbNrUiE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=izYf9jOB8YH+0W21YT3FeTBTGEkmGJA0m8qPPa8axoLeCrWW2ydM3JG1DUwbCPX56S7shCYSOkXb+jckQLJfpsXcS9COopKCca/DtP9R2R1pfREjGVh8K/gZmVxUGSvDPgjtnbjPzSnNqPdeeEGMhs0BT14gIgP27GyGBQBmwGIpxKZ0C6ylEiBU205a8k2/829Il0ZsP5jRB2Y+2oqX3KO8/RwuyRhgSvb3eQOU2uNw10WE+R+UVblk1ze7RsWpaIcwOOiPMB13rPG51gTJsZQKjNUBz7n/K0OP1E+7cJWVRQDEvF941an70S/rz4jrtp+JDWsApV/wLU0Tne2AqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=A2Hd7zzk; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=A2Hd7zzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMqhQ17HKz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 02:59:02 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 5F8A98288467;
	Wed, 18 Jun 2025 11:59:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 4xfm3ULz_6Gq; Wed, 18 Jun 2025 11:58:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 783828288670;
	Wed, 18 Jun 2025 11:58:59 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 783828288670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750265939; bh=OlONqedgdZu8PeQ6IQKPSJGIJsQmR5PwabMbkbNrUiE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=A2Hd7zzkPPZn5qnkUjG1tOwsNtgyxueq7hUjeHQEDPQEh6dHZ8JNQWk+g6ZOm+rFY
	 gbDwIHh6+nBmg3hjk6V5VK1mfM/a65FORGDtjcz13dn35Em98yVI6Mggi/ASkT5uNr
	 P5izOOF6fFUQjfdI0pnJjrIWAmtMJz/yc9R/IDgI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mxrrclct1c8B; Wed, 18 Jun 2025 11:58:59 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4EBDA8288467;
	Wed, 18 Jun 2025 11:58:59 -0500 (CDT)
Date: Wed, 18 Jun 2025 11:58:59 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <300098407.1310656.1750265939231.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <581463409.1310624.1750265668004.JavaMail.zimbra@raptorengineeringinc.com>
References: <581463409.1310624.1750265668004.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
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
Thread-Topic: pci/hotplug/pnv_php: Enable third attention indicator
Thread-Index: 7ViWVrejj338yZQm64sXoMCfdWvE4ADzdyG8
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
 drivers/pci/hotplug/pnv_php.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 0ceb4a2c3c79..c3005324be3d 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -440,10 +440,23 @@ static int pnv_php_get_adapter_state(struct hotplug_slot *slot, u8 *state)
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
@@ -461,7 +474,7 @@ static int pnv_php_set_attention_state(struct hotplug_slot *slot, u8 state)
 	mask = PCI_EXP_SLTCTL_AIC;
 
 	if (state)
-		new = PCI_EXP_SLTCTL_ATTN_IND_ON;
+		new = FIELD_PREP(PCI_EXP_SLTCTL_AIC, state);
 	else
 		new = PCI_EXP_SLTCTL_ATTN_IND_OFF;
 
-- 
2.39.5

