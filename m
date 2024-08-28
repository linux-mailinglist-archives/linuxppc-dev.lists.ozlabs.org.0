Return-Path: <linuxppc-dev+bounces-668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 160699624B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0nZ6qjsz2yYn;
	Wed, 28 Aug 2024 20:21:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.51.26.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724837052;
	cv=none; b=Z2N09qV4MGBRmU5oZh/z2sa2gZlICUaeeWylaOW/Q+fArLTL79WsoJKllWWAYlEpTSgojh8hlmDVy9kXuAK0eGbjbfAhR2LmvwoiW5s6g5g0km0FU8X8peskIoSIdh/XR5Xy+zXtVmpax9byMvu3v92C1GTfIwqOfhrivzxTEVQzyxWNuFOtZKJgZ4cK6iqRHfWAQiqDWxRXnDCkYKq1j/79/xn27+8A7+86P80CgekOL0sLRmtXmZk8L5cyrjyJAR6nO563QZHDlj3KXzSJ8T3opP9+lt2tHnntLzhf1uqv/MWv6OeNe21ZQiXKIrbMPgtrOrrFBKlZmwtUQACBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724837052; c=relaxed/relaxed;
	bh=PQ+rDvFX7Yv9E6zoeDFtGBkxV+8lMyG12FpyFRaA/GU=;
	h=X-Greylist:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:tUid:X-Abuse-Reports-To:Abuse-Reports-To:
	 X-Complaints-To:X-Report-Abuse-To; b=GbUHc7rOQ6dm1vpfj8yAU708MDnKqnQrOZrm14uW+0TFn3P1yZwDsT5F2BTBQmo7kPJrAuh9wPB1rrNrzqY9QVWhDXsaNBUi0oURCS+KbMM4f8bweE0iBA8+zr3NLN1jZoJwkMJ1TnJ+LHcLUuQkrZeViEL5Zs9EPSIWImQEn7q8kjbZM+XtOEuNbKfXkVvTBhfBJa6Pr3CtRbZTcCXSi3pc1pEzzVuNTvUwiL02zqwyEfR34afTqS4mQJBQN/scfINBEyT9MKLQl7+VD2r+f9SG76aGH2OnO3SOlT7K74OuUiH7YeD/XN9Q4TUCt7OG4Plgqd8ahA5rICGG2i1wNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass (client-ip=210.51.26.146; helo=unicom146.biz-email.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org) smtp.mailfrom=inspur.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.26.146; helo=unicom146.biz-email.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 125 seconds by postgrey-1.37 at boromir; Wed, 28 Aug 2024 19:24:10 AEST
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtzWG6PSVz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 19:24:10 +1000 (AEST)
Received: from unicom146.biz-email.net
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id ZJX00033;
        Wed, 28 Aug 2024 17:20:33 +0800
Received: from localhost.localdomain (10.94.17.16) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.39; Wed, 28 Aug 2024 17:20:26 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <robh@kernel.org>, <miquel.raynal@bootlin.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>
CC: <christophe.leroy@csgroup.eu>, <aveen@kernel.org>,
	<tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] mtd: powernv: Add check devm_kasprintf() returned value
Date: Wed, 28 Aug 2024 17:20:25 +0800
Message-ID: <20240828092025.125531-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.17.16]
tUid: 2024828172033fd7f0fd230a7eb5e5aca410ad7ab19b9
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure but this
returned value is not checked.

Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/mtd/devices/powernv_flash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 66044f4f5bad..10cd1d9b4885 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -207,6 +207,9 @@ static int powernv_flash_set_driver_info(struct device *dev,
 	 * get them
 	 */
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
+	if (!mtd->name)
+		return -ENOMEM;
+
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_WRITEABLE;
 	mtd->size = size;
-- 
2.31.1


