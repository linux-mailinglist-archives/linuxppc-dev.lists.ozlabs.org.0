Return-Path: <linuxppc-dev+bounces-4138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC29F2921
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 05:08:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBRHb0pfxz2ymb;
	Mon, 16 Dec 2024 15:07:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734322075;
	cv=none; b=PxQ28wp07+2eeb7so4qn1qoJkHSzFoe7tThVlldFgHfwwYgsdTofqmu4KTWrgG3FR4t9/H74tsthzilJyReg/EKyjzmTqXLuQ8AWOtEgg4MPnpqPlcJWZ8FH7uIUwkGTsXnNJLb8OXU+B3dGnusGwgVgk+2T+zEPQmdLbeXZA32TGP8YLYET17owmbGnI5nxdJEQZfmO5HzrXrsj4pA/FXW1AqXjj+iJF2kl5QSUixTUwSBINbw1vbCB1d/boWlcqfLykQkOKAi6wj1eIupgzGd1D4DmSE/4qu7RzTMiUvFddUKHjtPmOTg8gzEb+DsDmVZFua2cA+EBKovHDjC1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734322075; c=relaxed/relaxed;
	bh=wmrlS1wA8jYSA/Mb9XETCAcYgo6Pz7DutYScHJeCCyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQ8Jw2eeaBdSfHtd7HsGIUsxKPaPnDO2YQKvGRuPeZizPIvjo2kXgQMSrcEy7Xrwzny47IyFfEllOxG99VfFME0F3mIS6B+k4+rdDLEiO9qwHdf/X/FKGYEa174Snj3ewYjYj2dpoo++EN1B+ULAaGRu/qjMw4TD79B4wQpvHDNTwdrANT2BDOwQUbCosZvUZ2G45LZJ1akArU44lwfVUrMhnb3DOndJjCGusJ/OFos2OdnLm/zBHRJ8Yaj/v1KfeVUFIagRFbAIaIrTHu1bjU+jh5IYPBqrA5hA9lsssIDAvsUmajWIq4MkmVYRhcJtMMKuoF4932chxkrgOR+IyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=lVyEtQL9; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=lVyEtQL9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBRHT4Xs1z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 15:07:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734322066;
	bh=xVlfF3vwhCOzCWvL8Ii8hOh/IkFAQglYuNvWAMyTYs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lVyEtQL94BGDrg733MzGrad3i6Ww9VapAuG8dBIxraCIbivycNs0p2YIoGAdSquk1
	 eWXKJhSyNFvnB4wDmdQW/IJkWkWTmRSNYMLX5ZdjH4qdQD7bdQEwRWa5W7aoxnfuPS
	 QOR1l8oJM0tgfbDdh9yg7WpMaSg6V/ADiAO26qFA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 05:07:46 +0100
