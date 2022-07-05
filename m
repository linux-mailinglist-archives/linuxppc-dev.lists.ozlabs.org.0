Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3F566A3A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 13:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcgyg0mGsz3c4r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 21:52:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VbTY5TVC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.112; helo=m15112.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VbTY5TVC;
	dkim-atps=neutral
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcgxz24LBz3bqY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 21:51:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LpV+I
	4QmIyV0R85YTNe/1HIeNJITz5KodVBqKzfBoH0=; b=VbTY5TVCC+Jk+KE+XDnBd
	2KUCet8OZbn28EWOrkJDArztgA2rLTQ9PjxbR4I1vbIgNwBvwGcNJZM8hwaJWky6
	77HTVAG2mfvL1HE7C7HVvvDOxB83M0FMQW0DHqCVNxo6ePVy3AxtYxDE6kQyvtoj
	saRe7z0vxPVRd7XCPQ+eC0=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp2 (Coremail) with SMTP id DMmowACnEwCnJcRidzKVEQ--.34355S2;
	Tue, 05 Jul 2022 19:51:04 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc: fsl: pci: Remove of_node_put() in fsl_pci_assign_primary()
Date: Tue,  5 Jul 2022 19:51:03 +0800
Message-Id: <20220705115103.283190-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowACnEwCnJcRidzKVEQ--.34355S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWUGFW3JF1DWFy8tFyDtrb_yoW3trc_G3
	Z7uFZrZw4rJr48Arn3KFZ5Cry5Z3yUGrZFkFn2qanrA3W5J3s8GanrX3yqqry5ur4ayrZ5
	GrWUXr45AFW0yjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_lApDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhE1F18RPb8v7wABsw
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

for_each_matching_node() will automatically increase and decrease
the refcount. As there is a reference escaped out into global
'fsl_pci_primary', we should not use of_node_put() anymore.

Fixes: 905e75c46dba ("powerpc/fsl-pci: Unify pci/pcie initialization code")
Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/sysdev/fsl_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 4c986c955951..d23a56276f42 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1137,7 +1137,6 @@ void __init fsl_pci_assign_primary(void)
 	for_each_matching_node(np, pci_ids) {
 		if (of_device_is_available(np)) {
 			fsl_pci_primary = np;
-			of_node_put(np);
 			return;
 		}
 	}
-- 
2.25.1

