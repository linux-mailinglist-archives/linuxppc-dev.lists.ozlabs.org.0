Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE27E152C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Nov 2023 17:39:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uc0ePfO9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OGH5lxN1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNgDY27Qhz3vcd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 03:39:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uc0ePfO9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OGH5lxN1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNg45560wz3cVh
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 03:32:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+N8+ZLcZ0lDwWeVmtvKVLilyi3mj99in/d4mWjjlXWo=;
	b=Uc0ePfO9LrtSRrcfHXbPKBbNT2Uc+9JBi996MhpdNbv9exGs3+QpODsFe2t1ZBnmvE6ntG
	xa2zsovBBCunctcUImDhkelLZd45ONw759PlBluwQW8J7qS6dG4Suwpvo4YN26mxFdfPou
	yYcWZ2021kdu9GYLXvZOpgkYx38Gx6E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+N8+ZLcZ0lDwWeVmtvKVLilyi3mj99in/d4mWjjlXWo=;
	b=OGH5lxN1V5evhhfwtFyFlIVV1RDgbB3JLXY8vWu32sxbZyK6p2FC88Q5YkNOGvTr7odMJO
	FioH0lT6AvqR4pkFMZ8UfbxMt8AnCwKmbSUMEgN32zIPwKs6doo7ZhqysbfWW5FbncwDTw
	K2Iid48qzfc30VrTONPpo7GdsR82EUo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-jVubrZIvMoCLbcgKoUWGmQ-1; Sun, 05 Nov 2023 11:32:00 -0500
X-MC-Unique: jVubrZIvMoCLbcgKoUWGmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47D75811E7E;
	Sun,  5 Nov 2023 16:31:58 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8CA02166B26;
	Sun,  5 Nov 2023 16:31:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/34] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report faults to userspace
Date: Sun,  5 Nov 2023 17:30:12 +0100
Message-ID: <20231105163040.14904-10-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve 
 <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chao Peng <chao.p.peng@linux.intel.com>

Add a new KVM exit type to allow userspace to handle memory faults that
KVM cannot resolve, but that userspace *may* be able to handle (without
terminating the guest).

KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
conversions between private and shared memory.  With guest private memory,
there will be two kind of memory conversions:

  - explicit conversion: happens when the guest explicitly calls into KVM
    to map a range (as private or shared)

  - implicit conversion: happens when the guest attempts to access a gfn
    that is configured in the "wrong" state (private vs. shared)

On x86 (first architecture to support guest private memory), explicit
conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,
but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
as there is (obviously) no hypercall, and there is no guarantee that the
guest actually intends to convert between private and shared, i.e. what
KVM thinks is an implicit conversion "request" could actually be the
result of a guest code bug.

KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
be implicit conversions.

Note!  To allow for future possibilities where KVM reports
KVM_EXIT_MEMORY_FAULT and fills run->memory_fault on _any_ unresolved
fault, KVM returns "-EFAULT" (-1 with errno == EFAULT from userspace's
perspective), not '0'!  Due to historical baggage within KVM, exiting to
userspace with '0' from deep callstacks, e.g. in emulation paths, is
infeasible as doing so would require a near-complete overhaul of KVM,
whereas KVM already propagates -errno return codes to userspace even when
the -errno originated in a low level helper.

Report the gpa+size instead of a single gfn even though the initial usage
is expected to always report single pages.  It's entirely possible, likely
even, that KVM will someday support sub-page granularity faults, e.g.
Intel's sub-page protection feature allows for additional protections at
128-byte granularity.

Link: https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy@google.com
Link: https://lore.kernel.org/all/ZQ3AmLO2SYv3DszH@google.com
Cc: Anish Moorthy <amoorthy@google.com>
Cc: David Matlack <dmatlack@google.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20231027182217.3615211-10-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst | 41 ++++++++++++++++++++++++++++++++++
 arch/x86/kvm/x86.c             |  1 +
 include/linux/kvm_host.h       | 11 +++++++++
 include/uapi/linux/kvm.h       |  8 +++++++
 4 files changed, 61 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index bdea1423c5f8..481fb0e2ce90 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6846,6 +6846,26 @@ array field represents return values. The userspace should update the return
 values of SBI call before resuming the VCPU. For more details on RISC-V SBI
 spec refer, https://github.com/riscv/riscv-sbi-doc.
 
+::
+
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory_fault;
+
+KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault that
+could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
+guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
+describes properties of the faulting access that are likely pertinent.
+Currently, no flags are defined.
+
+Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
+accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
+or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
+kvm_run.exit_reason is stale/undefined for all other error numbers.
+
 ::
 
     /* KVM_EXIT_NOTIFY */
@@ -7880,6 +7900,27 @@ This capability is aimed to mitigate the threat that malicious VMs can
 cause CPU stuck (due to event windows don't open up) and make the CPU
 unavailable to host or other VMs.
 
+7.34 KVM_CAP_MEMORY_FAULT_INFO
+------------------------------
+
+:Architectures: x86
+:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
+
+The presence of this capability indicates that KVM_RUN will fill
+kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
+there is a valid memslot but no backing VMA for the corresponding host virtual
+address.
+
+The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
+an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
+to KVM_EXIT_MEMORY_FAULT.
+
+Note: Userspaces which attempt to resolve memory faults so that they can retry
+KVM_RUN are encouraged to guard against repeatedly receiving the same
+error/annotated fault.
+
+See KVM_EXIT_MEMORY_FAULT for more information.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7b389f27dffc..8f9d8939b63b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4625,6 +4625,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ENABLE_CAP:
 	case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
 	case KVM_CAP_IRQFD_RESAMPLE:
+	case KVM_CAP_MEMORY_FAULT_INFO:
 		r = 1;
 		break;
 	case KVM_CAP_EXIT_HYPERCALL:
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4e741ff27af3..96aa930536b1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
+						 gpa_t gpa, gpa_t size)
+{
+	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
+	vcpu->run->memory_fault.gpa = gpa;
+	vcpu->run->memory_fault.size = size;
+
+	/* Flags are not (yet) defined or communicated to userspace. */
+	vcpu->run->memory_fault.flags = 0;
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 308cc70bd6ab..59010a685007 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -275,6 +275,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_RISCV_CSR        36
 #define KVM_EXIT_NOTIFY           37
 #define KVM_EXIT_LOONGARCH_IOCSR  38
+#define KVM_EXIT_MEMORY_FAULT     39
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -528,6 +529,12 @@ struct kvm_run {
 #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
 			__u32 flags;
 		} notify;
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory_fault;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -1212,6 +1219,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
 #define KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES 230
 #define KVM_CAP_USER_MEMORY2 231
+#define KVM_CAP_MEMORY_FAULT_INFO 232
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.39.1


