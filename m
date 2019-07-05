Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B49D160303
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 11:21:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45g8VR652QzDqPS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 19:21:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zte.com.cn
 (client-ip=202.103.147.169; helo=mxct.zte.com.cn;
 envelope-from=wen.yang99@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
X-Greylist: delayed 954 seconds by postgrey-1.36 at bilbo;
 Fri, 05 Jul 2019 19:20:03 AEST
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45g8Sg36Q8zDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 19:20:02 +1000 (AEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 823F65DFFAA7B06D2835;
 Fri,  5 Jul 2019 17:04:00 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x6591Fw5033077;
 Fri, 5 Jul 2019 17:01:15 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019070517014955-2109273 ;
 Fri, 5 Jul 2019 17:01:49 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: fix use-after-free on fixup_port_irq()
Date: Fri, 5 Jul 2019 16:59:36 +0800
Message-Id: <1562317176-13317-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-05 17:01:49,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-05 17:01:21, Serialize complete at 2019-07-05 17:01:21
X-MAIL: mse-fl1.zte.com.cn x6591Fw5033077
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
Cc: wang.yi59@zte.com.cn, Rob Herring <robh@kernel.org>,
 Paul Mackerras <paulus@samba.org>, xue.zhihong@zte.com.cn,
 cheng.shengyu@zte.com.cn, linuxppc-dev@lists.ozlabs.org,
 Wen Yang <wen.yang99@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a possible use-after-free issue in the fixup_port_irq():

460 static void __init fixup_port_irq(int index,
461                                   struct device_node *np,
462                                   struct plat_serial8250_port *port)
463 {
...
469         if (!virq && legacy_serial_infos[index].irq_check_parent) {
470                 np = of_get_parent(np);  --> modified here.
...
474                 of_node_put(np); ---> released here
475         }
...
481 #ifdef CONFIG_SERIAL_8250_FSL
482   if (of_device_is_compatible(np, "fsl,ns16550")) --> dereferenced here
...
484 #endif
485 }

We solve this problem by introducing a new parent_np variable.

Fixes: 9deaa53ac7fa ("serial: add irq handler for Freescale 16550 errata.")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Rob Herring <robh@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/kernel/legacy_serial.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 7cea597..0105f3e 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -461,17 +461,18 @@ static void __init fixup_port_irq(int index,
 				  struct device_node *np,
 				  struct plat_serial8250_port *port)
 {
+	struct device_node *parent_np;
 	unsigned int virq;
 
 	DBG("fixup_port_irq(%d)\n", index);
 
 	virq = irq_of_parse_and_map(np, 0);
 	if (!virq && legacy_serial_infos[index].irq_check_parent) {
-		np = of_get_parent(np);
-		if (np == NULL)
+		parent_np = of_get_parent(np);
+		if (parent_np == NULL)
 			return;
-		virq = irq_of_parse_and_map(np, 0);
-		of_node_put(np);
+		virq = irq_of_parse_and_map(parent_np, 0);
+		of_node_put(parent_np);
 	}
 	if (!virq)
 		return;
-- 
2.9.5

