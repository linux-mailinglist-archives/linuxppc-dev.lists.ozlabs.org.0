Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4556CCB5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:17:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmLZp4TWgz3fgb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 07:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.44; helo=mail-oa1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmLYF4zhlz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 07:16:17 +1100 (AEDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-17997ccf711so14046173fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 13:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680034573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WffwCkUrO2QFOwkwd1OwIoPn40+WgwuocFCo25EFRP4=;
        b=44UXxlkeS3T+y3s1FhcBighZII+6+q2lKzJ0oR4koUgCBU/LmnWg2rlOnhGzqMRqbB
         nq9QgdHcbM5GcyI3TVW3k+sh4zDEX9X4oeYlPZxR7uOpIFANLJLtEPFeIt71xzUwoSsB
         UyIgc5nMM0qvLs06EmkTIjtS/aesVWRXA2S//UsTz4rBwiZDoYOlUQGUSxwE//3+CrRu
         mnAXtOk0Gzod1SHqELoM1BsJoyximqckl9cnSRb8REJOlFBqTQmTTmiM3mpHSitaUd2P
         QK/xzT1vvluf9zNUSqAHSV1QVdR1T7g7U9qFFwkSLb3iEb16Z7OSAdOCAWs9DhmkXQ9U
         3omw==
X-Gm-Message-State: AAQBX9fumTgP7Q2CGM0s1H5M8y1LFt76EjouwGPTIRV9nAHxkI76LnCe
	F54QomFVz+TsI4+s7VbHig==
X-Google-Smtp-Source: AK7set9O95zUO5XPRjY3del1fKAHhbZzd1ayFyAZFIuT0LhS8F1687vY4wmshaSQMXVNhTAnL+nVzg==
X-Received: by 2002:a05:6870:e40d:b0:169:dcba:1ec9 with SMTP id n13-20020a056870e40d00b00169dcba1ec9mr11894631oag.41.1680034573156;
        Tue, 28 Mar 2023 13:16:13 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m9-20020a9d6ac9000000b0069f153bb37asm8467384otq.62.2023.03.28.13.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 13:16:12 -0700 (PDT)
Received: (nullmailer pid 3993719 invoked by uid 1000);
	Tue, 28 Mar 2023 20:16:10 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Mar 2023 15:15:57 -0500
Subject: [PATCH 2/5] of/address: Add of_range_to_resource() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230328-dt-address-helpers-v1-2-e2456c3e77ab@kernel.org>
References: <20230328-dt-address-helpers-v1-0-e2456c3e77ab@kernel.org>
In-Reply-To: <20230328-dt-address-helpers-v1-0-e2456c3e77ab@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A few users need to convert a specific "ranges" entry into a struct
resource. Add a helper to similar to of_address_to_resource(). The
existing of_pci_range_to_resource() helper isn't really PCI specific,
so it can be used with the CONFIG_PCI check dropped.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c       | 31 ++++++++++++++++++++++++++++---
 drivers/of/unittest.c      | 16 +++++++++++++++-
 include/linux/of_address.h |  8 ++++++++
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4c0b169ef9bf..b79f005834fc 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -229,9 +229,6 @@ int of_pci_range_to_resource(struct of_pci_range *range,
 	res->parent = res->child = res->sibling = NULL;
 	res->name = np->full_name;
 
-	if (!IS_ENABLED(CONFIG_PCI))
-		return -ENOSYS;
-
 	if (res->flags & IORESOURCE_IO) {
 		unsigned long port;
 		err = pci_register_io_range(&np->fwnode, range->cpu_addr,
@@ -263,6 +260,34 @@ int of_pci_range_to_resource(struct of_pci_range *range,
 }
 EXPORT_SYMBOL(of_pci_range_to_resource);
 
+/*
+ * of_range_to_resource - Create a resource from a ranges entry
+ * @np:		device node where the range belongs to
+ * @index:	the 'ranges' index to convert to a resource
+ * @res:	pointer to a valid resource that will be updated to
+ *              reflect the values contained in the range.
+ *
+ * Returns ENOENT if the entry is not found or EINVAL if the range cannot be
+ * converted to resource.
+ */
+int of_range_to_resource(struct device_node *np, int index, struct resource *res)
+{
+	int ret, i = 0;
+	struct of_range_parser parser;
+	struct of_range range;
+
+	ret = of_range_parser_init(&parser, np);
+	if (ret)
+		return ret;
+
+	for_each_of_range(&parser, &range)
+		if (i++ == index)
+			return of_pci_range_to_resource(&range, np, res);
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL(of_range_to_resource);
+
 /*
  * ISA bus specific translator
  */
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 1a45df1f354a..945288d5672f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1013,7 +1013,8 @@ static void __init of_unittest_bus_ranges(void)
 	struct device_node *np;
 	struct of_range range;
 	struct of_range_parser parser;
-	int i = 0;
+	struct resource res;
+	int ret, i = 0;
 
 	np = of_find_node_by_path("/testcase-data/address-tests");
 	if (!np) {
@@ -1026,6 +1027,19 @@ static void __init of_unittest_bus_ranges(void)
 		return;
 	}
 
+	ret = of_range_to_resource(np, 1, &res);
+	unittest(!ret, "of_range_to_resource returned error (%d) node %pOF\n",
+		ret, np);
+	unittest(resource_type(&res) == IORESOURCE_MEM,
+		"of_range_to_resource wrong resource type on node %pOF res=%pR\n",
+		np, &res);
+	unittest(res.start == 0xd0000000,
+		"of_range_to_resource wrong resource start address on node %pOF res=%pR\n",
+		np, &res);
+	unittest(resource_size(&res) == 0x20000000,
+		"of_range_to_resource wrong resource start address on node %pOF res=%pR\n",
+		np, &res);
+
 	/*
 	 * Get the "ranges" from the device tree
 	 */
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 376671594746..1d005439f026 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -68,6 +68,8 @@ extern int of_pci_address_to_resource(struct device_node *dev, int bar,
 extern int of_pci_range_to_resource(struct of_pci_range *range,
 				    struct device_node *np,
 				    struct resource *res);
+extern int of_range_to_resource(struct device_node *np, int index,
+				struct resource *res);
 extern bool of_dma_is_coherent(struct device_node *np);
 #else /* CONFIG_OF_ADDRESS */
 static inline void __iomem *of_io_request_and_map(struct device_node *device,
@@ -120,6 +122,12 @@ static inline int of_pci_range_to_resource(struct of_pci_range *range,
 	return -ENOSYS;
 }
 
+static inline int of_range_to_resource(struct device_node *np, int index,
+				       struct resource *res)
+{
+	return -ENOSYS;
+}
+
 static inline bool of_dma_is_coherent(struct device_node *np)
 {
 	return false;

-- 
2.39.2

