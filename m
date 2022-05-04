Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1839551ABF0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 19:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktl1n6QPHz3bfn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 03:58:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hG+nzQoX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hG+nzQoX; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktl19277dz3bbp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 03:58:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9240618F8;
 Wed,  4 May 2022 17:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004B7C385A4;
 Wed,  4 May 2022 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651687082;
 bh=wzXnasZ78VhWcyWzDggxLS2kE3GV40WE6obISeL6wYw=;
 h=From:To:Cc:Subject:Date:From;
 b=hG+nzQoXWc8YFm5HbNPZHG2c540IC6LcNVKSfVTopvlcryvURcgSido6nfjjgJFYg
 rz5cOJ/h0cwMlrJXXf2pM1j4PqUD7goQnnu59fBHwwTPF+cv3OQBvbtGg4x12cDgKJ
 qgaiiOdQHBXBYltqiekwvzctrNcGf2x/lOzD72smxbKJYH9F8hsPcE6QNbfaQNfYQA
 AdbuCfPQn1rN/8IB+70Qqag+/mIYM2ZX1bs4oyAhgwav8ZdJ2GW58e+YFdPxm5wP8r
 sZnzqIsiUWWTpJm2W6NV8AznHaV3oK4dhlmpADAHol+sd/OlR5xYb+2PZlmN8Z1pzs
 iAU6MkBMt4WsQ==
Received: by pali.im (Postfix)
 id 10AEA96D; Wed,  4 May 2022 19:57:59 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] powerpc/pci: Add config option for using OF 'reg' for PCI
 domain
Date: Wed,  4 May 2022 19:57:18 +0200
Message-Id: <20220504175718.29011-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on
device-tree properties"), powerpc kernel always fallback to PCI domain
assignment from OF / Device Tree 'reg' property of the PCI controller.

PCI code for other Linux architectures use increasing assignment of the PCI
domain for individual controllers (assign the first free number), like it
was also for powerpc prior mentioned commit.

Upgrading powerpc kernels from LTS 4.4 version (which does not contain
mentioned commit) to new LTS versions brings a regression in domain
assignment.

Fix this issue by introducing a new option CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG
When this options is disabled then powerpc kernel would assign PCI domains
in the similar way like it is doing kernel for other architectures and also
how it was done prior that commit.

Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on device-tree properties")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/Kconfig             | 10 ++++++++++
 arch/powerpc/kernel/pci-common.c |  4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..4dd3e3acddda 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -375,6 +375,16 @@ config PPC_OF_PLATFORM_PCI
 	depends on PCI
 	depends on PPC64 # not supported on 32 bits yet
 
+config PPC_PCI_DOMAIN_FROM_OF_REG
+	bool "Use OF reg property for PCI domain"
+	depends on PCI
+	help
+	  By default PCI domain for host bridge during its registration is
+	  chosen as the lowest unused PCI domain number.
+
+	  When this option is enabled then PCI domain is determined from
+	  the OF / Device Tree 'reg' property.
+
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 8bc9cf62cd93..8cb6fc5302ae 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -74,7 +74,6 @@ void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
 static int get_phb_number(struct device_node *dn)
 {
 	int ret, phb_id = -1;
-	u32 prop_32;
 	u64 prop;
 
 	/*
@@ -83,7 +82,8 @@ static int get_phb_number(struct device_node *dn)
 	 * reading "ibm,opal-phbid", only present in OPAL environment.
 	 */
 	ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
-	if (ret) {
+	if (ret && IS_ENABLED(CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG)) {
+		u32 prop_32;
 		ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
 		prop = prop_32;
 	}
-- 
2.20.1

