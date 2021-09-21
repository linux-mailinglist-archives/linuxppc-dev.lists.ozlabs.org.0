Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 751F1413CA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZZm2yzRz3cbY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:39:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nal2ktKi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nal2ktKi; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZWY4hgZz3c6n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:36:57 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9585A61019;
 Tue, 21 Sep 2021 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260216;
 bh=ZnM+iqWxm+4OI1WI+vtTm3ZebK6hxw24eEpvjq/BbMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nal2ktKilqF7XAtGHjUJHBsz2vggf/m7AhyToUA+Xt4S3cgcmthbC43sYFqb3pSRU
 INaug+jA2ZzPKcjXwDsfw2qbqLOkZFXSejA37KzBN7AUqM4dN46YJVfxp/yshzcZ8H
 bxjOvVFqqkZR4QgdGrTpBXABK4cFGLi6LiIfFg3BT5xfNT6M55iPI6aQS001YFtJM0
 Op04cp339qYuLIsY+n5TLdbplRlzP5gDR76psjM1MBPoYKWdq6WUlUjFh6iVRJJuyG
 QqCG1EGJGG5WUepJSxc+CBc590IsylKoIRIgIhYcxVzuU7c02asn5gPZvqWkvHnCRi
 8vSFDTsMGZP3w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 05/16] ASoC: fsl-mqs: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:35:31 +0100
Message-Id: <20210921213542.31688-5-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; h=from:subject;
 bh=ZnM+iqWxm+4OI1WI+vtTm3ZebK6hxw24eEpvjq/BbMU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8WidR+IfgASeBZcEe7nEyf9oCvyXFXV112DJOT
 KNY5LeSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPFgAKCRAk1otyXVSH0PmvCA
 CFBJLaHsRoeugg5/GbUWOyznY1qSNrYPQduxImC+WYVUpSSBFqVcAa+eDuE6tC6vtf3LHtcacRp3kx
 h3wgxGWjSSc3m24oF8z7YSUAmnuUL++PNVjmUgOYFCk/wkXIaZHlP8m2A+w57xhFBCjI2bCfY6CLNK
 0+fAwKkOw9fYK7YtE6rL+7ra/Fym3wVNtCtAvOaxxoBrdyECsRJXGpvlWlCIUdfFD/SC3+K1VUgRwg
 ohYoEYsCzH/C9J+/kOq3Big7XjajDf2bti2B35Pv9Tl7ypJV+WuP+oEnh/wvEcG2dyiFit3uvLsZsG
 YwGHrvt9cFQ+plmIsjCLc94iZvGuJs
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
the fsl-mqs driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_mqs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 69aeb0e71844..27b4536dce44 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -102,8 +102,8 @@ static int fsl_mqs_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

