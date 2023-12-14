Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E9812D02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 11:34:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O/6bDQV2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrTHM5ML6z3wFM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 21:34:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O/6bDQV2;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrTDk6h72z3vhl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 21:32:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702549926;
	bh=O/o9QbjKiENBQBWvJbXtJwhr2ssAm9bGM38u9QD4iZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O/6bDQV2iPr1GiUNCyIXnzRtSQNhDbG3/OGhfzVpYJSmwu9Gt7Fl5ZhHhScJU0OiB
	 iSaHVPVIpvHig+sjQZkfmpi1tyTBsCWtmXiJUel68hCraxyYL/vF9JYomdHKPMB5BQ
	 culcMruEy52Pxsd+RzfqVS3v44hc6NVfsrPSuK97RJwTt8sz0t6VuDeUyFGwd53xAJ
	 LKRLjjsK8PJUBhgNXMH0eWLqmHNC8D2jNGx5NwQqIsEkWSJhuspMzQKPWvG25DFyAh
	 6wbTzOuJV5jIV7z6BBR98S1BPaOIpfaXyOoWRnHoC6eGAhJm6Oos0+w37BXnH27GOE
	 FpW5QjuSt2r3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SrTDk4sV7z4xPY;
	Thu, 14 Dec 2023 21:32:06 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 3/5] of: Reimplement of_machine_is_compatible() using of_machine_compatible_match()
Date: Thu, 14 Dec 2023 21:31:50 +1100
Message-ID: <20231214103152.12269-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214103152.12269-1-mpe@ellerman.id.au>
References: <20231214103152.12269-1-mpe@ellerman.id.au>
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
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

of_machine_compatible_match() works with a table of strings.
of_machine_is_compatible() is a simplier version with only one string.

Re-implement of_machine_is_compatible() by setting a table of strings
with a single string then using of_machine_compatible_match().

Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/of/base.c  | 21 +--------------------
 include/linux/of.h | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 21 deletions(-)

v2: Unchanged.

diff --git a/drivers/of/base.c b/drivers/of/base.c
index c82c8b77badc..73c3a754bad1 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -414,26 +414,7 @@ bool of_machine_compatible_match(const char *const *compats)
 
 	return rc != 0;
 }
-
-/**
- * of_machine_is_compatible - Test root of device tree for a given compatible value
- * @compat: compatible string to look for in root node's compatible property.
- *
- * Return: true if the root node has the given value in its compatible property.
- */
-bool of_machine_is_compatible(const char *compat)
-{
-	struct device_node *root;
-	int rc = 0;
-
-	root = of_find_node_by_path("/");
-	if (root) {
-		rc = of_device_is_compatible(root, compat);
-		of_node_put(root);
-	}
-	return rc;
-}
-EXPORT_SYMBOL(of_machine_is_compatible);
+EXPORT_SYMBOL(of_machine_compatible_match);
 
 /**
  *  __of_device_is_available - check if a device is available for use
diff --git a/include/linux/of.h b/include/linux/of.h
index c5c663a7fb77..03ed4e37ca57 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -402,9 +402,21 @@ extern void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align));
 extern int of_alias_get_id(struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);
 
-extern bool of_machine_is_compatible(const char *compat);
 bool of_machine_compatible_match(const char *const *compats);
 
+/**
+ * of_machine_is_compatible - Test root of device tree for a given compatible value
+ * @compat: compatible string to look for in root node's compatible property.
+ *
+ * Return: true if the root node has the given value in its compatible property.
+ */
+static inline bool of_machine_is_compatible(const char *compat)
+{
+	const char *compats[] = { compat, NULL };
+
+	return of_machine_compatible_match(compats);
+}
+
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);
-- 
2.43.0

