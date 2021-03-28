Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 528B034C03D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:59:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t392H8Zz3cZw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:59:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HBBLF/SJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HBBLF/SJ; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t0F5czPz30Cm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:29 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id v70so10931500qkb.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+g6kPIG/jwFitPzoitjd4fSzc6P/hya8rywnHeMN/8=;
 b=HBBLF/SJTiVQWcLhNqq7bzpHR2fKW9LP6DWRvUsmYI7rcgdhmE09hx9CIxGfTsumKX
 isRs8nn27xIKkAFpC/ZbyFrFtAkA1tz5NS7xJ3Ovmkz+afQ30TBK5a8we2BRZXGgjxxr
 z6kTysKHQ1ynwBd9QItRNqLsEpW7uXvoTnvwnv8XkMp+fdf3Uuptl6dTZMalYNMRHWxF
 NM0QNQoHDeEh0fx03RO8xhl/6Q0tu1MW6TIguY4L/6GIaX3v1qxLcUp3UUYUodE+6H6H
 XAXaSfBSUy0AypaInMTUVAZebzJYkGqKi/dXcHv+x3xT9jmB94ueRb/JpcSu+XrxdLCF
 ALaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b+g6kPIG/jwFitPzoitjd4fSzc6P/hya8rywnHeMN/8=;
 b=KUjtTPcaKCOg/z4Y2L8V9uo/n/tzow7JGVNXAIDN2W4GHiTG5gyYobwuB4Izdzm2+e
 KgPS+XkU2WT4OJQOpVZjTdUZVV7MEL+Rhdiphsdb2aJTC7hQPu7llXJ+RRYxneiybLXc
 Ec0nkOxzfKzmne8jX3jxPJ2Ruum8ZMJ2Dc4ahEnzTwK9ZzeJVtUwwl3rXg1kuZ3u+tYK
 nUQqNtnL2Yj7yCAps1xNI7fy3ZPBCzsU0tkveUIls8reET5y275XTmbtSnobrdQ/x6XA
 qu+75GVlzm70ZgS5SgSLz0lNwF31E0OlkuiLknRqRdyymjaa8D2fVYIG2xtgeQ8yEA6U
 cBgw==
X-Gm-Message-State: AOAM530vuv6sr+MAOeL6C5bhR67Y+UsVA8dDR/PVLnBoRlJankZyZdrD
 D2+Mt4ijvPQTTZYP8j2/r68=
X-Google-Smtp-Source: ABdhPJyldMxvnEBh7c5nmTQttLQPp8mr5BNjSHH3pinXqHmSCm2R9IbveYuxti7c4ebHxEhEJg5Pcg==
X-Received: by 2002:a05:620a:cf4:: with SMTP id
 c20mr22555044qkj.134.1616975787315; 
 Sun, 28 Mar 2021 16:56:27 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:26 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 06/30] idma64.c: Fix couple of typos
Date: Mon, 29 Mar 2021 05:23:02 +0530
Message-Id: <0e722d154cb5b29d8bad59481e74fc4853ee930e.1616971780.git.unixbhaskar@gmail.com>
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

s/transfered/transferred/  ...two different places

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/idma64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index f4c07ad3be15..3d0d48b12e28 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -282,7 +282,7 @@ static void idma64_desc_fill(struct idma64_chan *idma64c,
 		desc->length += hw->len;
 	} while (i);

-	/* Trigger an interrupt after the last block is transfered */
+	/* Trigger an interrupt after the last block is transferred */
 	lli->ctllo |= IDMA64C_CTLL_INT_EN;

 	/* Disable LLP transfer in the last block */
@@ -356,7 +356,7 @@ static size_t idma64_active_desc_size(struct idma64_chan *idma64c)
 	if (!i)
 		return bytes;

-	/* The current chunk is not fully transfered yet */
+	/* The current chunk is not fully transferred yet */
 	bytes += desc->hw[--i].len;

 	return bytes - IDMA64C_CTLH_BLOCK_TS(ctlhi);
--
2.26.3

