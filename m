Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F97435FE0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 13:03:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZl3B4rxzz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 22:03:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZl2j5pgVz2yJN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 22:03:24 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdVqc-0000sw-J5; Thu, 21 Oct 2021 13:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdVqW-0008Fz-N0; Thu, 21 Oct 2021 13:02:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdVqW-0001H1-Lz; Thu, 21 Oct 2021 13:02:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: mpc8349emitx: Make mcu_gpiochip_remove() return void
Date: Thu, 21 Oct 2021 12:56:57 +0200
Message-Id: <20211021105657.72572-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=zx5dixkpLFSM2hK3wP599mrmFhXpxTFquXqGP41jcac=;
 m=O47PsiIaGcIZZRi30PWG+9eQ93TvnlRoEKaDLAG0RfU=;
 p=xMtLbrVM1tDsxs4jsSwDO9VftnCVQDTB4u4l50gL54U=;
 g=260d7a9eea9493253b59acfce64637e6c50b5728
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFxR3EACgkQwfwUeK3K7AlGKQf/aqH
 I/RFKJQpp5iG9xaYTANH5qiYHuSL0OomJXwCz11NkN9QtEHEoVE5DtptY5W+IwRJivPro8Qxn0p/5
 7NIzSyavFTf5OEcXtSE2xyat879aJuAzXDNm28Bnaj2S+VHywCr1Ry74rDDgN5D3QCYdNhzS/5drX
 JGGYEkDW8lJdi73T713HYX6jvZoqDursZCnTxMhxTCAFhhMDSDTS4UkqZ9UGgE+geHP1OU+CLamiS
 +ySjZoNP3v4bpiN/1zxXGY9aonLq5/Lg2AXsXp2dtHkd7vb3PudyZ3z3hai+/LPOBfdEOHvlBBiPu
 cnn7pgHIeq393ZAG9ZZWHPAPyYX4VfA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Up to now mcu_gpiochip_remove() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 409481016928..bb789f33c70e 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -135,11 +135,10 @@ static int mcu_gpiochip_add(struct mcu *mcu)
 	return gpiochip_add_data(gc, mcu);
 }
 
-static int mcu_gpiochip_remove(struct mcu *mcu)
+static void mcu_gpiochip_remove(struct mcu *mcu)
 {
 	kfree(mcu->gc.label);
 	gpiochip_remove(&mcu->gc);
-	return 0;
 }
 
 static int mcu_probe(struct i2c_client *client)
@@ -198,9 +197,7 @@ static int mcu_remove(struct i2c_client *client)
 		glob_mcu = NULL;
 	}
 
-	ret = mcu_gpiochip_remove(mcu);
-	if (ret)
-		return ret;
+	mcu_gpiochip_remove(mcu);
 	kfree(mcu);
 	return 0;
 }
-- 
2.30.2

