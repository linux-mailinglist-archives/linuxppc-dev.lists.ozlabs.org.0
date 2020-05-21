Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 614331DC792
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 09:28:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SLn938dyzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 17:27:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SLlW08bCzDqJc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 17:26:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=l+lDjiRO; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49SLlV4fPZz9sTK; Thu, 21 May 2020 17:26:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49SLlV3vpPz9sTM; Thu, 21 May 2020 17:26:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590045990;
 bh=5hAO11t3TvnJPJpewCMdd9FIUuOtAjBfEr/Mth/QNpI=;
 h=From:To:Cc:Subject:Date:From;
 b=l+lDjiROLAsW/1nK18Bx+q86+1OMFkdGWR0XxdJ11cGwiTUXiVCG/uPzlYbu60ucw
 nRvlGygReviCjKVbb62S6r5rH+S0p6ilYzRRqc/qwR+tK8wGe4n2zoySCl1yKOGOCw
 6RLEK40fxy9mB7Z83/ak9uiJxqvaA44Mnkc9W2X2hBI+C+XFbQkq3yfWCtPteG69Eo
 XVNFlDcBG9JDbAmKdkG3sV3uDIdZIs+H4cKw+iB9svrcRUMeyFS5eSiQJEaIZZNLrx
 8P7bjyZVOzlESFUd+acu1KzeaZjbUaJwQQ4TXeaoKNRqduysERLRrEqj2hvh0X6b9H
 fTC2MgiF+Ad9g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/4xx: Don't unmap NULL mbase
Date: Thu, 21 May 2020 17:26:48 +1000
Message-Id: <20200521072648.1254699-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: huhai@tj.kylinos.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: huhai <huhai@tj.kylinos.cn>

Signed-off-by: huhai <huhai@tj.kylinos.cn>
---
 arch/powerpc/platforms/4xx/pci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index e6e2adcc7b64..c13d64c3b019 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -1242,7 +1242,7 @@ static void __init ppc460sx_pciex_check_link(struct ppc4xx_pciex_port *port)
 	if (mbase == NULL) {
 		printk(KERN_ERR "%pOF: Can't map internal config space !",
 			port->node);
-		goto done;
+		return;
 	}
 
 	while (attempt && (0 == (in_le32(mbase + PECFG_460SX_DLLSTA)
@@ -1252,9 +1252,7 @@ static void __init ppc460sx_pciex_check_link(struct ppc4xx_pciex_port *port)
 	}
 	if (attempt)
 		port->link = 1;
-done:
 	iounmap(mbase);
-
 }
 
 static struct ppc4xx_pciex_hwops ppc460sx_pcie_hwops __initdata = {
-- 
2.25.1

