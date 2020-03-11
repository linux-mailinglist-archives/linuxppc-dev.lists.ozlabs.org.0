Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 636DC181218
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 08:41:08 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ckR55VfqzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 18:41:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=tiwai@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ckPn4XTszDqDf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 18:39:51 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 87D21AD72;
 Wed, 11 Mar 2020 07:39:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] hwmon: (ibmpowernv) Use scnprintf() for avoiding potential
 buffer overflow
Date: Wed, 11 Mar 2020 08:39:44 +0100
Message-Id: <20200311073944.7487-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/hwmon/ibmpowernv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 0e525cfbdfc5..a750647e66a4 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -186,7 +186,7 @@ static void make_sensor_label(struct device_node *np,
 	u32 id;
 	size_t n;
 
-	n = snprintf(sdata->label, sizeof(sdata->label), "%s", label);
+	n = scnprintf(sdata->label, sizeof(sdata->label), "%s", label);
 
 	/*
 	 * Core temp pretty print
@@ -199,11 +199,11 @@ static void make_sensor_label(struct device_node *np,
 			 * The digital thermal sensors are associated
 			 * with a core.
 			 */
-			n += snprintf(sdata->label + n,
+			n += scnprintf(sdata->label + n,
 				      sizeof(sdata->label) - n, " %d",
 				      cpuid);
 		else
-			n += snprintf(sdata->label + n,
+			n += scnprintf(sdata->label + n,
 				      sizeof(sdata->label) - n, " phy%d", id);
 	}
 
@@ -211,7 +211,7 @@ static void make_sensor_label(struct device_node *np,
 	 * Membuffer pretty print
 	 */
 	if (!of_property_read_u32(np, "ibm,chip-id", &id))
-		n += snprintf(sdata->label + n, sizeof(sdata->label) - n,
+		n += scnprintf(sdata->label + n, sizeof(sdata->label) - n,
 			      " %d", id & 0xffff);
 }
 
-- 
2.16.4

