Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92E7A2C7E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:35:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yyvfzn1Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXCM0cXmz3df5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yyvfzn1Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ypcezqykdjedzv84x19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX6q0X9Dz3cnS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:31 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7ea08906b3so3161850276.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824289; x=1695429089; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XNfaWnR713DgNOXX6oC0phI1nRzZDxqQCByPnT54704=;
        b=yyvfzn1QJMbreZhQFNNW2ZwSKmgTkCt1POUcEcq4Pp9sNAdlo2MZdw6L9/q2r+RbEq
         AEoR7/rph4yEHNHx0CwhLGIdzzRuA9v3hlGZLmi8i2Eb3gdNLPbwcyWKN921lL8QP2Rr
         e5K5G4yYV7ft1SVZe+qEv2FEN2IjF9ysnmkKDx/vpRrRhbrnrZ6Rmry1oHTmK/j4gf2S
         pepqL3SLZwG12CSx5E+uYdyC2xgY+gfQYcVRYdabbPIlglCDcUxtY71lbmwHLRagfQ4e
         mni8RgGAlVXFUFmBW0HPQYqrqZpXoqo0EpO04Q/tc8N43gdKmOzoHwuHbbUE+QxSQkRs
         O1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824289; x=1695429089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNfaWnR713DgNOXX6oC0phI1nRzZDxqQCByPnT54704=;
        b=kv4JwaKWvq+uu5BEssvkt/rpJT9smNEdqE38nFiCzR6jXmPFl4zfi3JpkmjYn2FKIn
         3j2fyVvBhuS7VuxMNNCUDffBE25Wuz5Xr0hoOI8bf3wcsCriIsd5ubriIpep/eQsnNke
         JEiILhHG0PhFDxsYncZIM1F5z1937en1MFeYeqbz7rqGhQh6EFa/krJqu+PSK6M+BhCI
         nlkUK4AAQZgObnD7NCFwiOzMzHy2WB7Zi5/28GkN65zd36VyU9Q8hoyc0Ip400rRi4AV
         p9R7JN5svEGdnXhcvAfw8MmDZIE1ecuE+vChCwBc/HjLK6xNNtdKoSVw27ClPqmIIQaq
         Fn5Q==
X-Gm-Message-State: AOJu0YzJRSPC0Yqlc0sQGKp++GroIjcVDDi3kN+E5ol9gPA65jR01fir
	Qaq5+M4qwkjWOSym2PLKH5NFuiybIrU=
X-Google-Smtp-Source: AGHT+IGvtU4vAL07Ep1DYBA3eTFA34U05IWJGHx1Y/tLzKqZb8SnlC6/6SqqxeE2xQbrWfOJDU/nK++52MU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d856:0:b0:d13:856b:c10a with SMTP id
 p83-20020a25d856000000b00d13856bc10amr78847ybg.3.1694824288887; Fri, 15 Sep
 2023 17:31:28 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:56 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-5-seanjc@google.com>
Subject: [PATCH 04/26] vfio: Add struct to hold KVM assets and dedup group vs.
 iommufd code
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

Add a struct to hold the KVM assets need to manage and pass along KVM
references to VFIO devices.  Providing a common struct deduplicates the
group vs. iommufd code, and will make it easier to rework the attachment
logic so that VFIO doesn't have to do a symbol lookup to retrieve the
get/put helpers from KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/device_cdev.c |  9 +-------
 drivers/vfio/group.c       | 18 ++--------------
 drivers/vfio/vfio.h        | 22 +++++++++----------
 drivers/vfio/vfio_main.c   | 43 +++++++++++++++++++++++++++-----------
 4 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index e75da0a70d1f..e484d6d6400a 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -46,13 +46,6 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
 	return ret;
 }
 
-static void vfio_df_get_kvm_safe(struct vfio_device_file *df)
-{
-	spin_lock(&df->kvm_ref_lock);
-	vfio_device_get_kvm_safe(df->device, df->kvm);
-	spin_unlock(&df->kvm_ref_lock);
-}
-
 long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
 				struct vfio_device_bind_iommufd __user *arg)
 {
@@ -99,7 +92,7 @@ long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
 	 * a reference.  This reference is held until device closed.
 	 * Save the pointer in the device for use by drivers.
 	 */
-	vfio_df_get_kvm_safe(df);
+	vfio_device_get_kvm_safe(df->device, &df->kvm_ref);
 
 	ret = vfio_df_open(df);
 	if (ret)
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 610a429c6191..756e47ff4cf0 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -157,13 +157,6 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 	return ret;
 }
 
-static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
-{
-	spin_lock(&device->group->kvm_ref_lock);
-	vfio_device_get_kvm_safe(device, device->group->kvm);
-	spin_unlock(&device->group->kvm_ref_lock);
-}
-
 static int vfio_df_group_open(struct vfio_device_file *df)
 {
 	struct vfio_device *device = df->device;
@@ -184,7 +177,7 @@ static int vfio_df_group_open(struct vfio_device_file *df)
 	 * the pointer in the device for use by drivers.
 	 */
 	if (device->open_count == 0)
-		vfio_device_group_get_kvm_safe(device);
+		vfio_device_get_kvm_safe(device, &device->group->kvm_ref);
 
 	df->iommufd = device->group->iommufd;
 	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
@@ -560,7 +553,7 @@ static struct vfio_group *vfio_group_alloc(struct iommu_group *iommu_group,
 
 	refcount_set(&group->drivers, 1);
 	mutex_init(&group->group_lock);
-	spin_lock_init(&group->kvm_ref_lock);
+	spin_lock_init(&group->kvm_ref.lock);
 	INIT_LIST_HEAD(&group->device_list);
 	mutex_init(&group->device_lock);
 	group->iommu_group = iommu_group;
@@ -884,13 +877,6 @@ bool vfio_group_enforced_coherent(struct vfio_group *group)
 	return ret;
 }
 
-void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
-{
-	spin_lock(&group->kvm_ref_lock);
-	group->kvm = kvm;
-	spin_unlock(&group->kvm_ref_lock);
-}
-
 /**
  * vfio_file_has_dev - True if the VFIO file is a handle for device
  * @file: VFIO file to check
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index c26d1ad68105..a1f741365075 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -12,18 +12,23 @@
 #include <linux/module.h>
 #include <linux/vfio.h>
 
+struct kvm;
 struct iommufd_ctx;
 struct iommu_group;
 struct vfio_container;
 
+struct vfio_kvm_reference {
+	struct kvm			*kvm;
+	spinlock_t			lock;
+};
+
 struct vfio_device_file {
 	struct vfio_device *device;
 	struct vfio_group *group;
 
 	u8 access_granted;
 	u32 devid; /* only valid when iommufd is valid */
-	spinlock_t kvm_ref_lock; /* protect kvm field */
-	struct kvm *kvm;
+	struct vfio_kvm_reference kvm_ref;
 	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
 };
 