Subject: [PATCH 4/5] powerpc/powernv/opal: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-powerpc-v1-4-bbed8906f476@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734322065; l=6045;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=xVlfF3vwhCOzCWvL8Ii8hOh/IkFAQglYuNvWAMyTYs8=;
 b=v+ZhvbX5ifsO6BpGDVoed2HvRqEPe6UBGxRFwd+zOtrS9MgvHfZXvenQJPZAuot4SPRQeyWC3
 hj3BdHTiZipCkeeYL/LkPyyHk8KBrNUvIW3/IWMZTVIubSF5Xlwrzio
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
 arch/powerpc/platforms/powernv/opal-core.c   | 10 +++++-----
 arch/powerpc/platforms/powernv/opal-dump.c   |  4 ++--
 arch/powerpc/platforms/powernv/opal-elog.c   |  4 ++--
 arch/powerpc/platforms/powernv/opal-flash.c  |  4 ++--
 arch/powerpc/platforms/powernv/opal-msglog.c |  6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index c9a9b759cc928b931a0ac18f7ed7469a6ecd52b5..d95a5f67211b73724d61a0404336a32116872527 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -159,7 +159,7 @@ static Elf64_Word *__init auxv_to_elf64_notes(Elf64_Word *buf,
  * Returns number of bytes read on success, -errno on failure.
  */
 static ssize_t read_opalcore(struct file *file, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *to,
+			     const struct bin_attribute *bin_attr, char *to,
 			     loff_t pos, size_t count)
 {
 	struct opalcore *m;
@@ -206,9 +206,9 @@ static ssize_t read_opalcore(struct file *file, struct kobject *kobj,
 	return (tpos - pos);
 }
 
-static struct bin_attribute opal_core_attr = {
+static struct bin_attribute opal_core_attr __ro_after_init = {
 	.attr = {.name = "core", .mode = 0400},
-	.read = read_opalcore
+	.read_new = read_opalcore
 };
 
 /*
@@ -599,7 +599,7 @@ static struct attribute *mpipl_attr[] = {
 	NULL,
 };
 
-static struct bin_attribute *mpipl_bin_attr[] = {
+static const struct bin_attribute *const mpipl_bin_attr[] = {
 	&opal_core_attr,
 	NULL,
 
@@ -607,7 +607,7 @@ static struct bin_attribute *mpipl_bin_attr[] = {
 
 static const struct attribute_group mpipl_group = {
 	.attrs = mpipl_attr,
-	.bin_attrs =  mpipl_bin_attr,
+	.bin_attrs_new =  mpipl_bin_attr,
 };
 
 static int __init opalcore_init(void)
diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 608e4b68c5ea9d1610e2270b1ba08ed12b69860e..27e25693cf3990e4f53687d38355c4f4c0a7d8c5 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -286,7 +286,7 @@ static int64_t dump_read_data(struct dump_obj *dump)
 }
 
 static ssize_t dump_attr_read(struct file *filep, struct kobject *kobj,
-			      struct bin_attribute *bin_attr,
+			      const struct bin_attribute *bin_attr,
 			      char *buffer, loff_t pos, size_t count)
 {
 	ssize_t rc;
@@ -342,7 +342,7 @@ static void create_dump_obj(uint32_t id, size_t size, uint32_t type)
 	dump->dump_attr.attr.name = "dump";
 	dump->dump_attr.attr.mode = 0400;
 	dump->dump_attr.size = size;
-	dump->dump_attr.read = dump_attr_read;
+	dump->dump_attr.read_new = dump_attr_read;
 
 	dump->id = id;
 	dump->size = size;
diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 5db1e733143bfa8c7cb4bda1ab604e825b3f176f..de33f354e9fdd1440f39407aecf1e7085e9b52df 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -156,7 +156,7 @@ static const struct kobj_type elog_ktype = {
 #define OPAL_MAX_ERRLOG_SIZE	16384
 
 static ssize_t raw_attr_read(struct file *filep, struct kobject *kobj,
-			     struct bin_attribute *bin_attr,
+			     const struct bin_attribute *bin_attr,
 			     char *buffer, loff_t pos, size_t count)
 {
 	int opal_rc;
@@ -203,7 +203,7 @@ static void create_elog_obj(uint64_t id, size_t size, uint64_t type)
 	elog->raw_attr.attr.name = "raw";
 	elog->raw_attr.attr.mode = 0400;
 	elog->raw_attr.size = size;
-	elog->raw_attr.read = raw_attr_read;
+	elog->raw_attr.read_new = raw_attr_read;
 
 	elog->id = id;
 	elog->size = size;
diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
index d5ea04e8e4c526b99ca8f1ab613266b385362d82..fd8c8621e97340cdf5570d72ce82f86516cb2786 100644
--- a/arch/powerpc/platforms/powernv/opal-flash.c
+++ b/arch/powerpc/platforms/powernv/opal-flash.c
@@ -432,7 +432,7 @@ static int alloc_image_buf(char *buffer, size_t count)
  * and pre-allocate required memory.
  */
 static ssize_t image_data_write(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *bin_attr,
+				const struct bin_attribute *bin_attr,
 				char *buffer, loff_t pos, size_t count)
 {
 	int rc;
@@ -493,7 +493,7 @@ static ssize_t image_data_write(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute image_data_attr = {
 	.attr = {.name = "image", .mode = 0200},
 	.size = MAX_IMAGE_SIZE,	/* Limit image size */
-	.write = image_data_write,
+	.write_new = image_data_write,
 };
 
 static struct kobj_attribute validate_attribute =
diff --git a/arch/powerpc/platforms/powernv/opal-msglog.c b/arch/powerpc/platforms/powernv/opal-msglog.c
index 22d6efe17b0d01223d1c216a9fb21203a350bddf..f1988d0ab45ce49f09f47c9e8859cc5dfcee3a6d 100644
--- a/arch/powerpc/platforms/powernv/opal-msglog.c
+++ b/arch/powerpc/platforms/powernv/opal-msglog.c
@@ -94,15 +94,15 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 }
 
 static ssize_t opal_msglog_read(struct file *file, struct kobject *kobj,
-				struct bin_attribute *bin_attr, char *to,
+				const struct bin_attribute *bin_attr, char *to,
 				loff_t pos, size_t count)
 {
 	return opal_msglog_copy(to, pos, count);
 }
 
-static struct bin_attribute opal_msglog_attr = {
+static struct bin_attribute opal_msglog_attr __ro_after_init = {
 	.attr = {.name = "msglog", .mode = 0400},
-	.read = opal_msglog_read
+	.read_new = opal_msglog_read
 };
 
 struct memcons *__init memcons_init(struct device_node *node, const char *mc_prop_name)

-- 
2.47.1


