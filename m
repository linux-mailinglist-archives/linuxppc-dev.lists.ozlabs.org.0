Return-Path: <linuxppc-dev+bounces-4388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DEB9FA129
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:49:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGN63LCz3020;
	Sun, 22 Dec 2024 01:48:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792508;
	cv=none; b=h2+ybyksw6PuomkY7F7iIDejOYT9D+NtgAaLzjHnxixw9iHilevo82f3cHLTENKH3DtygWed5q8+z8UTnCCCzTXfTg+FGGsrtjiXSteMgxvZFNgd7acDAwh2bLO26LcBQDamgzlZtspQMVs/4aCBkrFInSG1aItnT4zk8oH1u24EnaiHGK1JL8CMBqjgImSQwiheMcozgZPOAj0Li2/rewCLOnAA/kbyGRzx+6fWXfLTJeItC3nxmMtpU0zW6uZvGFvh4W9q3zjUwYwibGaM00VkSeCNtTfdg88HJZBJidkAVX2K0q+DuuUzf/EL9BLYSBpxubqF8HR6Fi/U4EDDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792508; c=relaxed/relaxed;
	bh=mKltDnEW6uX1nsLhjCWd0XtwhpOXvtKthlwTDBsg938=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kAxrhWcBu2iY+nUWuOKVMqc3AWV7PS5s2ZFmjTx+jTiqmXxN5dJ9g79WqEunHQeAUnu0GDCfPo8L34JQwWW35BXA/nr3WXKS5IpKMdV+IPC00EWRFHLr9QcRtxWaPe99B2zLJne9+xPjqdGmgj40kSU462pNKpZBY0/qNwKF+ZFMkeNeC8fs23pRiAfbhsy5DtQuYCBxMb9mcwDniE5fgkGZfA+IWp5WgKzVbyPfNwsGVpAr9JtMkBAp4z5LH6v58dEHZqD93ITZbIr/4zO116dvL476Q4DNmzgnHzSPMm2sx32ay1qhssmP6E9Wfoidc3HUSVbgiadL6MHS7kqtrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=LNg9OD6K; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=LNg9OD6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGD6hMBz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=HdhEo0+3qt1XAEQ2OvK1EVfCCKLrCDFgHBMKfkRiFtc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LNg9OD6Kr8itKOZKhpX6flzRmPnildZpCIg/HAjDHrQx9R4odaRnx6dZcGuhsjVAZ
	 oUSmhmnDx3juaBAT34M/+2MyIVEEWVl6yD6kV5boUS0Tr9JbKK+zV/XdOPy508v/gi
	 IVjtwSLoppZPloW1TgYIP/2OsUb0MI7NdRFcfp4w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:48:07 +0100
Subject: [PATCH v2 1/9] ocxl: Constify 'struct bin_attribute'
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
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-1-ba5e79fe8771@weissschuh.net>
References: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
In-Reply-To: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=1457;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=HdhEo0+3qt1XAEQ2OvK1EVfCCKLrCDFgHBMKfkRiFtc=;
 b=FdmsEIMeigKQSa0j6GAYjlnflM/7EQ6hcX2TirjlZzlbp4oPUluc4uCjBR/gbYPZjqTrAc+N0
 msW6nBb7a31A5r2IQxSAS4yORFYgZgxxkDBLJ2zAXEopFKpLUgc16/r
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
Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
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


