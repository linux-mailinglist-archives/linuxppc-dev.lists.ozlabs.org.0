Return-Path: <linuxppc-dev+bounces-4382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92469FA11F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:48:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGK0V5Dz2xgQ;
	Sun, 22 Dec 2024 01:48:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792505;
	cv=none; b=BIMlqW8rFTHB8GbkY+gKj0x1u3iQ26RTGUnRJsLvC0ztDBPo2a4cQHgLpMehOS7nyS3CJXb2/ItH/17k/TyUIx/qXU8g3y09uUaDqgyZcglRvCpxnGBvWbtv48dwZltb7l5IwGeK/yN4/95yFdbVKqDisFEj/fHMhEDgDjessV3f4y+rjQQt/oqDFkYJqSHiH25lv484Z1/t429wtUNfihPfeoT7eiBTqcp1IeB8DHTclwzcgjXfeqlgyve82sXTfxbRNEYqe3Qw9IikYjfIwO3K5hsAaCf5hPU82UX5WU3Iguk9jPJcWLh5xAzufFbcjK8inGSv/7DHVDO5FTRiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792505; c=relaxed/relaxed;
	bh=W1BjdNWS3ZwC09xtoZ2ilQYKrlQT3tsjHhO6AOvONwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Co90MV1BCIhJIqj37/TS1pdfd1JF4Pg2yo5uJk58FQryMX3GOhrBnz1/+6VTXvw4Gk6Qwh3uDZKTzIeAna5Ta5dDj6CX7rW4pELOvH6LK5WWryQH2hVeSg8a/xuX53WNWf/axIGHa1OuIf31V3yY6I0NYhOHIdzl2JLzldtjDQlMcWBNyyU6edMhwk2J9U2TBOaDeMQrmJMTSyNoH7HCWk4MLYKmG8VUGVblHW4invRwOGF36pVT5ki1sekSLe3NrCb95R8olQgWaW/WPBw6mp+3ejO70CkKQxWCaYxwrxae6CvkWcNxjmdGEp2vTWSxn2G1nqN38TAGx30ZWoaMnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=EWtNXKai; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=EWtNXKai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGD1Ng1z2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=lrmkPttDURFKu0OlFekPYzaHej1ygcR7qwdieg64a/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EWtNXKaiesE5iymgb6Nx8YvZuEAPf9vYASG1fjoU46cjYroVYOuoHCLLUTYybsOc1
	 BsxvOei373DqCAw8R3zXSBeo8XXGoBK5r8n71NytzfbrmYZGnr6WMsBFDiSFveF4vi
	 pNuYVuSoHtfZNDOl2WWMu+9tql0AsAEtAXsaUvmk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:48:09 +0100
Subject: [PATCH v2 3/9] misc: sram: constify 'struct bin_attribute'
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
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-3-ba5e79fe8771@weissschuh.net>
References: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
In-Reply-To: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=1550;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lrmkPttDURFKu0OlFekPYzaHej1ygcR7qwdieg64a/U=;
 b=bdSQV5Q6IhmFAaIFeRAfk/SbSV3IqpAh93NP3WZkXM1uYH6quaPwdVCV+1MdEt9keWOo8kNPu
 o5bEK7MDyKoAEUDUsmbDpHz8ivH+xXGdj40OWuHG0gpN5H4u8iIc2LA
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
 drivers/misc/sram.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index e40b027a88e25209933a20dc9dbd7db29cb81ba5..e5069882457ef6ba5dc084d02994034dc39d24c6 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -23,7 +23,7 @@
 #define SRAM_GRANULARITY	32
 
 static ssize_t sram_read(struct file *filp, struct kobject *kobj,
-			 struct bin_attribute *attr,
+			 const struct bin_attribute *attr,
 			 char *buf, loff_t pos, size_t count)
 {
 	struct sram_partition *part;
@@ -38,7 +38,7 @@ static ssize_t sram_read(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t sram_write(struct file *filp, struct kobject *kobj,
-			  struct bin_attribute *attr,
+			  const struct bin_attribute *attr,
 			  char *buf, loff_t pos, size_t count)
 {
 	struct sram_partition *part;
@@ -83,8 +83,8 @@ static int sram_add_export(struct sram_dev *sram, struct sram_reserve *block,
 		return -ENOMEM;
 
 	part->battr.attr.mode = S_IRUSR | S_IWUSR;
-	part->battr.read = sram_read;
-	part->battr.write = sram_write;
+	part->battr.read_new = sram_read;
+	part->battr.write_new = sram_write;
 	part->battr.size = block->size;
 
 	return device_create_bin_file(sram->dev, &part->battr);

-- 
2.47.1


