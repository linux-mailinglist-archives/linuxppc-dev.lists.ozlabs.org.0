Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF3457BF2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 07:05:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hx31d1FP9z3cnR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 17:05:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LU1D/2zn;
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
 header.a=rsa-sha256 header.s=mail header.b=LU1D/2zn; 
 dkim-atps=neutral
X-Greylist: delayed 470 seconds by postgrey-1.36 at boromir;
 Sat, 20 Nov 2021 02:41:57 AEDT
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hwgrj1ZWPz304V
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 02:41:56 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 239861F47554
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637336040; bh=oBj7QbVGHlYfnfMUOtd1HZT668Gjf5aMJe4be82ORbo=;
 h=From:To:Cc:Subject:Date:From;
 b=LU1D/2znRnmWQq9S9C99bWFA/kPVCKSRmdq6IEpjNr/rKOJ4bFAO3EQ2mLbFD0TP/
 PlOdn37gYW6Uquu+IGHXIg04zDysKrMQgoR8P+UJ8FGWNAxgKbd00zRG2r7hqQZtsa
 0TtEArzfJ6/8/a0yJ5y1xg8qI0QcAcyK8h1+A+FYGLxkLFT/Tt/ayZIlJOLDEjEC2v
 5v/EY0JnOPiVMeR5EavyjjUDwy8Sw3Q9IV2zfUDPaYUJtQJvzuV0b29l0ZlpDKaimj
 lAUIfOpTh2FmOrTcVSToFOwkzS3NbFST9BvuKJdoirPFTV0ExeGt2bt7Ps+ZIYZlRh
 jJR0rwu89STRQ==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
Date: Fri, 19 Nov 2021 12:32:43 -0300
Message-Id: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 20 Nov 2021 17:01:52 +1100
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
Cc: bkylerussell@gmail.com, ariel.dalessandro@collabora.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 broonie@kernel.org, michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The tlv320aic31xx codec allows using BCLK as the input clock for PLL,
deriving all the frequencies through a set of divisors.

In this case, codec sysclk is determined by the hwparams sample
rate/format. So its frequency must be updated from the codec itself when
these are changed.

This patchset modifies the tlv320aic31xx driver to update its sysclk if
BCLK is used as the input clock. This allows to be used by the generic
fsl-asoc-card, without having to add a specific driver.

Ariel D'Alessandro (5):
  ASoC: tlv320aic31xx: Fix typo in BCLK clock name
  ASoC: tlv320aic31xx: Add support for pll_r coefficient
  ASoC: tlv320aic31xx: Add divs for bclk as clk_in
  ASoC: tlv320aic31xx: Handle BCLK set as PLL input configuration
  ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec

 sound/soc/codecs/tlv320aic31xx.c | 105 ++++++++++++++++++++-----------
 sound/soc/codecs/tlv320aic31xx.h |   2 +-
 sound/soc/fsl/fsl-asoc-card.c    |  12 ++++
 3 files changed, 83 insertions(+), 36 deletions(-)

-- 
2.30.2

