Return-Path: <linuxppc-dev+bounces-4172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047D9F2F6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd9L3m6Qz30QJ;
	Mon, 16 Dec 2024 22:33:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348790;
	cv=none; b=ADp5lZerytZwyR3kYeaTmls92kjminiENz2J6cVaTavq3210PKIqmZbwCrEd4d2x6LLrEFgETH2gQaj9X7M6J2GM0Gro0zPidmRystJwzpjjN4Xrj2UxO9Bqca5ixxyNxaDa0YYOgaZhS7qtk4qI/yOIxQm1ev4Z+qupwhwwxWslvPTWYucAokToZUW3qv+YifkmgJh2j3qRUWtsO5lJ2u9RDRLVN9FOvfsUSsMh9i1JxmWl3PJNoFU7gdOXrI/mgq3lG4iep+AQ/vOjHnVr6dURv2vlGVASscZhO+9ZSWyluTj4RwSxa6CoPLIoWrETU/IMg0cEtQqsJGUMLIkT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348790; c=relaxed/relaxed;
	bh=je7TtPYmXAL3B96XkKamzZ0x2OEFrZQ7tICpShfLom0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgAysarMJMC9iZ+dA7CL8jjqQgGUPvUyoP8bO7Ys91g68mASlTpoAm9SMBi3521+KKE7WFWcSXnXlSowJ6cK+azDjWFnWk0dYxCM3KqZEMyGbE58xjd0QISwzoXvixXeC/Mb4IkNSmGzWHxXWm8CqDbGzMPMk0E8PiFp3vSbeMM1maBh6SbiqeskTEJ9AuZD3MJ7ArJJJsgH0kDfUiARSbhzbq2iHVIYl8rLkWyfL2ckqNPY8OXv7Loq1jqIFcIBSWJFjfFawrQlnfv3Jnh2GxOltjxekYRCM6OIBpGvACab/TnwAp21RWXJLDlCeE6b0S/kKHTta5hK3tfIS6g4aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=SfkGxAQc; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=SfkGxAQc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd9K4vXwz2yvj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:33:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348782;
	bh=8m1RQ3DhfA9f6hdRy+DqOXn1T98rVvXAkNUHHyC1n88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SfkGxAQc9gPviIOEmy4LRe1MEdM+uibGvmTgCiGkHbfX969bE+uuzDsv7wi2aVMMr
	 DRsuS81JPJO9/FhetrzfPoLM4SyqfjJCWgcRhNLYM4/fMv66PMmqt5rZdoW3UYqwPa
	 AZty3dWGEvw2A1Szvx96eaaIHcdip8YJCBTUxud4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:33:00 +0100
Subject: [PATCH 5/9] misc: c2port: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-misc-drivers-v1-5-d50ff7b21367@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348781; l=2244;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8m1RQ3DhfA9f6hdRy+DqOXn1T98rVvXAkNUHHyC1n88=;
 b=BcUHlLFzhkKMOTNksv+oFkNkaEG/oNFfc71yOk0a4fCYqm91WEtMRhVsrdt1ABPa80jDGdlEw
 4U8JXjI4XnYCQDnpOJtBeyWF1JDi8sdGib54AvjHTZ0dDI4bMwgX+rx
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
 drivers/misc/c2port/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/c2port/core.c b/drivers/misc/c2port/core.c
index 5d6767b484c998b44a3c90c177d12028db1ea1af..eb780e635352f3a815e8d400d71c04b47507cd4b 100644
--- a/drivers/misc/c2port/core.c
+++ b/drivers/misc/c2port/core.c
@@ -714,7 +714,7 @@ static ssize_t __c2port_read_flash_data(struct c2port_device *dev,
 }
 
 static ssize_t c2port_read_flash_data(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *attr,
+				const struct bin_attribute *attr,
 				char *buffer, loff_t offset, size_t count)
 {
 	struct c2port_device *c2dev = dev_get_drvdata(kobj_to_dev(kobj));
@@ -829,7 +829,7 @@ static ssize_t __c2port_write_flash_data(struct c2port_device *dev,
 }
 
 static ssize_t c2port_write_flash_data(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *attr,
+				const struct bin_attribute *attr,
 				char *buffer, loff_t offset, size_t count)
 {
 	struct c2port_device *c2dev = dev_get_drvdata(kobj_to_dev(kobj));
@@ -849,8 +849,8 @@ static ssize_t c2port_write_flash_data(struct file *filp, struct kobject *kobj,
 	return ret;
 }
 /* size is computed at run-time */
-static BIN_ATTR(flash_data, 0644, c2port_read_flash_data,
-		c2port_write_flash_data, 0);
+static const BIN_ATTR(flash_data, 0644, c2port_read_flash_data,
+		      c2port_write_flash_data, 0);
 
 /*
  * Class attributes
@@ -869,7 +869,7 @@ static struct attribute *c2port_attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *c2port_bin_attrs[] = {
+static const struct bin_attribute *const c2port_bin_attrs[] = {
 	&bin_attr_flash_data,
 	NULL,
 };
@@ -888,7 +888,7 @@ static size_t c2port_bin_attr_size(struct kobject *kobj,
 
 static const struct attribute_group c2port_group = {
 	.attrs = c2port_attrs,
-	.bin_attrs = c2port_bin_attrs,
+	.bin_attrs_new = c2port_bin_attrs,
 	.bin_size = c2port_bin_attr_size,
 };
 

-- 
2.47.1


