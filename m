Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D3A34C059
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tDZ6r9sz3fmC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:07:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UBnTpPl9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UBnTpPl9; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t241rvCz3c8r
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:58:04 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id y12so1118715qtx.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpe0M5+HDAqDdeQIOejQbDfFbOvYGihGTywPqCQfPxk=;
 b=UBnTpPl9V62AUBrqC/YSqABPupQ76JLXTf9wdWJSwN8Y02M91Cv2rn4ZwjhokBjvOT
 caKPPonpNMbkYJsmubQ2Bumfsz0OvmkkTWS8FwgdpAJJ2UjLRJp7acfTyFudWVBAqVM4
 mAaT3aHaultxmZCgXXXV5OvJ6J1msraQIsZAdfJkw4uSiaZABZyAHr7r8flbrOwvpPZH
 zBFD5EMOq2xPgbxunhlKskRUqPhi8QLQoyZ1kqDj7sVSl05HXPEVHwZylycvJDJMix34
 BhEq84yLvrSkLfYTrEw/MPY6YGk4Ihk/VSSgfbjYkcNwFP0GEpF+EGDzHiMvb4HSukdQ
 PlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpe0M5+HDAqDdeQIOejQbDfFbOvYGihGTywPqCQfPxk=;
 b=h3PrE9rkmD1LFzI1i7p3iEt2pe6Egs6Vh4I18WIvqZEz2vgfLxcST5VrU0917cNlnn
 m75lsD/v7ZVt6r2buRUZGDdFgXCDxy7jzRGQ6YLDp2uaszMccjUeTXviQnh6ZVHufVgT
 yD4MbQAQOeXz0cTmeb1CYxzzpLxHZzlvp0V3Zh0yOTm3iIgfs7lU/URdTy3ragDkoX5H
 EJrOZnC3Zrv3bTE3ygb/RxWiBMI7IlCJ0dDE6vLD5BCu568Ud/iiR4mBM7WpyReg79d2
 wj3dZTnQyFjTR2WPUxJWiRBWJx4YkrZaiLYfcgBNOC8FIJ3A6TZxlokIhjGYcvdE28YK
 WO+A==
X-Gm-Message-State: AOAM530I7+CvjOlpfrU+TFBmRg8cRNde7VwdoP120VfLnvyBVHDC6EX+
 pg5VaFVT8+QKESvcXKJ66cI=
X-Google-Smtp-Source: ABdhPJz4aA7ldRQgsCMEBAdvXkEvBGcKpJz3Kr32GBN9DAQyr64A5Qqw5tpT7IRp1HeHqf9g6ttT3w==
X-Received: by 2002:ac8:698f:: with SMTP id o15mr21281625qtq.39.1616975881895; 
 Sun, 28 Mar 2021 16:58:01 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:01 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 25/30] ste_dma40.c: Few spello fixes
Date: Mon, 29 Mar 2021 05:23:21 +0530
Message-Id: <ef2c19d475895f8a627335e37560a18d28c062e9.1616971780.git.unixbhaskar@gmail.com>
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

s/ealier/earlier/
s/orignal/original/
s/manouver/maneuver/
s/transfer/transfer/
s/succees/success/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/ste_dma40.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 265d7c07b348..39fa2fb74057 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -155,7 +155,7 @@ static __maybe_unused u32 d40_backup_regs[] = {

 /*
  * since 9540 and 8540 has the same HW revision
- * use v4a for 9540 or ealier
+ * use v4a for 9540 or earlier
  * use v4b for 8540 or later
  * HW revision:
  * DB8500ed has revision 0
@@ -382,7 +382,7 @@ struct d40_desc {
  *
  * @base: The virtual address of LCLA. 18 bit aligned.
  * @dma_addr: DMA address, if mapped
- * @base_unaligned: The orignal kmalloc pointer, if kmalloc is used.
+ * @base_unaligned: The original kmalloc pointer, if kmalloc is used.
  * This pointer is only there for clean-up on error.
  * @pages: The number of pages needed for all physical channels.
  * Only used later for clean-up on error
@@ -1630,7 +1630,7 @@ static void dma_tasklet(struct tasklet_struct *t)

 	return;
  check_pending_tx:
-	/* Rescue manouver if receiving double interrupts */
+	/* Rescue maneuver if receiving double interrupts */
 	if (d40c->pending_tx > 0)
 		d40c->pending_tx--;
 	spin_unlock_irqrestore(&d40c->lock, flags);
@@ -1970,7 +1970,7 @@ static int d40_config_memcpy(struct d40_chan *d40c)
 		   dma_has_cap(DMA_SLAVE, cap)) {
 		d40c->dma_cfg = dma40_memcpy_conf_phy;

-		/* Generate interrrupt at end of transfer or relink. */
+		/* Generate interrupt at end of transfer or relink. */
 		d40c->dst_def_cfg |= BIT(D40_SREG_CFG_TIM_POS);

 		/* Generate interrupt on error. */
@@ -3415,7 +3415,7 @@ static int __init d40_lcla_allocate(struct d40_base *base)
 		base->lcla_pool.base = (void *)page_list[i];
 	} else {
 		/*
-		 * After many attempts and no succees with finding the correct
+		 * After many attempts and no success with finding the correct
 		 * alignment, try with allocating a big buffer.
 		 */
 		dev_warn(base->dev,
--
2.26.3

