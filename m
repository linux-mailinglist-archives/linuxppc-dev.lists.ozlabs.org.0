Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F0715F609
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 19:46:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K2Qy5js7zDqCH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 05:46:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=n1aLGKSf; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jz3N19vpzDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:14:24 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8D34246BF;
 Fri, 14 Feb 2020 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696860;
 bh=p+DwLs2tKWnYLYuHR1Dc7sSD64Mu6NYtKotHuozV5y0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n1aLGKSfV6IH22FBeuhPQLFcSLCkqN4ypVY1LvXtgOnoSE43RDntQKSeTWV2H5RoE
 HXrBSFnK80I4G/WvIyRvn1OlSh86Bk1ZE31Za6DqUH9rsVRvYK+/vxBfiU5ohtxd5v
 bISKXmxf4s9FEiJ7/A2cKRv6OWbZuoyNtEiyszuQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 120/252] net/wan/fsl_ucc_hdlc: remove set but not
 used variables 'ut_info' and 'ret'
Date: Fri, 14 Feb 2020 11:09:35 -0500
Message-Id: <20200214161147.15842-120-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Chen Zhou <chenzhou10@huawei.com>,
 netdev@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chen Zhou <chenzhou10@huawei.com>

[ Upstream commit 270fe2ceda66b6964d4c6f261d7f562a02c1c786 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wan/fsl_ucc_hdlc.c: In function ucc_hdlc_irq_handler:
drivers/net/wan/fsl_ucc_hdlc.c:643:23:
	warning: variable ut_info set but not used [-Wunused-but-set-variable]
drivers/net/wan/fsl_ucc_hdlc.c: In function uhdlc_suspend:
drivers/net/wan/fsl_ucc_hdlc.c:880:23:
	warning: variable ut_info set but not used [-Wunused-but-set-variable]
drivers/net/wan/fsl_ucc_hdlc.c: In function uhdlc_resume:
drivers/net/wan/fsl_ucc_hdlc.c:925:6:
	warning: variable ret set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index 9ab04ef532f34..bb560f1d9a48c 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -591,11 +591,9 @@ static irqreturn_t ucc_hdlc_irq_handler(int irq, void *dev_id)
 	struct ucc_hdlc_private *priv = (struct ucc_hdlc_private *)dev_id;
 	struct net_device *dev = priv->ndev;
 	struct ucc_fast_private *uccf;
-	struct ucc_tdm_info *ut_info;
 	u32 ucce;
 	u32 uccm;
 
-	ut_info = priv->ut_info;
 	uccf = priv->uccf;
 
 	ucce = ioread32be(uccf->p_ucce);
@@ -825,7 +823,6 @@ static void resume_clk_config(struct ucc_hdlc_private *priv)
 static int uhdlc_suspend(struct device *dev)
 {
 	struct ucc_hdlc_private *priv = dev_get_drvdata(dev);
-	struct ucc_tdm_info *ut_info;
 	struct ucc_fast __iomem *uf_regs;
 
 	if (!priv)
@@ -837,7 +834,6 @@ static int uhdlc_suspend(struct device *dev)
 	netif_device_detach(priv->ndev);
 	napi_disable(&priv->napi);
 
-	ut_info = priv->ut_info;
 	uf_regs = priv->uf_regs;
 
 	/* backup gumr guemr*/
@@ -870,7 +866,7 @@ static int uhdlc_resume(struct device *dev)
 	struct ucc_fast __iomem *uf_regs;
 	struct ucc_fast_private *uccf;
 	struct ucc_fast_info *uf_info;
-	int ret, i;
+	int i;
 	u32 cecr_subblock;
 	u16 bd_status;
 
@@ -915,16 +911,16 @@ static int uhdlc_resume(struct device *dev)
 
 	/* Write to QE CECR, UCCx channel to Stop Transmission */
 	cecr_subblock = ucc_fast_get_qe_cr_subblock(uf_info->ucc_num);
-	ret = qe_issue_cmd(QE_STOP_TX, cecr_subblock,
-			   (u8)QE_CR_PROTOCOL_UNSPECIFIED, 0);
+	qe_issue_cmd(QE_STOP_TX, cecr_subblock,
+		     (u8)QE_CR_PROTOCOL_UNSPECIFIED, 0);
 
 	/* Set UPSMR normal mode */
 	iowrite32be(0, &uf_regs->upsmr);
 
 	/* init parameter base */
 	cecr_subblock = ucc_fast_get_qe_cr_subblock(uf_info->ucc_num);
-	ret = qe_issue_cmd(QE_ASSIGN_PAGE_TO_DEVICE, cecr_subblock,
-			   QE_CR_PROTOCOL_UNSPECIFIED, priv->ucc_pram_offset);
+	qe_issue_cmd(QE_ASSIGN_PAGE_TO_DEVICE, cecr_subblock,
+		     QE_CR_PROTOCOL_UNSPECIFIED, priv->ucc_pram_offset);
 
 	priv->ucc_pram = (struct ucc_hdlc_param __iomem *)
 				qe_muram_addr(priv->ucc_pram_offset);
-- 
2.20.1

