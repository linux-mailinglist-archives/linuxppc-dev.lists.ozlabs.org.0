Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D889292F1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 13:24:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kcJY/IXj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGShp22CFz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 21:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kcJY/IXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGSf96t8tz3cW4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 21:22:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3fwRgUirFZkfXKcJC7Vv4K4A/Dc48+trUOny3ev4Fh8=; b=kcJY/I
	XjUawthxhRKCMxtL1TNK9RqG22zDCp9Tr3p/+YF4aDqSxkppG+ld2jdpRoeBexWc
	3ahuv1kD2Ym41tevqXsOGNcFIosuswGFy31+TkZ5mxZv3jQHf/Fk2t1jNe9lS7/K
	T7SPe5BtpjUYGVPsVVj2K2ASDTrRxsNilO91rD7eWowhPxY3x33TYjolfGELRMSy
	U04Rq04OF+AtvXWA9t6XgUjVjoUB1Cd5IR3B2LRBJ7WNHw39M4Oyhq1SPBYcIBrE
	U/Hytu85jskq9IB4HBku0oewZF45TbmG2f5mbViGSg2uwPlD3t7pc86TjZHF9/il
	tqR8q9Bawf+2SLWA==
Received: (qmail 3811298 invoked from network); 6 Jul 2024 13:22:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:22:03 +0200
X-UD-Smtp-Session: l3s3148p1@heixY5IczOFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH v2 59/60] i2c: cpm: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:59 +0200
Message-ID: <20240706112116.24543-60-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linuxppc-dev@lists.ozlabs.org, Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Jochen Friedrich <jochen@scram.de>
---
 drivers/i2c/busses/i2c-cpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 4404b4aac676..4794ec066eb0 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -402,7 +402,7 @@ static u32 cpm_i2c_func(struct i2c_adapter *adap)
 /* -----exported algorithm data: -------------------------------------	*/
 
 static const struct i2c_algorithm cpm_i2c_algo = {
-	.master_xfer = cpm_i2c_xfer,
+	.xfer = cpm_i2c_xfer,
 	.functionality = cpm_i2c_func,
 };
 
@@ -570,7 +570,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
 	out_8(&cpm->i2c_reg->i2brg, brg);
 
 	out_8(&cpm->i2c_reg->i2mod, 0x00);
-	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
+	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);
 
 	/* Disable interrupts. */
 	out_8(&cpm->i2c_reg->i2cmr, 0);
-- 
2.43.0

