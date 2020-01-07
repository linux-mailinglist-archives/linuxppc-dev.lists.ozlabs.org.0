Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE285132D9B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 18:53:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sg2x2HV5zDqJg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 04:53:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=pokefinder.org (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=sang-engineering.com
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 47sfxJ1YWszDqFt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 04:48:20 +1100 (AEDT)
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
 by pokefinder.org (Postfix) with ESMTPSA id 3D5822C3951;
 Tue,  7 Jan 2020 18:48:18 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 05/12] i2c: powermac: convert to use i2c_new_client_device()
Date: Tue,  7 Jan 2020 18:47:39 +0100
Message-Id: <20200107174748.9616-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
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
Cc: linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Build tested only.

 drivers/i2c/busses/i2c-powermac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 504f5bf0e625..973e5339033c 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -240,8 +240,8 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 
 	strncpy(info.type, type, sizeof(info.type));
 	info.addr = addr;
-	newdev = i2c_new_device(adap, &info);
-	if (!newdev)
+	newdev = i2c_new_client_device(adap, &info);
+	if (IS_ERR(newdev))
 		dev_err(&adap->dev,
 			"i2c-powermac: Failure to register missing %s\n",
 			type);
@@ -359,8 +359,8 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		info.irq = irq_of_parse_and_map(node, 0);
 		info.of_node = of_node_get(node);
 
-		newdev = i2c_new_device(adap, &info);
-		if (!newdev) {
+		newdev = i2c_new_client_device(adap, &info);
+		if (IS_ERR(newdev)) {
 			dev_err(&adap->dev, "i2c-powermac: Failure to register"
 				" %pOF\n", node);
 			of_node_put(node);
-- 
2.20.1

