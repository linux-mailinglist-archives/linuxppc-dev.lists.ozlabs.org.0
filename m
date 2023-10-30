Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71557DC12D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 21:26:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=y5E7HRzw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK4Yf2SJBz3cWs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 07:26:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=y5E7HRzw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ubfazqykdkmvhdqmfjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK4Xj5gLQz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 07:25:56 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9a5a16fa94so4235326276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698697552; x=1699302352; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLe0geP8e2FVj4qDFmgiKe4HSQmMDr9vIKCdz5IJ0b8=;
        b=y5E7HRzwWwVe+lB+glGda0tLlX3wh5k7J9lY0UX5z0KobHtxoqRtrxbvXeTR/InitK
         zmZ7I5kKdoc485RNKUGvk3ZDyJoyLb9U0/OqLuZwHyObcu7azQ578qcAaTSfazbR9cdP
         NTq/Y/oasLFYj97465f5kGgaxuDB7nXmOAVxNy1rUl0qNS2DYadfxm+2wzHtQXKl36Jx
         19LpO9pSLUSCP7iVOSeeFRZYorX0YYnWjW7RknZupdqcenSy2dsd9WH159of/xxaBizG
         yHnrFXWURZaNHN6yiU7SjX3B7+fLNwmVmZ9B/3wPn35/ir0syYwOp9ryivwFpkD/tZjn
         L7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698697552; x=1699302352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLe0geP8e2FVj4qDFmgiKe4HSQmMDr9vIKCdz5IJ0b8=;
        b=D6wi8r4yzcJqSEyJzpbyrv0P1yuTozRTB3mzrVb08Eabb6XM/BhmgIpslHrLd+JeXx
         pgKKji7iSS5dYSzpEtH+ZIsVcWUiqm6j2quRvw71wb0gWxPYU73fpEdxMHkB9Ma6+kdO
         dWCADqMTm1V382TkRueBxHuBt7JTWPU7FGrwbmIwB98LgvctgAHJwqaKCrCs8x897kXW
         or7o8q/WbTPs6a0F3gVHXuQbyrCGODmuQJ4j137JEdNz5Rtd68DY5wKx/n9gjuL3HzlT
         5NPXeMXm0AIxU/dJBLjoxiVIapGyQmCIE6z+hTCH83OBcDmm+7Ln/11FfHUBFoLIDzGm
         IkQQ==
X-Gm-Message-State: AOJu0Yw5xBKZGI1XY3PyDGCdPlItcvtD+4Z0dlY1k04UR4KrvpCfGjKI
	2XIXpySy+I63r+yQjzia17TH0MVFfao=
X-Google-Smtp-Source: AGHT+IGlGqmQkLdJGZ9mJzjtHQ/qef61ty+xku12xbQ7aSZ0jjD/v7MM7HUcLrxp67U3zyWvPrrdlUHrpDU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:84cc:0:b0:d89:42d7:e72d with SMTP id
 x12-20020a2584cc000000b00d8942d7e72dmr15389ybm.3.1698697552520; Mon, 30 Oct
 2023 13:25:52 -0700 (PDT)
Date: Mon, 30 Oct 2023 13:25:50 -0700
In-Reply-To: <211d093f-4023-4a39-a23f-6d8543512675@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <211d093f-4023-4a39-a23f-6d8543512675@redhat.com>
Message-ID: <ZUARTvhpChFSGF9s@google.com>
Subject: Re: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, l
 inux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023, Paolo Bonzini wrote:
> On 10/27/23 20:21, Sean Christopherson wrote:
> > 
> > +		if (ioctl == KVM_SET_USER_MEMORY_REGION)
> > +			size = sizeof(struct kvm_userspace_memory_region);
> 
> This also needs a memset(&mem, 0, sizeof(mem)), otherwise the out-of-bounds
> access of the commit message becomes a kernel stack read.

Ouch.  There's some irony.  Might be worth doing memset(&mem, -1, sizeof(mem))
though as '0' is a valid file descriptor and a valid file offset.

> Probably worth adding a check on valid flags here.

Definitely needed.  There's a very real bug here.  But rather than duplicate flags
checking or plumb @ioctl all the way to __kvm_set_memory_region(), now that we
have the fancy guard(mutex) and there are no internal calls to kvm_set_memory_region(),
what if we:

  1. Acquire/release slots_lock in __kvm_set_memory_region()
  2. Call kvm_set_memory_region() from x86 code for the internal memslots
  3. Disallow *any* flags for internal memslots
  4. Open code check_memory_region_flags in kvm_vm_ioctl_set_memory_region()
  5. Pass @ioctl to kvm_vm_ioctl_set_memory_region() and allow KVM_MEM_PRIVATE
     only for KVM_SET_USER_MEMORY_REGION2

E.g. this over ~5 patches

---
 arch/x86/kvm/x86.c       |  2 +-
 include/linux/kvm_host.h |  4 +--
 virt/kvm/kvm_main.c      | 65 +++++++++++++++++-----------------------
 3 files changed, 29 insertions(+), 42 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e3eb608b6692..dd3e2017366c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12478,7 +12478,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 		m.guest_phys_addr = gpa;
 		m.userspace_addr = hva;
 		m.memory_size = size;
