Return-Path: <linuxppc-dev+bounces-14940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2D0CD7368
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 22:39:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZs444lf8z2xHW;
	Tue, 23 Dec 2025 08:39:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766389811;
	cv=none; b=OB0Bf7RQxicpK2WawoSCQUbzHAXxGEgnsNX6p5OqXpXN15l6513CgkDyJhXacq/wxodAOoFK7+uCV9qIdqlqsVvu/k4EE0k6PtJyHyyq5re8eRJDT2okyJ1BVkSV7Z9flLlOaxCbbywEO4ToUpYmc8WqRP/2ippHkovL1HHUGA1rqTcBDcFsvc3l7A57/Pqf3Zb57JFkBUN+IJ6DHoPUtJzQIp2GvUR/ibjVDfnxStj7uD01iIEcculQthpXzURmUcl/pNpCVUZ5mgnwVTZ0Ycj+epmthKCKe8EcTuZTnOo/Q+BaMvvxVa7gLVsT63fYwpdc0G012eb1tib3Wo09Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766389811; c=relaxed/relaxed;
	bh=mL4u8EF2hdg5j5GFccqUCLPSU7Svccm4F9ccJzYt7qU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WUgyDhuZ7bLuB9LB41MkSiXBgaaegob/fIKR1rii5PLU4PWPmwHlpjIRg09tfbWrEvHQ+SlfJirVByj3Z4op2d1R/kwko176WnMIREg5x8tOS8DG6/QjjM1CEnWMbuhuCPnIOHNlaYP7Z8NwchDO0rm9Dhoge3bpS3f93UCqXaIj4sYJTvsZ6REMGPxD8utg2+ozizNRgLx7orzQJu+QUWhKp4JRVLrhkSJ00UFuzGUM03bYhflKKMMnanL2P2ZFFSbrzebNUIRJHFXJ1nwHllSaCzsttZScx1Dmr/yqk+Q5SCID9AqVqBdVGDwGELwmAu0UPF43jv0dE5UouMxFEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZVfp0h1Rz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 18:50:09 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.209])
	by APP-03 (Coremail) with SMTP id rQCowAAXMNcn+EhpfBmPAQ--.53390S2;
	Mon, 22 Dec 2025 15:49:59 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Su Hui <suhui@nfschina.com>
Subject: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Date: Mon, 22 Dec 2025 15:49:58 +0800
Message-Id: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
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
X-CM-TRANSID:rQCowAAXMNcn+EhpfBmPAQ--.53390S2
X-Coremail-Antispam: 1UD129KBjvdXoWrurykCrW8Aw4rCr45ZFyrJFb_yoWDAwbEyr
	4Yvw47X3yDtrnrtw4ag3WSvrZ09w10gr4xXr43tFyfWrWYv398ZrZ5tr95Cw13uayIkr98
	Aw17Jr1rJw1DWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-Originating-IP: [36.112.3.209]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiDAYEE2lIrR76BgAAsz
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If device_add() fails, call put_device() to drop the device
reference and do the cleanp.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain/
Signed-off-by: Su Hui <suhui@nfschina.com>
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 25845c04e562..90a2107a9905 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -896,7 +896,8 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
 		dev_err(parent_dev,
 			"device_add() failed for device %s: %d\n",
 			dev_name(&mc_dev->dev), error);
-		goto error_cleanup_dev;
+		put_device(&mc_dev->dev)
+		return error;
 	}
 
 	dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));
-- 
2.25.1


