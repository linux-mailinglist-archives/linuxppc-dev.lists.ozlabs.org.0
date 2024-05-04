Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3A98BBB9F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:51:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JVFmvbsd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnby56fqz3dVp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JVFmvbsd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn8C2rwMz3bs2
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:51 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f4178aec15so461336b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825850; x=1715430650; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6KvNFDDT9boTvfk0g7Fu/0RZ+dy+RbVwyckvEdOV/A=;
        b=JVFmvbsdf1sfCUCsF8ySl7SNee1KFXDlFijyOkPvc2hd9bG+nKopbIQ0erYQz/NjfS
         VTKEcNMXNHxEi8PjbaotowcSgK7MuGdio03P22eeuNUvDJW/zYhP/h+pwR1TeMjGow3M
         v+2Ro/zdVSt4q/2Hm8rW/4YN//YSdKB0npREFwbKZ1i0zk0FDoL56Ap01q1Nba7y1aPr
         0RbNNJne8akW8C5GD7hJmiwlMYGWPX44mJmYGP4FIfHiqKeMH93NAFm9jmAeF4fltkE5
         cYkF3EeEyJAHw/axl0MF3kfE2GobmlyfhEmbzF5xXOZ2g3UQlv9rY8IofJu6SXRKnjHR
         lJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825850; x=1715430650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6KvNFDDT9boTvfk0g7Fu/0RZ+dy+RbVwyckvEdOV/A=;
        b=VSLpTO83/uRZBHM8LNPITIFwNeD6SPAlKYz8MwWouQVWjRy+YdvYgWRACpoRAis9kE
         nOws8Rd3D7vrocaadkZnUThUQKRPaCvrYw+oujzT1ewYHIs6M8AMgA/LxHBc6LVouwCA
         C8/bqFEyIzYuXDPVlpkHEgnk31QM5M3dchDc9Jff6ik46w0hfPq4nindnTGIARn8ZhSu
         rQwm426SgfdVuDoZo8YCKraPgIDSHyCrTqEsyNg9gZXZholX/P7wn63eIT8/N3JlAWB3
         Gdf+L6CP4lP614ct2p+jx0c0+Z6P/bK3iHqlGYz/4h3qY9huC9ueuGsPKWuluBWzkMPv
         6NIg==
X-Forwarded-Encrypted: i=1; AJvYcCXOZ/yxES8AyFeQJE61T0oAIJrr1QiKroy6EJsBgBIqXDvtH1gI6wlCg2RcjU4Fp8TPQjUgQBLohTIwZ13CG/HGTDou2uKM8WzC+G1l7g==
X-Gm-Message-State: AOJu0YwCrqnBZpvzOQmMwhrhc7x0fvglRkf6OqZNbOsX41zpvmBK9A3V
	RymDR1zhLtJDOqP7/69HttrjLIYgL10cQtzRGOgPeF1fMcRNOkm7
X-Google-Smtp-Source: AGHT+IGiUp63wEQAX/25zlW8DnNsOdcroeS4VtV/DdyFyGXhh8WS73VQ1qY6UjK6KxrSgimj86sx7A==
X-Received: by 2002:a05:6a20:320d:b0:1af:66e6:b1b2 with SMTP id hl13-20020a056a20320d00b001af66e6b1b2mr4860642pzc.1.1714825849815;
        Sat, 04 May 2024 05:30:49 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 30/31] powerpc: Add facility to query TCG or KVM host
Date: Sat,  4 May 2024 22:28:36 +1000
Message-ID: <20240504122841.1177683-31-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use device tree properties to determine whether KVM or TCG is in
use.

Logically these are not the inverse of one another, because KVM can be
used on top of a TCG processor (if TCG is emulating HV mode, or if it
provides a nested hypervisor interface with spapr). This can be a
problem because some issues relate to TCG CPU emulation, and some to
the spapr hypervisor implementation. At the moment there is no way to
determine TCG is running a KVM host that is running the tests, but the
two independent variables are added in case that is able to be
determined in future. For now that case is just incorrectly considered
to be kvm && !tcg.

Use this facility to restrict some of the known test failures to TCG.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |  3 +++
 lib/powerpc/setup.c         | 25 +++++++++++++++++++++++++
 powerpc/atomics.c           |  2 +-
 powerpc/interrupts.c        |  6 ++++--
 powerpc/mmu.c               |  2 +-
 powerpc/pmu.c               |  6 +++---
 powerpc/sprs.c              |  2 +-
 powerpc/timebase.c          |  4 ++--
 powerpc/tm.c                |  2 +-
 9 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 28239c610..09535f8c3 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -10,6 +10,9 @@ void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
 void do_handle_exception(struct pt_regs *regs);
 #endif /* __ASSEMBLY__ */
 
