Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FA413C9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:38:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZYK1NSpz3cN7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:38:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BM+WZmOt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BM+WZmOt; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZWS09Mkz30RK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:36:52 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB6FB61019;
 Tue, 21 Sep 2021 21:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260210;
 bh=P9Ovn67dgqfY8uXNhC7cS74K5PnBw7legwEUgP0ObyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BM+WZmOt5xnz2Os+TA8gO7xWletdWiABtmeL17sjiVUSjF1MjAVgUj2o9w2MZflMy
 khgJ/G1Ywn4tC0Dh9Wv+WM0QFKiU6HCYQRmCGa6TmjccbSBRjWqqZt7CfKbRuHasEs
 1g9EZZrSZPA/Z+pL4J9QRc+T2zjv0AQFuYXn1QQ1iccY8DbYJGm+lA8R0/9EYU4DNB
 +MqRSSpT4wmhBTZSW+TkbmSaUcs8pcXb/A6O23BfLVaSNQ4K1fXzTyvkwqCMnx6EBo
 lkgIpJSGDeYjZtUv8kiatOU0O3zRPxWOkQTOrjBrKroGEVg+TnsmOuuXgAh2bI7bL1
 bGtwUXpkXK7eQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 03/16] ASoC: fsl-audmix: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:29 +0100
Message-Id: <20210921213542.31688-3-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; h=from:subject;
 bh=P9Ovn67dgqfY8uXNhC7cS74K5PnBw7legwEUgP0ObyU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8U/VULECrfRVtYmjLkQHqSef5Im/jvNVDsuT2f
 q6fnzNeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPFAAKCRAk1otyXVSH0Ip9B/
 40JcBPo/Iy2pwoa3fgS1cUud4yUnNFMtNvn9E4E2JgzGOFo3JpjVs+4QU8XHWopOpdu6sWEZgozuHY
 AGGSSrAE4KXO87agaRGQZPo+ZentL9kWFleAvPcZbg2TlpJoPKucYqTaiOKbF7zKZJjnrzK0E1f+ZQ
 t4kkOO7nzVZIlRGt4D4qkjxu5QH353zqqN5+Kd51flzKn+cjFeCS9g27HGgCLhAcQPzePyXajYoz9q
 11XbZSAkEAyLnyZh1RaWUqnDIxbZ5Hw5KXEWajZl6RDu7YUdk/Ga1yM6FIZa41k2jGMJRk8Q7zchnn
 vboXrJ+TzwzPjknVnejDk5hEkc1lSK
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
index f931288e256c..6dbb8c99f626 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -257,10 +257,10 @@ static int fsl_audmix_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	/* For playback the AUDMIX is slave, and for record is master */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	/* For playback the AUDMIX is consumer, and for record is provider */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

