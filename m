Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F434C030
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:58:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t2h4nmYz30MQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:58:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rGFcWETJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rGFcWETJ; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t085sjnz309h
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:24 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id g20so10955394qkk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1jriUq1sL9lb0mtxN9KbapTjAFOd4HdFdy/Egjy5og=;
 b=rGFcWETJr6kx1FhK2VwuyFhj5mEQ2a9w1BMQGwfNSg69VWO2NHz6DRFrgg4SGJ3Z+8
 +nckc0b33f7uTjbCD27I2Gl2Jdn2HT3qvcYJdS4WPW1YXJNFE46lhkK9BighwwVM7M6Z
 sbmrrRJH2t3VrRNWQZyiWfEew9FMNFhk6Zl5kKcli7J7b4abKENXJWSILGRJkqUTX2+t
 WHSb9X1FAt5JDH4q/BeU5ocKsg/w33VbP7p3+NQRcRhAMcotq7sULiWyjAlOYf/mHOqB
 H9GvMPiPug0qb8cAXChS8dbpZy4uTWPDejj82uflrDF2gz/fTxAhbelewAFroVWE3qew
 2RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1jriUq1sL9lb0mtxN9KbapTjAFOd4HdFdy/Egjy5og=;
 b=p+sgQ6AKoh8QdQ4PleAxPs13ZEsfiSCg9psfpShdkyBX5dApJJVvkWfLtSpGBHUJxB
 EGosqDgdRmguN3bTOiINru0vMtqxZTRNV3XmgGh8+78x2ccnY8YTz1PbbeyWp2roqY8e
 9JXV+msep44CKoCxH/oEsqVz2teO0TzihUjiSPurbPPCgd2FcjVGCG5TXjetYwPlhisa
 32KnCxoCFF4WUdrnc22MS+fq++W0yO2izMd5WX6eQn16PUnnwmRyevXtNXjmZmaeIus+
 hcSDDoJZT5rcG6KllMT7Jm1Syu+VDU5Yyt1k7QWgZer60HxA00GvFX5fO8OtiK4iJV4t
 rSHQ==
X-Gm-Message-State: AOAM532L8dgk5etZNc1g6dCPXM+DpgegYYy6c3Kt/9REBvV5gLojkDLR
 AU0wxf8NhX3/H4DgN5mzJNg=
X-Google-Smtp-Source: ABdhPJyKy/81JUq/KZUC1NO8pklpNrg2DlDqj4i3GsKGyS2IOzo8E/4XiQGvp7DS8QS7skiReIXQZA==
X-Received: by 2002:a37:584:: with SMTP id 126mr22223976qkf.274.1616975782447; 
 Sun, 28 Mar 2021 16:56:22 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:21 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 05/30] bcm2835-dma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:01 +0530
Message-Id: <77d89989f1cb7362f0a3a5a279d7846a93ae3968.1616971780.git.unixbhaskar@gmail.com>
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

s/missmatch/mismatch/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 630dfbb01a40..e6baf17b0434 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -369,7 +369,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	/* the last frame requires extra flags */
 	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;

-	/* detect a size missmatch */
+	/* detect a size mismatch */
 	if (buf_len && (d->size != buf_len))
 		goto error_cb;

--
2.26.3

