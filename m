Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F5AEBDF5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 07:30:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474C4S6T2LzF6bh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 17:30:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="R3fZxfYu"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BzR4bHjzF426
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 17:26:26 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id c13so6348583pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHPt0ardHBNX+4ZLd/OLKWAm1qyLd2m5H1uRxVlgqZM=;
 b=R3fZxfYunAQdPPt3Mnf7yR4KhclnuSxiLoQII3s//rnK74yaRW+/eEYgxtvfTpoNHe
 diIXPfmhIIXted8CMZgj7T6pWssIHIDA/cR5J9qTesl6AgiIRg4+xqixqbuodf+bK8V1
 crGvXh7IGBHhsItPrkc1nd2FxORl2L3ysvLsuRUtgm8gywNA54E/zSyVwRGH4i7hKsX+
 I+PpODHIi4fqAgGE2AkJZgSjbw2xb9OQrPHkDGQe/5bPhTCMyTqeOEV+hmJuVqbJEedm
 Hy2P2eOcfhBctDvfJxQ0bGxsL669TH6jR9gezQ7ivW8agEdWxy7znkqePx91xiqab58W
 1cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHPt0ardHBNX+4ZLd/OLKWAm1qyLd2m5H1uRxVlgqZM=;
 b=igEAvKZQDJyhFowoxRhknY8feecHfDQ+bd/3BdpPdtJz3xyqf366BnZB3fZXhfJhbC
 +4f+F9x5p+Ty5FpJEApx4TZij04cVo+63wdm+CsoRHBBY5MMQq9yErmWDQReNZ4JUq5g
 nTatjTdUADgVvstWdFhgXZdZMS2SL+4n6HnNAGJjGi/gnwOfeNYPgt9dkfMh2BbnA7ci
 3kVVFpQ6neJB2hYZ8vyfDJXUO/TyeOXm0m40+YhkdT6qmu2+B5qXeOynzvEdU8ultXLC
 0eXilLULk7VXS26rW/cy9BPO5EEiR5X6bABl035mEEYb5JXhaSELKsA0U4LkaU3Y9F4Y
 bnLw==
X-Gm-Message-State: APjAAAWkRpTw4VoEz01prR3ofEZ3yzxS6bT/th/5EKgP1eQOHwB9SzxV
 bkf/Tq8DkwcyAVyvHjwADnlugeLHpfI=
X-Google-Smtp-Source: APXvYqyRsm/bpSv8NkswBa5SqIRZuC6G8/LsMtnPM3xT3TXA1KLkJkzeTz4z5d6ZH2Xxz45UtPIfFQ==
X-Received: by 2002:a63:cf46:: with SMTP id b6mr11350792pgj.90.1572589583059; 
 Thu, 31 Oct 2019 23:26:23 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id z14sm2495204pfq.66.2019.10.31.23.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 23:26:22 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/powernv: Rework exports to support subnodes
Date: Fri,  1 Nov 2019 17:26:10 +1100
Message-Id: <20191101062611.32610-1-oohall@gmail.com>
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

