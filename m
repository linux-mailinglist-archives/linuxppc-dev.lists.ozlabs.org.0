Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04D480781
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 09:50:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNSss1jbQz307C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 19:50:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GoKuQy95;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=chao.gao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GoKuQy95; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMrCh6k1Hz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 19:18:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640593121; x=1672129121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WH0GwBORKgKcWk1etFfvqiimI30RAnrK7W2Gs9Zs1Ik=;
 b=GoKuQy95a729wq7iybVrlwP7v5/yvPL9Q1aDqpgSdSPPjvKiqHezpBdW
 u9gUmKU9wd2/8MRGoPyTBScnN2cZTwv3nDd/BrOL4EB3QIdcv9MTlTuMG
 5Rz3hYNvXEFs6svQAZHDkzMVpgkr6gFY47ERK1TK5uYporceeBViKq6D+
 s7RgeJbceDOnN/WWgiZB+ROhtkBBT/WPYmpiUEOQ973cdPT3UoNFfVtl+
 VsVzvNxDI3j5L8LDlD4UretIikPI81mZwqWpwG1JPsEoGdZpvB72LeN4h
 HwzMbdetKAezjNff9TcQ/GKHAgMmPrlJY+BBD9Gos2cm/u7cSXN8CLYKC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="265401185"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="265401185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 00:17:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="523208109"
Received: from unknown (HELO hyperv-sh4.sh.intel.com) ([10.239.48.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 00:17:24 -0800
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org, pbonzini@redhat.com, kevin.tian@intel.com,
 tglx@linutronix.de
Subject: [PATCH 3/6] KVM: Remove opaque from kvm_arch_check_processor_compat
Date: Mon, 27 Dec 2021 16:15:09 +0800
Message-Id: <20211227081515.2088920-4-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227081515.2088920-1-chao.gao@intel.com>
References: <20211227081515.2088920-1-chao.gao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Dec 2021 19:49:15 +1100
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Chao Gao <chao.gao@intel.com>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Fabiano Rosas <farosas@linux.ibm.com>, Sean Christopherson <seanjc@google.com>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, James Morse <james.morse@arm.com>,
 kvm-riscv@lists.infradead.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No arch implementation uses this opaque now.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 arch/arm64/kvm/arm.c       |  2 +-
 arch/mips/kvm/mips.c       |  2 +-
 arch/powerpc/kvm/powerpc.c |  2 +-
 arch/riscv/kvm/main.c      |  2 +-
 arch/s390/kvm/kvm-s390.c   |  2 +-
 arch/x86/kvm/x86.c         |  2 +-
 include/linux/kvm_host.h   |  2 +-
 virt/kvm/kvm_main.c        | 14 ++------------
 8 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 14106a7c75b5..c196f005a2d3 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -73,7 +73,7 @@ int kvm_arch_hardware_setup(void *opaque)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return 0;
 }
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index e59cb6246f76..c5dc4fe53bfc 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -140,7 +140,7 @@ int kvm_arch_hardware_setup(void *opaque)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return 0;
 }
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2ad0ccd202d5..30c817f3fa0c 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -423,7 +423,7 @@ int kvm_arch_hardware_setup(void *opaque)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return kvmppc_core_check_processor_compat();
 }
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 421ecf4e6360..3b0b104e443f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -20,7 +20,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return -EINVAL;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return 0;
 }
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 9c6d45d0d345..99c70d881cb6 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -252,7 +252,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return 0;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 770b68e72391..aa09c8792134 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11380,7 +11380,7 @@ void kvm_arch_hardware_unsetup(void)
 	static_call(kvm_x86_hardware_unsetup)();
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 05862176df6a..630ffd2289c6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1307,7 +1307,7 @@ int kvm_arch_hardware_enable(void);
 void kvm_arch_hardware_disable(void);
 int kvm_arch_hardware_setup(void *opaque);
 void kvm_arch_hardware_unsetup(void);
-int kvm_arch_check_processor_compat(void *opaque);
+int kvm_arch_check_processor_compat(void);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 168d0ab93c88..4e1e7770e984 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5600,22 +5600,14 @@ struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void)
         return &kvm_running_vcpu;
 }
 
-struct kvm_cpu_compat_check {
-	void *opaque;
-	int *ret;
-};
-
 static void check_processor_compat(void *data)
 {
-	struct kvm_cpu_compat_check *c = data;
-
-	*c->ret = kvm_arch_check_processor_compat(c->opaque);
+	*(int *)data = kvm_arch_check_processor_compat();
 }
 
 int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 		  struct module *module)
 {
-	struct kvm_cpu_compat_check c;
 	int r;
 	int cpu;
 
@@ -5643,10 +5635,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	if (r < 0)
 		goto out_free_1;
 
-	c.ret = &r;
-	c.opaque = opaque;
 	for_each_online_cpu(cpu) {
-		smp_call_function_single(cpu, check_processor_compat, &c, 1);
+		smp_call_function_single(cpu, check_processor_compat, &r, 1);
 		if (r < 0)
 			goto out_free_2;
 	}
-- 
2.25.1

