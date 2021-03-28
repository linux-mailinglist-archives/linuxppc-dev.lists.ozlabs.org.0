Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191534C045
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:59:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t450lG9z3d7k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:59:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DU3fOkSX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DU3fOkSX; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t0R5yKwz300Z
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:39 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id i9so10934320qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2CB+oDzRlKTXsQgvZVkoJMCXZMGg7B/MCg4u+Njtv4=;
 b=DU3fOkSXckynV4e9icZMhz7PfRsCbCFt8b1N3nx+vNJ0YQAtxeW+KmaA1o2ylavs+P
 G9TimVl49iLForzkyymJxqn2b28D4EzXm+ZI4/+f1dCXrwhbTbfRDX5G0QL1ER3Fhh0x
 dpDIUd6cWj4XZo/T3/DIaUMXfwdvNDgHGrHnl2tCzUbRq0Jfg/A1B6xXt+lUOwYkWcpB
 T868H80uh8Oet/UF1dj/OlPzy7hR3Ne9fF8ulO7aD4HXzCovy4cvZLjyK5mn8psXkAyf
 Suwp4AtV5/4hhTchePwPzbFsv8AI9iWSj9p3cyHx4hXz3hJw06YVnKG5SESwuZzZ6r74
 UuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2CB+oDzRlKTXsQgvZVkoJMCXZMGg7B/MCg4u+Njtv4=;
 b=Nj6W5nHSGdrKtLleR6ucdRGbgtVmTCN1PhXb1zmDUrMP6s2D8TR7M8nIew0PDor8Wf
 ufAP5VKkA0C7oSPbGkol9TgyhByVoNgQWwOPpy5OrFb8TPZsH61mVlng/mH/h2qLvh6s
 GOWCORVji2gDcsJcpR5Eg3HI0SOzTvq91HwMsZJOynRZzWEKgYcsM+hvs8vRrMjZ+bqT
 dyUuHrqUbgovigbIBHxU7uA0v0DGt6aC8zURUjmPn9S09D6uoosMnMpnNMYpOB3J2VmS
 KrBLpFZ4SbmIBVO+EC2orBY6/a05O8j+8cIuWI8yGFr4FuORB1hgvip2D3L+vqY1inLA
 JOPw==
X-Gm-Message-State: AOAM531+6PGf+G/t45nmFAY1/8rANjZXl1zWES4RhfjnOYOwfYG7sqhT
 bYTU62KPkZZyaYgjPRdFHuE=
X-Google-Smtp-Source: ABdhPJxvo48SXWkMjNKknPMovLJbk743rE6Sor3y7HvVUau8ciblHI5RRV983LICXWJpgrB6vyRknw==
X-Received: by 2002:a37:9f4e:: with SMTP id i75mr23450908qke.283.1616975797420; 
 Sun, 28 Mar 2021 16:56:37 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 08/30] mv_xor.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:04 +0530
Message-Id: <46df86afac6c221e7eda9586db1233750c1c5477.1616971780.git.unixbhaskar@gmail.com>
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

s/capabilites/capabilities/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/mv_xor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 23b232b57518..a43388b6a30d 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1074,7 +1074,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 	if (!mv_chan->dma_desc_pool_virt)
 		return ERR_PTR(-ENOMEM);

-	/* discover transaction capabilites from the platform data */
+	/* discover transaction capabilities from the platform data */
 	dma_dev->cap_mask = cap_mask;

 	INIT_LIST_HEAD(&dma_dev->channels);
--
2.26.3

