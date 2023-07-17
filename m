Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0A755C82
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 09:13:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ds2tdABe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4Cwd4MPSz2yTN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 17:13:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ds2tdABe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Cvj08nDz2yDl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:12:32 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H6sT6w010857;
	Mon, 17 Jul 2023 07:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xIoAJr4SkNO8xTPlQ7E9hIvgg9Sga1ZOL4bjwajeVq0=;
 b=Ds2tdABeP3NOJKGPB27//VbELhW1cy8h8gMMo0hNnHMYLVbdruK0lRNaBxSWm97vZOI8
 cmZhKXVos7PaCrE3HninO7pilWtSvzWCmmMHEA9qbc9omZxN1+I2FvoX0cMGVZjKIKAs
 8gpMK3eOPInZYeXUjbDRK5NsPCWPH7JceOWQetELG8tXS9NE2l/1XoKhpAqyU1ruMni/
 od0S2hqd0Js5w5TnwR/MMYsB18ye4N7va1efXMyQpRm5FOvQ7WHHUoSpPKitPAKAa2DJ
 uKC/5KwQ6EaZARx+NKf6SWf6t58D5byZfBtv8lxyv1uPbuzdGg7aqBiQW0dOwbbfnV9d SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw0srghkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 07:12:22 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36H6vW4r021006;
	Mon, 17 Jul 2023 07:12:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw0srghk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 07:12:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36H3P02k032078;
	Mon, 17 Jul 2023 07:12:19 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rujqe11am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 07:12:19 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36H7CHIK34668928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jul 2023 07:12:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D6A220043;
	Mon, 17 Jul 2023 07:12:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9119E20040;
	Mon, 17 Jul 2023 07:12:15 +0000 (GMT)
