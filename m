Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C034C05D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tGW0xStz30DS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r9e3a2wK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r9e3a2wK; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t2S0yBKz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:58:24 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id z10so10909675qkz.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OzLTjr1QMwsBd8ul22IMj5qh7q/mkchMq8nJkxCkqyY=;
 b=r9e3a2wKOgpXCJCo+aWL5/d9M1nteMw5u0JfcT5v+U1WeLlFsUdTJtF08TixWpxMKN
 YOD1u3JG8FP2VSPHIxLAz8eyeTW7mKistUjRXRPuJmpwD4BMio2K3MX1BHXh30tgr+HS
 WkzGAULz8HC3J2TiK1vBwO2PBVjrMfhok856SYM9QI5K2u/kKIUyC6gGKYdErlSpXQ4X
 n5ywUcSi2xtng/Z0W39xMqETvdlLlYlXLhEnBKsLgR7MX8S21rvncu5XNVqEvqtPGWsi
 BDbqqdTj0jxa+LbMW45UGa5pH81aWPydRGGHPaGxa/5YSoAfD3YkO5GRqeKV5jDkYTwr
 0RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OzLTjr1QMwsBd8ul22IMj5qh7q/mkchMq8nJkxCkqyY=;
 b=cqaY9FFchAAqgY483CkdUD+8z1CitrVuEq0obFvfNmse0TDMnUCBvpwgcI6drC1kI7
 PAP85/+SxRzky/tNW7B0538x8tdF1aBJHpsISxv4jt0Ow6I/Sa2+aVBkciJncb+GhpOP
 yeEHzT2nMmGzew4ihiD9dBjoInavwePBDK3ALTVIOq1xFeC/FSvxfSeRHhBL/WxPBTms
 nTyBS9b6QV6OdyZgD8HNJC84QC/8xdHOKIAdchr893IdGLMDRhEBoBdbCr28zVfj7YJ9
 mjn+zNzM1p+cdP7l6hZQdk2EfdJ2VE6bQUXKCg7cIfTyGldPwLYoRGH3V4a4UnyCPY7P
 bLYQ==
X-Gm-Message-State: AOAM533NlkV4PC6f58jmtDGXNuy4AI2dFxx3VKXR5t6rF9SFWN0oQXQS
 GPuoyL52a9Gfzf8lRvRmwKQ=
X-Google-Smtp-Source: ABdhPJzZMvKYIloLfO2fexs1vtEuZv6khlYZUkE/hvVvZgpuiguBiwDPE1c2rtdyr/QBSVJvO+1KkQ==
X-Received: by 2002:a37:6a47:: with SMTP id f68mr23321069qkc.12.1616975901742; 
 Sun, 28 Mar 2021 16:58:21 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:21 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 29/30] edma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:25 +0530
Message-Id: <28685183e34f3ae6839eb73265f9055f554ad6f1.1616971780.git.unixbhaskar@gmail.com>
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

s/transfering/transferring/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/ti/edma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 35d81bd857f1..5ad771e34457 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -1815,7 +1815,7 @@ static void edma_issue_pending(struct dma_chan *chan)
  * This limit exists to avoid a possible infinite loop when waiting for proof
  * that a particular transfer is completed. This limit can be hit if there
  * are large bursts to/from slow devices or the CPU is never able to catch
- * the DMA hardware idle. On an AM335x transfering 48 bytes from the UART
+ * the DMA hardware idle. On an AM335x transferring 48 bytes from the UART
  * RX-FIFO, as many as 55 loops have been seen.
  */
 #define EDMA_MAX_TR_WAIT_LOOPS 1000
--
2.26.3

