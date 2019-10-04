Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E9CB698
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 10:45:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l3Nm4NY8zDqbW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 18:45:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iwZ5coGj"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l3Lw6VYDzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 18:43:51 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id y22so3485595pfr.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Oct 2019 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHPt0ardHBNX+4ZLd/OLKWAm1qyLd2m5H1uRxVlgqZM=;
 b=iwZ5coGjQ6masjaABnqfaUVM9P3y0QRFaRLFCpX+p4eovHZrhYfviI3ZqU80MsufrB
 7o4wDT8BHPuLMucAXPMQa307HV3+FeISEg1Vg/Y3iyVbAsBI+JavSY4rX9WYs1Knc8gg
 Gmy685yFn8OnJV0JHlWbwUcGdIdWwWa6eRpNZcut3Tbdec6om8d0+dPN0kj1XQWJkFso
 xOulUPNs8dcJ8m11d+UkJyEsrlCmDZPdDMPCcJi2zUnsn4RcY7nmAZogLssYplmzk+SR
 kHsiTssRCRNoyZ+zaK5ukY6CnvU3mMv26w5D02cE1TntA46mvCRHsSF4qtTkk67fKS2d
 apUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHPt0ardHBNX+4ZLd/OLKWAm1qyLd2m5H1uRxVlgqZM=;
 b=jH1hGRjbxsY5a5aZo37+MCIo695/A3Nb0qY2hXtIeW0ZPQTSBH8ei+dfgTDwzm06WB
 w83biWmiLnssm01VIqATE/OziYLpVRbbTYf2+8nxWnxh6DmxspuJ9evqFlf6DXUsVdCs
 2S+HKmNNirK6YbDznPxv+pAhJdlwhHcJ4A5R1gRCH9M1ZrRmY4aovfzXieThV+m/YKPO
 sJQRNRehO6XajBKpAcyNMDSg9/D9FJttCygVmjsPMXTfeI/xxwtyAdDSiZcr1MtstjYh
 R47ArNoZSMFWdgdD/l19cQs3SL1eD6esRu1yiA0Etbg/ZZgqIaVQrsuj10/lcU5KSeIn
 5EAw==
X-Gm-Message-State: APjAAAXXQWFQYa4rf6Cw1Gsmw5eQnGgPsnURF/j1LoybCz3P4Md/s7KN
 duLXs6QJmzzvhyJz4U5XnseIQARc
X-Google-Smtp-Source: APXvYqyyljwRq+sOKs1Bai+8+3yonFSD6pLcx8sIfFlYGbhR73PX24IQbdgVaOWG6Xtbzm/gjqnYsw==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr15927584pjo.42.1570178627933; 
 Fri, 04 Oct 2019 01:43:47 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y138sm5110708pfb.174.2019.10.04.01.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 01:43:47 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/powernv: Rework exports to support subnodes
Date: Fri,  4 Oct 2019 18:43:34 +1000
Message-Id: <20191004084335.16157-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Originally we only had a handful of exported memory ranges, but we'd to
export the per-core trace buffers. This results in a lot of files in the
exports directory which is a but unfortunate. We can clean things up a bit
by turning subnodes into subdirectories of the exports directory.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 114 +++++++++++++++++++++-------------
 1 file changed, 72 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 38e9027..0373da5 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -752,6 +752,75 @@ static ssize_t export_attr_read(struct file *fp, struct kobject *kobj,
 				       bin_attr->size);
 }
 
