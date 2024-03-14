Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C987BCE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 13:34:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Bd4SJ205;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwRfC4sfZz3vXZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 23:34:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Bd4SJ205;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwRdV1m6yz2xSl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 23:34:02 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 50D1BE000B;
	Thu, 14 Mar 2024 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710419632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vmS6pTNpvnT/R21GkQzH7oBRj9ygun2hL3GsI2Prl7k=;
	b=Bd4SJ2052tDvqmPvwvYDCWFxDOPB/uPi0aNi9qDO27H3vwbviwTbcoJHZOzjFbK+CjEU7X
	wB9bNmnYTzmhxegXTFhGucB/tqAB6sqmnT7QRhpGkdShDRykrBqNTAyzBbHu+PCJ/jUsDB
	0bmcsLfMSe5AJtreGLtuzOo2zg/xa0gIfiz2RjJMUNu91ufYz06T+erwYijk3HH/wnEYz7
	KJxBFx4fCqkN0aE1wtWWYJpKMvqq5Dss6mNZoOMpxsNKlK3K1JVB84dGFLNQ3tN85+phO5
	Q4ybimPoXRvfNhQMWJrRmDMNZor+f7DA+lOxGgtCK2ybxVygKtleWTlvr6da3w==
From: Herve Codina <herve.codina@bootlin.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] net: wan: fsl_qmc_hdlc: Fix module compilation
Date: Thu, 14 Mar 2024 13:33:46 +0100
Message-ID: <20240314123346.461350-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ratheesh Kannoth <rkannoth@marvell.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The fsl_qmc_driver does not compile as module:
  error: ‘qmc_hdlc_driver’ undeclared here (not in a function);
    405 | MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
        |                         ^~~~~~~~~~~~~~~

Fix the typo.

Fixes: b40f00ecd463 ("net: wan: Add support for QMC HDLC")
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Closes: https://lore.kernel.org/linux-kernel/87ttl93f7i.fsf@mail.lhotse/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/net/wan/fsl_qmc_hdlc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
index 960371df470a..f69b1f579a0c 100644
--- a/drivers/net/wan/fsl_qmc_hdlc.c
+++ b/drivers/net/wan/fsl_qmc_hdlc.c
@@ -780,7 +780,7 @@ static const struct of_device_id qmc_hdlc_id_table[] = {
 	{ .compatible = "fsl,qmc-hdlc" },
 	{} /* sentinel */
 };
-MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
+MODULE_DEVICE_TABLE(of, qmc_hdlc_id_table);
 
 static struct platform_driver qmc_hdlc_driver = {
 	.driver = {
-- 
2.44.0

