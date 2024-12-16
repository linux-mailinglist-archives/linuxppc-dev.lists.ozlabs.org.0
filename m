Return-Path: <linuxppc-dev+bounces-4168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B3E9F2F62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:33:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd9J6W9jz306l;
	Mon, 16 Dec 2024 22:33:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348788;
	cv=none; b=OYeOCLMhmWlnOS1MEfz2uMnTZZy0gicy+89b1m00MwlLeJt/9BwDItj905J7W8U7BkQ/ugNbzG+GIotkJE/lgB1OIAqPwJne02uQ/Qik5sTG4oV83NP1dnHVPszZ218wNdgH7v2igioVTB68EySWq7EY6qm6hb6Qy7OwZc8RcIyRVVYVKPt06Xu8hcm91Yv6dfYmxTY/4+vRbnbiIdeayXHDjmbzQ5dgPhM/u8s2xvJBIiKA/8eb2SpRjLUQD6vF6uF4uRboS4NBfks4yHopJE2VuzgExuCDcb15NDqLIO0c9qhEpk154S9MhzvJRGhwugQIE0N+tIXiJAIvtE4FGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348788; c=relaxed/relaxed;
	bh=XBL3ttK644uD2MwFxgPi+QzNqrertWW4xLvR7iCSUZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDgE4GDXFTuH67K9ZQlmWoNbfCsQpjJmkv8Wlx6uq7szLVF7YrwNW8rpD0fLkfu016TJvk0t72bPXOobBJJhmnrsburaANPCac0nIn8T6mmLbVzY29PhYfcheTIB+oDtmN3MbP+w4D3Q35t56IZ0qKT/woPSBg/ohL84gEWGk/zezQ5j2R1DN2jTbgzcz8kcwL37kVE0JEH0JtQ2HOLIT/J8XyCNImPiBLXJ+zCjGVGPe06sLH0PnY6QGnSR9ee+KQjQP6+VHKTE+uxIs3LjRHfGJiP2lMlZCuMcq8wIOG7i0woP5Vf0qKVF7/3C86Ncw75aY0qFuIW39eAY8gFV3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=c3mYq2mJ; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=c3mYq2mJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd9J1gsmz306J
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:33:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348782;
	bh=SGNU5IH45oWd8l2/U8DWBMgp52g/CAQH5eqzkYxnU98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c3mYq2mJcekiJuhBgIIW27jXtnpzPT4YWscUJ2HP5DhUmVlnXWvFi+N42GdoVqI8C
	 eRRGwl70Gcq/YAiALSTicS2w9RrHzN2ZIYyhsuRox+eKdeMgTIGZdlaWpCqKw2mzla
	 Cd0K9z8QHx8LKszbT1NmV/lc7Y0GSLW1DySkfs/o=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:33:02 +0100
Subject: [PATCH 7/9] misc: eeprom/idt_89hpesx: Constify 'struct
 bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-misc-drivers-v1-7-d50ff7b21367@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348781; l=1790;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=SGNU5IH45oWd8l2/U8DWBMgp52g/CAQH5eqzkYxnU98=;
 b=g8NH5MD7iQwipA2t3S5AFXTfyVoMJXZLw4AUNZ66awjEngV+bDzzXZSYF66Pl7unnvvTkaHQm
 L88qMM11/C4DkttBTBl8msv5BNPFGUgTCF2PNY/OqhAHX5VvqqD5uTD
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
 drivers/misc/eeprom/idt_89hpesx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index 43421fe37d338874ff1c2949497c64ebf0143106..1fc632ebf22f560088084519e5ad8e8b37958368 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -847,7 +847,7 @@ static int idt_csr_read(struct idt_89hpesx_dev *pdev, u16 csraddr, u32 *data)
  * @count:	Number of bytes to write
  */
 static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
-			    struct bin_attribute *attr,
+			    const struct bin_attribute *attr,
 			    char *buf, loff_t off, size_t count)
 {
 	struct idt_89hpesx_dev *pdev;
@@ -871,7 +871,7 @@ static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
  * @count:	Number of bytes to write
  */
 static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
-			   struct bin_attribute *attr,
+			   const struct bin_attribute *attr,
 			   char *buf, loff_t off, size_t count)
 {
 	struct idt_89hpesx_dev *pdev;
@@ -1017,7 +1017,7 @@ static ssize_t idt_dbgfs_csr_read(struct file *filep, char __user *ubuf,
  * NOTE Size will be changed in compliance with OF node. EEPROM attribute will
  * be read-only as well if the corresponding flag is specified in OF node.
  */
-static BIN_ATTR_RW(eeprom, EEPROM_DEF_SIZE);
+static const BIN_ATTR_RW(eeprom, EEPROM_DEF_SIZE);
 
 /*
  * csr_dbgfs_ops - CSR debugfs-node read/write operations

-- 
2.47.1


