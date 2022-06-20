Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A29551631
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 12:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRRC244NBz3f3Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 20:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pgm44wZI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pgm44wZI;
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRR7r0zXzz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 20:43:19 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C8521C0006;
	Mon, 20 Jun 2022 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655721797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtZ5GDg2s0Ck6j3n2X7qx+X5XRvzpIog8T30WAkFqFQ=;
	b=pgm44wZIPhXpOx2BgqOCRfX5YWrcW/GqIGjYF8fMZJBwfDRzN83yCMMOh7PLjq4AljGns/
	1eGe+9lQcWA/NcjwIq3GWpabvhcSbxR826Gwz4iLFSC6Yq2MQogQOEW4YIVV5ngVgaM6PW
	o4N/ifPc3us5vlbNjqfmVb6PsfmXqubXbaNhz98Xs4r8btjF8Mmp/1AMjum2LqxaPkZhpp
	ykiiL7JIeXQI/3makQ7MxUy+MW7V0b8KDlikImZtwcS6dI+GCkOcQbXVGdnNCTI7sbXS9T
	IyXc49OkQGte4PVWsODhjnL9Kxn2udn3B6UQmccZi9KUiIs3r7vjtgs2KRmv+g==
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Nathan Lynch <nathanl@linux.ibm.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Ohhoon Kwon <ohoono.kwon@samsung.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v3 5/5] powerpc/pseries: use of_property_alloc/free() and of_node_alloc()
Date: Mon, 20 Jun 2022 12:41:23 +0200
Message-Id: <20220620104123.341054-6-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620104123.341054-1-clement.leger@bootlin.com>
References: <20220620104123.341054-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>, Steen Hegelund <steen.hegelund@microchip.com>, linux-kernel@vger.kernel.org, Lizhi Hou <lizhi.hou@xilinx.com>, Allan Nielsen <allan.nielsen@microchip.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org, Horatiu Vultur <horatiu.vultur@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use of_property_alloc/free() and of_node_alloc() to create and free
device-tree nodes and properties. In order to obtain something cleaner
and allow using only of_node_put() instead of manual property deletion,
a rework of the usage of node in reconfig.c has been done.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 arch/powerpc/platforms/pseries/dlpar.c        |  62 +--------
 .../platforms/pseries/hotplug-memory.c        |  21 +--
 arch/powerpc/platforms/pseries/reconfig.c     | 123 ++++++------------
 3 files changed, 50 insertions(+), 156 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 498d6efcb5ae..c17e7b6f1dd2 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -38,75 +38,25 @@ struct cc_workarea {
 	__be32	prop_offset;
 };
 
-void dlpar_free_cc_property(struct property *prop)
-{
-	kfree(prop->name);
-	kfree(prop->value);
-	kfree(prop);
-}
-
 static struct property *dlpar_parse_cc_property(struct cc_workarea *ccwa)
 {
-	struct property *prop;
-	char *name;
-	char *value;
-
-	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
-	if (!prop)
-		return NULL;
+	int length;
+	char *name, *value;
 
 	name = (char *)ccwa + be32_to_cpu(ccwa->name_offset);
-	prop->name = kstrdup(name, GFP_KERNEL);
-	if (!prop->name) {
-		dlpar_free_cc_property(prop);
-		return NULL;
-	}
-
-	prop->length = be32_to_cpu(ccwa->prop_length);
+	length = be32_to_cpu(ccwa->prop_length);
 	value = (char *)ccwa + be32_to_cpu(ccwa->prop_offset);
-	prop->value = kmemdup(value, prop->length, GFP_KERNEL);
-	if (!prop->value) {
-		dlpar_free_cc_property(prop);
-		return NULL;
-	}
 
-	return prop;
+	return of_property_alloc(name, value, length);
 }
 
 static struct device_node *dlpar_parse_cc_node(struct cc_workarea *ccwa)
 {
-	struct device_node *dn;
 	const char *name;
 
-	dn = kzalloc(sizeof(*dn), GFP_KERNEL);
-	if (!dn)
-		return NULL;
-
 	name = (const char *)ccwa + be32_to_cpu(ccwa->name_offset);
-	dn->full_name = kstrdup(name, GFP_KERNEL);
-	if (!dn->full_name) {
-		kfree(dn);
-		return NULL;
-	}
 
-	of_node_set_flag(dn, OF_DYNAMIC);
-	of_node_init(dn);
-
-	return dn;
-}
-
-static void dlpar_free_one_cc_node(struct device_node *dn)
-{
-	struct property *prop;
-
-	while (dn->properties) {
-		prop = dn->properties;
-		dn->properties = prop->next;
-		dlpar_free_cc_property(prop);
-	}
-
-	kfree(dn->full_name);
-	kfree(dn);
+	return of_node_alloc(name);
 }
 
 void dlpar_free_cc_nodes(struct device_node *dn)
