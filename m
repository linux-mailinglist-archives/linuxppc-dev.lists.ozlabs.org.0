Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90363FE135
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 19:36:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0B7342wYz2yb5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 03:36:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JemKAaaw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JemKAaaw; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0B4p4r1bz2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 03:34:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181HXW7C062709; Wed, 1 Sep 2021 13:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hcshb81ISNueAs8Ld5hG8I3lNM/fk1L01L9LiymvF5Q=;
 b=JemKAaawPsoylpJtnw46T7jhpvGD3MvozuSXGyk79q1FEkBGqJFYsp2QE3nKgaaYB0pX
 YbKb0aZzyJLgJ+x0JMM/t0IJBrxCjvyFV8V+yutWSkK/lFrrid59Uo6vYKQh45alr9S2
 3JNePZpBO1ugdeJaRha4wVVT+O5FjOMSQZoO6OxSTH4qcCjsaS+SEhJqqZTyqyxs9koU
 HyKIAU8ERWKYBNP0m45ip9mDyzW/VYKRJa6c3f6AWz4K1GRZS9qdrYCwyyrWRjDUOG2E
 +XHQ50e8lvFiA74yS/zikyGZq4iC2VN9AbefPX7AhZLo2RCuldalgO8XdrG7v44C1vSL LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ate1a80qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 13:34:13 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 181HY8uJ064668;
 Wed, 1 Sep 2021 13:34:12 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ate1a80qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 13:34:12 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181HWjDo016968;
 Wed, 1 Sep 2021 17:34:12 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3atdxc8407-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 17:34:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181HYB3b46924178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 17:34:11 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E56FC7805E;
 Wed,  1 Sep 2021 17:34:10 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68D787806A;
 Wed,  1 Sep 2021 17:34:09 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.58.54])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 17:34:09 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 4/5] KVM: PPC: Book3S: Unify kvm-hv and kvm-pr modules
Date: Wed,  1 Sep 2021 14:33:56 -0300
Message-Id: <20210901173357.3183658-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210901173357.3183658-1-farosas@linux.ibm.com>
References: <20210901173357.3183658-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _7exYuEJ8M8q0wXL7u6Cj1Kd14FfLpni
X-Proofpoint-ORIG-GUID: 3O1Ioi9lxO-WPl_h8l2JMt83nthZtEzD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109010100
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Our three virtualization modules (kvm, kvm-hv, kvm-pr) can be
loaded/unloaded in such a way that could leave kvm.ko loaded without
kvm-hv.ko or kvm-pr.ko. That means the userspace could continue to
issue ioctls to KVM while there is no code on our side to service
them.

We currently select at config time which module will be built, either
kvm-hv, kvm-pr or both, with the kvm module being always present. For
32 bits the kvm module is the only one present and contains the code
from kvm-pr in it. We can do the same for 64 bit and keep hv and pr
inside kvm.ko.

With this, we do not lose the ability of running two guests at the
same time, each using a different implementation (although only POWER
bare-metal with Hash MMU supports HV and PR at the same time).

We lose the ability of loading and unloading the code, which means any
Linux installation that wants to support *both* KVM-HV guests on POWER
bare-metal and KVM-PR nested guests on top of PowerVM would have a
binary with a larger memory footprint (assuming PR is only used when
HV is not present).

This patch alters the build to output only one module at all times and
relies on the Kconfig to select which implementation will be present.

The module init code was rearranged to initialize and cleanup both
implementations or only one of them.

The Kconfig was altered to provide one boolean for each implementation
(KVM_BOOK3S_PR_POSSIBLE, KVM_BOOK3S_HV_POSSIBLE), while keeping the
old tristate for the kvm.ko module (KVM_BOOK3S_64). The old
KVM_BOOK3S_32 already selects KVM_BOOK3S_PR_POSSIBLE, so nothing
changes there.

Two module aliases were created to facilitate the introduction of the
new scheme so `modprobe kvm-hv`and `modprobe kvm-pr` are the same as
`modprobe kvm`.

The license macro was removed because it is already included by
virt/kvm/kvm_main.c.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

---
Here's a summary of the environments that can run KVM:

