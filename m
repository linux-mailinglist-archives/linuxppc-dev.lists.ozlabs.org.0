Return-Path: <linuxppc-dev+bounces-671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5FB9624B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0pW1W8wz2ydR;
	Wed, 28 Aug 2024 20:22:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.51.26.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724837076;
	cv=none; b=UZCWpz3SVMhHStnZSDdS2gjEKbfIgKRev4RYjjQffZCW3oDb8JcBMEB0/9coeIAUPWJP1SuBdz7534Gti47pvlO9jOigYZopnMaod/3Cbetho6wflQJHwvUFMdWh7AKEip9fxA+bNDMWW9MLBay6Hvs8BNeITFpwQqP3L37cL20gHb0Q+LSSQtK3xame6ehTv2ZroXbzlxg4u9sJW3bUtz1AshA5tF9LWVtmIGUdJSLNv5HY03nIYNRETvmmDY4xkcBlHM5DIxLQ0yV3rCtuVnY7O0frXtsIPfzfRtg8Kqi/BfTFPa+CBSixUDdx2kp4wGbSnc6/JK5L5cT1zK++Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724837076; c=relaxed/relaxed;
	bh=PQ+rDvFX7Yv9E6zoeDFtGBkxV+8lMyG12FpyFRaA/GU=;
	h=Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:tUid:X-Abuse-Reports-To:Abuse-Reports-To:
	 X-Complaints-To:X-Report-Abuse-To; b=anoRXhChHsMk/VyfT0oBaIV3CHw9RRWTB7xjtMCVgSgTcI1+P9CXDrwsyVFBPP9PGStUX1F5jJj6Euu+WfQiAqrGeOPmuKf0cx5PZSwPyC7P+mq+NMGE1AKZB2tKhYyTiqyPEz9v9ldmtuYM1xqXb4jXIVY0lI3KfWN9N+dV8WM1ZH7yUqVfzBkcqj74dkdUcfHkQs1y7GianSLeeIpLlVgK7Y+Cn8p4BgKY0LkPT026DQupv1UGRaTl/uDYj7V4hrx+t7LosEuxclf5UbwWkQAdpUuO1NbhtLejEbXKrWcHhqJ9ukSgghiRTfO/FOYCXa8iTI/pmAdqXwgd4hg+RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass (client-ip=210.51.26.146; helo=unicom146.biz-email.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org) smtp.mailfrom=inspur.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.26.146; helo=unicom146.biz-email.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org)
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtzWl6y65z2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 19:24:35 +1000 (AEST)
Received: from unicom146.biz-email.net
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id ZJB00028;
        Wed, 28 Aug 2024 17:24:28 +0800
Received: from localhost.localdomain (10.94.17.16) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.39; Wed, 28 Aug 2024 17:24:29 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <robh@kernel.org>, <miquel.raynal@bootlin.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>
CC: <christophe.leroy@csgroup.eu>, <naveen@kernel.org>,
	<tudor.ambarus@linaro.org>, <liuyanming@ieisystem.com>,
	<linux-mtd@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] mtd: powernv: Add check devm_kasprintf() returned value
Date: Wed, 28 Aug 2024 17:24:27 +0800
Message-ID: <20240828092427.128177-1-hanchunchao@inspur.com>
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
tUid: 2024828172428dd2ba8bb9949c0c816bca59e4752b99e
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


