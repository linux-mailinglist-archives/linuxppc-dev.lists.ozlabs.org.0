Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8D2C6CE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 22:31:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjSVL53FNzDsNW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 08:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=lgo@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
X-Greylist: delayed 1178 seconds by postgrey-1.36 at bilbo;
 Sat, 28 Nov 2020 02:44:03 AEDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjJnv2TGWzDrfM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 02:44:03 +1100 (AEDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1kifb3-0002Iv-2c; Fri, 27 Nov 2020 16:23:41 +0100
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <lgo@dude03.red.stw.pengutronix.de>)
 id 1kifax-006ATZ-FC; Fri, 27 Nov 2020 16:23:35 +0100
From: Leonard Goehrs <l.goehrs@pengutronix.de>
To: u.kleine-koenig@pengutronix.de, geoff@infradead.org, perex@perex.cz,
 tiwai@suse.com, mpe@ellerman.id.au
Date: Fri, 27 Nov 2020 16:22:59 +0100
Message-Id: <20201127152259.1470079-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
References: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH] ALSA: ppc: remove redundant checks in PS3 driver probe
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Sat, 28 Nov 2020 08:29:37 +1100
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
Cc: alsa-devel@alsa-project.org, paulus@samba.org, kernel@pengutronix.de,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Leonard Goehrs <l.goehrs@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The check for the FW_FEATURE_PS3_LV1 firmware feature is already performed
in ps3_system_bus_init() before registering the driver. So if the probe
function is actually used, this feature is already known to be available.

The check for the match id is also superfluous; the condition is always
true because the bus' match function (ps3_system_bus_match()) only
considers this driver for devices having:
dev->match_id == snd_ps3_bus_driver_info.match_id.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Leonard Goehrs <l.goehrs@pengutronix.de>
---
 sound/ppc/snd_ps3.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 58bb49fff184..b6e4aa3df870 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -896,11 +896,6 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
 	u64 lpar_addr, lpar_size;
 	static u64 dummy_mask;
 
-	if (WARN_ON(!firmware_has_feature(FW_FEATURE_PS3_LV1)))
-		return -ENODEV;
-	if (WARN_ON(dev->match_id != PS3_MATCH_ID_SOUND))
-		return -ENODEV;
-
 	the_card.ps3_dev = dev;
 
 	ret = ps3_open_hv_device(dev);
-- 
2.20.1

