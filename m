Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5438C55162A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 12:45:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRR9r1frRz3dvW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 20:45:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=caO5tUcN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=caO5tUcN;
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRR7l1dvLz3bpw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 20:43:14 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0FCE41C0009;
	Mon, 20 Jun 2022 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655721792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y46DjK7tHUV9HplhmvL+5ZwEnd6tbYT1BTLpxUBWe/E=;
	b=caO5tUcNyzZNxPjabh5bB9zSqN0oeHi4b7FeTmoLB4i0CIkdMvBWS2ch7vC2oLZIMCg7T9
	JsCwS2d+M7xY+XcXVSmdGaXquwKzwj4ZscuzB4womNi08zO6ZbziOphcJRow03/Lne46Op
	dZsvgKGrOlF/Wup2WH6u6pQV/3PMcbM8yvHVx7OZQPC+L6SR8+dlFV3ecR2OBsFLOrVToS
	LjhkOHHChNl9wp8LtB5O/uBwTx3upDRjYCAnelnGlMdHXNTbrwmmdz9iEuTrvrdzxd2P/O
	LfLxD2q2AAcNq+CflnMfSO/VjMqq0q9WNRG1M4obK5NKln1y0tqn8RJV0YJjPg==
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
Subject: [PATCH v3 3/5] of: dynamic: add of_property_alloc() and of_property_free()
Date: Mon, 20 Jun 2022 12:41:21 +0200
Message-Id: <20220620104123.341054-4-clement.leger@bootlin.com>
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

Add function which allows to dynamically allocate and free properties.
Use this function internally for all code that used the same logic.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/of/dynamic.c    | 83 ++++++++++++++++++++++++-----------------
 drivers/of/of_private.h | 19 +++++++++-
 drivers/of/unittest.c   |  8 +---
 include/linux/of.h      | 14 +++++++
 4 files changed, 83 insertions(+), 41 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 5560e501aedf..9e29000571d1 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -313,9 +313,7 @@ static void property_list_free(struct property *prop_list)
 
 	for (prop = prop_list; prop != NULL; prop = next) {
 		next = prop->next;
-		kfree(prop->name);
-		kfree(prop->value);
-		kfree(prop);
+		of_property_free(prop);
 	}
 }
 
@@ -367,47 +365,66 @@ void of_node_release(struct kobject *kobj)
 }
 
 /**
- * __of_prop_dup - Copy a property dynamically.
- * @prop:	Property to copy
+ * of_property_free - Free a property allocated dynamically.
+ * @prop:	Property to be freed
+ */
+void of_property_free(const struct property *prop)
+{
+	if (!of_property_check_flag(prop, OF_DYNAMIC))
+		return;
+
+	if (prop->value != prop + 1)
+		kfree(prop->value);
+
+	kfree(prop->name);
+	kfree(prop);
+}
+EXPORT_SYMBOL(of_property_free);
+
+/**
+ * of_property_alloc - Allocate a property dynamically.
+ * @name:	Name of the new property
+ * @value:	Value that will be copied into the new property value or NULL
+ *		if only @len allocation is needed.
+ * @len:	Length of new property value and if @value is provided, the
+ *		length of the value to be copied
  *
- * Copy a property by dynamically allocating the memory of both the
+ * Create a property by dynamically allocating the memory of both the
  * property structure and the property name & contents. The property's
  * flags have the OF_DYNAMIC bit set so that we can differentiate between
  * dynamically allocated properties and not.
  *
  * Return: The newly allocated property or NULL on out of memory error.
  */
