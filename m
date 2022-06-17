Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0709A54F010
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 06:22:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPQqF6gk8z3bsV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 14:22:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=kTU2lWOA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=kTU2lWOA;
	dkim-atps=neutral
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPQpZ6GT0z3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 14:21:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ENvGQ
	PwIvf1KPG42t7qvZiJODByyrvbH42c33b2b8TU=; b=kTU2lWOAAwxs67X1r/NHj
	TqT3s4m+mBoWxZTK7sPw7137FzgDrueWkFEuYdYW4uGl/eCeHjmgaR54l0lxQYVs
	ZnPPl4at5zHOB5OGLWbvKm1yfjbACta6QImmZRs0kj4z+Ux5mO+nyelnAvZT05oc
	N5kQXCWwGFCojsVeff4K/g=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgDndoMYAaxioZlTFw--.27823S2;
	Fri, 17 Jun 2022 12:20:41 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc: powernv: Fix refcount leak bug in opal-powercap
Date: Fri, 17 Jun 2022 12:20:38 +0800
Message-Id: <20220617042038.4003704-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgDndoMYAaxioZlTFw--.27823S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyfGw1fZr13Ww13Gw18Grg_yoW8Jw48pr
	9093yxXa18CrWIyayIyaykuF4UtFn5Cr4UG34UCry7AwsxZwnayr4jyry3JFn7AF45Jw1F
	vr4ag3s8tFnxuaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziW8BUUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGhEjF1-HZUM9IgAAse
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
Cc: nick.child@ibm.com, linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In opal_powercap_init(), of_find_compatible_node() will return
a node pointer with refcount incremented. We should use of_node_put()
in fail path or when it is not used anymore.

Besides, for_each_child_of_node() will automatically *inc* and *dec*
refcount during iteration. However, we should add the of_node_put()
if there is a break.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/powernv/opal-powercap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal-powercap.c b/arch/powerpc/platforms/powernv/opal-powercap.c
index 64506b46e77b..b102477d3f95 100644
--- a/arch/powerpc/platforms/powernv/opal-powercap.c
+++ b/arch/powerpc/platforms/powernv/opal-powercap.c
@@ -153,7 +153,7 @@ void __init opal_powercap_init(void)
 	pcaps = kcalloc(of_get_child_count(powercap), sizeof(*pcaps),
 			GFP_KERNEL);
 	if (!pcaps)
-		return;
+		goto out_powercap;
 
 	powercap_kobj = kobject_create_and_add("powercap", opal_kobj);
 	if (!powercap_kobj) {
@@ -236,6 +236,9 @@ void __init opal_powercap_init(void)
 		kfree(pcaps[i].pg.name);
 	}
 	kobject_put(powercap_kobj);
+	of_node_put(node);
 out_pcaps:
 	kfree(pcaps);
+out_powercap:
+	of_node_put(powercap);
 }
-- 
2.25.1

