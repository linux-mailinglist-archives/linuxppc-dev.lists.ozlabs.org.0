Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359335685F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:45:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdGQL063jz3c5j
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:44:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rN6woxYE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rN6woxYE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdGNX0LY4z3bmD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:43:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 166DA61E45;
	Wed,  6 Jul 2022 10:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53876C341C0;
	Wed,  6 Jul 2022 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657104201;
	bh=oSQ5IoQCNafIgt+niU4r6ol75/VtIeDzq3eFDS3Ask0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rN6woxYEGCMe3Bj483Cd0Py2FvFbFyUevtTqSvKf5IG11LZ/+X5W0l64NUiyTnnHX
	 ne5n2bEvUslXSlJHbhAHHNGwBcc1d6Qm9VmJfyLzdoIqVb8o8YRb4yfgdr93F5PDfr
	 5EvJxAYMmijGgnOBizFz4mJb63qUETpKd7dRqUuYeC3X1WzvsCbDyC3cwczmgbbG3E
	 dg/7kPtcdppdbNwLIxRn4nJjzso167pQ86rSmYhPFMHBmT2OGKmNkTt7Y+ftNLRcTU
	 vAPi+PJdeKyZ9rgYXxO1ka6yM9myqJTJ1AjjLNVBomynZhe5FYfvprXgTaOwiSu9cU
	 DKmpPea6PAxfA==
Received: by pali.im (Postfix)
	id 0D7ED7BA; Wed,  6 Jul 2022 12:43:21 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nick Child <nick.child@ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 4/5] powerpc/pci: Disable filling pci-OF-bus-map for non-chrp/powermac
Date: Wed,  6 Jul 2022 12:43:07 +0200
Message-Id: <20220706104308.5390-5-pali@kernel.org>
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

Creating or filling pci-OF-bus-map property in the device-tree is
deprecated since May 2006 [1] and was used only in old platforms like
PowerMac.

Currently kernel code handles it only for chrp and powermac code. So
completely disable filling pci-OF-bus-map property for non-chrp and
non-powermac platforms.

[1] - https://lore.kernel.org/linuxppc-dev/1148016268.13249.14.camel@localhost.localdomain/

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/kernel/pci_32.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index 3291af89cea4..2f7284b68f06 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -37,15 +37,12 @@ EXPORT_SYMBOL(isa_io_base);
 EXPORT_SYMBOL(pci_dram_offset);
 
 static void fixup_cpc710_pci64(struct pci_dev* dev);
-static u8* pci_to_OF_bus_map;
 
 /* By default, we don't re-assign bus numbers. We do this only on
  * some pmacs
  */
 static int pci_assign_all_buses;
 
-static int pci_bus_count;
-
 /* This will remain NULL for now, until isa-bridge.c is made common
  * to both 32-bit and 64-bit.
  */
@@ -65,6 +62,11 @@ fixup_cpc710_pci64(struct pci_dev* dev)
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_IBM,	PCI_DEVICE_ID_IBM_CPC710_PCI64,	fixup_cpc710_pci64);
 
+#if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
+
+static u8* pci_to_OF_bus_map;
+static int pci_bus_count;
+
 /*
  * Functions below are used on OpenFirmware machines.
  */
@@ -221,6 +223,8 @@ pci_create_OF_bus_map(void)
 }
 #endif
 
+#endif /* defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP) */
+
 void pcibios_setup_phb_io_space(struct pci_controller *hose)
 {
 	unsigned long io_offset;
@@ -252,6 +256,8 @@ static int __init pcibios_init(void)
 		if (pci_assign_all_buses || next_busno <= hose->last_busno)
 			next_busno = hose->last_busno + pcibios_assign_bus_offset;
 	}
+
+#if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
 	pci_bus_count = next_busno;
 
 	/* OpenFirmware based machines need a map of OF bus
@@ -260,6 +266,7 @@ static int __init pcibios_init(void)
 	 */
 	if (pci_assign_all_buses)
 		pcibios_make_OF_bus_map();
+#endif
 
 	/* Call common code to handle resource allocation */
 	pcibios_resource_survey();
-- 
2.20.1

