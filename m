Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF9D16EE94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 20:06:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RpMF34TgzDqHH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 06:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 48RmwN3H1BzDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 05:01:56 +1100 (AEDT)
Received: from localhost (p5486CE6D.dip0.t-ipconnect.de [84.134.206.109])
 by pokefinder.org (Postfix) with ESMTPSA id 08CF62C1F2E;
 Tue, 25 Feb 2020 15:26:18 +0100 (CET)
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: powermac: correct comment about custom handling
Date: Tue, 25 Feb 2020 15:26:13 +0100
Message-Id: <20200225142613.7169-1-wsa@the-dreams.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, Wolfram Sang <wsa@the-dreams.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The comment had some flaws which are now fixed:
- the prefix is 'MAC' not 'AAPL'
- no kernel coding style and too short length
- 'we do' instead of 'we to'

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/i2c/busses/i2c-powermac.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 973e5339033c..d565714c1f13 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -279,14 +279,13 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 {
 	char tmp[16];
 
-	/* Note: we to _NOT_ want the standard
-	 * i2c drivers to match with any of our powermac stuff
-	 * unless they have been specifically modified to handle
-	 * it on a case by case basis. For example, for thermal
-	 * control, things like lm75 etc... shall match with their
-	 * corresponding windfarm drivers, _NOT_ the generic ones,
-	 * so we force a prefix of AAPL, onto the modalias to
-	 * make that happen
+	/*
+	 * Note: we do _NOT_ want the standard i2c drivers to match with any of
+	 * our powermac stuff unless they have been specifically modified to
+	 * handle it on a case by case basis. For example, for thermal control,
+	 * things like lm75 etc... shall match with their corresponding
+	 * windfarm drivers, _NOT_ the generic ones, so we force a prefix of
+	 * 'MAC', onto the modalias to make that happen
 	 */
 
 	/* First try proper modalias */
-- 
2.20.1

