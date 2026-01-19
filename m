Return-Path: <linuxppc-dev+bounces-15950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8983D39E39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 07:06:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvg1j2tzPz2yDk;
	Mon, 19 Jan 2026 17:06:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768802761;
	cv=none; b=mz3eIDyoYEYZ1HuyHllZfeGkM9OPC0ACMiPJFiznNcaVqfcm2lqAPERqjCPz3m0GC5ke21GWat75BFZeWC1oIgrJeAOJienVeMWJ+YzoJGi+MK7Vg9xf1sP4dr+eg3BAJPkvKRf7bedllGbb3BaN5gk2iMJmJUmLvfrgSvos/IdprUcgrwRe5NqH5ojFcqunNnQzsm37Yp+afSTm3JR+eU0a61sueeFRZK1cLrl6IN1ZRs1f0oNFGAhkC4iPNGdarF9sNNexhwlNlgw9tkhyI0xZB+YyKkfyiFyzssgjURBNQ3J+SqsmUKrca0pJ9QG3kIf1FzIcTxwpwl/zuEv7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768802761; c=relaxed/relaxed;
	bh=c/X3NWCP0Bb6C/gVMuDHOd2u23xDLA+ONfYxgwyAPWk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AWb44jhJolX4pTyoKl68UrbEQ6792cA1Xf0I42mHyrIyx0YSaeFxH6Joem+XggUOMT7cWlc0yGl2L1HJLf64hHwRWcfbQtEIRx4IvXTZpKuTm7hpyIpxGH9s3sk69mXbIeeko5hs2uUS/dYrHh5I2/OJLTclwXtEUcA79iiMucTp/IJPdoT+xQFRTthsRZpXu81kBogNuef93ZlOFPRO1Opd/hnobwWwicbDjrch8EPmnNL0CgcxaZ6ZxMT+4oc59G26zP8ruQR0b0/URXTbXXS3AEXwXlFQj3iwitfqCgRfVY++DO4JHwpCtPO8urjHVTVnAPYXd8vKwqpLHbenRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvg1h3r3gz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 17:06:00 +1100 (AEDT)
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACHpt27yW1pmq69BQ--.58969S2;
	Mon, 19 Jan 2026 14:05:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: agust@denx.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	jirislaby@kernel.org,
	tglx@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] powerpc/52xx/media5200: Consolidate chained IRQ handler install/remove
Date: Mon, 19 Jan 2026 14:04:50 +0800
Message-Id: <20260119060450.889119-1-nichen@iscas.ac.cn>
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
X-CM-TRANSID:rQCowACHpt27yW1pmq69BQ--.58969S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1fKr4kGryrKryxXw1DKFg_yoWkZFg_Ww
	4kZFsrXr48ArsIyrnFvr15AFy0yrW8GFy0k3ZYqanrtrn8XrWDZr10vF42kr47WF10yr43
	G3sYkanxCayj9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_XcC_AcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRWuWlUUUUU
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
 arch/powerpc/platforms/52xx/media5200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index bc7f83cfec1d..c20ac8010f6d 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -176,8 +176,8 @@ static void __init media5200_init_irq(void)
 
 	of_node_put(fpga_np);
 
-	irq_set_handler_data(cascade_virq, &media5200_irq);
-	irq_set_chained_handler(cascade_virq, media5200_irq_cascade);
+	irq_set_chained_handler_and_data(cascade_virq, media5200_irq_cascade,
+					 &media5200_irq);
 
 	return;
 
-- 
2.25.1


