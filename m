Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD94798872
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 16:20:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xk+JdwKF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xk+JdwKF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhyvT3M2Bz3cPX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 00:20:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xk+JdwKF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xk+JdwKF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhytc1Cy5z3c5C
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 00:20:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694182805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7xoI6V2E4wSjCDv9yeHRNiboQUmHX3X3HLQRk8we5Y=;
	b=Xk+JdwKFJ6D9vCKDbW3G7yKpRJgT7N4BgarLJP+yt4LWEDBsWAht7uRd87HRu0CyPPv3oP
	dGUXReT3X3GzrRqSYs7khp2cIM1UMiePusAHVRH1rFos+Ve7+tierLjWmrZj1dYCmyv8xc
	7xL6pN+g7/lTMTw5ef5cyBhE3BZeyoA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694182805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7xoI6V2E4wSjCDv9yeHRNiboQUmHX3X3HLQRk8we5Y=;
	b=Xk+JdwKFJ6D9vCKDbW3G7yKpRJgT7N4BgarLJP+yt4LWEDBsWAht7uRd87HRu0CyPPv3oP
	dGUXReT3X3GzrRqSYs7khp2cIM1UMiePusAHVRH1rFos+Ve7+tierLjWmrZj1dYCmyv8xc
	7xL6pN+g7/lTMTw5ef5cyBhE3BZeyoA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-ThkhliuENa29tz73_ulvNg-1; Fri, 08 Sep 2023 10:20:00 -0400
X-MC-Unique: ThkhliuENa29tz73_ulvNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FE86101CA85;
	Fri,  8 Sep 2023 14:20:00 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD3C72026D2C;
	Fri,  8 Sep 2023 14:19:55 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv5 1/3] powerpc/setup: Loosen the mapping between cpu logical id and its seq in dt
Date: Fri,  8 Sep 2023 22:19:39 +0800
Message-Id: <20230908141941.13660-2-piliu@redhat.com>
In-Reply-To: <20230908141941.13660-1-piliu@redhat.com>
References: <20230908141941.13660-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

*** Idea ***
For kexec -p, the boot cpu can be not the cpu0, this causes the problem
of allocating memory for paca_ptrs[]. However, in theory, there is no
requirement to assign cpu's logical id as its present sequence in the
device tree. But there is something like cpu_first_thread_sibling(),
which makes assumption on the mapping inside a core. Hence partially
loosening the mapping, i.e. unbind the mapping of core while keep the
mapping inside a core.

*** Implement ***
At this early stage, there are plenty of memory to utilize. Hence, this
patch allocates interim memory to link the cpu info on a list, then
reorder cpus by changing the list head. As a result, there is a rotate
shift between the sequence number in dt and the cpu logical number.

*** Result ***
After this patch, a boot-cpu's logical id will always be mapped into the
range [0,threads_per_core).

Besides this, at this phase, all threads in the boot core are forced to
be onlined. This restriction will be lifted in a later patch with
extra effort.

Signed-off-by: Pingfan Liu <piliu@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@linux.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/prom.c         | 23 ++++----
 arch/powerpc/kernel/setup-common.c | 87 +++++++++++++++++++++++-------
 2 files changed, 83 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..72be75d4f003 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -331,8 +331,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	const __be32 *intserv;
 	int i, nthreads;
 	int len;
-	int found = -1;
-	int found_thread = 0;
+	bool found = false;
 
 	/* We are scanning "cpu" nodes only */
 	if (type == NULL || strcmp(type, "cpu") != 0)
@@ -355,8 +354,15 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	for (i = 0; i < nthreads; i++) {
 		if (be32_to_cpu(intserv[i]) ==
 			fdt_boot_cpuid_phys(initial_boot_params)) {
-			found = boot_cpu_count;
-			found_thread = i;
+			/*
+			 * always map the boot-cpu logical id into the
+			 * range of [0, thread_per_core)
+			 */
+			boot_cpuid = i;
+			found = true;
+			/* This works around the hole in paca_ptrs[]. */
+			if (nr_cpu_ids < nthreads)
+				nr_cpu_ids = nthreads;
 		}
 #ifdef CONFIG_SMP
 		/* logical cpu id is always 0 on UP kernels */
@@ -365,15 +371,14 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	}
 
 	/* Not the boot CPU */
-	if (found < 0)
+	if (!found)
 		return 0;
 
-	DBG("boot cpu: logical %d physical %d\n", found,
-	    be32_to_cpu(intserv[found_thread]));
-	boot_cpuid = found;
+	DBG("boot cpu: logical %d physical %d\n", boot_cpuid,
+	    be32_to_cpu(intserv[boot_cpuid]));
 
 	if (IS_ENABLED(CONFIG_PPC64))
