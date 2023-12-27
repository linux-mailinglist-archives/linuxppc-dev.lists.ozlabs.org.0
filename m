Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4162E81EB94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 03:43:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QuJXBe2X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0GCY0Rdfz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 13:43:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QuJXBe2X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=kernelfans@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0GBG39Pgz3cVk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 13:41:58 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d3fc184b6dso17504095ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 18:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703644915; x=1704249715; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT7htYeDjY4vTdy1fPJWLnQt0GHG3z7MAu24V6teBIw=;
        b=QuJXBe2XlG7dzQKaW0YbEjBvaoEyDL1NfI/aOp4I+bvandm09NihA7k5vO3GYtjIzz
         75AScHdIa1Ea+EoYTRqQZRpN3PtmfnhHwDmKnv5csAGSfmL6PFCPestGui14vCFOfuPB
         V4CZpsyQ/pnaTUrP5wwVlWWG7KfTxNC0xPl0sne1KRVfhbHznU+2aj7vg9I+1b2f63St
         n5vdcrAs9pO87WZOlby4r8oLABQ3Ju66Tt7ETQ3Sh8OyWYsGM84FANswPmUcoGte1dyT
         dW5cyqCw5vzMfzSslFTokYlL3/Fqmoiw80EODxhhWgeLNJYAkuD7BS3AsPEIjRcHokuB
         +Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644915; x=1704249715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MT7htYeDjY4vTdy1fPJWLnQt0GHG3z7MAu24V6teBIw=;
        b=Xhu820Z3sXN5Nk59Ey05d9qWMJzn0jeGMNUhAy4YnmtTbDizdD6DDIR5t6HpQ46IWw
         2TjRc29vsK8pYQZUFsHmQX7u/IwrUB8Ef9LSMID5CtdLqmsKU95HwUymheWftIJnMw43
         UA5m6JV8702mN8NFPMqAupOQRzORcLbJPdbOPY4nvPIRk8cGOdtfq8bc/PpkBOvbzjLR
         yZpCU4TI0iWnAZp0AcJnMmIN/Z+YN2OXuJ40pnooyxvYV0yBmS67FadttUGBQnqkTICA
         b9AazgSwoxkFQdUsPnUBYwn4K3pwTdO8lJ0ohm5s4PMMy5tyfAUamz+Ex/lCCa67zv0Q
         9IwA==
X-Gm-Message-State: AOJu0YzNfKZ8ook1wehiGjfrBZVJiwnftN5faHHZA09MhJaUkBOC6QiF
	ccjSRV+14MDLOEC6Gobkp+IJTIdXafrf
X-Google-Smtp-Source: AGHT+IHCsge0Pwx3Fk+jrn3t8Mdnc4E5lcxUmO+ET7NbuD+U2d5OqeN9CRJcKSbmZQ7LgIFhpLQ4VQ==
X-Received: by 2002:a17:902:d584:b0:1d0:6ffd:8367 with SMTP id k4-20020a170902d58400b001d06ffd8367mr2747235plh.114.1703644915441;
        Tue, 26 Dec 2023 18:41:55 -0800 (PST)
Received: from piliu.users.ipa.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id jj20-20020a170903049400b001c61073b076sm10775062plb.144.2023.12.26.18.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:41:54 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv10 3/3] powerpc/smp: Allow hole in paca_ptrs to accommodate boot_cpu
Date: Wed, 27 Dec 2023 10:41:47 +0800
Message-Id: <20231227024147.12485-1-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231227023934.12299-1-kernelfans@gmail.com>
References: <20231227023934.12299-1-kernelfans@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pingfan Liu <piliu@redhat.com>

This patch always forces the first core onlined due to some subsystem
needs cpu0. After core0, a hole may follow, then comes the crashed core.

Signed-off-by: Pingfan Liu <piliu@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@us.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/smp.h     |  1 +
 arch/powerpc/kernel/paca.c         |  7 +++++--
 arch/powerpc/kernel/prom.c         |  6 ++++++
 arch/powerpc/kernel/setup-common.c | 24 ++++++++++++++++++++----
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index aaaa576d0e15..f01c7891b0d7 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -27,6 +27,7 @@
 
 extern int boot_cpuid;
 extern int boot_cpu_hwid; /* PPC64 only */