-struct property *__of_prop_dup(const struct property *prop)
+
+struct property *of_property_alloc(const char *name, const void *value,
+				   size_t len)
 {
-	struct property *new;
+	struct property *prop;
 
-	new = kzalloc(sizeof(*new), GFP_KERNEL);
-	if (!new)
+	prop = kzalloc(sizeof(*prop) + len, GFP_KERNEL);
+	if (!prop)
 		return NULL;
 
-	/*
-	 * NOTE: There is no check for zero length value.
-	 * In case of a boolean property, this will allocate a value
-	 * of zero bytes. We do this to work around the use
-	 * of of_get_property() calls on boolean values.
-	 */
-	new->name = kstrdup(prop->name, GFP_KERNEL);
-	new->value = kmemdup(prop->value, prop->length, GFP_KERNEL);
-	new->length = prop->length;
-	if (!new->name || !new->value)
-		goto err_free;
-
-	/* mark the property as dynamic */
-	of_property_set_flag(new, OF_DYNAMIC);
-
-	return new;
-
- err_free:
-	kfree(new->name);
-	kfree(new->value);
-	kfree(new);
+	prop->name = kstrdup(name, GFP_KERNEL);
+	if (!prop->name)
+		goto out_err;
+
+	prop->value = prop + 1;
+	if (value)
+		memcpy(prop->value, value, len);
+
+	prop->length = len;
+	of_property_set_flag(prop, OF_DYNAMIC);
+
+	return prop;
+
+out_err:
+	of_property_free(prop);
+
 	return NULL;
 }
+EXPORT_SYMBOL(of_property_alloc);
 
 /**
  * __of_node_dup() - Duplicate or create an empty device node dynamically.
@@ -446,9 +463,7 @@ struct device_node *__of_node_dup(const struct device_node *np,
 			if (!new_pp)
 				goto err_prop;
 			if (__of_add_property(node, new_pp)) {
-				kfree(new_pp->name);
-				kfree(new_pp->value);
-				kfree(new_pp);
+				of_property_free(new_pp);
 				goto err_prop;
 			}
 		}
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index e319d8c2bf8b..7bed5a4a8033 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -115,7 +115,24 @@ extern void *__unflatten_device_tree(const void *blob,
  * without taking node references, so you either have to
  * own the devtree lock or work on detached trees only.
  */
-struct property *__of_prop_dup(const struct property *prop);
+
+/**
+ * __of_prop_dup - Copy a property dynamically.
+ * @prop:	Property to copy
+ *
+ * Copy a property by dynamically allocating the memory of both the
+ * property structure and the property name & contents. The property's
+ * flags have the OF_DYNAMIC bit set so that we can differentiate between
+ * dynamically allocated properties and not.
+ *
+ * Return: The newly allocated property or NULL on out of memory error.
+ */
+static inline
+struct property *__of_prop_dup(const struct property *prop)
+{
+	return of_property_alloc(prop->name, prop->value, prop->length);
+}
+
 struct device_node *__of_node_dup(const struct device_node *np,
 				  const char *full_name);
 
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 23ccb74ef408..789ed9f46e3c 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -774,15 +774,11 @@ static void __init of_unittest_property_copy(void)
 
 	new = __of_prop_dup(&p1);
 	unittest(new && propcmp(&p1, new), "empty property didn't copy correctly\n");
-	kfree(new->value);
-	kfree(new->name);
-	kfree(new);
+	of_property_free(new);
 
 	new = __of_prop_dup(&p2);
 	unittest(new && propcmp(&p2, new), "non-empty property didn't copy correctly\n");
-	kfree(new->value);
-	kfree(new->name);
-	kfree(new);
+	of_property_free(new);
 #endif
 }
 
diff --git a/include/linux/of.h b/include/linux/of.h
index d74fd82a6963..157248a77c4e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1464,6 +1464,10 @@ enum of_reconfig_change {
 };
 
 #ifdef CONFIG_OF_DYNAMIC
+struct property *of_property_alloc(const char *name, const void *value,
+				   size_t len);
+void of_property_free(const struct property *prop);
+
 extern int of_reconfig_notifier_register(struct notifier_block *);
 extern int of_reconfig_notifier_unregister(struct notifier_block *);
 extern int of_reconfig_notify(unsigned long, struct of_reconfig_data *rd);
@@ -1508,6 +1512,16 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
 	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
 }
 #else /* CONFIG_OF_DYNAMIC */
+
+static inline
+struct property *of_property_alloc(const char *name, const void *value,
+				   size_t len)
+{
+	return NULL;
+}
+
+static inline  void of_property_free(const struct property *prop) {}
+
 static inline int of_reconfig_notifier_register(struct notifier_block *nb)
 {
 	return -EINVAL;
-- 
2.36.1

