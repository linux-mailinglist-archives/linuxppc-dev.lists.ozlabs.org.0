Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAF8568606
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:46:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdGSD4RYGz3f4h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:46:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tatURPUr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tatURPUr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdGNZ6c7dz3c1c
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:43:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 04274B81BBD;
	Wed,  6 Jul 2022 10:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D47C341D0;
	Wed,  6 Jul 2022 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657104202;
	bh=j5IOHlX255HFSnaMvWUb7Q8STsC+hRHhN52ol+fdQ2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tatURPUrAkHQIf+OcPOWiC9vJNvtxd9rvTQGIhwklmkCYBo2rzlpzyZCzdzB1Aiy2
	 AXxFRkxOKMd+vRdIjysrVF2IWc8DWZUOFQ96DwcjKHdGvNG3/auFx91IeORHMSwKCS
	 1GAk/jB75OIuOWU8Khm/96Hg+qbBpQYP0w4qtUegp7aAGsIfypGvioRP0juTktdTc3
	 bAbRzpwS/Cs8sP+tFhM9XsJnO/lAjU1MekIWk0ostbGadOJ67BRItfha/TJ/6wVoiY
	 9EWus6IwgsTmkHRSCebFHqPaX619oDqt5CnD9RwuoOahAlHhszNtYEV10hirpZ3ERk
	 2XDJjyFrnnWMw==
Received: by pali.im (Postfix)
	id 1CDAD825; Wed,  6 Jul 2022 12:43:20 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nick Child <nick.child@ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 3/5] powerpc/pci: Hide pci_create_OF_bus_map() for non-chrp code
Date: Wed,  6 Jul 2022 12:43:06 +0200
Message-Id: <20220706104308.5390-4-pali@kernel.org>
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

Function pci_create_OF_bus_map() is used only in chrp code.
So hide it from all other platforms as it is unsed.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/include/asm/pci-bridge.h | 2 ++
 arch/powerpc/kernel/pci_32.c          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 98156932a1f5..e18c95f4e1d4 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -176,7 +176,9 @@ extern int pci_device_from_OF_node(struct device_node *node,
 #endif
 #ifndef CONFIG_PPC64
 
+#ifdef CONFIG_PPC_CHRP
 extern void pci_create_OF_bus_map(void);
+#endif
 
 #else	/* CONFIG_PPC64 */
 
diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index df981294df29..3291af89cea4 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -194,6 +194,7 @@ int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
 EXPORT_SYMBOL(pci_device_from_OF_node);
 #endif
 
+#ifdef CONFIG_PPC_CHRP
 /* We create the "pci-OF-bus-map" property now so it appears in the
  * /proc device tree
  */
@@ -218,6 +219,7 @@ pci_create_OF_bus_map(void)
 		of_node_put(dn);
 	}
 }
+#endif
 
 void pcibios_setup_phb_io_space(struct pci_controller *hose)
 {
-- 
2.20.1

