Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ECF79889B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 16:23:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gj6+HOIN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gj6+HOIN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhyyS4vQnz3c8D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 00:23:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gj6+HOIN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gj6+HOIN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhytl2mHXz3cRn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 00:20:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694182812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgpEMaHVobI+NyRMHSyQTMrhDCPMtnu0GB3IP2St3Fc=;
	b=gj6+HOINtcWzdFQDGNu6PawsL3Gyp6JFKM5uHH9/+rV7p6duVyVks+rY7v4DFJT74xKu1e
	2RME3Qz97vKtOTQQNWRqIX5ehOE/JzfmXnusZSX05BIBg5x3+O+NHoh9c/9OQ2hjXBtmAs
	xY23orpoPjxaQn6n7qPjRfR/WTPNZo8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694182812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgpEMaHVobI+NyRMHSyQTMrhDCPMtnu0GB3IP2St3Fc=;
	b=gj6+HOINtcWzdFQDGNu6PawsL3Gyp6JFKM5uHH9/+rV7p6duVyVks+rY7v4DFJT74xKu1e
	2RME3Qz97vKtOTQQNWRqIX5ehOE/JzfmXnusZSX05BIBg5x3+O+NHoh9c/9OQ2hjXBtmAs
	xY23orpoPjxaQn6n7qPjRfR/WTPNZo8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-_rLRtwXQPfivtrdBO3M9qw-1; Fri, 08 Sep 2023 10:20:10 -0400
X-MC-Unique: _rLRtwXQPfivtrdBO3M9qw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D3B53C100CA;
	Fri,  8 Sep 2023 14:20:10 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBD5E2026D37;
	Fri,  8 Sep 2023 14:20:05 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv5 3/3] powerpc/setup: alloc extra paca_ptrs to hold boot_cpuid
Date: Fri,  8 Sep 2023 22:19:41 +0800
Message-Id: <20230908141941.13660-4-piliu@redhat.com>
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

paca_ptrs should be large enough to hold the boot_cpuid, hence, its
lower boundary is set to the bigger one between boot_cpuid+1 and
nr_cpus.

On the other hand, some kernel component: -1. the timer assumes cpu0
online since the timer_list->flags subfield 'TIMER_CPUMASK' is zero if
not initialized to a proper present cpu.  -2. power9_idle_stop() assumes
the primary thread's paca is allocated.

Hence lift nr_cpu_ids from one to two to ensure cpu0 is onlined, if the
boot cpu is not cpu0.

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
 arch/powerpc/kernel/paca.c | 10 ++++++----
 arch/powerpc/kernel/prom.c |  9 ++++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index cda4e00b67c1..91e2401de1bd 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -242,9 +242,10 @@ static int __initdata paca_struct_size;
 
 void __init allocate_paca_ptrs(void)
 {
-	paca_nr_cpu_ids = nr_cpu_ids;
+	int n = (boot_cpuid + 1) > nr_cpu_ids ? (boot_cpuid + 1) : nr_cpu_ids;
 
-	paca_ptrs_size = sizeof(struct paca_struct *) * nr_cpu_ids;
+	paca_nr_cpu_ids = n;
+	paca_ptrs_size = sizeof(struct paca_struct *) * n;
 	paca_ptrs = memblock_alloc_raw(paca_ptrs_size, SMP_CACHE_BYTES);
 	if (!paca_ptrs)
 		panic("Failed to allocate %d bytes for paca pointers\n",
@@ -287,13 +288,14 @@ void __init allocate_paca(int cpu)
 void __init free_unused_pacas(void)
 {
 	int new_ptrs_size;
+	int n = (boot_cpuid + 1) > nr_cpu_ids ? (boot_cpuid + 1) : nr_cpu_ids;
 
-	new_ptrs_size = sizeof(struct paca_struct *) * nr_cpu_ids;
+	new_ptrs_size = sizeof(struct paca_struct *) * n;
 	if (new_ptrs_size < paca_ptrs_size)
 		memblock_phys_free(__pa(paca_ptrs) + new_ptrs_size,
 				   paca_ptrs_size - new_ptrs_size);
 
-	paca_nr_cpu_ids = nr_cpu_ids;
+	paca_nr_cpu_ids = n;
 	paca_ptrs_size = new_ptrs_size;
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 72be75d4f003..eca6a1568749 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -360,9 +360,12 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 			 */
 			boot_cpuid = i;
 			found = true;
-			/* This works around the hole in paca_ptrs[]. */
-			if (nr_cpu_ids < nthreads)
-				nr_cpu_ids = nthreads;
+			/*
+			 * Ideally, nr_cpus=1 can be achieved if each kernel
+			 * component does not assume cpu0 is onlined.
+			 */
+			if (boot_cpuid != 0 && nr_cpu_ids < 2)
+				nr_cpu_ids = 2;
 		}
 #ifdef CONFIG_SMP
 		/* logical cpu id is always 0 on UP kernels */
-- 
2.31.1

