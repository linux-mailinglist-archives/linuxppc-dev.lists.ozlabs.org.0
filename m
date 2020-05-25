Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0A91E117C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 17:17:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49W1120W3gzDqBV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 01:17:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fudan.edu.cn (client-ip=202.120.224.73; helo=fudan.edu.cn;
 envelope-from=xiyuyang19@fudan.edu.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=fudan.edu.cn
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fudan.edu.cn header.i=@fudan.edu.cn header.a=rsa-sha256
 header.s=dkim header.b=vr25gmg4; dkim-atps=neutral
X-Greylist: delayed 339 seconds by postgrey-1.36 at bilbo;
 Tue, 26 May 2020 00:19:22 AEST
Received: from fudan.edu.cn (mail.fudan.edu.cn [202.120.224.73])
 by lists.ozlabs.org (Postfix) with ESMTP id 49Vzk22xLXzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 00:19:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=jjl3+oli5pGJqLVTivxSZM0ZQQ2sMqgs051h5Kwq758=; b=v
 r25gmg4PpwrSFeC1XnleuloZOVBgVYTxlt4gM7dwkz+JPXVDOoT+TfmnSEv+r+J2
 iNisbQi218odFdWFe5VxJcnwRoEP3+kz4eyPg5AcwC+qo2I01+L7DQQIkSPCgb6e
 MIiL+Le0e/zN2HuIEfUNAMTCpKEs2UaJPtHxpLQ/90=
Received: from localhost.localdomain (unknown [223.73.184.21])
 by app2 (Coremail) with SMTP id XQUFCgCHjPyJ0steaA6pAg--.26484S3;
 Mon, 25 May 2020 22:13:30 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA channel
 failed
Date: Mon, 25 May 2020 22:12:46 +0800
Message-Id: <1590415966-52416-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XQUFCgCHjPyJ0steaA6pAg--.26484S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tF45trW7uw1UZF1kXF17GFg_yoW8JFy3p3
 ykJrWqgryYyF43GFsxJws5Xr1UXrWakr4ft3y0kay3Z3s8Jr93CF1aqw109FyjvrW8Ar10
 gFWYqF1F93W3GrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Xryl42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU189N7UUUUU==
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mailman-Approved-At: Tue, 26 May 2020 01:11:47 +1000
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fsl_asrc_dma_hw_params() invokes dma_request_channel() or
fsl_asrc_get_dma_channel(), which returns a reference of the specified
dma_chan object to "pair->dma_chan[dir]" with increased refcnt.

The reference counting issue happens in one exception handling path of
fsl_asrc_dma_hw_params(). When config DMA channel failed for Back-End,
the function forgets to decrease the refcnt increased by
dma_request_channel() or fsl_asrc_get_dma_channel(), causing a refcnt
leak.

Fix this issue by calling dma_release_channel() when config DMA channel
failed.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index e7178817d7a7..1ee10eafe3e6 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -252,6 +252,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	ret = dmaengine_slave_config(pair->dma_chan[dir], &config_be);
 	if (ret) {
 		dev_err(dev, "failed to config DMA channel for Back-End\n");
+		dma_release_channel(pair->dma_chan[dir]);
 		return ret;
 	}
 
-- 
2.7.4

