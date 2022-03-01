Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E14C9853
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 23:24:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Wxj3D7gz3bcT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 09:24:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cPRe/VY/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=baihaowen88@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cPRe/VY/; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K72Bd1zZFz30QY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 14:03:37 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id m22so12945811pja.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 19:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Ied1UTlwqdumSyFQ5GJiRBNsKqqAvuy3dy3lFXCbEHM=;
 b=cPRe/VY/fXxz4d+wzUsjqX+MuMmWLzIQZch8kPj5MiByAblJOcmrhnCWYPUPOVijuh
 h1lgQo21SyMQcmGnnsgtt7DvZ84cXfehFZf+nnsvaffmU6tVUbMbEo34vmQKnZjzmy4Y
 I7WiJtifBDtZSUz1yIBlB+85/N3nHi0PMU48bAsZBg4ZpMPLBfPXLL52PZJeCcDsuZWs
 NjtjOtd8/IjiVPf1LnaLfNvZlkKiyDAlhLq4LM0TwSq6+7QbGClNEPVKMyq26aCwTX7g
 pcL3rmvloXL0I1LmLxvhvxXmOIyA7OYcIrerNbm/+3W8H5TITfWgg0Wk6fxfzy2LVmo3
 hlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ied1UTlwqdumSyFQ5GJiRBNsKqqAvuy3dy3lFXCbEHM=;
 b=bcEcCIsW6+Lc5foRhawLij05cd+EQ3qhH3DIvqixRqK8iT2CmBFu5Tysw4XKkc6LN1
 VDi6rdgCZmwy5RLMLNtXAqmISPGjuRwzDtMv0q57fJpnDe0A1rbu94+KR6yYmqaDpLt2
 Dro2DAtXV+Plsb65dFF0oMQ5nsxhKCNQTajqA+xOOZKLJvnNHndnYkSrQ+en9RQe01Sz
 jowKJysmpd7yqR+O1whxgTxuBi51iJRvueEfY6HQAbgxJj88UXsKAGIW4Q+28Vep9a2D
 TLDDKnj7Cw5Y/blJTP/jnYdLj/wu6sIgClri/PVNSgRtSbI2ummTx/DTrZcNjKiz+zNp
 n5jA==
X-Gm-Message-State: AOAM53220vR9/lq/QmR8Sn8BVknHJ295hdugdXfEI3cOXdTjQHaWbCwz
 M3cvY6pelbI0RSiww+R9jaZBUmnpRRKxRTkd97c=
X-Google-Smtp-Source: ABdhPJxOfz02CgHQFRf6Uuf4DvZywXM4YNQdW/qq3sZA69Q5ooNs/0W3K4OICWrSNsSRumeVrGZMbA==
X-Received: by 2002:a17:902:b202:b0:151:4f64:e516 with SMTP id
 t2-20020a170902b20200b001514f64e516mr13172147plr.16.1646103815064; 
 Mon, 28 Feb 2022 19:03:35 -0800 (PST)
Received: from meizu.meizu.com ([137.59.103.163])
 by smtp.gmail.com with ESMTPSA id
 t38-20020a056a0013a600b004e1a0c14000sm15595983pfg.209.2022.02.28.19.03.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 19:03:34 -0800 (PST)
From: Haowen Bai <baihaowen88@gmail.com>
To: shengjiu.wang@gmail.com,
	nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com
Subject: [PATCH] ASoC: imx-pcm-rpmsg: Directly return 0 instead of using local
 ret variable
Date: Tue,  1 Mar 2022 11:03:30 +0800
Message-Id: <1646103810-21724-1-git-send-email-baihaowen88@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:23:36 +1100
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
Cc: Haowen Bai <baihaowen88@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fixes coccinelle warning:
sound/soc/fsl/imx-pcm-rpmsg.c:285:5-8: Unneeded variable: "ret". Return "0" on line 308

Signed-off-by: Haowen Bai <baihaowen88@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 3504904..afea28a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -282,7 +282,6 @@ static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
-	int ret = 0;
 
 	/* Flush work in workqueue to make TX_CLOSE is the last message */
 	flush_workqueue(info->rpmsg_wq);
@@ -305,7 +304,7 @@ static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
 		dev_warn(rtd->dev, "Msg is dropped!, number is %d\n",
 			 info->msg_drop_count[substream->stream]);
 
-	return ret;
+	return 0;
 }
 
 static int imx_rpmsg_pcm_prepare(struct snd_soc_component *component,
-- 
2.7.4

