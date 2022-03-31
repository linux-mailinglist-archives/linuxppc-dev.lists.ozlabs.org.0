Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A2D4ED7AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 12:14:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTfKP5RHyz3c1f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 21:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTfK04Mbvz2xtJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 21:13:39 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KTfJw1hScz9sSK;
 Thu, 31 Mar 2022 12:13:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqMkGpmu4eRn; Thu, 31 Mar 2022 12:13:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KTfJw0kq8z9sS8;
 Thu, 31 Mar 2022 12:13:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 057648B788;
 Thu, 31 Mar 2022 12:13:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RnsNm-xpBB6N; Thu, 31 Mar 2022 12:13:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.54])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AC85F8B780;
 Thu, 31 Mar 2022 12:13:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22VADLir548128
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 12:13:21 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22VADJx1548126;
 Thu, 31 Mar 2022 12:13:19 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Scott Wood <oss@buserror.net>, Johannes Thumshirn <morbidrsa@gmail.com>
Subject: [PATCH] powerpc/85xx: Remove fsl,85... bindings
Date: Thu, 31 Mar 2022 12:13:10 +0200
Message-Id: <82a8bc4450a4daee50ee5fada75621fecb3703ff.1648721299.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648721588; l=3831; s=20211009;
 h=from:subject:message-id; bh=vGHHyyqAvTlkbKM83RyvQiGuZKiDG+ZcFAXqj4DBm0s=;
 b=qT9xl0TFxnQZPJzGGdZeuS+z9K8siQA5PCCUQk4FeouIrQNQoAP/b+99e3dQQ4zMXS3knWIxn+eo
 FgBoJKLmDOWS+OF6TIED5JBW45vpP+0qXjJulpC+EoUAl/xzEAIU
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: devicetree@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Robert Richter <rric@kernel.org>, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 8a4ab218ef70 ("powerpc/85xx: Change deprecated binding
for 85xx-based boards"), those bindings are not used anymore.

A comment in drivers/edac/mpc85xx_edac.c say they are to be removed
with kernel 2.6.30.

Remove them now.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../bindings/memory-controllers/fsl/fsl,ddr.yaml   |  6 ------
 .../devicetree/bindings/powerpc/fsl/l2cache.txt    |  6 ------
 drivers/edac/mpc85xx_edac.c                        | 14 --------------
 3 files changed, 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ddr.yaml
index af5147f9da72..84f778a99546 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ddr.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ddr.yaml
@@ -25,12 +25,6 @@ properties:
           - const: fsl,qoriq-memory-controller
       - enum:
           - fsl,bsc9132-memory-controller
-          - fsl,8540-memory-controller
-          - fsl,8541-memory-controller
-          - fsl,8544-memory-controller
-          - fsl,8548-memory-controller
-          - fsl,8555-memory-controller
-          - fsl,8568-memory-controller
           - fsl,mpc8536-memory-controller
           - fsl,mpc8540-memory-controller
           - fsl,mpc8541-memory-controller
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt b/Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt
index 8a70696395a7..22ad012660e9 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt
@@ -6,12 +6,6 @@ The cache bindings explained below are Devicetree Specification compliant
 Required Properties:
 
 - compatible	: Should include one of the following:
-		  "fsl,8540-l2-cache-controller"
-		  "fsl,8541-l2-cache-controller"
-		  "fsl,8544-l2-cache-controller"
-		  "fsl,8548-l2-cache-controller"
-		  "fsl,8555-l2-cache-controller"
-		  "fsl,8568-l2-cache-controller"
 		  "fsl,b4420-l2-cache-controller"
 		  "fsl,b4860-l2-cache-controller"
 		  "fsl,bsc9131-l2-cache-controller"
diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 67f7bc3fe5b3..5bf92298554d 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -609,13 +609,6 @@ static int mpc85xx_l2_err_remove(struct platform_device *op)
 }
 
 static const struct of_device_id mpc85xx_l2_err_of_match[] = {
-/* deprecate the fsl,85.. forms in the future, 2.6.30? */
-	{ .compatible = "fsl,8540-l2-cache-controller", },
-	{ .compatible = "fsl,8541-l2-cache-controller", },
-	{ .compatible = "fsl,8544-l2-cache-controller", },
-	{ .compatible = "fsl,8548-l2-cache-controller", },
-	{ .compatible = "fsl,8555-l2-cache-controller", },
-	{ .compatible = "fsl,8568-l2-cache-controller", },
 	{ .compatible = "fsl,mpc8536-l2-cache-controller", },
 	{ .compatible = "fsl,mpc8540-l2-cache-controller", },
 	{ .compatible = "fsl,mpc8541-l2-cache-controller", },
@@ -644,13 +637,6 @@ static struct platform_driver mpc85xx_l2_err_driver = {
 };
 
 static const struct of_device_id mpc85xx_mc_err_of_match[] = {
-/* deprecate the fsl,85.. forms in the future, 2.6.30? */
-	{ .compatible = "fsl,8540-memory-controller", },
-	{ .compatible = "fsl,8541-memory-controller", },
-	{ .compatible = "fsl,8544-memory-controller", },
-	{ .compatible = "fsl,8548-memory-controller", },
-	{ .compatible = "fsl,8555-memory-controller", },
-	{ .compatible = "fsl,8568-memory-controller", },
 	{ .compatible = "fsl,mpc8536-memory-controller", },
 	{ .compatible = "fsl,mpc8540-memory-controller", },
 	{ .compatible = "fsl,mpc8541-memory-controller", },
-- 
2.35.1

