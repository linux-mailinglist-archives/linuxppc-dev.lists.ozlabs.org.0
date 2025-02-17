Return-Path: <linuxppc-dev+bounces-6238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6101FA37A41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 04:59:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx86F4Lprz2yyC;
	Mon, 17 Feb 2025 14:59:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.205.221.236
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739757319;
	cv=none; b=KgAazKxAwjsAh2ruqpxmJeVAsY+pnK5ZjruV7bdC5q0NAQ/bj3PMn8ft2LXEbVehnXK34PiNvkBY/cLSvtH5ZFk7ccVFkC1va+4RsDrGOofc2R9ixduJ2HHHeLzU9nJvYr0I4Hs3N6vp+Ukk4wGba6//j9qBkt3J/qZKG/iiIc6WMIP1PR8dHVjW9xPw7ApuYJ5cyKxfYlbBFt7HQ8d0rk2PP4KunMxSG+cIpl1copGJ5wJ59f0Mo/sjQ4I+D2ct9Mlx3B+HVRB/CzzcKHG9VIl50kvQTrtGKWFet3UWtil41aRjJw5f3/8Lsrr3d6EJZrnDqVNOp/suz6a8+FWozA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739757319; c=relaxed/relaxed;
	bh=pP07imU1yRZo5VJuVB+0B4Te8JSt7A3ydHeyAZRXe2k=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Minueft5hxJ/GEqItuRhzlqBVVA/+IRV02ICAqxYlN2UyUrodM5drucSZ83v4dtcbFOtvW5f6MGz9d4fbbRZG5JFd+i52mEfrBKwCwom6jW1e8+fg+jbyiFxxlZKGNDzgKJ3FHUocToSf9KYdCjwuN/8TwvImrAY5GF9uw3HKZxg/d0jK1zzKjQ7kZw3UTl/fhuI9WLoma7tyrS8BhNAx9Hk/+nsuVwhWNuVHhLSb23n/BInqZHV/fQY4ZfAmJaL0tCNAx84LwaDA1T4Jk+3IZ7T4DfLTySRZWtLL9MlT+VnE6ozOfKAsWzP7HFCsuEqE79wsMqxMPa4iejYP/OXaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=pNNlbVgE; dkim-atps=neutral; spf=pass (client-ip=203.205.221.236; helo=out203-205-221-236.mail.qq.com; envelope-from=xiaopeitux@foxmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=foxmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=pNNlbVgE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foxmail.com (client-ip=203.205.221.236; helo=out203-205-221-236.mail.qq.com; envelope-from=xiaopeitux@foxmail.com; receiver=lists.ozlabs.org)
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Yx5MR43Mvz2xGp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 12:55:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1739757311;
	bh=pP07imU1yRZo5VJuVB+0B4Te8JSt7A3ydHeyAZRXe2k=;
	h=From:To:Cc:Subject:Date;
	b=pNNlbVgEHt4FWo2ScIqCW/lkTqbg64dUkldXuud2ba574XFTSLbzLwkifCEwOl7y9
	 lw6U3sAN4frX15304bcD6wlhX1z/GcSe6pSFXuaV2YlLUpC+h8/4/lq4igHMw2k8To
	 PVN2yUY53PaBX54kDtBWmQWPEWOamZpp6ETqIwN4=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 75F9AABE; Mon, 17 Feb 2025 09:29:31 +0800
X-QQ-mid: xmsmtpt1739755771trd9me21x
Message-ID: <tencent_30122FBA93E93911578208176E68AA00C807@qq.com>
X-QQ-XMAILINFO: M0yQCYO1Pk4BQK9MwsPiXqLGdYYZSCLOPPfcpbnW81QswNSiwoPu1fQRPn7F4g
	 Mydr584M1QsAx8p9vJW2dNlaGgSs9qjxzUQoqGMgEXOKNDptenroPhnIdT7wOUzWwiCRjhyfexyk
	 TfYjGCNFByNDY6+DQ68CGxbWvmgRgPbVmxef1Yh3jlTSixjrFchIAGSh6SaHI14zkLLM3m5I+/Kh
	 ZQbL6/7GqFUrphyQwokQVvJkqsh1oRCKJz6klboLy/nEMeQhd7Q4icPHtOy4bXoMvMHrq6pfGkWg
	 ImYQA7TkTp+/IVwx8k7vJLN2yRL6HAj/DXjzr3oao5WcMkc12OFmm8OY4fIffYrNtNpl6Yg5WLzz
	 yk6y0BkDvpFi7hN2FllxQ2WHuWFl1fi29fC2vi2XKycICaR17lRkskAhDBE3F9Mk0wglksHagyU6
	 FB8NjSuJzycDlj2INNuygQBkdFTwRj9ApcHaLMyasP1Iqd0hGrKRd9OUTodpMSAlZkF1NBEXH1Nv
	 ymbMLU2prsmupp2Rq3wqCkA9aupjiejnS7QaUy5VO0grngJJoZfWJyeSRJMC8WLVHE1vigZ91ez2
	 GYHGccGvDCW5WpLW2fIPGSX+7Uoc4NMhNZqCUXfFbvAAgNmdsc3EuyphnzemUi6UrI7BDRxUSZ++
	 lOPyhTidGDJ5IrDdHWly5ByE4VPXNT7coAzK9926lFvsy8MqYS0sRTdCaC4MyYUxzH7zmYDcf+99
	 qMVY3fT7gcmgRUEqxaoKA0k/oGVrQwB1dessQJ4A34X93QMKQNxPZZxwyHNNtOG8GCxOD7kxnQAZ
	 CxwEIzKlVS5C/c6TRERMAQ6SK1XRdzsEmR1Fgy8XwJ1vp9gFSZscNiZeUNHdDtVK30/1s14ouo4J
	 p8EheVKqazUI0RO3xJHOSNook+sCdapEXcuTDEjTslQlXx1l866VpYw4r9KxpXXx9ty88vwRblqw
	 S3aqY4Miq4Snich5DAvT97+HhukaXt526TtBBLBgJIAq9yfTIGlw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: xiaopeitux@foxmail.com
To: andrew+netdev@lunn.ch,
	maxime.chevallier@bootlin.com,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V2] net: freescale: ucc_geth: make ugeth_mac_ops be static const
Date: Mon, 17 Feb 2025 09:29:30 +0800
X-OQ-MSGID: <05ccd0ec9dda47a7bb26b78ef41fea2f2ce675c8.1739755552.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
	RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Pei Xiao <xiaopei01@kylinos.cn>

sparse warning:
    sparse: symbol 'ugeth_mac_ops' was not declared. Should it be
static.

Add static to fix sparse warnings and add const. phylink_create() will
accept a const struct.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502141128.9HfxcdIE-lkp@intel.com/
Fixes: 53036aa8d031 ("net: freescale: ucc_geth: phylink conversion")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

changlog:
V2:change to add 'const' suggestion from Andrew Lunn's review.
---
 drivers/net/ethernet/freescale/ucc_geth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index f47f8177a93b..ed4f57701485 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3408,7 +3408,7 @@ static int ucc_geth_parse_clock(struct device_node *np, const char *which,
 	return 0;
 }
 
-struct phylink_mac_ops ugeth_mac_ops = {
+static const struct phylink_mac_ops ugeth_mac_ops = {
 	.mac_link_up = ugeth_mac_link_up,
 	.mac_link_down = ugeth_mac_link_down,
 	.mac_config = ugeth_mac_config,
-- 
2.25.1