@@ -88,11 +93,10 @@ struct vfio_group {
 #endif
 	enum vfio_group_type		type;
 	struct mutex			group_lock;
-	struct kvm			*kvm;
+	struct vfio_kvm_reference	kvm_ref;
 	struct file			*opened_file;
 	struct blocking_notifier_head	notifier;
 	struct iommufd_ctx		*iommufd;
-	spinlock_t			kvm_ref_lock;
 	unsigned int			cdev_device_open_cnt;
 };
 
@@ -108,7 +112,6 @@ void vfio_device_group_unuse_iommu(struct vfio_device *device);
 void vfio_df_group_close(struct vfio_device_file *df);
 struct vfio_group *vfio_group_from_file(struct file *file);
 bool vfio_group_enforced_coherent(struct vfio_group *group);
-void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm);
 bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
@@ -171,10 +174,6 @@ static inline bool vfio_group_enforced_coherent(struct vfio_group *group)
 	return true;
 }
 
-static inline void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
-{
-}
-
 static inline bool vfio_device_has_container(struct vfio_device *device)
 {
 	return false;
@@ -435,11 +434,12 @@ static inline void vfio_virqfd_exit(void)
 #endif
 
 #if IS_ENABLED(CONFIG_KVM)
-void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
+void vfio_device_get_kvm_safe(struct vfio_device *device,
+			      struct vfio_kvm_reference *ref);
 void vfio_device_put_kvm(struct vfio_device *device);
 #else
 static inline void vfio_device_get_kvm_safe(struct vfio_device *device,
-					    struct kvm *kvm)
+					    struct vfio_kvm_reference *ref)
 {
 }
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 124cc88966a7..e77e8c6aae2f 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -397,7 +397,7 @@ vfio_allocate_device_file(struct vfio_device *device)
 		return ERR_PTR(-ENOMEM);
 
 	df->device = device;
-	spin_lock_init(&df->kvm_ref_lock);
+	spin_lock_init(&df->kvm_ref.lock);
 
 	return df;
 }
@@ -1303,7 +1303,8 @@ bool vfio_file_enforced_coherent(struct file *file)
 EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 
 #if IS_ENABLED(CONFIG_KVM)
-void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
+void vfio_device_get_kvm_safe(struct vfio_device *device,
+			      struct vfio_kvm_reference *ref)
 {
 	void (*pfn)(struct kvm *kvm);
 	bool (*fn)(struct kvm *kvm);
@@ -1311,28 +1312,33 @@ void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
 
 	lockdep_assert_held(&device->dev_set->lock);
 
-	if (!kvm)
-		return;
+	spin_lock(&ref->lock);
+
+	if (!ref->kvm)
+		goto out;
 
 	pfn = symbol_get(kvm_put_kvm);
 	if (WARN_ON(!pfn))
-		return;
+		goto out;
 
 	fn = symbol_get(kvm_get_kvm_safe);
 	if (WARN_ON(!fn)) {
 		symbol_put(kvm_put_kvm);
-		return;
+		goto out;
 	}
 
-	ret = fn(kvm);
+	ret = fn(ref->kvm);
 	symbol_put(kvm_get_kvm_safe);
 	if (!ret) {
 		symbol_put(kvm_put_kvm);
-		return;
+		goto out;
 	}
 
 	device->put_kvm = pfn;
-	device->kvm = kvm;
+	device->kvm = ref->kvm;
+
+out:
+	spin_unlock(&ref->lock);
 }
 
 void vfio_device_put_kvm(struct vfio_device *device)
@@ -1353,6 +1359,21 @@ void vfio_device_put_kvm(struct vfio_device *device)
 	device->kvm = NULL;
 }
 
+static void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
+				struct kvm *kvm)
+{
+	spin_lock(&ref->lock);
+	ref->kvm = kvm;
+	spin_unlock(&ref->lock);
+}
+
+static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
+{
+#if IS_ENABLED(CONFIG_VFIO_GROUP)
+	vfio_device_set_kvm(&group->kvm_ref, kvm);
+#endif
+}
+
 static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 {
 	struct vfio_device_file *df = file->private_data;
@@ -1362,9 +1383,7 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 	 * be propagated to vfio_device::kvm when the file is bound to
 	 * iommufd successfully in the vfio device cdev path.
 	 */
-	spin_lock(&df->kvm_ref_lock);
-	df->kvm = kvm;
-	spin_unlock(&df->kvm_ref_lock);
+	vfio_device_set_kvm(&df->kvm_ref, kvm);
 }
 
 /**
-- 
2.42.0.459.ge4e396fd5e-goog

