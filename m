Return-Path: <linuxppc-dev+bounces-6184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E85A35B58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 11:19:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvShx438lz2yk7;
	Fri, 14 Feb 2025 21:19:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.205.221.231
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739525119;
	cv=none; b=hMfEDnOuL1oPYd27cAg4aCRD5cMolRR2aFaYodmsXjCKMaxK9tiyFygWQTnC6aopTnpKoyfmP3ZKuQop6F/j0c2S5lzO8ymmpuk/aTp7ZrvVNnseEKZb6p1mwC75sYaQE5aSwSy4notExW/PwhJ4iTyp9ZnJb/CU0JM7Obxl8Xv8N7/gp/FS8R/r/3syvoIQ52Osn0nzbli/IOe2Z0oXSTTN67AOCwcmLimzn7kufFNiINzwiOyzqhrDhtGbZBsO/HUJhVJfOLvkMWjl8k81P6WYMIXl9VHgSE/Itoi+Je5I54fPmK1k67t3IuJit1BJBsFTJWgk5gabKnhsOPRjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739525119; c=relaxed/relaxed;
	bh=I9tMxA0b35Ehfj2sW9QpEMSfeMBVVc4pqXPgNUSyFJI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=IrWIMJPGj3ObF8ew45+XUCrTgS5/VfFgPKcoMrji8/VMktsn2TqYyHJve+O85217I1shKdWNOH/Z30b3fqHkuxlynNn13VT5oV0n+qsEP0SswC+q9XJ/mZtfo/XsFdRaMZ+L/Yq5cr2fMKu1mUdx8u9GwLV6zNg5EQCVKqK0vteVJoQDRuWooRI9qTFKk0KiWJzmQ9ooV7wPCgB400YQA680cLvjzoiPV5RF/Jiq8RC7TVUY0DdmUgu9LiftEu/bu+jpGkEvyDX/dx6qMmxnLtVJHe4p9pjUawvgTnHXFlGJn1uwvvRM1399B/cgFCOoaJFS4DD3ZErGAYa+qkqB4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=eRafmj4N; dkim-atps=neutral; spf=pass (client-ip=203.205.221.231; helo=out203-205-221-231.mail.qq.com; envelope-from=xiaopeitux@foxmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=foxmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=eRafmj4N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foxmail.com (client-ip=203.205.221.231; helo=out203-205-221-231.mail.qq.com; envelope-from=xiaopeitux@foxmail.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 11261 seconds by postgrey-1.37 at boromir; Fri, 14 Feb 2025 20:25:16 AEDT
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4YvRV42XnKz30W0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 20:25:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1739525108;
	bh=I9tMxA0b35Ehfj2sW9QpEMSfeMBVVc4pqXPgNUSyFJI=;
	h=From:To:Cc:Subject:Date;
	b=eRafmj4Nn0RJmMZxKKCPewJukLw4FYmGssrL4xqxep+7BsoxaQaKotXThW7IoJNpm
	 9eK53Azanu24qlIIxVoGz470KqJgBlzImZYHc+Z/BO8CSe4GequNPpCkwwdtuqbEa5
	 Ja/yVleRS31HlB1xWfOeeh/+5PKcZhBc0Tt1SXyE=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 2C88A6BB; Fri, 14 Feb 2025 14:11:08 +0800
X-QQ-mid: xmsmtpt1739513468tg3oqmv9r
Message-ID: <tencent_832FF5138D392257AC081FEE322A03C84907@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeiehVxo+faJzMBrZMJ7TGsCOUlN4TBw/pxiWd3JxEndMuo3xdDyMB
	 hw5nZTeA8kHAXi7hoIcWIWLCkCMSXVA1V0O/T5Y3RuToIEUY0hTdcgQb08vo3LhJXKsfC/JAvHfI
	 dFlAWCttNdr0V4trtFUMRcXnyH964UhkOzb51/bZfoor6r0FE2f9UE5YpxX23Di25YQaAxO92CP8
	 Iooke+oYAazomDNH/ofk9CYXzM7PWpS3LueiFgK2e4sYNBJwAD1p0ggeJ0w7cBQI5nTRJ3/FDl+p
	 qXpgEjcHKK2keiab4mSAS8b42zMoQoPLh5J7lpAOR19p0C6Y571Ut1RFfO8Omf9nvA+1xTe6f50z
	 aPB1LPh2k8dFdMKfrKyseGDSs9y8rruJGtcYvHKLtjdmFtirUK5ERtB3UlnFYv2JnXesFYeBqcg6
	 BxOtiLc1Dx5wUCEWorxZxyLEzC/LBHrjr8RzA7jcElNt1TwfAcb6Ot7QEVnb38LH6O/xuJT2fNG9
	 629mM3h7fo7+BL5hS164+RWu94Qk3xXaNtzcRQAuc9f0BCg6HlS8QrIjTUDG234gtklE/UKr/WhP
	 te6CenuNctvR3b+WXNAmV3Tj6s1Xd63QDpNhtNd0uFf0we42I9EabA9cvuHqWxGLjmUiDinwhStd
	 QCLf5Kk/h+n+p5AhXFoQ0xui7AhcQwkap7EAJIR6ml9cu/gelcHTcS9st2JiNamIIwMhx7GOm7Nd
	 vPv/Gd5+/xMlLsx+zX75NAXtr/M9vb6eulH7KVYwuscVqFFqpnATGfv0X6ewFENr35Sk4CmAalXH
	 tdvlO66UxWeQbpTOqoG5v5la1zDSixvPfW101WnC8fQgKxSgha6LOEj6Eda7axYH+zT9+V+hmbvm
	 zDVyI7Q5g6Cd0LKk3uL36EOhC+x59LzSAecuUmSLPTAFF0p1ZEwsFo7ZHJSFBDjBMKLF2Ef1NaE3
	 AfAvZ+qmc=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: xiaopeitux@foxmail.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] net: freescale: ucc_geth: make ugeth_mac_ops be static
Date: Fri, 14 Feb 2025 14:11:07 +0800
X-OQ-MSGID: <e940237592fae0d6e8e32d6b61b4ff18724dc918.1739513279.git.xiaopei01@kylinos.cn>
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

Add static to fix sparse warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502141128.9HfxcdIE-lkp@intel.com/
Fixes: 53036aa8d031 ("net: freescale: ucc_geth: phylink conversion")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index f47f8177a93b..c24b2f75435f 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3408,7 +3408,7 @@ static int ucc_geth_parse_clock(struct device_node *np, const char *which,
 	return 0;
 }
 
-struct phylink_mac_ops ugeth_mac_ops = {
+static struct phylink_mac_ops ugeth_mac_ops = {
 	.mac_link_up = ugeth_mac_link_up,
 	.mac_link_down = ugeth_mac_link_down,
 	.mac_config = ugeth_mac_config,
-- 
2.25.1


