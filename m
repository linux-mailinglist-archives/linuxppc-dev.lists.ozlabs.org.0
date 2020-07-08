Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E84FB217C26
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 02:18:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1fzF4mD2zDr2h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 10:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=QfQm0Cof; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1ftb42wwzDr22
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 10:14:15 +1000 (AEST)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9257F20771;
 Wed,  8 Jul 2020 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594167253;
 bh=2L7WP+FH4ge1x8kEWdYfaMjqxWIqNu5qXRk+3MClC9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QfQm0CofV3QNZvEH3olHTvHrgD7XQHvllDn6Up+u11+4dp7W22MPY9dg3vmZWGzER
 XIiCpVWWCkkV+VCDHLhTa8Ym/BUyWS7ON39mcGLvaWfMQbdSPEJgwGPXDWS+65+HBv
 vl3vI1BfK3voK1Ltv5Bul0yUXBMvW/rDkI2IZmZY=
From: Bjorn Helgaas <helgaas@kernel.org>
To: Matt Jolly <Kangie@footclan.ninja>
Subject: [PATCH 2/2] PCI/AER: Log correctable errors as warning, not error
Date: Tue,  7 Jul 2020 19:14:01 -0500
Message-Id: <20200708001401.405749-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708001401.405749-1-helgaas@kernel.org>
References: <20200618155511.16009-1-Kangie@footclan.ninja>
 <20200708001401.405749-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Matt Jolly <Kangie@footclan.ninja>

PCIe correctable errors are recovered by hardware with no need for software
intervention (PCIe r5.0, sec 6.2.2.1).

Reduce the log level of correctable errors from KERN_ERR to KERN_WARNING.

The bug reports below are for correctable error logging.  This doesn't fix
the cause of those reports, but it may make the messages less alarming.

[bhelgaas: commit log, use pci_printk() to avoid code duplication]
Link: https://bugzilla.kernel.org/show_bug.cgi?id=201517
Link: https://bugzilla.kernel.org/show_bug.cgi?id=196183
Link: https://lore.kernel.org/r/20200618155511.16009-1-Kangie@footclan.ninja
Signed-off-by: Matt Jolly <Kangie@footclan.ninja>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9176c8a968b9..ca886bf91fd9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -673,20 +673,23 @@ static void __aer_print_error(struct pci_dev *dev,
 {
 	const char **strings;
 	unsigned long status = info->status & ~info->mask;
-	const char *errmsg;
+	const char *level, *errmsg;
 	int i;
 
-	if (info->severity == AER_CORRECTABLE)
+	if (info->severity == AER_CORRECTABLE) {
 		strings = aer_correctable_error_string;
-	else
+		level = KERN_WARNING;
+	} else {
 		strings = aer_uncorrectable_error_string;
+		level = KERN_ERR;
+	}
 
 	for_each_set_bit(i, &status, 32) {
 		errmsg = strings[i];
 		if (!errmsg)
 			errmsg = "Unknown Error Bit";
 
-		pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
+		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
 				info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
@@ -696,6 +699,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int layer, agent;
 	int id = ((dev->bus->number << 8) | dev->devfn);
+	const char *level;
 
 	if (!info->status) {
 		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
@@ -706,13 +710,14 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
 	agent = AER_GET_AGENT(info->severity, info->status);
 
-	pci_err(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
-		aer_error_severity_string[info->severity],
-		aer_error_layer[layer], aer_agent_string[agent]);
+	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
+
+	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+		   aer_error_severity_string[info->severity],
+		   aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_err(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
-		dev->vendor, dev->device,
-		info->status, info->mask);
+	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
+		   dev->vendor, dev->device, info->status, info->mask);
 
 	__aer_print_error(dev, info);
 
-- 
2.25.1

