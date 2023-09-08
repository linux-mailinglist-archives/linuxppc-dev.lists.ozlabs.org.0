Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643DB798881
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 16:22:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ESaIA1M2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2Uc0qea;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhyxW1mSzz3dK6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 00:22:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ESaIA1M2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2Uc0qea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhytg2hL7z3cBr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 00:20:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694182808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hbw5LcVAhn/MF5vOS6EegrWEmv1/qJLDPF4qVdxgL4s=;
	b=ESaIA1M2VtUqTJdKfF+HsOr21ajWO7mQmzpMTRsikbT/oPbU/YdvWrPYX4zfcqP/T7XDwY
	LeO8mt5D4qSAVVORhFHTmqQAdYctq1tRiuKLxqGEtqO//K7PWNlPUcdZ+1GEOla4CePTEw
	WqGbVIxsEGEeBL8+zvJVMGCN3p88yPk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694182809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hbw5LcVAhn/MF5vOS6EegrWEmv1/qJLDPF4qVdxgL4s=;
	b=I2Uc0qeaTqh1qBtJ5/Wczw728EkQozFCMON1IyWmtmWqSNvrYgh+dw0Kybe4B1EAyQdZcT
	voATQXmSWexJw+lKl3MovVp1SMlxQ1xAQFLBOoSweAZwi3V4moQbI25wmVjTlothrAPhEf
	1twIt3HJiCpGCIoVbfHf307NEjX/NLU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-iwkDyBT4P6yBxF6jM0_Z8w-1; Fri, 08 Sep 2023 10:20:05 -0400
X-MC-Unique: iwkDyBT4P6yBxF6jM0_Z8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1959D81652B;
	Fri,  8 Sep 2023 14:20:05 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B68EB2026D2B;
	Fri,  8 Sep 2023 14:20:00 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv5 2/3] powerpc/setup: Handle the case when boot_cpuid greater than nr_cpus
Date: Fri,  8 Sep 2023 22:19:40 +0800
Message-Id: <20230908141941.13660-3-piliu@redhat.com>
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

If the boot_cpuid is smaller than nr_cpus, it requires extra effort to
ensure the boot_cpu is in cpu_present_mask. This can be achieved by
reserving the last quota for the boot cpu.

Note: the restriction on nr_cpus will be lifted with more effort in the
next patch

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
 arch/powerpc/kernel/setup-common.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index a07af8de6674..58a988c64dd2 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -456,8 +456,8 @@ struct interrupt_server_node {
 void __init smp_setup_cpu_maps(void)
 {
 	struct device_node *dn;
-	int shift = 0, cpu = 0;
-	int j, nthreads = 1;
+	int terminate, shift = 0, cpu = 0;
+	int j, bt_thread = 0, nthreads = 1;
 	int len;
 	struct interrupt_server_node *intserv_node, *n;
 	struct list_head *bt_node, head;
@@ -520,6 +520,7 @@ void __init smp_setup_cpu_maps(void)
 			for (j = 0 ; j < nthreads; j++) {
 				if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
 					bt_node = &intserv_node->node;
+					bt_thread = j;
 					found_boot_cpu = true;
 					/*
 					 * Record the round-shift between dt
@@ -539,11 +540,21 @@ void __init smp_setup_cpu_maps(void)
 	/* Select the primary thread, the boot cpu's slibing, as the logic 0 */
 	list_add_tail(&head, bt_node);
 	pr_info("the round shift between dt seq and the cpu logic number: %d\n", shift);
+	terminate = nr_cpu_ids;
 	list_for_each_entry(intserv_node, &head, node) {
 
+		j = 0;
+		/* Choose a start point to cover the boot cpu */
+		if (nr_cpu_ids - 1 < bt_thread) {
+			/*
+			 * The processor core puts assumption on the thread id,
+			 * not to breach the assumption.
+			 */
+			terminate = nr_cpu_ids - 1;
+		}
 		avail = intserv_node->avail;
 		nthreads = intserv_node->len / sizeof(int);
-		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
+		for (; j < nthreads && cpu < terminate; j++) {
 			set_cpu_present(cpu, avail);
 			set_cpu_possible(cpu, true);
 			cpu_to_phys_id[cpu] = be32_to_cpu(intserv_node->intserv[j]);
@@ -551,6 +562,14 @@ void __init smp_setup_cpu_maps(void)
 			    j, cpu, be32_to_cpu(intserv[j]));
 			cpu++;
 		}
+		/* Online the boot cpu */
+		if (nr_cpu_ids - 1 < bt_thread) {
+			set_cpu_present(bt_thread, avail);
+			set_cpu_possible(bt_thread, true);
+			cpu_to_phys_id[bt_thread] = be32_to_cpu(intserv_node->intserv[bt_thread]);
+			DBG("    thread %d -> cpu %d (hard id %d)\n",
+			    bt_thread, bt_thread, be32_to_cpu(intserv[bt_thread]));
+		}
 	}
 
 	list_for_each_entry_safe(intserv_node, n, &head, node) {
-- 
2.31.1

