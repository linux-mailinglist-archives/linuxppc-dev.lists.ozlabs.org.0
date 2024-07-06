Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCFF9292DB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 13:22:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=GQndvjGO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGSfV5hysz3cYV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 21:22:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=GQndvjGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGSdp0r0Vz30Wl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 21:22:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=LBOEuPmP45x17I1fwDIjtyeY3JJeak/7XBOt8b+rk0Y=; b=GQndvj
	GO9tntaD22QpjEHsVWIl+PXS9ut84waujSJYHUm5/ZTemkH/9Ze6jnN7BupSp/gw
	e0m21RK7kZ1nc7npNS1ZsN+hVtX4qDWSoo/t2pC8WohZaGRlCBDdXovBOnqwEUe4
	kB8WvkjvjzvVqR2Eg/H9Ges84KDDuMw77o3aXfUn1IXaMaXo8o6OnBmgcveyIpKS
	OPpYUyD84xMiutNhHzQSKW9wLQTgmrd+/v7t9qG1DQvYjWok8kV+CfRCRwoZeyO4
	9YFCU4OdP8HK4Jt/GX+U7IcAM5tdqbxz7GoXHRTmBsI3WvuIbq+A2hTKe4EdVVPG
	+u1+D7q+r1tljYSA==
Received: (qmail 3810518 invoked from network); 6 Jul 2024 13:21:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:47 +0200
X-UD-Smtp-Session: l3s3148p1@GHOyYpIcEMJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH v2 35/60] i2c: opal: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:35 +0200
Message-ID: <20240706112116.24543-36-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-opal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index 17ef87d50f7c..d9dd71cf37fd 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -70,8 +70,8 @@ static int i2c_opal_send_request(u32 bus_id, struct opal_i2c_request *req)
 	return rc;
 }
 
-static int i2c_opal_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-				int num)
+static int i2c_opal_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			 int num)
 {
 	unsigned long opal_id = (unsigned long)adap->algo_data;
 	struct opal_i2c_request req;
@@ -179,9 +179,9 @@ static u32 i2c_opal_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_opal_algo = {
-	.master_xfer	= i2c_opal_master_xfer,
-	.smbus_xfer	= i2c_opal_smbus_xfer,
-	.functionality	= i2c_opal_func,
+	.xfer = i2c_opal_xfer,
+	.smbus_xfer = i2c_opal_smbus_xfer,
+	.functionality = i2c_opal_func,
 };
 
 /*
-- 
2.43.0

