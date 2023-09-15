Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76A7A1394
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 04:07:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PNti90my;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmyJJ2Nrfz3dRx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 12:07:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PNti90my;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.217; helo=m12.mail.163.com; envelope-from=ruc_gongyuanjun@163.com; receiver=lists.ozlabs.org)
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmyHN0d0Wz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 12:06:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LPl89
	OsVrh2SZYS0Frs0wE85+Tb6JSlWesds6qesK4s=; b=PNti90myWAz4tWLuQgHvq
	UrZJYrZB4hDllz+nIfya8kiGwZE5SDLPjSJnmrZ/PTV6dEJZ3/jUP9E34c2567/g
	xZRvJBKa5qX/xmhS3Dmm420wMzfrrC4U+1gy/jAJysX/V+L0D6kfqtvqenbvmD8H
	oVOj3Q8Rll7D140QXS7gzw=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g5-3 (Coremail) with SMTP id _____wCXRe4IvANlz2dsCA--.39336S4;
	Fri, 15 Sep 2023 10:06:10 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: tyreld@linux.ibm.com
Subject: [PATCH v2 1/1] powerpc: fix a memory leak
Date: Fri, 15 Sep 2023 10:05:59 +0800
Message-Id: <20230915020559.3396566-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <54bf92e8-f884-1567-2149-caf638ff8f68@linux.ibm.com>
References: <54bf92e8-f884-1567-2149-caf638ff8f68@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXRe4IvANlz2dsCA--.39336S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UGrW8Jr1xJF47Cr1fCrg_yoW8AFykpF
	WkGrn3Kr48Wr48tas0gFs5uF1Utr40q347KrZrW39rZ34Yvr98tF1rAF1v9FWxZrZ5A3W8
	KrsrtFyrZanxG3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziJ73PUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbB0Bfr5WEssXp5PAAAsK
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
Cc: linux-kernel@vger.kernel.org, Yuanjun Gong <ruc_gongyuanjun@163.com>, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When one of the methods xive_native_alloc_irq_on_chip, irq_create_mapping
or irq_get_handler_data fails, the function will directly return without
disposing vinst->name and vinst. Fix it.

Fixes: c20e1e299d93 ("powerpc/vas: Alloc and setup IRQ and trigger port address")
Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 arch/powerpc/platforms/powernv/vas.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index b65256a63e87..40cb7a03d180 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -102,6 +102,7 @@ static int init_vas_instance(struct platform_device *pdev)
 	res = &pdev->resource[3];
 	if (res->end > 62) {
 		pr_err("Bad 'paste_win_id_shift' in DT, %llx\n", res->end);
+		rc = -ENODEV
 		goto free_vinst;
 	}
 
@@ -111,21 +112,24 @@ static int init_vas_instance(struct platform_device *pdev)
 	if (!hwirq) {
 		pr_err("Inst%d: Unable to allocate global irq for chip %d\n",
 				vinst->vas_id, chipid);
-		return -ENOENT;
+		rc = -ENOENT;
+		goto free_vinst;
 	}
 
 	vinst->virq = irq_create_mapping(NULL, hwirq);
 	if (!vinst->virq) {
 		pr_err("Inst%d: Unable to map global irq %d\n",
 				vinst->vas_id, hwirq);
-		return -EINVAL;
+		rc = -EINVAL;
+		goto free_vinst;
 	}
 
 	xd = irq_get_handler_data(vinst->virq);
 	if (!xd) {
 		pr_err("Inst%d: Invalid virq %d\n",
 				vinst->vas_id, vinst->virq);
-		return -EINVAL;
+		rc = -EINVAL;
+		goto free_vinst;
 	}
 
 	vinst->irq_port = xd->trig_page;
@@ -168,7 +172,7 @@ static int init_vas_instance(struct platform_device *pdev)
 free_vinst:
 	kfree(vinst->name);
 	kfree(vinst);
-	return -ENODEV;
+	return rc;
 
 }
 
-- 
2.37.2

