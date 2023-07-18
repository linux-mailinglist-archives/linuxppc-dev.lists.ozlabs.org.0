Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9B7589B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 01:54:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=LvUy9xBw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5G5H2kt6z3ck2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 09:54:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=LvUy9xBw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=32ys3zaykdc4cokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Fyk2Zlmz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:48:46 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-55c04f5827eso2851764a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724123; x=1692316123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ThXIJqX7As4i3dGm5wOXsZKmYyKWC1w3yhPdFi+UZh4=;
        b=LvUy9xBwtvIfAPCO5pNNhARQQ5SNv50VuwzjIysubxMyr/2WT9iQpqxA6erzK7bWiu
         qihBKH4SJZf0AvBAqcBEejRsurglq/OJfXy6wCGPqNGQh8Ro3lrbfPRoj8tfypGRMlsn
         Uqch0IxGwwo0DLlZrr1zeRuXu1xNXvsURj/8G/FFYVp7s8AUP5ynEAUgVaPHCZ8dBxWo
         XzgPa/CMeeijvZgR9bdbpmr2gQZWkwBUQDlw7rhcaUYjPEJTs8NmkEkBHw+XU/kMKj/i
         AePIN4rloEM+TeBH/xMOBZ/pVRG+4qprH3PDbeKaJmr2/1mChRw4GYfNQ4J/UBEhhSrm
         FjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724123; x=1692316123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThXIJqX7As4i3dGm5wOXsZKmYyKWC1w3yhPdFi+UZh4=;
        b=YWw1pIZXRWvDb5izc8zoVenGUpbvpHw48CL0GQYAU7cxYg5ZzcnJGc3XjvUywSHNHT
         4WzXwn0z+pePTdbot4HWrCKlJ8QG4KjDbBbR1tkxQp/EJy4rrFy2K2CF416VomRFbzuO
         8J1aDJG+NG6LeRkZqh1bhsDOcAAaXTYBA7gWHC/OeKMzZPaNNr6aMHbNe8ZgoRdpSHc4
         ApjQ3US/PEOFFhkNJUZhrVovj+yVXEDK9y1a0wz1E7cGCVi31U9+D8Uv37211ofKK3KG
         MRjpV5odGEvLFi+F7K0S7lzOu+vdB04HOy3o+TK3wkchQAatZGAo1P1c4GtrL+1xsJMC
         wRYA==
X-Gm-Message-State: ABy/qLaHCy1LFA0cQMEqdROyzXDe30c9DGP2kGjFwQlrqEfp6up3fLod
	+fZ37gUikbWU6DcUS/UVR/YjGT0dkEs=
X-Google-Smtp-Source: APBJJlFjBm3uEK6hEcjuoeBKM7s5L/qQiT85mHjyEzQM1CYgv+bsN7btAmL4QIiVKpupcBcSQ8/VxXwLYM4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec88:b0:1b9:df8f:888c with SMTP id
 x8-20020a170902ec8800b001b9df8f888cmr16353plg.8.1689724123174; Tue, 18 Jul
 2023 16:48:43 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:49 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-7-seanjc@google.com>
Subject: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c       |  2 +-
 include/linux/kvm_host.h |  4 ++--
 include/uapi/linux/kvm.h | 13 +++++++++++++
 virt/kvm/kvm_main.c      | 38 ++++++++++++++++++++++++++++++--------
 4 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a6b9bea62fb8..92e77afd3ffd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12420,7 +12420,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 	}
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
-		struct kvm_userspace_memory_region m;
+		struct kvm_userspace_memory_region2 m;
 
 		m.slot = id | (i << 16);
 		m.flags = 0;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d2d3e083ec7f..e9ca49d451f3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1130,9 +1130,9 @@ enum kvm_mr_change {
 };
 
 int kvm_set_memory_region(struct kvm *kvm,
-			  const struct kvm_userspace_memory_region *mem);
+			  const struct kvm_userspace_memory_region2 *mem);
 int __kvm_set_memory_region(struct kvm *kvm,
-			    const struct kvm_userspace_memory_region *mem);
+			    const struct kvm_userspace_memory_region2 *mem);
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index f089ab290978..4d4b3de8ac55 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
 	__u64 userspace_addr; /* start of the userspace allocated memory */
 };
 
