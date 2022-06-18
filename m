Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B076550282
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 05:33:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ1hb1F23z3c9p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 13:33:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=FIZb4tzA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.4; helo=mail-m964.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=FIZb4tzA;
	dkim-atps=neutral
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ1gz4Zwxz3000
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 13:32:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YG6dR
	e/hH640v9iwqegEl+qUfUjOQngoEiIIerWSUzc=; b=FIZb4tzAYeyqgHmXnBp45
	ryDHiBl2oQ+0QIOePtw3m5xcmKG1Ga3zLzRw2jGmNNL00rQeVOFAdjaV2oHdatEF
	D591kucTfAeUXr5TaQW4YjRuJl/jmgK0qflJiVhhFyBRyr4qAtARRaMU5NRivh2W
	S8W0j4uECveZcRXTFqhil4=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp9 (Coremail) with SMTP id NeRpCgDnStM4R61iQDkAFA--.33191S2;
	Sat, 18 Jun 2022 11:32:09 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	paulus@samba.org,
	christophe.leroy@csgroup.eu,
	nick.child@ibm.com,
	pali@kernel.org,
	npiggin@gmail.com
Subject: [PATCH] powerpc: sysdev: Fix refcount leak bug in fsl_pci.c
Date: Sat, 18 Jun 2022 11:32:07 +0800
Message-Id: <20220618033207.4057410-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgDnStM4R61iQDkAFA--.33191S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF1kCryrtFyxJw43trW7CFg_yoWDJrg_Xw
	1xu3WDZ395Ja1furs3Ca93t3sakw48WayqgFn2gay7Ja4Yg3y7Ja17Zr98XrW7ur4SyrWY
	kr95XrWYka4IvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMxhLDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBkkF2JVj6vE7wAAsq
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

In is_kdump(), we need a of_node_put() to dec the refcount which is
incremented by of_find_node_by_type().

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/sysdev/fsl_pci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 1011cfea2e32..4c986c955951 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -180,6 +180,7 @@ static int setup_one_atmu(struct ccsr_pci __iomem *pci,
 static bool is_kdump(void)
 {
 	struct device_node *node;
+	bool ret;
 
 	node = of_find_node_by_type(NULL, "memory");
 	if (!node) {
@@ -187,7 +188,10 @@ static bool is_kdump(void)
 		return false;
 	}
 
-	return of_property_read_bool(node, "linux,usable-memory");
+	ret = of_property_read_bool(node, "linux,usable-memory");
+	of_node_put(node);
+
+	return ret;
 }
 
 /* atmu setup for fsl pci/pcie controller */
-- 
2.25.1

