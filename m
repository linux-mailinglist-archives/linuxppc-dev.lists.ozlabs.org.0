Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC675DC98
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 14:39:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PBg6aGLa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R7QwP0C18z2xBV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 22:39:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PBg6aGLa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.196; helo=m12.mail.163.com; envelope-from=ruc_gongyuanjun@163.com; receiver=lists.ozlabs.org)
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R7QvT0ntcz301f
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 22:38:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=FZd87sezY+M7cLoVe0
	n9W2LUt1uTkSIVvAU1mMdhtzw=; b=PBg6aGLabMA7Kuije/9IgwFKTaFhvWWoNN
	3dPAZdz9zdIj3VTzbOdjaM0x+5pZ5m/yV+FMh1VQI6pYMU6jTSxhRk4b7iAJejHs
	5Pc/j3yXxZtzFOaxYXgr8y0pRGRFbiA+4kkXgReRuSeb+7vjwB0kF+/zM199yXYW
	WtiKBilpI=
Received: from localhost.localdomain (unknown [202.112.113.212])
	by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wDHNEKWzbtkd2XqAw--.21486S4;
	Sat, 22 Jul 2023 20:38:15 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: shengjiu.wang@gmail.com
Subject: [PATCH v2 1/1] ASoC: imx-audmux: fix return value checks of clk_prepare_enable()
Date: Sat, 22 Jul 2023 20:36:35 +0800
Message-Id: <20230722123635.26623-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAA+D8AP-3SWJe21qfMVz0j3umvS9bzDkeuQtab4OFrc2Ur+eVw@mail.gmail.com>
References: <CAA+D8AP-3SWJe21qfMVz0j3umvS9bzDkeuQtab4OFrc2Ur+eVw@mail.gmail.com>
X-CM-TRANSID: _____wDHNEKWzbtkd2XqAw--.21486S4
X-Coremail-Antispam: 1Uf129KBjvJXoWrKFyfArW3WFWkKF43CF18AFb_yoW8Jr43pr
	Z2yrWYgrW8JrZ5Gw4fGr1kCF13ArZ2kF47Z397Gan2q3ZxArnrX3WFqrn0vFs5Kr9YkF98
	GF4DGFyrAw1jyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piy89_UUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiJxi05V5vE3swbwAAso
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
Cc: linuxppc-dev@lists.ozlabs.org, ruc_gongyuanjun@163.com, festevam@gmail.com, Xiubo.Lee@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

check the return value of clk_prepare_enable(), and if
clk_prepare_enable() gets an unexpected return value,
imx_audmux_suspend() and imx_audmux_resume() should return
the error value.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 sound/soc/fsl/imx-audmux.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index be003a117b39..9791e56158ef 100644
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
@@ -339,8 +342,11 @@ static int imx_audmux_suspend(struct device *dev)
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

