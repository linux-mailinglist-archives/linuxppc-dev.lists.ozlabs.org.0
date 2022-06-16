Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C954E523
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 16:41:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP4ch0c9Jz3c9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 00:41:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=gBN4cU/M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.114; helo=m15114.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=gBN4cU/M;
	dkim-atps=neutral
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP4c36l7kz308V
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 00:41:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=phAgN
	klwvZ7SdoZ2WJPlzBwUJAkY95Zd5DNyI8fp88c=; b=gBN4cU/Myd2tGIza1Q6lT
	mqFRxwpu5vmSthPUPG6AOxgZNKYaKWQ0mRLVwC+WVFfgl6jm+4etuqxnC3yjAv/r
	0OXRxcMIUa+UYWyWc9TvFhRRH9/RdRAZbX2NujXRYcQ5hzqM3nMnuKL1pzv3wE/3
	d31MQtZ47sW2VMFNWQxQAs=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowABXlfTHQKti04bZDQ--.15246S2;
	Thu, 16 Jun 2022 22:40:08 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	agust@denx.de,
	benh@kernel.crashing.org,
	paulus@samba.org,
	christophe.leroy@csgroup.eu,
	maz@kernel.org,
	wangqing@vivo.com
Subject: [PATCH] powerpc: platforms: 52xx: Fix refcount leak in media5200.c
Date: Thu, 16 Jun 2022 22:40:07 +0800
Message-Id: <20220616144007.3987743-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowABXlfTHQKti04bZDQ--.15246S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr17tFykJFykZw48KF45ZFb_yoWkArg_W3
	WkZF47Wr48Jr4DJrZIvr13AF1jyw48WF18KFn0qa17Jwn8XrsxWrn2vFsFkw4UXr4IvrW5
	Gan5KF4qya4YvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjn2-3UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2gkiF1uwMN203AAAsI
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In media5200_init_irq(), of_find_compatible_node() will return a
node pointer with refcount incremented. We should use of_node_put()
in fail path or when it is not used anymore.

Don't worry about 'fpga_np==NULL' as of_node_put() can correctly
handle it.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/52xx/media5200.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index ee367ff3ec8a..33a35fff11b5 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -174,6 +174,8 @@ static void __init media5200_init_irq(void)
 		goto out;
 	pr_debug("%s: allocated irqhost\n", __func__);
 
+	of_node_put(fpga_np);
+
 	irq_set_handler_data(cascade_virq, &media5200_irq);
 	irq_set_chained_handler(cascade_virq, media5200_irq_cascade);
 
@@ -181,6 +183,7 @@ static void __init media5200_init_irq(void)
 
  out:
 	pr_err("Could not find Media5200 FPGA; PCI interrupts will not work\n");
+	of_node_put(fpga_np);
 }
 
 /*
-- 
2.25.1

