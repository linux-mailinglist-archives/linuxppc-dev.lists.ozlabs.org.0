Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF7471318
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 10:11:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JB2881Shfz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 20:11:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=106.55.201.39; helo=smtpbg587.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 70 seconds by postgrey-1.36 at boromir;
 Sat, 11 Dec 2021 20:11:10 AEDT
Received: from smtpbg587.qq.com (smtpbg128.qq.com [106.55.201.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JB27f0GB4z3cCw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 20:11:06 +1100 (AEDT)
X-QQ-mid: bizesmtp52t1639213729tc78ce8h
Received: from localhost.localdomain (unknown [182.132.179.213])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 11 Dec 2021 17:08:48 +0800 (CST)
X-QQ-SSF: 01000000008000D0H000B00A0000000
X-QQ-FEAT: Jd++W0FxedEDKcq4dwEsswBBZ441+hy6eBxXh3hnKynnNk/Dfh2HgBbY0UvHW
 CDc8cdpSp4KMckPMzMXY/PXmyx3sEoK1ZXOs/QPdkMCGSZrxuY5eribfClmTu2aHM7ocv/V
 Q1D+kk/FVy0aPQeFqNpjzDSOqZFs725U9FDJjXdaL1pxmKWlrz/uRQjk09nHxHAY/76dELT
 vGKLnWdmDEAQJUIQ+ztoTWUp4MDLVP5TYMtb1ieI8jC8rSzRrrmILdvwQPN4lugdbv0ijtm
 9b5RhVy6Y6SmokMtmVxdT9e9nza1NfFiAUzZ8yle47opB85AIrIHrJpgEjHc9Cd65/yO6EE
 5wyk5CgyBjW5Ic+I0AXdOjzo+biwdYrQT1fdSbi
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: leoyang.li@nxp.com
Subject: [PATCH] soc: fsl: qe: fix typo in a comment
Date: Sat, 11 Dec 2021 17:08:45 +0800
Message-Id: <20211211090845.252700-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam5
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

The double `is' in the comment in line 150 is repeated. Remove one
of them from the comment.

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
2.34.1

