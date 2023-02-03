Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5FA689429
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 10:45:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7W3v20zsz3fFP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 20:45:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S31u2gOw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S31u2gOw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S31u2gOw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S31u2gOw;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7W0z0jfCz3f40
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 20:42:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675417376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKX+TQVSfx0uTwzs+LV12S6Pyj/bD36DBKXgcbIOz9o=;
	b=S31u2gOwvc7BU4V47HcFw9waCiC4iMrFPVR97yJTnj+BwG7MlS7IHeXR86Wba34cKDKUIn
	V9OfJXz3hgFjRKHe+dhibYp5vVbyF3p3pVHROB5ZEpAJuOkn5nngxRrvRfQvZHQZFuqNcj
	WA2ARJpWbrT6hMzDKpd0emUnZ4wFhzk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675417376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKX+TQVSfx0uTwzs+LV12S6Pyj/bD36DBKXgcbIOz9o=;
	b=S31u2gOwvc7BU4V47HcFw9waCiC4iMrFPVR97yJTnj+BwG7MlS7IHeXR86Wba34cKDKUIn
	V9OfJXz3hgFjRKHe+dhibYp5vVbyF3p3pVHROB5ZEpAJuOkn5nngxRrvRfQvZHQZFuqNcj
	WA2ARJpWbrT6hMzDKpd0emUnZ4wFhzk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-mPGuNb5yOM-GP8W1xzDSxA-1; Fri, 03 Feb 2023 04:42:53 -0500
X-MC-Unique: mPGuNb5yOM-GP8W1xzDSxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6E453806101;
	Fri,  3 Feb 2023 09:42:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06BF040168BD;
	Fri,  3 Feb 2023 09:42:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 4/7] KVM: PPC: Standardize on "int" return types in the powerpc KVM code
Date: Fri,  3 Feb 2023 10:42:27 +0100
Message-Id: <20230203094230.266952-5-thuth@redhat.com>
In-Reply-To: <20230203094230.266952-1-thuth@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most functions that are related to kvm_arch_vm_ioctl() already use
"int" as return type to pass error values back to the caller. Some
outlier functions use "long" instead for no good reason (they do not
really require long values here). Let's standardize on "int" here to
avoid casting the values back and forth between the two types.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/powerpc/include/asm/kvm_ppc.h  | 14 +++++++-------
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 14 +++++++-------
 arch/powerpc/kvm/book3s_64_vio.c    |  4 ++--
 arch/powerpc/kvm/book3s_hv.c        |  6 +++---
 arch/powerpc/kvm/book3s_pr.c        |  4 ++--
 5 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index eae9619b6190..41ab4ebdc1ee 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -157,7 +157,7 @@ extern void kvmppc_map_magic(struct kvm_vcpu *vcpu);
 
 extern int kvmppc_allocate_hpt(struct kvm_hpt_info *info, u32 order);
 extern void kvmppc_set_hpt(struct kvm *kvm, struct kvm_hpt_info *info);
-extern long kvmppc_alloc_reset_hpt(struct kvm *kvm, int order);
+extern int kvmppc_alloc_reset_hpt(struct kvm *kvm, int order);
 extern void kvmppc_free_hpt(struct kvm_hpt_info *info);
 extern void kvmppc_rmap_reset(struct kvm *kvm);
 extern void kvmppc_map_vrma(struct kvm_vcpu *vcpu,
@@ -171,7 +171,7 @@ extern int kvmppc_switch_mmu_to_hpt(struct kvm *kvm);
 extern int kvmppc_switch_mmu_to_radix(struct kvm *kvm);
 extern void kvmppc_setup_partition_table(struct kvm *kvm);
 
-extern long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
+extern int kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 				struct kvm_create_spapr_tce_64 *args);
 #define kvmppc_ioba_validate(stt, ioba, npages)                         \
 		(iommu_tce_check_ioba((stt)->page_shift, (stt)->offset, \
@@ -212,10 +212,10 @@ extern void kvmppc_bookehv_exit(void);
 extern int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu);
 
 extern int kvm_vm_ioctl_get_htab_fd(struct kvm *kvm, struct kvm_get_htab_fd *);
-extern long kvm_vm_ioctl_resize_hpt_prepare(struct kvm *kvm,
-					    struct kvm_ppc_resize_hpt *rhpt);
-extern long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
+extern int kvm_vm_ioctl_resize_hpt_prepare(struct kvm *kvm,
 					   struct kvm_ppc_resize_hpt *rhpt);
+extern int kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
+					  struct kvm_ppc_resize_hpt *rhpt);
 
 int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq);
 
