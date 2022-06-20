Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83282551AB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 15:27:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRVmr0ptbz3cgB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 23:27:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=o8rt2A0L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.114; helo=m15114.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=o8rt2A0L;
	dkim-atps=neutral
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRVmD4WTvz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 23:26:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TMaPy
	Qh4UJVSS8nyoEwcv4/4c+wXIIrRuUAawmAe7+I=; b=o8rt2A0Lf1hw8WSLylURq
	lC1BXv/QliX8CVJL/Yk75lJas3zyfMogUE0w+wGOMLnKpDdmqcU0c3TDo9x1SNzj
	nzsu5tPuucRUKy6/Zf2GHe0+vaOSuJFgQChH4Edafxld6fLN/WY5m11NedNDMzhB
	Nav+vOtaCPsSSrHcNYJBPQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowAA34vthdbBitdPuDg--.52744S2;
	Mon, 20 Jun 2022 21:25:54 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	clg@kaod.org,
	christophe.leroy@csgroup.eu
Subject: [PATCH v3] powerpc/powernv: Fix refcount leak bugs
Date: Mon, 20 Jun 2022 21:25:53 +0800
Message-Id: <20220620132553.4073863-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAA34vthdbBitdPuDg--.52744S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrW7ZrWfWrWxGrWrAF45trb_yoW7JrW5p3
	s0krsIqa10krW8tasrtas8WFWUtFnYkrWxXw1UC3srAwsxZ3saqr1vyryrJrZ7Jr45G3W0
	vr1Sqwn0yFnxu3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uxl19UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AQmF1pEDwx8kAAAsY
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In these driver init functions, there are two kinds of errors:

(1) missing of_put_node() for of_find_compatible_node()'s returned
    pointer (refcount incremented)  in fail path or when it is not
    used anymore.
(2) missing of_put_node() for 'for_each_xxx' loop's break

These bugs are similar with the ones reported by commit-09700c504d.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v3: merge more refcount bugs into one commit
 v2: merge opal-*.c
 v1: send  mising of_node_put patch for each file


 arch/powerpc/platforms/powernv/idle.c               | 1 +
 arch/powerpc/platforms/powernv/opal-core.c          | 2 ++
 arch/powerpc/platforms/powernv/opal-powercap.c      | 6 +++++-
 arch/powerpc/platforms/powernv/opal-psr.c           | 6 +++++-
 arch/powerpc/platforms/powernv/opal-sensor-groups.c | 6 +++++-
 arch/powerpc/platforms/powernv/opal.c               | 1 +
 6 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 6f94b808dd39..c1b369c7f507 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1419,6 +1419,7 @@ static int __init pnv_parse_cpuidle_dt(void)
 	kfree(temp_u32);
 	kfree(temp_u64);
 	kfree(temp_string);
+	of_node_put(np);
 	return rc;
 }
 
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index adcb1a1a2bfe..bb7657115f1d 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -348,6 +348,8 @@ static int __init create_opalcore(void)
 	if (!dn || ret)
 		pr_warn("WARNING: Failed to read OPAL base & entry values\n");
 
+	of_node_put(dn);
+
 	/* Use count to keep track of the program headers */
 	count = 0;
 
diff --git a/arch/powerpc/platforms/powernv/opal-powercap.c b/arch/powerpc/platforms/powernv/opal-powercap.c
index 64506b46e77b..78c359c90093 100644
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
@@ -226,6 +226,7 @@ void __init opal_powercap_init(void)
 		}
 		i++;
 	}
+	of_node_put(powercap);
 
 	return;
 
@@ -236,6 +237,9 @@ void __init opal_powercap_init(void)
 		kfree(pcaps[i].pg.name);
 	}
 	kobject_put(powercap_kobj);
+	of_node_put(node);
 out_pcaps:
 	kfree(pcaps);
+out_powercap:
+	of_node_put(powercap);
 }
diff --git a/arch/powerpc/platforms/powernv/opal-psr.c b/arch/powerpc/platforms/powernv/opal-psr.c
index 69d7e75950d1..ec32e0a93f08 100644
--- a/arch/powerpc/platforms/powernv/opal-psr.c
+++ b/arch/powerpc/platforms/powernv/opal-psr.c
@@ -135,7 +135,7 @@ void __init opal_psr_init(void)
 	psr_attrs = kcalloc(of_get_child_count(psr), sizeof(*psr_attrs),
 			    GFP_KERNEL);
 	if (!psr_attrs)
-		return;
+		goto out_psr;
 
 	psr_kobj = kobject_create_and_add("psr", opal_kobj);
 	if (!psr_kobj) {
@@ -162,10 +162,14 @@ void __init opal_psr_init(void)
 		}
 		i++;
 	}
+	of_node_put(psr);
 
 	return;
 out_kobj:
+	of_node_put(node);
 	kobject_put(psr_kobj);
 out:
 	kfree(psr_attrs);
+out_psr:
+	of_node_put(psr);
 }
diff --git a/arch/powerpc/platforms/powernv/opal-sensor-groups.c b/arch/powerpc/platforms/powernv/opal-sensor-groups.c
index 8fba7d25ae56..9944376b115c 100644
--- a/arch/powerpc/platforms/powernv/opal-sensor-groups.c
+++ b/arch/powerpc/platforms/powernv/opal-sensor-groups.c
@@ -170,7 +170,7 @@ void __init opal_sensor_groups_init(void)
 
 	sgs = kcalloc(of_get_child_count(sg), sizeof(*sgs), GFP_KERNEL);
 	if (!sgs)
-		return;
+		goto out_sg_put;
 
 	sg_kobj = kobject_create_and_add("sensor_groups", opal_kobj);
 	if (!sg_kobj) {
@@ -222,6 +222,7 @@ void __init opal_sensor_groups_init(void)
 		}
 		i++;
 	}
+	of_node_put(sg);
 
 	return;
 
@@ -231,6 +232,9 @@ void __init opal_sensor_groups_init(void)
 		kfree(sgs[i].sg.attrs);
 	}
 	kobject_put(sg_kobj);
+	of_node_put(node);
 out_sgs:
 	kfree(sgs);
+out_sg_put:
+	of_node_put(sg);
 }
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 55a8fbfdb5b2..d86cc48a10aa 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -952,6 +952,7 @@ static void __init opal_imc_init_dev(void)
 	np = of_find_compatible_node(NULL, NULL, IMC_DTB_COMPAT);
 	if (np)
 		of_platform_device_create(np, NULL, NULL);
+	of_node_put(np);
 }
 
 static int kopald(void *unused)
-- 
2.25.1

