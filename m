Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7385A108F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 14:32:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD2Rn0cgYz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 22:32:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=bg5.exmail.qq.com; envelope-from=yuanjilin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 437 seconds by postgrey-1.36 at boromir; Thu, 25 Aug 2022 22:32:32 AEST
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD2RN5bTkz2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 22:32:32 +1000 (AEST)
X-QQ-mid: bizesmtp67t1661430267tcyqppkd
Received: from localhost.localdomain ( [182.148.14.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Aug 2022 20:24:26 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: iBxuBmNAXy06zdryGGJHuEeVxHvs3CqEDaPaA1fC8U8EcVcJHjOs0ualjkxAB
	8xVtmhWiI2fDfJSBHwyHWgsKqNdKjG4Nu0IYM9Id22RMylifHMgfLY41mOPMMzN2xUqoFNV
	y2PF4wFF1I4sX1tY0l2OJ0MirpFyNlivftj7q5B7pWQs+mulLnWfRCdbzgTwJWsauA8VKt+
	/4yA7YjtbqbntDq3J/RqUze7iZuqGRbMMF365fiJovBYVzTXRbyxLCq9VD7E5ozr8p9hn7A
	ref76jtkLP0RshPum5N0KaJZpCKdsuUbBfQgtjAq8KSGimW93oenf3hLnaVeN5sRlL+PfVj
	VA6mZGpu/uTXKhIJz46EWwJKW6cNNfBViIyECGm6Ej1UwFgxpoU4B8nLjcCOQ==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: Roy.Pledge@nxp.com,
	leoyang.li@nxp.com
Subject: [PATCH] fsl/dpio: fix repeated words in comments
Date: Thu, 25 Aug 2022 20:24:18 +0800
Message-Id: <20220825122418.24508-1-yuanjilin@cdjrlc.com>
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 Delete the redundant word 'to'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/soc/fsl/dpio/dpio-service.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index 1d2b27e3ea63..5315e01624c7 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -331,7 +331,7 @@ EXPORT_SYMBOL_GPL(dpaa2_io_service_register);
  * @dev: the device that requests to be deregistered
  *
  * This function should be called only after sending the MC command to
- * to detach the notification-producing device from the DPIO.
+ * detach the notification-producing device from the DPIO.
  */
 void dpaa2_io_service_deregister(struct dpaa2_io *service,
 				 struct dpaa2_io_notification_ctx *ctx,
-- 
2.36.1

