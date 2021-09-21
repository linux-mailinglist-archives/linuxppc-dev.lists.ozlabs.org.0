Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3934413C1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ085xkGz3c7x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:13:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RmBgOWyf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RmBgOWyf; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyD0t2tz2yWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:11:32 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0179361215;
 Tue, 21 Sep 2021 21:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258690;
 bh=5FoglGhrG3Np/tp5bGtEm2iCfzLwPDQrLEC6Huv2RHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RmBgOWyflzYLjFGfZBDb6XVFMvQxzAFE7AQZ+FhZ0lW0I1Agw56Jtx6zBUzFsaGJA
 b1NnwoIq57i2AtD2HBDeXIu9w83HS/eUL1r3mEiyi2U23r51Pcd7irypzkvnoVIspX
 oUDTUUTHh3wZYayLb4aTbgEe+O7MDIXuVxO5Y7/2E8UcuTCeZgbS9+O0BwEnaD1C5t
 /Yijj619Rn7e6iEeWjL4539lYcvq4kvnjCAMsk9//2y0iVg9VANCGEz/n7bRMiMP8y
 GY+yrClVAlg72wFlGE0cVKpzMXYBIwozOjX8rEKnXcnTL5cFfX6u59qB5W0/GYseVI
 x8LMG/n/KOHUQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 03/16] ASoC: fsl-audmix: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:27 +0100
Message-Id: <20210921211040.11624-3-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; h=from:subject;
 bh=5FoglGhrG3Np/tp5bGtEm2iCfzLwPDQrLEC6Huv2RHY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknd/nDDWkKlcZIUp3rJHsMJKCA8o1OHJI7wny+f
 erTk/ceJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ3QAKCRAk1otyXVSH0B6eB/
 0RDqcKKslsghXE069hqe+132vQcWoxOiBRTpK4jOm/YHG75MBJm10NhfVNv0QQQph9n1P53oXS+gmn
 zlHq805vFwufjJQ9V58LynYbkvBfgQO8qzor0iG/ldBs4YdMVpBU+O42D+n9I+I0nZ+IvhRlMoT4YT
 exAkZlkz0n6/SP1sZDs0NHjdr4AAS0mTwICqS+z5NV657zJY+NO9KvA4VJLh+BxZuXUnTHDfgDm7MN
 oV7LkHEtDU1dRA+nIkA1yBhxEB7/fYRVeWc6N832cVUYoOimojqqZjuYWx8oiJucAHZ+dXP7wMSyra
 GxoIa9DI2+suEzQy+d+Si5MyQ7rQUt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of moving to remove the old style defines for the bus clocks update
the fsl-audmix driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_audmix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index f931288e256c..db2dde597edc 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -257,10 +257,10 @@ static int fsl_audmix_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	/* For playback the AUDMIX is slave, and for record is master */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	/* For playback the AUDMIX is provider, and for record is consumer */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

