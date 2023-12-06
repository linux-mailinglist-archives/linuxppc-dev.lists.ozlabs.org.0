Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E87278074A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 17:14:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SljCk3Jbcz3dTk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 03:14:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SljBm17yXz3c13
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 03:13:51 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4SljBV0mMFz9tLb;
	Wed,  6 Dec 2023 17:13:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrbhf4zDyOO6; Wed,  6 Dec 2023 17:13:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4SljBQ5YQFz9vBt;
	Wed,  6 Dec 2023 17:13:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B905C8B775;
	Wed,  6 Dec 2023 17:13:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DpxSmQcjFRgZ; Wed,  6 Dec 2023 17:13:34 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.46])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6ED458B774;
	Wed,  6 Dec 2023 17:13:34 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v1 2/4] of: Reimplement of_machine_is_compatible() using of_machine_compatible_match()
Date: Wed,  6 Dec 2023 17:13:33 +0100
Message-ID: <ea64ede738fe51d46ab6be6aa1fc74029372f6e9.1701878821.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <e6cf01d41502b15e688b6f5aa5c3b68c62b8ac64.1701878821.git.christophe.leroy@csgroup.eu>
References: <e6cf01d41502b15e688b6f5aa5c3b68c62b8ac64.1701878821.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701879211; l=2697; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=+hKx7x30juC8CwURtwRG9c67uqj5kvY+SiW13CElLD0=; b=Baii772gy6kPXwXIuKd+kjU8UzRljDTdGTej2u8q346zmiSVhiSJEr9oDFUrIFihR+i9oW+AJ NwWm5b4xyXrAfFMy7tZB/69Cq9V6PMGSKjnXLcJETGKPvSXI9iozFx1
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_machine_compatible_match() works with a table of strings.
of_machine_is_compatible() is a simplier version with only one string.

Re-implement of_machine_is_compatible() by setting a table of strings
with a single string then using of_machine_compatible_match().

Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/of/base.c  | 22 +---------------------
 include/linux/of.h | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 9020be2eb4d5..73c3a754bad1 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -414,27 +414,7 @@ bool of_machine_compatible_match(const char *const *compats)
 
 	return rc != 0;
 }
-
-/**
- * of_machine_is_compatible - Test root of device tree for a given compatible value
- * @compat: compatible string to look for in root node's compatible property.
- *
- * Return: A positive integer if the root node has the given value in its
- * compatible property.
- */
-int of_machine_is_compatible(const char *compat)
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
index e3418babc203..a0f70be5007f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -402,9 +402,22 @@ extern void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align));
 extern int of_alias_get_id(struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);
 
-extern int of_machine_is_compatible(const char *compat);
 bool of_machine_compatible_match(const char *const *compats);
 
+/**
+ * of_machine_is_compatible - Test root of device tree for a given compatible value
+ * @compat: compatible string to look for in root node's compatible property.
+ *
+ * Return: A positive integer if the root node has the given value in its
+ * compatible property.
+ */
+static inline int of_machine_is_compatible(const char *compat)
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
2.41.0

