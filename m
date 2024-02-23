Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D228619D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 18:34:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThHFP28wQz3vkp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 04:34:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThHD65rpSz3ddR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 04:33:26 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQH-0000QF-AC; Fri, 23 Feb 2024 18:33:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQG-002Sz9-92; Fri, 23 Feb 2024 18:33:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQG-00AWsZ-0b;
	Fri, 23 Feb 2024 18:33:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/2] usb: gadget: fsl: Two improvements
Date: Fri, 23 Feb 2024 18:33:14 +0100
Message-ID: <cover.1708709120.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=458; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=PLX+hdp+BdIs151kSIpgAK1UkcilNhF+mhdP7FGTVmE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2NbaST6Q41NfBJbFNIvBJOHHuZD4moZJp4OSs beOGlG9xN2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdjW2gAKCRCPgPtYfRL+ TupoCAC2JTcvzjnj9HAUWAvyo1YgoaKKUbsOb7UvaCKwDCyrvlUxuwh6bWGGtHR0G8Jyst6QzDX nqWDmBnVH5jPMMx8Pown97Brzf0X1HSznsXugbkZiLUydq+QznBpZb8pFPIyUGWvxqzvhC/2i8R Pnaj9tSfNNJaWOXvyb3FZXrVU4O1hbFodl21XaVIRd6lJUGQo/zjDzsaLXhpUbuGlDyMLGW8cq9 z0BlqdflLmZcDf3iPRtOInPeTQlesEab3vFABvwkQGnV+p1M3pH89d2pAsg/qIjpCr09K2Ppce8 Xa1lCZW/whaKw+Xjg5VN7QIuUbz2qO2B5REQGTzQy/wiYRLm
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
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

here come two patches that I created while debugging an issue around USB
on MPC8313.

Best regards
Uwe

Uwe Kleine-König (2):
  usb: gadget: fsl: Add of device table to enable module autoloading
  usb: gadget: fsl: Increase size of name buffer for endpoints

 drivers/usb/gadget/udc/fsl_udc_core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
-- 
2.43.0

