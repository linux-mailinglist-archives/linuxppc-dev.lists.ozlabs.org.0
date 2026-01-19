Return-Path: <linuxppc-dev+bounces-15953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C4FD39EA0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 07:37:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvgjg5t1Tz2yDk;
	Mon, 19 Jan 2026 17:37:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768804631;
	cv=none; b=oDJaJ6QxNWwYgQJGfH83WtY24SDxE14hfVPvM02618FMqzmiQKUOxSNBGTEpchj/SLFdmvMRyUWBEuhEVAjj2F0CwCBM1y46i7JZCRBinmB3gkf/G46aAaKmvNWIX3IFLw24suhmH3oI93/ZP4lkHdLsUnF5k+hv8sTIrFl0WKg/22fjS/YvBfE1i+ITS4N5lXIcYBKM/IYqrMeUwO8x2x4ZHkZ1wkEsaOsZCiu6ZFSDqLVXRYM8a2jxca4ZXaTgY3GNYS8gDm0IqJobXGTwgnSAsXj7At0eVNiIgASA9hcDlcy0DarTL46wZOlPQd9GMZj+rpl5QcgcxCWLP72APA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768804631; c=relaxed/relaxed;
	bh=UMLL+2qsnNqcdd1TleSVXVLmaJIulJdQsQ2THNZDW60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WqeDGykcYGwXXrosEqGmrmuK5sdDQuhuqT1xYOt/Z0B2pD6Ye5D+9v4qHi5aSQf99ukEexqM5nxO9nCT1jdHuIaxGbYOdM5t4MnOBH+BOi7NUGAy7qKF+mne6gq4UA0vc+pvukKk8QM6ELwhfiQ72IfVguFInSLZL+Tkaice65tKTHASNf/TNIEDsvqxGfwTA2eXyma3gmVpRU1C1zSK08JYb5vr9PTA3UZYx0GfDwb27eO0XNv+HnEi9PmhREpiKzP+XkfOrp+le/L+bpGB44DijwXlj81PxUAtSLERNzmeW40n5O9MqCTkIaXbv7fTteHU7gRmsuiumfQyUjC/6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvgjf5FQDz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 17:37:10 +1100 (AEDT)
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXZMsD0W1pkKK+BQ--.16870S2;
	Mon, 19 Jan 2026 14:36:51 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	tglx@kernel.org,
	jirislaby@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] powerpc/44x/uic: Consolidate chained IRQ handler install/remove
Date: Mon, 19 Jan 2026 14:35:07 +0800
Message-Id: <20260119063507.940782-1-nichen@iscas.ac.cn>
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
X-CM-TRANSID:rQCowABXZMsD0W1pkKK+BQ--.16870S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1fKr4kGryrKryxXw1DKFg_yoWkWrc_Ww
	48Z3ZrGr18CrsIk3ZFyr43CF1xA3yUGw1jk39aqay3tw15J398AryIyF4UGr47Wr10yrsx
	GrykG39xCayI9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_XcC_AcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjTRWuWlUUUUU
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
 arch/powerpc/platforms/44x/uic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/44x/uic.c b/arch/powerpc/platforms/44x/uic.c
index 85daf841fd3f..50ce4a77ca94 100644
--- a/arch/powerpc/platforms/44x/uic.c
+++ b/arch/powerpc/platforms/44x/uic.c
@@ -309,8 +309,8 @@ void __init uic_init_tree(void)
 
 			cascade_virq = irq_of_parse_and_map(np, 0);
 
-			irq_set_handler_data(cascade_virq, uic);
-			irq_set_chained_handler(cascade_virq, uic_irq_cascade);
+			irq_set_chained_handler_and_data(cascade_virq,
+							 uic_irq_cascade, uic);
 
 			/* FIXME: setup critical cascade?? */
 		}
-- 
2.25.1


