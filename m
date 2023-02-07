Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBDF68E109
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 20:21:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBCfB37RNz3fFy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 06:21:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBCd03Mm6z3cM1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 06:20:02 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTVE-0008RR-Dk; Tue, 07 Feb 2023 20:19:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTV8-003LvI-MN; Tue, 07 Feb 2023 20:19:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTV9-001ewF-5V; Tue, 07 Feb 2023 20:19:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] ALSA: core: Make snd_card_free() return void
Date: Tue,  7 Feb 2023 20:19:07 +0100
Message-Id: <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=O47+Z3xHlEPvA3EkAC8CD1HpeFgOayEc9QZ2VM48II4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj4qQmhDeyRlzDiz4Ho2IBZI1JxNOaUyuQPiafPUYI jyZ4suKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+KkJgAKCRDB/BR4rcrsCdv8B/ 4juquHrXABzHAxXa2jsb+yYy9SbW0eK+ivumKOfnnqAQVI/K9AMWA5Ape2ZQzEyWv+04URf2NpBcyd R062QjReZ/m1EcLyv2VhC+S8x2uLbtrNb4/LOYcjrj520O/pK61dHubzX+sq44tp3gjBHL1hb3BhH8 IS4u4KWYLORwQChPYI5keHujE6MzyDB0PqJJ8zhg7VVvMY3Cl4N/4xiqLzHHPEe2D2SIkft97Dr5vO IjVxJiqZpKa2tB98LGCr5vZaOtfYnYBXHUgl648JTLNYTgObwBJBE0PwsDjPOu981aOA+9F+/e0hNm o/hgb+BmLYrspQNxV9NBkYhSVxwmtw
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
Cc: alsa-devel@alsa-project.org, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function returns 0 unconditionally. Make it return void instead and
simplify all callers accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/sound/core.h      | 2 +-
 sound/core/init.c         | 6 ++----
 sound/pci/hda/hda_tegra.c | 6 ++----
 sound/ppc/snd_ps3.c       | 4 +---
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 21884c979c17..3edc4ab08774 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -288,7 +288,7 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 
 void snd_card_disconnect(struct snd_card *card);
 void snd_card_disconnect_sync(struct snd_card *card);
-int snd_card_free(struct snd_card *card);
+void snd_card_free(struct snd_card *card);
 void snd_card_free_when_closed(struct snd_card *card);
 int snd_card_free_on_error(struct device *dev, int ret);
 void snd_card_set_id(struct snd_card *card, const char *id);
diff --git a/sound/core/init.c b/sound/core/init.c
index 6bb3e2b77971..df0c22480375 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -632,7 +632,7 @@ EXPORT_SYMBOL(snd_card_free_when_closed);
  * Return: Zero. Frees all associated devices and frees the control
  * interface associated to given soundcard.
  */
-int snd_card_free(struct snd_card *card)
+void snd_card_free(struct snd_card *card)
 {
 	DECLARE_COMPLETION_ONSTACK(released);
 
@@ -643,15 +643,13 @@ int snd_card_free(struct snd_card *card)
 	 * the check here at the beginning.
 	 */
 	if (card->releasing)
-		return 0;
+		return;
 
 	card->release_completion = &released;
 	snd_card_free_when_closed(card);
 
 	/* wait, until all devices are ready for the free operation */
 	wait_for_completion(&released);
-
-	return 0;
 }
 EXPORT_SYMBOL(snd_card_free);
 
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 976a112c7d00..c2bf86781894 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -582,12 +582,10 @@ static void hda_tegra_probe_work(struct work_struct *work)
 
 static int hda_tegra_remove(struct platform_device *pdev)
 {
-	int ret;
-
-	ret = snd_card_free(dev_get_drvdata(&pdev->dev));
+	snd_card_free(dev_get_drvdata(&pdev->dev));
 	pm_runtime_disable(&pdev->dev);
 
-	return ret;
+	return 0;
 }
 
 static void hda_tegra_shutdown(struct platform_device *pdev)
diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 631a61ce52f4..8d349231205e 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -1053,9 +1053,7 @@ static void snd_ps3_driver_remove(struct ps3_system_bus_device *dev)
 	 * ctl and preallocate buffer will be freed in
 	 * snd_card_free
 	 */
-	ret = snd_card_free(the_card.card);
-	if (ret)
-		pr_info("%s: ctl freecard=%d\n", __func__, ret);
+	snd_card_free(the_card.card);
 
 	dma_free_coherent(&dev->core,
 			  PAGE_SIZE,
-- 
2.39.0

