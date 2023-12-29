Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D3081FF4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 13:05:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RBcqTdx6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1kbJ6zx8z3dWX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 23:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RBcqTdx6;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1kVw2tj4z3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Dec 2023 23:01:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703851288;
	bh=ucbf3Yt8fSf+aebqeVNOdIUh4t/0C9yTJjBbTToTDrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBcqTdx6eTGnjtgwExj+KuDwEphocu+By0tydlltBduxRXVcM14Hx8hE6g/GC+xrl
	 ogCg3So69ts+i3AXw5nocUKCg9I+M3jyBVITVK10BMMD0Abz14Xi478FBpeXjGBo1m
	 hyeCEOG/XnTUjqKt5QbRdLhHCl7QZifuYqAd0fWD7mxKGQ0aUJw2cv336+2q1Wud5n
	 XgFwhnj1BB7XrTFPt7Zqqqz8KB0sve7fCP1AvMJueUxXW/WPYBZWjPQFVgZwaRqFvo
	 Uo9vrPUhgJj8KocaNZx2ebD8gvrYHy9U8zWNajWG/z8dHoMw25QGQ9ZG8FGGj1nEJb
	 ShruIkRFplv4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T1kVw2C9xz4xVD;
	Fri, 29 Dec 2023 23:01:28 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 5/5] powerpc/smp: Remap boot CPU onto core 0 if >= nr_cpu_ids
Date: Fri, 29 Dec 2023 23:01:07 +1100
Message-ID: <20231229120107.2281153-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229120107.2281153-1-mpe@ellerman.id.au>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <piliu@redhat.com>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If nr_cpu_ids is too low to include the boot CPU, remap the boot CPU
onto logical core 0.

This is achieved in two stages. In early_init_dt_scan_cpus() the boot
CPU is renumbered to be on logical core 0, and the original boot core's
hardware ID is recorded.

Later in smp_setup_cpu_maps(), if the original boot core ID is set, the
logical CPU numbers on the 0th core are skipped in the normal device
tree search over CPU device tree nodes. Then the search is continued
until the device tree node matching the boot core is found, and those
CPUs are assigned the CPU numbers starting at 0.

This allows kdump kernels to be booted with low values for nr_cpu_ids
to conserve memory, while also allowing the crashing/boot CPU to be
any CPU.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/smp.h     |  1 +
 arch/powerpc/kernel/prom.c         | 16 +++++++++++-----
 arch/powerpc/kernel/setup-common.c | 19 +++++++++++++++++--
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index aaaa576d0e15..b77927ccb0ab 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -27,6 +27,7 @@
 
 extern int boot_cpuid;
 extern int boot_cpu_hwid; /* PPC64 only */
+extern int boot_core_hwid;
 extern int spinning_secondaries;
 extern u32 *cpu_to_phys_id;
 extern bool coregroup_enabled;
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 77364729a1b6..af2b70585b2e 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -368,8 +368,6 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	if (found < 0)
 		return 0;
 
-	DBG("boot cpu: logical %d physical %d\n", found,
-	    be32_to_cpu(intserv[found_thread]));
 	boot_cpuid = found;
 
 	if (IS_ENABLED(CONFIG_PPC64))
@@ -382,11 +380,19 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	}
 
 	if (boot_cpuid >= nr_cpu_ids) {
-		set_nr_cpu_ids(min(CONFIG_NR_CPUS, ALIGN(boot_cpuid + 1, nthreads)));
-		pr_warn("Boot CPU %d >= nr_cpu_ids, adjusted nr_cpu_ids to %d\n",
-			boot_cpuid, nr_cpu_ids);
+		// Remember boot core for smp_setup_cpu_maps()
+		boot_core_hwid = be32_to_cpu(intserv[0]);
+		
+		pr_warn("Boot CPU %d (core hwid %d) >= nr_cpu_ids, adjusted boot CPU to %d\n",
+			boot_cpuid, boot_core_hwid, found_thread);
+
+		// Adjust boot CPU to appear on logical core 0
+		boot_cpuid = found_thread;
 	}
 
+	DBG("boot cpu: logical %d physical %d\n", boot_cpuid,
+	    be32_to_cpu(intserv[found_thread]));
+
 	/*
 	 * PAPR defines "logical" PVR values for cpus that
 	 * meet various levels of the architecture:
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index d9f8ed9bd2fc..5844f3d113a5 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -85,6 +85,7 @@ EXPORT_SYMBOL(machine_id);
 
 int boot_cpuid = -1;
 EXPORT_SYMBOL_GPL(boot_cpuid);
+int __initdata boot_core_hwid = -1;
 
 #ifdef CONFIG_PPC64
 int boot_cpu_hwid = -1;
@@ -492,12 +493,26 @@ void __init smp_setup_cpu_maps(void)
 			avail = !of_property_match_string(dn,
 					"enable-method", "spin-table");
 
-		cpu = assign_threads(cpu, nthreads, avail, intserv);
+		if (boot_core_hwid >= 0) {
+			if (cpu == 0) {
+				pr_info("Skipping CPU node %pOF to allow for boot core.\n", dn);
+				cpu = nthreads;
+				continue;
+			}
 
-		if (cpu >= nr_cpu_ids) {
+			if (be32_to_cpu(intserv[0]) == boot_core_hwid) {
+				pr_info("Renumbered boot core %pOF to logical 0\n", dn);
+				assign_threads(0, nthreads, avail, intserv);
+				of_node_put(dn);
+				break;
+			}
+		} else if (cpu >= nr_cpu_ids) {
 			of_node_put(dn);
 			break;
 		}
+
+		if (cpu < nr_cpu_ids)
+			cpu = assign_threads(cpu, nthreads, avail, intserv);
 	}
 
 	/* If no SMT supported, nthreads is forced to 1 */
-- 
2.43.0

