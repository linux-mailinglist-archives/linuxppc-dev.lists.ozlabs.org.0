Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A5553E63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 00:15:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSLST74yfz3cht
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 08:15:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=stevens-zone.net (client-ip=212.227.126.135; helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net; receiver=<UNKNOWN>)
X-Greylist: delayed 325 seconds by postgrey-1.36 at boromir; Wed, 22 Jun 2022 08:15:30 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSLS24nldz30F8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 08:15:30 +1000 (AEST)
Received: from Cyrus.lan ([86.151.31.128]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.163]) with ESMTPA (Nemesis) id
 1MjPYI-1nNbob2D6I-00kywU; Wed, 22 Jun 2022 00:09:43 +0200
Date: Tue, 21 Jun 2022 23:09:41 +0100
From: Darren Stevens <darren@stevens-zone.net>
To: linuxppc-dev@lists.ozlabs.org, oss@buserror.net, chzigotzky@xenosoft.de,
 robh@kernel.org, stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: [PATCH RFC] drivers/usb/ehci-fsl: Fix interrupt setup in host mode.
Message-ID: <20220621230941.381f9791@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Ayh/DqLZxuxcGgHIen4KcjIrEaWKLYpKbbcFNXeXDHKnIN4LIhE
 LoPxWSqYHIBM+lXCwQnMGYrG9Cl2yX59H3BM0D3LNC26aEVlBB3y28DK/dYIwLgSdOYhBlf
 hARpHRQBBR4M9Vn6h0fJA8fZnK5FeGAm/aQONu9m1qtBGzA5SZK+kD65RZFqEgpAcycKPl8
 UOxfJCfE4DwFM5JaiscoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rdKK4xW06Ok=:defuqoNgRShfAs+owD3Z7e
 aYduI0Q23X/+0KYVgOQcffkzd/8hpm9UNiYAmXtlEuZgx4mE7DsJxml06Suh66etqNAlSFnXO
 Rs7KKy6EkLuOdGUAJpv4MBKHXnkFqVIKvNSa2W9UeOOQ/QMJO/lZlcnp7pSL5xiFUjMA6DhLL
 rEkqtyHLXpRS/rDy9C3VNVssUCujNW8x5l8j6DE2MqgrnOeKK7keb1D6JXYrcZVENxRtTnWfD
 RjnWgef9Nr4irVLt91Fl66lFO2NLeujuzsj16WMIG8Hbd//Jncq9Mp/357qYhS+B9CbzqbXdQ
 M6tsRyq2AFjGq7+p0WLPjHbgYvwTbEjGP9rGi6KKmOWlcNA4UuYcEXEQfutRRukXjm1J3sZLn
 /H5yetxrFVe9UPBqLvCvIl7WU+hxSL3dm70M9rDU1BJYEHTpY5XBdm/I7glSsO8ySUTKXriv4
 zgR1Ynk2+Hc5qmwAav8pWm8+6upIa+AY61H6ThZDDtOsQF33ayr7gh3LGW65HI9Bvl1y0CRgj
 YiQdM2/QEd6l5zzLklvlGNy7yl0J66kBNQX0RvaCAHQzpNeDD9yO3CSEoga2ElR2GFpcs+lHR
 VvKdRYbJC5WHlo2ZV/N9DjUOhdskBCka3mr+4GRaY5qhkC83+qfQi2zY/yS6kn+vmX4Y0eyiL
 0PZn9Xh6GjrQ8VAt3nHgwQbol4z3Og5rb813RbjWI9uGWAagADV1Pa7q3GdOOOWsO3ycaNc0T
 zxxLN94u9t0392noSHUTvtdrAwvcGaORw+4m/9iy0Gl7hhNRo7csmpMvcCU=
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In patch a1a2b7125e1079 (Drop static setup of IRQ resource from DT
core) we stopped platform_get_resource() from returning the IRQ, as all
drivers were supposed to have switched to platform_get_irq()
Unfortunately the Freescale EHCI driver in host mode got missed. Fix
it. Also fix allocation of resources to work with current kernel.

Fixes:a1a2b7125e1079 (Drop static setup of IRQ resource from DT core)
Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by Darren Stevens <darren@stevens-zone.net>
---
Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 385be30..d0bf7fb 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/fsl_devices.h>
 #include <linux/of_platform.h>
+#include <linux/of_address.h>
 #include <linux/io.h>
 
 #include "ehci.h"
@@ -46,9 +47,10 @@ static struct hc_driver __read_mostly
fsl_ehci_hc_driver; */
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
@@ -76,14 +78,10 @@ static int fsl_ehci_drv_probe(struct
platform_device *pdev) return -ENODEV;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev,
-			"Found HC with no IRQ. Check %s setup!\n",
-			dev_name(&pdev->dev));
-		return -ENODEV;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		return irq;
 	}
-	irq = res->start;
 
 	hcd = __usb_create_hcd(&fsl_ehci_hc_driver, pdev->dev.parent,
 			       &pdev->dev, dev_name(&pdev->dev), NULL);
@@ -92,15 +90,21 @@ static int fsl_ehci_drv_probe(struct
platform_device *pdev) goto err1;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
+	platform_set_drvdata(pdev, hcd);
+	pdev->dev.platform_data = pdata;
+
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
 
diff --git a/drivers/usb/host/fsl-mph-dr-of.c
b/drivers/usb/host/fsl-mph-dr-of.c index 44a7e58..766e4ab 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -80,8 +80,6 @@ static struct platform_device
*fsl_usb2_device_register( const char *name, int id)
 {
 	struct platform_device *pdev;
-	const struct resource *res = ofdev->resource;
-	unsigned int num = ofdev->num_resources;
 	int retval;
 
 	pdev = platform_device_alloc(name, id);
@@ -106,11 +104,8 @@ static struct platform_device
*fsl_usb2_device_register( if (retval)
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
