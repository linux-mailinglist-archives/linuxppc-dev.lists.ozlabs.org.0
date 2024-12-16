Return-Path: <linuxppc-dev+bounces-4171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B69F2F67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:33:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd9L0cD2z30PF;
	Mon, 16 Dec 2024 22:33:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348790;
	cv=none; b=i3w6u4GUHeT5Jj4YbfDsmLoOc6VOj/JO/LktbquWwlYWlHvwP0TjpjZ4zLhoqaFF9eny1uWuF6EAqyEqvhEhh5xfH3ApDmC8yhwBLswi/kKR6hWppa0VOAjGnW8F59aVtQzuaHcEI4sYzY4Xo73fzDeNHa04Y6hDODmRUmj8iPW3eaAIauNMLKCgsaVzGQHTgBFlJqyqVqu5oN1ZTiQpORSltiXhDk6tXOA7Zzwu21VRIKQBBxEHyNBikftNfsJhszFmyGlKuCmzzRk22fhzB2/B5uh9GmhGTDV4ZWfnD8mGNpvxKsUX10ELF6CXtlDPDGYa0ra/TNxr2YUMIPQxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348790; c=relaxed/relaxed;
	bh=W2aoAsoXZdNr8hS5e3F5W8WCSjJ43ew5jkRMAMhC6SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxa0FbCUFLV8TaIrZ0AKz+Fu5Co6ITmED9EIkq4qvpxeYTgZKdEJb/wEwCem8nTNBHDDpF7yguH+GihhtWeMT2T7AzTAitN4TdjYeopbte6GW6UEHEbolHTYR7xmc63aFj1t+4MwoywPPb2LVamv+QIC2gLwunx5kmP4W6jfeiQmwQEQ4nQFDWHfqElrnNnbqpqUus5c8FeDcZiy9H5SbFPbFEEvh1AoU81Er0z+Hu/HKHoibwpMVq/9jrLd3eAT0jk9Canb9kpR1G+4Rf2QLkigH3O6MuLIBQSOhbl18iFAP9do4urn6vM6WmQxB/WD3LUKcGAmqYiLOtsxZzOO3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=NfxFD6II; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=NfxFD6II;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd9K2KQjz30CD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:33:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348782;
	bh=K4ArLdURdX68J2n0OD7NKA61+TDFNtIXruvjgSApS6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NfxFD6IIfv0b72FnNHcUemUJKW7ucb4PD4uqSFqSynxbBJ1SFm8Ol1Sv7jwELRPFE
	 749g1byC+LOX+bRy4uE6sridAEUEEZzgWFKpTEm6Voj+AnXNWP8H4ppwKng/R0X08P
	 v5cPrKAYHLUWz/wmrCIA3gqttNBQATRla42PJpY0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:33:04 +0100
Subject: [PATCH 9/9] misc: ds1682: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-misc-drivers-v1-9-d50ff7b21367@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348781; l=1662;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=K4ArLdURdX68J2n0OD7NKA61+TDFNtIXruvjgSApS6k=;
 b=vnav+SRhHMJUpON2XxNPS9SvCbHCVXWtEVYujeOfGn+lPW1BTFAAtx1VDP0H2bZFBSIJAl63w
 ei68QXNXhzlD7MjpC5Xdlp+pHXf2dPAekPEInby2gxMr4OzqQ7toj+/
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
 drivers/misc/ds1682.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
index 4175df7ef0111f69ed8d4229b7ab50a3c3d7ad12..5d5a70a62e98b6691aac1c0f9142d39555ba4f8c 100644
--- a/drivers/misc/ds1682.c
+++ b/drivers/misc/ds1682.c
@@ -154,7 +154,7 @@ static const struct attribute_group ds1682_group = {
  * User data attribute
  */
 static ssize_t ds1682_eeprom_read(struct file *filp, struct kobject *kobj,
-				  struct bin_attribute *attr,
+				  const struct bin_attribute *attr,
 				  char *buf, loff_t off, size_t count)
 {
 	struct i2c_client *client = kobj_to_i2c_client(kobj);
@@ -172,7 +172,7 @@ static ssize_t ds1682_eeprom_read(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t ds1682_eeprom_write(struct file *filp, struct kobject *kobj,
-				   struct bin_attribute *attr,
+				   const struct bin_attribute *attr,
 				   char *buf, loff_t off, size_t count)
 {
 	struct i2c_client *client = kobj_to_i2c_client(kobj);
@@ -194,8 +194,8 @@ static const struct bin_attribute ds1682_eeprom_attr = {
 		.mode = S_IRUGO | S_IWUSR,
 	},
 	.size = DS1682_EEPROM_SIZE,
-	.read = ds1682_eeprom_read,
-	.write = ds1682_eeprom_write,
+	.read_new = ds1682_eeprom_read,
+	.write_new = ds1682_eeprom_write,
 };
 
 static int ds1682_nvmem_read(void *priv, unsigned int offset, void *val,

-- 
2.47.1


