Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C557569A4A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 08:15:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdmPP5SGRz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:15:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdmNw6RDgz3bmT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 16:15:26 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kn5-0005KD-8q; Thu, 07 Jul 2022 08:15:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kmv-004u7E-2G; Thu, 07 Jul 2022 08:15:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kmx-003VhA-Rs; Thu, 07 Jul 2022 08:14:59 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] powerpc/platforms/83xx/suspend: Prevent unloading the driver
Date: Thu,  7 Jul 2022 08:14:40 +0200
Message-Id: <20220707061441.193869-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
References: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; h=from:subject; bh=az+dgZFzA1lp0DPX1aXV3+LF0uGOPwB3jFVwvRVuaWc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBixnnKFYu0Pi1KK8Y70vhiJLhyIKK7nzakC2+mfU7G QV+aXZ2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsZ5ygAKCRDB/BR4rcrsCYm4CA CdTS2sYKI1NdFkCWpn51nf7Y4V8UittjsgKxILI+VKeVAtakTEvL3IJGGx3/jNocIOw5HZ83bDvroF sACV/sI4X0GbJj/poTbsiKF++c3l8KwCfuUVPqx5FLqP8mYZpDFjb/srESTT/UVLRtkURfKZLMOD3P 701RPHIZN/gGPNpDlhNJYqsxXUtI88fsRnLqf7n10fAaQzqaXyiw/qiAceyk0IG1yJn/EyFGaobOck lLXyszCPk3aklRFJ5luj+grsGzflq6wYfacQ6ALCfXdrejE8pFd0v8gEV1c0uhKIqmlKjg7WxujHBg 8FLGPAYyEJM/OIHgzh2afP0fbz7lkL
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
Cc: kernel@pengturonix.de, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Returning an error in .remove() doesn't prevent a driver from being
unloaded. On unbind this only results in an error message, but the
device is remove anyhow.

I guess the author's idea of just returning -EPERM in .remove() was to
prevent unbinding a device. To achieve that set the suppress_bind_attrs
driver property and drop the useless .remove callback.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/83xx/suspend.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index 30b7700a2c98..309f42ab63d4 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -421,18 +421,13 @@ static int pmc_probe(struct platform_device *ofdev)
 	return ret;
 }
 
-static int pmc_remove(struct platform_device *ofdev)
-{
-	return -EPERM;
-};
-
 static struct platform_driver pmc_driver = {
 	.driver = {
 		.name = "mpc83xx-pmc",
 		.of_match_table = pmc_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = pmc_probe,
-	.remove = pmc_remove
 };
 
 builtin_platform_driver(pmc_driver);
-- 
2.36.1

