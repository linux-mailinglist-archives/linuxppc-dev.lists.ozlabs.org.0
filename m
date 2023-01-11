Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B53665A28
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 12:31:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsQVg1ltkz3bWj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 22:31:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sxSjyavq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sxSjyavq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsQTh6Ln8z2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 22:30:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1790C61C03;
	Wed, 11 Jan 2023 11:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46B9C433F0;
	Wed, 11 Jan 2023 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673436628;
	bh=NT+9kgxXbcKs00BnDvnD/WUZhhoZwpAjU6ciWTyu3pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sxSjyavqoosrBfWnDYfgp0fXOcYU02X4gbmzX1NurCIj20jpUuPtnZ3z0RRPonBAq
	 GBmn7bvwZgeKI393bFz7L3CAJ1NACxZZJZtAhSdGaKCzBQad/R+h+Joj07opqkPbhf
	 ic00URaZmYHNBloFrUB3pkwgzqJgThKSPOs9ejd4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] of: device: make of_device_uevent_modalias() take a const device *
Date: Wed, 11 Jan 2023 12:30:03 +0100
Message-Id: <20230111113018.459199-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111113018.459199-1-gregkh@linuxfoundation.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6990; i=gregkh@linuxfoundation.org; h=from:subject; bh=NT+9kgxXbcKs00BnDvnD/WUZhhoZwpAjU6ciWTyu3pU=; b=owGbwMvMwCRo6H6F97bub03G02pJDMn75h6f8XZ5Dz+vkPnp+e0LZPNmVd7QN4paeLrFdENO7CIz kY6IjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZhIVSzDPF0f/icnJ1hm3l52cqfDvR Mpq9Y4/WeYp3D+0QHd+CuVUyWNX7yY/Sv+0M36UAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Liang He <windhl@126.com>, Zou Wei <zou_wei@huawei.com>, Samuel Holland <samuel@sholland.org>, Frank Rowand <frowand.list@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe@baylibre.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Lyude Paul <lyude@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Douglas Anderson <dianders@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_device_uevent_modalias() does not modify the device pointer passed to
it, so mark it constant.  In order to properly do this, a number of
busses need to have a modalias function added as they were attempting to
just point to of_device_uevent_modalias instead of their bus-specific
modalias function.  This is fine except if the prototype for a bus and
device type modalias function diverges and then problems could happen.  To
prevent all of that, just wrap the call to of_device_uevent_modalias()
directly for each bus and device type individually.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Liang He <windhl@126.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Corentin Labbe <clabbe@baylibre.com>
Cc: Zou Wei <zou_wei@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/platforms/pseries/ibmebus.c | 7 ++++++-
 drivers/bus/sunxi-rsb.c                  | 7 ++++++-
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 7 ++++++-
 drivers/macintosh/macio_asic.c           | 7 ++++++-
 drivers/of/device.c                      | 4 ++--
 include/linux/of_device.h                | 4 ++--
 6 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index a870cada7acd..58b798a0e879 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -426,9 +426,14 @@ static struct attribute *ibmebus_bus_device_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ibmebus_bus_device);
 
+static int ibmebus_bus_modalias(struct device *dev, struct kobj_uevent_env *env)
+{
+	return of_device_uevent_modalias(dev, env);
+}
+
 struct bus_type ibmebus_bus_type = {
 	.name      = "ibmebus",
-	.uevent    = of_device_uevent_modalias,
+	.uevent    = ibmebus_bus_modalias,
 	.bus_groups = ibmbus_bus_groups,
 	.match     = ibmebus_bus_bus_match,
 	.probe     = ibmebus_bus_device_probe,
diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 3aa91aed3bf7..a180af11e034 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -172,12 +172,17 @@ static void sunxi_rsb_device_remove(struct device *dev)
 	drv->remove(to_sunxi_rsb_device(dev));
 }
 
+static int sunxi_rsb_device_modalias(struct device *dev, struct kobj_uevent_env *env)
+{
+	return of_device_uevent_modalias(dev, env);
+}
+
 static struct bus_type sunxi_rsb_bus = {
 	.name		= RSB_CTRL_NAME,
 	.match		= sunxi_rsb_device_match,
 	.probe		= sunxi_rsb_device_probe,
 	.remove		= sunxi_rsb_device_remove,
-	.uevent		= of_device_uevent_modalias,
+	.uevent		= sunxi_rsb_device_modalias,
 };
 
 static void sunxi_rsb_dev_release(struct device *dev)
diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index f5741b45ca07..e31a0261c53e 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -161,9 +161,14 @@ static void dp_aux_ep_dev_release(struct device *dev)
 	kfree(aux_ep_with_data);
 }
 
+static int dp_aux_ep_dev_modalias(struct device *dev, struct kobj_uevent_env *env)
+{
+	return of_device_uevent_modalias(dev, env);
+}
+
 static struct device_type dp_aux_device_type_type = {
 	.groups		= dp_aux_ep_dev_groups,
-	.uevent		= of_device_uevent_modalias,
+	.uevent		= dp_aux_ep_dev_modalias,
 	.release	= dp_aux_ep_dev_release,
 };
 
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 3bc1f374e657..7f2b0107c733 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -128,12 +128,17 @@ static int macio_device_resume(struct device * dev)
 	return 0;
 }
 
+static int macio_device_modalias(struct device *dev, struct kobj_uevent_env *env)
+{
+	return of_device_uevent_modalias(dev, env);
+}
+
 extern const struct attribute_group *macio_dev_groups[];
 
 struct bus_type macio_bus_type = {
        .name	= "macio",
        .match	= macio_bus_match,
-       .uevent = of_device_uevent_modalias,
+       .uevent	= macio_device_modalias,
        .probe	= macio_device_probe,
        .remove	= macio_device_remove,
        .shutdown = macio_device_shutdown,
diff --git a/drivers/of/device.c b/drivers/of/device.c
index c674a13c3055..dda51b7ce597 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -248,7 +248,7 @@ const void *of_device_get_match_data(const struct device *dev)
 }
 EXPORT_SYMBOL(of_device_get_match_data);
 
-static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
+static ssize_t of_device_get_modalias(const struct device *dev, char *str, ssize_t len)
 {
 	const char *compat;
 	char *c;
@@ -372,7 +372,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	mutex_unlock(&of_mutex);
 }
 
-int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
+int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
 {
 	int sl;
 
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index ab7d557d541d..f4b57614979d 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -36,7 +36,7 @@ extern ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len);
 extern int of_device_request_module(struct device *dev);
 
 extern void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env);
-extern int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env);
+extern int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env);
 
 static inline struct device_node *of_cpu_device_node_get(int cpu)
 {
@@ -83,7 +83,7 @@ static inline int of_device_request_module(struct device *dev)
 	return -ENODEV;
 }
 
-static inline int of_device_uevent_modalias(struct device *dev,
+static inline int of_device_uevent_modalias(const struct device *dev,
 				   struct kobj_uevent_env *env)
 {
 	return -ENODEV;
-- 
2.39.0

