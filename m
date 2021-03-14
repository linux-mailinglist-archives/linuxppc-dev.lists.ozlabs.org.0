Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B678133A3EE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 10:34:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DyvX451Wgz3dWQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 20:34:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rcScVYfc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rcScVYfc; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DyvWC0blpz3dHg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:33:43 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DyvWB6X4dz9sVt; Sun, 14 Mar 2021 20:33:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615714422;
 bh=yJaNIuoDXfgq4FgAmZ5/uX0jsWHJQACeECSVMYagb3Q=;
 h=From:To:Subject:Date:From;
 b=rcScVYfc63Wc94XuE8BKGd/ivhje9h5L9EKwhVGWMXPo4aKGclkBV4FFJU+1wMBGe
 b+QYV6+ey3dn1Nf0Cd5x1yCeF1pvng1ZEitcaSDa+Urliq19HvdoHXgepR1tlvMh3E
 9fsNywRMoGaqGdh9rs+6H6E4r3cULxF7J4rfTUJRy3dMKRDvffrxzALbhAnst/Whqr
 Rb5LtQK7EIW5hUp6d1vxmb8xbNY9IhI9vS7GlKUBqvNsMmObLlbbMMbTblEjYb3z/H
 z2qT9V6qBtpnbE+FzBMtJT0IiNDDArJ0wDP2EOAT3VJknMKFl4QqZ/enD+a4ahgEYE
 JGBg5Uvd2cYhA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/fsl-pci: Fix section mismatch warning
Date: Sun, 14 Mar 2021 20:33:41 +1100
Message-Id: <20210314093341.132986-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Section mismatch in reference from the function .fsl_add_bridge() to
the function .init.text:.setup_pci_cmd()

fsl_add_bridge() is not __init, and can't be, and is the only caller
of setup_pci_cmd(). Fix it by making setup_pci_cmd() non-init.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/sysdev/fsl_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 040b9d01c079..69af73765783 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -455,7 +455,7 @@ static void setup_pci_atmu(struct pci_controller *hose)
 	}
 }
 
-static void __init setup_pci_cmd(struct pci_controller *hose)
+static void setup_pci_cmd(struct pci_controller *hose)
 {
 	u16 cmd;
 	int cap_x;
-- 
2.25.1

