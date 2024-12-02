Return-Path: <linuxppc-dev+bounces-3685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 757F29E0B76
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 20:01:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2CmR2Gfhz2ypD;
	Tue,  3 Dec 2024 06:00:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733166055;
	cv=none; b=cqxoxgrOYqK+v1qjR20uFU+j2uLI+SqlcFzigAFdUyTxp3IWpKgfG1Fw0v6OqiO5ohX0ccjqqWJBpbLwMK6mSjIm8Ep7YvPQbmOLnz21ZFi7TzsgekziPhM6VfDcePAOoGpWH4wZdTaArCZCUV3FaW8eo5KlEFQHDcel/PhsmP03Fd30O1XFQ2UExnd7v7BXO9mVY8utUdE9SWxzLf+zGEsAEBe78ePYqHGOuEGRssVNVgSV0jOUtlRGhY+qQDm6EE9/m2kyRMFpW+mD74wl8i9d2XzWSE8ZimwMmVlpKulEqI9ugyXdcmmC6pvQZK92QewamsJeOiN1OqoXucNzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733166055; c=relaxed/relaxed;
	bh=d7Dg5ghuAbBEW1Nv3XDqRSx9A0xLUVIDsiHV3xpe5VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idUPz9ThT+8YPYH5ffLmzWwTiXBUkJMnGZz+p2LdpUnMy86hsTsA5mXcH4ywOV4SZzZ4Jhk/FwSD+OR2mhIq6YKbuj3GSsi0JWwZt41MFe46XVq7BMLjEzZ8oueIyWRtaM2g58O+dC+7FpL45fAcOIY7Of8Vgy5kTKHxenYxZOVitsifVzFWL4pJVCTPqCIreyriksMBc16nF49MrbgUN7Tf8AONXF0BqPrm8QoMVKe28kEO6yiD8JkyKVhO3UQxxIxRl+0Gs+YEDlvzS1JhLoJ4mHWgQMRICZw7mWFJfe2O688fLhcIUmSvuxuflP0wbWdcukAnCYAJCxeYczVXrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=btGY7MOa; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=btGY7MOa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2CmQ0fsLz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 06:00:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166038;
	bh=6f4mNkpvqRUUeyyo/NJcoh7bQ9hdy8tWinO29V+C6p4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=btGY7MOaNEAELCcGQDyjd+njX9nVHFypYDtpB/GQKbJV1iIi5gtyX6lfQLN7FWOuO
	 bRv+xU7gwx500gh/9MMVmfaAtXQQ8JGkfIy68gIH6SKOtmJKqw+r0n4opaFZwZlINv
	 6+f7CdANi7p7PQi79BD4w4Iln7oPIuGuojs0Y12Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:00:40 +0100
Subject: [PATCH 5/5] scsi: arcmsr: Use BIN_ATTR_ADMIN_WO() for
 bin_attribute definitions
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
Message-Id: <20241202-sysfs-const-bin_attr-admin_wo-v1-5-f489116210bf@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev, 
 linux-scsi@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166036; l=5414;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6f4mNkpvqRUUeyyo/NJcoh7bQ9hdy8tWinO29V+C6p4=;
 b=X+0t7vXFXcE/fxGdmCbWy1dFY2LlFh9Er23M7zOt4ShPWbyx8SOdqDkvlV+lJJOf3qu+NW089
 pkVCKYBLt9UDGRGnD6yU5YvE+wYS5X+ZbLLkLjH9v7kC4Ht9hxJJQuG
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Using the macro saves some lines of code and prepares the attributes for
the general constifications of struct bin_attributes.

While at it also constify the callback parameters.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/scsi/arcmsr/arcmsr_attr.c | 73 ++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 47 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_attr.c b/drivers/scsi/arcmsr/arcmsr_attr.c
index baeb5e79569026f1af6612705689219bb4a7052f..af7750b551910b06254e443c25bebf323e29f162 100644
--- a/drivers/scsi/arcmsr/arcmsr_attr.c
+++ b/drivers/scsi/arcmsr/arcmsr_attr.c
@@ -58,11 +58,11 @@
 #include <scsi/scsi_transport.h>
 #include "arcmsr.h"
 
