Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D0413C22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:14:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ1l0Zsdz2ywN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:14:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xdzs3wJK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xdzs3wJK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyK5K28z2ymy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:11:37 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF52561183;
 Tue, 21 Sep 2021 21:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258696;
 bh=ZnM+iqWxm+4OI1WI+vtTm3ZebK6hxw24eEpvjq/BbMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xdzs3wJK2yhFJNUr/JDzqUtwQL3MaIG9aOXiRpZyUNbVQzV4dSJmwDsZsXnKbRj7E
 lt7Lg44nn7rqsoo/tjt1JybVXKzjted5pKDRKE/t667tuQRXVXDETrUIz7B0QfaAvt
 tj4UEdeS9OWl8ba01OAeD7wpqR9/CYTh2UI+NU/rRYFn11XbCoGeGIcPDI6H0Y95pw
 H27GXf1vsJEKEd5qgsPwv3pyCDl1bwCkwvTgnGFyKXlF6BAwxM+dG0/98JTdTAe6a2
 oi9s2OJhR0ZIZ+WXz5PdBUadnq/tz3T/CW3eKu94yOCEBiWkWnpWKXF4JCBLz2j/Vo
 oo5rv4vy9yC9w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 05/16] ASoC: fsl-mqs: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:29 +0100
Message-Id: <20210921211040.11624-5-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; h=from:subject;
 bh=ZnM+iqWxm+4OI1WI+vtTm3ZebK6hxw24eEpvjq/BbMU=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBhSkneidR+IfgASeBZcEe7nEyf9oCvyXFXV112DJOT
 KNY5LeSJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ3gAKCRAk1otyXVSH0JbRB/
 de8ESQ0uq4MfK/AvcBrek9jQ0ZRAl5lVNxyCOpr30ftA8NFul9vFGoEw/WG5dkXziY3uuef1oUSV/u
 +nEWBHZ/CdRvruf3GualDmOB/S1hWYO3c9YeyMpL2kQE/M0MUKfP9rwtDWt9ntkTIyWN0blHzHpAK4
 doS4yb9bd1jMMBf2ZYNmx5v4Cy6x5125EtAz/PuVqvFPKSBzzJ30wjYcmyEDhImKv+if8w56fXXTTV
 bNzWe7d9DAsxg5+yEuLqqM0+NvbsvZAJJAH1v90F/WRuIvzUzS9f0psYXpwFWm8a8l2FLmLfueBzbL
 1PEQ224mPgq3VIJh2eFu02jiCJdUQ=
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

