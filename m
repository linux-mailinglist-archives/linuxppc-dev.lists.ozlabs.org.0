Return-Path: <linuxppc-dev+bounces-3395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4C9D07F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 03:49:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsBsc2DZfz2yNc;
	Mon, 18 Nov 2024 13:49:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731895667;
	cv=none; b=DiosHoNAvpHqj1CB9vaAMIpYHz6+KJ2dSuH8DkK7Cf+U0TXfeY0wrKf6mXn+jR4trAgtd2x+SMqiCRg23+ijyNGui6g/dA5ZyFxtHW7fmJpgxxPF5TWMlANNbGgatirGp2vNAWRrKxO2e/98JNiCW3jVHnMXaNn7WKeCkQGMZDjaxSwyK7TOXu6We2byX8kkFygMB9jZaJdL3h+9WaokVNs+R2C6tdoehDZ2bSvjmL6emjxhJXlN9nzDNdoYA+t7abNC7NP4hR1QhBxzzCpYnkAluBJI6bqA9kaQTXWjcUIhpBhtvtniRBQRt2cuG0vvaZ+Ef64M5hevkULkO0NtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731895667; c=relaxed/relaxed;
	bh=3c5kGtihoYjJWR2eZQhOUJs4NHrVsB0ajfcLsfp/Y2o=;
	h=From:To:Cc:Subject:Date:Message-Id; b=k2Ay30Mj8w7DA0SOOLsy7ik4v6hJ1CdDjiJkZwLguxcBV8x+ELEHt052PTwK8qcBSTDC6L9ZH4ULnT0MRfGKRB6HyCVYjyfxd/ER0DI958oiG+SU8Dlow4uafKPfoYx2FnxpLQy5zvQfDARkkjrXZ2nex5WFG9+B2H7N0yU9mMQymua+L8CPkg34Z4caJItIItkh+SfzOZ1xo0t24SMF+i1qx5R3p1/goew+sFGKWHVItJQw1Kj/xH2yki0ynNSB7lpVl0kilvaY6GBl8LAEvQCgDUX4N3gzsf4IIblNd6DwVx5uMjJMzfOU4knvCk/wt+gSEoCo1sZZ2gUXTTxodA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass (client-ip=111.22.67.135; helo=cmccmta2.chinamobile.com; envelope-from=zhujun2@cmss.chinamobile.com; receiver=lists.ozlabs.org) smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmss.chinamobile.com (client-ip=111.22.67.135; helo=cmccmta2.chinamobile.com; envelope-from=zhujun2@cmss.chinamobile.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 182 seconds by postgrey-1.37 at boromir; Mon, 18 Nov 2024 13:07:45 AEDT
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xs9xs3Gy9z30Vp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 13:07:45 +1100 (AEDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee7673aa0b46bd-3b6da;
	Mon, 18 Nov 2024 10:04:37 +0800 (CST)
X-RM-TRANSID:2ee7673aa0b46bd-3b6da
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee1673aa0b4c81-a4d67;
	Mon, 18 Nov 2024 10:04:37 +0800 (CST)
X-RM-TRANSID:2ee1673aa0b4c81-a4d67
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] macintosh: Fix spelling mistake "toogle" to "toggle"
Date: Sun, 17 Nov 2024 18:04:34 -0800
Message-Id: <20241118020434.10971-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

There is a spelling mistake, Please fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/macintosh/adbhid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index b2fe7a3dc471..943a7123786a 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -604,7 +604,7 @@ adbhid_buttons_input(unsigned char *data, int nb, int autopoll)
 
 			case 0x7f:
 			case 0xff:
-				/* keypad overlay toogle */
+				/* keypad overlay toggle */
 				break;
 
 			default:
-- 
2.17.1




