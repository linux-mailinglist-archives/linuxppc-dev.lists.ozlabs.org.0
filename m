Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 505517A0123
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:03:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=P7lOW5nz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmXvp1Jqgz3cnb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:03:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=P7lOW5nz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.215; helo=m12.mail.163.com; envelope-from=ruc_gongyuanjun@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 952 seconds by postgrey-1.37 at boromir; Thu, 14 Sep 2023 20:02:49 AEST
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmXtx1M2Jz3brX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 20:02:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qpxN8
	eVhvHSwP7MYIGTUCMjzSWsG1rKKF7waZF1XVSA=; b=P7lOW5nz4xza+9v5cvwhk
	4OaLP/hTu/c5QIkH+AHxQos0zYU0v4Fc6wX8pTIck4joSPTifB19xMj56VoKyYTt
	PcsO3HECdZmZyzgQLLHj1yjxLvxOvu6yRVg2MaZ1Rh4oMMvvYRiTOi3E3kwv9hFL
	Zg3alRUaDRmRWh6s3LuHLk=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id _____wAHhT1u1gJlztArCA--.43438S4;
	Thu, 14 Sep 2023 17:46:35 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] powerpc: fix a memory leak
Date: Thu, 14 Sep 2023 17:46:20 +0800
Message-Id: <20230914094620.3379729-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAHhT1u1gJlztArCA--.43438S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UGrW8Jr4fAFykuw4xtFb_yoW8ur1UpF
	WkGr48Kr48Wr18Ka90qFs8CF12yr40q3y7trZxC3sFya4Yqr1DtF1rAr1vvFWxArZ5A3W8
	KFsrtFyruFsrC3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziHmh7UUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiRB3q5WI0UusmfgAAsh
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
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When one of the methods xive_native_alloc_irq_on_chip, irq_create_mapping
or irq_get_handler_data fails, the function will directly return without
disposing vinst->name and vinst. Fix it.

Fixes: c20e1e299d93 ("powerpc/vas: Alloc and setup IRQ and trigger port address")
Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 arch/powerpc/platforms/powernv/vas.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index b65256a63e87..780740b478f0 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -54,7 +54,7 @@ static int init_vas_instance(struct platform_device *pdev)
 	struct xive_irq_data *xd;
 	uint32_t chipid, hwirq;
 	struct resource *res;
-	int rc, cpu, vasid;
+	int rc, cpu, vasid, ret;
 
 	rc = of_property_read_u32(dn, "ibm,vas-id", &vasid);
 	if (rc) {
@@ -102,6 +102,7 @@ static int init_vas_instance(struct platform_device *pdev)
 	res = &pdev->resource[3];
 	if (res->end > 62) {
 		pr_err("Bad 'paste_win_id_shift' in DT, %llx\n", res->end);
+		ret = -ENODEV
 		goto free_vinst;
 	}
 
@@ -111,21 +112,24 @@ static int init_vas_instance(struct platform_device *pdev)
 	if (!hwirq) {
 		pr_err("Inst%d: Unable to allocate global irq for chip %d\n",
 				vinst->vas_id, chipid);
-		return -ENOENT;
+		ret = -ENOENT;
+		goto free_vinst;
 	}
 
 	vinst->virq = irq_create_mapping(NULL, hwirq);
 	if (!vinst->virq) {
 		pr_err("Inst%d: Unable to map global irq %d\n",
 				vinst->vas_id, hwirq);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_vinst;
 	}
 
 	xd = irq_get_handler_data(vinst->virq);
 	if (!xd) {
 		pr_err("Inst%d: Invalid virq %d\n",
 				vinst->vas_id, vinst->virq);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_vinst;
 	}
 
 	vinst->irq_port = xd->trig_page;
@@ -168,7 +172,7 @@ static int init_vas_instance(struct platform_device *pdev)
 free_vinst:
 	kfree(vinst->name);
 	kfree(vinst);
-	return -ENODEV;
+	return ret;
 
 }
 
-- 
2.37.2