@@ -117,7 +67,7 @@ void dlpar_free_cc_nodes(struct device_node *dn)
 	if (dn->sibling)
 		dlpar_free_cc_nodes(dn->sibling);
 
-	dlpar_free_one_cc_node(dn);
+	of_node_put(dn);
 }
 
 #define COMPLETE	0
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 2e3a317722a8..e583814414a1 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -69,33 +69,16 @@ unsigned long pseries_memory_block_size(void)
 	return memblock_size;
 }
 
-static void dlpar_free_property(struct property *prop)
-{
-	kfree(prop->name);
-	kfree(prop->value);
-	kfree(prop);
-}
-
 static struct property *dlpar_clone_property(struct property *prop,
 					     u32 prop_size)
 {
-	struct property *new_prop;
-
-	new_prop = kzalloc(sizeof(*new_prop), GFP_KERNEL);
+	struct property *new_prop = of_property_alloc(prop->name, NULL,
+						      prop_size);
 	if (!new_prop)
 		return NULL;
 
-	new_prop->name = kstrdup(prop->name, GFP_KERNEL);
-	new_prop->value = kzalloc(prop_size, GFP_KERNEL);
-	if (!new_prop->name || !new_prop->value) {
-		dlpar_free_property(new_prop);
-		return NULL;
-	}
-
 	memcpy(new_prop->value, prop->value, prop->length);
-	new_prop->length = prop_size;
 
-	of_property_set_flag(new_prop, OF_DYNAMIC);
 	return new_prop;
 }
 
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index cad7a0c93117..8704c541de3c 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -19,46 +19,29 @@
 
 #include "of_helpers.h"
 
-static int pSeries_reconfig_add_node(const char *path, struct property *proplist)
+static struct device_node *pSeries_reconfig_add_node(const char *path)
 {
-	struct device_node *np;
-	int err = -ENOMEM;
-
-	np = kzalloc(sizeof(*np), GFP_KERNEL);
-	if (!np)
-		goto out_err;
-
-	np->full_name = kstrdup(kbasename(path), GFP_KERNEL);
-	if (!np->full_name)
-		goto out_err;
-
-	np->properties = proplist;
-	of_node_set_flag(np, OF_DYNAMIC);
-	of_node_init(np);
+	struct device_node *np, *parent;
 
-	np->parent = pseries_of_derive_parent(path);
-	if (IS_ERR(np->parent)) {
-		err = PTR_ERR(np->parent);
-		goto out_err;
+	np = of_find_node_by_path(path)
+	if (np) {
+		of_node_put(np);
+		return ERR_PTR(-EINVAL);
 	}
 
-	err = of_attach_node(np);
-	if (err) {
-		printk(KERN_ERR "Failed to add device node %s\n", path);
-		goto out_err;
-	}
+	parent = pseries_of_derive_parent(path);
+	if (IS_ERR(parent))
+		return parent;
 
-	of_node_put(np->parent);
+	np = of_node_alloc(kbasename(path));
+	if (!np) {
+		of_node_put(parent);
+		return ERR_PTR(-ENOMEM);
+	}
 
-	return 0;
+	np->parent = parent;
 
-out_err:
-	if (np) {
-		of_node_put(np->parent);
-		kfree(np->full_name);
-		kfree(np);
-	}
-	return err;
+	return np;
 }
 
 static int pSeries_reconfig_remove_node(struct device_node *np)
@@ -80,24 +63,6 @@ static int pSeries_reconfig_remove_node(struct device_node *np)
 	return 0;
 }
 
