Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B168D6DBE2D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 02:12:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PvCGs4NW7z3fZK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 10:12:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOvrtaRm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOvrtaRm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PvCC865JQz3fRJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 10:09:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C30F5616C1;
	Sun,  9 Apr 2023 00:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEB3C433EF;
	Sun,  9 Apr 2023 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680998961;
	bh=zplOKDm9cHPNlwiN8ZmCM/Qx7EH1y8rnpVlgkclxTVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WOvrtaRmDZ78SR/JS5E6nRvCVWDD3UuCZ/+R34yvnpc7EJXITcVPRlecCNW81Wv/X
	 dBqOtbwLAeMj37WDSUUgHUiexwmic3xvUw0849MUfA5+hkpOimGQCyLxU+LP3UbWXM
	 /ffLb4yMkQvGyn/x0NBOJdSeR2POlzPKiNkWlUatTx340sHkm2wWsYJjuIWRns5VX3
	 BJm8AEzWE6v/AtesOg8Gn+PTUY0vjfGMWsplmG29XcUO29Rf2+kk5HF6RdvsOLvnjF
	 ufS4xF3MfFSwD2OgTvkXCinvotFbwXJ/E0VGz2N9omQ+vZqCjM/pukz5X2tJxtYZ25
	 82ZzBMPrTmSoA==
Received: by pali.im (Postfix)
	id 1186E1BE4; Sun,  9 Apr 2023 02:09:18 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 1/8] powerpc/fsl_uli1575: Misc cleanup
Date: Sun,  9 Apr 2023 02:08:05 +0200
Message-Id: <20230409000812.18904-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230409000812.18904-1-pali@kernel.org>
References: <20230409000812.18904-1-pali@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Use a single line for uli_exclude_device().

Add uli_exclude_device() prototype in ppc-pci.h and guard it.

Remove that prototype from mpc85xx_ds.c and mpc86xx_hpcn.c files.

Make uli_pirq_to_irq[] static as it is used only in that file.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/include/asm/ppc-pci.h         | 9 +++++++++
 arch/powerpc/platforms/85xx/mpc85xx_ds.c   | 4 +---
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c | 4 +---
 arch/powerpc/platforms/fsl_uli1575.c       | 6 +++---
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index f6cf0159024e..a8db969dd595 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -57,11 +57,20 @@ void eeh_sysfs_remove_device(struct pci_dev *pdev);
 
 #endif /* CONFIG_EEH */
 
+#ifdef CONFIG_FSL_ULI1575
+int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn);
+#endif /* CONFIG_FSL_ULI1575 */
+
 #define PCI_BUSNO(bdfn) ((bdfn >> 8) & 0xff)
 
 #else /* CONFIG_PCI */
 static inline void init_pci_config_tokens(void) { }
 #endif /* !CONFIG_PCI */
 
+#if !defined(CONFIG_PCI) || !defined(CONFIG_FSL_ULI1575)
+#include <linux/pci.h>
+static inline int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn) { return PCIBIOS_SUCCESSFUL; }
+#endif /* !defined(CONFIG_PCI) || !defined(CONFIG_FSL_ULI1575) */
+
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_PPC_PCI_H */
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 70167b8f00a3..ed7b71d55b10 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -26,6 +26,7 @@
 #include <asm/mpic.h>
 #include <asm/i8259.h>
 #include <asm/swiotlb.h>
+#include <asm/ppc-pci.h>
 
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
@@ -107,9 +108,6 @@ void __init mpc85xx_ds_pic_init(void)
 }
 
 #ifdef CONFIG_PCI
-extern int uli_exclude_device(struct pci_controller *hose,
-				u_char bus, u_char devfn);
-
 static struct device_node *pci_with_uli;
 
 static int mpc85xx_exclude_device(struct pci_controller *hose,
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index 7b00ebd2d7f8..3dbd396a0df5 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -22,6 +22,7 @@
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 #include <asm/swiotlb.h>
+#include <asm/ppc-pci.h>
 
 #include <asm/mpic.h>
 
@@ -39,9 +40,6 @@
 #endif
 
 #ifdef CONFIG_PCI
-extern int uli_exclude_device(struct pci_controller *hose,
-				u_char bus, u_char devfn);
-
 static int mpc86xx_exclude_device(struct pci_controller *hose,
 				   u_char bus, u_char devfn)
 {
diff --git a/arch/powerpc/platforms/fsl_uli1575.c b/arch/powerpc/platforms/fsl_uli1575.c
index 84afae7a2561..a32f9cef7845 100644
--- a/arch/powerpc/platforms/fsl_uli1575.c
+++ b/arch/powerpc/platforms/fsl_uli1575.c
@@ -13,6 +13,7 @@
 #include <linux/of_irq.h>
 
 #include <asm/pci-bridge.h>
+#include <asm/ppc-pci.h>
 
 #define ULI_PIRQA	0x08
 #define ULI_PIRQB	0x09
@@ -36,7 +37,7 @@
 #define ULI_8259_IRQ14	0x0d
 #define ULI_8259_IRQ15	0x0f
 
-u8 uli_pirq_to_irq[8] = {
+static u8 uli_pirq_to_irq[8] = {
 	ULI_8259_IRQ9,		/* PIRQA */
 	ULI_8259_IRQ10,		/* PIRQB */
 	ULI_8259_IRQ11,		/* PIRQC */
@@ -341,8 +342,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_AL, 0x5288, hpcd_quirk_uli5288);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_AL, 0x5229, hpcd_quirk_uli5229);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AL, 0x5288, hpcd_final_uli5288);
 
-int uli_exclude_device(struct pci_controller *hose,
-			u_char bus, u_char devfn)
+int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn)
 {
 	if (bus == (hose->first_busno + 2)) {
 		/* exclude Modem controller */
-- 
2.20.1

