Return-Path: <linuxppc-dev+bounces-4387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E136C9FA127
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGN3f9xz2yyR;
	Sun, 22 Dec 2024 01:48:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792508;
	cv=none; b=hj/Pu//gnZFRUlXEAJ8/2zi0P+CYdsAKi0wycnNrrvdXWW7cDB+fG83duJ3CxTauoDbowKTG7wWTqHZAjQ2iss7pKA0fsMxyZfwx7GO5/uNYaMJPBbQRImNnFn8U0djYHFtPXyC6jw1A80EXSweyv3U3Ts5MuM/g3a6NVnF+G8bgr/sc0PZPqj/4LtYDmZGudS8tCWhFgHSGJFbvsMxmRP0Sd8Udxf7vAU/wbFOSgovHh5XOLzo/1sZ8JbusjXFCQj0uztbfDUVe36h2Xfwh+P6YSrlwy1IxZyi/O4kFD2O/x2Accn8HxZT1VtEDStjixc0z3cCJ5VHP454Vaj6E3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792508; c=relaxed/relaxed;
	bh=W2aoAsoXZdNr8hS5e3F5W8WCSjJ43ew5jkRMAMhC6SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuWY9TSHmkO9fmH7MSXS6LgVxO1bb53KCR4121tgbajAFBIyCDts+RFJmwrWlZum8kFNyjjIbplIda+uVpoG3hoQZGAsC2d54sXNma4TR3jMagbRkdnspO9K5vpMNN81ludFAj9SjShZdHB7FbvpHP5hsnJDgNlbN9hTPdXisUuFDzNSuCFqBuZk/o4BxH0sAuOyKPw9/hnGwx2hvhM89xxvh5SvUgHm5XyIlX+GMIUhb9kBsNvfbJu5Zet8JvvCS0kRIIWv8Iim4pBz9twXcjumwyprXjgvRiVXLzjvYgO2NoxaFUHUbw6vynCh7zk7MqioYIOQtlZenYQd6N5sig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=FHyHaGrB; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=FHyHaGrB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGM5n4gz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=K4ArLdURdX68J2n0OD7NKA61+TDFNtIXruvjgSApS6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FHyHaGrBeFnd6dXa1UhJKEN/Vj2M8u9k7KuCJeQBZ+TI0lgE+nsDb3YJJRQcRhln+
	 l6L7ImQUPv6oLtF9lGu0hab4fAk8lNt24Wank24BA7AIZuOZnjq20PP2zvp7LgZRr+
	 wk7d629uOMIHeU3wI3GWCxe3u9J23I95fIreojVo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:48:15 +0100
Subject: [PATCH v2 9/9] misc: ds1682: Constify 'struct bin_attribute'
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
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-9-ba5e79fe8771@weissschuh.net>
References: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
In-Reply-To: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=1662;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=K4ArLdURdX68J2n0OD7NKA61+TDFNtIXruvjgSApS6k=;
 b=foEod6mMQTcekZkVuJkj3bgmnzgSH+ihxv0TERCRycmamIXRwEQekQx7aQLC9tnLABorA1EFH
 PCmFdNEgnGBArnWNitpNlMuNBREu/XWm0QXLKvsE2KCJdI/rKNR/fHA
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