+extern bool host_is_tcg;
+extern bool host_is_kvm;
+
 extern bool cpu_has_hv;
 extern bool cpu_has_power_mce;
 extern bool cpu_has_siar;
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 8ff4939e2..2b9d67466 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -235,6 +235,8 @@ void cpu_init(struct cpu *cpu, int cpu_id)
 	cpu->in_user = false;
 }
 
+bool host_is_tcg;
+bool host_is_kvm;
 bool is_hvmode;
 
 void setup(const void *fdt)
@@ -290,6 +292,29 @@ void setup(const void *fdt)
 	assert(ret == 0);
 	freemem += fdt_size;
 
+	if (!fdt_node_check_compatible(fdt, 0, "qemu,pseries")) {
+		assert(!cpu_has_hv);
+
+		/*
+		 * host_is_tcg incorrectly does not get set when running
+		 * KVM on a TCG host (using powernv HV emulation or spapr
+		 * nested HV).
+		 */
+		ret = fdt_subnode_offset(fdt, 0, "hypervisor");
+		if (ret < 0) {
+			host_is_tcg = true;
+			host_is_kvm = false;
+		} else {
+			/* KVM is the only supported hypervisor */
+			assert(!fdt_node_check_compatible(fdt, ret, "linux,kvm"));
+			host_is_tcg = false;
+			host_is_kvm = true;
+		}
+	} else {
+		assert(cpu_has_hv);
+		host_is_tcg = true;
+		host_is_kvm = false;
+	}
 	ret = dt_get_initrd(&tmp, &initrd_size);
 	assert(ret == 0 || ret == -FDT_ERR_NOTFOUND);
 	if (ret == 0) {
diff --git a/powerpc/atomics.c b/powerpc/atomics.c
index 975711fc8..7d6dfaed9 100644
--- a/powerpc/atomics.c
+++ b/powerpc/atomics.c
@@ -119,7 +119,7 @@ static void test_lwarx_stwcx(int argc, char *argv[])
 		      "stwcx.	%1,0,%3;"
 		      : "=&r"(old) : "r"(1), "r"(var), "r"((char *)var+1) : "cr0", "memory");
 	/* unaligned larx/stcx. is not required by the ISA to cause an exception, in TCG the stcx does not. */
-	report_kfail(true, old == 0 && *var == 0 && got_interrupt && recorded_regs.trap == 0x600, "unaligned stwcx. causes fault");
+	report_kfail(host_is_tcg, old == 0 && *var == 0 && got_interrupt && recorded_regs.trap == 0x600, "unaligned stwcx. causes fault");
 	got_interrupt = false;
 
 	handle_exception(0x600, NULL, NULL);
diff --git a/powerpc/interrupts.c b/powerpc/interrupts.c
index ba965ff76..6511c76f2 100644
--- a/powerpc/interrupts.c
+++ b/powerpc/interrupts.c
@@ -78,7 +78,8 @@ static void test_mce(void)
 
 	is_fetch = false;
 	asm volatile("lbz %0,0(%1)" : "=r"(tmp) : "r"(addr));
-	report(got_interrupt, "MCE on access to invalid real address");
+	/* KVM does not MCE on access outside partition scope */
+	report_kfail(host_is_kvm, got_interrupt, "MCE on access to invalid real address");
 	if (got_interrupt) {
 		report(mfspr(SPR_DAR) == addr, "MCE sets DAR correctly");
 		if (cpu_has_power_mce)
@@ -88,7 +89,8 @@ static void test_mce(void)
 
 	is_fetch = true;
 	asm volatile("mtctr %0 ; bctrl" :: "r"(addr) : "ctr", "lr");
-	report(got_interrupt, "MCE on fetch from invalid real address");
+	/* KVM does not MCE on access outside partition scope */
+	report_kfail(host_is_kvm, got_interrupt, "MCE on fetch from invalid real address");
 	if (got_interrupt) {
 		report(recorded_regs.nip == addr, "MCE sets SRR0 correctly");
 		if (cpu_has_power_mce)
diff --git a/powerpc/mmu.c b/powerpc/mmu.c
index fef790506..27220b71f 100644
--- a/powerpc/mmu.c
+++ b/powerpc/mmu.c
@@ -172,7 +172,7 @@ static void test_tlbie(int argc, char **argv)
 	handle_exception(0x700, NULL, NULL);
 
 	/* TCG has a known race invalidating other CPUs */
-	report_kfail(true, !tlbie_test_failed, "tlbie");
+	report_kfail(host_is_tcg, !tlbie_test_failed, "tlbie");
 }
 
 #define THIS_ITERS 100000
diff --git a/powerpc/pmu.c b/powerpc/pmu.c
index 8b13ee4cd..960f90787 100644
--- a/powerpc/pmu.c
+++ b/powerpc/pmu.c
@@ -107,7 +107,7 @@ static void test_pmc5_with_sc(void)
 	pmc5_2 = mfspr(SPR_PMC5);
 
 	/* TCG does not count instructions around syscalls correctly */
-	report_kfail(true, pmc5_1 + 20 == pmc5_2, "PMC5 counts instructions with syscall");
+	report_kfail(host_is_tcg, pmc5_1 + 20 == pmc5_2, "PMC5 counts instructions with syscall");
 
 	handle_exception(0xc00, NULL, NULL);
 }
