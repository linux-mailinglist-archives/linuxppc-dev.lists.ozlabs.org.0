Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A297634E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 13:27:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jg5M0CDZzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 21:27:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jg3c4t23zDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 21:25:29 +1000 (AEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 31C573A19DFEBA308556;
 Tue,  9 Jul 2019 19:25:25 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x69BEa6p016939;
 Tue, 9 Jul 2019 19:14:36 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019070919144793-2212252 ;
 Tue, 9 Jul 2019 19:14:47 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc/83xx: fix use-after-free in mpc831x_usb_cfg()
Date: Tue, 9 Jul 2019 19:12:47 +0800
Message-Id: <1562670768-23178-2-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562670768-23178-1-git-send-email-wen.yang99@zte.com.cn>
References: <1562670768-23178-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-09 19:14:48,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-09 19:14:39, Serialize complete at 2019-07-09 19:14:39
X-MAIL: mse-fl1.zte.com.cn x69BEa6p016939
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

The immr_node variable is still being used after the of_node_put() call,
which may result in use-after-free.
Fix this issue by calling of_node_put() after the last usage.

Fixes: fd066e850351 ("powerpc/mpc8308: fix USB DR controller initialization")
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
 arch/powerpc/platforms/83xx/usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/usb.c b/arch/powerpc/platforms/83xx/usb.c
index 3d247d7..19dcef5 100644
--- a/arch/powerpc/platforms/83xx/usb.c
+++ b/arch/powerpc/platforms/83xx/usb.c
@@ -158,11 +158,10 @@ int mpc831x_usb_cfg(void)
 
 	iounmap(immap);
 
-	of_node_put(immr_node);
-
 	/* Map USB SOC space */
 	ret = of_address_to_resource(np, 0, &res);
 	if (ret) {
+		of_node_put(immr_node);
 		of_node_put(np);
 		return ret;
 	}
@@ -203,6 +202,7 @@ int mpc831x_usb_cfg(void)
 
 out:
 	iounmap(usb_regs);
+	of_node_put(immr_node);
 	of_node_put(np);
 	return ret;
 }
-- 
2.9.5