+static int opal_add_one_export(struct kobject *parent, const char *export_name,
+			       struct device_node *np, const char *prop_name)
+{
+	struct bin_attribute *attr = NULL;
+	const char *name = NULL;
+	u64 vals[2];
+	int rc;
+
+	rc = of_property_read_u64_array(np, prop_name, &vals[0], 2);
+	if (rc)
+		goto out;
+
+	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	name = kstrdup(export_name, GFP_KERNEL);
+	if (!name) {
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	sysfs_bin_attr_init(attr);
+	attr->attr.name = name;
+	attr->attr.mode = 0400;
+	attr->read = export_attr_read;
+	attr->private = __va(vals[0]);
+	attr->size = vals[1];
+
+	rc = sysfs_create_bin_file(parent, attr);
+out:
+	if (rc) {
+		kfree(name);
+		kfree(attr);
+	}
+
+	return rc;
+}
+
+static void opal_add_exported_attrs(struct device_node *np,
+				    struct kobject *kobj)
+{
+	struct device_node *child;
+	struct property *prop;
+
+	for_each_property_of_node(np, prop) {
+		int rc;
+
+		if (!strcmp(prop->name, "name") ||
+		    !strcmp(prop->name, "phandle"))
+			continue;
+
+		rc = opal_add_one_export(kobj, prop->name, np, prop->name);
+		if (rc) {
+			pr_warn("Unable to add export %pOF/%s, rc = %d!\n",
+				np, prop->name, rc);
+		}
+	}
+
+	for_each_child_of_node(np, child) {
+		struct kobject *child_kobj;
+
+		child_kobj = kobject_create_and_add(child->name, kobj);
+		if (!child_kobj) {
+			pr_err("Unable to create export dir for %pOF\n", child);
+			continue;
+		}
+
+		opal_add_exported_attrs(child, child_kobj);
+	}
+}
+
 /*
  * opal_export_attrs: creates a sysfs node for each property listed in
  * the device-tree under /ibm,opal/firmware/exports/
@@ -761,12 +830,8 @@ static ssize_t export_attr_read(struct file *fp, struct kobject *kobj,
  */
 static void opal_export_attrs(void)
 {
-	struct bin_attribute *attr;
 	struct device_node *np;
-	struct property *prop;
 	struct kobject *kobj;
-	u64 vals[2];
-	int rc;
 
 	np = of_find_node_by_path("/ibm,opal/firmware/exports");
 	if (!np)
@@ -779,41 +844,7 @@ static void opal_export_attrs(void)
 		return;
 	}
 
-	for_each_property_of_node(np, prop) {
-		if (!strcmp(prop->name, "name") || !strcmp(prop->name, "phandle"))
-			continue;
-
-		if (of_property_read_u64_array(np, prop->name, &vals[0], 2))
-			continue;
-
-		attr = kzalloc(sizeof(*attr), GFP_KERNEL);
-
-		if (attr == NULL) {
-			pr_warn("Failed kmalloc for bin_attribute!");
-			continue;
-		}
-
-		sysfs_bin_attr_init(attr);
-		attr->attr.name = kstrdup(prop->name, GFP_KERNEL);
-		attr->attr.mode = 0400;
-		attr->read = export_attr_read;
-		attr->private = __va(vals[0]);
-		attr->size = vals[1];
-
-		if (attr->attr.name == NULL) {
-			pr_warn("Failed kstrdup for bin_attribute attr.name");
-			kfree(attr);
-			continue;
-		}
-
-		rc = sysfs_create_bin_file(kobj, attr);
-		if (rc) {
-			pr_warn("Error %d creating OPAL sysfs exports/%s file\n",
-				 rc, prop->name);
-			kfree(attr->attr.name);
-			kfree(attr);
-		}
-	}
+	opal_add_exported_attrs(np, kobj);
 
 	of_node_put(np);
 }
@@ -974,11 +1005,10 @@ static int __init opal_init(void)
 		opal_sys_param_init();
 		/* Setup message log sysfs interface. */
 		opal_msglog_sysfs_init();
+		/* Add all export properties*/
+		opal_export_attrs();
 	}
 
-	/* Export all properties */
-	opal_export_attrs();
-
 	/* Initialize platform devices: IPMI backend, PRD & flash interface */
 	opal_pdev_init("ibm,opal-ipmi");
 	opal_pdev_init("ibm,opal-flash");
-- 
2.9.5

