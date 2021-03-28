Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD52034C04E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:02:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t7j5hDLz3dxq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:02:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nofPQHYz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nofPQHYz; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t172YGPz3bxw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:15 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id l6so25709qtq.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFtxWE0StKfcC+URsv7nAjsC2Kf78xuu9a0HtqKdSlU=;
 b=nofPQHYz+R+Oh7tBn2NrHqcJ60wz0I6awH3+nn+VeY57PjK9/aNKapSiLLecIClvPE
 Wv+VWFlug249FdqQUEnblJ5mnlCINYaNx63BE/qOihUhCU+JaQ/WqSPiCuKhfSjQbhGv
 sBRNZ9lVKQXJGBC11+kHxahv9pSjNr/fTi0d+YVlFs4PWEH7ZQGtYbkuhE6TF9M1XIi2
 OaPcpcSIEMOOc32j/1qRcNe0pfEquahJ0sNCoEtLMNpLSu5FueclTvKRvW/OcNHihNtC
 0IMi3H/cpoMpeAJG9jiZpJyTWlCGbUvhb9/0lczXT1gcHms5Qe+Z9kXEzBI1StWYjMxW
 2wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFtxWE0StKfcC+URsv7nAjsC2Kf78xuu9a0HtqKdSlU=;
 b=F6fwSWbqw4ne5Z6daL+/Sx6PiXvAFPrTuepXzLmkHCTWnxbJoTdQIZ23sWORxwuzMt
 DRoBN3dKBRu2GzFNchsdQDbYj+sv0PbrwmY5UNIKiuNEbYEiumplMFakQXYdCkbdvHPA
 gCyy67k4ioXv8dog8KXKGpl4A9q3P7N3TB7/RC1EP1Zzx6plNlCiIk0KlsM+gV44EgnS
 l0YHSWW9JntEMsLBcj6ztU8fwmPM3vWU7/rXIqlYtaLzEVuc0MCJE/ewg9sFTyWHZx7q
 KMMqCdbFc6bsjnm9p9ncWmHY+Ucx/MQ7H/8xYVThXRsQ7BMtpo1EEuwbkHkrfcbjlBdj
 /FBg==
X-Gm-Message-State: AOAM533bWLkSOPZvvSYbliQEeOWMuBcNoaipTd/G8X8WW2dO+dEkGyfC
 0AGOUawjavNqRl9rkZ0VSCs=
X-Google-Smtp-Source: ABdhPJzdepGd4ibSSylbqz3lykO6e7Iu/C1yudQOjI9dZGJHJpjheIp8QepnwzKrjFLrJcsbOfjQlg==
X-Received: by 2002:ac8:7fcd:: with SMTP id b13mr20277139qtk.68.1616975832021; 
 Sun, 28 Mar 2021 16:57:12 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:11 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 15/30] s3c24xx-dma.c: Few typos fixed
Date: Mon, 29 Mar 2021 05:23:11 +0530
Message-Id: <062bbb694c995aad9ca17a80bbc63716f116fd9f.1616971780.git.unixbhaskar@gmail.com>
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
s/desintation/destination/  ...two different places.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/s3c24xx-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 8e14c72d03f0..045f2f531876 100644
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
@@ -920,7 +920,7 @@ static struct dma_async_tx_descriptor *s3c24xx_dma_prep_dma_cyclic(
 	}

 	/*
-	 * Always assume our peripheral desintation is a fixed
+	 * Always assume our peripheral destination is a fixed
 	 * address in memory.
 	 */
 	hwcfg |= S3C24XX_DISRCC_INC_FIXED;
@@ -1009,7 +1009,7 @@ static struct dma_async_tx_descriptor *s3c24xx_dma_prep_slave_sg(
 	}

 	/*
-	 * Always assume our peripheral desintation is a fixed
+	 * Always assume our peripheral destination is a fixed
 	 * address in memory.
 	 */
 	hwcfg |= S3C24XX_DISRCC_INC_FIXED;
--
2.26.3

