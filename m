Return-Path: <linuxppc-dev+bounces-7678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC383A8AEEC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 06:22:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zcntk3RFqz2yr6;
	Wed, 16 Apr 2025 14:22:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744777358;
	cv=none; b=aZYBALZ7C9kMh3kXWbau7LCb4KUuiSkUv2g8wk2mInttRJK1+NuJZu6NIfpDN5reCX3YC1bYu/+jHEE4LSGSrAFfQ/oESseVfY54784DGRaA4r+vHWEBxuk0HmCgvApcoBXppgChUteWsJSATxDFp/hBTS4OJaHYLYbYI+KNPGaHMOj9ZmiWnEXikRfHcSZdYXjBReNRDKk/5Zd006+XG4lBLAJo3TeptP/bdEv78psDEkL7S5s0iOyQ2PrWFAm8tgLJ5/0qd4Ct3emGpflj2+y0hYEFCJzpldKqVTXEb+oPs7gdmlnZvQ8qbhwQRwFOxNDXGTn/DVflp33YcNWVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744777358; c=relaxed/relaxed;
	bh=d5t++duZP8pm9mdRC6zaqFmGzijTKTFEhouYYd/u3ro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WVhagfK+M9KxXryRZLviA1+rSyRlKulWnp5aSXlpdLDPK4s3QnVXZCY0ADsbILSpF3mtKOUM/aSMMA4W2va/0b8UWViip4mtmAoaMEKBhqqQo9ulIQKF+EpYzXYTYgELeJGlag+oexTO/RL9HSzcgPinDXPGk+qNeXUswyfeiBy3Af1kwmevtlY05lxqy5TUzR12JnDEM+lwh6KhEietVVlQygw7MRmghB5HNAgsZut/iKKqiXzSrHod53T6zNGIyi74KiMJsOVCAu9BWPesFa6xPhXt/Ur3KqztWwmKnvc6zysgzJatRCCJuK31VfBx651fIpK0tzWrKogoXDIHsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 436 seconds by postgrey-1.37 at boromir; Wed, 16 Apr 2025 14:22:37 AEST
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zcntj1Th3z2ym3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 14:22:36 +1000 (AEST)
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowABXAgPQLv9nRi8uCQ--.13988S2;
	Wed, 16 Apr 2025 12:15:12 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: fsl_rpmsg: Remove useless return variable
Date: Wed, 16 Apr 2025 12:14:31 +0800
Message-Id: <20250416041431.546370-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABXAgPQLv9nRi8uCQ--.13988S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFW8Cw47WryxJF4rGw1kGrg_yoWDJrg_Gw
	4FgrWYqFWj939YyF1DCw47JFWY9FsFyw4qqrsFqanxG398tr4rXr9rtrs3u3s5Wr1rJ3yr
	GwsIqr93AFyxXjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8Xw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcvtZUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove unnecessary return variable and compress the return logic.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/fsl/fsl_rpmsg.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 0a551be3053b..6d67db4e0581 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -97,13 +97,9 @@ static int fsl_rpmsg_hw_free(struct snd_pcm_substream *substream,
 static int fsl_rpmsg_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *cpu_dai)
 {
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &fsl_rpmsg_rate_constraints);
-
-	return ret;
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_RATE,
+					  &fsl_rpmsg_rate_constraints);
 }
 
 static const struct snd_soc_dai_ops fsl_rpmsg_dai_ops = {
-- 
2.25.1


