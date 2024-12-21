Return-Path: <linuxppc-dev+bounces-4385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37B9FA124
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:48:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGM6t7zz2xbS;
	Sun, 22 Dec 2024 01:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792507;
	cv=none; b=li8joLGiYi0mlLJskeYhy/S7uhDEmeCKxwPzPaitn1Ii+cF+4WGty2nn/gPYTVSOSChwl29WzznlcN5UCKd6gQ0RUBqn4DFi7uNEgy2TvfnWwR5ogc9dpynEzZTOFlNmkRKknIux+ldty+6iR1/bjKgYKUdUJKi9AMJ/SqjUfZaJtMIG+MTwCrEG4LwwErJTU/CN99wtAJt8D52PnT0hyFUDapZ5rJNIKrLALSrZaWSC4Y6K3tBKTYbaMZ91Q/CanqN7pnZNp7mGkPL9ZIJbpZHlnJk72tQ0Q7SlIH2nGX8PQECZowEIaK4scsIfFKxYz4braENJT7uZPNx2Cth/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792507; c=relaxed/relaxed;
	bh=h45lCs8mmIdYcwliCgdna+GGxIQdxcZB/tsAFnwsE0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXktN3xgAe3ugeuVj3iz5fM7b8vCJCcVqOjSpF1+flJZ3rHepx8IDA3opUIAPy3QoV/3ia4LCU3wVGQK43+HyEV+Nsfq29VlCLkMvqakIpPaT2AEIG896D/Lp8kIbgJT9ULwlIqC9/GzvnKC7OyWoNsmgm8CNlZEBfozKpoG9p3ow0LY4tsnipnVOMOt8bAEWG31ZSSw+/WllMORdNlCwNFjPE8LoIfxtpfrA2QWTqNvLnaxLxq7IpxOzNpvnbk++8yqQl5qkomOSSwCc0+xldUssPAG049vAz9XN7seTG+HNcSMbC/v/+YSXfeUDm/Wg53ek00KNRFCH0JL04ilgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=JNVcWW2g; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=JNVcWW2g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGM00WTz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=P5yp8xYY8rjGfFuGyyUiA1DeB8eRe4QDxQgMbEH9sX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JNVcWW2gFSmvicQCnJGojFONnzhcFAsQGpIKt6ReRKCCf+YKAnUgrh7vjeRAisGUm
	 v30iei+YcDn+MZfccO4rxmoS++hnGiFThuz/x2TRXE7UHzOduKb7TdVX9PkfQS3vso
	 lTMgneXPAepSWSzaIiCNTSuFL23RzMF9ctzWzffA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:48:14 +0100
Subject: [PATCH v2 8/9] misc: eeprom/max6875: Constify 'struct
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
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-8-ba5e79fe8771@weissschuh.net>
References: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
In-Reply-To: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=1212;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=P5yp8xYY8rjGfFuGyyUiA1DeB8eRe4QDxQgMbEH9sX4=;
 b=RXc6sdUDetNj/ZNOQ7p5ylGNWpmccRq2GRI6mGXONV+ZAdL005yVc1OM1q/GydoVP+FgaFH1y
 bll9rm0OAfvDlwN6xXOLVsWLG0SZrIssLygrIHOyS6BFhM5dXEfMukl
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
 drivers/misc/eeprom/max6875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/max6875.c b/drivers/misc/eeprom/max6875.c
index 6fab2ffa736b741593931c413f230d7c43b5b8dd..1c36ad153e783ead6ba2481c64838390f0bb05f4 100644
--- a/drivers/misc/eeprom/max6875.c
+++ b/drivers/misc/eeprom/max6875.c
@@ -104,7 +104,7 @@ static void max6875_update_slice(struct i2c_client *client, int slice)
 }
 
 static ssize_t max6875_read(struct file *filp, struct kobject *kobj,
-			    struct bin_attribute *bin_attr,
+			    const struct bin_attribute *bin_attr,
 			    char *buf, loff_t off, size_t count)
 {
 	struct i2c_client *client = kobj_to_i2c_client(kobj);
@@ -127,7 +127,7 @@ static const struct bin_attribute user_eeprom_attr = {
 		.mode = S_IRUGO,
 	},
 	.size = USER_EEPROM_SIZE,
-	.read = max6875_read,
+	.read_new = max6875_read,
 };
 
 static int max6875_probe(struct i2c_client *client)

-- 
2.47.1


