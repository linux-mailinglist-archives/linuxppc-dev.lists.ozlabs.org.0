Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB9756F2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 23:55:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kWvQ0TVX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4bVy1lm2z309q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 07:55:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kWvQ0TVX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.214; helo=m12.mail.163.com; envelope-from=ruc_gongyuanjun@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 914 seconds by postgrey-1.37 at boromir; Tue, 18 Jul 2023 01:06:26 AEST
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4QQV5Mtwz2xgt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 01:06:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=1u8W8wX0kdQ4WGrpox
	GTRi5UCWLyj1bGmhoZIQIBs2I=; b=kWvQ0TVXbZ6RzPYm5SEofCDlkM7NKgFAeH
	QaVPvoApcmrQR7FlrFv7jgnWJ8UxfM7IXSOn5d+4knPYVptZcm5i9eGW2Uzm637S
	1H/KNVwF1Xu14w2DyE4jojJ8W5VoTZUUQE12LQdE24ajP0tpayvbgoq76amGU1QW
	epuqKEBXA=
Received: from localhost.localdomain (unknown [202.112.113.212])
	by zwqz-smtp-mta-g1-2 (Coremail) with SMTP id _____wCXlTxTVbVkjQ01Ag--.51633S4;
	Mon, 17 Jul 2023 22:51:03 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] sound:soc: fix return value check in imx_audmux_resume
Date: Mon, 17 Jul 2023 22:50:58 +0800
Message-Id: <20230717145058.27860-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCXlTxTVbVkjQ01Ag--.51633S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw15GFW8Jr1UtFy8Jr17trb_yoWfJrbEga
	nrWrs5WrWUW3yxKFWkJw4IyFy7W3WxCF4agw40y3Z0y347J3WYyrZ8J393CaykX3yxZ348
	uw18ZrW7trnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKrWrPUUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiURiv5WDESThfogAAsr
X-Mailman-Approved-At: Tue, 18 Jul 2023 07:55:09 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

check the return value of clk_prepare_enable, and if
clk_prepare_enable got an unexpected return value,
imx_audmux_resume should return the error value.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 sound/soc/fsl/imx-audmux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index be003a117b39..e8a3a1baf18d 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -339,8 +339,11 @@ static int imx_audmux_suspend(struct device *dev)
 static int imx_audmux_resume(struct device *dev)
 {
 	int i;
+	ssize_t ret;
 
-	clk_prepare_enable(audmux_clk);
+	ret = clk_prepare_enable(audmux_clk);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < reg_max; i++)
 		writel(regcache[i], audmux_base + i * 4);
-- 
2.17.1

