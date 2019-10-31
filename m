Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F1EA846
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 01:34:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473RCg6516zF5Dd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 11:34:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Xo2jF187"; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473R925TVhzF3wk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 11:32:06 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id c22so4122061wmd.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DYhACg+zO53SUeLC5iAmeJtmmamitSVr5JjCgBatEmk=;
 b=Xo2jF187UE1MGGGjZ8wN0vNAH7wPPEVfI4ZvaURxYjN1pWSFx+8HdyvTcP3FzTn987
 08YzzHq6OGkCXz6Im4EZfJbwBJNjKtnt3kBbs0JwsG41sI9SdnEErK9HVKIuV5ytBAAd
 jnU/gdaLBryLQcmiUDOmHH8SzYQxepk523nE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DYhACg+zO53SUeLC5iAmeJtmmamitSVr5JjCgBatEmk=;
 b=GLcU9ezwB6WH4LTXHCERb0FjfgnfeleO563I8kGzX9QggatWs7UpxmpikuZTh702/Y
 Jr78uoT6hFcGwZD/u/weV/WXOLCL5hYtq+0DKT0Alcz5JRJvOQVTJzErxhDPi4SxTiR7
 vy3E202KYd+hD1UZY2QzdSXDVz2rpUqAcxebfW4G07zPe5ot4MMZBftz1A7qU4GjIOkm
 3qkx3FL37igm+I6Xwa6kiB7NcPI1aha1BAZKYOzohQNpaYfsXpz97rw0MRkhHEooqzLS
 hcekSfbSqLgJUVsEjaJHkxIFDBqJxftB5uoesYi1JuVn0RkN3OqSm7PrU66+GKAfBIah
 mtLg==
X-Gm-Message-State: APjAAAUrXU/3hFpuVjKYVu4vthqu8Akt7c57tgtpGbSJRhP59k/ywb3/
 6VAvU6ZaipywQUGealuw2KXjYg==
X-Google-Smtp-Source: APXvYqwpa/vkgm/Kk2t0MioAGkOHz3mAV7KnDHWGDzc5LpYTw6AEGiA6IRzxyLwSWzDsy21QG8gMPw==
X-Received: by 2002:a05:600c:cd:: with SMTP id
 u13mr2099609wmm.133.1572481923964; 
 Wed, 30 Oct 2019 17:32:03 -0700 (PDT)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id r13sm2357111wra.74.2019.10.30.17.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 17:32:03 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/5] powerpc: move pci_iounmap() from iomap.c to
 pci-common.c
Date: Thu, 31 Oct 2019 01:31:52 +0100
Message-Id: <20191031003154.21969-4-linux@rasmusvillemoes.dk>
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

As preparation for making iowrite32 and friends static inlines, move
the definition of pci_iounmap() from iomap.c to pci-common.c. This
definition of pci_iounmap() is compiled in when
!CONFIG_PPC_INDIRECT_PIO && CONFIG_PCI - we're just interchanging
which condition is in the Kbuild logic and which is in the .c file.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/powerpc/kernel/iomap.c      | 13 -------------
 arch/powerpc/kernel/pci-common.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/iomap.c b/arch/powerpc/kernel/iomap.c
index 5ac84efc6ede..b22fa8db5068 100644
--- a/arch/powerpc/kernel/iomap.c
+++ b/arch/powerpc/kernel/iomap.c
@@ -182,16 +182,3 @@ void ioport_unmap(void __iomem *addr)
 }
 EXPORT_SYMBOL(ioport_map);
 EXPORT_SYMBOL(ioport_unmap);
-
-#ifdef CONFIG_PCI
-void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
-{
-	if (isa_vaddr_is_ioport(addr))
-		return;
-	if (pcibios_vaddr_is_ioport(addr))
-		return;
-	iounmap(addr);
-}
-
-EXPORT_SYMBOL(pci_iounmap);
-#endif /* CONFIG_PCI */
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 1c448cf25506..d89a2426b405 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -34,6 +34,7 @@
 #include <asm/io.h>
 #include <asm/prom.h>
 #include <asm/pci-bridge.h>
+#include <asm/isa-bridge.h>
 #include <asm/byteorder.h>
 #include <asm/machdep.h>
 #include <asm/ppc-pci.h>
@@ -295,6 +296,18 @@ int pcibios_vaddr_is_ioport(void __iomem *address)
 	return ret;
 }
 
+#ifndef CONFIG_PPC_INDIRECT_PIO
+void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
+{
+	if (isa_vaddr_is_ioport(addr))
+		return;
+	if (pcibios_vaddr_is_ioport(addr))
+		return;
+	iounmap(addr);
+}
+EXPORT_SYMBOL(pci_iounmap);
+#endif /* CONFIG_PPC_INDIRECT_PIO */
+
 unsigned long pci_address_to_pio(phys_addr_t address)
 {
 	struct pci_controller *hose;
-- 
2.23.0

