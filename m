Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B95111DA9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 23:56:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SHRB5rx0zDqR3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 09:56:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="h5phQB4N"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SHMh4TNqzDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 09:53:36 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3EEE20865;
 Tue,  3 Dec 2019 22:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575413614;
 bh=pSfYKfebvfswSMG9aERDVNa+OxFdxdH6xAe+7HpCZGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h5phQB4Np5j8xyAVZP0dXVGlrVhFR2HGTnBja8ZLBQ5bQVim76qN+mWfuvy4mjV4A
 X62Dh8Kh8d496R5T2UBZCIEF85Vrd9u4uZUPYDvISGAeA6BZSJNyN76fH4w7tLrgh8
 fO3oD3PfNked532v778pBa6bPo0nEM/jinCO98Mc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.19 195/321] net/wan/fsl_ucc_hdlc: Avoid double free in
 ucc_hdlc_probe()
Date: Tue,  3 Dec 2019 23:34:21 +0100
Message-Id: <20191203223437.264747584@linuxfoundation.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191203223427.103571230@linuxfoundation.org>
References: <20191203223427.103571230@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Peng Hao <peng.hao2@zte.com.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Wen Yang <wen.yang99@zte.com.cn>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit 40752b3eae29f8ca2378e978a02bd6dbeeb06d16 ]

This patch fixes potential double frees if register_hdlc_device() fails.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Reviewed-by: Peng Hao <peng.hao2@zte.com.cn>
CC: Zhao Qiang <qiang.zhao@nxp.com>
CC: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index 5f0366a125e26..0212f576a838c 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -1113,7 +1113,6 @@ static int ucc_hdlc_probe(struct platform_device *pdev)
 	if (register_hdlc_device(dev)) {
 		ret = -ENOBUFS;
 		pr_err("ucc_hdlc: unable to register hdlc device\n");
-		free_netdev(dev);
 		goto free_dev;
 	}
 
-- 
2.20.1



