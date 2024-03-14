Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83987BEB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 15:18:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=I3/NWn3P;
	dkim=fail reason="key not found in DNS" header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=AueD9i4M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwTyM5pv3z3vcs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 01:18:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=I3/NWn3P;
	dkim=fail reason="key not found in DNS" header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=AueD9i4M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Fri, 15 Mar 2024 01:18:10 AEDT
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwTxZ3278z3cWR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 01:18:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1710425890; x=1741961890;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8iPlLmUMgTAPqy90kGRd7xSvJIZZRBMTH99jyn15Q1U=;
  b=I3/NWn3P0YpOibQM/VkrZRu7NsdDEPeW61XZK8oP/Kz/nP7icIL7m3q7
   ObjxMopoXk5G+be2KsQ8Cd6e54mpMnVw1gYxMdA5Rd3rQrOUuUFDYoSPr
   rGz4yKjscE1P8m3x/yCorpIglIe1XkP0Ioww0KvDP3G6UnnVydDHr/m+G
   uYZ1kqSBwL5nls9ICMHe2XmSgu2SWrUvUQ1zsNrJi4MUl8uDQmX0UGqpl
   h2mvTTri7baMq32+NyY7155wyNoLLNepP2Dmq50VWpCHcCKWq6ICReEja
   GmmdSvjdbGjo9D+Gi6NI38+AnhEtV2Bv6/G9kAVqv3HSXd1r+yXg2PkGn
   A==;
X-IronPort-AV: E=Sophos;i="6.07,125,1708383600"; 
   d="scan'208";a="35915593"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Mar 2024 15:16:57 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDCBA16EA37;
	Thu, 14 Mar 2024 15:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1710425813; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8iPlLmUMgTAPqy90kGRd7xSvJIZZRBMTH99jyn15Q1U=;
	b=AueD9i4MSbWj8uDoyxhJnFzJjBepny7VkKEApYcIw7tTFraO68yvuhq/FmEgRpDxcKT8EX
	j66+6KUj9UlkVXTFnfoTttuazt9UfiAMkfytU9h2+TG/6S7xsbjKfo47je+NGIqqy3irHU
	Zg3EnXFNQ5IrfIXzV1orSYS7KfpyTneJF+ZmwdhSbdiQR9iwnQta/Nh5gv+NUAPF4rkAmq
	sn9Dk5dN1uPtjvM+J9OPJMm3x4DIOGnBn7r63YtQgE+L+0jMeHbYAOSZmXuTBx0VHe18x3
	u/c8Bt64qTcdfJKQNtaMubrpFyZwYJ2RVM4z+PEF+GMUI1NPI+oXIronXfbNZg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/1] ASoC: fsl: fsl_ssi: Add dev_err_probe if PCM DMA init fails
Date: Thu, 14 Mar 2024 15:16:42 +0100
Message-Id: <20240314141642.2943605-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This happens especially if this driver is built-in, but SDMA driver
is configured as module.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_ssi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index ab6ec1974807..4ca3a16f7ac0 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1401,8 +1401,10 @@ static int fsl_ssi_imx_probe(struct platform_device *pdev,
 			goto error_pcm;
 	} else {
 		ret = imx_pcm_dma_init(pdev);
-		if (ret)
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to init PCM DMA\n");
 			goto error_pcm;
+		}
 	}
 
 	return 0;
-- 
2.34.1

