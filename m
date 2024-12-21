Return-Path: <linuxppc-dev+bounces-4389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B79FA12A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGP2BC4z305X;
	Sun, 22 Dec 2024 01:48:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792509;
	cv=none; b=QZt63VRjM10xGNJsUBQgOgvoJjL5ZcmSdz1gU+AdNFfT4u9fyFrUval9reiamBLdo5hq9zf0iaB4Pa7jFqvojacKoT/FU8BrQJO8ORWBwsbJur7SNvt2a8LQeIP2THh70iMgSa99cXFRuGEdffFjgSmBPvYdtm0s3MYbU6TCkasNOJQUpXntmaZC+j4lxx7zhBc18diIkvd8F2jJjAZhxGj/dW0+0rYZw1bwvE1/UH2Vx6lupdq+nZD0PfdBjEeUBcNWDvdTEdQj82Yfi5clI0z1V8nmKWt8h9pxhqDiGeI8wmWfps6asDXtZQ+1cqaOsWPwWqzITxLIu+r3lRgc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792509; c=relaxed/relaxed;
	bh=6y6YVe0XlNkHQNTNsJEMbPbzAWUCVwR/z+g3wONlyTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUE0KaVOTMM0x8hvdE4ldcjZZsht3xQXnYdCVloqUMUX1rD5CRG1s5HhVJlubNd8yhxSMm57fd+XqbSDwHgfTwfQ3X3HWTu0f2b+s1GV5XUFytAMwmGRxn5OEE8VGfeYlvlw4swJKynKgCAm/uqow8ftuNu1R1j9dpgbeoFHNhZBLPNMQXFZFiMaMIXajZRHm00/Bq2aCJR8CDqYj8ROMkcNm4O1RQz4yf5faDhuc37DWWE7T0uk8EEG57jJMgBjQ3u8iyO4ZJFgvIAWjSpqREhhy7tC/KZlbX18rrI+uIN3ywG8F+7z5JWZfsMQ7LTjKUnnKbfsVjBztr5/gOWSjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=qVGDyzQZ; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=qVGDyzQZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGD1MCbz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=RwAfPP9M2GhUNJqftttiOezg9EgAoMngS2VyEVuwqHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qVGDyzQZaxTjxePLqqeh0PYSAauLlAcjAXx21OS2ucpxW4E03kDA0WdkQRdWNsl88
	 udXSOBR16ID1YWkjIr0AufMMs2Ku8WzR7bavJB4l2dPQziEFpN0UheYAdatzE1Abs1
	 DoY+M4cTZCmt2CpaPca47FvKgg0vWYMc+hoP3Lmo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:48:08 +0100
Subject: [PATCH v2 2/9] cxl: Constify 'struct bin_attribute'
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
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-2-ba5e79fe8771@weissschuh.net>
References: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
In-Reply-To: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=2119;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=RwAfPP9M2GhUNJqftttiOezg9EgAoMngS2VyEVuwqHs=;
 b=OkQn3R2RgNSCuhxmhVduMnO3k9hbmoJYC3K9thYJkN5ETqHzqu+V+OfVYJG0JVRpk5GW8TBt2
 ziTNFgrLzVwAyY+jJVAUWvFmpvzYInLJxoUxqpIXqGJBrcxDdtFMLEh
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
 drivers/misc/cxl/sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/cxl/sysfs.c b/drivers/misc/cxl/sysfs.c
index 409bd1c39663159a0d11c3ccba2aa5a8451baa34..b1fc6446bd4b7caa2f5c6e23e0aba5934caffd46 100644
--- a/drivers/misc/cxl/sysfs.c
+++ b/drivers/misc/cxl/sysfs.c
@@ -444,7 +444,7 @@ static ssize_t api_version_compatible_show(struct device *device,
 }
 
 static ssize_t afu_eb_read(struct file *filp, struct kobject *kobj,
-			       struct bin_attribute *bin_attr, char *buf,
+			       const struct bin_attribute *bin_attr, char *buf,
 			       loff_t off, size_t count)
 {
 	struct cxl_afu *afu = to_cxl_afu(kobj_to_dev(kobj));
@@ -538,7 +538,7 @@ static ssize_t class_show(struct kobject *kobj,
 }
 
 static ssize_t afu_read_config(struct file *filp, struct kobject *kobj,
-			       struct bin_attribute *bin_attr, char *buf,
+			       const struct bin_attribute *bin_attr, char *buf,
 			       loff_t off, size_t count)
 {
 	struct afu_config_record *cr = to_cr(kobj);
@@ -620,7 +620,7 @@ static struct afu_config_record *cxl_sysfs_afu_new_cr(struct cxl_afu *afu, int c
 	cr->config_attr.attr.name = "config";
 	cr->config_attr.attr.mode = S_IRUSR;
 	cr->config_attr.size = afu->crs_len;
-	cr->config_attr.read = afu_read_config;
+	cr->config_attr.read_new = afu_read_config;
 
 	rc = kobject_init_and_add(&cr->kobj, &afu_config_record_type,
 				  &afu->dev.kobj, "cr%i", cr->cr);
@@ -693,7 +693,7 @@ int cxl_sysfs_afu_add(struct cxl_afu *afu)
 		afu->attr_eb.attr.name = "afu_err_buff";
 		afu->attr_eb.attr.mode = S_IRUGO;
 		afu->attr_eb.size = afu->eb_len;
-		afu->attr_eb.read = afu_eb_read;
+		afu->attr_eb.read_new = afu_eb_read;
 
 		rc = device_create_bin_file(&afu->dev, &afu->attr_eb);
 		if (rc) {

-- 
2.47.1


