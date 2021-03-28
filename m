Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA934C04C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t6p6WGKz3dnw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:02:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S8oWEVWM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S8oWEVWM; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t0w2ZCSz3bnX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:04 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id x16so5710680qvk.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FMNLSlxwy2hAf90gVAHPhiZXHLhbd5qd+n04so3vi0M=;
 b=S8oWEVWMQA7uyNstiZ8vX8xPHLZ0pxra5NLEFFZff7GHfczcuqdPPb1f9FK0XzIuvO
 UzPWul+6fG0QPP5gDQ9IaF5Yimdyc8s/NTyczspVuP9t6SHX6y9UJJ349vESDcVPS68s
 QG5EZ5U5urbmsi3oZ/Xw4TctbB7C20H3xQqhBrA3M1pIYkme4Az2wgoemWBDm4zIM2zF
 S8l8tp27O4LScLIVSPnMu2Tfen8wh0ESoi1br6sQSJgBhywsNStX9yRrFEgJENv3xygU
 JXHw47iftiDyBqQKWUlu3oja/xrWp3CtSbiiUCvlFQoi58veqOhE8AgD5AdpIpuoEvAz
 yjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FMNLSlxwy2hAf90gVAHPhiZXHLhbd5qd+n04so3vi0M=;
 b=asLOS9NW1zNLk16XFGhVphj3c5IAChlK1ZbDvtzRoqTXAGxr4hCBW9tfp+ZNfnpvWm
 RHx/kypJulgKmINLyjzJ37obxyztMdeeVOPoJHR53Zb8EMfnQ+NUZvcl4yn8XyznC4/p
 anU4r/nm7BwCIu85164dfzkxmD0Xjod3z/DcddldvEKBDeo6YfNctsZc8G7F0rpMmS7S
 u4oiLm7Wc6Q5X034YKJC4T2vY+19veZWiHXJzvPyRKaWtILzkcaoYbaszkN2gkUIUlY1
 L8yffwv35lMPvgRoe62T+tfWhpWZyS9GsKbZqYFnzK4pM5UYbaGiY//0O+OVwU8Gv6vw
 uXDw==
X-Gm-Message-State: AOAM532nlvREqolQ45xafp0UNBd9AZoCboljnCVUoo95TAwLTd7zk4yQ
 H6jxc/VDpU8+rokMz8h6YZ4=
X-Google-Smtp-Source: ABdhPJwu7RyqQ3LrL1DwSFaqoUhxFcpLYWZSK3o023jDzT66goaZiw5ZvrOEYhVFXl/O/Q9wP43hfA==
X-Received: by 2002:ad4:55ef:: with SMTP id bu15mr22954074qvb.46.1616975822090; 
 Sun, 28 Mar 2021 16:57:02 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:01 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 13/30] s3c24xx-dma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:09 +0530
Message-Id: <a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.1616971780.git.unixbhaskar@gmail.com>
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

s/transfered/transferred/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/s3c24xx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 8e14c72d03f0..c98ae73cdcc3 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -156,7 +156,7 @@ struct s3c24xx_sg {
  * struct s3c24xx_txd - wrapper for struct dma_async_tx_descriptor
  * @vd: virtual DMA descriptor
  * @dsg_list: list of children sg's
- * @at: sg currently being transfered
+ * @at: sg currently being transferred
  * @width: transfer width
  * @disrcc: value for source control register
  * @didstc: value for destination control register
--
2.26.3

