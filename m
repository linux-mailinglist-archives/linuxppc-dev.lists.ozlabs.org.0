Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E3829E19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 17:00:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9CDy5y3Sz3cYj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 03:00:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1001 seconds by postgrey-1.37 at boromir; Thu, 11 Jan 2024 02:59:54 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9CDV1XQZz30g6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 02:59:54 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNajS-0007JL-EX; Wed, 10 Jan 2024 16:43:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNajS-001jUk-1Y; Wed, 10 Jan 2024 16:43:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNajR-006c4X-38;
	Wed, 10 Jan 2024 16:43:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 5/7] macintosh: windfarm_pm81: Convert to platform remove callback returning void
Date: Wed, 10 Jan 2024 16:42:52 +0100
Message-ID: <725a17c7fb1bbe6d827b38bbee40494aebf9c06d.1704900449.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1704900449.git.u.kleine-koenig@pengutronix.de>
References: <cover.1704900449.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=JIumVAh3vPYREF//u7bkB7EN6JDIcq7JQV0/55+tgig=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlnrr9cGJf6iwan3BelkYvjxz1rORpYhL3KQpVA H9WZZ5TI1WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZZ66/QAKCRCPgPtYfRL+ TriLB/wMDX8j2YkG3CwhSFKfGseVipaO6qkUR7ahpC0Up2CnkrqOwZAobIsf3dw0Y/01I0ZNjtc 8+8LchW5znSHRLxrlQBxaCoeN1dKsRNtzRRkf+vHnAQ53cG9J3OLv7hBL1J+2WtgT6nrZ8VjLqX U1RKwAMSzpK1UzOZs1BUrfpXhNQNigflasKZUFYTfDP/uHGRtATepZ/SNqMKG0XZ9kSbVVrDEcj uNzXxdWCArERgcm9ufu+623M897Wzo6B46xttPUtXAdDQ/PsS2x6iITCaoSlbxFiffqIswxbLyE 0BzKDEr3DmmT0xNnzNC2zLxFrOt+ZszHMFOat94qUpmNvHGT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/macintosh/windfarm_pm81.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/macintosh/windfarm_pm81.c b/drivers/macintosh/windfarm_pm81.c
index 257fb2c695c5..404d2454e33d 100644
--- a/drivers/macintosh/windfarm_pm81.c
+++ b/drivers/macintosh/windfarm_pm81.c
@@ -724,7 +724,7 @@ static int wf_smu_probe(struct platform_device *ddev)
 	return 0;
 }
 
-static int wf_smu_remove(struct platform_device *ddev)
+static void wf_smu_remove(struct platform_device *ddev)
 {
 	wf_unregister_client(&wf_smu_events);
 
@@ -761,13 +761,11 @@ static int wf_smu_remove(struct platform_device *ddev)
 	/* Destroy control loops state structures */
 	kfree(wf_smu_sys_fans);
 	kfree(wf_smu_cpu_fans);
-
-	return 0;
 }
 
 static struct platform_driver wf_smu_driver = {
-        .probe = wf_smu_probe,
-        .remove = wf_smu_remove,
+	.probe = wf_smu_probe,
+	.remove_new = wf_smu_remove,
 	.driver = {
 		.name = "windfarm",
 	},
-- 
2.43.0