+/* for KVM_SET_USER_MEMORY_REGION2 */
+struct kvm_userspace_memory_region2 {
+	__u32 slot;
+	__u32 flags;
+	__u64 guest_phys_addr;
+	__u64 memory_size;
+	__u64 userspace_addr;
+	__u64 pad[16];
+};
+
 /*
  * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
  * userspace, other bits are reserved for kvm internal use which are defined
@@ -1192,6 +1202,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_COUNTER_OFFSET 227
 #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
+#define KVM_CAP_USER_MEMORY2 230
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1466,6 +1477,8 @@ struct kvm_vfio_spapr_tce {
 					struct kvm_userspace_memory_region)
 #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
 #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
+#define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
+					 struct kvm_userspace_memory_region2)
 
 /* enable ucontrol for s390 */
 struct kvm_s390_ucas_mapping {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 53346bc2902a..c14adf93daec 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1549,7 +1549,7 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 }
 
-static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
+static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
@@ -1951,7 +1951,7 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
  * Must be called holding kvm->slots_lock for write.
  */
 int __kvm_set_memory_region(struct kvm *kvm,
-			    const struct kvm_userspace_memory_region *mem)
+			    const struct kvm_userspace_memory_region2 *mem)
 {
 	struct kvm_memory_slot *old, *new;
 	struct kvm_memslots *slots;
@@ -2055,7 +2055,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
 
 int kvm_set_memory_region(struct kvm *kvm,
-			  const struct kvm_userspace_memory_region *mem)
+			  const struct kvm_userspace_memory_region2 *mem)
 {
 	int r;
 
@@ -2067,7 +2067,7 @@ int kvm_set_memory_region(struct kvm *kvm,
 EXPORT_SYMBOL_GPL(kvm_set_memory_region);
 
 static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
-					  struct kvm_userspace_memory_region *mem)
+					  struct kvm_userspace_memory_region2 *mem)
 {
 	if ((u16)mem->slot >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
@@ -4514,6 +4514,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 {
 	switch (arg) {
 	case KVM_CAP_USER_MEMORY:
+	case KVM_CAP_USER_MEMORY2:
 	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
 	case KVM_CAP_JOIN_MEMORY_REGIONS_WORKS:
 	case KVM_CAP_INTERNAL_ERROR_DATA:
@@ -4757,6 +4758,14 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
 	return fd;
 }
 
+#define SANITY_CHECK_MEM_REGION_FIELD(field)					\
+do {										\
+	BUILD_BUG_ON(offsetof(struct kvm_userspace_memory_region, field) !=		\
+		     offsetof(struct kvm_userspace_memory_region2, field));	\
+	BUILD_BUG_ON(sizeof_field(struct kvm_userspace_memory_region, field) !=		\
+		     sizeof_field(struct kvm_userspace_memory_region2, field));	\
+} while (0)
+
 static long kvm_vm_ioctl(struct file *filp,
 			   unsigned int ioctl, unsigned long arg)
 {
@@ -4779,15 +4788,28 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
 		break;
 	}
+	case KVM_SET_USER_MEMORY_REGION2:
 	case KVM_SET_USER_MEMORY_REGION: {
-		struct kvm_userspace_memory_region kvm_userspace_mem;
+		struct kvm_userspace_memory_region2 mem;
+		unsigned long size;
+
+		if (ioctl == KVM_SET_USER_MEMORY_REGION)
+			size = sizeof(struct kvm_userspace_memory_region);
+		else
+			size = sizeof(struct kvm_userspace_memory_region2);
+
+		/* Ensure the common parts of the two structs are identical. */
+		SANITY_CHECK_MEM_REGION_FIELD(slot);
+		SANITY_CHECK_MEM_REGION_FIELD(flags);
+		SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
+		SANITY_CHECK_MEM_REGION_FIELD(memory_size);
+		SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
 
 		r = -EFAULT;
-		if (copy_from_user(&kvm_userspace_mem, argp,
-						sizeof(kvm_userspace_mem)))
+		if (copy_from_user(&mem, argp, size))
 			goto out;
 
-		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
+		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
 		break;
 	}
 	case KVM_GET_DIRTY_LOG: {
-- 
2.41.0.255.g8b1d071c50-goog

