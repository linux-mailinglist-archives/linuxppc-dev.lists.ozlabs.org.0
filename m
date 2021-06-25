Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2803B4375
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 14:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBGkg5XPlz3byx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 22:38:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aPXsUZX7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.13; helo=m12-13.163.com;
 envelope-from=13145886936@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=aPXsUZX7; dkim-atps=neutral
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GBGkD5jrFz2yyx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 22:37:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5K5m1
 i7AFffYHG6+5V141txZ9n2mjZOi15x1fOS+yIg=; b=aPXsUZX7qxjO6/HjJZ8vh
 MYm9L4R+umydvdD+GjE4+duF9hqdk+ZQs/v/HE5zKcH7efy5Omb4q2pthYeBRQfF
 owudltj+iV/ePI8M1jiGPhheXtbU3ln0r/nA0FYvkvjIESgx7mawcH+lAVIN9X6E
 GiIPPMvU8L+PVwvbKPcxLY=
Received: from ubuntu.localdomain (unknown [218.17.89.92])
 by smtp9 (Coremail) with SMTP id DcCowAAnXwMWztVg_jd2IA--.30557S2;
 Fri, 25 Jun 2021 20:37:43 +0800 (CST)
From: 13145886936@163.com
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_xcvr: remove an unneeded semicolon
Date: Fri, 25 Jun 2021 05:37:40 -0700
Message-Id: <20210625123740.508640-1-13145886936@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAAnXwMWztVg_jd2IA--.30557S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrJF43JFWUCw4DJFWrCr4DJwb_yoWxWrb_Cw
 1kKwnYg3yrGrWIya4kGw4fXr4j93y7uFWUXF4Fk3W8G34Yyw4Fq3W5GFW5uFs8Wr18CryS
 g3WUtrZ8Ar17KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5l2NtUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5zrdx5xxdq6xppld0qqrwthudrp/xtbBzhu8g1QHNBNbOQAAs8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 gushengxian <gushengxian@yulong.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: gushengxian <gushengxian@yulong.com>

Remove an unneeded semicolon.

Signed-off-by: gushengxian <gushengxian@yulong.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index e34d57ad66fb..75fa8f1b5576 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -736,7 +736,7 @@ static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
 			/* clean current page, including data memory */
 			memset_io(xcvr->ram_addr, 0, size);
 		}
-	};
+	}
 
 err_firmware:
 	release_firmware(fw);
-- 
2.25.1


