Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB7467CDB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 18:51:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5L3T63Bfz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 04:51:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vxtjt6fa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Vxtjt6fa; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5L2s40gLz304t
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 04:50:45 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 24DA11F41317
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638553842; bh=yGwScbDhyL1oOF9cERSZ73Apg4NOw/m+9XA+Lj/me2k=;
 h=From:To:Cc:Subject:Date:From;
 b=Vxtjt6famLNA0bPuSzq3bwFuOHlAF37VLUzF6Xnh5G+AEhTP3PK68JyVyLf2GDPSM
 nukyGs3LqgrALzxv8qz6K6lUp3sngRdfKg4ZQ3zP+Sdupj96LyVycjFMvKbylR34ob
 Q0cZlKVmXEVjXVHUNLff+O4/1OCqRFhuOTpCca9ZV9VLs4oSgwLb6Af+009/xCkKDk
 WSN/5bTtQiWnYUTYdjvaeUwcAkpIQZLA6LiGbKeXWiGvz5/xJR6WxiakHvta8BN+QT
 aoM/ptM7faU2Vu1rRGdqm/W7jNx0l2Oh4E6UlLp4r/V/T57DneNnHeKaZmsGj+syxD
 +WHh8is4OL9Sg==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for
 tlv320aic31xx
Date: Fri,  3 Dec 2021 14:50:17 -0300
Message-Id: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
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
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz,
 nicoleotsuka@gmail.com, broonie@kernel.org, bcousson@baylibre.com,
 michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a follow up of patchsets:

  [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
  [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting mclk-id

Patch "ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec"
in "[RFC patch 0/5] Support BCLK input clock in tlv320aic31xx" missed a
Kconfig option. Sending incremental patch fix.

Regards,
Ariel

Ariel D'Alessandro (1):
  ASoC: fsl-asoc-card: Add missing Kconfig option for tlv320aic31xx

 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
2.30.2

