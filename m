Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A009689515
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 02:46:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466HH25LL1zDqgp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 10:46:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=embeddedor.com
 (client-ip=192.185.47.179; helo=gateway22.websitewelcome.com;
 envelope-from=gustavo@embeddedor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=embeddedor.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="V+g+WALm"; dkim-atps=neutral
X-Greylist: delayed 1397 seconds by postgrey-1.36 at bilbo;
 Mon, 12 Aug 2019 10:45:24 AEST
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.47.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466HFJ2XxPzDqcF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 10:45:23 +1000 (AEST)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id A3493654A
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 19:22:03 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id wy65hDwns4FKpwy65hLFOF; Sun, 11 Aug 2019 19:22:03 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rOOPxfsGYN4ADAoetTEhwGr2GPC2m5yYCGICAwSLA1A=; b=V+g+WALm4X/kwH+wvXaJ6qDBvd
 waEP+UkdGFUylUdlIgI4Nevdkq6rFad044GJxvbyq1DCf2nLjQcTTnBONgh8Q7RNWPJJl1wcngKQ6
 tvWThJyI6b52FptrqWKwwudEfSMuwE5etxuDMPs6dLhsqCNrSzUjAZnuwgzxf1XavDACYLcnN+8eX
 P7p5q+x9/rMd/I9EfZYazn2SocvkmRIr2S1T6o6Oy/C3KqmN5ayXseInCj90f3yPE9aBwV9R3sNo/
 TX+Th24EIsrPyuCUgC0BJAWNlHdNIYzUKq5rDhjO2w7USIw6vW9xrt3zzsArkl5Rg5gJDw3aG/n4V
 Q1Shd5sA==;
Received: from [187.192.11.120] (port=52044 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hwy64-002b9l-LT; Sun, 11 Aug 2019 19:22:00 -0500
Date: Sun, 11 Aug 2019 19:22:00 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH] dmaengine: fsldma: Mark expected switch fall-through
Message-ID: <20190812002159.GA26899@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hwy64-002b9l-LT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:52044
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark switch cases where we are expecting to fall through.

Fix the following warning (Building: powerpc-ppa8548_defconfig powerpc):

drivers/dma/fsldma.c: In function ‘fsl_dma_chan_probe’:
drivers/dma/fsldma.c:1165:26: warning: this statement may fall through [-Wimplicit-fallthrough=]
   chan->toggle_ext_pause = fsl_chan_toggle_ext_pause;
   ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/dma/fsldma.c:1166:2: note: here
  case FSL_DMA_IP_83XX:
  ^~~~

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/dma/fsldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 23e0a356f167..ad72b3f42ffa 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1163,6 +1163,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	switch (chan->feature & FSL_DMA_IP_MASK) {
 	case FSL_DMA_IP_85XX:
 		chan->toggle_ext_pause = fsl_chan_toggle_ext_pause;
+		/* Fall through */
 	case FSL_DMA_IP_83XX:
 		chan->toggle_ext_start = fsl_chan_toggle_ext_start;
 		chan->set_src_loop_size = fsl_chan_set_src_loop_size;
-- 
2.22.0