-/*
- * /proc/powerpc/ofdt - yucky binary interface for adding and removing
- * OF device nodes.  Should be deprecated as soon as we get an
- * in-kernel wrapper for the RTAS ibm,configure-connector call.
- */
-
-static void release_prop_list(const struct property *prop)
-{
-	struct property *next;
-	for (; prop; prop = next) {
-		next = prop->next;
-		kfree(prop->name);
-		kfree(prop->value);
-		kfree(prop);
-	}
-
-}
-
 /**
  * parse_next_property - process the next property from raw input buffer
  * @buf: input buffer, must be nul-terminated
@@ -148,7 +113,7 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
 	/* now we're on the value */
 	*value = tmp;
 	tmp += *length;
-	if (tmp > end) {
+	if (tmp >= end) {
 		printk(KERN_ERR "property parse failed in %s at line %d\n",
 		       __func__, __LINE__);
 		return NULL;
@@ -158,6 +123,7 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
 		       __func__, __LINE__);
 		return NULL;
 	}
+	*tmp = '\0';
 	tmp++;
 
 	/* and now we should be on the next name, or the end */
@@ -167,27 +133,15 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
 static struct property *new_property(const char *name, const int length,
 				     const unsigned char *value, struct property *last)
 {
-	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
+	struct property *prop;
 
-	if (!new)
+	prop = of_property_alloc(name, value, length);
+	if (!prop)
 		return NULL;
 
-	if (!(new->name = kstrdup(name, GFP_KERNEL)))
-		goto cleanup;
-	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
-		goto cleanup;
-
-	memcpy(new->value, value, length);
-	*(((char *)new->value) + length) = 0;
-	new->length = length;
-	new->next = last;
-	return new;
-
-cleanup:
-	kfree(new->name);
-	kfree(new->value);
-	kfree(new);
-	return NULL;
+	prop->next = last;
+
+	return prop;
 }
 
 static int do_add_node(char *buf, size_t bufsize)
@@ -203,13 +157,13 @@ static int do_add_node(char *buf, size_t bufsize)
 	buf = strchr(buf, ' ');
 	if (!buf)
 		return -EINVAL;
+
 	*buf = '\0';
 	buf++;
 
-	if ((np = of_find_node_by_path(path))) {
-		of_node_put(np);
-		return -EINVAL;
-	}
+	np = pSeries_reconfig_add_node(path);
+	if (IS_ERR(np))
+		return PTR_ERR(np);
 
 	/* rv = build_prop_list(tmp, bufsize - (tmp - buf), &proplist); */
 	while (buf < end &&
@@ -217,22 +171,29 @@ static int do_add_node(char *buf, size_t bufsize)
 		struct property *last = prop;
 
 		prop = new_property(name, length, value, last);
-		if (!prop) {
-			rv = -ENOMEM;
-			prop = last;
+		if (!prop)
 			goto out;
-		}
+
+		np->properties = prop;
 	}
 	if (!buf) {
 		rv = -EINVAL;
 		goto out;
 	}
 
-	rv = pSeries_reconfig_add_node(path, prop);
+	rv = of_attach_node(np);
+	if (rv) {
+		pr_err("Failed to attach node %pOF\n", np);
+		goto out;
+	}
 
+	of_node_put(np->parent);
+
+	return 0;
 out:
-	if (rv)
-		release_prop_list(prop);
+	of_node_put(np->parent);
+	of_node_put(np);
+
 	return rv;
 }
 
-- 
2.36.1

