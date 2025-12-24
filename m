Return-Path: <linuxppc-dev+bounces-14993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5762CCDC17C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:14:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbq536kS8z2yFy;
	Wed, 24 Dec 2025 22:13:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766573083;
	cv=none; b=H7NAtne7HDR9hnwXsdnKrW4Z1gCLHNotkUPaZQ/ZuOflsMK1eg6XAVtELhx0RBU5j5qXSyKmlAYBZSl08VwVc8T5PVKd+T7q5Cqwveab8NKufoN3agm0KX7o/xScbwwUJjiIyI2PmrRAlEPpJN32ZG3Hw83guT2ulQeOoxgaznO5cyopuqlTfAADotYYJnhupiIc9SryTowhYCbzw3esPOOBaQiFTQih/4qnNobiUFaxUwwNQRyzWiocZF8l8bPnSvufP3gTajtUrvcYk2SdcmE3yxW4qhXb8WiXDR7uJAjPEO9PQyLgroh4cQ7A7SvS+uiD8eMXv/eht55hzpF+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766573083; c=relaxed/relaxed;
	bh=xwOJ3d+qv5MZxFGfE7hoMKT5i3+qlZQOToRtdWiS/LE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VuZj+VT6JN7t6K12qs5Zcu3mzwkbRAgbeI4sO2rAYqXHLv75RPC/rLu+Q34a41hBgIK7ijKOlAM2ZoLQfd7d5eTv2CdMEhy6RGt+tmcHBlOBCK6SVSYMv7Em1HlH7PYmn04aOEC8qs+b3i7nkA/gYB4MZ0Qg3rMO7f4QNNVnFK786exQxmmeskiMJrX34U/5fgg7cttpVoZZSf1kRjgVuoK9wBJ2Ozt0exepG6jXLmmwj2nedTK8Cu1oKwln3f92GtP1MS1rUtMpUrYGi7QSny0szhTbmbdxbOL5eSkvU3pYTtl2BZuJfnty8tjzR12O/Ib8miwONIbAFc9fJQoJXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbpRG1Sb5z2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 21:44:40 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.209])
	by APP-03 (Coremail) with SMTP id rQCowAA3WeATxEtpyZ7TAQ--.6889S2;
	Wed, 24 Dec 2025 18:44:35 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Su Hui <suhui@nfschina.com>
Subject: [PATCH v2] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Date: Wed, 24 Dec 2025 18:44:33 +0800
Message-Id: <20251224104433.1585576-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:rQCowAA3WeATxEtpyZ7TAQ--.6889S2
X-Coremail-Antispam: 1UD129KBjvJXoWrurykCrykJFyDKr4kJFWUurg_yoW8Jr43p3
	W8Za4kArZ5Kr1jkw1kZrW7ua4YgayDK3y0kryFyw1fuw1rXFyFqrWSgw1YgF1UZFZ3Ca1Y
	qFnFy3WUGF1DJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUU
	UU=
X-Originating-IP: [36.112.3.209]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBg0GE2lLmTyK3gAAsN
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If device_add() fails, call put_device() to drop the device
reference. And put_device() triggers fsl_mc_device_release()
which does the free. Thus just return after call put_device().

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain/
Signed-off-by: Su Hui <suhui@nfschina.com>
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
Changes in v2:
- fix a patch error. Thanks, Christophe.
- add specific changelog. Thanks, Dan.
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 25845c04e562..f976c5a24151 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -896,7 +896,8 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
 		dev_err(parent_dev,
 			"device_add() failed for device %s: %d\n",
 			dev_name(&mc_dev->dev), error);
-		goto error_cleanup_dev;
+		put_device(&mc_dev->dev);
+		return error;
 	}
 
 	dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));
-- 
2.25.1


