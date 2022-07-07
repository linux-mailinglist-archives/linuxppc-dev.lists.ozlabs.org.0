Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80738569A4B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 08:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdmPq3n7lz3cgt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:16:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdmNw6TrZz3bqT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 16:15:26 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kn5-0005KE-8q; Thu, 07 Jul 2022 08:15:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kmv-004u7H-7Z; Thu, 07 Jul 2022 08:15:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kmy-003VhD-0r; Thu, 07 Jul 2022 08:15:00 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/platforms/83xx/suspend: Remove write-only global variable
Date: Thu,  7 Jul 2022 08:14:41 +0200
Message-Id: <20220707061441.193869-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
References: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; h=from:subject; bh=+kq3VFdxxpguzDW2S0STGCQ5b+9jX5fKttqjSBAZAuo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBixnnO2LAxBb+chMHVg2YZ+jmpBzUqH+U1E3/8GtlK vGq+/ueJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsZ5zgAKCRDB/BR4rcrsCaeXB/ 9XS4gNPBKWXjNkV8usqg7gA2CBnmdlq2n/OXvOVBnHG3fjbCT5gcXCStGKajecZYDuwwZj97ABhj57 yhRoBikDkfrwPCKLVf2TZ65a1ysodY3W8bgZWn/gqT8x56mDunZVSWMJt97XOpjHLb0PUpdlJAX2SL /ZvJD0kAV5nFYV/SGNvt8ikI1Vx99SObQzt3BrBBHLuFV2jrvttZtSKsDtsQ/+wnie2FiR+U3ST18d gv1N9JMhQ5clFniF29RnQcxhJBdc5nDhbiZ/7QT9bi5mKYwGAhGQFfh0tVC7+IJTV6nvz2n81O3adm oTFj/EwOg3YBGSyaqydP3iQDuxqbOW
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

pmc_dev is only assigned in .probe(), otherwise the variable is unused.
So drop this pointer that serves no purpose.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/83xx/suspend.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index 309f42ab63d4..3fa8979ac8a6 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -100,7 +100,6 @@ struct pmc_type {
 	int has_deep_sleep;
 };
 
-static struct platform_device *pmc_dev;
 static int has_deep_sleep, deep_sleeping;
 static int pmc_irq;
 static struct mpc83xx_pmc __iomem *pmc_regs;
@@ -356,7 +355,6 @@ static int pmc_probe(struct platform_device *ofdev)
 
 	has_deep_sleep = type->has_deep_sleep;
 	immrbase = get_immrbase();
-	pmc_dev = ofdev;
 
 	is_pci_agent = mpc83xx_is_pci_agent();
 	if (is_pci_agent < 0)
-- 
2.36.1

