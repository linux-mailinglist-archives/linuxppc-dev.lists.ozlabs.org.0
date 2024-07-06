Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE49292EB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 13:24:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=l+5qkZV3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGSh24x0tz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 21:24:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=l+5qkZV3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGSdt0lS1z3cND
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 21:22:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=O+DQTIwXTC7DeV38nbA6p6oVvBJeZ5V9St2bzhvReOQ=; b=l+5qkZ
	V3hn1i5UCfgjdB/NMxnOMIKXwUsVOIau3NOx8SApuMhduvNDuw37LT0NqZ02RHl2
	vy3HMrXqH+CNR+3vIkVQNK1u4RGuP72WXcHEa2aMV1AZqybnD+KkpTCeksrtsmRj
	i8oM6udJNXh/lbhz5xzhn6ddSGlSgewcL2F31B4c6ska0kVEWJcOYP7ewKih2/Om
	cuUiW0JCEB2ZSZyXAyP0PK70A6J8PGZ0hoqdJv9PATkfWbeUioxwTpwvv9ybtMBC
	aYv4rCwDrgDpnC7z2VHVRp0p0xc2LL29FEp5sENOVjBkoFia//g53qTY5oN8xfpq
	FY56Ka29EaWThRow==
Received: (qmail 3810632 invoked from network); 6 Jul 2024 13:21:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:49 +0200
X-UD-Smtp-Session: l3s3148p1@LindYpIcMMJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH v2 39/60] i2c: powermac: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:39 +0200
Message-ID: <20240706112116.24543-40-wsa+renesas@sang-engineering.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-powermac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 8e57ebe595be..b6b03539f626 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -127,13 +127,13 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 }
 
 /*
- * Generic i2c master transfer entrypoint. This driver only support single
+ * Generic i2c transfer entrypoint. This driver only supports single
  * messages (for "lame i2c" transfers). Anything else should use the smbus
  * entry point
  */
-static int i2c_powermac_master_xfer(	struct i2c_adapter *adap,
-					struct i2c_msg *msgs,
-					int num)
+static int i2c_powermac_xfer(struct i2c_adapter *adap,
+			     struct i2c_msg *msgs,
+			     int num)
 {
 	struct pmac_i2c_bus	*bus = i2c_get_adapdata(adap);
 	int			rc = 0;
@@ -179,9 +179,9 @@ static u32 i2c_powermac_func(struct i2c_adapter * adapter)
 
 /* For now, we only handle smbus */
 static const struct i2c_algorithm i2c_powermac_algorithm = {
-	.smbus_xfer	= i2c_powermac_smbus_xfer,
-	.master_xfer	= i2c_powermac_master_xfer,
-	.functionality	= i2c_powermac_func,
+	.smbus_xfer = i2c_powermac_smbus_xfer,
+	.xfer = i2c_powermac_xfer,
+	.functionality = i2c_powermac_func,
 };
 
 static const struct i2c_adapter_quirks i2c_powermac_quirks = {
-- 
2.43.0

