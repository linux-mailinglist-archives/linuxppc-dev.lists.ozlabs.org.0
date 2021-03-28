Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016EE34C055
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tBc6XVCz3fSB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:05:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=a+EXa39b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a+EXa39b; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1g260Jz3c6J
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:43 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id v70so10932977qkb.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LY04BDMd0/4O0qv+wuAgYKhd3ly3Ph1K7x5mf2r/G+0=;
 b=a+EXa39bteLFKTrEHlbm1+MouCIyb9cV+yaNKyv8dIyxqTAhvd31XrjXWbvHHzVduL
 1m4DojoIjOfiyRN7xcr0QpSrR6ePbNm3KqRQY1gbCFcbd22bLf2BWnHwe8lfTEqTjY7R
 M98mtiq0Pq4n7XXjDGYxi4qsrFmCNnBlY+2L6xSLFCm2xU4u2hVKUVCMMgz+W48T3z+F
 Be8AcFVNT/rv2XLUJvW++tnlcFMq9Mx/WmUVOYgxFXIoTtuxIjemHAh4IiTbpweWxeP6
 Pt8RHzRZ4DYYvL/cvUU4JdOTyLGN/JBiDRnApwCKetCmX6P86BiK0xXGUEADFFqiSdgJ
 skQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LY04BDMd0/4O0qv+wuAgYKhd3ly3Ph1K7x5mf2r/G+0=;
 b=mok8EK/wW1KKdeMl8dDqrqg/hL8u99RV3QxEFSFYlOQJu1uH1GbGNOy8F/N55mcr0h
 j1YI23Hj1BlXmAJE0LcS/5YFU+vAbC+OsMrD3gFCaykSSO9IngDxJHtLmlrQvKTADs9k
 YSsbZ2KqsZ/hr0rTrw1h2AcMHgVnVWuh2b23jKnRLSteQKMmpziqm5kpJsnjRJMvXxTx
 y3VmgN4sK8ioKXWp3TCgpng5+yIYhMn15eIJWVIGilvj7J2dFeCMePxBCi7CjtNIo3Ob
 MGZquUzHXGWl0gFIfD2+MT9aKyHsDaTbs9iWwN7bvwUfMYc4sGAbZ6APeunvbu0LGeGj
 w7lQ==
X-Gm-Message-State: AOAM530WOWYpCeDtT1cvC2TkQwmOI+yWDi3+Khk0qpl1AOwnLeuOmHpL
 vi9XEiuYWmwfXGkHQEV4K2w=
X-Google-Smtp-Source: ABdhPJz881qq4XaeZFjTiwc+P8rV7shOVJ9Q+7jnFQ8clBo7myE8qUn50lhxUxxhgg0PUTo5fJ3Apw==
X-Received: by 2002:a05:620a:110a:: with SMTP id
 o10mr23879687qkk.281.1616975861492; 
 Sun, 28 Mar 2021 16:57:41 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:40 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 21/30] owl-dma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:17 +0530
Message-Id: <2e2a9f4d62fe36079229480bf6f65cea0f5be494.1616971780.git.unixbhaskar@gmail.com>
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

s/Eventhough/"Even though"/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/owl-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 1f0bbaed4643..3c7283afa443 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1155,7 +1155,7 @@ static int owl_dma_probe(struct platform_device *pdev)
 	}

 	/*
-	 * Eventhough the DMA controller is capable of generating 4
+	 * Even though the DMA controller is capable of generating 4
 	 * IRQ's for DMA priority feature, we only use 1 IRQ for
 	 * simplification.
 	 */
--
2.26.3

