Return-Path: <linuxppc-dev+bounces-4165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32999F2F5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd9G4mmTz2yb9;
	Mon, 16 Dec 2024 22:33:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348786;
	cv=none; b=dQnbi/tFjY2KM4g/k7Df0fnr3/oH80wW7mbPHlfaz8Q69z7fAk2fhAqqSdEuQCWeuSUwRUnapW3B5mnvtnW1tnukFBn2KSLV7IQ1gFBJM/p6oEjNCPTE/SK5X2Zyw8lchMTNPjyDts0IoC3M6I7x3hfTxWKotGWhrXXVJC/9RC1ybh7lZJfaiBVOuFVnK4o87zD4dogCoPYCvYbpcGLP+KrLEubNT/u2pkXcmsv9SHXu7Si3EIkE92q75TzOQV9gdgnOww0wrcVLQxOE7tWYWpOFoSRGdNsOChPbaOqkleWMXJOkpeBGnj8Vnmaxxd0dgrnFPqw6ij82Ood5/xX3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348786; c=relaxed/relaxed;
	bh=W1BjdNWS3ZwC09xtoZ2ilQYKrlQT3tsjHhO6AOvONwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caO2uZE6KrrjccsziNEOXZ0AGraGcBQcbX1tU4ne3txJOZUcJE+cNEqRdTqK2PE8/xAxAvxyBKBbJs9jvTwpAsJdpVgr6/zg/+aYR9Ub0cP+1x4yXi3nT7z5eGEXTujwwYZx7Ft33uTdUldnkVjca3pUCN/c6PVC6O3XCQiezreOxZ/rEJbwztujob6987y1YeOkhQIlrsbDJ5Dae1B+vOLFNiR01ZxKd4vLVK3joT0AtGFxwIPf+9Nw7M/CWEAqMQTHQ9ZcUEuCdxxbH9Mraeto2ycfFWa/2+/NeHv8O11YANlzYSB+LXW9njF8A0zpBEh0ncFmtGVdamSToRG1Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=biRaF6i9; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=biRaF6i9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd9F2M2Tz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:33:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348782;
	bh=lrmkPttDURFKu0OlFekPYzaHej1ygcR7qwdieg64a/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=biRaF6i9GcEtBBhecaVAmJ/d074BoDpxM/yFqI0GiBW2g+6QMvy0rNi/9PoEi4gMV
	 WVcZubEW1Oc+v1/vTNebBWumGkLMcy8+6kLuxnN32eYCQ2oGHueRyuVm3ISf98TDV1
	 rQ2lyp6vUM5et1FYKhvig4H4UyLAfVLLHdeNqc3A=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:32:58 +0100
Subject: [PATCH 3/9] misc: sram: constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-misc-drivers-v1-3-d50ff7b21367@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348781; l=1550;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lrmkPttDURFKu0OlFekPYzaHej1ygcR7qwdieg64a/U=;
 b=vg/FYOfVa/0xZABko9TadSA+Ov/vDdDTdJZ1gLuLI9VX5gubiYiyEKA5sAsk8XZpp2Gy4/gVH
 I1SUKqTuU5SAto9UpeOJtdEQ+vGj112l9+Gje3A6G+FoiOk6uyqNVEm
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