Received: from r223l.aus.stglabs.ibm.com (unknown [9.3.109.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jul 2023 07:12:15 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] KVM: ppc64: Enable ring-based dirty memory tracking on ppc64: enable config options and implement relevant functions
Date: Mon, 17 Jul 2023 03:12:07 -0400
Message-Id: <20230717071208.1134783-1-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AzQjCLLcXBZh0VQrljWt2BaitHY0trxM
X-Proofpoint-ORIG-GUID: VhGPi0M_zGhsbBjhianDcdoFM_YuI0ls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_05,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1011 mlxlogscore=964 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170063
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
Cc: Kautuk Consul <kconsul@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

- Enable CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL as ppc64 is weakly
  ordered.
- Enable CONFIG_NEED_KVM_DIRTY_RING_WITH_BITMAP because the
  kvmppc_xive_native_set_attr is called in the context of an ioctl
  syscall and will call kvmppc_xive_native_eq_sync for setting the
  KVM_DEV_XIVE_EQ_SYNC attribute which will call mark_dirty_page()
  when there isn't a running vcpu. Implemented the
  kvm_arch_allow_write_without_running_vcpu to always return true
  to allow mark_page_dirty_in_slot to mark the page dirty in the
  memslot->dirty_bitmap in this case.
- Set KVM_DIRTY_LOG_PAGE_OFFSET for the ring buffer's physical page
  offset.
- Implement the kvm_arch_mmu_enable_log_dirty_pt_masked function required
  for the generic KVM code to call.
- Add a check to kvmppc_vcpu_run_hv for checking whether the dirty
  ring is soft full.
- Implement the kvm_arch_flush_remote_tlbs_memslot function to support
  the CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT config option.

Test Results
============
On testing with live migration it was found that there is around
150-180 ms improvment in overall migration time with this patch.

Bare Metal P9 testing with patch:
--------------------------------
(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Migration status: completed
total time: 20694 ms
downtime: 73 ms
setup: 23 ms
transferred ram: 2604370 kbytes
throughput: 1033.55 mbps
remaining ram: 0 kbytes
total ram: 16777216 kbytes
duplicate: 3555398 pages
skipped: 0 pages
normal: 642026 pages
normal bytes: 2568104 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 32455
precopy ram: 2581549 kbytes
downtime ram: 22820 kbytes

Bare Metal P9 testing without patch:
-----------------------------------
(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Migration status: completed
total time: 20873 ms
downtime: 62 ms
setup: 19 ms
transferred ram: 2612900 kbytes
throughput: 1027.83 mbps
remaining ram: 0 kbytes
total ram: 16777216 kbytes
duplicate: 3553329 pages
skipped: 0 pages
normal: 644159 pages
normal bytes: 2576636 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 88297
precopy ram: 2603645 kbytes
downtime ram: 9254 kbytes

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
---
 Documentation/virt/kvm/api.rst      |  2 +-
 arch/powerpc/include/uapi/asm/kvm.h |  2 ++
 arch/powerpc/kvm/Kconfig            |  2 ++
 arch/powerpc/kvm/book3s.c           | 46 +++++++++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv.c        |  3 ++
 include/linux/kvm_dirty_ring.h      |  5 ++++
 virt/kvm/dirty_ring.c               |  1 +
 7 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c0ddd3035462..84c180ccd178 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8114,7 +8114,7 @@ regardless of what has actually been exposed through the CPUID leaf.
 8.29 KVM_CAP_DIRTY_LOG_RING/KVM_CAP_DIRTY_LOG_RING_ACQ_REL
 ----------------------------------------------------------
 
-:Architectures: x86, arm64
+:Architectures: x86, arm64, ppc64
 :Parameters: args[0] - size of the dirty log ring
 
 KVM is capable of tracking dirty memory using ring buffers that are
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
index 9f18fa090f1f..f722309ed7fb 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -33,6 +33,8 @@
 /* Not always available, but if it is, this is the correct offset.  */
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 
+#define KVM_DIRTY_LOG_PAGE_OFFSET 64
+
 struct kvm_regs {
 	__u64 pc;
 	__u64 cr;
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 902611954200..c93354ec3bd5 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -26,6 +26,8 @@ config KVM
 	select IRQ_BYPASS_MANAGER
 	select HAVE_KVM_IRQ_BYPASS
 	select INTERVAL_TREE
+	select HAVE_KVM_DIRTY_RING_ACQ_REL
+	select NEED_KVM_DIRTY_RING_WITH_BITMAP
 
 config KVM_BOOK3S_HANDLER
 	bool
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 686d8d9eda3e..01aa4fe2c424 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -32,6 +32,7 @@
 #include <asm/mmu_context.h>
 #include <asm/page.h>
 #include <asm/xive.h>
+#include <asm/book3s/64/radix.h>
 
 #include "book3s.h"
 #include "trace.h"
@@ -1070,6 +1071,51 @@ int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
 
 #endif /* CONFIG_KVM_XICS */
 
+/*
+ * kvm_arch_mmu_enable_log_dirty_pt_masked - enable dirty logging for selected
+ * dirty pages.
+ *
+ * It write protects selected pages to enable dirty logging for them.
+ */
+void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
+					     struct kvm_memory_slot *slot,
+					     gfn_t gfn_offset,
+					     unsigned long mask)
+{
+	phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
+	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
+	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
+
+	while (start < end) {
+		pte_t *ptep;
+		unsigned int shift;
+
+		ptep = find_kvm_secondary_pte(kvm, start, &shift);
+
+		if (radix_enabled())
+			__radix_pte_update(ptep, _PAGE_WRITE, 0);
+		else
+			*ptep = __pte(pte_val(*ptep) & ~(_PAGE_WRITE));
+
+		start += PAGE_SIZE;
+	}
+}
+
+#ifdef CONFIG_NEED_KVM_DIRTY_RING_WITH_BITMAP
+bool kvm_arch_allow_write_without_running_vcpu(struct kvm *kvm)
+{
+	return true;
+}
+#endif
+
+#ifdef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
+void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
+					const struct kvm_memory_slot *memslot)
+{
+	kvm_flush_remote_tlbs(kvm);
+}
+#endif
+
 static int kvmppc_book3s_init(void)
 {
 	int r;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 130bafdb1430..1d1264ea72c4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4804,6 +4804,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		return -EINTR;
 	}
 
+	if (kvm_dirty_ring_check_request(vcpu))
+		return 0;
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/*
 	 * Don't allow entry with a suspended transaction, because
diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
index 4862c98d80d3..a00301059da5 100644
--- a/include/linux/kvm_dirty_ring.h
+++ b/include/linux/kvm_dirty_ring.h
@@ -69,6 +69,11 @@ static inline void kvm_dirty_ring_free(struct kvm_dirty_ring *ring)
 {
 }
 
+static inline bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
 #else /* CONFIG_HAVE_KVM_DIRTY_RING */
 
 int kvm_cpu_dirty_log_size(void);
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index c1cd7dfe4a90..982ee7e1072f 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -209,6 +209,7 @@ bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu)
 
 	return false;
 }
+EXPORT_SYMBOL_GPL(kvm_dirty_ring_check_request);
 
 struct page *kvm_dirty_ring_get_page(struct kvm_dirty_ring *ring, u32 offset)
 {
-- 
2.39.2

