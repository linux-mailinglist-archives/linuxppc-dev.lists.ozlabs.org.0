Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D53953195D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 23:27:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcB7x6K5hzDwhM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 09:27:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcB651WXwzDwqD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 09:25:32 +1100 (AEDT)
Received: by mail-ot1-f53.google.com with SMTP id y11so6726088otq.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 14:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NLvw9f5cSXlPho1shNG7Jdg19r2wGEA2nCu/eGns0Js=;
 b=EmkTatJJS5ok7vBpWK/YbHGQNperC5RYYvqCkMMuWtHb8EC5Fu6UFG3vHrPsdcY4Dd
 8xMhwLbXJfyhTUhQk9P8PcC12CtroUzlKAelRtyDLt6gE+HozRcArjW2leLwzep88gbR
 nyPuPjE5HGxmkDl0ivaCcaN1I0xdS7WHDX1A+A8I7/EYJijws80MP8Qi0PM9J92Ni9NF
 BfF2ULE/vqbym7jI+vbDfS6wX9hzCbetse1NXCE0m6hCrGFBbd19pyFEZqGZa1vBh1uo
 vLAKLvJX3EhXPyNAL7pCwFqiqDj6LJs994wjWP1fSICL8011cuLSGHUJOqShGuAhQPtk
 hDCA==
X-Gm-Message-State: AOAM533pU/O0XvgYrJmvdbPcngREYdBvzG/K6CAcGnjqgUltB23Voqyv
 OLkqFdGfL7HvwxpSzS3oow==
X-Google-Smtp-Source: ABdhPJyQGFVfAP7PXxKkza/IfsEKHXTE/7yuVrEhheTI5TULfoj3OVppCi9bnJLCVmoT3f6DX3uh6g==
X-Received: by 2002:a9d:6b10:: with SMTP id g16mr166243otp.154.1613082331122; 
 Thu, 11 Feb 2021 14:25:31 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id j25sm978030otn.55.2021.02.11.14.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:25:30 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] of: Remove of_dev_{get,put}()
Date: Thu, 11 Feb 2021 16:25:25 -0600
Message-Id: <20210211222526.1318236-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210211222526.1318236-1-robh@kernel.org>
References: <20210211222526.1318236-1-robh@kernel.org>
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
Cc: Felipe Balbi <balbi@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>,
 Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Gilles Muller <Gilles.Muller@inria.fr>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 cocci@systeme.lip6.fr, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_dev_get() and of_dev_put are just wrappers for get_device()/put_device()
on a platform_device. There's also already platform_device_{get,put}()
wrappers for this purpose. Let's update the few users and remove
of_dev_{get,put}().

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Gilles Muller <Gilles.Muller@inria.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-usb@vger.kernel.org
Cc: cocci@systeme.lip6.fr
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/platforms/pseries/ibmebus.c |  4 ++--
 drivers/net/ethernet/ibm/emac/core.c     | 15 ++++++++-------
 drivers/of/device.c                      | 21 ---------------------
 drivers/of/platform.c                    |  4 ++--
 drivers/of/unittest.c                    |  2 +-
 drivers/usb/dwc3/dwc3-st.c               |  2 +-
 include/linux/of_device.h                |  3 ---
 scripts/coccinelle/free/put_device.cocci |  1 -
 8 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index 8c6e509f6967..c29328fe94e8 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -355,12 +355,12 @@ static int ibmebus_bus_device_probe(struct device *dev)
 	if (!drv->probe)
 		return error;
 
-	of_dev_get(of_dev);
+	get_device(dev);
 
 	if (of_driver_match_device(dev, dev->driver))
 		error = drv->probe(of_dev);
 	if (error)
-		of_dev_put(of_dev);
+		put_device(of_dev);
 
 	return error;
 }
diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index c00b9097eeea..471be6ec7e8a 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -38,6 +38,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #include <asm/processor.h>
@@ -2390,11 +2391,11 @@ static int emac_check_deps(struct emac_instance *dev,
 
 static void emac_put_deps(struct emac_instance *dev)
 {
-	of_dev_put(dev->mal_dev);
-	of_dev_put(dev->zmii_dev);
-	of_dev_put(dev->rgmii_dev);
-	of_dev_put(dev->mdio_dev);
-	of_dev_put(dev->tah_dev);
+	platform_device_put(dev->mal_dev);
+	platform_device_put(dev->zmii_dev);
+	platform_device_put(dev->rgmii_dev);
+	platform_device_put(dev->mdio_dev);
+	platform_device_put(dev->tah_dev);
 }
 
 static int emac_of_bus_notify(struct notifier_block *nb, unsigned long action,
@@ -2435,7 +2436,7 @@ static int emac_wait_deps(struct emac_instance *dev)
 	for (i = 0; i < EMAC_DEP_COUNT; i++) {
 		of_node_put(deps[i].node);
 		if (err)
-			of_dev_put(deps[i].ofdev);
+			platform_device_put(deps[i].ofdev);
 	}
 	if (err == 0) {
 		dev->mal_dev = deps[EMAC_DEP_MAL_IDX].ofdev;
@@ -2444,7 +2445,7 @@ static int emac_wait_deps(struct emac_instance *dev)
 		dev->tah_dev = deps[EMAC_DEP_TAH_IDX].ofdev;
 		dev->mdio_dev = deps[EMAC_DEP_MDIO_IDX].ofdev;
 	}
-	of_dev_put(deps[EMAC_DEP_PREV_IDX].ofdev);
+	platform_device_put(deps[EMAC_DEP_PREV_IDX].ofdev);
 	return err;
 }
 
diff --git a/drivers/of/device.c b/drivers/of/device.c
index aedfaaafd3e7..9a748855b39d 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -33,27 +33,6 @@ const struct of_device_id *of_match_device(const struct of_device_id *matches,
 }
 EXPORT_SYMBOL(of_match_device);
 
-struct platform_device *of_dev_get(struct platform_device *dev)
-{
-	struct device *tmp;
-
-	if (!dev)
-		return NULL;
-	tmp = get_device(&dev->dev);
-	if (tmp)
-		return to_platform_device(tmp);
-	else
-		return NULL;
-}
-EXPORT_SYMBOL(of_dev_get);
-
-void of_dev_put(struct platform_device *dev)
-{
-	if (dev)
-		put_device(&dev->dev);
-}
-EXPORT_SYMBOL(of_dev_put);
-
 int of_device_add(struct platform_device *ofdev)
 {
 	BUG_ON(ofdev->dev.of_node == NULL);
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 79bd5f5a1bf1..020bf860c72c 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -687,7 +687,7 @@ static int of_platform_notify(struct notifier_block *nb,
 		pdev_parent = of_find_device_by_node(rd->dn->parent);
 		pdev = of_platform_device_create(rd->dn, NULL,
 				pdev_parent ? &pdev_parent->dev : NULL);
-		of_dev_put(pdev_parent);
+		platform_device_put(pdev_parent);
 
 		if (pdev == NULL) {
 			pr_err("%s: failed to create for '%pOF'\n",
@@ -712,7 +712,7 @@ static int of_platform_notify(struct notifier_block *nb,
 		of_platform_device_destroy(&pdev->dev, &children_left);
 
 		/* and put the reference of the find */
-		of_dev_put(pdev);
+		platform_device_put(pdev);
 		break;
 	}
 
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index eb51bc147440..eb100627c186 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1286,7 +1286,7 @@ static void __init of_unittest_platform_populate(void)
 			unittest(pdev,
 				 "Could not create device for node '%pOFn'\n",
 				 grandchild);
-			of_dev_put(pdev);
+			platform_device_put(pdev);
 		}
 	}
 
diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index e733be840545..b06b7092b1a2 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -274,7 +274,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
 
 	dwc3_data->dr_mode = usb_get_dr_mode(&child_pdev->dev);
 	of_node_put(child);
-	of_dev_put(child_pdev);
+	platform_device_put(child_pdev);
 
 	/*
 	 * Configure the USB port as device or host according to the static
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 937f32f6aecb..d7a407dfeecb 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -26,9 +26,6 @@ static inline int of_driver_match_device(struct device *dev,
 	return of_match_device(drv->of_match_table, dev) != NULL;
 }
 
-extern struct platform_device *of_dev_get(struct platform_device *dev);
-extern void of_dev_put(struct platform_device *dev);
-
 extern int of_device_add(struct platform_device *pdev);
 extern int of_device_register(struct platform_device *ofdev);
 extern void of_device_unregister(struct platform_device *ofdev);
diff --git a/scripts/coccinelle/free/put_device.cocci b/scripts/coccinelle/free/put_device.cocci
index 120921366e84..f09f1e79bfa6 100644
--- a/scripts/coccinelle/free/put_device.cocci
+++ b/scripts/coccinelle/free/put_device.cocci
@@ -21,7 +21,6 @@ id = of_find_device_by_node@p1(x)
 if (id == NULL || ...) { ... return ...; }
 ... when != put_device(&id->dev)
     when != platform_device_put(id)
-    when != of_dev_put(id)
     when != if (id) { ... put_device(&id->dev) ... }
     when != e1 = (T)id
     when != e1 = (T)(&id->dev)
-- 
2.27.0

