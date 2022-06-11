Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F575484CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 13:29:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM8V93pGhz3dxg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 21:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=nfschina.com (client-ip=2400:dd01:100f:2:72e2:84ff:fe10:5f45; helo=mail.nfschina.com; envelope-from=liqiong@nfschina.com; receiver=<UNKNOWN>)
X-Greylist: delayed 288 seconds by postgrey-1.36 at boromir; Sat, 11 Jun 2022 21:55:40 AEST
Received: from mail.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKx9S3wcZz3bxk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 21:55:40 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id EAF341E80D77;
	Sat, 11 Jun 2022 19:49:48 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZAWslLkv7asd; Sat, 11 Jun 2022 19:49:46 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: liqiong@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id D0A4B1E80D70;
	Sat, 11 Jun 2022 19:49:45 +0800 (CST)
From: Li Qiong <liqiong@nfschina.com>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH] soc: fsl: qe: Check of ioremap return value in qe_reset
Date: Sat, 11 Jun 2022 19:49:45 +0800
Message-Id: <20220611114945.24045-1-liqiong@nfschina.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Mon, 13 Jun 2022 21:27:22 +1000
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
Cc: renyu@nfschina.com, yuzhe@nfschina.com, linux-kernel@vger.kernel.org, Li Qiong <liqiong@nfschina.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the possible failure of the ioremap(), the qe_immr could be NULL.
Therefore it should be better to check it and print error message.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
---
 drivers/soc/fsl/qe/qe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index b3c226eb5292..3c0948c2440e 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -88,6 +88,11 @@ void qe_reset(void)
 	if (qe_immr == NULL)
 		qe_immr = ioremap(get_qe_base(), QE_IMMAP_SIZE);
 
+	if (!qe_immr) {
+		pr_err("%s: failed to ioremap()\n", __func__);
+		return;
+	}
+
 	qe_snums_init();
 
 	qe_issue_cmd(QE_RESET, QE_CR_SUBBLOCK_INVALID,
-- 
2.11.0

