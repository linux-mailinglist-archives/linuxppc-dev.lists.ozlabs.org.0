Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ED17E9672
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 06:20:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fpx+Jibn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STHnR102Pz3cTx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 16:20:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fpx+Jibn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STHmZ4wPgz3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 16:19:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699852782;
	bh=BxI1lsBuCW4vDoLChi5IWUDcx7NqULHserKaaGQ0G1U=;
	h=From:To:Cc:Subject:Date:From;
	b=Fpx+JibnVfzjHPeWzooUCtfbofmUjPjGQ7N2weWLylXHI8QCMWXRg4bWpQ+Vq7f8V
	 pXok3ZvVbnvh3/lChKFS1uPL1gZa+07Y2OAOXN1jnuHCQaPo53aQzQMNtDKqqW4WOf
	 Nax/wNxUoo8MaJ7i1qeFn+lRXaYG1Zs4gIQxVav5pgoTqOOy7XZzv5gC4UDTwn5va3
	 GWWaI1R+HumR6j3B8SjOQZUa6g/JtzoIQReGyB+M/DxRJqa3jElcZWoCcEZPMkO/pk
	 WSqi7aT7LmtzGLaNFLJffmOpF4AocDj90Lf/m6rG0Qkzio9v83w45YbL8vWarYMtaS
	 XIAMBhIFDf2Ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4STHmZ1Qvcz4x3D;
	Mon, 13 Nov 2023 16:19:42 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/32: Drop unused grackle_set_stg()
Date: Mon, 13 Nov 2023 16:19:29 +1100
Message-ID: <20231113051929.1952351-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Cc: bhelgaas@google.com, nathan@kernel.org, ndesaulniers@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The call to grackle_set_stg() ("Store Gathering") has always been inside
an #ifdef 0, since the code was first merged in v2.3.43pre7.

Apparently it was suspected of causing problems on some hardware so was
disabled. No one has ever proved otherwise so drop the code as unused
for now.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/all/20231031145600.GA9161@bhelgaas/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/sysdev/grackle.c | 19 -------------------
 1 file changed, 19 deletions(-)

Some additional detail too verbose/boring for the change log.

Initial commit introducing the code, under #ifdef 0:
https://git.kernel.org/pub/scm/linux/kernel/git/mpe/linux-fullhistory.git/tree/arch/ppc/kernel/pmac_pci.c?id=2fac5cbf1dd9a7720aa0130575a0b36ba4f04ede#n623

Discussion of the hardware problems it might have caused, but with no meaningful conclusion:
https://lore.kernel.org/all/20000903134303.2744@192.168.1.10/


diff --git a/arch/powerpc/sysdev/grackle.c b/arch/powerpc/sysdev/grackle.c
index fd2f94a884f0..7dce8278b71e 100644
--- a/arch/powerpc/sysdev/grackle.c
+++ b/arch/powerpc/sysdev/grackle.c
@@ -18,24 +18,8 @@
 #define GRACKLE_CFA(b, d, o)	(0x80 | ((b) << 8) | ((d) << 16) \
 				 | (((o) & ~3) << 24))
 
-#define GRACKLE_PICR1_STG		0x00000040
 #define GRACKLE_PICR1_LOOPSNOOP		0x00000010
 
-/* N.B. this is called before bridges is initialized, so we can't
-   use grackle_pcibios_{read,write}_config_dword. */
-static inline void grackle_set_stg(struct pci_controller* bp, int enable)
-{
-	unsigned int val;
-
-	out_be32(bp->cfg_addr, GRACKLE_CFA(0, 0, 0xa8));
-	val = in_le32(bp->cfg_data);
-	val = enable? (val | GRACKLE_PICR1_STG) :
-		(val & ~GRACKLE_PICR1_STG);
-	out_be32(bp->cfg_addr, GRACKLE_CFA(0, 0, 0xa8));
-	out_le32(bp->cfg_data, val);
-	(void)in_le32(bp->cfg_data);
-}
-
 static inline void grackle_set_loop_snoop(struct pci_controller *bp, int enable)
 {
 	unsigned int val;
@@ -56,7 +40,4 @@ void __init setup_grackle(struct pci_controller *hose)
 		pci_add_flags(PCI_REASSIGN_ALL_BUS);
 	if (of_machine_is_compatible("AAPL,PowerBook1998"))
 		grackle_set_loop_snoop(hose, 1);
-#if 0	/* Disabled for now, HW problems ??? */
-	grackle_set_stg(hose, 1);
-#endif
 }
-- 
2.41.0

