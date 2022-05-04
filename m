Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FE51AEE5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktp7v2BD4z3bhK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 06:19:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=c6C+7W6X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240;
 helo=mslow1.mail.gandi.net; envelope-from=clement.leger@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c6C+7W6X; dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KthBG5VkLz3bd7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 01:50:46 +1000 (AEST)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BBD4AC9662
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 15:42:13 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 092EC40003;
 Wed,  4 May 2022 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651678926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=syVh6bmaMn5ntdtGN7GpyAnxiKbIllExQJN9dKGkNJ0=;
 b=c6C+7W6XFAo/WW8FtCv6SSTsY/cs+sDCqpqwwTuow7Lz0ga7x4bSWSHJOLdnPyiHyfHhDI
 vOeXRsUNeXFEJTswTiSC+HliR3Y0CF/L6v0eqC1vT9WlWO61Vq2+4T4xvK4oUaRhrgysqw
 nrO/ooCzJJvXJzZr+/vF3Dpwfa9cUmTeJWqLBL1ydy6/qNM8u6IqQPyEAeDkk7LQvKfF5I
 wX9BNb9qbwfUSDvBpVg+S90rtW5Y2N75WrIsr4fF0wKBGYlfxNJqzbgL0HLZdM9CtB5RSA
 PuclVajdpob5X8Yg/J/Wc+M3clTTtw/WpRde9qzfG9MDLG1Dm4m82/0hNrPI7g==
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
Subject: [PATCH 3/3] powerpc/pseries: use of_property_*() and of_node_*()
 functions
Date: Wed,  4 May 2022 17:40:33 +0200
Message-Id: <20220504154033.750511-4-clement.leger@bootlin.com>
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

Use of_property_alloc/free() and of_node_alloc/free() to create and free
device-tree nodes and properties.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 arch/powerpc/platforms/pseries/dlpar.c        | 51 +++----------------
 .../platforms/pseries/hotplug-memory.c        | 27 +---------
 arch/powerpc/platforms/pseries/reconfig.c     | 44 ++++------------
 3 files changed, 20 insertions(+), 102 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index b1f01ac0c29e..ebecde6c7256 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -39,61 +39,25 @@ struct cc_workarea {
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
+	return of_property_alloc(name, value, length, length, GFP_KERNEL);
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
-
-	of_node_set_flag(dn, OF_DYNAMIC);
-	of_node_init(dn);
 
-	return dn;
+	return of_node_alloc(name, GFP_KERNEL);
 }
 
 static void dlpar_free_one_cc_node(struct device_node *dn)
@@ -103,11 +67,10 @@ static void dlpar_free_one_cc_node(struct device_node *dn)
 	while (dn->properties) {
 		prop = dn->properties;
 		dn->properties = prop->next;
-		dlpar_free_cc_property(prop);
+		of_property_free(prop);
 	}
 
-	kfree(dn->full_name);
-	kfree(dn);
+	of_node_free(dn);
 }
 
 void dlpar_free_cc_nodes(struct device_node *dn)
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 91cf23495ccb..591727b05f36 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -70,34 +70,11 @@ unsigned long pseries_memory_block_size(void)
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
-	if (!new_prop)
-		return NULL;
-
-	new_prop->name = kstrdup(prop->name, GFP_KERNEL);
-	new_prop->value = kzalloc(prop_size, GFP_KERNEL);
-	if (!new_prop->name || !new_prop->value) {
-		dlpar_free_property(new_prop);
-		return NULL;
-	}
-
-	memcpy(new_prop->value, prop->value, prop->length);
-	new_prop->length = prop_size;
-
-	of_property_set_flag(new_prop, OF_DYNAMIC);
-	return new_prop;
+	return of_property_alloc(prop->name, prop->value, prop->length,
+				 prop_size, GFP_KERNEL);
 }
 
 static bool find_aa_index(struct device_node *dr_node,
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index 7f7369fec46b..08c2f9088537 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -25,17 +25,9 @@ static int pSeries_reconfig_add_node(const char *path, struct property *proplist
 	struct device_node *np;
 	int err = -ENOMEM;
 
-	np = kzalloc(sizeof(*np), GFP_KERNEL);
+	np = of_node_alloc(kbasename(path), GFP_KERNEL);
 	if (!np)
-		goto out_err;
-
-	np->full_name = kstrdup(kbasename(path), GFP_KERNEL);
-	if (!np->full_name)
-		goto out_err;
-
-	np->properties = proplist;
-	of_node_set_flag(np, OF_DYNAMIC);
-	of_node_init(np);
+		return -ENOMEM;
 
 	np->parent = pseries_of_derive_parent(path);
 	if (IS_ERR(np->parent)) {
@@ -56,8 +48,7 @@ static int pSeries_reconfig_add_node(const char *path, struct property *proplist
 out_err:
 	if (np) {
 		of_node_put(np->parent);
-		kfree(np->full_name);
-		kfree(np);
+		of_node_free(np);
 	}
 	return err;
 }
@@ -92,9 +83,7 @@ static void release_prop_list(const struct property *prop)
 	struct property *next;
 	for (; prop; prop = next) {
 		next = prop->next;
-		kfree(prop->name);
-		kfree(prop->value);
-		kfree(prop);
+		of_property_free(prop);
 	}
 
 }
@@ -168,27 +157,16 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
 static struct property *new_property(const char *name, const int length,
 				     const unsigned char *value, struct property *last)
 {
-	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
+	struct property *prop;
 
-	if (!new)
+	prop = of_property_alloc(name, value, length, length + 1, GFP_KERNEL);
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
+	*(((char *)prop->value) + length) = 0;
+	prop->next = last;
+
+	return prop;
 }
 
 static int do_add_node(char *buf, size_t bufsize)
-- 
2.34.1

