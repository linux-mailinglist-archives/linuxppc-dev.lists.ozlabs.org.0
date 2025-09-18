Return-Path: <linuxppc-dev+bounces-12417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C40B896BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 14:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSs6F4pxQz30D3;
	Fri, 19 Sep 2025 22:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758284437;
	cv=none; b=K3hfqHlNGFXAAvvihD4r84Gqn4KbH77xFFL09ZJXdbBu0MS0X+pMkhGZ9hdZ/mQf58jtvUjCC5xdSfiVHVQ2iuQB2VSDB4PWRDmn+EfjEwg5EJpWmlocuRXLL3wwn8POv1de1tEgtzCMpvFSYCF9PCtz8GYmYFhJI2GMQgevDZWtxYOKa7lvcpuDhm5XVT6ekTXmRUjsbMuOZ8cyfSfb/wXHe74vpLdXlEfK2K2+P211aB1B6cUq7DfhAV1gF2xukFQpMNufg33xZe9YEoASaCK7Ho9J0W3hq0OJ7YLx2k+8rcvW6SRhS+JIwjj2FDs6VgmFEtch831RMb3KswNRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758284437; c=relaxed/relaxed;
	bh=ocD8LP5kPQIQqlpWUmHZIyZiNchzokTrKlUIDulbyIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FFUMmN+efoUAWBpuoo55Er9WCbNHAsUKKni0aQRlDTKPebRyY3l2VkQPxmP1iZpuQRcmQFRGdsf1zGIGPL2HOCalwjUYxzUk/WHCFj5IXoWuf/czAXeBQwxD56633RKPvmywuNDDU5vX2Vmz69D3xIZwUxR8OYp72Qx8myWlXyfxtuCK0ibQxfySzmKoD+41LwLeTbQbiBHc4fy1717dqvd4F/jtlBlgSwJZfFKcKhtZwmrElhOXzDxXQ5EkCd1w4n2kcn/dc6OGet7q4AmTONCAnmsCXnamPlTroUAzmQBQEPDewzwKH3HZIju02FOYxCoFgi3R+9n/eC18N2BkbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSs6D6jqFz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 22:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSKSP59dCz9sfw;
	Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCoeXJoTf93q; Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSKSP3td4z9sfv;
	Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D0C28B775;
	Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qRoFWfinmY1o; Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B16A98B767;
	Thu, 18 Sep 2025 17:34:28 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH RESEND v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of interrupts
Date: Thu, 18 Sep 2025 17:34:07 +0200
Message-ID: <cover.1758209158.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758209656; l=2459; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Rw14QDBJonb5u5+cR6dROagBvXa3A1OgDpRn/q0SkpI=; b=2JOfAbtKY5oOgf9Q0u+gokAxci8wOnFAoh+mIaShgDQVavxJparyog9AWj22aslzf1HGZl38O HWCFs/nJPimDCioJkfe41o2WfF9P+cnlWCmlzbTpSKe9iPPewKLyxEu
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a RESEND of v3 sent one month ago, see:
https://lore.kernel.org/all/cover.1754993232.git.christophe.leroy@csgroup.eu/

This series reduces significantly the amount of interrupts on
fsl_qmc_audio device.

Patches 1 and 2 are preparatory patches.
Patch 3 is the main change
Patch 4 is a cleanup which is enabled by previous patch

Changes in v3:
- Properly check the buffer descriptor is unused (Patch 1, comment from Herve Codina)
- Fixed copy/paste error (patch 2, comment from Herve Codina)
- Fixed build failure (patch 2, comment from Herve Codina and Test robot)

Changes in v2:
- Don't remove UB bit (Patch 1, comment from Herve Codina)
- Make sure audio channels are ordered on TDM bus (Patch 2, new patch, comment from Herve Codina)
- Drop struct qmc_dai_chan  (patch 4, new patch)

Backgroup (copied from patch 3):

In non-interleaved mode, several QMC channels are used in sync.
More details can be found in commit 188d9cae5438 ("ASoC: fsl:
fsl_qmc_audio: Add support for non-interleaved mode.")
At the time being, an interrupt is requested on each channel to
perform capture/playback completion, allthough the completion is
really performed only once all channels have completed their work.

This leads to a lot more interrupts than really needed. Looking at
/proc/interrupts shows ~3800 interrupts per second when using
4 capture and 4 playback devices with 5ms periods while
only 1600 (200 x 4 + 200 x 4) periods are processed during one second.

The QMC channels work in sync, the one started first is the one
finishing first and the one started last is the one finishing last,
so when the last one finishes it is guaranteed that the other ones are
finished as well. Therefore only request completion processing on the
last QMC channel.

On my board with the above exemple, on a kernel started with
'threadirqs' option, the QMC irq thread uses 16% CPU time with this
patch while it uses 26% CPU time without this patch.

Christophe Leroy (4):
  soc: fsl: qmc: Only set completion interrupt when needed
  ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
  ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
  ASoc: fsl: fsl_qmc_audio: Drop struct qmc_dai_chan

 drivers/soc/fsl/qe/qmc.c      |  44 +++++++++---
 sound/soc/fsl/fsl_qmc_audio.c | 125 +++++++++++++++-------------------
 2 files changed, 87 insertions(+), 82 deletions(-)

-- 
2.49.0


