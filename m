Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F251AEE9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktp923Qfnz3bxM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 06:20:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JjZy8Xex;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240;
 helo=mslow1.mail.gandi.net; envelope-from=clement.leger@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JjZy8Xex; dkim-atps=neutral
X-Greylist: delayed 516 seconds by postgrey-1.36 at boromir;
 Thu, 05 May 2022 01:50:46 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KthBG5JgTz3bbn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 01:50:46 +1000 (AEST)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 67BE7C96AC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 15:42:14 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8BE24000A;
 Wed,  4 May 2022 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651678923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFR/cZ65JwgdZVMkvZg/YmpG/iKhVh2sQRCQhIxlsQ8=;
 b=JjZy8XexHUA1gZsjew6jPWKrCNwK+Wpk/oxw1b4dKvOZ3XH49/AaSdrJM1HDYBGbQHrxlx
 049C6weABksmUtq83S/O3EIZ8SuIjbg0zSjt/IF7e0KeHQ3EuXQnpHxKZv5b1ICQeMlgcq
 jnNOnfweQxYickQYtr9G+Elffmdr4yKIwT0ef/t7CQMtf5hTgIU8y99qXReksommTUHcFh
 48nvQimX1PbdDHsbYSoBCwCiLbJWGv4h3xdsTSsuPDhP536EHbQ36hSOegS1tjuHa1O5Rf
 aEHcf7rvt6li44WPVNk1jtHARsjpQbugQZYeJuQOSNTdOwB0b85sJIWSPu2UTQ==
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH 1/3] of: dynamic: add of_property_alloc() and
 of_property_free()
Date: Wed,  4 May 2022 17:40:31 +0200
Message-Id: <20220504154033.750511-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220504154033.750511-1-clement.leger@bootlin.com>
References: <20220504154033.750511-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 May 2022 06:17:57 +1000
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Steen Hegelund <steen.hegelund@microchip.com>, linux-kernel@vger.kernel.org,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add function which allows to dynamically allocate and free properties.
Use this function internally for all code that used the same logic
(mainly __of_prop_dup()).

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/of/dynamic.c | 101 ++++++++++++++++++++++++++++++-------------
 include/linux/of.h   |  16 +++++++
 2 files changed, 88 insertions(+), 29 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index cd3821a6444f..e8700e509d2e 100644
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
 
@@ -367,48 +365,95 @@ void of_node_release(struct kobject *kobj)
 }
 
 /**
- * __of_prop_dup - Copy a property dynamically.
- * @prop:	Property to copy
+ * of_property_free - Free a property allocated dynamically.
+ * @prop:	Property to be freed
+ */
+void of_property_free(const struct property *prop)
+{
+	kfree(prop->value);
+	kfree(prop->name);
+	kfree(prop);
+}
+EXPORT_SYMBOL(of_property_free);
+
+/**
+ * of_property_alloc - Allocate a property dynamically.
+ * @name:	Name of the new property
+ * @value:	Value that will be copied into the new property value
+ * @value_len:	length of @value to be copied into the new property value
+ * @len:	Length of new property value, must be greater than @value_len
  * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
  *
- * Copy a property by dynamically allocating the memory of both the
+ * Create a property by dynamically allocating the memory of both the
  * property structure and the property name & contents. The property's
  * flags have the OF_DYNAMIC bit set so that we can differentiate between
  * dynamically allocated properties and not.
  *
  * Return: The newly allocated property or NULL on out of memory error.
  */
-struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
+struct property *of_property_alloc(const char *name, const void *value,
+				   int value_len, int len, gfp_t allocflags)
 {
-	struct property *new;
+	int alloc_len = len;
+	struct property *prop;
+
+	if (len < value_len)
+		return NULL;
 
-	new = kzalloc(sizeof(*new), allocflags);
-	if (!new)
+	prop = kzalloc(sizeof(*prop), allocflags);
+	if (!prop)
 		return NULL;
 
+	prop->name = kstrdup(name, allocflags);
+	if (!prop->name)
+		goto out_err;
+
 	/*
-	 * NOTE: There is no check for zero length value.
-	 * In case of a boolean property, this will allocate a value
-	 * of zero bytes. We do this to work around the use
-	 * of of_get_property() calls on boolean values.
+	 * Even if the property has no value, it must be set to a
+	 * non-null value since of_get_property() is used to check
+	 * some values that might or not have a values (ranges for
+	 * instance). Moreover, when the node is released, prop->value
+	 * is kfreed so the memory must come from kmalloc.
 	 */
-	new->name = kstrdup(prop->name, allocflags);
-	new->value = kmemdup(prop->value, prop->length, allocflags);
-	new->length = prop->length;
-	if (!new->name || !new->value)
-		goto err_free;
+	if (!alloc_len)
+		alloc_len = 1;
 
-	/* mark the property as dynamic */
-	of_property_set_flag(new, OF_DYNAMIC);
+	prop->value = kzalloc(alloc_len, allocflags);
+	if (!prop->value)
+		goto out_err;
 
-	return new;
+	if (value)
+		memcpy(prop->value, value, value_len);
+
+	prop->length = len;
+	of_property_set_flag(prop, OF_DYNAMIC);
+
+	return prop;
+
+out_err:
+	of_property_free(prop);
 
- err_free:
-	kfree(new->name);
-	kfree(new->value);
-	kfree(new);
 	return NULL;
 }
+EXPORT_SYMBOL(of_property_alloc);
+
+/**
+ * __of_prop_dup - Copy a property dynamically.
+ * @prop:	Property to copy
+ * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
+ *
+ * Copy a property by dynamically allocating the memory of both the
+ * property structure and the property name & contents. The property's
+ * flags have the OF_DYNAMIC bit set so that we can differentiate between
+ * dynamically allocated properties and not.
+ *
+ * Return: The newly allocated property or NULL on out of memory error.
+ */
+struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
+{
+	return of_property_alloc(prop->name, prop->value, prop->length,
+				 prop->length, allocflags);
+}
 
 /**
  * __of_node_dup() - Duplicate or create an empty device node dynamically.
@@ -447,9 +492,7 @@ struct device_node *__of_node_dup(const struct device_node *np,
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
diff --git a/include/linux/of.h b/include/linux/of.h
index 04971e85fbc9..6b345eb71c19 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1463,6 +1463,11 @@ enum of_reconfig_change {
 };
 
 #ifdef CONFIG_OF_DYNAMIC
+extern struct property *of_property_alloc(const char *name, const void *value,
+					  int value_len, int len,
+					  gfp_t allocflags);
+extern void of_property_free(const struct property *prop);
+
 extern int of_reconfig_notifier_register(struct notifier_block *);
 extern int of_reconfig_notifier_unregister(struct notifier_block *);
 extern int of_reconfig_notify(unsigned long, struct of_reconfig_data *rd);
@@ -1507,6 +1512,17 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
 	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
 }
 #else /* CONFIG_OF_DYNAMIC */
+
+static inline struct property *of_property_alloc(const char *name,
+						 const void *value,
+						 int value_len, int len,
+						 gfp_t allocflags)
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
2.34.1

