Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E7634E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 13:28:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jg743j1pzDqd0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 21:28:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jg5J29FSzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 21:27:00 +1000 (AEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id BF05A3D636B270877121;
 Tue,  9 Jul 2019 19:26:58 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x69BEa6q016939;
 Tue, 9 Jul 2019 19:14:36 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019070919144868-2212253 ;
 Tue, 9 Jul 2019 19:14:48 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] powerpc/83xx: cleanup error paths in mpc831x_usb_cfg()
Date: Tue, 9 Jul 2019 19:12:48 +0800
Message-Id: <1562670768-23178-3-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562670768-23178-1-git-send-email-wen.yang99@zte.com.cn>
References: <1562670768-23178-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-09 19:14:48,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-09 19:14:39, Serialize complete at 2019-07-09 19:14:39
X-MAIL: mse-fl1.zte.com.cn x69BEa6q016939
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
 cheng.shengyu@zte.com.cn, Markus Elfring <Markus.Elfring@web.de>,
 linuxppc-dev@lists.ozlabs.org, Wen Yang <wen.yang99@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rename the jump labels according to the cleanup they perform,
and move reference handling to simplify cleanup.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Scott Wood <oss@buserror.net>
Cc: Kumar Gala <galak@kernel.crashing.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Markus Elfring <Markus.Elfring@web.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/platforms/83xx/usb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/usb.c b/arch/powerpc/platforms/83xx/usb.c
index 19dcef5..56b36fa 100644
--- a/arch/powerpc/platforms/83xx/usb.c
+++ b/arch/powerpc/platforms/83xx/usb.c
@@ -160,11 +160,9 @@ int mpc831x_usb_cfg(void)
 
 	/* Map USB SOC space */
 	ret = of_address_to_resource(np, 0, &res);
-	if (ret) {
-		of_node_put(immr_node);
-		of_node_put(np);
-		return ret;
-	}
+	if (ret)
+		goto out_put_node;
+
 	usb_regs = ioremap(res.start, resource_size(&res));
 
 	/* Using on-chip PHY */
@@ -173,7 +171,7 @@ int mpc831x_usb_cfg(void)
 		u32 refsel;
 
 		if (of_device_is_compatible(immr_node, "fsl,mpc8308-immr"))
-			goto out;
+			goto out_unmap;
 
 		if (of_device_is_compatible(immr_node, "fsl,mpc8315-immr"))
 			refsel = CONTROL_REFSEL_24MHZ;
@@ -200,8 +198,9 @@ int mpc831x_usb_cfg(void)
 		ret = -EINVAL;
 	}
 
-out:
+out_unmap:
 	iounmap(usb_regs);
+out_put_node:
 	of_node_put(immr_node);
 	of_node_put(np);
 	return ret;
-- 
2.9.5

