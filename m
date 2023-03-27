Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB51F6CB1D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlndP6Nkxz3fmw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 09:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.51; helo=mail-ot1-f51.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlnbW6btNz3fJK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 09:31:19 +1100 (AEDT)
Received: by mail-ot1-f51.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso5392980otj.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 15:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679956277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6sWdgKPnlynXN7gaVy9ScKNaaCRkPnaDWuj0f2wDv8=;
        b=2nnWRfmRlEajEn1f4G6z1XnuV5OwNWfOpUz+gT6WzfP83M+6yjxk7H+PDYb+d/ibqv
         2sA8NlHcJkrDYWHTKEb+pQVur/7WP9Qi3wO55ev5jjKjOvi3w+aR6/NpWvVHmzgYmPnc
         g07kw/0/lKxxqyUA27ZvilGMTbHWU4jiQbS1QS0rdSbg9L6mWjylX4cwbWW22RCJjJmW
         f/mdRLhbA1qXxgjFn/Wjoslnq5n8mE2SW4EJhR2gSpUTdaKBLlw/CQr6GZX3GnSnPt3S
         AS+QJe6WSulbQHDzu4DZLk+9ifyDQFfpxbPn5sCgmTB5pfRJ5Dph08cRTmk43Q6bYIOT
         yNmQ==
X-Gm-Message-State: AO0yUKVahhYmxA7LKA1Ab/KK2RdE8BBKHgVvQ4qlONWcEwsa7nbEKz9H
	1dEXvPD3JfgeyQX88i1Yrg==
X-Google-Smtp-Source: AK7set/BJI9Gqu3ZDBey3gtjqeUt7xNRV0EjKAp+aGF1HEr3KHutABypNwUVuzbQaGDE8j6u8uu9gA==
X-Received: by 2002:a9d:7d14:0:b0:688:4670:e964 with SMTP id v20-20020a9d7d14000000b006884670e964mr6595361otn.27.1679956277420;
        Mon, 27 Mar 2023 15:31:17 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dp7-20020a0568300e8700b0069d602841e7sm12160245otb.72.2023.03.27.15.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 15:31:16 -0700 (PDT)
Received: (nullmailer pid 820514 invoked by uid 1000);
	Mon, 27 Mar 2023 22:31:15 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: usbgecko: Use of_iomap()
Date: Mon, 27 Mar 2023 17:31:09 -0500
Message-Id: <20230327223109.820381-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace of_get_property()+of_translate_address()+ioremap() with a call
to of_iomap() which does all those steps.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../platforms/embedded6xx/usbgecko_udbg.c     | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c b/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
index e02bdabf358c..221577f32b01 100644
--- a/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
+++ b/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
@@ -192,24 +192,6 @@ static int ug_udbg_getc_poll(void)
 	return ug_getc();
 }
 
-/*
- * Retrieves and prepares the virtual address needed to access the hardware.
- */
-static void __iomem *__init ug_udbg_setup_exi_io_base(struct device_node *np)
-{
-	void __iomem *exi_io_base = NULL;
-	phys_addr_t paddr;
-	const unsigned int *reg;
-
-	reg = of_get_property(np, "reg", NULL);
-	if (reg) {
-		paddr = of_translate_address(np, reg);
-		if (paddr)
-			exi_io_base = ioremap(paddr, reg[1]);
-	}
-	return exi_io_base;
-}
-
 /*
  * Checks if a USB Gecko adapter is inserted in any memory card slot.
  */
@@ -246,7 +228,7 @@ void __init ug_udbg_init(void)
 		goto out;
 	}
 
-	exi_io_base = ug_udbg_setup_exi_io_base(np);
+	exi_io_base = of_iomap(np, 0);
 	if (!exi_io_base) {
 		udbg_printf("%s: failed to setup EXI io base\n", __func__);
 		goto done;
-- 
2.39.2

