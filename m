Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 658D97A2C8A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:36:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qi/T5sM0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXDJ2FtVz3dt0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:36:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qi/T5sM0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3yvcezqykdjmf1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX6s2yqlz3dCd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:33 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c4375c1406so10016625ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824291; x=1695429091; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=C0sn2AnVcRbsYEvqFgh4BzWbc2uKAyyxP92cnWXv5Gc=;
        b=qi/T5sM0E7p6wGF0VtVXyBZeGnsOFSbdAsjcQfEczB4jHjG3tAWjTvEFssJAh7Xgle
         lzW5KHU5rhXMHwu3pWGH/+o9VHL7zFgrUNWQSgSy6J2CesPsrt+k3MHfNRTtzakHQYrN
         /NwMwwFCalka/MpiVdwLsuzeb5UBt+9S283wjqHOTrNsGbDRXJMYCCx3GXVmO5nXd08g
         Sk9MZ8HSCrJD8AKMB6T4745trkUHs7fVpM2kI1xulV+3WDPc2PS8DXPS7Mk+NYPmo4yR
         fIOrq06TP+sTjI0msjO5Nk0+tkJ8TqvOLOJ/QGbEmclUDfXYWNYBScNgI/ZKRNK+5nXG
         PXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824291; x=1695429091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0sn2AnVcRbsYEvqFgh4BzWbc2uKAyyxP92cnWXv5Gc=;
        b=DsHNoOiqB4A551ZKlt7TD6pFuWphY9QGPfgFW7F8OeEiTL8iHxNrdn+dUxykJ4DCzM
         7PjqBpqkkr866tJ3mQfwRSCQBbzbBIzJzgzHm3JzLeU0/qZvcVovZg8pL5UsMsirGg6R
         5ORDsOG90AKX034fGOUJnk4S9jk4I/s0duj52aZZCq8UPE4EeZU4Q9XThs9YsRYk1q+6
         s6taecar4oWj5Vi/6B1FVNnlEmQhS96WOJbVsBXBitA6nobFN0+H50DHVp1Io953VtJA
         IU0+ro19uIN59EyZUCPWalJu7hwceyvDAGEBtxnkgTDthkNQP0LCga/Ywo5wDs4iBY9Q
         nrjw==
X-Gm-Message-State: AOJu0YwUzVzZ6K8wif1dC5ep3Hv7CVhRhRaRPpKo766XSBwe+hPJLM9S
	C8beU7pTfnF1VIHda2t65OoBY6QTRec=
X-Google-Smtp-Source: AGHT+IHtRyj8S1iXRa1AyuzUMEtuqAzbJZbP2iFNCt3KVQZXM+xbuQMnV6uSJ406DSy/keoiXYz83X05kPo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c2:b0:1c1:fbec:bc39 with SMTP id
 u2-20020a17090341c200b001c1fbecbc39mr73146ple.4.1694824290982; Fri, 15 Sep
 2023 17:31:30 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:57 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-6-seanjc@google.com>
Subject: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO, don't
 do circular lookup
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
KVM and VFIO do symbol lookups increases the overall complexity and places
an unnecessary dependency on KVM (from VFIO) without adding any value.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio.h      |  2 ++
 drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
 include/linux/vfio.h     |  4 ++-
 virt/kvm/vfio.c          |  9 +++--
 4 files changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index a1f741365075..eec51c7ee822 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -19,6 +19,8 @@ struct vfio_container;
 
 struct vfio_kvm_reference {
 	struct kvm			*kvm;
+	bool				(*get_kvm)(struct kvm *kvm);
+	void				(*put_kvm)(struct kvm *kvm);
 	spinlock_t			lock;
 };
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index e77e8c6aae2f..1f58ab6dbcd2 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -16,7 +16,6 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
-#include <linux/kvm_host.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
@@ -1306,38 +1305,22 @@ EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 void vfio_device_get_kvm_safe(struct vfio_device *device,
 			      struct vfio_kvm_reference *ref)
 {
-	void (*pfn)(struct kvm *kvm);
-	bool (*fn)(struct kvm *kvm);
-	bool ret;
-
 	lockdep_assert_held(&device->dev_set->lock);
 
+	/*
+	 * Note!  The "kvm" and "put_kvm" pointers *must* be transferred to the
+	 * device so that the device can put its reference to KVM.  KVM can
+	 * invoke vfio_device_set_kvm() to detach from VFIO, i.e. nullify all
+	 * pointers in @ref, even if a device holds a reference to KVM!  That
+	 * also means that detaching KVM from VFIO only prevents "new" devices
+	 * from using KVM, it doesn't invalidate KVM references in existing
+	 * devices.
+	 */
 	spin_lock(&ref->lock);
-
-	if (!ref->kvm)
-		goto out;
-
-	pfn = symbol_get(kvm_put_kvm);
-	if (WARN_ON(!pfn))
-		goto out;
-
-	fn = symbol_get(kvm_get_kvm_safe);
-	if (WARN_ON(!fn)) {
-		symbol_put(kvm_put_kvm);
-		goto out;
+	if (ref->kvm && ref->get_kvm(ref->kvm)) {
+		device->kvm = ref->kvm;
+		device->put_kvm = ref->put_kvm;
 	}
-
-	ret = fn(ref->kvm);
-	symbol_put(kvm_get_kvm_safe);
-	if (!ret) {
-		symbol_put(kvm_put_kvm);
-		goto out;
-	}
-
-	device->put_kvm = pfn;
-	device->kvm = ref->kvm;
-
-out:
 	spin_unlock(&ref->lock);
 }
 
@@ -1353,28 +1336,37 @@ void vfio_device_put_kvm(struct vfio_device *device)
 
 	device->put_kvm(device->kvm);
 	device->put_kvm = NULL;
-	symbol_put(kvm_put_kvm);
-
 clear:
 	device->kvm = NULL;
 }
 
 static void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
