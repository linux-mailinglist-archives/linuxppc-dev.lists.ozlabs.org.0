Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E42F4D34D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 17:31:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDHlH6l12z3bff
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 03:31:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lqMrE7Ln;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lqMrE7Ln; dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDHkc2pFsz3bN9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 03:31:03 +1100 (AEDT)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CB358CD9B5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 16:23:40 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D4D2A40005;
 Wed,  9 Mar 2022 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646843001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjKxC/kEurfp4S2xChG2/x2RBeO/yBKp4HZZXE2h9gg=;
 b=lqMrE7Ln2IQvWzVGzL4Xbzp2A/QaqEjKH6igU0H3FRipUvvYwtK49WGHwOIIJGHwiCSosT
 ZCKZc9cVVVLgXd4+VGvsT2fYUocKU8wL03zCfTinXL8lhct1A0CEJ684oeLwS3AkfiZlMt
 QT8/IJCne2FO/Tmu9mIwziuIX2CxRb9hgBIi73Pg0TuXfaL+D/S48cx6aINAXSyN5kj3o7
 EPNZTfay3XtcJdR2AYcL8p/o4zA+FtaHxjhT0oA9q2KqNqbqkCKWlCdeYeV+Jb3EPJWFEV
 55tWobElvrLCWg/GZyaPmfDYgf7FSGWmA8UvSQCKNx6YW/au0h7ye/5coRHrKQ==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 07/29] rtc: opal: switch to RTC_FEATURE_UPDATE_INTERRUPT
Date: Wed,  9 Mar 2022 17:22:38 +0100
Message-Id: <20220309162301.61679-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220309162301.61679-1-alexandre.belloni@bootlin.com>
References: <20220309162301.61679-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-rtc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stop using uie_unsupported and clear RTC_FEATURE_UPDATE_INTERRUPT instead.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-opal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-opal.c b/drivers/rtc/rtc-opal.c
index f8f49a969c23..ad41aaf8a17f 100644
--- a/drivers/rtc/rtc-opal.c
+++ b/drivers/rtc/rtc-opal.c
@@ -250,7 +250,7 @@ static int opal_rtc_probe(struct platform_device *pdev)
 	rtc->ops = &opal_rtc_ops;
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_0000;
 	rtc->range_max = RTC_TIMESTAMP_END_9999;
-	rtc->uie_unsupported = 1;
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
 	return devm_rtc_register_device(rtc);
 }
-- 
2.35.1

