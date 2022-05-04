Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9CD51AEE8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:19:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktp8S5PSXz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 06:19:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PhUpM53t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240;
 helo=mslow1.mail.gandi.net; envelope-from=clement.leger@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PhUpM53t; dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KthBG6MLBz3bfR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 01:50:46 +1000 (AEST)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 85CF5C9627
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 15:42:13 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DEA440007;
 Wed,  4 May 2022 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651678924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmqzHg+nLgBRemjIW3lNzV3pSBBaY49ErNMMa/e8tLQ=;
 b=PhUpM53tbZtMWJGrm+4iEQAgfeYhHsOTCGMCt2OtvAbNoqiI7Nu43nuiKw2hxUsl8AKYMF
 BacEpfvIH7dtRAXxUL1PPofJlQlho0tVJEEDt5P5KEA8lDw0b8ZsLHIYjN3zmwJYFwuV3S
 5n6GBecdolsiH871iOevPvakUvAXKEoRzJxY4XiOJ/HSqOp+v+fj+6+WD/i6SEshWhaoio
 Zuns8KG/SBKAkhSVVoSt42XtRRyEhs/Qi9OBsuad/MTSd9ibPuooBLEA+cWpl804bgKF2/
 23GMQrhJTPcz8Way9E/BYiMdnd9mkDgZQBMPtf3HvDOZjLy7UXlgrCNEel81nQ==
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
Subject: [PATCH 2/3] of: dynamic: add of_node_alloc() and of_node_free()
Date: Wed,  4 May 2022 17:40:32 +0200
Message-Id: <20220504154033.750511-3-clement.leger@bootlin.com>
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

Add functions which allows to create and free nodes.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/of/dynamic.c | 59 ++++++++++++++++++++++++++++++++++++--------
 include/linux/of.h   |  9 +++++++
 2 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index e8700e509d2e..ec28e5ba2969 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -455,6 +455,54 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
 				 prop->length, allocflags);
 }
 
+/**
+ * of_node_free - Free a node allocated dynamically.
+ * @node:	Node to be freed
+ */
+void of_node_free(const struct device_node *node)
+{
+	kfree(node->full_name);
+	kfree(node->data);
+	kfree(node);
+}
+EXPORT_SYMBOL(of_node_free);
+
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
+
+	node = kzalloc(sizeof(*node), allocflags);
+	if (!node)
+		return NULL;
+
+	if (name) {
+		node->full_name = kstrdup(name, allocflags);
+		if (!node->full_name) {
+			kfree(node);
+			return NULL;
+		}
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
@@ -471,18 +519,9 @@ struct device_node *__of_node_dup(const struct device_node *np,
 {
 	struct device_node *node;
 
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	node = of_node_alloc(NULL, GFP_KERNEL);
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
index 6b345eb71c19..749ac07f4960 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1463,6 +1463,8 @@ enum of_reconfig_change {
 };
 
 #ifdef CONFIG_OF_DYNAMIC
+extern struct device_node *of_node_alloc(const char *name, gfp_t allocflags);
+extern void of_node_free(const struct device_node *node);
 extern struct property *of_property_alloc(const char *name, const void *value,
 					  int value_len, int len,
 					  gfp_t allocflags);
@@ -1512,6 +1514,13 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
 	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
 }
 #else /* CONFIG_OF_DYNAMIC */
+static inline struct device_node *of_node_alloc(const char *name,
+						gfp_t allocflags)
+{
+	return NULL;
+}
+
+static inline void of_node_free(const struct device_node *node) {}
 
 static inline struct property *of_property_alloc(const char *name,
 						 const void *value,
-- 
2.34.1

