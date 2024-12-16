Return-Path: <linuxppc-dev+bounces-4137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4BE9F291E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 05:08:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBRHX20SGz2xQD;
	Mon, 16 Dec 2024 15:07:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734322072;
	cv=none; b=U4gJAph6EofD6qEgxrsSbPgq0DGOa8rhx+uauL1TQDA7xwfoRhb9z/lfkfVXDaywvtxeKMn+WhP6i9E2Jwq1BHOPHpoNzruuSSD4wLKbr0NKFab923kSDaDD0HOihCNUsD8DfqvNd9FfzpMcJ0TPRjPBAiOyhCaqQjtTcXsoM/uxb8gJzPAP9w/XWoneqSKSTjcjjHkbEFp76++NQwU2XzzoCIuAEx1fah3tCAMA1kBkA18lSHiwnUMf336nIp/2wJJ/qrBbfXAuwmHbVlDnqdU1MS3C2/OXk69A1QcHt1wq59rnOZRsmvO0gHQvmP4gdey8zXXa7sVZSE84ybGE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734322072; c=relaxed/relaxed;
	bh=/2LxJp+mw5bjvQ0tEEXcQlqekjRaPp7hzow4fNlR9SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEoiFAXER6T/PQLyTiCaGTtTl8KNcDqVsKI7+FmjIJ+KJav1b8KWtiLE+Orvu6Gu2TfknMAUT66FEpT5XEM31hRQUo8+eoamg9H2lpJvmy2hs/MRy5KIhtAlLVle36PVxgrdHgzqQE/RU0AcQ5lxMzTitNbdfD/OxnkDWloXl2xJzC6rExjJs+qmiUR6MY+yk08E0LcltiCEVL9aXQEIwKqjSzZKVTj2aZeEL9E/aw3H74GvwAhQnQMxfmnj05jwdV7nXc8JUJRjxIt0yP4KkPj+IaR5XS0EwSfjagYMk7MB/GRd2IezZaDfC08Z+Zfa3VLmLPRQYF3r9Knopo8A/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=lW+vXty2; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=lW+vXty2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBRHV54FGz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 15:07:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734322065;
	bh=UwFlrZoaphbEMf2Wi/FBevBRcRQkiVMw7c3eq5eTCfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lW+vXty2mFB0zNdICvad95Ludo+LgrtTfz8STKo9jEiOQ82+B/j8YTemdDpeqKlu2
	 mlSFWQsiVDxdFOe+/cKTkPOZONRC7CgsMd9Jut75CpAGSlTMtNqJ25Uy+C7W5x1aSR
	 kUmqo1bl72QuGhEw0GYvmCYxgvfWRuciuR1MtZOw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 05:07:44 +0100
Subject: [PATCH 2/5] powerpc/secvar: Constify 'struct bin_attribute'
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-powerpc-v1-2-bbed8906f476@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734322065; l=2183;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UwFlrZoaphbEMf2Wi/FBevBRcRQkiVMw7c3eq5eTCfk=;
 b=CyAuDv4h7ejzrTBndYz5Dci7CbE7wh32OdcwjNOfWT70ARoUjG9JXQCms//SEBUcPGOHeEDGU
 K+EZ0j7voEtCRKMaq8Rw+vFcxnzP5U9SW2/4qkjKKfRCIZM5Lx+9CSX
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/kernel/secvar-sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index b7536fbe8c4f43fa0f523c64685167b8b9dfd5ee..afb690a172b4e281830d0dd18785f70e0a967d13 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -52,7 +52,7 @@ static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
 }
 
 static ssize_t data_read(struct file *filep, struct kobject *kobj,
-			 struct bin_attribute *attr, char *buf, loff_t off,
+			 const struct bin_attribute *attr, char *buf, loff_t off,
 			 size_t count)
 {
 	char *data;
@@ -85,7 +85,7 @@ static ssize_t data_read(struct file *filep, struct kobject *kobj,
 }
 
 static ssize_t update_write(struct file *filep, struct kobject *kobj,
-			    struct bin_attribute *attr, char *buf, loff_t off,
+			    const struct bin_attribute *attr, char *buf, loff_t off,
 			    size_t count)
 {
 	int rc;
@@ -104,11 +104,11 @@ static struct kobj_attribute format_attr = __ATTR_RO(format);
 
 static struct kobj_attribute size_attr = __ATTR_RO(size);
 
-static struct bin_attribute data_attr = __BIN_ATTR_RO(data, 0);
+static struct bin_attribute data_attr __ro_after_init = __BIN_ATTR_RO(data, 0);
 
-static struct bin_attribute update_attr = __BIN_ATTR_WO(update, 0);
+static struct bin_attribute update_attr __ro_after_init = __BIN_ATTR_WO(update, 0);
 
-static struct bin_attribute *secvar_bin_attrs[] = {
+static const struct bin_attribute *const secvar_bin_attrs[] = {
 	&data_attr,
 	&update_attr,
 	NULL,
@@ -121,7 +121,7 @@ static struct attribute *secvar_attrs[] = {
 
 static const struct attribute_group secvar_attr_group = {
 	.attrs = secvar_attrs,
-	.bin_attrs = secvar_bin_attrs,
+	.bin_attrs_new = secvar_bin_attrs,
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 

-- 
2.47.1


