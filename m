Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC3F34C04D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t7G4NC7z3cC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:02:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Gm9tUcw1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gm9tUcw1; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1115ZQz3btd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:08 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id y5so10919800qkl.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ZQIptdaKO+NG6KGHA5S2pjM0OS7naQnCt9zgnNYCE0=;
 b=Gm9tUcw1/+mThRDpyyzzMTwMHDKH9vZpafertqfrSZ5YO9KbE3sAww3oZ8XGMiAhRt
 kgtAGKj9dtXo99Szxu7K4JpbuKgBBIZREfyljwoHuiTIM5ZAd/CKQ0umxuj//O71kbxD
 Eorzfcnc99sIfIq6B+POBj5vgl6pz1tdC7ugns0aQrf9x/NJct0viJIWVNhC6Y2Bw3k5
 +zV83HR64ZTrH1sIkOEbsmWYi035hsyGGF+Rxz5h3YrJ34Fc/SSZo4abf7eLvn47HyCZ
 1VehmmjVpqRm3naf7dKNpOzu4sq3YMJBnKtBt196sX4MubPgCqv7idERRFBCAhH7OBQ+
 GtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ZQIptdaKO+NG6KGHA5S2pjM0OS7naQnCt9zgnNYCE0=;
 b=I3YxrNgK5a/QUxO/O0gPp+0jiVJgtmWLYMiIS9laj0lvuMlBEqtUzf+yh73As5L33I
 49tCeKba7UaZIECYD9MWylIFixu0kT0stPjzgBYRC5WtEwaSKQ5YL+AnCdKuDK+JRvAd
 HZCkyYgUYG1AgVj5mPqY8stbdim5wvWo8G8VtZmadStBO4LLSbszBEm5DbwEnoHJbNb8
 kIw9fbXDiZMala4MynqkzgmmdpPekApSrGzuKCay4VyoEm2Jbx2Vt2OqoDOQXXe6wBEv
 8hquVHMdFxqdOnXtPGBoACgitG+ORNfCYtKobBDnX/pwYaGkw5z8OTWaJETaRaWrQCjX
 3gVA==
X-Gm-Message-State: AOAM532a0LqW4AE79NOVDaEJE3COu6/QUQdj20c3wpr2zHfYTUMa/5KF
 V8IKgVUl/WpKR90abPMYB94=
X-Google-Smtp-Source: ABdhPJwgPDn63+t8WI0ESglt0cdz3qRSIBNoBZJfy0KnIfKji8LoJbUHTl3eZXAtTJ+tyoAIdpJzMw==
X-Received: by 2002:a05:620a:cf4:: with SMTP id
 c20mr22556318qkj.134.1616975827140; 
 Sun, 28 Mar 2021 16:57:07 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:06 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 14/30] Revert "s3c24xx-dma.c: Fix a typo"
Date: Mon, 29 Mar 2021 05:23:10 +0530
Message-Id: <1d989f71fbebd15de633c187d88cb3be3a0f2723.1616971780.git.unixbhaskar@gmail.com>
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

s/transferred/transfered/

This reverts commit a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.
---
 drivers/dma/s3c24xx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index c98ae73cdcc3..8e14c72d03f0 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -156,7 +156,7 @@ struct s3c24xx_sg {
  * struct s3c24xx_txd - wrapper for struct dma_async_tx_descriptor
  * @vd: virtual DMA descriptor
  * @dsg_list: list of children sg's
- * @at: sg currently being transferred
+ * @at: sg currently being transfered
  * @width: transfer width
  * @disrcc: value for source control register
  * @didstc: value for destination control register
--
2.26.3

