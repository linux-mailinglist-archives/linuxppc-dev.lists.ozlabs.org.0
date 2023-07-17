Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584A756F30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 23:56:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eWeQfaju;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4bWw0632z30PB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 07:56:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eWeQfaju;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.216; helo=m12.mail.163.com; envelope-from=ruc_gongyuanjun@163.com; receiver=lists.ozlabs.org)
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4QR65Dnvz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 01:06:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=k/vGHTyPFS4pLMwCbc
	DERdLNElVn/TN8/DsrIDpvWQM=; b=eWeQfajuuwR3HSWwrBuXX9Af1Sd2HbbFQ9
	6taEx/9Sxhug7XVedztTlhMpNhv7/m/sWLMb6ZafQeXofGTf00BIigTaF8hG6MQf
	642a2H8hXGXahufXhCyTbac64fenk9jjLJSp9i5fVTwY8f8TGc5qou7v0KvPXdJJ
	MtIQTt9Nc=
Received: from localhost.localdomain (unknown [202.112.113.212])
	by zwqz-smtp-mta-g3-1 (Coremail) with SMTP id _____wCnLndbVbVkY8YyAg--.16332S4;
	Mon, 17 Jul 2023 22:51:11 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] sound:soc: fix return value check in imx_audmux_suspend
Date: Mon, 17 Jul 2023 22:51:06 +0800
Message-Id: <20230717145106.28013-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCnLndbVbVkY8YyAg--.16332S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWrAF4rtryrtr4fJr43Wrg_yoWfGrcEg3
	ZrWrs5WrWUW3yxKFWkJw4IyFy7X3WxCF4aga10yws0y347t3WYyrZ8J3s3CrWkX3yxZryx
	Cw1kZrW7tr17GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKrWrPUUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiUQCv5WDESThgEwAAs9
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
imx_audmux_suspend should return the error value.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 sound/soc/fsl/imx-audmux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index be003a117b39..962b6baf0a34 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -325,8 +325,11 @@ static void imx_audmux_remove(struct platform_device *pdev)
 static int imx_audmux_suspend(struct device *dev)
 {
 	int i;
+	ssize_t ret;
 
-	clk_prepare_enable(audmux_clk);
+	ret = clk_prepare_enable(audmux_clk);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < reg_max; i++)
 		regcache[i] = readl(audmux_base + i * 4);
-- 
2.17.1

