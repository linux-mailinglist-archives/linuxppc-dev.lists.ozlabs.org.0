Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51ECB69A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 10:47:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l3R53N7NzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 18:47:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="so29s6Mq"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l3Lw6SszzDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 18:43:52 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id x10so3374648pgi.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Oct 2019 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0o11s4aZYrLLEA48Sys9gTcMTLetu6gq0VnNDHxr4A=;
 b=so29s6MqLsLbWs/+27c16D8A7yQ8GKiaMuQtovmceE7xQyCsKZUgE1l6mjCMomVo1e
 zF5aWfNPTouELnSviR1xqh0zH0/ZoqWWinASbC+Wp33pO2DVXMByRZR4gyPVxHy4Pz+7
 TS8KJcacjvqDr+GprZh+oxMkTjz+kMKsEOtwQKWWdAoQ8dbmkifdKLSre9h5isvx9BVx
 XeCIq3Q+uVal9trJKAmqB6WkJZ3XLUlRGu3Ux64AsuXSo/d5ZlbfjHJ4YPyVgTwOr279
 mu1dLffczbf83QFA6JadbkxQw72kYv2bJ/J7OxaJGkejh7SDJYOnMrDjjscnpxwZVbJS
 8UrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0o11s4aZYrLLEA48Sys9gTcMTLetu6gq0VnNDHxr4A=;
 b=JhOLYVgBccDAhbWLPPbZJ6cF6Zr/+ESTkE/bsAKG6LnsyFzBHgnLeFGv5S1fC3l4IC
 oJhcT9A7yv7mCC6yd8hibNri6N/7uiJGwCAQk+t3ReQwbL1jsWK/oepILgo3R/xstAtH
 8+suW9cxMW+W9mKUjeiEUQf+t9VBY0wutPp+UpAeRosBmD9OQ5wvuxKH9si6JmdHzgFm
 6QufQSZpnRHgnn0LYCX+CpRvDUOWcgODVffeMRQoz3cwuZ9NNAx1OaGo8JL3kkNcCeuk
 NIoIztQhONZxec/06+DnWqWK4/zmB1yKbYTGtrmDfWzj65B8DyX0uKZtpu2tgRkyFx0X
 0nKA==
X-Gm-Message-State: APjAAAVI3Hp/eeSzSdZPddNUdEbNPbwjrgbruXfAxLz4HfDlqfvPgP4a
 jy2h74insxIsfjEV20Ez7Nf9AlPZ
X-Google-Smtp-Source: APXvYqxVrOsEUnrGFF01qom7crIsbYOBFanf4n+Q/UvaSl3wm1tG9IR31SjU0N0R6sVpEpfKZyfBVA==
X-Received: by 2002:a17:90a:5886:: with SMTP id
 j6mr15125013pji.137.1570178629686; 
 Fri, 04 Oct 2019 01:43:49 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y138sm5110708pfb.174.2019.10.04.01.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 01:43:49 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/powernv: Use common code for the symbol_map export
Date: Fri,  4 Oct 2019 18:43:35 +1000
Message-Id: <20191004084335.16157-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004084335.16157-1-oohall@gmail.com>
References: <20191004084335.16157-1-oohall@gmail.com>
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
 arch/powerpc/platforms/powernv/opal.c | 47 +++++++----------------------------
 1 file changed, 9 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 0373da5..1ef26e2 100644
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
@@ -846,6 +810,15 @@ static void opal_export_attrs(void)
 
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
 
@@ -991,8 +964,6 @@ static int __init opal_init(void)
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

