Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE557B6B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 14:47:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnwT60xTfz3cj9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 22:47:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=bJmI2eCd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.111; helo=m15111.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=bJmI2eCd;
	dkim-atps=neutral
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnwSR6h5bz2xkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 22:46:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+rhTI
	H93KTJV3zsxuX1qwcdDxddosHerpoD8oiukMdw=; b=bJmI2eCdsZtRQbVarpGLs
	uhLKTYvSk4+CxTV86vJiK0yltYZnIshtzPs3BaW5wmJx12VrtBvJZkbYatRu4tKV
	q2xRREdsIzTvDq1h0ITTGcWL9dWszfaV1X+6khJ5QIZCy+BY8Y7uhxzzYa6eEB1y
	VYVo3dmO/jkXAKvOa1rHW8=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp1 (Coremail) with SMTP id C8mowAAX_iUK+ddigNvHHA--.36910S2;
	Wed, 20 Jul 2022 20:46:03 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/fsl_pci: Remove of_node_put() when reference escaped out
Date: Wed, 20 Jul 2022 20:45:57 +0800
Message-Id: <20220720124557.1256243-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAAX_iUK+ddigNvHHA--.36910S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW5Ar4xuFWrXr1xtrW3trb_yoW3ZFc_Ja
	n7ua9rZw4rAr48Awn3KF95C34rC3yUGrZFkFn2qwsrC3W5K3s8JanFq34qqry5urZIyrZ5
	GFZ8trZ8AFW0yjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKrWF7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QxEF1pEAbs6CQAAsl
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

In fsl_pci_assign_primary(), we should remove the of_node_put()
when breaking out of the for_each_matching_node() as the 'np'
is escaped out by global 'fsl_pci_primary'.

Fixes: 905e75c46dba ("powerpc/fsl-pci: Unify pci/pcie initialization code")
Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/sysdev/fsl_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index e8d072e98b66..aa7faa19c6ef 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1134,7 +1134,6 @@ void __init fsl_pci_assign_primary(void)
 	for_each_matching_node(np, pci_ids) {
 		if (of_device_is_available(np)) {
 			fsl_pci_primary = np;
-			of_node_put(np);
 			return;
 		}
 	}
-- 
2.25.1