-		boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
+		boot_cpu_hwid = be32_to_cpu(intserv[boot_cpuid]);
 
 	/*
 	 * PAPR defines "logical" PVR values for cpus that
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index d2a446216444..a07af8de6674 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -36,6 +36,7 @@
 #include <linux/of_platform.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
+#include <linux/list.h>
 #include <asm/io.h>
 #include <asm/paca.h>
 #include <asm/processor.h>
@@ -427,6 +428,13 @@ static void __init cpu_init_thread_core_maps(int tpc)
 
 u32 *cpu_to_phys_id = NULL;
 
+struct interrupt_server_node {
+	struct list_head node;
+	bool	avail;
+	int	len;
+	__be32 *intserv;
+};
+
 /**
  * setup_cpu_maps - initialize the following cpu maps:
  *                  cpu_possible_mask
@@ -448,11 +456,16 @@ u32 *cpu_to_phys_id = NULL;
 void __init smp_setup_cpu_maps(void)
 {
 	struct device_node *dn;
-	int cpu = 0;
-	int nthreads = 1;
+	int shift = 0, cpu = 0;
+	int j, nthreads = 1;
+	int len;
+	struct interrupt_server_node *intserv_node, *n;
+	struct list_head *bt_node, head;
+	bool avail, found_boot_cpu = false;
 
 	DBG("smp_setup_cpu_maps()\n");
 
+	INIT_LIST_HEAD(&head);
 	cpu_to_phys_id = memblock_alloc(nr_cpu_ids * sizeof(u32),
 					__alignof__(u32));
 	if (!cpu_to_phys_id)
@@ -462,7 +475,6 @@ void __init smp_setup_cpu_maps(void)
 	for_each_node_by_type(dn, "cpu") {
 		const __be32 *intserv;
 		__be32 cpu_be;
-		int j, len;
 
 		DBG("  * %pOF...\n", dn);
 
@@ -482,29 +494,68 @@ void __init smp_setup_cpu_maps(void)
 			}
 		}
 
-		nthreads = len / sizeof(int);
-
-		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
-			bool avail;
+		avail = of_device_is_available(dn);
+		if (!avail)
+			avail = !of_property_match_string(dn,
+					"enable-method", "spin-table");
 
-			DBG("    thread %d -> cpu %d (hard id %d)\n",
-			    j, cpu, be32_to_cpu(intserv[j]));
 
-			avail = of_device_is_available(dn);
-			if (!avail)
-				avail = !of_property_match_string(dn,
-						"enable-method", "spin-table");
+		intserv_node = memblock_alloc(sizeof(struct interrupt_server_node) + len,
+					__alignof__(u32));
+		if (!intserv_node)
+			panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
+				__func__,
+				sizeof(struct interrupt_server_node) + len,
+				__alignof__(u32));
+		intserv_node->intserv = (__be32 *)((char *)intserv_node +
+						sizeof(struct interrupt_server_node));
+		intserv_node->len = len;
+		memcpy(intserv_node->intserv, intserv, len);
+		intserv_node->avail = avail;
+		INIT_LIST_HEAD(&intserv_node->node);
+		list_add_tail(&intserv_node->node, &head);
+
+		if (!found_boot_cpu) {
+			nthreads = len / sizeof(int);
+			for (j = 0 ; j < nthreads; j++) {
+				if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
+					bt_node = &intserv_node->node;
+					found_boot_cpu = true;
+					/*
+					 * Record the round-shift between dt
+					 * seq and cpu logical number
+					 */
+					shift = cpu - j;
+					break;
+				}
+
+				cpu++;
+			}
+		}
 
+	}
+	cpu = 0;
+	list_del_init(&head);
+	/* Select the primary thread, the boot cpu's slibing, as the logic 0 */
+	list_add_tail(&head, bt_node);
+	pr_info("the round shift between dt seq and the cpu logic number: %d\n", shift);
+	list_for_each_entry(intserv_node, &head, node) {
+
+		avail = intserv_node->avail;
+		nthreads = intserv_node->len / sizeof(int);
+		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
 			set_cpu_present(cpu, avail);
 			set_cpu_possible(cpu, true);
-			cpu_to_phys_id[cpu] = be32_to_cpu(intserv[j]);
+			cpu_to_phys_id[cpu] = be32_to_cpu(intserv_node->intserv[j]);
+			DBG("    thread %d -> cpu %d (hard id %d)\n",
+			    j, cpu, be32_to_cpu(intserv[j]));
 			cpu++;
 		}
+	}
 
-		if (cpu >= nr_cpu_ids) {
-			of_node_put(dn);
-			break;
-		}
+	list_for_each_entry_safe(intserv_node, n, &head, node) {
+		len = sizeof(struct interrupt_server_node) + intserv_node->len;
+		memblock_free(intserv_node, len);
 	}
 
 	/* If no SMT supported, nthreads is forced to 1 */
-- 
2.31.1

