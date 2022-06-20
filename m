Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F374551630
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 12:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRRBV1Fpzz3dpj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 20:45:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EXVfircB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EXVfircB;
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRR7n41SRz3bnd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 20:43:17 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8427F1C0010;
	Mon, 20 Jun 2022 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655721794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H9tOu0s0cgWNLPz2A2AsQOeQKQd5LxCVeksf9pwFpyo=;
	b=EXVfircBCjCVVkqsImnuJ4jrDshXCda5okp1yDm5v/V73gyvYN2+W7gOtHwu+Y0didvLIy
	PKAA+jhJhbohotsbZlOUBlJWOQwD6CLPbw9sXcfpDRndFz+brZzYP42vz58Vcuv8zOEAYg
	J5t5l76C56uPYeL7rCV4mQJidVzxNJ/43YzoM4I288s11+rM/UhLYNtH0fdzHOgCaBe+vX
	MH28bfG16te9aBm5Igk6+17FXTReF5mBJVFH68hl4di9pZXMaFTqj2rCjRfMQzChcilZGv
	7Aix+TSv6LCtdQ3m//0ZAqD/FnBmfOQPmLrwhhYAR5Oac95eUUJYoAcZ9FX/1g==
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
Subject: [PATCH v3 4/5] of: dynamic: add of_node_alloc()
Date: Mon, 20 Jun 2022 12:41:22 +0200
Message-Id: <20220620104123.341054-5-clement.leger@bootlin.com>
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

Add of_node_alloc() which allows to create nodes. The node full_name
field is allocated as part of the node allocation and the kfree() for
this field is checked at release time to allow users using their own
allocated name.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/of/dynamic.c | 53 ++++++++++++++++++++++++++++++++++----------
 include/linux/of.h   |  5 +++++
 2 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 9e29000571d1..422dfaa5aaa5 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -359,7 +359,9 @@ void of_node_release(struct kobject *kobj)
 	property_list_free(node->deadprops);
 	fwnode_links_purge(of_fwnode_handle(node));
 
-	kfree(node->full_name);
+	if (node->full_name != (const char *) (node + 1))
+		kfree(node->full_name);
+
 	kfree(node->data);
 	kfree(node);
 }
@@ -426,6 +428,42 @@ struct property *of_property_alloc(const char *name, const void *value,
 }
 EXPORT_SYMBOL(of_property_alloc);
 
+/**
+ * of_node_alloc - Allocate a node dynamically.
+ * @name:	Node name
+ *
+ * Create a node by dynamically allocating the memory of both the
+ * node structure and the node name & contents. The node's
+ * flags have the OF_DYNAMIC & OF_DETACHED bit set so that we can
+ * differentiate between dynamically allocated nodes and not.
+ *
+ * Return: The newly allocated node or NULL on out of memory error.
+ */
+struct device_node *of_node_alloc(const char *name)
+{
+	struct device_node *node;
+	int name_len = 0;
+
+	if (name)
+		name_len = strlen(name) + 1;
+
+	node = kzalloc(sizeof(*node) + name_len, GFP_KERNEL);
+	if (!node)
+		return NULL;
+
+	if (name) {
+		node->full_name = (const char *) (node + 1);
+		strcpy((char *)node->full_name, name);
+	}
+
+	of_node_set_flag(node, OF_DYNAMIC);
+	of_node_set_flag(node, OF_DETACHED);
+	of_node_init(node);
+
+	return node;
+}
+EXPORT_SYMBOL(of_node_alloc);
+
 /**
  * __of_node_dup() - Duplicate or create an empty device node dynamically.
  * @np:		if not NULL, contains properties to be duplicated in new node
@@ -442,24 +480,15 @@ struct device_node *__of_node_dup(const struct device_node *np,
 {
 	struct device_node *node;
 
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	node = of_node_alloc(full_name);
 	if (!node)
 		return NULL;
-	node->full_name = kstrdup(full_name, GFP_KERNEL);
-	if (!node->full_name) {
-		kfree(node);
-		return NULL;
-	}
-
-	of_node_set_flag(node, OF_DYNAMIC);
-	of_node_set_flag(node, OF_DETACHED);
-	of_node_init(node);
 
 	/* Iterate over and duplicate all properties */
 	if (np) {
 		struct property *pp, *new_pp;
 		for_each_property_of_node(np, pp) {
-			new_pp = __of_prop_dup(pp, GFP_KERNEL);
+			new_pp = __of_prop_dup(pp);
 			if (!new_pp)
 				goto err_prop;
 			if (__of_add_property(node, new_pp)) {
diff --git a/include/linux/of.h b/include/linux/of.h
index 157248a77c4e..650b1ac0075b 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1464,6 +1464,7 @@ enum of_reconfig_change {
 };
 
 #ifdef CONFIG_OF_DYNAMIC
+struct device_node *of_node_alloc(const char *name);
 struct property *of_property_alloc(const char *name, const void *value,
 				   size_t len);
 void of_property_free(const struct property *prop);
@@ -1512,6 +1513,10 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
 	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
 }
 #else /* CONFIG_OF_DYNAMIC */
+static inline struct device_node *of_node_alloc(const char *name)
+{
+	return NULL;
+}
 
 static inline
 struct property *of_property_alloc(const char *name, const void *value,
-- 
2.36.1

