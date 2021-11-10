Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C4744BFDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 12:08:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq2CN5pJ9z30JT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 22:08:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq2By011Sz2xF1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 22:08:08 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mklSK-0008OK-7f; Wed, 10 Nov 2021 12:07:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mklSF-0003Ho-CR; Wed, 10 Nov 2021 12:07:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mklSF-0007zq-BI; Wed, 10 Nov 2021 12:07:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/83xx/mpc8349emitx: Drop unused variable
Date: Wed, 10 Nov 2021 12:07:39 +0100
Message-Id: <20211110110739.1072634-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110003932.51a605ef@canb.auug.org.au>
References: <20211110003932.51a605ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=gSst9frSMEJRmdgEya61bfMULKZshiMWLn98FfLVCn8=;
 m=Fbao/+rz8xilwUXAF6WItr5ywawUgcnW5DOIoeSVYmY=;
 p=PKHD2lWw7Zr0KD5Owq95yP+Lwwx79SyNuNHqaqD/Kxs=;
 g=2414828dbfa5ef33b71fce95b91fecf6e5b5689c
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGLp/cACgkQwfwUeK3K7AlssQf9GGX
 BAN+hvpcg58ZnfHHXSYipGockog4yTEC0b8CDFYD/ZdRXZFhfs4eRpa0Xs8Zn9z7G5f1sGKTWZctL
 A4IDQTvmboOyWLr3qDLxKf44Wvz+xrHbqhOD7FWVMrLoaxf13DKJMndMCDpN9eHBTAVyR9VA9Z8LY
 1yxaTsOkDgBMc5O7zjbVRMPUx5XdFSjXahK1dJYRizZToRI/LtgD3AcEdWfBHdUzviZeQbw1woXdR
 wx4q95jMiU4Ux0AAxkjpIcdS9fy70wCwex6EH5ksTL6RLWOx7rLa8Ev6KKzDe7QQd4fi/RX/xPQNx
 OhYDwRtRq53LOuW3UyZig5/SjrgajxQ==
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Paul Mackerras <paulus@samba.org>,
 kernel@pengutronix.de, Linux Kernel Functional Testing <lkft@linaro.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 5d354dc35ebb ("powerpc/83xx/mpc8349emitx: Make
mcu_gpiochip_remove() return void") removed the usage of the variable
ret, but failed to remove the variable itself, resulting in:

	arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c: In function ‘mcu_remove’:
	arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c:189:6: error: unused variable ‘ret’ [-Werror=unused-variable]
	  189 |  int ret;
	      |      ^~~

So remove the variable now.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index bb789f33c70e..a38372f9ac12 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -186,7 +186,6 @@ static int mcu_probe(struct i2c_client *client)
 static int mcu_remove(struct i2c_client *client)
 {
 	struct mcu *mcu = i2c_get_clientdata(client);
-	int ret;
 
 	kthread_stop(shutdown_thread);
 
-- 
2.30.2