* 64 bit powernv w/Radix              KVM-HV
* 64 bit powernv w/Hash               KVM-HV        KVM-PR
  32 bit powernv w/Hash                             KVM-PR
  32 bit powernv w/Radix              N/A
* 64 bit pseries w/Radix on powernv   KVM-HV nested
* 64 bit pseries w/Hash  on powernv                 KVM-PR nested
  32 bit pseries w/Hash  on powernv                 KVM-PR nested
* 64 bit pseries w/Radix on PowerVM   N/A
* 64 bit pseries w/Hash  on PowerVM                 KVM-PR nested

Lines with an asterisk were tested with all combinations for the
module and the HV/PR configs.
---
 arch/powerpc/configs/powernv_defconfig |  2 +-
 arch/powerpc/configs/ppc64_defconfig   |  2 +-
 arch/powerpc/configs/pseries_defconfig |  2 +-
 arch/powerpc/kvm/Kconfig               | 72 ++++++++++++--------------
 arch/powerpc/kvm/Makefile              | 11 ++--
 arch/powerpc/kvm/book3s.c              | 46 +++++++++++++---
 arch/powerpc/kvm/book3s.h              | 19 +++++++
 arch/powerpc/kvm/book3s_hv.c           | 10 +---
 arch/powerpc/kvm/book3s_pr.c           | 13 -----
 kernel/irq/irqdesc.c                   |  2 +-
 10 files changed, 105 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 8bfeea6c7de7..853b95685d9f 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -341,7 +341,7 @@ CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
-CONFIG_KVM_BOOK3S_64_HV=m
+CONFIG_KVM_BOOK3S_HV_POSSIBLE=y
 CONFIG_VHOST_NET=m
 CONFIG_PRINTK_TIME=y
 CONFIG_PRINTK_CALLER=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 0ad2291337a7..46ace457def6 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -61,7 +61,7 @@ CONFIG_PCCARD=y
 CONFIG_ELECTRA_CF=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
-CONFIG_KVM_BOOK3S_64_HV=m
+CONFIG_KVM_BOOK3S_HV_POSSIBLE=y
 CONFIG_VHOST_NET=m
 CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index b183629f1bcf..6804b1a6bef1 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -321,7 +321,7 @@ CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
-CONFIG_KVM_BOOK3S_64_HV=m
+CONFIG_KVM_BOOK3S_HV_POSSIBLE=y
 CONFIG_VHOST_NET=m
 CONFIG_PRINTK_TIME=y
 CONFIG_PRINTK_CALLER=y
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index e45644657d49..2d080f57ce3b 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -41,12 +41,43 @@ config KVM_BOOK3S_64_HANDLER
 	select PPC_DAWR_FORCE_ENABLE
 
 config KVM_BOOK3S_PR_POSSIBLE
-	bool
+	bool "KVM support without using hypervisor mode in host"
+	depends on KVM_BOOK3S_64 || KVM_BOOK3S_32
 	select KVM_MMIO
 	select MMU_NOTIFIER
+	help
+	  Support running guest kernels in virtual machines on processors
+	  without using hypervisor mode in the host, by running the
+	  guest in user mode (problem state) and emulating all
+	  privileged instructions and registers.
+
+	  This is not as fast as using hypervisor mode, but works on
+	  where hypervisor mode is not available or not usable,
+	  and can emulate processors that are different from the host
+	  processor, including emulating 32-bit processors on a 64-bit
+	  host.
+
 
 config KVM_BOOK3S_HV_POSSIBLE
-	bool
+	bool "KVM for POWER7 and later using hypervisor mode in host"
+	depends on KVM_BOOK3S_64
+	select MMU_NOTIFIER
+	select CMA
+	help
+	  Support running unmodified book3s_64 guest kernels in
+	  virtual machines on POWER7 and newer processors that have
+	  hypervisor mode available to the host.
+
+	  If you say Y here, KVM will use the hardware virtualization
+	  facilities of POWER7 (and later) processors, meaning that
+	  guest operating systems will run at full hardware speed
+	  using supervisor and user modes.  However, this also means
+	  that KVM is not usable under PowerVM (pHyp), is only usable
+	  on POWER7 or later processors, and cannot emulate a
+	  different processor from the host processor.
+
+	  If unsure, say N.
+
 
 config KVM_BOOK3S_32
 	tristate "KVM support for PowerPC book3s_32 processors"
