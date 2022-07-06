Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8454B568603
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdGRb3HMSz3f4t
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:46:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vQVM0JvS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vQVM0JvS;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdGNZ27qtz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:43:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB44BB81BAD;
	Wed,  6 Jul 2022 10:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AFFC341CF;
	Wed,  6 Jul 2022 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657104202;
	bh=99roP7FFejJ4tHZj9bNwClVKU/G2TunICeiuDt+0hYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vQVM0JvSni/qmtb+vV+CpQPqbeOyFsnWG3Osw+0Th+vK0NqSLNKg+N1qsBudC9ccb
	 cCZ2YrwQAYFsrTq9VEN8H2e2K6v0QKaEDScGQrAOaqqnXx57l3ojtapiADZ7q90+Ln
	 T4KMscRZBU8hOiU7q2FeOsJgN3hDSngSltLiaPyKTvOgl1KGnDVV8fe3re8/KjKIav
	 XazxYK7Vw8oYOmPduyKSsQXUnTBK8JhhnfjOWlf8kEm3X5ZSQD8WPpJyX2pjN6e5GN
	 sDVbJeWHQXZaii7lpmvq8RkBt/HAgKKR+XtutdUZLigIiwvNbj03i1my8lGmxsAGvw
	 oHLpDcT7KVP7w==
Received: by pali.im (Postfix)
	id EFA197BA; Wed,  6 Jul 2022 12:43:21 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nick Child <nick.child@ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 5/5] powerpc/pci: Add config option for using all 256 PCI buses
Date: Wed,  6 Jul 2022 12:43:08 +0200
Message-Id: <20220706104308.5390-6-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706104308.5390-1-pali@kernel.org>
References: <20220706104308.5390-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

By default on PPC32 are PCI bus numbers unique across all PCI domains.
So system could have only 256 PCI buses independently of available
PCI domains.

This is due to filling DT property pci-OF-bus-map which does not reflect
multi-domain setup.

On all powerpc platforms except chrp and powermac there is no DT property
pci-OF-bus-map anymore and therefore it is possible on non-chrp/powermac
platforms to avoid this limitation of maximal number of 256 PCI buses in
system even on multi-domain setup.

But avoiding this limitation would mean that all PCI and PCIe devices would
be present on completely different BDF addresses as every PCI domain starts
numbering PCI bueses from zero (instead of the last bus number of previous
enumerated PCI domain). Such change could break existing software which
expects fixed PCI bus numbers.

So add a new config option CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT which
enables this change. By default it is disabled. It cause that initial value
of hose->first_busno is zero.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/Kconfig         | 11 +++++++++++
 arch/powerpc/kernel/pci_32.c |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index be68c1f02b79..f66084bc1dfe 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -370,6 +370,17 @@ config PPC_DCR
 	depends on PPC_DCR_NATIVE || PPC_DCR_MMIO
 	default y
 
+config PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
+	depends on PPC32
+	depends on !PPC_PMAC && !PPC_CHRP
+	bool "Assign PCI bus numbers from zero individually for each PCI domain"
+	help
+	  By default on PPC32 were PCI bus numbers unique across all PCI domains.
+	  So system could have only 256 PCI buses independently of available
+	  PCI domains. When this option is enabled then PCI bus numbers are
+	  PCI domain dependent and each PCI controller on own domain can have
+	  256 PCI buses, like it is on other Linux architectures.
+
 config PPC_OF_PLATFORM_PCI
 	bool
 	depends on PCI
diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index 2f7284b68f06..433965bf37b4 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -239,7 +239,9 @@ void pcibios_setup_phb_io_space(struct pci_controller *hose)
 static int __init pcibios_init(void)
 {
 	struct pci_controller *hose, *tmp;
+#ifndef CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
 	int next_busno = 0;
+#endif
 
 	printk(KERN_INFO "PCI: Probing PCI hardware\n");
 
@@ -248,13 +250,17 @@ static int __init pcibios_init(void)
 
 	/* Scan all of the recorded PCI controllers.  */
 	list_for_each_entry_safe(hose, tmp, &hose_list, list_node) {
+#ifndef CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
 		if (pci_assign_all_buses)
 			hose->first_busno = next_busno;
+#endif
 		hose->last_busno = 0xff;
 		pcibios_scan_phb(hose);
 		pci_bus_add_devices(hose->bus);
+#ifndef CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
 		if (pci_assign_all_buses || next_busno <= hose->last_busno)
 			next_busno = hose->last_busno + pcibios_assign_bus_offset;
+#endif
 	}
 
 #if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
-- 
2.20.1

