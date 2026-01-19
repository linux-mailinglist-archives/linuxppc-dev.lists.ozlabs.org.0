Return-Path: <linuxppc-dev+bounces-15951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FCFD39E40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 07:13:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvgBS5lJDz2yDk;
	Mon, 19 Jan 2026 17:13:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768803216;
	cv=none; b=DV/rBqwMnBkPTznYowTUwkZTkii8jLed7EDz41cIX+8AfcKmNUHz2YFT85bqASG5EmWoJI0XLSJsNXrafcUk2WVYMD7gaSb1Pty5gDNGKeOnkHkj3ZefnYMV/LakCNcc0EduScnMBaGKq+N7J/AA40JtIjuECwi7Cm2PArNOfcDbBxKzU/H/zmXMbFcxL/8sYgsFFqL/dO4+fYHh5qZFS7NwCM41ldtKIxe7bJ1Lbicf3LWveJ97fN12r/N6FN2j6BAINVSpUyq1eStMMfKSIeQAQkqwJ5sydK77Ni1xS+cvEHdunI0lEczGGigjksUt6JJD/V/MBaxzyqy9E7rDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768803216; c=relaxed/relaxed;
	bh=rTbpM71p30G2H5vRohSOtAXyWF0NS6SGWjkhifD9G/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GIQhAZzFvf8xzKgJZn12Z7k9e/agAnHPcddtNVdWjZCZw3d2RWQ4i0rOKZ7UmCSlL2fUMP9zSw3iysAGwbUKWEvhMArx/s9UeCvVzBIX8c5QYMV9edC9ik1QXXEey1f0g0EiAloECNtKF8GGyz1+bWk5NBA+tqI0IPB2lU4+iXpsfIC8ucUyUh2CR+EAi1AsM3JRTl07thym9lT/JjvsCcMNFeEu1W8/vcPl2vPZ7t0wU/8LDRS3Zf/j34WoEiCGfRjX4ZCx3NbzAM+WbqowLyG5PJ1IKGOismTSBucfZDaEDsZ+0BCIBiJzSm7leDaJ4SPvjJEcahi9zcwSanlcYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvgBR6Nljz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 17:13:35 +1100 (AEDT)
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABHZt2Iy21p5ue9BQ--.20122S2;
	Mon, 19 Jan 2026 14:13:28 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: agust@denx.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	tglx@kernel.org,
	brgl@kernel.org,
	jirislaby@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] powerpc/52xx/mpc52xx_gpt: consolidate chained IRQ handler install/remove
Date: Mon, 19 Jan 2026 14:12:32 +0800
Message-Id: <20260119061232.889236-1-nichen@iscas.ac.cn>
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
X-CM-TRANSID:rQCowABHZt2Iy21p5ue9BQ--.20122S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1kJr4xWr4furWDCFW5trb_yoW8JFWUp3
	92y3Wqkr1UGF10v3W7AF4UWr17uFyrur4UGw4q93ySvw4jqryFqFyrAw1fZF4fArW3WF1I
	yrs8KrWvvFs3CaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rkl6F8dMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sR_E_M7UUUUU==
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
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 7748b6641a3c..e8163fdee69a 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -253,8 +253,7 @@ mpc52xx_gpt_irq_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
 		return;
 	}
 
-	irq_set_handler_data(cascade_virq, gpt);
-	irq_set_chained_handler(cascade_virq, mpc52xx_gpt_irq_cascade);
+	irq_set_chained_handler_and_data(cascade_virq, mpc52xx_gpt_irq_cascade, gpt);
 
 	/* If the GPT is currently disabled, then change it to be in Input
 	 * Capture mode.  If the mode is non-zero, then the pin could be
-- 
2.25.1


