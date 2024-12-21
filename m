Return-Path: <linuxppc-dev+bounces-4386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F09FA125
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:49:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGN0LQbz2yYd;
	Sun, 22 Dec 2024 01:48:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792508;
	cv=none; b=mt+62S1DVooAVgCr7AKOD9AWNXl7NQbyHBQtANWnZTYT7p5W132mMp2sfLYaxN7nmXKAvWX9FsLh530rhu7Uw9Vnv8rZIsE3KmiKuntX4fmeGSl8cKF/SB8Zv8goxvI5G2jhDC3UnSe4emjPmJcCzji9jWJ/x4qnTwTeivmaIFsLAQLHBLHryeRyuUHDjn5eabtQaDzW32+BTdN1F6PVhC8NhOiKczSYohUydyH1SiajlmdI8DS9/SCOr8IU8vBJiiknNPfrMU5oIT2JJ7jdhU0nzMHYp88ievejgC7FnOc5ozKFORaPeKL2lKlVyBT3H6oMXieMR95DJ4r0JyUi3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792508; c=relaxed/relaxed;
	bh=rlyXjyEXtouXL0152F+fB9+BD0OSK+Zc9teFpb1cICo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzJqX5NpaaXZC33825wL25ayhyX350a3PJIvX4uBQS3KM9IMn8wbAv/QFviAjsufCW902ASQKVZw8zUvnvMrCNLtnxjeT/dC3OXxxriXx+A1u2WKTqtuo3r9GcVNBRpjTujFmh1F66fs+vlGEt39HVyyL6/Do+w+TQdhadcwKCrtCifK78rh7N9bTdPEYAOtGFl293JvU+PGDQDT3mxMGYlDH3IJbMhZnTTL33AkJU4jHPH5Bz7zgOAVf95xTYxepvJspw0aU7nO3r7f8q8UAu0Zlr2QgjI7q3VeQAb2ddth+ds6qVHJhuTK7Gy6b3fQcdRUAunGyWdRDBna+DUdcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=QbvJmsg+; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=QbvJmsg+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGL4Bjpz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=CW1VrAsVcIFzeSQ+LRElzz/v/465hJ7K48yutpNKaDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QbvJmsg+CNQBRggf76QWd9xXxskBhyJUd/KIIa+CoheJZlSWikhp3QXu9kXtAHmpy
	 cVN5NUblycFJRWx4OJHNUtZVrzfPNGhobeBRxKK27ghb9r94ssbEcQd5JeXwEyfxU7
	 hZdNIM0FDT2rTXPxLiVW6RmAG4cqEXfoW5/wnBP0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:48:11 +0100
Subject: [PATCH v2 5/9] misc: c2port: Constify 'struct bin_attribute'
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
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-5-ba5e79fe8771@weissschuh.net>
References: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
In-Reply-To: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=2244;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CW1VrAsVcIFzeSQ+LRElzz/v/465hJ7K48yutpNKaDw=;
 b=HmftUGO/Q1gjc1W9SM0u88Rx7nEVoZHpGYfZvAoUDF+I4EtC4sXEYCXkrNtxqBs9a5jkryhl8
 EWg9WKupm5uCiRgGg8WJ3jywOnRpnj5vRnBHvEJBy+8ljU2G4rfL+Pp
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
index f455d702b9cd4999648a57985e305aac5301403f..fc64474b8241b73df4937bd4bac5593fbb96016c 100644
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


