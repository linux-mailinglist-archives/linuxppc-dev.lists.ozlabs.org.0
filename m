Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5330D34C015
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:57:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t1l28wtz30Hq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:57:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jp01Oafr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jp01Oafr; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7szz15l9z303x
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:14 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id c4so10939020qkg.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QaFxE7xJjw3q1QRzUlhL9vl2FAXABYAZdUNglx88dWM=;
 b=jp01Oafr+FYiNYOySvz698WmMQzo+I8B2paqvCFTlCTqcAAL37CMJwgpqQlkW5GHW2
 Dyvbvs+rlqMjPWQuuNHQDuAQ6uVGfCqAuD3H7xHGEPAJOWcAGOy/DrtrhvXYWLU0436d
 lVRkCgJp9jS4fhNJ0qaUC4akHDDGxNg25koKauz70I2VYZQOmotGc6b2/KGof4mKY6LW
 1TzvIv956J7EIBeJBzXRcahb54ThW1Yu5eyDfY18Lpqxxr6dAulMcI1wQw2QFXiQ3c2q
 Ui+ZEYtPOnzUjWjCc71Rex7kRCtuOwcEjgmEOD0DPvlk4vA+pudWfMcYnjP5m3D1ev0S
 YKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QaFxE7xJjw3q1QRzUlhL9vl2FAXABYAZdUNglx88dWM=;
 b=kgJEvXZDV94F5XfSrNvwSWkHbLQSMKhVfhA3Uwrx43u3C1ZarfsUczXULi9N3BDgSg
 eUd2HeAi8apWKt08nye2oM7P5cAAMfvxqiJZ2Gz/NfiTjHuUVSBlgoG+gx0Z9Ip4ybko
 OFk9k4YD+VAPh5+Gh1Nizikki0uQKyph+2HqOo9U32wCeWChPjPLJSZmJKnWH4ObWrjT
 IA/4Sa7fqUwZ4RRobP6hAQOJzWmftj2Bhqa/jP6BrKVBnYNT4kOjOUPd35Joy+wjt6FV
 BF7YAqVeFTJuy87/DS5mx97XaiFKvT4vZDDuhyjJghq8Yjd+uU0jEPou7V1inH6MnfMT
 RngA==
X-Gm-Message-State: AOAM532Lb/ZrM7EeUmyGwy87bUqUSsJkcHxUbg7ctkeQZvZXpNZY6a8P
 x7g85TBiDXr2QoSQL1cNRQQ=
X-Google-Smtp-Source: ABdhPJx0o599PHMcyxzLn8eHnK8YWRJh3bbcuBhN5MPJAY682L8sA466e6YWGWWwK4DIft39eFQPyQ==
X-Received: by 2002:a37:e110:: with SMTP id c16mr23323591qkm.67.1616975772640; 
 Sun, 28 Mar 2021 16:56:12 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:12 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 03/30] amba-pl08x.c: Fixed couple of typos
Date: Mon, 29 Mar 2021 05:22:59 +0530
Message-Id: <b96052cd5c14956852fe7fc13ea47dac7b2b40e1.1616971780.git.unixbhaskar@gmail.com>
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


s/busses/buses/
s/accound/account/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/amba-pl08x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index a24882ba3764..d15182634789 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -121,7 +121,7 @@ struct vendor_data {

 /**
  * struct pl08x_bus_data - information of source or destination
- * busses for a transfer
+ * buses for a transfer
  * @addr: current address
  * @maxwidth: the maximum width of a transfer on this bus
  * @buswidth: the width of this bus in bytes: 1, 2 or 4
@@ -1010,7 +1010,7 @@ static inline u32 pl08x_lli_control_bits(struct pl08x_driver_data *pl08x,
 	/*
 	 * Remove all src, dst and transfer size bits, then set the
 	 * width and size according to the parameters. The bit offsets
-	 * are different in the FTDMAC020 so we need to accound for this.
+	 * are different in the FTDMAC020 so we need to account for this.
 	 */
 	if (pl08x->vd->ftdmac020) {
 		retbits &= ~FTDMAC020_LLI_DST_WIDTH_MSK;
--
2.26.3

