Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61167329D82
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 13:01:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqbLw38vTz3f76
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 23:01:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sgpQvl3w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sgpQvl3w; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqbJ63Zd4z3dYB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 22:58:46 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E20B64F9F;
 Tue,  2 Mar 2021 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686324;
 bh=RK39yCb+fRJqOssbDdNORXfix3bwYXfcz+g0VnGzLWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sgpQvl3w5CiTay9IZflgjVqQV4TURDx0AtZhmpwOEiaPuCVgIAeGG1uIrNHpQZOWa
 voasQQYuRq2f41TDv1SYM5+au/PS7ooYJBw6zHapRByneKRPh432YYzV825HgWiMHH
 5fzLhKj565H6E1EGH8vvEBlPQznSQxLeDYf0ERcq9xVycfQUtz9WYF3Z6+fS4Itatk
 1GiNu4cpUAEBkeoUzOKakiwM9eKh6MJkdJDCQFY+FhTIML45rqjwgltKGLAXwVoD6x
 JX5Oy/gxy9lmWTlvZ9CaJRx53hyAU2SW9wenbBCqd14DAOZ9CBVFziRR7PejxmSyVj
 D/1wudwzVZTdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 06/21] powerpc/pci: Add ppc_md.discover_phbs()
Date: Tue,  2 Mar 2021 06:58:20 -0500
Message-Id: <20210302115835.63269-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115835.63269-1-sashal@kernel.org>
References: <20210302115835.63269-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Oliver O'Halloran <oohall@gmail.com>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Oliver O'Halloran <oohall@gmail.com>

[ Upstream commit 5537fcb319d016ce387f818dd774179bc03217f5 ]

On many powerpc platforms the discovery and initalisation of
pci_controllers (PHBs) happens inside of setup_arch(). This is very early
in boot (pre-initcalls) and means that we're initialising the PHB long
before many basic kernel services (slab allocator, debugfs, a real ioremap)
are available.

On PowerNV this causes an additional problem since we map the PHB registers
with ioremap(). As of commit d538aadc2718 ("powerpc/ioremap: warn on early
use of ioremap()") a warning is printed because we're using the "incorrect"
API to setup and MMIO mapping in searly boot. The kernel does provide
early_ioremap(), but that is not intended to create long-lived MMIO
mappings and a seperate warning is printed by generic code if
early_ioremap() mappings are "leaked."

This is all fixable with dumb hacks like using early_ioremap() to setup
the initial mapping then replacing it with a real ioremap later on in
boot, but it does raise the question: Why the hell are we setting up the
PHB's this early in boot?

The old and wise claim it's due to "hysterical rasins." Aside from amused
grapes there doesn't appear to be any real reason to maintain the current
behaviour. Already most of the newer embedded platforms perform PHB
discovery in an arch_initcall and between the end of setup_arch() and the
start of initcalls none of the generic kernel code does anything PCI
related. On powerpc scanning PHBs occurs in a subsys_initcall so it should
be possible to move the PHB discovery to a core, postcore or arch initcall.

This patch adds the ppc_md.discover_phbs hook and a core_initcall stub that
calls it. The core_initcalls are the earliest to be called so this will
any possibly issues with dependency between initcalls. This isn't just an
academic issue either since on pseries and PowerNV EEH init occurs in an
arch_initcall and depends on the pci_controllers being available, similarly
the creation of pci_dns occurs at core_initcall_sync (i.e. between core and
postcore initcalls). These problems need to be addressed seperately.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
[mpe: Make discover_phbs() static]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20201103043523.916109-1-oohall@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/machdep.h |  3 +++
 arch/powerpc/kernel/pci-common.c   | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index a47de82fb8e2..bda87cbf106d 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -71,6 +71,9 @@ struct machdep_calls {
 	int		(*pcibios_root_bridge_prepare)(struct pci_host_bridge
 				*bridge);
 
+	/* finds all the pci_controllers present at boot */
+	void 		(*discover_phbs)(void);
+
 	/* To setup PHBs when using automatic OF platform driver for PCI */
 	int		(*pci_setup_phb)(struct pci_controller *host);
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 88e4f69a09e5..74628aca2bf1 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1671,3 +1671,13 @@ static void fixup_hide_host_resource_fsl(struct pci_dev *dev)
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_MOTOROLA, PCI_ANY_ID, fixup_hide_host_resource_fsl);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, PCI_ANY_ID, fixup_hide_host_resource_fsl);
+
+
+static int __init discover_phbs(void)
+{
+	if (ppc_md.discover_phbs)
+		ppc_md.discover_phbs();
+
+	return 0;
+}
+core_initcall(discover_phbs);
-- 
2.30.1