-static ssize_t arcmsr_sysfs_iop_message_read(struct file *filp,
-					     struct kobject *kobj,
-					     struct bin_attribute *bin,
-					     char *buf, loff_t off,
-					     size_t count)
+static ssize_t mu_read_read(struct file *filp,
+			    struct kobject *kobj,
+			    const struct bin_attribute *bin,
+			    char *buf, loff_t off,
+			    size_t count)
 {
 	struct device *dev = container_of(kobj,struct device,kobj);
 	struct Scsi_Host *host = class_to_shost(dev);
@@ -105,11 +105,11 @@ static ssize_t arcmsr_sysfs_iop_message_read(struct file *filp,
 	return allxfer_len;
 }
 
-static ssize_t arcmsr_sysfs_iop_message_write(struct file *filp,
-					      struct kobject *kobj,
-					      struct bin_attribute *bin,
-					      char *buf, loff_t off,
-					      size_t count)
+static ssize_t mu_write_write(struct file *filp,
+			      struct kobject *kobj,
+			      const struct bin_attribute *bin,
+			      char *buf, loff_t off,
+			      size_t count)
 {
 	struct device *dev = container_of(kobj,struct device,kobj);
 	struct Scsi_Host *host = class_to_shost(dev);
@@ -153,11 +153,11 @@ static ssize_t arcmsr_sysfs_iop_message_write(struct file *filp,
 	}
 }
 
-static ssize_t arcmsr_sysfs_iop_message_clear(struct file *filp,
-					      struct kobject *kobj,
-					      struct bin_attribute *bin,
-					      char *buf, loff_t off,
-					      size_t count)
+static ssize_t mu_clear_write(struct file *filp,
+			      struct kobject *kobj,
+			      const struct bin_attribute *bin,
+			      char *buf, loff_t off,
+			      size_t count)
 {
 	struct device *dev = container_of(kobj,struct device,kobj);
 	struct Scsi_Host *host = class_to_shost(dev);
@@ -188,58 +188,37 @@ static ssize_t arcmsr_sysfs_iop_message_clear(struct file *filp,
 	return 1;
 }
 
-static const struct bin_attribute arcmsr_sysfs_message_read_attr = {
-	.attr = {
-		.name = "mu_read",
-		.mode = S_IRUSR ,
-	},
-	.size = ARCMSR_API_DATA_BUFLEN,
-	.read = arcmsr_sysfs_iop_message_read,
-};
+static const BIN_ATTR_ADMIN_RO(mu_read, ARCMSR_API_DATA_BUFLEN);
 
-static const struct bin_attribute arcmsr_sysfs_message_write_attr = {
-	.attr = {
-		.name = "mu_write",
-		.mode = S_IWUSR,
-	},
-	.size = ARCMSR_API_DATA_BUFLEN,
-	.write = arcmsr_sysfs_iop_message_write,
-};
+static const BIN_ATTR_ADMIN_WO(mu_write, ARCMSR_API_DATA_BUFLEN);
 
-static const struct bin_attribute arcmsr_sysfs_message_clear_attr = {
-	.attr = {
-		.name = "mu_clear",
-		.mode = S_IWUSR,
-	},
-	.size = 1,
-	.write = arcmsr_sysfs_iop_message_clear,
-};
+static const BIN_ATTR_ADMIN_WO(mu_clear, 1);
 
 int arcmsr_alloc_sysfs_attr(struct AdapterControlBlock *acb)
 {
 	struct Scsi_Host *host = acb->host;
 	int error;
 
-	error = sysfs_create_bin_file(&host->shost_dev.kobj, &arcmsr_sysfs_message_read_attr);
+	error = sysfs_create_bin_file(&host->shost_dev.kobj, &bin_attr_mu_read);
 	if (error) {
 		printk(KERN_ERR "arcmsr: alloc sysfs mu_read failed\n");
 		goto error_bin_file_message_read;
 	}
-	error = sysfs_create_bin_file(&host->shost_dev.kobj, &arcmsr_sysfs_message_write_attr);
+	error = sysfs_create_bin_file(&host->shost_dev.kobj, &bin_attr_mu_write);
 	if (error) {
 		printk(KERN_ERR "arcmsr: alloc sysfs mu_write failed\n");
 		goto error_bin_file_message_write;
 	}
-	error = sysfs_create_bin_file(&host->shost_dev.kobj, &arcmsr_sysfs_message_clear_attr);
+	error = sysfs_create_bin_file(&host->shost_dev.kobj, &bin_attr_mu_clear);
 	if (error) {
 		printk(KERN_ERR "arcmsr: alloc sysfs mu_clear failed\n");
 		goto error_bin_file_message_clear;
 	}
 	return 0;
 error_bin_file_message_clear:
-	sysfs_remove_bin_file(&host->shost_dev.kobj, &arcmsr_sysfs_message_write_attr);
+	sysfs_remove_bin_file(&host->shost_dev.kobj, &bin_attr_mu_write);
 error_bin_file_message_write:
-	sysfs_remove_bin_file(&host->shost_dev.kobj, &arcmsr_sysfs_message_read_attr);
+	sysfs_remove_bin_file(&host->shost_dev.kobj, &bin_attr_mu_read);
 error_bin_file_message_read:
 	return error;
 }
@@ -248,9 +227,9 @@ void arcmsr_free_sysfs_attr(struct AdapterControlBlock *acb)
 {
 	struct Scsi_Host *host = acb->host;
 
-	sysfs_remove_bin_file(&host->shost_dev.kobj, &arcmsr_sysfs_message_clear_attr);
-	sysfs_remove_bin_file(&host->shost_dev.kobj, &arcmsr_sysfs_message_write_attr);
-	sysfs_remove_bin_file(&host->shost_dev.kobj, &arcmsr_sysfs_message_read_attr);
+	sysfs_remove_bin_file(&host->shost_dev.kobj, &bin_attr_mu_clear);
+	sysfs_remove_bin_file(&host->shost_dev.kobj, &bin_attr_mu_write);
+	sysfs_remove_bin_file(&host->shost_dev.kobj, &bin_attr_mu_read);
 }
 
 

-- 
2.47.1


