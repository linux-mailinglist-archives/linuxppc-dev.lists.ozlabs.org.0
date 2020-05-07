Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE751C80A9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 05:49:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Hfc13fTtzDqww
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 13:49:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=zou_wei@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HfZ82D71zDqtd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 13:48:14 +1000 (AEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E933DA39FC9FCBC8410B;
 Thu,  7 May 2020 11:48:06 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 11:47:58 +0800
From: Samuel Zou <zou_wei@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH -next] ALSA: sound/ppc: Use bitwise instead of arithmetic
 operator for flags
Date: Thu, 7 May 2020 11:54:07 +0800
Message-ID: <1588823647-12480-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Samuel Zou <zou_wei@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the following coccinelle warnings:

sound/ppc/pmac.c:729:57-58: WARNING: sum of probable bitmasks, consider |
sound/ppc/pmac.c:229:37-38: WARNING: sum of probable bitmasks, consider |

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 sound/ppc/pmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 592532c..2e750b3 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -226,7 +226,7 @@ static int snd_pmac_pcm_prepare(struct snd_pmac *chip, struct pmac_stream *rec,
 		offset += rec->period_size;
 	}
 	/* make loop */
-	cp->command = cpu_to_le16(DBDMA_NOP + BR_ALWAYS);
+	cp->command = cpu_to_le16(DBDMA_NOP | BR_ALWAYS);
 	cp->cmd_dep = cpu_to_le32(rec->cmd.addr);
 
 	snd_pmac_dma_stop(rec);
@@ -726,7 +726,7 @@ void snd_pmac_beep_dma_start(struct snd_pmac *chip, int bytes, unsigned long add
 	chip->extra_dma.cmds->xfer_status = cpu_to_le16(0);
 	chip->extra_dma.cmds->cmd_dep = cpu_to_le32(chip->extra_dma.addr);
 	chip->extra_dma.cmds->phy_addr = cpu_to_le32(addr);
-	chip->extra_dma.cmds->command = cpu_to_le16(OUTPUT_MORE + BR_ALWAYS);
+	chip->extra_dma.cmds->command = cpu_to_le16(OUTPUT_MORE | BR_ALWAYS);
 	out_le32(&chip->awacs->control,
 		 (in_le32(&chip->awacs->control) & ~0x1f00)
 		 | (speed << 8));
-- 
2.6.2

