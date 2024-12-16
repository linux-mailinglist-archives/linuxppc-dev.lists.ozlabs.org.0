Return-Path: <linuxppc-dev+bounces-4170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 869DF9F2F66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:33:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd9K6TkVz30NY;
	Mon, 16 Dec 2024 22:33:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348789;
	cv=none; b=oqb0vbH9S1Z3/40fSrG2GVcsTPbyL6fieUq6RSNN4mWjh36PqrC4PWvN7brA/GpuTQq/Bg17/GCHcvx2dzUGweB1vP0KwjQaAGfW/srnnY5xMxKwH4C0SbmbiK2MUAQfHtgOrW4iRtGpmTXOtHDe3um/GG+1xo4GUOeoi6ve5lhcEIholur9Vkl056SOtmFvKdIBV/TCh4UaQJtJ6ecnTartKC8aK/bKx7Q1vLl6t6qu/lY+fho4X6FF0mnro/05Nnr8bkT3J7RwCHKL5A6fG4fSsHA5lpQ6OQwBCC2AxIwQpQmSxr70qu8XWcxqEclqavnCrKO/N6HTrK70WWa/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348789; c=relaxed/relaxed;
	bh=fsObzo1AH7n3PYOKSWkuZHesevR7Yl7bDTRO2h0IAm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8J2YKlspaKxT2uwHTXPAZcHgQFDEggUtWOxBgqTjQVmiZbOaIRKvTYNyeB2QC7aR4kPiHCJWmgpZFkfewCLrYi0cXmrGPQ7MXG3Yh/XISYkkJhZsHShH4WM0/yli+TryU+fRFyeAkFoeX8zdlMLWhxq/lo5MUPQtIZHMCtcIHelGsTHKjWHsBq8kb6rvCfcmKcHVHn8nsDvAaK0VIGi7ivehPAq4mKOFGZUQLN1lSHTNaTxPZCZC0XpRxw2k5HFMudoSghLS/A+KBHQzuXbCYbRxfPCn/zsS0pPUXS+H3Z668qwqof5yAxw9YYZ6JYDhiANhwxE/AZMheNUHrj5bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=uR6FKeW5; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=uR6FKeW5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd9D73ylz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:33:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348781;
	bh=FtAXAyK33C589+S6JQ5FOb5ZXZI9TCjN1J5zeoHgJe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uR6FKeW5WemX75/DpwkpBUUCpL65H1aFnpr0t8HgXiJqnknlY8LoYHlwqkPu4iutA
	 yDMhKqcGpes9Bz7STcfERxVg2AToGTsDDCBiTxK/1uzZgXOVwFYfvhqjweerR2H+Vv
	 iZggsiTn7pDhkO8gjcqFaC+ciRTgao0ZTCBAZGV4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:32:56 +0100
Subject: [PATCH 1/9] ocxl: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-misc-drivers-v1-1-d50ff7b21367@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348781; l=1409;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=FtAXAyK33C589+S6JQ5FOb5ZXZI9TCjN1J5zeoHgJe4=;
 b=7YG497eEqeHdVldUHhxXeVxJPMnzNYLDz/i1aXZ4WDfHJBu+adlcVWn9wpigL5EQ/xT7FRLsY
 jqdPY64QgfkBPUA/Qf/D0TksQxgf0I+vSdbUPsdYlKjMgagPVeSZ6st
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
 drivers/misc/ocxl/sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
index 07520d6e6dc55702696b8656440914c379e6e27a..e849641687a005fec5eb7a6b2e96bc0e9d04dc05 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -94,7 +94,7 @@ static struct device_attribute afu_attrs[] = {
 };
 
 static ssize_t global_mmio_read(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *bin_attr, char *buf,
+				const struct bin_attribute *bin_attr, char *buf,
 				loff_t off, size_t count)
 {
 	struct ocxl_afu *afu = to_afu(kobj_to_dev(kobj));
@@ -155,7 +155,7 @@ int ocxl_sysfs_register_afu(struct ocxl_file_info *info)
 	info->attr_global_mmio.attr.name = "global_mmio_area";
 	info->attr_global_mmio.attr.mode = 0600;
 	info->attr_global_mmio.size = info->afu->config.global_mmio_size;
-	info->attr_global_mmio.read = global_mmio_read;
+	info->attr_global_mmio.read_new = global_mmio_read;
 	info->attr_global_mmio.mmap = global_mmio_mmap;
 	rc = device_create_bin_file(&info->dev, &info->attr_global_mmio);
 	if (rc) {

-- 
2.47.1


