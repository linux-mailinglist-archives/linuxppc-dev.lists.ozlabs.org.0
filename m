Return-Path: <linuxppc-dev+bounces-13213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB78C0204F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 17:12:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csqJz3LB5z3bfF;
	Fri, 24 Oct 2025 02:12:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761232355;
	cv=none; b=iYwvfOHcekFwHjiFm36uqDjoyi1Sb6jHixvqLfYdeQ9u6Of/GMaWXM55O2qnb5DuP6mnw9iNGJZIjSSJec3tQ5gPhoqkpoQaIZB+W8cqCHIktwag051T7jWbmrcKpTkoITd2yKcnpWcHTnesiegIG4zsazh4tycg5ytnvF9/Ro0KAcQCs/+iY273+HRLjArohWaNqBPX29E+11D4xynHkAuUPR2V98XTvQrV4zq2xOKfoZNckJu5RrgJm2lIbQUJj11/z2qAQrls28/ZNndp3VHaSIczhcyCSHJtIrYnkpgg2tHHv2FmO/hLgEWYzlXSL2TPw9CUMQ8eys41m9Q1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761232355; c=relaxed/relaxed;
	bh=JzQcKm86aeg2Xp94GgS+TyctJF9gJ1HsuZBbT84q+vY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyPE/V/0JnkjpqI2ykX566mqg9o8wrvBC2FIFHW/zn0KVqwVcu36gOGek63Hi19PmnQh2mnnepwsp+4uBKfh440K9cNLpKj9NI70QId4V7Zh6MXh0RTlqmaTKCfw2K27AidszFMSemrdSacXXY4i3K2FHLgfYg/o7piRlPwk53niYRkh1C5gMOPlyY1F2NzoDxl7l2x1syEiryLhVVpNhEExHpResLVmypuOXEKpAp+hABa8S2pP95PLh33VL7/dWyBjAbtO/IQTk6NL5lTOsZNJxd2QnAKQN/vgQd3SRM19uAxJ/FGGkPqPfFJVplJ4MOrRrdIOiH2+7yRzs5bWNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 347 seconds by postgrey-1.37 at boromir; Fri, 24 Oct 2025 02:12:34 AEDT
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csqJy2V1cz3bd0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 02:12:33 +1100 (AEDT)
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAAne519RPpoxY0dFQ--.12488S2;
	Thu, 23 Oct 2025 23:06:42 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: fix device reference leak in fsl_mc_device_lookup()
Date: Thu, 23 Oct 2025 23:05:58 +0800
Message-ID: <20251023150558.890-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAne519RPpoxY0dFQ--.12488S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyrtr48WF1kZFyDXFWfuFg_yoW8JF43pF
	4UXa45ZFWqgrZrCwn7ZF40ka4Yya12y34rGryIy3sa9r95Jr90qr95JryYg3WUXrZ5WF12
	qr9Iya4ru3W8JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUehL0UU
	UUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYEA2j6RD0AxQAAsj
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The device_find_child() function calls the get_device() and returns a
device reference that must be properly released when no longer needed.
The fsl_mc_device_lookup() directly returns without releasing the
reference via put_device().

Add the missing put_device() call to prevent reference leaks.

Fixes: f2f2726b62f5 ("staging: fsl-mc: Device driver for FSL-MC DPRC devices")
Cc: stable@vger.kernel.org # v4.1+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/bus/fsl-mc/dprc-driver.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/dprc-driver.c b/drivers/bus/fsl-mc/dprc-driver.c
index c63a7e688db6..e92c75cef90c 100644
--- a/drivers/bus/fsl-mc/dprc-driver.c
+++ b/drivers/bus/fsl-mc/dprc-driver.c
@@ -124,11 +124,17 @@ struct fsl_mc_device *fsl_mc_device_lookup(struct fsl_mc_obj_desc *obj_desc,
 					   struct fsl_mc_device *mc_bus_dev)
 {
 	struct device *dev;
+	struct fsl_mc_device *mc_dev;
 
 	dev = device_find_child(&mc_bus_dev->dev, obj_desc,
 				__fsl_mc_device_match);
+	if (!dev)
+		return NULL;
+
+	mc_dev = to_fsl_mc_device(dev);
+	put_device(dev);
 
-	return dev ? to_fsl_mc_device(dev) : NULL;
+	return mc_dev;
 }
 
 /**
-- 
2.42.0.windows.2


