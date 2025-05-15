Return-Path: <linuxppc-dev+bounces-8597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E8AB8102
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 10:41:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZykFq6x3lz3000;
	Thu, 15 May 2025 18:41:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747298479;
	cv=none; b=lmV7PkPrWLO1QlYLP/IZGENBIKDm4C7Luzp4MpxcXc93sv2jqluEYLCgToU7qbHra55hgi+ncuN47fjWaiG9J0RTVcIbjQl1ALZc4F0SbxDs6XdNIYsae6wPxcho0TSETDXeFxiujoLQ9pmaeuFoNTwKso40Ps6WTaqYWNeb3Dy+vskKqHpoCUpTWBsjEFMrj/+iUX4lf1E8xTxViGNUcBd3BgpPcuu7zUkCLYlppTCDU5iQWSR/ozeP60aZuzlOpnbQetANgQ1Lh9tHX5oOtI87gy72rUxb2vFnUHGDhd9XxNHleadT5gnityxwSVt7U1zph+ivjcptfiE00qjxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747298479; c=relaxed/relaxed;
	bh=v7FgsLCDjywRF5KPQTtUvLJ+BSHN64tfvbrVtXTw8Ws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y6/JdukxupHSAx5o6V47AriGDyyIu6ZIfjNaT3Qo174t6knFxq2f5MkCvYu43a7kkDyqwggB6SmXPRti6aWwkeyvTyp5lNATO7JSWDXUiRwBs/bvKJWy723/MP8JYnqZZfOgzpW/l/QeDGXzFmf35qp7MnCpVPeQdMLzSYZy3NBy1KQMxg9A/qfZ7Vpd3K+JTPYcon96NPXd9mJY9sA0mww9kXVg5t4ccZFY4pgAbsIVOVoP02sIGQOa5Oqgq/P/v8633QXacOAZCWUDJdVthvHaxNWSeuet3jmYxu7rTK9nms1ZUUwm8iNLq0KG2FWhw3rGALZmDqJqOe9qYWjLQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZykFp160Yz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 18:41:14 +1000 (AEST)
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAA3dw+iqCVotbHaFQ--.49892S2;
	Thu, 15 May 2025 16:41:06 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: qiang.zhao@nxp.com,
	christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: fsl: qe: Consolidate chained IRQ handler install/remove
Date: Thu, 15 May 2025 16:39:19 +0800
Message-Id: <20250515083919.3811473-1-nichen@iscas.ac.cn>
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
X-CM-TRANSID:zQCowAA3dw+iqCVotbHaFQ--.49892S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1fZFWUWr1fAr17tr4UXFb_yoWkZFc_Ww
	45X347Xr18ZasayF12ywsxAF4rZF4vqrnrCanYqFZay34fJ397AF1UtFnxur1kWF15ZF1k
	Ary5ZrWfGrWUGjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU00eHDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Chained irq handlers usually set up handler data as well.
irq_set_chained_handler_and_data() can set both under irq_desc->lock.
Replace the two calls with one.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/fsl/qe/qe_ic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 17e6d2377c7c..4068b501a3a3 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -450,13 +450,11 @@ static int qe_ic_init(struct platform_device *pdev)
 
 	qe_ic_write(qe_ic->regs, QEIC_CICR, 0);
 
-	irq_set_handler_data(qe_ic->virq_low, qe_ic);
-	irq_set_chained_handler(qe_ic->virq_low, low_handler);
+	irq_set_chained_handler_and_data(qe_ic->virq_low, low_handler, qe_ic);
 
-	if (high_handler) {
-		irq_set_handler_data(qe_ic->virq_high, qe_ic);
-		irq_set_chained_handler(qe_ic->virq_high, high_handler);
-	}
+	if (high_handler)
+		irq_set_chained_handler_and_data(qe_ic->virq_high,
+						 high_handler, qe_ic);
 	return 0;
 }
 static const struct of_device_id qe_ic_ids[] = {
-- 
2.25.1


