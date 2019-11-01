Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C0DEBDEC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 07:28:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474C1x6SzlzF6Tq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 17:28:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F4P6Kk6t"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BzS0ZP9zF440
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 17:26:27 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id q21so3899447plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNQgjlNrbhy2abB8GmydbZUElcbqCcNHp92SJQGa3WI=;
 b=F4P6Kk6tNFcBQvcX/s1dZZlwdx95q2b6CbHB0v2fgiMw24fsDfaNWW4/NCQfPrEq5Q
 mgpmpdK2lxAgX8PODWABvYZ+DNYZJD003B6N5EJHuoSDB6MtiamGpNZ6ekY9GjArk0rD
 LYWDtzDFRIxfj0Xud/R3ktY0t+LrG3QsqJeLOhotJ/L6I3cxun1y7J0FjnsaxgBndDI3
 /X8unlvS/v4XZIpY8JswsAoVfiDai8PSMgS9/b6U7XUlWQ1x2pQXK8feBGm3bhulAGHU
 J2oRZKpbR+zAyHM0q37geAKBGBmeaVU/IdPKdTFbi2fEtHJ21yNH78lh+x+O/Ny5rt3n
 qhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNQgjlNrbhy2abB8GmydbZUElcbqCcNHp92SJQGa3WI=;
 b=S/EwQM6AvjGuBnYo9AbQUxU+kfRYvV2NmtC/eSHpo8E+AEiQVz72FE96EPoIF01J+R
 xp2NSQCSJkCPXYStMbciaeEMpbwIwwvZpb1kl+0EBpk/Y9eRYl53bxGkzfhc2vOQq8e9
 Efnt56LKz2KyehFy0Zdl2qIw9cCtDZlmFFaPJHHIfITXNPRckZ5xM2RmqAQXrULrwo2J
 yVIoYfvth4p+WV6S+2CcGTuB8kE0IRg8HF5Eq2PpufpuD9rJ/0ecVu40EqDu1Pl89oLG
 bQUMemwaobb4NDbR7lFX3oCEx4TNNM1KHPkojsUO5bx8b+giNfUEl7lA0bE3Nc1uydBv
 V/0w==
X-Gm-Message-State: APjAAAXG5CjUbBMbk+cJN+D6gFSvFTkjcGQ2pTHRLDCNwO4wiBVn/gbB
 W6lHvBIAFDyfouQoJAajNF+s4hSj+po=
X-Google-Smtp-Source: APXvYqxPT4wi8S/Q7+KiC2XeuxwO+lOfK/ta4SFkikoc/PnSjYO7O1zC0WeMm/Ie36cMNcpZmiYNmw==
X-Received: by 2002:a17:902:8a90:: with SMTP id
 p16mr10938211plo.220.1572589584950; 
 Thu, 31 Oct 2019 23:26:24 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id z14sm2495204pfq.66.2019.10.31.23.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 23:26:24 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/powernv: Use common code for the symbol_map
 export
Date: Fri,  1 Nov 2019 17:26:11 +1100
Message-Id: <20191101062611.32610-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191101062611.32610-1-oohall@gmail.com>
References: <20191101062611.32610-1-oohall@gmail.com>
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

Long before we had a generic way for firmware to export memory ranges of
interest we added a special case for the skiboot symbol map. The code is
pretty much identical to the generic export so re-use the code.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: Actually compile.
---
 arch/powerpc/platforms/powernv/opal.c | 48 ++++++++---------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 0373da5..e4ea27d 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -708,42 +708,6 @@ static int opal_sysfs_init(void)
 	return 0;
 }
 
-static ssize_t symbol_map_read(struct file *fp, struct kobject *kobj,
-			       struct bin_attribute *bin_attr,
-			       char *buf, loff_t off, size_t count)
-{
-	return memory_read_from_buffer(buf, count, &off, bin_attr->private,
-				       bin_attr->size);
-}
-
-static struct bin_attribute symbol_map_attr = {
-	.attr = {.name = "symbol_map", .mode = 0400},
-	.read = symbol_map_read
-};
-
-static void opal_export_symmap(void)
-{
-	const __be64 *syms;
-	unsigned int size;
-	struct device_node *fw;
-	int rc;
-
-	fw = of_find_node_by_path("/ibm,opal/firmware");
-	if (!fw)
-		return;
-	syms = of_get_property(fw, "symbol-map", &size);
-	if (!syms || size != 2 * sizeof(__be64))
-		return;
-
-	/* Setup attributes */
-	symbol_map_attr.private = __va(be64_to_cpu(syms[0]));
-	symbol_map_attr.size = be64_to_cpu(syms[1]);
-
-	rc = sysfs_create_bin_file(opal_kobj, &symbol_map_attr);
-	if (rc)
-		pr_warn("Error %d creating OPAL symbols file\n", rc);
-}
-
 static ssize_t export_attr_read(struct file *fp, struct kobject *kobj,
 				struct bin_attribute *bin_attr, char *buf,
 				loff_t off, size_t count)
@@ -832,6 +796,7 @@ static void opal_export_attrs(void)
 {
 	struct device_node *np;
 	struct kobject *kobj;
+	int rc;
 
 	np = of_find_node_by_path("/ibm,opal/firmware/exports");
 	if (!np)
@@ -846,6 +811,15 @@ static void opal_export_attrs(void)
 
 	opal_add_exported_attrs(np, kobj);
 
+	/*
+	 * NB: symbol_map existed before the generic export interface so it
+	 * lives under the top level opal_kobj.
+	 */
+	rc = opal_add_one_export(opal_kobj, "symbol_map",
+				 np->parent, "symbol-map");
+	if (rc)
+		pr_warn("Error %d creating OPAL symbols file\n", rc);
+
 	of_node_put(np);
 }
 
@@ -991,8 +965,6 @@ static int __init opal_init(void)
 	/* Create "opal" kobject under /sys/firmware */
 	rc = opal_sysfs_init();
 	if (rc == 0) {
-		/* Export symbol map to userspace */
-		opal_export_symmap();
 		/* Setup dump region interface */
 		opal_dump_region_init();
 		/* Setup error log interface */
-- 
2.9.5

