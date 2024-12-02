Return-Path: <linuxppc-dev+bounces-3680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7A99E0B6E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 20:00:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2CmM4lDwz2yvw;
	Tue,  3 Dec 2024 06:00:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733166051;
	cv=none; b=hJrwXqfAhsL4/XLGNGEHUZgXMQNUYpHqpyU+bVk1zFN40bzoGIbSSJvCXffrt1hloFvpqsyJza1vOi/DbIJ5nIGKd+tycUJgGqkL7VcSZ68P0fvGcEzd48UGGJOIvcv+cNv1h6KLp83qqhvaH4l2ZXq1/Zchz1gSLc+8wzOS7cgOZPxcjbUlT2Y2UGS40QPp8jsmJP8tepp183iDSvyc0IyHovMEFk+Oj3/LAbIpeEtcLsU6gs7qAWN3IUJoP0ZSst4ouISWYdx4EQPX/MEWnlqgkoYNLX9v88ZGol9WNV2bB/d7WAd3QU3LSNZ74eVLoYXAnPTQ8z90DrIE/fd1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733166051; c=relaxed/relaxed;
	bh=dkavSdwBFbLBLOT6lEpOyFJAnS1SWNHZfxQ7Nyj8DvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2bmZp1Wz87tnK8rCAeycWKU8F+UFBEFxo4rO8JjmkPoq1P0yi/uDf9pG5I4XQgjJtt6MVDyNhgVJo4E3+nw14iWBNFuPohCbIJn5KCXL8N2LX6CylqZ/BrWljJiT78OCarI5B4hUnUDHILW7qgm6Ag5KckYaAqrKz3xsEGL6ohquj4UqslBRAnYbDfTn+hMzUDXg3A0SBcstU/cnghB2YV7ewS7nxpL06qOmJ/ilsYFgxFxcGMJZeNjN1b57UC4TtpXkBanPRCmIjqByodwg66H9V2enw3HYbHF7TV3sGXCsfxOZ46RHyp61wHJ6SLHo2AetNsgpsFVCnxCox/Jdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=VqX26pnl; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=VqX26pnl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2CmG64lhz2ynr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 06:00:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166037;
	bh=xou28swiaoBiDmWpjvH656ao7GcdNsfrzFboEHzP1GM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VqX26pnlkKD4n+vv/jNOMJWWV3ESbtROgqI/ThqvtEtZ4dhs0a0zruOYJPBUNnoyF
	 PL9lyngKcbu8L/cn+IzJbZKlApbrEiP0EgrTjmkCX0o9HdgNFxI7KFB9PRs/HlRoHa
	 xiD+Ep6fGcSkjH2TV8X9Ca69OaWAHpV45r7ymKEQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:00:37 +0100
Subject: [PATCH 2/5] s390/sclp_config: use BIN_ATTR_ADMIN_WO() for
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
Message-Id: <20241202-sysfs-const-bin_attr-admin_wo-v1-2-f489116210bf@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166036; l=1812;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=xou28swiaoBiDmWpjvH656ao7GcdNsfrzFboEHzP1GM=;
 b=vfWtzqSvOITqm9SIRme74Qk53uJwokLIIK0tBYouqbxDGe+gNmhS3pAcZF3um7CX0Thy4ZYvi
 H8BDLWi3jB1Ckix9bcV5uNOkUK2JN6TmlPQN38QAc33eOmKZczOf8Yb
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
 drivers/s390/char/sclp_config.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/s390/char/sclp_config.c b/drivers/s390/char/sclp_config.c
index f56ea9b60e08e817652a9b7d19d420e9977c6552..0fe0782ccd325c1c3907e5d6272f770477e9ea46 100644
--- a/drivers/s390/char/sclp_config.c
+++ b/drivers/s390/char/sclp_config.c
@@ -127,9 +127,9 @@ static int sclp_ofb_send_req(char *ev_data, size_t len)
 	return rc;
 }
 
-static ssize_t sysfs_ofb_data_write(struct file *filp, struct kobject *kobj,
-				    struct bin_attribute *bin_attr,
-				    char *buf, loff_t off, size_t count)
+static ssize_t event_data_write(struct file *filp, struct kobject *kobj,
+				const struct bin_attribute *bin_attr,
+				char *buf, loff_t off, size_t count)
 {
 	int rc;
 
@@ -137,13 +137,7 @@ static ssize_t sysfs_ofb_data_write(struct file *filp, struct kobject *kobj,
 	return rc ?: count;
 }
 
-static const struct bin_attribute ofb_bin_attr = {
-	.attr = {
-		.name = "event_data",
-		.mode = S_IWUSR,
-	},
-	.write = sysfs_ofb_data_write,
-};
+static const BIN_ATTR_ADMIN_WO(event_data, 0);
 #endif
 
 static int __init sclp_ofb_setup(void)
@@ -155,7 +149,7 @@ static int __init sclp_ofb_setup(void)
 	ofb_kset = kset_create_and_add("ofb", NULL, firmware_kobj);
 	if (!ofb_kset)
 		return -ENOMEM;
-	rc = sysfs_create_bin_file(&ofb_kset->kobj, &ofb_bin_attr);
+	rc = sysfs_create_bin_file(&ofb_kset->kobj, &bin_attr_event_data);
 	if (rc) {
 		kset_unregister(ofb_kset);
 		return rc;

-- 
2.47.1


