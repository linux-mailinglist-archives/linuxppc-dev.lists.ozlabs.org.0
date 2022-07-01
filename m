Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E3563462
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 15:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZGMh2cbPz3dvD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 23:32:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=lIYM+GT+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.113; helo=m15113.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=lIYM+GT+;
	dkim-atps=neutral
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZGM42Sgxz3cJC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 23:31:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=iyvTE
	etB4oB0VizdePA1KSoOMFKXF/53ZA6Y8pQPaQs=; b=lIYM+GT+y1Y5SzXq94oyp
	c1G8SwpXFyirlrwpmTqZBFakUU/jd8GD9xhpNfOWVPmvcd0QJAlKovgflr4w5nRk
	WnKS+XZvNoUkJcok8evLYesgQ7aF2xjPEeMYRuHQyr/6YA7efYyWhAP8c2JvyRTK
	0WM6tJ92Uj2cZQtafNvFSo=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowAB3E5Uu975idVJFEQ--.54276S2;
	Fri, 01 Jul 2022 21:31:27 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	windhl@126.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: 44x: Add of_node_put() when break out from for_each
Date: Fri,  1 Jul 2022 21:31:26 +0800
Message-Id: <20220701133126.243102-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAB3E5Uu975idVJFEQ--.54276S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF4UJFWxGr47Ar4xCw4DJwb_yoW3AFc_G3
	s7Ka1xur4kWr4qv3ZFvF4fKF15A3y5GrWDKFnaq3WIqa45tan5Gr4kZFWUWF4jyF4UtFW3
	Xr4kJrZ8Aa4FgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU3fH5UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGhAxF1-HZay49QAAsw
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ppc47x_init_irq(), we need to call of_node_put() when there is
a break during the iteration of for_each_node_with_property() which
will automatically increase and decrease the refcount.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/44x/ppc476.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index 20cc8f80b086..7d9075fb20c9 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -140,6 +140,7 @@ static void __init ppc47x_init_irq(void)
 		ppc_md.get_irq = mpic_get_irq;
 	} else
 		panic("Unrecognized top level interrupt controller");
+	of_node_put(np);
 }
 
 #ifdef CONFIG_SMP
-- 
2.25.1

