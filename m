Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14CC5642D2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 23:10:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lb4Tm5M0yz3c1J
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jul 2022 07:10:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=stevens-zone.net (client-ip=217.72.192.73; helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net; receiver=<UNKNOWN>)
X-Greylist: delayed 332 seconds by postgrey-1.36 at boromir; Sun, 03 Jul 2022 07:09:56 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lb4TJ2vCpz3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jul 2022 07:09:56 +1000 (AEST)
Received: from Cyrus.lan ([86.151.31.128]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.179]) with ESMTPA (Nemesis) id
 1Mqrjz-1nlpiW0UXx-00mqvZ; Sat, 02 Jul 2022 23:03:57 +0200
Date: Sat, 2 Jul 2022 22:03:55 +0100
From: Darren Stevens <darren@stevens-zone.net>
To: linuxppc-dev@lists.ozlabs.org, oss@buserror.net, chzigotzky@xenosoft.de,
 robh@kernel.org, stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: [PATCH v3] drivers/usb/host/ehci-fsl: Fix interrupt setup in host
 mode.
Message-ID: <20220702220355.63b36fb8@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7dP2sXcx+tU1+/TK79yzyTjl/O/pWtJa8WSayWZhp5S7eX3nEwZ
 afTpN6tXjGqRooJMr+bEZLB1jXf7XbtJdJUVXUK3CsI78xgvFzsAkIy1K/wSjWbMTKCOahn
 i1S+CpXI25tmplwOGpNqWt+lC6JWA5SSQ9ihdu+1dhKqHD8JAJPVhgT9caMizZkUGa+zGmc
 TsJ+CfUxgzkQtOoHvGbPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Uoxm6hO9yk=:SF8yDt+syLc9dNQ8MKFiJJ
 CVRJg+0LPKhFHd/1QphF0JTnx45WcwDP9Imw5llosDQ8h6jLOR7sVwBEes1Dl9kWn3wZP8bDU
 ggPo82ITUzQL9u5IZScbnTUnbr0U4ZearbeAGAGuVXrXx1IEfmA6ZmIBNALDGR1+QyjHMUt8j
 OfBeF7m7hh06GQkV+a1ikV3C2eW24ukE1mhxh/Yl8tOqPY6q3yIzXaIhx9YXTSPLYuRagZCQP
 OKQ469RkNrYI3DVESFnTXGULamTBw0RQ1rbA3WOsPqupMFbXUvVA2Z1KFc4O1dlX76xRmIzDU
 h1NFLO0/YFRMPoVfEgR/HdnXILT60gd8nONKjsjP/xHUFT/uNJLshDa4kmvngmMok81Gpxsak
 kwl16wR7bxt61NsXZ9ErwKm6GHlFrYZjp6R4aXz/VpJd65w5om9jV7BOgyO17Phbp105vEP1B
 FavqY9+JTTBEZTAAh5SIx0TtLTRUu2W5P+KKEqnhP1BV5nSylnBZQHtXN3cZL2Tc7Ge6GNd+l
 KdqPjPFOaElVYev97SM1Jihtgs6AphOncn88fsUO8GotZf/tx/n+RG/CG+Nu7GCNHBEJHANK7
 woTIooSbQUXnSqxah4QPJ2I1uoN8RQ5m7HId01/GUAk2ap3OGsHopw1NohCXPgEXJ9pQXh+bo
 VcY6MI/7FbLCKUj1tdIXD5A77VGnpCGhHq0AuPvE7Qd/K9PS4vtW66G+LLr7H79z5SpeLYWsJ
 L2CgtfzHPVqRo4vqn20QBsOILmINwWVERKjXc1h7EAbtIN4pQDm1pOJWcxM=
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
Cc: shawnguo@kernel.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
core) we stopped platform_get_resource() from returning the IRQ, as all
drivers were supposed to have switched to platform_get_irq()
Unfortunately the Freescale EHCI driver in host mode got missed. Fix
it.

Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Darren Stevens <darren@stevens-zone.net>
---
 v3 - Corrected resource allocation in fsl-mph-dr-of.c

 v2 - Fixed coding style, removed a couple of unneeded initializations,
      cc'd Layerscape maintainers.

Tested on AmigaOne X5000/20 and X5000/40 Contains code by Rob Herring 
(in fsl-mph-dr-of.c)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 385be30..896c0d1 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -76,14 +76,9 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev,
-			"Found HC with no IRQ. Check %s setup!\n",
-			dev_name(&pdev->dev));
-		return -ENODEV;
-	}
-	irq = res->start;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	hcd = __usb_create_hcd(&fsl_ehci_hc_driver, pdev->dev.parent,
 			       &pdev->dev, dev_name(&pdev->dev), NULL);
diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 44a7e58..e5df175 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -112,6 +112,9 @@ static struct platform_device *fsl_usb2_device_register(
 			goto error;
 	}
 
+	pdev->dev.of_node = ofdev->dev.of_node;
+	pdev->dev.of_node_reused = true;
+
 	retval = platform_device_add(pdev);
 	if (retval)
 		goto error;
