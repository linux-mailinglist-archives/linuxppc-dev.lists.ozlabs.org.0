Return-Path: <linuxppc-dev+bounces-4166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8AF9F2F5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:33:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd9G6vpqz3011;
	Mon, 16 Dec 2024 22:33:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348786;
	cv=none; b=Epl9kiSq04v3xE/YNvtMx5C9zGdhnqSQ8arTzp8mRbUmzpKWOXyRJZopBoxWeYSWqoUM4FkVr7jq39W4cjL1AutoR23gnNPCruoc0Qb1D6m93vivrXjvjpLClWhjJiAQLlo9lzUDSuiaApv6a88n96SmwoAE3w/5rK/uOB7YC0VURvirbb8xcSEOL5UKVY9ccutdh4sJwKhPU2UmkoQl77kRzfztN4mk2njhfdroHKfhDmu1+dAVa2EndAFh5xfE0qOEYP4qA65XjdosjScAttvz9qcTANGG+mCyfKD384CPpAcoPMxmceTXuZVAhLoj2FlDGwXSy3QFxoX/k5hqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348786; c=relaxed/relaxed;
	bh=cGlIXfJffULWukrsXMYJGomdI6ZfWObjYyUOlVs4M/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lPT2eWzliP6FjjfUpIggdc1FZReB11ZCcYtuPm0Z2TEonrUaRnhts4p8PI+gs3avbtr1YlkD5B5s7Rj7Rw4s32S3DnoYsaE/DplPT/nwv0+plbS2neT94MobmrmLPM1mdzAanBzAwAgSQnREA29QAaKOwNIQx6qelDM8vM/eE3N8wH17eDCustPRLCT9UGc1a96igkGFmOT8Yw1nw66BjFJLudH8LSmxLwLL5YNTVVWtkB3QK6SGZF9irRAH+YTXvlqsiRyimtioBO5aFI95oXJE+vAsUcQa0nbChVX26cgbXlZlvRQJ6nGHEMczSFpvD3jEUqMRxUw1L6euI1n8sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=myKGpY3u; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=myKGpY3u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd9F2r7fz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:33:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348782;
	bh=CcDBWMFWLtSDmVrkWX7ndeD+K4Cfvo9MPzDfwHVQP6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=myKGpY3uWk6mwmbD2RvdisauS0ytwt05mIhLyKQcE1VG7wh/xYWLoEr0YYP2vsSvW
	 D4PIIqYUs0bRIlZzV3Ea3YKF4lLEEYqqb4zYUNjHq0MV2KwNaNXw5lfJagNObcfoI+
	 StpUSP1/JX9+gLr3dSwB1yKOWc8H1wTNkKpdd+20=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:32:59 +0100
Subject: [PATCH 4/9] misc: c2port: Calculate bin_attribute size through
 group callback
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
Message-Id: <20241216-sysfs-const-bin_attr-misc-drivers-v1-4-d50ff7b21367@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348781; l=1494;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CcDBWMFWLtSDmVrkWX7ndeD+K4Cfvo9MPzDfwHVQP6g=;
 b=V3cSwsQHSCtQbrD0jp5/nVa8t1w9RANvtZ0CKl4QibCNmCl3FskR+zYeGXktanFJ1i5WvyyI4
 ov9YBDN+vVKBxcdOP0J8TnBHLO2TcmINCzJwbVmkUQGjVAvJb8LSslR
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Modifying the size of the global bin_attribute instance can be racy.
Instead use the new .bin_size callback to do so safely.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/misc/c2port/core.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/c2port/core.c b/drivers/misc/c2port/core.c
index 2bb1dd2511f9dd178b8c06baa460bb609f7f8fd7..5d6767b484c998b44a3c90c177d12028db1ea1af 100644
--- a/drivers/misc/c2port/core.c
+++ b/drivers/misc/c2port/core.c
@@ -874,9 +874,22 @@ static struct bin_attribute *c2port_bin_attrs[] = {
 	NULL,
 };
 
+static size_t c2port_bin_attr_size(struct kobject *kobj,
+				   const struct bin_attribute *attr,
+				   int i)
+{
+	struct c2port_device *c2dev = dev_get_drvdata(kobj_to_dev(kobj));
+
+	if (attr == &bin_attr_flash_data)
+		return c2dev->ops->blocks_num * c2dev->ops->block_size;
+
+	return attr->size;
+}
+
 static const struct attribute_group c2port_group = {
 	.attrs = c2port_attrs,
 	.bin_attrs = c2port_bin_attrs,
+	.bin_size = c2port_bin_attr_size,
 };
 
 static const struct attribute_group *c2port_groups[] = {
@@ -913,8 +926,6 @@ struct c2port_device *c2port_device_register(char *name,
 		goto error_idr_alloc;
 	c2dev->id = ret;
 
-	bin_attr_flash_data.size = ops->blocks_num * ops->block_size;
-
 	c2dev->dev = device_create(c2port_class, NULL, 0, c2dev,
 				   "c2port%d", c2dev->id);
 	if (IS_ERR(c2dev->dev)) {

-- 
2.47.1


