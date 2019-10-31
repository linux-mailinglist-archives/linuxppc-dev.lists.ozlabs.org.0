Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F1EA855
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 01:43:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473RPj2l3PzF5FL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 11:43:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Dn8/QAVb"; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473R942q0YzF3xJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 11:32:08 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id p21so4068462wmg.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDHh+OVXKEM0h+uKC7EIERstcizYBjZxP2HUDdfEVt8=;
 b=Dn8/QAVbq0JfM6dbr7uT/LDSjMsuYs4CxFf+CS82fAkPePNSAGzb5Y0MnIf2ipZiHx
 POfZhnEE3UHOkJ9d/P4volBMryXP1/aujGfSYCD7vqeNMrU++oR+psgTkC/v689cAwcu
 FJP2RLuVzWiYM8UlzeEvwu9SX0Et8qvWQXB88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDHh+OVXKEM0h+uKC7EIERstcizYBjZxP2HUDdfEVt8=;
 b=TnoRPSb2OIzHBJ3yw9lPNwMPQXUDyD3+6DRJu6G5qI0OUIBxOCIZ8XWGV3UcpaoTVT
 /D/R2Ck5lV7/hw9wbUGV9dcyEohsgpOrwNptMNV9O0lpgSpNBIEl7eaZI3lRcsbig9cr
 Uhiqa9fdiyw/kKS2/082NujJEn9dL4CpuBIOMkzPsHFfQqK6gMDwICB/YZuj8bcFMam+
 e9GoSnxWjoFo+80tGOQLwtDmQnYqUqmWYW0gQXuQ81K16QBDQ3lEWI4tx8XqYGefmbG8
 fg5RIcn4MAF2AqruSp1uDIzOJCnxEiHgs/Ku3zE6ThEhHcHK0jbTfeTjTv9B7ZU4Y8Ql
 12Zg==
X-Gm-Message-State: APjAAAV5/ILeqpfsKmYyrmY8e6+ZbuLVwvFAOgNg+ShpoAQJwfpNeyJ3
 K51S7ssao1wXZkuLdEN0ADygiA==
X-Google-Smtp-Source: APXvYqz3VwKmyFrg0snFjZE++GwOdD4oDrvjFS6yyK5iarkJGuhLRfN5MmMf7SAZIOqcSO0W8SJCNw==
X-Received: by 2002:a7b:c01a:: with SMTP id c26mr2165585wmb.45.1572481924905; 
 Wed, 30 Oct 2019 17:32:04 -0700 (PDT)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id r13sm2357111wra.74.2019.10.30.17.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 17:32:04 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/5] powerpc: make pcibios_vaddr_is_ioport() static
Date: Thu, 31 Oct 2019 01:31:53 +0100
Message-Id: <20191031003154.21969-5-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031003154.21969-1-linux@rasmusvillemoes.dk>
References: <20191031003154.21969-1-linux@rasmusvillemoes.dk>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only caller of pcibios_vaddr_is_ioport() is in pci-common.c, so we
can make it static and move it into the same #ifndef block as its
caller.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/powerpc/include/asm/pci-bridge.h | 9 ---------
 arch/powerpc/kernel/pci-common.c      | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index ea6ec65970ef..deb29a1c9708 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -283,14 +283,5 @@ extern struct pci_controller *pcibios_alloc_controller(struct device_node *dev);
 extern void pcibios_free_controller(struct pci_controller *phb);
 extern void pcibios_free_controller_deferred(struct pci_host_bridge *bridge);
 
-#ifdef CONFIG_PCI
-extern int pcibios_vaddr_is_ioport(void __iomem *address);
-#else
-static inline int pcibios_vaddr_is_ioport(void __iomem *address)
-{
-	return 0;
-}
-#endif	/* CONFIG_PCI */
-
 #endif	/* __KERNEL__ */
 #endif	/* _ASM_POWERPC_PCI_BRIDGE_H */
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index d89a2426b405..928d7576c6c2 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -277,7 +277,8 @@ static resource_size_t pcibios_io_size(const struct pci_controller *hose)
 #endif
 }
 
-int pcibios_vaddr_is_ioport(void __iomem *address)
+#ifndef CONFIG_PPC_INDIRECT_PIO
+static int pcibios_vaddr_is_ioport(void __iomem *address)
 {
 	int ret = 0;
 	struct pci_controller *hose;
@@ -296,7 +297,6 @@ int pcibios_vaddr_is_ioport(void __iomem *address)
 	return ret;
 }
 
-#ifndef CONFIG_PPC_INDIRECT_PIO
 void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
 {
 	if (isa_vaddr_is_ioport(addr))
-- 
2.23.0

