Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E087C6F02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 15:17:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=rV/yXLVm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5qtp2Syyz3vXV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 00:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=rV/yXLVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foxmail.com (client-ip=203.205.221.155; helo=out203-205-221-155.mail.qq.com; envelope-from=zhang_shurong@foxmail.com; receiver=lists.ozlabs.org)
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5qsv24tcz3c5S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 00:16:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1697116604;
	bh=hvsAf3IGRqX1DpOH2B+0eu/3cS+DbSNmEVlnCQEwAPA=;
	h=From:To:Cc:Subject:Date;
	b=rV/yXLVm/9IFg4chgeG2IeHhMBXSUN921UpTw6tgITfvpLV60Iw3X1fjRTwOSibta
	 LC60AznVpv8zISsrWUm9E4sudQ1tOV5LjECFEgZpTqgkK13KgG37VFs8SxbsLsTq8C
	 nstIpFxUG5r8syzOtcavNmfrLkpeFBFdAlOnLO6I=
Received: from KernelDevBox.byted.org ([180.184.51.134])
	by newxmesmtplogicsvrszc2-1.qq.com (NewEsmtp) with SMTP
	id D0812F3; Thu, 12 Oct 2023 21:03:16 +0800
X-QQ-mid: xmsmtpt1697115796tm51ic8m3
Message-ID: <tencent_C0D62E6D89818179A02A04A0C248F0DDC40A@qq.com>
X-QQ-XMAILINFO: MBbh9ZpQ5zEXVx6UGxhPICBGQ86jjAY9/rzQHXsVFdPVPnpl/tB3oiG+Emdu+m
	 Af8IFJAW+IPI+tPgqlogsl8cZSmYOfarhikPKuLw6GNlLlRBXiCzQ3yhJoc9g/KiwI3LWrptYut4
	 AT9EkS7Yq+6s6lHZ1IfYQHC5LHtxe+vDZs/fZQDr56MWt1WPT8QFxYseqKyC537yTXVML05U1OAn
	 rv+38rBztGRrs4gyx43dxflMJFiGm/nWOK/DTRXu0H8ybJzRXiw2o19n7wjqSjkuxAfj8b9xal/K
	 fXvSrzy31NuFEUTO462fB/ddtKCn8V1wDu3t+e+8zlcwnlrxerkk7abcOobEPDMNNK9AA0Yn1YdP
	 xgk++wJrDjRqf3YuOXmsFoeGiK7fG4B5CaVqH/EGN+kWf7e1kaUUy22aevWiidzJrTnWPX2aAqQ8
	 pgt1LXMdukqp3pZamL46HfVhssBkaIrOM5Uy6Gpazi5WK0lPzayrFNPDFLQ0cCxpvmKBDANQvjAP
	 qy98k1gLDddXVcyQEh/yCiECF2Ktbq67xY4q4xRMvkjilRurg7ZdNndvnOFTto9a7oB3I4A1puaD
	 fXNLBe9wo8gAmLwjnPfhK4vz96MGPGEP5T5cCQsCHH42wA2SKbPs+J2kw6AtQDBvLVeQrWU5JSyp
	 hAZ/+2gh805x6770Kz3SS7NmH8nPRNPZIAmSbHt/MRIILY98sSim/p/UJ8IThaQTeFuDkNor832D
	 TIOnCML28W+RWsXp2Isajvtym5vngbFEgSyeBTPpHEvtge0v8D3HB9+sYYuC5bbo8jQk5tCFgRDo
	 5J5esf0wjCJgPOXd+6GFzzrfHy5oovlBaofAjd/cV8t4BtWU3wa3S1xFJuVVFEntxGzhc2Ss4CLH
	 2EO+BCHIsKWmToWrgK1oiqhmazziU6zftAREhaphL2RL7D6pjy5T0jHXItmossKVd4h34D1210s3
	 FSixcSEUPCy1/ih1b+OaBXu2wPoUL+91Gp3KcJhFtNFaNOXyqHvV1NKYfP2vwO
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: shengjiu.wang@gmail.com
Subject: [PATCH v2] ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe
Date: Thu, 12 Oct 2023 21:03:15 +0800
X-OQ-MSGID: <20231012130315.3292117-1-zhang_shurong@foxmail.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org, Zhang Shurong <zhang_shurong@foxmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context. We fix it by calling
pm_runtime_disable when error returns.

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
v1->v2: add Fixes tag

 sound/soc/fsl/fsl_easrc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index ba62995c909a..ec53bda46a46 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1966,17 +1966,21 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 					      &fsl_easrc_dai, 1);
 	if (ret) {
 		dev_err(dev, "failed to register ASoC DAI\n");
-		return ret;
+		goto err_pm_disable;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &fsl_asrc_component,
 					      NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ASoC platform\n");
-		return ret;
+		goto err_pm_disable;
 	}
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static void fsl_easrc_remove(struct platform_device *pdev)
-- 
2.30.2

