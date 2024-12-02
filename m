Return-Path: <linuxppc-dev+bounces-3683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B69E0B73
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 20:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2CmP2Fxbz2yys;
	Tue,  3 Dec 2024 06:00:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733166053;
	cv=none; b=iXfeSnxAMrMW4kVXqDyOIUgHGXpQ1tlA1U/CNw9HsMwp/QJDTrlORhvQ65ffsbQmXS9/wRnJD7Ycr3p1r5cJFFYUflRUlu+SYTqLbH2YzKw06IPzBRHmGHZ/ufM7Z+MmeJqcv2722fGUOxHieKyCfFUtGhjhqXwzb7sMaoOjIhwJI13HyM9Gy2/DZgcLpNECs+XJCzjiUJ1u9rWYcupe02+/nhbq7St9CIKiubGHK2oAtCRSHL0t1rxZl97EdMVUErcdBRgZJVqms0JMTttknPjpMUI1L3uO8V4zpnRp53WLWZt4phBr//U/C9T+1hjLV5n/0546aSoxhY5WDGYC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733166053; c=relaxed/relaxed;
	bh=0wVq8HcNBx8cqX/ggXYB4cHAC9d9UVKgjUvWzU7mHBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAVS3Na9yJa75yWKDQoIWDObv4MdK4NWXf0LvxOKuHH98r1lWS4gINKAI37crt/HU3r2w9N+P6vqTx3VU0cthsXU8wQzr7GXz9Q5romHA0fKogXEgxcLRiwxhRHs4k8Ri13tzXcaD6ohmk6/65tB3cFC+n4jdFeODlujOs89WHt4+ks1kG+lyYXso3ajEc5pYRQ8FHK74H+nllQyGSX3fYfsSEC6YI6lNCaqJ9o6aXJfhw3I6U+mdwMWkFebwhcu3J+8zxi76iVPkGWKaxpDKKKb1wr9uxIeQEKRyk+27KbLdnMQ4U6O+SbOwQuQs7QpcpcaJsoil++7vxcjRaeZ/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=gBFUrsr+; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=gBFUrsr+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2CmH2MR7z2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 06:00:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166037;
	bh=8pXu+KIDxnIkhmw4RN4FUIaU1wDaZ00iHKd989Tn4us=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gBFUrsr+Y5gbKfCIBnN+mVBBLd2ht/Yzp1ZH68AnyWMsUH4frA+qekk4i7UYOFI0e
	 RqmX5J+DxnEU0LTjzjOYyubiCNThRXZ56K6Eeuvec0cCO4nkiBkYsp6kBWYN1kA7cX
	 610RLvEWkMG/ATbdxyi5CBTAICClHMTtMw/KhT8s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:00:38 +0100
Subject: [PATCH 3/5] powerpc/powernv/flash: Use BIN_ATTR_ADMIN_WO() for
 bin_attribute definition
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
Message-Id: <20241202-sysfs-const-bin_attr-admin_wo-v1-3-f489116210bf@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev, 
 linux-scsi@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166036; l=2014;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8pXu+KIDxnIkhmw4RN4FUIaU1wDaZ00iHKd989Tn4us=;
 b=HSh67zAWq4cTiwB5DE8N7fJi0p97k9R1Vmirv2ID1DlZHm9pe/UI8TBVHOAvhFnWJM+PYdtth
 zpBnll2/qZKAZPIjlMaeAO9ZGuBUFjgAjH5JihuVFiUP5OozHEDK1It
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Using the macro saves some lines of code and prepares the attribute for
the general constifications of struct bin_attributes.

While at it also constify the callback parameter.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/platforms/powernv/opal-flash.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
index d5ea04e8e4c526b99ca8f1ab613266b385362d82..76e3818601e5610f48bb8a6fd325239d6ad39723 100644
--- a/arch/powerpc/platforms/powernv/opal-flash.c
+++ b/arch/powerpc/platforms/powernv/opal-flash.c
@@ -431,9 +431,9 @@ static int alloc_image_buf(char *buffer, size_t count)
  * Parse candidate image header to get total image size
  * and pre-allocate required memory.
  */
-static ssize_t image_data_write(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *bin_attr,
-				char *buffer, loff_t pos, size_t count)
+static ssize_t image_write(struct file *filp, struct kobject *kobj,
+			   const struct bin_attribute *bin_attr,
+			   char *buffer, loff_t pos, size_t count)
 {
 	int rc;
 
@@ -490,11 +490,7 @@ static ssize_t image_data_write(struct file *filp, struct kobject *kobj,
  *   update_flash	: Flash new firmware image
  *
  */
-static const struct bin_attribute image_data_attr = {
-	.attr = {.name = "image", .mode = 0200},
-	.size = MAX_IMAGE_SIZE,	/* Limit image size */
-	.write = image_data_write,
-};
+static const BIN_ATTR_ADMIN_WO(image, MAX_IMAGE_SIZE);
 
 static struct kobj_attribute validate_attribute =
 	__ATTR(validate_flash, 0600, validate_show, validate_store);
@@ -544,7 +540,7 @@ void __init opal_flash_update_init(void)
 		goto nokobj;
 	}
 
-	ret = sysfs_create_bin_file(opal_kobj, &image_data_attr);
+	ret = sysfs_create_bin_file(opal_kobj, &bin_attr_image);
 	if (ret) {
 		pr_warn("FLASH: Failed to create sysfs files\n");
 		goto nosysfs_file;

-- 
2.47.1