@@ -80,43 +111,6 @@ config KVM_BOOK3S_64
 
 	  If unsure, say N.
 
-config KVM_BOOK3S_64_HV
-	tristate "KVM for POWER7 and later using hypervisor mode in host"
-	depends on KVM_BOOK3S_64 && PPC_POWERNV
-	select KVM_BOOK3S_HV_POSSIBLE
-	select MMU_NOTIFIER
-	select CMA
-	help
-	  Support running unmodified book3s_64 guest kernels in
-	  virtual machines on POWER7 and newer processors that have
-	  hypervisor mode available to the host.
-
-	  If you say Y here, KVM will use the hardware virtualization
-	  facilities of POWER7 (and later) processors, meaning that
-	  guest operating systems will run at full hardware speed
-	  using supervisor and user modes.  However, this also means
-	  that KVM is not usable under PowerVM (pHyp), is only usable
-	  on POWER7 or later processors, and cannot emulate a
-	  different processor from the host processor.
-
-	  If unsure, say N.
-
-config KVM_BOOK3S_64_PR
-	tristate "KVM support without using hypervisor mode in host"
-	depends on KVM_BOOK3S_64
-	select KVM_BOOK3S_PR_POSSIBLE
-	help
-	  Support running guest kernels in virtual machines on processors
-	  without using hypervisor mode in the host, by running the
-	  guest in user mode (problem state) and emulating all
-	  privileged instructions and registers.
-
-	  This is not as fast as using hypervisor mode, but works on
-	  machines where hypervisor mode is not available or not usable,
-	  and can emulate processors that are different from the host
-	  processor, including emulating 32-bit processors on a 64-bit
-	  host.
-
 config KVM_BOOK3S_HV_EXIT_TIMING
 	bool "Detailed timing for hypervisor real-mode code"
 	depends on KVM_BOOK3S_HV_POSSIBLE && DEBUG_FS
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 583c14ef596e..704380065df3 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -108,6 +108,14 @@ kvm-book3s_64-module-objs := \
 	book3s_rtas.o \
 	$(kvm-book3s_64-objs-y)
 
+ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+kvm-book3s_64-module-objs += $(kvm-hv-y)
+endif
+
+ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
+kvm-book3s_64-module-objs += $(kvm-pr-y)
+endif
+
 kvm-objs-$(CONFIG_KVM_BOOK3S_64) := $(kvm-book3s_64-module-objs)
 
 kvm-book3s_32-objs := \
@@ -134,7 +142,4 @@ obj-$(CONFIG_KVM_E500MC) += kvm.o
 obj-$(CONFIG_KVM_BOOK3S_64) += kvm.o
 obj-$(CONFIG_KVM_BOOK3S_32) += kvm.o
 
-obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
-obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o
-
 obj-y += $(kvm-book3s_64-builtin-objs-y)
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 79833f78d1da..c381bb17b0f9 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -1065,6 +1065,24 @@ int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
 
 #endif /* CONFIG_KVM_XICS */
 
