Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D38CD5BBD60
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 12:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MVk746nh3z3c6M
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 20:09:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.221.58; helo=bg4.exmail.qq.com; envelope-from=yuanjilin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 305 seconds by postgrey-1.36 at boromir; Sun, 18 Sep 2022 20:08:57 AEST
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MVk6d6KX6z2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Sep 2022 20:08:57 +1000 (AEST)
X-QQ-mid: bizesmtp90t1663495399tfsln7an
Received: from localhost.localdomain ( [125.70.163.64])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 18 Sep 2022 18:03:18 +0800 (CST)
X-QQ-SSF: 01000000002000E0G000B00A0000000
X-QQ-FEAT: fs34Pe/+C2TRiMqqhKF4AXIaqHle7Mw/nPizJAgtz86EMeJ+GV+Q7ksrPY16M
	c2R9hNFiy/Sr/kU6zCtQAxxmCYa+Grg2mngUjAnmFbCDCGn80GBK02ccB1ASBN5YZiP2dQr
	MnVErtJJQZ54wMM0wI8/PxwpfcljlJ+LT75wHZtcB/9MGBGw5xu6edaz+DnxuqP5C+et3Zn
	jmunWGBmjhsyAy7hC/wwkpLwb7mBVw0sWNHdTQvJRe1rXHxQCLwtIC7zBBcME4RQnhxhxax
	ctGnc/Bi5hgy7cqm0Sm8wZCSjxTt7bOxd+kZAWkWnCfw4mi+nS7kLP+F9QlkMHTKXaWgEtD
	QUVuqLdshFVZGEksCRfvFPXNhRU/rqZDswZn27MdnZip6l2pcT1qWd+BcbhRw==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH] cxl: fix repeated words in comments
Date: Sun, 18 Sep 2022 18:03:12 +0800
Message-Id: <20220918100312.26836-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Delete the redundant word 'dont'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/misc/cxl/native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c
index 50b0c44bb8d7..6957946a6463 100644
--- a/drivers/misc/cxl/native.c
+++ b/drivers/misc/cxl/native.c
@@ -920,7 +920,7 @@ int cxl_attach_dedicated_process_psl9(struct cxl_context *ctx, u64 wed, u64 amr)
 	 * Ideally we should do a wmb() here to make sure the changes to the
 	 * PE are visible to the card before we call afu_enable.
 	 * On ppc64 though all mmios are preceded by a 'sync' instruction hence
-	 * we dont dont need one here.
+	 * we dont need one here.
 	 */
 
 	result = cxl_ops->afu_reset(afu);
-- 
2.36.1

