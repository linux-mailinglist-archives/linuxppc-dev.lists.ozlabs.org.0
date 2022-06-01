Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D038539F43
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 10:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LChty1P2dz3brx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 18:21:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kZgOKQ72;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kZgOKQ72;
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LChrv1588z306Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 18:19:42 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E3B93240007;
	Wed,  1 Jun 2022 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654071580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRqlGkX4lNXh2KDOMp58fFR6Uy/8W1dnbyDrc2jNMi4=;
	b=kZgOKQ72E+iXFpdDtMXRTr9H0bGcL357K3vLgQ+GDK0M+xL+6PsphEGlP2mdO1UiYIlyvq
	zicqB6nybvvHAlmtM5LD15+iMQ6h+VpaokEu8JtmjPBWbE9JPjNUDv/1gta6qw5eiJiFpr
	3LwloFBeY5wX8BrZ/1jOf0Woar/xig8AFIwpEMJpQ9TgKc0iigE5+TpSdlzvWaTG55b1+q
	trIOxLxW0wRlGH592zTOIpZf69SwVzP9oNbsCsSpGhdJi2DXABQ2BU4HF6Yv5vP/7OlIx7
	D8GuXbmk9eOoyr2bzXNH2RzHZwm/WWQTQssToUNFSGwEueLZWZUOWeKg5WHI1g==
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
Subject: [PATCH v2 3/4] of: dynamic: add of_node_alloc()
Date: Wed,  1 Jun 2022 10:18:00 +0200
Message-Id: <20220601081801.348571-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220601081801.348571-1-clement.leger@bootlin.com>
References: <20220601081801.348571-1-clement.leger@bootlin.com>
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
 drivers/of/dynamic.c | 52 ++++++++++++++++++++++++++++++++++----------
 include/linux/of.h   |  6 +++++
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index c0dcbea31d28..67636aafe810 100644
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
@@ -426,6 +428,43 @@ struct property *of_property_alloc(const char *name, const void *value,
 }
 EXPORT_SYMBOL(of_property_alloc);
 
+/**
+ * of_node_alloc - Allocate a node dynamically.
+ * @name:	Node name
+ * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
+ *
+ * Create a node by dynamically allocating the memory of both the
+ * node structure and the node name & contents. The node's
+ * flags have the OF_DYNAMIC & OF_DETACHED bit set so that we can
+ * differentiate between dynamically allocated nodes and not.
+ *
+ * Return: The newly allocated node or NULL on out of memory error.
+ */
+struct device_node *of_node_alloc(const char *name, gfp_t allocflags)
+{
+	struct device_node *node;
+	int name_len = 0;
+
+	if (name)
+		name_len = strlen(name) + 1;
+
+	node = kzalloc(sizeof(*node) + name_len, allocflags);
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
@@ -442,18 +481,9 @@ struct device_node *__of_node_dup(const struct device_node *np,
 {
 	struct device_node *node;
 
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	node = of_node_alloc(full_name, GFP_KERNEL);
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
diff --git a/include/linux/of.h b/include/linux/of.h
index f1966f3c3847..c18da685ade1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1464,6 +1464,7 @@ enum of_reconfig_change {
 };
 
 #ifdef CONFIG_OF_DYNAMIC
+struct device_node *of_node_alloc(const char *name, gfp_t allocflags);
 struct property *of_property_alloc(const char *name, const void *value,
 				   size_t len, gfp_t allocflags);
 void of_property_free(const struct property *prop);
@@ -1512,6 +1513,11 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
 	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
 }
 #else /* CONFIG_OF_DYNAMIC */
+static inline struct device_node *of_node_alloc(const char *name,
+						gfp_t allocflags)
+{
+	return NULL;
+}
 
 static inline
 struct property *of_property_alloc(const char *name, const void *value,
-- 
2.36.0

