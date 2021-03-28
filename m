Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156B34C054
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tB901S5z3fMx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:05:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bTEbIGlU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bTEbIGlU; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1b12Gxz3c5v
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:39 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id c6so8263053qtc.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTMepEQ2KULfrsHgV8Kxlgt84PsBxxGqM80tVNIqbWY=;
 b=bTEbIGlULsXvf6mp9eD0MKL9UGtjeyV3vz6uIDnSq3FIpNNN4nSxkCxJXDeGfDDYyB
 zrGFOLTVdImkvTyvLeq0/4E+jnMEn98Q26GKTp+Nz0mhhF+ZDnkEgHrk7CFt7Ca0UvL4
 zn/PcJ5S81UeZvLDHEV66orBfcuymqrZb2/bTljWCMBn9pDs5sHfT9lWNzoSKvdiRlgf
 XdUsJFchXNreOvNlDTRTJnKriv/0ujteXmBg14gklE8iTN8dRgUSPOi0bMkwDOBHnpR4
 zgdlEoqgFMO6iS16vaq1e+iDX2yJvKTuHCAjQVE2Bd5zNUG+/3CwHCC8hFaVUgmb1NiM
 gWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTMepEQ2KULfrsHgV8Kxlgt84PsBxxGqM80tVNIqbWY=;
 b=a5z/fXK/Tj56LLKAa4kCzNrUWyr6rlRRYxRKT6a7MM0B61MRRSPGJ6zDnCOoT7yHKe
 NXUfXjmdbWgQ15Hw9GZExDcaL1jL26r5arCJCwmbzWKLQwUVQcBioF5u80xqKuOvFyZN
 klsELRyrcZtxxXLi8N6IF9GScNkKvEIgNdMBegH+lsPGia2GaNE8pvg6GejhJfuvXIT5
 7TdWU8WjKhnqENHX2QL4Ps7QjZiuVR50f1+MvzkBhez22G+6KRpUYqFnSqL+MPHBJXIS
 /WaALenAZQr3b0+cs/AiW+LggsvTgj8aZft22roc7ASP0Y2Z1Z52XmuG6y5pHdX37pwD
 4p8g==
X-Gm-Message-State: AOAM5338wLimwb06nC7gNpaIgZAQ+WZ7u19YB8kdEwLUvSARzP74Vyeo
 mNfEcq8+ek8NQLvDfoHDQiA=
X-Google-Smtp-Source: ABdhPJwRTC1BpC2ZmqFvyCckRvvuwnANkqHAZvJtuc4Mu8nM99Nfdg+GTNYLo2psV/k5ZUFbmcYhiA==
X-Received: by 2002:ac8:dcc:: with SMTP id t12mr13997202qti.219.1616975856552; 
 Sun, 28 Mar 2021 16:57:36 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 20/30] at_hdmac.c: Quite a few spello fixes
Date: Mon, 29 Mar 2021 05:23:16 +0530
Message-Id: <d4e6597ed691d7faf4b35ca75e392706bdb16d1d.1616971780.git.unixbhaskar@gmail.com>
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

s/tranfers/transfers/
s/maxium/maximum/
s/previouly/previously/
s/broked/broken/
s/embedds/embeds/ .... three different places.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/at_hdmac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 30ae36124b1d..02c09532a9e4 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -374,11 +374,11 @@ static int atc_get_bytes_left(struct dma_chan *chan, dma_cookie_t cookie)
 		 * a second time. If the two consecutive read values of the DSCR
 		 * are the same then we assume both refers to the very same
 		 * child descriptor as well as the CTRLA value read inbetween
-		 * does. For cyclic tranfers, the assumption is that a full loop
+		 * does. For cyclic transfers, the assumption is that a full loop
 		 * is "not so fast".
 		 * If the two DSCR values are different, we read again the CTRLA
 		 * then the DSCR till two consecutive read values from DSCR are
-		 * equal or till the maxium trials is reach.
+		 * equal or till the maximum trials is reach.
 		 * This algorithm is very unlikely not to find a stable value for
 		 * DSCR.
 		 */
@@ -403,7 +403,7 @@ static int atc_get_bytes_left(struct dma_chan *chan, dma_cookie_t cookie)

 			/*
 			 * DSCR has changed inside the DMA controller, so the
-			 * previouly read value of CTRLA may refer to an already
+			 * previously read value of CTRLA may refer to an already
 			 * processed descriptor hence could be outdated.
 			 * We need to update ctrla to match the current
 			 * descriptor.
@@ -564,7 +564,7 @@ static void atc_handle_error(struct at_dma_chan *atchan)
 	spin_lock_irqsave(&atchan->lock, flags);
 	/*
 	 * The descriptor currently at the head of the active list is
-	 * broked. Since we don't have any way to report errors, we'll
+	 * broken. Since we don't have any way to report errors, we'll
 	 * just have to scream loudly and try to carry on.
 	 */
 	bad_desc = atc_first_active(atchan);
@@ -870,7 +870,7 @@ atc_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
 		atc_desc_chain(&first, &prev, desc);
 	}

-	/* First descriptor of the chain embedds additional information */
+	/* First descriptor of the chain embeds additional information */
 	first->txd.cookie = -EBUSY;
 	first->total_len = len;

@@ -1199,7 +1199,7 @@ atc_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	/* set end-of-link to the last link descriptor of list*/
 	set_desc_eol(prev);

-	/* First descriptor of the chain embedds additional information */
+	/* First descriptor of the chain embeds additional information */
 	first->txd.cookie = -EBUSY;
 	first->total_len = total_len;

@@ -1358,7 +1358,7 @@ atc_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
 	/* lets make a cyclic list */
 	prev->lli.dscr = first->txd.phys;

-	/* First descriptor of the chain embedds additional information */
+	/* First descriptor of the chain embeds additional information */
 	first->txd.cookie = -EBUSY;
 	first->total_len = buf_len;

--
2.26.3

