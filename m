Return-Path: <linuxppc-dev+bounces-15949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55984D39E36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 07:04:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvfzy6Y2gz2yDk;
	Mon, 19 Jan 2026 17:04:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768802670;
	cv=none; b=JGw8HvFEHlzKDGrJ7oAcjGPTpXrSR0oPRAd+W0/jkrBlnftZP6qsgzjPnMm8s5p6rXLQmheUjb42Kx2MnQXkXYaJzZEliMgHYCpw3cxvQXLubHJ8y/ASNBtxxGxRGwIi1C3001TLvu7U36QSvFZW2Oz7kWdGjFnCL8POfl+z5DQfjsZAR+xhBMScPe7gxmtexeXo0yscaqmA7D72uxdbqvRdPav8K8pycmLRsHbscaOIoqzzlu2+XKB2/5KyYHOtEK7Sbn5yuUuS/6JGt0ipVcpo7KpHaKxWl5m7Gwoga5qdHiQSaAANOxUcwMVsw0uZYGmfizRzhFltlvvJ0QKUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768802670; c=relaxed/relaxed;
	bh=SOpAkrurgZZ+XgghofR9vRH2MXo+1yAlhLPtvMwp1yo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZYoIeAE4mpS+B9ubRwBGOBO+oYQ9bmNTRTztZLpSEJ9D8s4BYkDw+DfJNZAG9Weq31q0ph3/aXI2t9IGnRk5zsCxQGUxm5aP2aPtSwsmS4ir/a2Kkd2rCHzZIdMxmKR8FfnNZjBeyyqHm6a6Ao6cmPjq2z7fND4OLUmRxhy8G6x3wxtHscZo9osp8iQg25KNX5DLOYnWcl0Y4Y3BKKl3T2oPNc20Q11I4xETKrFOEP9l4LrFFdCV6UHsLXCCGmPzcT2G5jEb78VrvFWELayr8wl4PyrgcKzj3QgtuOyHhGDhufPAQwsxC9PO9b8HoX5yY3rzEq2i4UzmDRmslVSy1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 395 seconds by postgrey-1.37 at boromir; Mon, 19 Jan 2026 17:04:29 AEDT
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvfzx603Hz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 17:04:29 +1100 (AEDT)
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADX9NvOx21pkW+9BQ--.64349S2;
	Mon, 19 Jan 2026 13:57:34 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: qiang.zhao@nxp.com,
	chleroy@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ handler install/remove
Date: Mon, 19 Jan 2026 13:57:15 +0800
Message-Id: <20260119055715.889001-1-nichen@iscas.ac.cn>
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
X-CM-TRANSID:rQCowADX9NvOx21pkW+9BQ--.64349S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1fKr4kGryrKryxXw1DKFg_yoWDtrXE9w
	4jvr97Wr10vr9IvF12kwsxAFyrZr4UWwn29wsYqayay348trW5XFy2qFnxCrn7WF48Arnr
	Grn8Z393C348ujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVWYoVW2owAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
	ZEXa7sR_AR65UUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The driver currently sets the handler data and the chained handler in
two separate steps. This creates a theoretical race window where an
interrupt could fire after the handler is set but before the data is
assigned, leading to a NULL pointer dereference.

Replace the two calls with irq_set_chained_handler_and_data() to set
both the handler and its data atomically under the irq_desc->lock.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 61dd09fec6f6..8e2107e2cde5 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -114,8 +114,7 @@ static int qepic_probe(struct platform_device *pdev)
 	if (!data->host)
 		return -ENODEV;
 
-	irq_set_handler_data(irq, data);
-	irq_set_chained_handler(irq, qepic_cascade);
+	irq_set_chained_handler_and_data(irq, qepic_cascade, data);
 
 	return 0;
 }
-- 
2.25.1


