Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9544F1B6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Nov 2021 07:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HrlGD0j5dz301B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Nov 2021 17:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=113.96.223.105; helo=smtpbg587.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 97 seconds by postgrey-1.36 at boromir;
 Sat, 13 Nov 2021 17:01:29 AEDT
Received: from smtpbg587.qq.com (smtpbg587.qq.com [113.96.223.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HrlFj2fTdz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Nov 2021 17:01:27 +1100 (AEDT)
X-QQ-mid: bizesmtp45t1636783146tdepwoms
Received: from localhost.localdomain (unknown [125.69.41.88])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 13 Nov 2021 13:59:05 +0800 (CST)
X-QQ-SSF: 01000000000000C0F000B00A0000000
X-QQ-FEAT: B0D4DPF8NcThOjwWqVcGFATOcwUCVabIoSnFsXK16GjD1pduTZuEyipegriBQ
 gbIHGoqY6r3zC+4cPd8mntnUsAWP7HU9vGE+nTTycKKNmlthVeWxNkd7oGlkrz/7oruXp1F
 ONVEVm4yT9WA7gvXxDCrbpqXdZy06ZIDI1m1LQnJHCQYnQsYblD6jnIh5AypDdlzNeua2os
 R2cP+mZ3fjVtqFFDqWZbW8cvZ7XyaksOO5wn+LjZf7DTB/gjiUWef63AYkwV6aCbBKNQrUd
 Qf7EEIQYFTYzGvJn3s5daYyFdeNo6c/4In9Pj8tIQcmUJAtYPqOCig00TCs8KnspWx6Lp6d
 NJnrFiJzWqBUUu+xBxZ/RTfmRUf/ex97/4DXrWv
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: leoyang.li@nxp.com
Subject: [PATCH] soc: fsl: qe: Fix typo in a comment
Date: Sat, 13 Nov 2021 13:59:00 +0800
Message-Id: <20211113055900.212568-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam3
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
Cc: Jason Wang <wangborong@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The double `is' in a comment is repeated, thus one of them
should be removed.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/soc/fsl/qe/qe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 4d38c80f8be8..b3c226eb5292 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -147,7 +147,7 @@ EXPORT_SYMBOL(qe_issue_cmd);
  * memory mapped space.
  * The BRG clock is the QE clock divided by 2.
  * It was set up long ago during the initial boot phase and is
- * is given to us.
+ * given to us.
  * Baud rate clocks are zero-based in the driver code (as that maps
  * to port numbers). Documentation uses 1-based numbering.
  */
@@ -421,7 +421,7 @@ static void qe_upload_microcode(const void *base,
 
 	for (i = 0; i < be32_to_cpu(ucode->count); i++)
 		iowrite32be(be32_to_cpu(code[i]), &qe_immr->iram.idata);
-	
+
 	/* Set I-RAM Ready Register */
 	iowrite32be(QE_IRAM_READY, &qe_immr->iram.iready);
 }
-- 
2.33.0

