Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7B54F918
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 16:24:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPh9s5zjnz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 00:24:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=N046eXUx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=N046eXUx;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPh981DBwz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 00:23:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=46qf4
	v/98lZL/cjdrS9URiyjGBVaTZXV0aX4AjqPfT8=; b=N046eXUxLbstAUrXdPdDl
	hDWOdAfsprMyY0GmvUluiummC+sJTDuVH4itc6MGvQoR6QeOJkc+XqRR+x5QsX4A
	fBDgcPK/oHmAvrrvaxdbxqu7i1WijI9/UBrF69LejAi1yN5LX9JU6yq9xpG9EKKR
	JhcxMLkB5qed7x6GtRy7oU=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgAnbYEwjqxiYGt_Ew--.39797S2;
	Fri, 17 Jun 2022 22:22:41 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	npiggin@gmail.com,
	haren@linux.ibm.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH v2] powerpc: powernv: Fix refcount leak bug
Date: Fri, 17 Jun 2022 22:22:39 +0800
Message-Id: <20220617142239.4050408-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgAnbYEwjqxiYGt_Ew--.39797S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrW7ZrWDZFWDuFyrurWfZrb_yoW5ur4kpr
	90krsrXw40krW0ya9Fyas8WFWUt3Z5CrWxAw1UC3srAwsxZwn3tr10yFyrJFZ7Ar45J3W0
	yr1Sqwn0yFnrC3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziZa9DUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBEjF2JVj6h1EwAAsr
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

In these driver init functions, there are two kinds of errors:

(1) missing of_put_node() for of_find_compatible_node()'s returned
    pointer (refcount incremented)  in fail path or when it is not
    used anymore.
(2) missing of_put_node() for 'for_each_xxx' loop's break

These bugs are similar with the ones reported by commit-09700c504d.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:
 
 v2: merge all powernv related bugs into one commit 
 v1: only fix bugs in opal-powercap.c


 arch/powerpc/platforms/powernv/opal-powercap.c      | 6 +++++-
 arch/powerpc/platforms/powernv/opal-psr.c           | 6 +++++-
 arch/powerpc/platforms/powernv/opal-sensor-groups.c | 6 +++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

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
-- 
2.25.1

