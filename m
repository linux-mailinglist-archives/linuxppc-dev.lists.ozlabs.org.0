Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEECF2BE1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 06:08:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CgM20pdYzDqQN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:08:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="Jn2AxMt4"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CgFP0f06zDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 14:03:52 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 434DE7F8F7;
 Mon, 27 May 2019 23:03:20 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559016201; bh=JsmM3TF8YlXJ0OlLlUbqQr2/zPIZK0XaaIlAJ070/mg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jn2AxMt42ZCz3e1YKcBCeKXmAjA3F7ku2HLuLBPH//ysiYdMmgRPnSQe2syp/9j2w
 GMngJSrqbOT4/K+dsUFKyBNfBHmxMkPHWxKShiEzelecrfC8Ee/CpRNSHlPTmK5O7H
 bDN6xC9W3NrIgu9+uBcsg8ItBDh2pj/xzf1I9idZqaoKjumIhNcvk0StHI9kM99+EK
 IYp/kQT3q0YsmSWXY5fe+4BGs5yTFL6zf1sxmeLxIT0GjcW732ogRM4GsZhkDNotjv
 DLYiwPB6F5BaSsh1C1/MwSnOIFMTIiwwbKl11//3hYBC1rKba95blgJw6BcpViKEWh
 d7KNVaKggOILg==
From: Shawn Anastasio <shawn@anastas.io>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/3] PCI: Introduce pcibios_ignore_alignment_request
Date: Mon, 27 May 2019 23:03:11 -0500
Message-Id: <20190528040313.35582-2-shawn@anastas.io>
In-Reply-To: <20190528040313.35582-1-shawn@anastas.io>
References: <20190528040313.35582-1-shawn@anastas.io>
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
Cc: sbobroff@linux.ibm.com, linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 xyjxie@linux.vnet.ibm.com, bhelgaas@google.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce a new pcibios function pcibios_ignore_alignment_request
which allows the PCI core to defer to platform-specific code to
determine whether or not to ignore alignment requests for PCI resources.

The existing behavior is to simply ignore alignment requests when
PCI_PROBE_ONLY is set. This is behavior is maintained by the
default implementation of pcibios_ignore_alignment_request.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 drivers/pci/pci.c   | 9 +++++++--
 include/linux/pci.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8abc843b1615..8207a09085d1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5882,6 +5882,11 @@ resource_size_t __weak pcibios_default_alignment(void)
 	return 0;
 }
 
+int __weak pcibios_ignore_alignment_request(void)
+{
+	return pci_has_flag(PCI_PROBE_ONLY);
+}
+
 #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
 static char resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] = {0};
 static DEFINE_SPINLOCK(resource_alignment_lock);
@@ -5906,9 +5911,9 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
 	p = resource_alignment_param;
 	if (!*p && !align)
 		goto out;
-	if (pci_has_flag(PCI_PROBE_ONLY)) {
+	if (pcibios_ignore_alignment_request()) {
 		align = 0;
-		pr_info_once("PCI: Ignoring requested alignments (PCI_PROBE_ONLY)\n");
+		pr_info_once("PCI: Ignoring requested alignments\n");
 		goto out;
 	}
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4a5a84d7bdd4..47471dcdbaf9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1990,6 +1990,7 @@ static inline void pcibios_penalize_isa_irq(int irq, int active) {}
 int pcibios_alloc_irq(struct pci_dev *dev);
 void pcibios_free_irq(struct pci_dev *dev);
 resource_size_t pcibios_default_alignment(void);
+int pcibios_ignore_alignment_request(void);
 
 #ifdef CONFIG_HIBERNATE_CALLBACKS
 extern struct dev_pm_ops pcibios_pm_ops;
-- 
2.20.1

