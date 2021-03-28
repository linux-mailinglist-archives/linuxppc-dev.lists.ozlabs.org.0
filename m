Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568DC34C044
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:59:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t3d2Yp1z3cmr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:59:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DZtvetYy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DZtvetYy; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t0L5NMqz30HV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:34 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id c3so10929760qkc.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BnZu67viS33aGYohPjcgklvkVxQfW/8GD9rnxEtwd4=;
 b=DZtvetYyyMD2lBKzbBM4H/FNDCw5hl88bdIconXcj2qDm/jFPH8aghuq5QsYihTAkF
 e50DD81/iTN58j6xxgKz550PmMPq8BQ9hEfPPph+WIdC73rdzg8dJ+UXCMCfg/eL6rpL
 bpYG8Qer1UHLBNEjXOk5LiOfjLy04zj5RiWzpfm0AGaIiSGGdOOUyINW+fPqgXEZLBWI
 ZJCp/duHr3bDu8WGMaUyF5991YwUfo18A+oY2EylsV72rLburV0Y8KLkYvuhvMNXoarO
 w5WASyKO9yq4Ox1RbNmZX7VpJeVNZW6LB+RXDNbwuj6DZyPA6KZYbK1dc6YXhqfBkLPO
 QxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BnZu67viS33aGYohPjcgklvkVxQfW/8GD9rnxEtwd4=;
 b=tobaUd6tMOqY1A1ehzVtLGICvMzjR/pzqLkmycVdNbssarlaQI08D215+sbn6prkVI
 degF+c4qUyP3Sai4rnPG4+G0JPy2fvmHh4TrZrZRjamp5QjEsys4R/8j2FFRoGtbNf5h
 e3ZBv1knwkN2tFic4k41aQL3VZAXlNUnN0yfqD7Rouxuip5hHFFXszumSziZZ/JO1o5G
 PJPw14xK/ojnuwxq0PwGuuwkMIDV6c9r78KnomAWiCMJnxpTyfASZ2Z0kCAifepyeF0d
 EAgR1WBc7jOo6zOskLniMwxr29HOp3WYi9hvOBS3FKHjoCho24C7mXl9aTLNpa8b8emv
 bIRw==
X-Gm-Message-State: AOAM532wGQjbfhT1CdXYf21iicVaKXK66FiEb+rBjGXs/pi9oZDKI8gB
 M1pDCTzg/uGkvfo5wjQWsaA=
X-Google-Smtp-Source: ABdhPJyLnsSA7aDZpYL8OgcC6cA3c2KI3g1ctb8AbY5iG8YBuQoLtMdy1CH0E4ijQxDfED6WKrLV5g==
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr23221107qkm.355.1616975792270; 
 Sun, 28 Mar 2021 16:56:32 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:31 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 07/30] iop-adma.c: Few typos fixed
Date: Mon, 29 Mar 2021 05:23:03 +0530
Message-Id: <a5e2587318ef5fc4e140caf86cfd89ff01027c72.1616971780.git.unixbhaskar@gmail.com>
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

s/asynchrounous/asynchronous/
s/depedency/dependency/
s/capabilites/capabilities/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/iop-adma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
index 310b899d581f..81f32dc964e2 100644
--- a/drivers/dma/iop-adma.c
+++ b/drivers/dma/iop-adma.c
@@ -5,7 +5,7 @@
  */

 /*
- * This driver supports the asynchrounous DMA copy and RAID engines available
+ * This driver supports the asynchronous DMA copy and RAID engines available
  * on the Intel Xscale(R) family of I/O Processors (IOP 32x, 33x, 134x)
  */

@@ -243,7 +243,7 @@ static void iop_adma_tasklet(struct tasklet_struct *t)
 	struct iop_adma_chan *iop_chan = from_tasklet(iop_chan, t,
 						      irq_tasklet);

-	/* lockdep will flag depedency submissions as potentially
+	/* lockdep will flag dependency submissions as potentially
 	 * recursive locking, this is not the case as a dependency
 	 * submission will never recurse a channels submit routine.
 	 * There are checks in async_tx.c to prevent this.
@@ -1302,7 +1302,7 @@ static int iop_adma_probe(struct platform_device *pdev)

 	adev->id = plat_data->hw_id;

-	/* discover transaction capabilites from the platform data */
+	/* discover transaction capabilities from the platform data */
 	dma_dev->cap_mask = plat_data->cap_mask;

 	adev->pdev = pdev;
--
2.26.3

