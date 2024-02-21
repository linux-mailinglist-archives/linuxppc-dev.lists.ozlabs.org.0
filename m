Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40085E199
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 16:42:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg0rt0NGNz3vmV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 02:42:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg0q40wB4z3cV3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 02:40:47 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi4-0003mR-Rd; Wed, 21 Feb 2024 16:40:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi4-0024BB-EE; Wed, 21 Feb 2024 16:40:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi4-008uvC-16;
	Wed, 21 Feb 2024 16:40:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 6/6] powerpc: pmi: Convert to platform remove callback returning void
Date: Wed, 21 Feb 2024 16:40:20 +0100
Message-ID: <3201daed6d19c01ee0ee72e0f9302a38ecef3577.1708529736.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=XZZ0u1HpHZgtvd38c/qPcUUjJJhYkQUV4tNWievFkIQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl1hlmpkDFEhj9U+HQkWwMjneYJmJZy/s0e10wT bmcdDmVTEiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdYZZgAKCRCPgPtYfRL+ TrrFB/9maiOkXKmgvla036IwAEM+s/J15RyXfTg5oSAHkF4DDGKONdhHyL5xadkjOKHbdL3BJVl KZJuin4ZQrBrwb48G/rCMaeWiTSfRbDicbf/+fnpZuvBOpAPNHeim2v5ZR6bhh3zuaNsxcOshtH MCbmIyZMeAnx0jazFUrLugg3eg2tfKtzjY0R9QBJ0Kkpb7A2bh7kUGLChBQinB5RRYV9JVV76Qq zD8uHzmhvV+SvPJeZt5R7Coj2zDp15KB29CaxEuQJNQWVKsBuVV9T2/DPknodzW+6JPsCAISl0W dFoqiVIH6cFb+/fseCwqbI+nyM5HGUW5n2qIDv/Vgz4uUsoV
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
Cc: Rob Herring <robh@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
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
 arch/powerpc/sysdev/pmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/pmi.c b/arch/powerpc/sysdev/pmi.c
index fcf8d1516210..737f97fd67d7 100644
--- a/arch/powerpc/sysdev/pmi.c
+++ b/arch/powerpc/sysdev/pmi.c
@@ -173,7 +173,7 @@ static int pmi_of_probe(struct platform_device *dev)
 	return rc;
 }
 
-static int pmi_of_remove(struct platform_device *dev)
+static void pmi_of_remove(struct platform_device *dev)
 {
 	struct pmi_handler *handler, *tmp;
 
@@ -189,13 +189,11 @@ static int pmi_of_remove(struct platform_device *dev)
 
 	kfree(data);
 	data = NULL;
-
-	return 0;
 }
 
 static struct platform_driver pmi_of_platform_driver = {
 	.probe		= pmi_of_probe,
-	.remove		= pmi_of_remove,
+	.remove_new	= pmi_of_remove,
 	.driver = {
 		.name = "pmi",
 		.of_match_table = pmi_match,
-- 
2.43.0

