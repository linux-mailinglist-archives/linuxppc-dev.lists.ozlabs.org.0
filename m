Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4F6DBB25
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 15:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtwwV3KxSz3fbP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 23:25:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MdxuSe+L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MdxuSe+L;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptwtg0xwfz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 23:24:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD481614A8;
	Sat,  8 Apr 2023 13:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E34C4339E;
	Sat,  8 Apr 2023 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680960248;
	bh=Ycr7jTbAN7a67s9Ksm6I4CQ7mN9wdogyCtOnF9CVtvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MdxuSe+LGcMjPGW4s4MBfLc4ay1yMaMhj5hJnik1bVIBWEmhdEygdUtUCZSXAiCvg
	 28wiN5rrZnZMBaStGPphkC0IhmslAZCRqadt6BgA3d2D0ALiF4B9XahwbrpF0BEzmA
	 Tm3ZbyltDJ+d/SzG9PxLUs8rvVW6McW+2Sz9/UL5KOH3E+dzRvbho4YL8xsLRcFafS
	 0dgTxKuhMYiwc1IYNo0W5lKb8QcKFIBQm9ygCVa2recOwMslclHih3N8EMP4Xhp9ak
	 pVk+WHMhtwGEXdBt7yJwdop6iLEdEGR60s+X6mW3DC8stexV8rS32fQ498xLOjA8hf
	 EkaNeF1d1gTSA==
Received: by pali.im (Postfix)
	id 9734A2047; Sat,  8 Apr 2023 15:24:05 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 3/8] powerpc/fsl_uli1575: Simplify uli_exclude_device() usage
Date: Sat,  8 Apr 2023 15:21:46 +0200
Message-Id: <20230408132151.8902-4-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230408132151.8902-1-pali@kernel.org>
References: <20230408132151.8902-1-pali@kernel.org>
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

Function uli_exclude_device() is called only from mpc86xx_exclude_device()
and mpc85xx_exclude_device() functions. Both those functions are same, so
merge its logic directly into the uli_exclude_device() function.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/mpc85xx_ds.c   | 13 +------------
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c | 13 +------------
 arch/powerpc/platforms/fsl_uli1575.c       |  4 +++-
 3 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 0c905a838942..581b5f0ef3be 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -107,17 +107,6 @@ void __init mpc85xx_ds_pic_init(void)
 #endif	/* CONFIG_PPC_I8259 */
 }
 
-#ifdef CONFIG_PCI
-static int mpc85xx_exclude_device(struct pci_controller *hose,
-				   u_char bus, u_char devfn)
-{
-	if (hose->dn == fsl_pci_primary)
-		return uli_exclude_device(hose, bus, devfn);
-
-	return PCIBIOS_SUCCESSFUL;
-}
-#endif	/* CONFIG_PCI */
-
 static void __init mpc85xx_ds_uli_init(void)
 {
 #ifdef CONFIG_PCI
@@ -132,7 +121,7 @@ static void __init mpc85xx_ds_uli_init(void)
 		node = pci_with_uli;
 
 		if (pci_with_uli == fsl_pci_primary) {
-			ppc_md.pci_exclude_device = mpc85xx_exclude_device;
+			ppc_md.pci_exclude_device = uli_exclude_device;
 			break;
 		}
 	}
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index 3dbd396a0df5..645125cc8420 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -39,17 +39,6 @@
 #define DBG(fmt...) do { } while(0)
 #endif
 
-#ifdef CONFIG_PCI
-static int mpc86xx_exclude_device(struct pci_controller *hose,
-				   u_char bus, u_char devfn)
-{
-	if (hose->dn == fsl_pci_primary)
-		return uli_exclude_device(hose, bus, devfn);
-
-	return PCIBIOS_SUCCESSFUL;
-}
-#endif /* CONFIG_PCI */
-
 
 static void __init
 mpc86xx_hpcn_setup_arch(void)
@@ -58,7 +47,7 @@ mpc86xx_hpcn_setup_arch(void)
 		ppc_md.progress("mpc86xx_hpcn_setup_arch()", 0);
 
 #ifdef CONFIG_PCI
-	ppc_md.pci_exclude_device = mpc86xx_exclude_device;
+	ppc_md.pci_exclude_device = uli_exclude_device;
 #endif
 
 	printk("MPC86xx HPCN board from Freescale Semiconductor\n");
diff --git a/arch/powerpc/platforms/fsl_uli1575.c b/arch/powerpc/platforms/fsl_uli1575.c
index a32f9cef7845..1350db0b935d 100644
--- a/arch/powerpc/platforms/fsl_uli1575.c
+++ b/arch/powerpc/platforms/fsl_uli1575.c
@@ -15,6 +15,8 @@
 #include <asm/pci-bridge.h>
 #include <asm/ppc-pci.h>
 
+#include <sysdev/fsl_pci.h>
+
 #define ULI_PIRQA	0x08
 #define ULI_PIRQB	0x09
 #define ULI_PIRQC	0x0a
@@ -344,7 +346,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AL, 0x5288, hpcd_final_uli5288);
 
 int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn)
 {
-	if (bus == (hose->first_busno + 2)) {
+	if (hose->dn == fsl_pci_primary && bus == (hose->first_busno + 2)) {
 		/* exclude Modem controller */
 		if ((PCI_SLOT(devfn) == 29) && (PCI_FUNC(devfn) == 1))
 			return PCIBIOS_DEVICE_NOT_FOUND;
-- 
2.20.1

