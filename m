Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB55685F5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdGPh2XY7z3cMr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:44:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TZJK5VfY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TZJK5VfY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdGNW51nxz3blS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:43:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E59A61E4E;
	Wed,  6 Jul 2022 10:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45D9C341CB;
	Wed,  6 Jul 2022 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657104200;
	bh=2i4XkrOKAvEY4kt51QJGqvVCb9gTrdzZN17RM/W6jF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TZJK5VfYPdeR1Bn+XOMd6WXnxO+p3Wr5Bkgn4nhjE12pygsUgOZm9OQPMRFZ89lRz
	 /ANQlCA3A0g0e5heGDCD8RPkJWPGRetnO6riSnQJsZrPrS5d0VcPpv0ajMBul6+uXT
	 NXrs7B/+KIgl2mtB1Q0MQNHiSsoddXThcz21pCrxjUOqzBbXK/ijF5TkASq7HCCjPz
	 5LRww1QlBmHfiXnoJC8+Q+ij/jH0AVXusYUwQZKOsW/uHC4dcJwKblCnpUUHd88J8e
	 x8XiPQwwj4RpiL/X9meTKljxp0ZjR+/OayZ8BBT6Sb0KRW4lBU06os1I0e2mWKNobu
	 xJJLkaQS+12kQ==
Received: by pali.im (Postfix)
	id 3BFC07F1; Wed,  6 Jul 2022 12:43:18 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nick Child <nick.child@ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 1/5] powerpc/pci: Hide pci_device_from_OF_node() for non-powermac code
Date: Wed,  6 Jul 2022 12:43:04 +0200
Message-Id: <20220706104308.5390-2-pali@kernel.org>
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

Function pci_device_from_OF_node() is used only in powermac code.
So hide it from all other platforms as it is unsed.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/include/asm/pci-bridge.h | 2 ++
 arch/powerpc/kernel/pci_32.c          | 2 ++
 arch/powerpc/kernel/pci_64.c          | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index c85f901227c9..98156932a1f5 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -170,8 +170,10 @@ static inline struct pci_controller *pci_bus_to_host(const struct pci_bus *bus)
 	return bus->sysdata;
 }
 
+#ifdef CONFIG_PPC_PMAC
 extern int pci_device_from_OF_node(struct device_node *node,
 				   u8 *bus, u8 *devfn);
+#endif
 #ifndef CONFIG_PPC64
 
 extern void pci_create_OF_bus_map(void);
diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index 5a174936c9a0..c3b91fb62a71 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -154,6 +154,7 @@ pcibios_make_OF_bus_map(void)
 }
 
 
+#ifdef CONFIG_PPC_PMAC
 /*
  * Returns the PCI device matching a given OF node
  */
@@ -193,6 +194,7 @@ int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
 	return -ENODEV;
 }
 EXPORT_SYMBOL(pci_device_from_OF_node);
+#endif
 
 /* We create the "pci-OF-bus-map" property now so it appears in the
  * /proc device tree
diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 19b03ddf5631..0c7cfb9fab04 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -286,6 +286,7 @@ int pcibus_to_node(struct pci_bus *bus)
 EXPORT_SYMBOL(pcibus_to_node);
 #endif
 
+#ifdef CONFIG_PPC_PMAC
 int pci_device_from_OF_node(struct device_node *np, u8 *bus, u8 *devfn)
 {
 	if (!PCI_DN(np))
@@ -294,3 +295,4 @@ int pci_device_from_OF_node(struct device_node *np, u8 *bus, u8 *devfn)
 	*devfn = PCI_DN(np)->devfn;
 	return 0;
 }
+#endif
-- 
2.20.1