+static int kvmppc_init(void)
+{
+	int r;
+
+	r = kvmppc_book3s_init_hv();
+	if (r)
+		pr_err("KVM-HV: could not load (%d)\n", r);
+
+	r = kvmppc_book3s_init_pr();
+	if (r)
+		pr_err("KVM-PR: could not load (%d)\n", r);
+
+	if (!kvmppc_hv_ops && !kvmppc_pr_ops)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int kvmppc_book3s_init(void)
 {
 	int r;
@@ -1072,9 +1090,10 @@ static int kvmppc_book3s_init(void)
 	r = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (r)
 		return r;
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	r = kvmppc_book3s_init_pr();
-#endif
+
+	r = kvmppc_init();
+	if (r)
+		goto exit;
 
 #ifdef CONFIG_KVM_XICS
 #ifdef CONFIG_KVM_XIVE
@@ -1087,22 +1106,35 @@ static int kvmppc_book3s_init(void)
 #endif
 		kvm_register_device_ops(&kvm_xics_ops, KVM_DEV_TYPE_XICS);
 #endif
+	return 0;
+
+exit:
+	kvm_exit();
 	return r;
 }
 
 static void kvmppc_book3s_exit(void)
 {
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
 	kvmppc_book3s_exit_pr();
-#endif
+	kvmppc_book3s_exit_hv();
 	kvm_exit();
 }
 
 module_init(kvmppc_book3s_init);
 module_exit(kvmppc_book3s_exit);
 
-/* On 32bit this is our one and only kernel module */
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
 MODULE_ALIAS_MISCDEV(KVM_MINOR);
 MODULE_ALIAS("devname:kvm");
+
+/*
+ * Whether we use KVM-HV or KVM-PR is dependent exclusively on the
+ * config options. These aliases are here only to ease the transition
+ * to the one module model we have now.
+ */
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+MODULE_ALIAS("kvm-hv");
+#endif
+
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
+MODULE_ALIAS("kvm-pr");
 #endif
diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
index 740e51def5a5..d21772904971 100644
--- a/arch/powerpc/kvm/book3s.h
+++ b/arch/powerpc/kvm/book3s.h
@@ -22,8 +22,27 @@ extern int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu,
 					int sprn, ulong spr_val);
 extern int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu,
 					int sprn, ulong *spr_val);
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 extern int kvmppc_book3s_init_pr(void);
 extern void kvmppc_book3s_exit_pr(void);
+#else
+static inline int kvmppc_book3s_init_pr(void)
+{
+	return 0;
+}
+static inline void kvmppc_book3s_exit_pr(void) {}
+#endif
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+extern int kvmppc_book3s_init_hv(void);
+extern void kvmppc_book3s_exit_hv(void);
+#else
+static inline int kvmppc_book3s_init_hv(void)
+{
+	return 0;
+}
+static inline void kvmppc_book3s_exit_hv(void) {}
+#endif
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 extern void kvmppc_emulate_tabort(struct kvm_vcpu *vcpu, int ra_val);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index a7b82eb438f5..6ba9545ef58e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5941,7 +5941,7 @@ static int kvmppc_radix_possible(void)
 	return cpu_has_feature(CPU_FTR_ARCH_300) && radix_enabled();
 }
 
-static int kvmppc_book3s_init_hv(void)
+int kvmppc_book3s_init_hv(void)
 {
 	int r;
 
@@ -6018,7 +6018,7 @@ static int kvmppc_book3s_init_hv(void)
 	return r;
 }
 
-static void kvmppc_book3s_exit_hv(void)
+void kvmppc_book3s_exit_hv(void)
 {
 	kvmppc_uvmem_free();
 	kvmppc_free_host_rm_ops();
@@ -6027,9 +6027,3 @@ static void kvmppc_book3s_exit_hv(void)
 	kvmppc_hv_ops = NULL;
 	kvmhv_nested_exit();
 }
-
-module_init(kvmppc_book3s_init_hv);
-module_exit(kvmppc_book3s_exit_hv);
-MODULE_LICENSE("GPL");
-MODULE_ALIAS_MISCDEV(KVM_MINOR);
-MODULE_ALIAS("devname:kvm");
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 6bc9425acb32..1d017c4b3eb4 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -2100,16 +2100,3 @@ void kvmppc_book3s_exit_pr(void)
 	kvmppc_pr_ops = NULL;
 	kvmppc_mmu_hpte_sysexit();
 }
-
-/*
- * We only support separate modules for book3s 64
- */
-#ifdef CONFIG_PPC_BOOK3S_64
-
-module_init(kvmppc_book3s_init_pr);
-module_exit(kvmppc_book3s_exit_pr);
-
-MODULE_LICENSE("GPL");
-MODULE_ALIAS_MISCDEV(KVM_MINOR);
-MODULE_ALIAS("devname:kvm");
-#endif
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 4e3c29bb603c..7c9c9e794c01 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -352,7 +352,7 @@ struct irq_desc *irq_to_desc(unsigned int irq)
 {
 	return radix_tree_lookup(&irq_desc_tree, irq);
 }
-#ifdef CONFIG_KVM_BOOK3S_64_HV_MODULE
+#ifdef CONFIG_KVM_BOOK3S_64_MODULE
 EXPORT_SYMBOL_GPL(irq_to_desc);
 #endif
 
-- 
2.29.2

