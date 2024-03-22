Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286B886D4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 14:37:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=j5w+mNFM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1Nff16Xkz3vvh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 00:37:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=j5w+mNFM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1Ndw2gCXz3cPR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 00:36:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=va8vNqc+zL5cgGG+Iw+afAtq26+B226YZpwpqFLNgOs=; b=j5w+mN
	FMDRK5YOf4guug8Ig9fZ1bSeTpXeJ7j/XXuEg4MIWvaY8dsq7cphzqVA5u1hhRdy
	9UQBj0LmMlscXjO0aGOU5eADSLZtwkU732kzjJ2rYmq5YsrL1XEnRLHizTepZNHi
	tNG6MFnCt50+MqHjI2tnI/Dfn3e0YytD8xEAY7ql1nJek5o+/7Y/f6ycDlCIYHrm
	7jGqGWkaITt6mHoKGz03HL0E2vzYq9IuxAjMvM774UoAC4UD2XqLwsFu16ZU8IBN
	5jXz/kDrygaz2ow2iqPhuWWQr0NerJLpOq1N2FJ9Cofsj4fxDdvJU31rArK7xWdX
	RtkV/+rHc99cBZSQ==
Received: (qmail 3871489 invoked from network); 22 Mar 2024 14:26:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:56 +0100
X-UD-Smtp-Session: l3s3148p1@NvkVxz8UgrBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 42/64] i2c: powermac: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:35 +0100
Message-ID: <20240322132619.6389-43-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-powermac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 8e57ebe595be..03abc5f3cb9e 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -25,7 +25,7 @@ MODULE_LICENSE("GPL");
 /*
  * SMBUS-type transfer entrypoint
  */
-static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
+static s32 i2c_powermac_smbus_xfer(struct i2c_adapter *adap,
 					u16			addr,
 					unsigned short		flags,
 					char			read_write,
@@ -127,11 +127,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 }
 
 /*
- * Generic i2c master transfer entrypoint. This driver only support single
+ * Generic i2c transfer entrypoint. This driver only supports single
  * messages (for "lame i2c" transfers). Anything else should use the smbus
  * entry point
  */
-static int i2c_powermac_master_xfer(	struct i2c_adapter *adap,
+static int i2c_powermac_xfer(struct i2c_adapter *adap,
 					struct i2c_msg *msgs,
 					int num)
 {
@@ -180,7 +180,7 @@ static u32 i2c_powermac_func(struct i2c_adapter * adapter)
 /* For now, we only handle smbus */
 static const struct i2c_algorithm i2c_powermac_algorithm = {
 	.smbus_xfer	= i2c_powermac_smbus_xfer,
-	.master_xfer	= i2c_powermac_master_xfer,
+	.xfer		= i2c_powermac_xfer,
 	.functionality	= i2c_powermac_func,
 };
 
-- 
2.43.0