@@ -336,7 +336,7 @@ static void test_bhrb(void)
 				break;
 		}
 		report(nr_bhrbe, "BHRB has been written");
-		report_kfail(true, nr_bhrbe == 8, "BHRB has written 8 entries");
+		report_kfail(!host_is_tcg, nr_bhrbe == 8, "BHRB has written 8 entries");
 		if (nr_bhrbe == 8) {
 			report(bhrbe[4] == (unsigned long)dummy_branch_1,
 					"correct unconditional branch address");
@@ -369,7 +369,7 @@ static void test_bhrb(void)
 				break;
 		}
 		report(nr_bhrbe, "BHRB has been written");
-		report_kfail(true, nr_bhrbe == 6, "BHRB has written 6 entries");
+		report_kfail(!host_is_tcg, nr_bhrbe == 6, "BHRB has written 6 entries");
 		if (nr_bhrbe == 6) {
 			report(bhrbe[4] == (unsigned long)dummy_branch_1,
 					"correct unconditional branch address");
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index c5844985a..c496efe9e 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -590,7 +590,7 @@ int main(int argc, char **argv)
 
 		if (sprs[i].width == 32 && !(before[i] >> 32) && !(after[i] >> 32)) {
 			/* known failure KVM migration of CTRL */
-			report_kfail(true && i == 136,
+			report_kfail(host_is_kvm && i == 136,
 				"%-10s(%4d):\t        0x%08lx <==>         0x%08lx",
 				sprs[i].name, i,
 				before[i], after[i]);
diff --git a/powerpc/timebase.c b/powerpc/timebase.c
index 02a4e33c0..b1378dd2b 100644
--- a/powerpc/timebase.c
+++ b/powerpc/timebase.c
@@ -94,7 +94,7 @@ static void test_dec(int argc, char **argv)
 			break;
 	}
 	/* POWER CPUs can have a slight (few ticks) variation here */
-	report_kfail(true, tb2 - tb1 >= dec_max - dec, "decrementer remains within TB after mtDEC");
+	report_kfail(!host_is_tcg, tb2 - tb1 >= dec_max - dec, "decrementer remains within TB after mtDEC");
 
 	tb1 = get_tb();
 	mtspr(SPR_DEC, dec_max);
@@ -159,7 +159,7 @@ static void test_dec(int argc, char **argv)
 	local_irq_enable();
 	local_irq_disable();
 	/* TCG does not model this correctly */
-	report_kfail(true, !got_interrupt, "no interrupt after wrap to positive");
+	report_kfail(host_is_tcg, !got_interrupt, "no interrupt after wrap to positive");
 	got_interrupt = false;
 
 	handle_exception(0x900, NULL, NULL);
diff --git a/powerpc/tm.c b/powerpc/tm.c
index 507eaf492..d4f436147 100644
--- a/powerpc/tm.c
+++ b/powerpc/tm.c
@@ -135,7 +135,7 @@ int main(int argc, char **argv)
 	}
 	/* kvm-unit-tests can limit number of CPUs present */
 	/* KVM does not report TM in secondary threads in POWER9 */
-	report_kfail(true, cpus_with_tm >= nr_cpus_present,
+	report_kfail(host_is_kvm, cpus_with_tm >= nr_cpus_present,
 	       "TM available in all 'ibm,pa-features' properties");
 
 	all = argc == 1 || !strcmp(argv[1], "all");
-- 
2.43.0

