Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5534C057
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:06:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tCg0BmQz3fbl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:06:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Rfss4m+D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rfss4m+D; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1s5NLXz3c8s
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:53 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id y18so10895788qky.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OMl5ABdwT5DW251I71t3DGinXKhKaq9NsZyTNddHa8Y=;
 b=Rfss4m+DyBLiE2rmvTbB3bLpSu6ljCMgZGJOXL83UY6K7+BOdjg+SSTq8kZaDOEWv6
 rx5iy/w5SOioRKCzTUe3BxyBWYWNrSBKtsFvhFu4XL0OlvsW9PoKO+DxXiWW6St0mTR9
 lTFd+lCy7V8ZkBLrnBlXt3hupR2eaF94TvrXIfIoOxKabz+84KeSvhAaYQ/pLT5rJS9T
 zXOMfY/jZWDHi6IcDT8yRNlR1FPQ+kTzxyWI7467K+gS18rtBl3iSz8m8HbJFMcf4hvI
 qKjsig+kI9u18vColYKr0q6VTUM4wM5tQPrC3qFE9KxeKgm5rGQt7CVWSbQ9fEJeDkEW
 Pyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OMl5ABdwT5DW251I71t3DGinXKhKaq9NsZyTNddHa8Y=;
 b=jB/n6jJkOnrjouD8ci7SU4BuzOj2mC9dqUvc3b31mvaxHQtFa2g4e23FlJ2cFR+nzi
 6rRflkdZglUzXpIGOCHwrFCUu1zraL4BtJbe10T9t625ioPViGnwwZZA9yr7GKylTxxD
 I3T44MbE+sLhvrS8w0skXng/pPUdtB0+V985lkpv1hiKk2hDWwv0ypBuwXemmtWtINUg
 erNhmEMCq4U0IuozcXYXOO0t/AEwFgcS9OEmJehEWxLoSincq5G+tWKpR2Imh9XL1Qz1
 Zy5K7zoD5B6e/ztI//LOsJjCxBx43FK8gcwt/9ee1vWe4fE8DRpxpxvskeyqtTvygKQp
 wGgg==
X-Gm-Message-State: AOAM5303lWcnphg7fNxufZ/uopZkjdpC4jsSqtizzyxF4K4vwIViI3U+
 eVgtc0kUlsPApWyYcxAnmNQ=
X-Google-Smtp-Source: ABdhPJxStwmIthIUA++khUWtx+qx1BVfAS/jMvDgsTU1bqiz3K++ChYbHlJMBeZAq5/maT4/buJuaQ==
X-Received: by 2002:a37:a147:: with SMTP id k68mr23143111qke.66.1616975871664; 
 Sun, 28 Mar 2021 16:57:51 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 23/30] dma-jz4780.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:19 +0530
Message-Id: <ecd961a789c07f2c6a05330688e084547e78c191.1616971780.git.unixbhaskar@gmail.com>
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

s/proceeed/proceed/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/dma-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index ebee94dbd630..451bc754b609 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -379,7 +379,7 @@ static struct dma_async_tx_descriptor *jz4780_dma_prep_slave_sg(

 		if (i != (sg_len - 1) &&
 		    !(jzdma->soc_data->flags & JZ_SOC_DATA_BREAK_LINKS)) {
-			/* Automatically proceeed to the next descriptor. */
+			/* Automatically proceed to the next descriptor. */
 			desc->desc[i].dcm |= JZ_DMA_DCM_LINK;

 			/*
--
2.26.3