-				struct kvm *kvm)
+				struct kvm *kvm,
+				bool (*get_kvm)(struct kvm *kvm),
+				void (*put_kvm)(struct kvm *kvm))
 {
+	if (WARN_ON_ONCE(kvm && (!get_kvm || !put_kvm)))
+		return;
+
 	spin_lock(&ref->lock);
 	ref->kvm = kvm;
+	ref->get_kvm = get_kvm;
+	ref->put_kvm = put_kvm;
 	spin_unlock(&ref->lock);
 }
 
-static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
+static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm,
+			       bool (*get_kvm)(struct kvm *kvm),
+			       void (*put_kvm)(struct kvm *kvm))
 {
 #if IS_ENABLED(CONFIG_VFIO_GROUP)
-	vfio_device_set_kvm(&group->kvm_ref, kvm);
+	vfio_device_set_kvm(&group->kvm_ref, kvm, get_kvm, put_kvm);
 #endif
 }
 
-static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
+static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm,
+				     bool (*get_kvm)(struct kvm *kvm),
+				     void (*put_kvm)(struct kvm *kvm))
 {
 	struct vfio_device_file *df = file->private_data;
 
@@ -1383,27 +1375,31 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 	 * be propagated to vfio_device::kvm when the file is bound to
 	 * iommufd successfully in the vfio device cdev path.
 	 */
-	vfio_device_set_kvm(&df->kvm_ref, kvm);
+	vfio_device_set_kvm(&df->kvm_ref, kvm, get_kvm, put_kvm);
 }
 
 /**
  * vfio_file_set_kvm - Link a kvm with VFIO drivers
  * @file: VFIO group file or VFIO device file
  * @kvm: KVM to link
+ * @get_kvm: Callback to get a reference to @kvm
+ * @put_kvm: Callback to put a reference to @kvm
  *
  * When a VFIO device is first opened the KVM will be available in
  * device->kvm if one was associated with the file.
  */
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
+		       bool (*get_kvm)(struct kvm *kvm),
+		       void (*put_kvm)(struct kvm *kvm))
 {
 	struct vfio_group *group;
 
 	group = vfio_group_from_file(file);
 	if (group)
-		vfio_group_set_kvm(group, kvm);
+		vfio_group_set_kvm(group, kvm, get_kvm, put_kvm);
 
 	if (vfio_device_from_file(file))
-		vfio_device_file_set_kvm(file, kvm);
+		vfio_device_file_set_kvm(file, kvm, get_kvm, put_kvm);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 #endif
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e80955de266c..35e970e3d3fb 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -312,7 +312,9 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 #if IS_ENABLED(CONFIG_KVM)
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
+		       bool (*get_kvm)(struct kvm *kvm),
+		       void (*put_kvm)(struct kvm *kvm));
 #endif
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index ca24ce120906..f14fcbb34bc6 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -37,13 +37,18 @@ struct kvm_vfio {
 
 static void kvm_vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 {
-	void (*fn)(struct file *file, struct kvm *kvm);
+	void (*fn)(struct file *file, struct kvm *kvm,
+		   bool (*get_kvm)(struct kvm *kvm),
+		   void (*put_kvm)(struct kvm *kvm));
 
 	fn = symbol_get(vfio_file_set_kvm);
 	if (!fn)
 		return;
 
-	fn(file, kvm);
+	if (kvm)
+		fn(file, kvm, kvm_get_kvm_safe, kvm_put_kvm);
+	else
+		fn(file, kvm, NULL, NULL);
 
 	symbol_put(vfio_file_set_kvm);
 }
-- 
2.42.0.459.ge4e396fd5e-goog

