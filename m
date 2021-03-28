Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4793434C056
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tCC1rWdz3bM7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:05:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dYzr6KWh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dYzr6KWh; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1m2fzxz3c73
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:48 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id q3so10894886qkq.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1EIk4YVKhOnAZImQsN2ZKDY/BZ5VFtnbICpb2ytuZw=;
 b=dYzr6KWh4SK2C8ze1rrsjBDcu+hcBxWGkb1HkW+qd+/dV31vd3A3Ee2Vxu4ZavXqnU
 o8NDQ+MysLv2Em5XbQ1laoO0P8vfDo77vfaElmp1/5MVQKkCU4xkYBZR1Y8MPoqMfo6V
 0ko2b1t/YU/AM1SxeZ+mvKZbA/x6XJ6/kteEuByX/qo+qxxZ6LTZgy9ICZUMbPMGWoNd
 UclUSFoR61rQ9kcGDjvMWAIuCwmuY+iSBQs/83RVR6BF2KMyUhMQ4juCkRyTGV1Haspm
 asUV/RoPmdZFZFpoRySHsNo2MW5LLW2WQLM3f1CKrl3Ao9QZR9avs1tE9a+FJ+MwI3Vx
 lRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1EIk4YVKhOnAZImQsN2ZKDY/BZ5VFtnbICpb2ytuZw=;
 b=RazTY7ZOGsn1XWWKOdJM0plrIju3W5t/7cm1xFb7Q4pNq46AD9eIQc+EdnydI610E9
 Vl+Nj9MbutuNqbVuqevc0wZlsPlXH6Vf0xjPBOvLwXrsNAtzuasE/zI1DRWvshiNHiVv
 vFmmqsqJh4q2knkpp06SdV8O1Wv2NJCHo/l/3SkVPfzpIZjdDLiEKFHeQT1FsVO1G87r
 D7W49W+sEu+1CVTZgQiF6fXHsAdUVlM80wKwtYtHmpJz0PPLpf8m8cdsSuZc2skQNsf1
 OR3ZXvuKSQksUk0nc9Vf5XaJ2/uPXFqsYjRxP/UdwSTuPSigtfNrGHekrmCR6XLjktn5
 wHVg==
X-Gm-Message-State: AOAM533N8hV7/rNxF3ZxJIZOr5P+MXLtHNSPLl9i5FAtthwUnDBKgX5M
 5DUnUHrtNWcDeWh25LOGd7Q=
X-Google-Smtp-Source: ABdhPJw/RMK7vmZ45zLUGVxo30c6mvRq7joodocZ04PQOyJJPRklWL/yJc/aDwzeJa2I3aVqupZvhQ==
X-Received: by 2002:a05:620a:2116:: with SMTP id
 l22mr22838891qkl.377.1616975866552; 
 Sun, 28 Mar 2021 16:57:46 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:46 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 22/30] at_hdmac_regs.h: Couple of typo fixes
Date: Mon, 29 Mar 2021 05:23:18 +0530
Message-Id: <a588f9e9c32c5af24570ea04c4cd460fb3958147.1616971780.git.unixbhaskar@gmail.com>
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

s/availlable/available/
s/signle/single/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/at_hdmac_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/at_hdmac_regs.h b/drivers/dma/at_hdmac_regs.h
index 4d1ebc040031..46ecc40edaa8 100644
--- a/drivers/dma/at_hdmac_regs.h
+++ b/drivers/dma/at_hdmac_regs.h
@@ -338,7 +338,7 @@ static inline u8 convert_buswidth(enum dma_slave_buswidth addr_width)
  * @ch_regs: memory mapped register base
  * @clk: dma controller clock
  * @save_imr: interrupt mask register that is saved on suspend/resume cycle
- * @all_chan_mask: all channels availlable in a mask
+ * @all_chan_mask: all channels available in a mask
  * @dma_desc_pool: base of DMA descriptor region (DMA address)
  * @chan: channels table to store at_dma_chan structures
  */
@@ -462,7 +462,7 @@ static inline int atc_chan_is_cyclic(struct at_dma_chan *atchan)

 /**
  * set_desc_eol - set end-of-link to descriptor so it will end transfer
- * @desc: descriptor, signle or at the end of a chain, to end chain on
+ * @desc: descriptor, single or at the end of a chain, to end chain on
  */
 static void set_desc_eol(struct at_desc *desc)
 {
--
2.26.3

