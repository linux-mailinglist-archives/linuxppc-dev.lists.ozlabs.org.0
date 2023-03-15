Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB36BB6FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 16:08:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcDLS1m6Fz3cdX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 02:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcDKv5Ss3z2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 02:08:17 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-00076k-Ax; Wed, 15 Mar 2023 16:08:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-004KUH-UP; Wed, 15 Mar 2023 16:07:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-0057cP-L6; Wed, 15 Mar 2023 16:07:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 010/173] ALSA: ppc/powermac: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:05:02 +0100
Message-Id: <20230315150745.67084-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Nv0fFDdpMsYv/AziGAvneOUwDP6WrEsgaTtZmnVlKCs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1Fc2m0HdG8hA2w0W66WSSsQN5kZZ2uuzZom b2v/sqUuJeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdRQAKCRDB/BR4rcrs CZ0jCACPrpIlHkrSaBq80LSctZcXy1yzAvLgskca4LBO4LBxyHTTfFqyTugrTL1GHnkHXn20Yd3 qNiV7pzR8UaVog2UzIuYKI/Gi1m2RpaEjbKH1DiowL6BhptZtU2lpFdSarRMoTqSQzhB+mRNSlQ 1i4INPcYOTV4qgeWvJ9WF2kVUTWDx97fFyM/EXzloZXvgcZ6naAHbsep49lw9jSyKf0u615E3Hs CO6gHhimXOCTNEWaRcapCulnRlma6ioLO2QYKmyGdY9hg73FWmMcfzbu9caNUa4Xfkvpd4cof8F /fcHSV3XnyjSoJgJXTbPwrfr7wt8waK16GdZ5ZTLI+tbA/mO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
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
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/ppc/powermac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index db414b61157e..e17af46abddd 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -130,10 +130,9 @@ static int snd_pmac_probe(struct platform_device *devptr)
 }
 
 
-static int snd_pmac_remove(struct platform_device *devptr)
+static void snd_pmac_remove(struct platform_device *devptr)
 {
 	snd_card_free(platform_get_drvdata(devptr));
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -161,7 +160,7 @@ static SIMPLE_DEV_PM_OPS(snd_pmac_pm, snd_pmac_driver_suspend, snd_pmac_driver_r
 
 static struct platform_driver snd_pmac_driver = {
 	.probe		= snd_pmac_probe,
-	.remove		= snd_pmac_remove,
+	.remove_new	= snd_pmac_remove,
 	.driver		= {
 		.name	= SND_PMAC_DRIVER,
 		.pm	= SND_PMAC_PM_OPS,
-- 
2.39.2