+extern int threads_in_core;
 extern int spinning_secondaries;
 extern u32 *cpu_to_phys_id;
 extern bool coregroup_enabled;
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 840c74dd17d6..1fe0fd2a6021 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -242,9 +242,12 @@ static int __initdata paca_struct_size;
 
 void __init allocate_paca_ptrs(void)
 {
-	paca_last_cpu_num = nr_cpu_ids;
+	unsigned int cnt;
 
-	paca_ptrs_size = sizeof(struct paca_struct *) * paca_last_cpu_num;
+	/* paca_ptrs should be big enough to hold boot cpu */
+	cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
+	paca_last_cpu_num = cnt;
+	paca_ptrs_size = sizeof(struct paca_struct *) * cnt;
 	paca_ptrs = memblock_alloc_raw(paca_ptrs_size, SMP_CACHE_BYTES);
 	if (!paca_ptrs)
 		panic("Failed to allocate %d bytes for paca pointers\n",
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..e1a671156941 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -371,9 +371,15 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	DBG("boot cpu: logical %d physical %d\n", found,
 	    be32_to_cpu(intserv[found_thread]));
 	boot_cpuid = found;
+	/* This forces all threads in a core to be onlined */
+	set_nr_cpu_ids(ALIGN(nr_cpu_ids, nthreads));
+	/* Core 0 is always onlined and assure enough room for boot core */
+	if (nthreads -1 < boot_cpuid && nr_cpu_ids < 2 * nthreads)
+		set_nr_cpu_ids(2 * nthreads);
 
 	if (IS_ENABLED(CONFIG_PPC64))
 		boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
+	threads_in_core = nthreads;
 
 	/*
 	 * PAPR defines "logical" PVR values for cpus that
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index f9f5f313abf0..b70474e1b5fe 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -86,6 +86,7 @@ EXPORT_SYMBOL(machine_id);
 
 int boot_cpuid = -1;
 EXPORT_SYMBOL_GPL(boot_cpuid);
+int __initdata threads_in_core = 1;
 
 #ifdef CONFIG_PPC64
 int boot_cpu_hwid = -1;
@@ -448,8 +449,9 @@ u32 *cpu_to_phys_id = NULL;
 void __init smp_setup_cpu_maps(void)
 {
 	struct device_node *dn;
-	int cpu = 0;
+	int cpu_onlined = 0, cpu = 0;
 	int nthreads = 1;
+	bool bootcpu_covered = false;
 
 	DBG("smp_setup_cpu_maps()\n");
 
@@ -484,7 +486,19 @@ void __init smp_setup_cpu_maps(void)
 
 		nthreads = len / sizeof(int);
 
-		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
+		if (!bootcpu_covered) {
+			if (cpu == ALIGN_DOWN(boot_cpuid, nthreads)) {
+				bootcpu_covered = true;
+				goto scan;
+
+			/* Reserve the last online slot for boot core */
+			} else if (cpu >= nr_cpu_ids - nthreads && !bootcpu_covered) {
+				cpu += nthreads;
+				continue;
+			}
+		}
+scan:
+		for (j = 0; j < nthreads && cpu_onlined < nr_cpu_ids; j++) {
 			bool avail;
 
 			DBG("    thread %d -> cpu %d (hard id %d)\n",
@@ -499,9 +513,10 @@ void __init smp_setup_cpu_maps(void)
 			set_cpu_possible(cpu, true);
 			cpu_to_phys_id[cpu] = be32_to_cpu(intserv[j]);
 			cpu++;
+			cpu_onlined++;
 		}
 
-		if (cpu >= nr_cpu_ids) {
+		if (cpu_onlined >= nr_cpu_ids) {
 			of_node_put(dn);
 			break;
 		}
@@ -547,7 +562,8 @@ void __init smp_setup_cpu_maps(void)
 			printk(KERN_INFO "Partition configured for %d cpus.\n",
 			       maxcpus);
 
-		for (cpu = 0; cpu < maxcpus; cpu++)
+		/* Bits below #cpu have been set */
+		for (; cpu < maxcpus; cpu++)
 			set_cpu_possible(cpu, true);
 	out:
 		of_node_put(dn);
-- 
2.31.1

