Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0854551973
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 15:03:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRVFz4GKRz3cgB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 23:03:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=MfiQ6KjY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=MfiQ6KjY;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRVFN67T4z3br0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 23:03:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xQcnq
	FKzRLBCZwDBdcAaOo7ny52OP4pLcchze/ooadM=; b=MfiQ6KjY/HDcSL+lwB2lz
	AXYAUpGhu+XQJStwIttltU4576/dGTxh6Qrr9LsWlW5w/bF5YntOrgfLCQQJvvCu
	cGC7arQ/f3Y+7N0YpsWDV1MPfBoS/TEhqa9Ee0L7WzYVqflR9rlQsAYCq7JYH1fb
	thtzVsNmHE8dFdOpoD/BY0=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgAnZojfb7Bibv0PFA--.5104S2;
	Mon, 20 Jun 2022 21:02:24 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	clg@kaod.org,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de
Subject: [PATCH v2] powerpc/sysdev: Fix refcount leak bugs
Date: Mon, 20 Jun 2022 21:02:21 +0800
Message-Id: <20220620130221.4073228-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgAnZojfb7Bibv0PFA--.5104S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1DJw4DXw1DCrWDGw48WFg_yoWrCw4fpF
	ZFkFZxtF1Igr1xWrWIvF1IvrnIgF1qkFWYq39Fk397ArnrZ3s5Jr1vyryYqFy5JrWku3Wr
	tF15ur4j9FsxG3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUkuxUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hkmF1uwMPrXgQACsH
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

We need add corresponding of_node_put() to keep refcount balance
in sysdev.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: (1) merge all sysdev related bug into one commit
     (2) find new bugs in spapr.c and mpic_msgr.c
 v1: find missing of_node_put() in each file


 arch/powerpc/sysdev/fsl_pci.c     |  6 +++++-
 arch/powerpc/sysdev/mpic_msgr.c   | 10 +++++++++-
 arch/powerpc/sysdev/xive/native.c | 15 ++++++++++-----
 arch/powerpc/sysdev/xive/spapr.c  |  1 +
 4 files changed, 25 insertions(+), 7 deletions(-)

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
diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
index 698fefaaa6dd..2ff3a0a0cf3f 100644
--- a/arch/powerpc/sysdev/mpic_msgr.c
+++ b/arch/powerpc/sysdev/mpic_msgr.c
@@ -121,11 +121,13 @@ static unsigned int mpic_msgr_number_of_blocks(void)
 
 			count += 1;
 		}
+		of_node_put(aliases);
 	}
 
 	return count;
 }
 
+
 static unsigned int mpic_msgr_number_of_registers(void)
 {
 	return mpic_msgr_number_of_blocks() * MPIC_MSGR_REGISTERS_PER_BLOCK;
@@ -144,12 +146,18 @@ static int mpic_msgr_block_number(struct device_node *node)
 
 	for (index = 0; index < number_of_blocks; ++index) {
 		struct property *prop;
+		struct device_node *tn;
 
 		snprintf(buf, sizeof(buf), "mpic-msgr-block%d", index);
 		prop = of_find_property(aliases, buf, NULL);
-		if (node == of_find_node_by_path(prop->value))
+		tn = of_find_node_by_path(prop->value);
+		if (node == tn) {
+			of_node_put(tn);
 			break;
+		}
+		of_node_put(tn);
 	}
+	of_node_put(aliases);
 
 	return index == number_of_blocks ? -1 : index;
 }
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index d25d8c692909..3925825954bc 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -579,12 +579,12 @@ bool __init xive_native_init(void)
 	/* Resource 1 is HV window */
 	if (of_address_to_resource(np, 1, &r)) {
 		pr_err("Failed to get thread mgmnt area resource\n");
-		return false;
+		goto err_put;
 	}
 	tima = ioremap(r.start, resource_size(&r));
 	if (!tima) {
 		pr_err("Failed to map thread mgmnt area\n");
-		return false;
+		goto err_put;
 	}
 
 	/* Read number of priorities */
@@ -612,7 +612,7 @@ bool __init xive_native_init(void)
 	/* Resource 2 is OS window */
 	if (of_address_to_resource(np, 2, &r)) {
 		pr_err("Failed to get thread mgmnt area resource\n");
-		return false;
+		goto err_put;
 	}
 
 	xive_tima_os = r.start;
@@ -624,7 +624,7 @@ bool __init xive_native_init(void)
 	rc = opal_xive_reset(OPAL_XIVE_MODE_EXPL);
 	if (rc) {
 		pr_err("Switch to exploitation mode failed with error %lld\n", rc);
-		return false;
+		goto err_put;
 	}
 
 	/* Setup some dummy HV pool VPs */
@@ -634,10 +634,15 @@ bool __init xive_native_init(void)
 	if (!xive_core_init(np, &xive_native_ops, tima, TM_QW3_HV_PHYS,
 			    max_prio)) {
 		opal_xive_reset(OPAL_XIVE_MODE_EMU);
-		return false;
+		goto err_put;
 	}
+	of_node_put(np);
 	pr_info("Using %dkB queues\n", 1 << (xive_queue_shift - 10));
 	return true;
+
+err_put:
+	of_node_put(np);
+	return false;
 }
 
 static bool xive_native_provision_pages(void)
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 7d5128676e83..d398823d138e 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -717,6 +717,7 @@ static bool __init xive_get_max_prio(u8 *max_prio)
 	}
 
 	reg = of_get_property(rootdn, "ibm,plat-res-int-priorities", &len);
+	of_node_put(rootdn);
 	if (!reg) {
 		pr_err("Failed to read 'ibm,plat-res-int-priorities' property\n");
 		return false;
-- 
2.25.1

