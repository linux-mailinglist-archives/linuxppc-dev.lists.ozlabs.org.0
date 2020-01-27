Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C493F14A343
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 12:48:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485p0w6HfbzDqHH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 22:48:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=andrei.botila@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485nJm0647zDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 22:17:02 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 02C5D1B6B0D;
 Mon, 27 Jan 2020 12:16:58 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E9BCA1B6B02;
 Mon, 27 Jan 2020 12:16:57 +0100 (CET)
Received: from lorenz.ea.freescale.net (lorenz.ea.freescale.net [10.171.71.5])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9BC92205C6;
 Mon, 27 Jan 2020 12:16:57 +0100 (CET)
From: Andrei Botila <andrei.botila@nxp.com>
To: Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH] bus: fsl-mc: add api to retrieve mc version
Date: Mon, 27 Jan 2020 13:16:01 +0200
Message-Id: <1580123761-19536-1-git-send-email-andrei.botila@nxp.com>
X-Mailer: git-send-email 2.1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 27 Jan 2020 22:45:52 +1100
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
Cc: Andrei Botila <andrei.botila@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new api that returns Management Complex firmware version
and make the required structure public. The api's first user will be
the caam driver for setting prediction resistance bits.

Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 33 +++++++++++++++++----------------
 include/linux/fsl/mc.h          | 16 ++++++++++++++++
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index a07cc19becdb..330c76181604 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -26,6 +26,8 @@
  */
 #define FSL_MC_DEFAULT_DMA_MASK	(~0ULL)
 
+static struct fsl_mc_version mc_version;
+
 /**
  * struct fsl_mc - Private data of a "fsl,qoriq-mc" platform device
  * @root_mc_bus_dev: fsl-mc device representing the root DPRC
@@ -54,20 +56,6 @@ struct fsl_mc_addr_translation_range {
 	phys_addr_t start_phys_addr;
 };
 
-/**
- * struct mc_version
- * @major: Major version number: incremented on API compatibility changes
- * @minor: Minor version number: incremented on API additions (that are
- *		backward compatible); reset when major version is incremented
- * @revision: Internal revision number: incremented on implementation changes
- *		and/or bug fixes that have no impact on API
- */
-struct mc_version {
-	u32 major;
-	u32 minor;
-	u32 revision;
-};
-
 /**
  * fsl_mc_bus_match - device to driver matching callback
  * @dev: the fsl-mc device to match against
@@ -338,7 +326,7 @@ EXPORT_SYMBOL_GPL(fsl_mc_driver_unregister);
  */
 static int mc_get_version(struct fsl_mc_io *mc_io,
 			  u32 cmd_flags,
-			  struct mc_version *mc_ver_info)
+			  struct fsl_mc_version *mc_ver_info)
 {
 	struct fsl_mc_command cmd = { 0 };
 	struct dpmng_rsp_get_version *rsp_params;
@@ -363,6 +351,20 @@ static int mc_get_version(struct fsl_mc_io *mc_io,
 	return 0;
 }
 
+/**
+ * fsl_mc_get_version - function to retrieve the MC f/w version information
+ *
+ * Return:	mc version when called after fsl-mc-bus probe; NULL otherwise.
+ */
+struct fsl_mc_version *fsl_mc_get_version(void)
+{
+	if (mc_version.major)
+		return &mc_version;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(fsl_mc_get_version);
+
 /**
  * fsl_mc_get_root_dprc - function to traverse to the root dprc
  */
@@ -862,7 +864,6 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
 	int container_id;
 	phys_addr_t mc_portal_phys_addr;
 	u32 mc_portal_size;
-	struct mc_version mc_version;
 	struct resource res;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 54d9436600c7..2b5f8366dbe1 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -381,6 +381,22 @@ int __must_check __fsl_mc_driver_register(struct fsl_mc_driver *fsl_mc_driver,
 
 void fsl_mc_driver_unregister(struct fsl_mc_driver *driver);
 
+/**
+ * struct fsl_mc_version
+ * @major: Major version number: incremented on API compatibility changes
+ * @minor: Minor version number: incremented on API additions (that are
+ *		backward compatible); reset when major version is incremented
+ * @revision: Internal revision number: incremented on implementation changes
+ *		and/or bug fixes that have no impact on API
+ */
+struct fsl_mc_version {
+	u32 major;
+	u32 minor;
+	u32 revision;
+};
+
+struct fsl_mc_version *fsl_mc_get_version(void);
+
 int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,
 					u16 mc_io_flags,
 					struct fsl_mc_io **new_mc_io);
-- 
2.17.1