-		r = __kvm_set_memory_region(kvm, &m);
+		r = kvm_set_memory_region(kvm, &m);
 		if (r < 0)
 			return ERR_PTR_USR(r);
 	}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 687589ce9f63..fbb98efe8200 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1170,7 +1170,7 @@ static inline bool kvm_memslot_iter_is_valid(struct kvm_memslot_iter *iter, gfn_
  *   -- just change its flags
  *
  * Since flags can be changed by some of these operations, the following
- * differentiation is the best we can do for __kvm_set_memory_region():
+ * differentiation is the best we can do for __kvm_set_memory_region().
  */
 enum kvm_mr_change {
 	KVM_MR_CREATE,
@@ -1181,8 +1181,6 @@ enum kvm_mr_change {
 
 int kvm_set_memory_region(struct kvm *kvm,
 			  const struct kvm_userspace_memory_region2 *mem);
-int __kvm_set_memory_region(struct kvm *kvm,
-			    const struct kvm_userspace_memory_region2 *mem);
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 23633984142f..39ceee2f67f2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1608,28 +1608,6 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 }
 
-static int check_memory_region_flags(struct kvm *kvm,
-				     const struct kvm_userspace_memory_region2 *mem)
-{
-	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
-
-	if (kvm_arch_has_private_mem(kvm))
-		valid_flags |= KVM_MEM_PRIVATE;
-
-	/* Dirty logging private memory is not currently supported. */
-	if (mem->flags & KVM_MEM_PRIVATE)
-		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;
-
-#ifdef __KVM_HAVE_READONLY_MEM
-	valid_flags |= KVM_MEM_READONLY;
-#endif
-
-	if (mem->flags & ~valid_flags)
-		return -EINVAL;
-
-	return 0;
-}
-
 static void kvm_swap_active_memslots(struct kvm *kvm, int as_id)
 {
 	struct kvm_memslots *slots = kvm_get_inactive_memslots(kvm, as_id);
@@ -2014,11 +1992,9 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
  * space.
  *
  * Discontiguous memory is allowed, mostly for framebuffers.
- *
- * Must be called holding kvm->slots_lock for write.
  */
-int __kvm_set_memory_region(struct kvm *kvm,
-			    const struct kvm_userspace_memory_region2 *mem)
+static int __kvm_set_memory_region(struct kvm *kvm,
+				   const struct kvm_userspace_memory_region2 *mem)
 {
 	struct kvm_memory_slot *old, *new;
 	struct kvm_memslots *slots;
@@ -2028,9 +2004,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	int as_id, id;
 	int r;
 
-	r = check_memory_region_flags(kvm, mem);
-	if (r)
-		return r;
+	guard(mutex)(&kvm->slots_lock);
 
 	as_id = mem->slot >> 16;
 	id = (u16)mem->slot;
@@ -2139,27 +2113,42 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	kfree(new);
 	return r;
 }
-EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
 
 int kvm_set_memory_region(struct kvm *kvm,
 			  const struct kvm_userspace_memory_region2 *mem)
 {
-	int r;
+	/* Flags aren't supported for KVM-internal memslots. */
+	if (WARN_ON_ONCE(mem->flags))
+		return -EINVAL;
 
-	mutex_lock(&kvm->slots_lock);
-	r = __kvm_set_memory_region(kvm, mem);
-	mutex_unlock(&kvm->slots_lock);
-	return r;
+	return __kvm_set_memory_region(kvm, mem);
 }
 EXPORT_SYMBOL_GPL(kvm_set_memory_region);
 
-static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
+static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm, unsigned int ioctl,
 					  struct kvm_userspace_memory_region2 *mem)
 {
+	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
+
+	if (ioctl == KVM_SET_USER_MEMORY_REGION2 &&
+	    kvm_arch_has_private_mem(kvm))
+		valid_flags |= KVM_MEM_PRIVATE;
+
+	/* Dirty logging private memory is not currently supported. */
+	if (mem->flags & KVM_MEM_PRIVATE)
+		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;
+
+#ifdef __KVM_HAVE_READONLY_MEM
+	valid_flags |= KVM_MEM_READONLY;
+#endif
+
+	if (mem->flags & ~valid_flags)
+		return -EINVAL;
+
 	if ((u16)mem->slot >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
 
-	return kvm_set_memory_region(kvm, mem);
+	return __kvm_set_memory_region(kvm, mem);
 }
 
 #ifndef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
@@ -5145,7 +5134,7 @@ static long kvm_vm_ioctl(struct file *filp,
 		if (copy_from_user(&mem, argp, size))
 			goto out;
 
-		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
+		r = kvm_vm_ioctl_set_memory_region(kvm, ioctl, &mem);
 		break;
 	}
 	case KVM_GET_DIRTY_LOG: {

base-commit: 881375a408c0f4ea451ff14545b59216d2923881
-- 

