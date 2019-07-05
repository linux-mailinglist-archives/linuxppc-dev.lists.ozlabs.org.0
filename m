Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A783260300
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 11:19:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45g8Rn6g2XzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 19:19:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zte.com.cn
 (client-ip=63.217.80.70; helo=mxhk.zte.com.cn;
 envelope-from=wen.yang99@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45g8Pw5wRgzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 19:17:39 +1000 (AEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id DF928AA3DFE30716F390;
 Fri,  5 Jul 2019 17:01:50 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x658xd1n029870;
 Fri, 5 Jul 2019 16:59:39 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019070517001669-2109207 ;
 Fri, 5 Jul 2019 17:00:16 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/83xx: fix use-after-free on mpc831x_usb_cfg()
Date: Fri, 5 Jul 2019 16:58:04 +0800
Message-Id: <1562317084-13140-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-05 17:00:16,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-05 16:59:45, Serialize complete at 2019-07-05 16:59:45
X-MAIL: mse-fl1.zte.com.cn x658xd1n029870
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
Cc: wang.yi59@zte.com.cn, Scott Wood <oss@buserror.net>,
 Paul Mackerras <paulus@samba.org>, xue.zhihong@zte.com.cn,
 cheng.shengyu@zte.com.cn, linuxppc-dev@lists.ozlabs.org,
 Wen Yang <wen.yang99@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The np variable is still being used after the of_node_put() call,
which may result in use-after-free.
We fix this issue by calling of_node_put() after the last usage.
This patatch also do some cleanup.

Fixes: fd066e850351 ("powerpc/mpc8308: fix USB DR controller initialization")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Scott Wood <oss@buserror.net>
Cc: Kumar Gala <galak@kernel.crashing.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/platforms/83xx/usb.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/usb.c b/arch/powerpc/platforms/83xx/usb.c
index 3d247d7..56b36fa 100644
--- a/arch/powerpc/platforms/83xx/usb.c
+++ b/arch/powerpc/platforms/83xx/usb.c
@@ -158,14 +158,11 @@ int mpc831x_usb_cfg(void)
 
 	iounmap(immap);
 
-	of_node_put(immr_node);
-
 	/* Map USB SOC space */
 	ret = of_address_to_resource(np, 0, &res);
-	if (ret) {
-		of_node_put(np);
-		return ret;
-	}
+	if (ret)
+		goto out_put_node;
+
 	usb_regs = ioremap(res.start, resource_size(&res));
 
 	/* Using on-chip PHY */
@@ -174,7 +171,7 @@ int mpc831x_usb_cfg(void)
 		u32 refsel;
 
 		if (of_device_is_compatible(immr_node, "fsl,mpc8308-immr"))
-			goto out;
+			goto out_unmap;
 
 		if (of_device_is_compatible(immr_node, "fsl,mpc8315-immr"))
 			refsel = CONTROL_REFSEL_24MHZ;
@@ -201,8 +198,10 @@ int mpc831x_usb_cfg(void)
 		ret = -EINVAL;
 	}
 
-out:
+out_unmap:
 	iounmap(usb_regs);
+out_put_node:
+	of_node_put(immr_node);
 	of_node_put(np);
 	return ret;
 }
-- 
2.9.5

