Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C68ABD0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 22:13:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VMN4S5bC2z3dKL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Apr 2024 06:13:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 609 seconds by postgrey-1.37 at boromir; Sun, 21 Apr 2024 06:13:03 AEST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VMN3z2jpLz3cgf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Apr 2024 06:13:03 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id A1B9C30008F1A;
	Sat, 20 Apr 2024 22:02:46 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 9AB0ACC66D; Sat, 20 Apr 2024 22:02:46 +0200 (CEST)
Message-ID: <2e3eaaf2600bb55c0415c23ba301e809403a7aa2.1713608122.git.lukas@wunner.de>
In-Reply-To: <cover.1713608122.git.lukas@wunner.de>
References: <cover.1713608122.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sat, 20 Apr 2024 22:00:01 +0200
Subject: [PATCH 1/6] driver core: Add device_show_string() helper for sysfs
 attributes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For drivers wishing to expose an unsigned long, int or bool at a static
memory location in sysfs, the driver core provides ready-made helpers
such as device_show_ulong() to be used as ->show() callback.

Some drivers need to expose a string and so far they all provide their
own ->show() implementation.  arch/powerpc/perf/hv-24x7.c went so far
as to create a device_show_string() helper but kept it private.

Make it public for reuse by other drivers.  The pattern seems to be
sufficiently frequent to merit a public helper.

Add a DEVICE_STRING_ATTR_RO() macro in line with the existing
DEVICE_ULONG_ATTR() and similar macros to ease declaration of string
attributes.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 arch/powerpc/perf/hv-24x7.c | 10 ----------
 drivers/base/core.c         |  9 +++++++++
 include/linux/device.h      | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 057ec2e3451d..d400fa391c27 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -425,16 +425,6 @@ static char *memdup_to_str(char *maybe_str, int max_len, gfp_t gfp)
 	return kasprintf(gfp, "%.*s", max_len, maybe_str);
 }
 
-static ssize_t device_show_string(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct dev_ext_attribute *d;
-
-	d = container_of(attr, struct dev_ext_attribute, attr);
-
-	return sprintf(buf, "%s\n", (char *)d->var);
-}
-
 static ssize_t cpumask_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 78dfa74ee18b..190d4a39c6a8 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2523,6 +2523,15 @@ ssize_t device_show_bool(struct device *dev, struct device_attribute *attr,
 }
 EXPORT_SYMBOL_GPL(device_show_bool);
 
+ssize_t device_show_string(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct dev_ext_attribute *ea = to_ext_attr(attr);
+
+	return sysfs_emit(buf, "%s\n", (char *)ea->var);
+}
+EXPORT_SYMBOL_GPL(device_show_string);
+
 /**
  * device_release - free device structure.
  * @kobj: device's kobject.
diff --git a/include/linux/device.h b/include/linux/device.h
index c515ba5756e4..63ac65db3ecb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -132,6 +132,8 @@ ssize_t device_show_bool(struct device *dev, struct device_attribute *attr,
 			char *buf);
 ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
 			 const char *buf, size_t count);
+ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
+			   char *buf);
 
 /**
  * DEVICE_ATTR - Define a device attribute.
@@ -251,6 +253,19 @@ ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
 	struct dev_ext_attribute dev_attr_##_name = \
 		{ __ATTR(_name, _mode, device_show_bool, device_store_bool), &(_var) }
 
+/**
+ * DEVICE_STRING_ATTR_RO - Define a device attribute backed by a r/o string.
+ * @_name: Attribute name.
+ * @_mode: File mode.
+ * @_var: Identifier of string.
+ *
+ * Like DEVICE_ULONG_ATTR(), but @_var is a string. Because the length of the
+ * string allocation is unknown, the attribute must be read-only.
+ */
+#define DEVICE_STRING_ATTR_RO(_name, _mode, _var) \
+	struct dev_ext_attribute dev_attr_##_name = \
+		{ __ATTR(_name, (_mode) & ~0222, device_show_string, NULL), (_var) }
+
 #define DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) \
 	struct device_attribute dev_attr_##_name =		\
 		__ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
-- 
2.43.0