@@ -287,8 +287,8 @@ struct kvmppc_ops {
 	int (*emulate_mtspr)(struct kvm_vcpu *vcpu, int sprn, ulong spr_val);
 	int (*emulate_mfspr)(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val);
 	void (*fast_vcpu_kick)(struct kvm_vcpu *vcpu);
-	long (*arch_vm_ioctl)(struct file *filp, unsigned int ioctl,
-			      unsigned long arg);
+	int (*arch_vm_ioctl)(struct file *filp, unsigned int ioctl,
+			     unsigned long arg);
 	int (*hcall_implemented)(unsigned long hcall);
 	int (*irq_bypass_add_producer)(struct irq_bypass_consumer *,
 				       struct irq_bypass_producer *);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 7006bcbc2e37..1f4896de58ca 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -124,9 +124,9 @@ void kvmppc_set_hpt(struct kvm *kvm, struct kvm_hpt_info *info)
 		 info->virt, (long)info->order, kvm->arch.lpid);
 }
 
-long kvmppc_alloc_reset_hpt(struct kvm *kvm, int order)
+int kvmppc_alloc_reset_hpt(struct kvm *kvm, int order)
 {
-	long err = -EBUSY;
+	int err = -EBUSY;
 	struct kvm_hpt_info info;
 
 	mutex_lock(&kvm->arch.mmu_setup_lock);
@@ -1468,8 +1468,8 @@ static void resize_hpt_prepare_work(struct work_struct *work)
 	mutex_unlock(&kvm->arch.mmu_setup_lock);
 }
 
-long kvm_vm_ioctl_resize_hpt_prepare(struct kvm *kvm,
-				     struct kvm_ppc_resize_hpt *rhpt)
+int kvm_vm_ioctl_resize_hpt_prepare(struct kvm *kvm,
+				    struct kvm_ppc_resize_hpt *rhpt)
 {
 	unsigned long flags = rhpt->flags;
 	unsigned long shift = rhpt->shift;
@@ -1534,13 +1534,13 @@ static void resize_hpt_boot_vcpu(void *opaque)
 	/* Nothing to do, just force a KVM exit */
 }
 
-long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
-				    struct kvm_ppc_resize_hpt *rhpt)
+int kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
+				   struct kvm_ppc_resize_hpt *rhpt)
 {
 	unsigned long flags = rhpt->flags;
 	unsigned long shift = rhpt->shift;
 	struct kvm_resize_hpt *resize;
-	long ret;
+	int ret;
 
 	if (flags != 0 || kvm_is_radix(kvm))
 		return -EINVAL;
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 95e738ef9062..93b695b289e9 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -288,8 +288,8 @@ static const struct file_operations kvm_spapr_tce_fops = {
 	.release	= kvm_spapr_tce_release,
 };
 
-long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
-				   struct kvm_create_spapr_tce_64 *args)
+int kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
+				  struct kvm_create_spapr_tce_64 *args)
 {
 	struct kvmppc_spapr_tce_table *stt = NULL;
 	struct kvmppc_spapr_tce_table *siter;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6ba68dd6190b..cd139a1edc67 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5779,12 +5779,12 @@ static void kvmppc_irq_bypass_del_producer_hv(struct irq_bypass_consumer *cons,
 }
 #endif
 
-static long kvm_arch_vm_ioctl_hv(struct file *filp,
-				 unsigned int ioctl, unsigned long arg)
+static int kvm_arch_vm_ioctl_hv(struct file *filp,
+				unsigned int ioctl, unsigned long arg)
 {
 	struct kvm *kvm __maybe_unused = filp->private_data;
 	void __user *argp = (void __user *)arg;
-	long r;
+	int r;
 
 	switch (ioctl) {
 
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 9fc4dd8f66eb..5908b514bfb6 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -2042,8 +2042,8 @@ static int kvmppc_core_check_processor_compat_pr(void)
 	return 0;
 }
 
-static long kvm_arch_vm_ioctl_pr(struct file *filp,
-				 unsigned int ioctl, unsigned long arg)
+static int kvm_arch_vm_ioctl_pr(struct file *filp,
+				unsigned int ioctl, unsigned long arg)
 {
 	return -ENOTTY;
 }
-- 
2.31.1

