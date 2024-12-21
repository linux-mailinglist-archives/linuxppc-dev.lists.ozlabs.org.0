Return-Path: <linuxppc-dev+bounces-4384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 443519FA123
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:48:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGM0t06z2yjR;
	Sun, 22 Dec 2024 01:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792507;
	cv=none; b=EpXlyYkrVRzncO2tAUziTHtWqqtlr7Nrv/U3yNhVnw2TIpSgk3pp7l2QGxb55njfgfYQwl46/sIFXiFxCOc9xI33NhzIOKjWJ2wQHvQPWoDi/viwPZsGA65YIGKH4LvW/xVE04moYXnlJbcWLN4OhRejSTLIGoScXpPhKSaw5qmnfaMLzfx8jafnZ6Qk356TgfwQAtsxnPN7gf8lpWhjDfh12Z3G+BJVqyCvmOpdmZBMQT+zhsVA92cx9FjSayLbhazaA/JPaO/Or6+550rHz9f2mtGp1ruzYcCqJqxAjww9sB/TgGKCI6Ua1oYVLfkQxBC1xkGca/HyF4U//rs/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792507; c=relaxed/relaxed;
	bh=HY1l/gLbDqwLfqp37PvnASgskJ0hQBGNk/+8L+cxBR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3PO7gJ4I4BeKggoofQc2xxI4z2W38peHpxtmbmDUm1ar//yi3smu7ei41b4utjQ2HjZtuayvdv+Jv64i4RdiMbzBFQEbHQqrwO5qHZQCZ+IrAw7vtgy9l5QB/SBc4xuK75gX1P/xsookRt2d0DR66z2gSzRnP4E6cRbEEkDLE+GY9BAM8zWuYGI/y7A8VDWDNDUMoKT8KsLhbcUgOPVRz74pOZYXUktSv6myoxiAMxmBifLEiNk0r380yYEnQHxq3EV5DS+PkkIp5DuVkZR4scdJJ5O23/Ocp2D42P6YbktMkpK0R5UC+eGe+Ko1+otA+lJN3bSHP5/tTIaMSEQ+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Pdf7WZd/; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Pdf7WZd/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGL3yFBz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=N27SW5V9S6zkyqz00AIvVG+5Rix9h0ENrJDmGyAeG8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pdf7WZd/KEqFjEvas4FwWWeir8E5g7EOhTvWrqB6Nt5Gu7CTdpjO9Ura+5T4IfMLt
	 79ciGz484dD4DeYNJ7/Mm8SbIl7tGg92pmaX+PeYdxB7Fr3aUVuKpGIDsRIsijgPjq
	 /Gk+HfDic2O9cqtQdvtU9/SBeSVcmxWo9/OKN7Gs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:48:12 +0100
Subject: [PATCH v2 6/9] misc: pch_phub: Constify 'struct bin_attribute'
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
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-6-ba5e79fe8771@weissschuh.net>
References: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
In-Reply-To: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=1571;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=N27SW5V9S6zkyqz00AIvVG+5Rix9h0ENrJDmGyAeG8A=;
 b=IXDM8dc7lVmDMCAr1wkZkdrRiZs8RT6lHIXepnbM8+omOaL1e1ocmfOreTcpfRPzfdnG4Wi1F
 Hu13Q87/KUkDiZYTf0ZJ3fg47IwdGmBMfJ0MrsUFJjIn6nchblbQVy6
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
 drivers/misc/pch_phub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/pch_phub.c b/drivers/misc/pch_phub.c
index 8d2b7135738ed5543138f2249d2379a10113b410..6121c0940cd148d48b8d574065c50703b6a301d7 100644
--- a/drivers/misc/pch_phub.c
+++ b/drivers/misc/pch_phub.c
@@ -483,7 +483,7 @@ static int pch_phub_write_gbe_mac_addr(struct pch_phub_reg *chip, u8 *data)
 }
 
 static ssize_t pch_phub_bin_read(struct file *filp, struct kobject *kobj,
-				 struct bin_attribute *attr, char *buf,
+				 const struct bin_attribute *attr, char *buf,
 				 loff_t off, size_t count)
 {
 	unsigned int rom_signature;
@@ -553,7 +553,7 @@ static ssize_t pch_phub_bin_read(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t pch_phub_bin_write(struct file *filp, struct kobject *kobj,
-				  struct bin_attribute *attr,
+				  const struct bin_attribute *attr,
 				  char *buf, loff_t off, size_t count)
 {
 	int err;
@@ -655,8 +655,8 @@ static const struct bin_attribute pch_bin_attr = {
 		.mode = S_IRUGO | S_IWUSR,
 	},
 	.size = PCH_PHUB_OROM_SIZE + 1,
-	.read = pch_phub_bin_read,
-	.write = pch_phub_bin_write,
+	.read_new = pch_phub_bin_read,
+	.write_new = pch_phub_bin_write,
 };
 
 static int pch_phub_probe(struct pci_dev *pdev,

-- 
2.47.1


