Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DC2BE1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 06:09:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CgNG74gFzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:09:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="dYKBGgsq"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CgFP5MpQzDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 14:03:53 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 440827F8F8;
 Mon, 27 May 2019 23:03:21 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559016202; bh=EGTrKlRnXu1zsiLLv/Fv7FG8sil5S0AhH+klcU6GwLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dYKBGgsqdfiMi1eoJOtniAmEda6YnvbaZ/xR0B+e1QfXDskdOBl9uKEbG/HJ5rd02
 Eojzh34WnSaWRbdicp15KcL1bEIzo2zeHzY2QAej2d8C2Mc7BcC5yDwbh4xpT9Dr+j
 TLQj7Jv1GMFXtuSdQGtOaGcUYRgEdmaLsYzND1BxwXSNfBUOanTOguLFLwF6Ic58MT
 DLivhV6IUEvLEK+d7DA5CDOlgePmaYfTVNi0KAGktNmY7/OyhnFZJr0jOBacDWeXY1
 /ljrUZOTUTpgPpU7VhV/Xk24WcDJpR/w9P7nM5wqJVnEWcNssHybcvOZjd2ldctfts
 gQdSuZNgFSGOw==
From: Shawn Anastasio <shawn@anastas.io>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/3] powerpc/64: Enable pcibios_after_init hook on ppc64
Date: Mon, 27 May 2019 23:03:12 -0500
Message-Id: <20190528040313.35582-3-shawn@anastas.io>
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

Enable the pcibios_after_init hook on all powerpc platforms.
This hook is executed at the end of pcibios_init and was previously
only available on CONFIG_PPC32.

Since it is useful and not inherently limited to 32-bit mode,
remove the limitation and allow it on all powerpc platforms.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 arch/powerpc/include/asm/machdep.h | 3 +--
 arch/powerpc/kernel/pci_64.c       | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 2f0ca6560e47..2fbfaa9176ed 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -150,6 +150,7 @@ struct machdep_calls {
 	void		(*init)(void);
 
 	void		(*kgdb_map_scc)(void);
+#endif /* CONFIG_PPC32 */
 
 	/*
 	 * optional PCI "hooks"
@@ -157,8 +158,6 @@ struct machdep_calls {
 	/* Called at then very end of pcibios_init() */
 	void (*pcibios_after_init)(void);
 
-#endif /* CONFIG_PPC32 */
-
 	/* Called in indirect_* to avoid touching devices */
 	int (*pci_exclude_device)(struct pci_controller *, unsigned char, unsigned char);
 
diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 9d8c10d55407..fba7fe6e4a50 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -68,6 +68,10 @@ static int __init pcibios_init(void)
 
 	printk(KERN_DEBUG "PCI: Probing PCI hardware done\n");
 
+	/* Call machine dependent post-init code */
+	if (ppc_md.pcibios_after_init)
+		ppc_md.pcibios_after_init();
+
 	return 0;
 }
 
-- 
2.20.1

