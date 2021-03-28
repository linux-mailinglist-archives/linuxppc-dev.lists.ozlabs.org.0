Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5DF34C05B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tFV5fcmz3fvX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:07:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mj/G1xfM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mj/G1xfM; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t2G2Zr3z3cDY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:58:14 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id y2so8200166qtw.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUGFgtZenGoQf8Uh4RGUdvjnZZYLeMJMHb15/4oeJgc=;
 b=mj/G1xfMN+eBi/mLaJKBCfkPK76TC91NulrZ5Jz6MjHvD1+9uv4rw5JIHWY6jJMkPU
 juBqy15jPxnjEZz88LM7f7n7mKB7TmDWozu6QfjYOf5cdeVB6jvj8YF2JK5SEbaWCtcr
 SLVpipsP8ug8RvIfOCigIBCOOkbSMY0mM8tlHsQ75zbmLFit+2cyQzvlDBSCB3LGSGbV
 pShlkMne+FQekElXhc22p72UjnAWEnoe2D3MPu8Z7RA503hwCfuXky3XJCDO45tC2vxK
 Ir37Ajvmz19yu5bi6jM78kpp6GrDyAnXm5bDAKqUzMmt+jw56iKxC+d1WcuHS2QwjAoe
 bCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EUGFgtZenGoQf8Uh4RGUdvjnZZYLeMJMHb15/4oeJgc=;
 b=jKatkQyINRigcbLiTeZfcoERUstmJe6JrfLq5Bv30ONE2Joy1igv04XrNCCzu97BbZ
 BgxE/7hXeHVaVkRISA+qZDt5QaUqkpH/K+xFtTIRIiBzTLefRHNSspGVSiqbQJy/qGVz
 86Nd9c+WYQNNVQXLW66060Owfg+q9wwlyR97CqgN7r/crZGws2wZZzqBklkiNkt2Kexf
 d0anf5j3FnlAVpeZt1J7EcEYyQ70Wcm2FYzXLLXTh4CK+HkH6bDcqCaRO8Sc50/dJirf
 dHLNTu/PTpTS1ScMY10qR2Mye29/4GDOhzyxirIVoqAjBZO//B1QZ/BFKqIlSMAVDbqC
 WdWQ==
X-Gm-Message-State: AOAM531obp53/bem4567/AznhpneVvzct1ODwTKqOy461cHXuZziKAB9
 DDyaKPvJ5c74CtrLG+2i/2k=
X-Google-Smtp-Source: ABdhPJw5YfqSr8OAZoUA56+SYw5JOagX/iPu+fij/qaA6VDbAiygjX2++C/zuL+4UodiHI2nu1SuPA==
X-Received: by 2002:ac8:4799:: with SMTP id k25mr1974600qtq.319.1616975891846; 
 Sun, 28 Mar 2021 16:58:11 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:11 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 27/30] dpaa2-qdma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:23 +0530
Message-Id: <75bdf547b024ece2e35f6e83e51101109ae46803.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/contoller/controller/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/sh/shdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/shdmac.c b/drivers/dma/sh/shdmac.c
index 5aafe548ca5f..7b51b15b45b1 100644
--- a/drivers/dma/sh/shdmac.c
+++ b/drivers/dma/sh/shdmac.c
@@ -319,7 +319,7 @@ static void sh_dmae_setup_xfer(struct shdma_chan *schan,
 }

 /*
- * Find a slave channel configuration from the contoller list by either a slave
+ * Find a slave channel configuration from the controller list by either a slave
  * ID in the non-DT case, or by a MID/RID value in the DT case
  */
 static const struct sh_dmae_slave_config *dmae_find_slave(
--
2.26.3

