Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 801767BD9F2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 13:33:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YmehWhp+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YmehWhp+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3xjz3Dg8z3cHH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 22:33:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YmehWhp+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YmehWhp+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3xgL1kKpz3cD1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 22:31:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696851067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9cvz5dwJHuu/tgHHoqiqw1etT//DdN97pOTVXqSORI=;
	b=YmehWhp+WbdI5AJLQI2NnWXXvdqgDFEPU8cizf6F/v5WV8OYphmyXx+WrdK750uqIyksFW
	x40NhHxV4RWbR0AlEM/3n5/5a4Fs1LzfSl3Z1UizWuP0AtJ8G/a+yfo79kILefkfmItc/2
	4zIdFt4Xx/dW6na40raYx0YYyvgNMAQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696851067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9cvz5dwJHuu/tgHHoqiqw1etT//DdN97pOTVXqSORI=;
	b=YmehWhp+WbdI5AJLQI2NnWXXvdqgDFEPU8cizf6F/v5WV8OYphmyXx+WrdK750uqIyksFW
	x40NhHxV4RWbR0AlEM/3n5/5a4Fs1LzfSl3Z1UizWuP0AtJ8G/a+yfo79kILefkfmItc/2
	4zIdFt4Xx/dW6na40raYx0YYyvgNMAQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-LlUsyy2TOOK7_tPLjMykfQ-1; Mon, 09 Oct 2023 07:31:06 -0400
X-MC-Unique: LlUsyy2TOOK7_tPLjMykfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63B1029ABA02;
	Mon,  9 Oct 2023 11:31:05 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62486215670B;
	Mon,  9 Oct 2023 11:30:59 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv8 3/5] powerpc/setup: Handle the case when boot_cpuid greater than nr_cpus
Date: Mon,  9 Oct 2023 19:30:34 +0800
Message-Id: <20231009113036.45988-4-piliu@redhat.com>
In-Reply-To: <20231009113036.45988-1-piliu@redhat.com>
References: <20231009113036.45988-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
successive patches

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
index 81291e13dec0..f9ef0a2666b0 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -454,8 +454,8 @@ struct interrupt_server_node {
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
@@ -518,6 +518,7 @@ void __init smp_setup_cpu_maps(void)
 			for (j = 0 ; j < nthreads; j++) {
 				if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
 					bt_node = &intserv_node->node;
+					bt_thread = j;
 					found_boot_cpu = true;
 					/*
 					 * Record the round-shift between dt
@@ -537,11 +538,21 @@ void __init smp_setup_cpu_maps(void)
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
@@ -549,6 +560,14 @@ void __init smp_setup_cpu_maps(void)
 			    j, cpu, be32_to_cpu(intserv_node->intserv[j]));
 			cpu++;
 		}
+		/* Online the boot cpu */
+		if (nr_cpu_ids - 1 < bt_thread) {
+			set_cpu_present(bt_thread, avail);
+			set_cpu_possible(bt_thread, true);
+			cpu_to_phys_id[bt_thread] = be32_to_cpu(intserv_node->intserv[bt_thread]);
+			DBG("    thread %d -> cpu %d (hard id %d)\n",
+			    bt_thread, bt_thread, be32_to_cpu(intserv_node->intserv[bt_thread]));
+		}
 	}
 
 	list_for_each_entry_safe(intserv_node, n, &head, node) {
-- 
2.31.1

