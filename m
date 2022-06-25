Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF20955ACB0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 22:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVmW65Rhbz3dQc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 06:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=stevens-zone.net (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net; receiver=<UNKNOWN>)
X-Greylist: delayed 498 seconds by postgrey-1.36 at boromir; Sun, 26 Jun 2022 06:56:10 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVmVf6yQ1z3bm7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 06:56:09 +1000 (AEST)
Received: from Cyrus.lan ([86.151.31.128]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.179]) with ESMTPA (Nemesis) id
 1MfHIb-1nT6cq3OcV-00grLW; Sat, 25 Jun 2022 22:41:56 +0200
Date: Sat, 25 Jun 2022 21:41:51 +0100
From: Darren Stevens <darren@stevens-zone.net>
To: linuxppc-dev@lists.ozlabs.org, oss@buserror.net, chzigotzky@xenosoft.de,
 robh@kernel.org, stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: [PATCH v2 RFC] drivers/usb/host/ehci-fsl: Fix interrupt setup in
 host mode.
Message-ID: <20220625214151.547b3570@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:B16Y/Qez7m1NJOC3FAa/ivJ01TlYQP4wgq+TPKy6fg8yCxoCBP+
 GA9saqxlT1Yn+QeEI55Dn5hnFDszUJDqQSb5VTMas7sIOJg6kGgf7IDGBdnUSPXJyWVoZt3
 9pQJ6qZDVKKB5mQMPCmpywJkp9Hji6/s/tbK0Kytc2vnLvC4RbNdDIHwO2hwsePGUfKkoR5
 T8Vb4ReP8QRexTOZP1baw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E2VWmeWROnk=:4q1FBNEqN42AE4eJVrwjYs
 wb07jE7PltEBczoCdZvYx7YVHSzz7+mZzAbLYBxRk+vTDa4/JnN4mHKeNF5CuKXNUaGfpX8Rc
 yFspNhjFSZsNXUx0HrJ0yXqPSPWybrOw8MPgyGPMtsBmhDBZg5a5iEY7nPCoMnC/No/gspi/7
 syxRE8V6oIk7tB0NGcJb83nmWaoV8lC3DRgHxtOD4DrmQS1Bw+JK2UC73mofgAX9AA2KZ5L7Z
 mMxQhcARrlR+WawkSW5VyERMUFHmES2To2urfd0xTZx4359yzGcM97mAMJJFKbYle7GPd9Dpn
 UOPKULIUpFDqhSKIwqptzmDv+iD0taRBkDMG41G/3/QjvOMWlTtNB+IB8l1U7ismBK6XOgUBm
 1u2sbRW+m9TxPktynnLx1j1GkgXVjUW/av7teBxjJ6XwuUxn6yOCAT1g4F+jiAALnM0cQ5wmh
 3arJvL4L/fv82R8mu+nRIAMeOt1Se4PAFaxeGKK2xEiNPDIAUAbCHhbgdM975NJeUFEqrQeSv
 Pj4rxjTX7oeA5c/1xhRufYeZlDSMwhN2Q1sAFhmGzzQiM8j+lbkaZ17bjVhpJdmUmGI5zHxVG
 twi8t7TteX1YuZrIiJDkLerdfdX7f465fYkHOZLMOJrL2YOISin06hokDoDVJPHyRHvv0g3qZ
 91t/39Hn59bGwids0GfRt+G+cub0pDa3LASMGuJQ+Ejc6Es5no+u6WtfpDRjjs7QsDPtWjRuC
 LioxegcidOeZY1+xTAd0rlB/GKgoqdPyGM3Gj1frKCib7Mcaz8+yj7z+mBk=
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
it. Also fix allocation of resources to work with current kernel.

Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by Darren Stevens <darren@stevens-zone.net>
---
 v2 - Fixed coding style, removed a couple of unneeded initializations,
      cc'd Layerscape maintainers.

Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 385be30..8bd258a 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/fsl_devices.h>
 #include <linux/of_platform.h>
+#include <linux/of_address.h>
 #include <linux/io.h>
 
 #include "ehci.h"
@@ -46,9 +47,10 @@ static struct hc_driver __read_mostly fsl_ehci_hc_driver;
  */
 static int fsl_ehci_drv_probe(struct platform_device *pdev)
 {
+	struct device_node *dn = pdev->dev.of_node;
 	struct fsl_usb2_platform_data *pdata;
 	struct usb_hcd *hcd;
-	struct resource *res;
+	struct resource res;
 	int irq;
 	int retval;
 	u32 tmp;
@@ -76,14 +78,9 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
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
@@ -92,15 +89,18 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
 		goto err1;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
+	tmp = of_address_to_resource(dn, 0, &res);
+	if (tmp)
+		return tmp;
+
+	hcd->regs = devm_ioremap_resource(&pdev->dev, &res);
 	if (IS_ERR(hcd->regs)) {
 		retval = PTR_ERR(hcd->regs);
 		goto err2;
 	}
 
-	hcd->rsrc_start = res->start;
-	hcd->rsrc_len = resource_size(res);
+	hcd->rsrc_start = res.start;
+	hcd->rsrc_len = resource_size(&res);
 
 	pdata->regs = hcd->regs;
 
diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 44a7e58..766e4ab 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
 					const char *name, int id)
 {
 	struct platform_device *pdev;
-	const struct resource *res = ofdev->resource;
-	unsigned int num = ofdev->num_resources;
 	int retval;
 
 	pdev = platform_device_alloc(name, id);
@@ -106,11 +104,8 @@ static struct platform_device *fsl_usb2_device_register(
 	if (retval)
 		goto error;
 
-	if (num) {
-		retval = platform_device_add_resources(pdev, res, num);
-		if (retval)
-			goto error;
-	}
+	pdev->dev.of_node = ofdev->dev.of_node;
+	pdev->dev.of_node_reused = true;
 
 	retval = platform_device_add(pdev);
 	if (retval)
