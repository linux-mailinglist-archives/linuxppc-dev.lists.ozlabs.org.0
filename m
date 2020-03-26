Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 364EC193E19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 12:41:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p33h3XGczDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 22:41:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=pokefinder.org (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=sang-engineering.com
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 48p30J3kB3zDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 22:38:31 +1100 (AEDT)
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
 by pokefinder.org (Postfix) with ESMTPSA id 7AC3F2C08C2;
 Thu, 26 Mar 2020 12:38:27 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH v2] macintosh: convert to i2c_new_scanned_device
Date: Thu, 26 Mar 2020 12:38:19 +0100
Message-Id: <20200326113819.7761-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move from the deprecated i2c_new_probed_device() to the new
i2c_new_scanned_device(). No functional change for this driver because
it doesn't check the return code anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---

Change since v1: rebased on top of v5.6-rc7

 drivers/macintosh/therm_windtunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index a0d87ed9da69..f55f6adf5e5f 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -323,7 +323,7 @@ static void do_attach(struct i2c_adapter *adapter)
 		of_node_put(np);
 	} else {
 		strlcpy(info.type, "MAC,ds1775", I2C_NAME_SIZE);
-		i2c_new_probed_device(adapter, &info, scan_ds1775, NULL);
+		i2c_new_scanned_device(adapter, &info, scan_ds1775, NULL);
 	}
 
 	np = of_find_compatible_node(adapter->dev.of_node, NULL, "MAC,adm1030");
@@ -331,7 +331,7 @@ static void do_attach(struct i2c_adapter *adapter)
 		of_node_put(np);
 	} else {
 		strlcpy(info.type, "MAC,adm1030", I2C_NAME_SIZE);
-		i2c_new_probed_device(adapter, &info, scan_adm1030, NULL);
+		i2c_new_scanned_device(adapter, &info, scan_adm1030, NULL);
 	}
 }
 
-- 
2.20.1

