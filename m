Return-Path: <linuxppc-dev+bounces-3701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99C29E1606
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 09:42:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Z014j69z2ytp;
	Tue,  3 Dec 2024 19:42:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733215329;
	cv=none; b=XXivIfSPYLOFlg4mX98WrvNMKFq++iZrQ1Hh8fPC45JFsBI/G4UdH2yfq9SecN84e51z7iDvPeRiIKCSOR8lJ5J052FXDkguAmMvgizCDNaKBdB2TDAkrJ305n7RBfmpmgIRYsg9j/rRyL8Or7D5MDtZ+Myu12zbQ439LWoBftpkGwDFpPWfjXvfgZgtcELqrMHs5LiJBuqWsVQBBPephRLICrTgK69eGy3uXwKmwoIHUQMc7yHN/24zn2pZ7lEct1sqmUoSFqY2YUY8Bjyue41n/D0MQGjaTQCF5mvfMImgFR7nHqvoyHePsoD54hHsCtD3qXrCVcazuCrcEUS+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733215329; c=relaxed/relaxed;
	bh=3c5kGtihoYjJWR2eZQhOUJs4NHrVsB0ajfcLsfp/Y2o=;
	h=From:To:Cc:Subject:Date:Message-Id; b=mYbKhjVncLfxeDz3bzoHPYXfuHZFiLtIciWyFnrLQYUqswqn4vtS2262zTe+GLCx1U+zYeq0jc9MceKtViw+b3PEkEZiSczHVTKRyPX/+hVG/KhCkfjdHEg6rFj0Z24YAHG87YA4qQIp8ASjqXRCqHAmM7BF4PbFhUuv5K66l+vwPOMOneI9t6uW6PGIKFvZNcJM3rmTKNc+1PKHVaqFyikwkHPfHel+ZtQ4JdbuZ2ToYggGELaPXFrJGGpA3p8mt2t4oE0lv2FfNP39RvCQiFB4UTeac9TuP2xKLcKVB7SleFurViKZZ+SlQF5UUBqBDMlfRNBDSlrA8ohT2YSoiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass (client-ip=111.22.67.139; helo=cmccmta3.chinamobile.com; envelope-from=zhujun2@cmss.chinamobile.com; receiver=lists.ozlabs.org) smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmss.chinamobile.com (client-ip=111.22.67.139; helo=cmccmta3.chinamobile.com; envelope-from=zhujun2@cmss.chinamobile.com; receiver=lists.ozlabs.org)
Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Yzz654Pz2yZ1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 19:42:06 +1100 (AEDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee9674ec45a6de-c76f5;
	Tue, 03 Dec 2024 16:42:02 +0800 (CST)
X-RM-TRANSID:2ee9674ec45a6de-c76f5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee2674ec459674-27820;
	Tue, 03 Dec 2024 16:42:02 +0800 (CST)
X-RM-TRANSID:2ee2674ec459674-27820
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [RESEND] macintosh: Fix spelling mistake "toogle" to "toggle"
Date: Tue,  3 Dec 2024 00:42:00 -0800
Message-Id: <20241203084200.7350-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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




