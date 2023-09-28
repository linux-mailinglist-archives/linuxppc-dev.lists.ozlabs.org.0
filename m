Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A527B285B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 00:23:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TReJVHr7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TReJVHr7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxSfs5KKwz3cNv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 08:23:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TReJVHr7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TReJVHr7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxScz0zmnz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 08:21:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/l7DOL4i9eWpBdCSwTRJyugH/jLo/b6g4jXHDN7U+14=;
	b=TReJVHr7yKYtPFr4fcOVdPHQE2V1AczSv89K3NkcBS9sx4uy6tM9sPBNRw8u8eflRkOwEe
	plNtFt3mj+4rQsINyVR9P9O5jsG0q0TE64dekKjKeJJrP+6oXvvRO5c4tA13M0qCGb0Qno
	EoP+YMlBMHtDh+0E/49ze7sl7DRD0cQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/l7DOL4i9eWpBdCSwTRJyugH/jLo/b6g4jXHDN7U+14=;
	b=TReJVHr7yKYtPFr4fcOVdPHQE2V1AczSv89K3NkcBS9sx4uy6tM9sPBNRw8u8eflRkOwEe
	plNtFt3mj+4rQsINyVR9P9O5jsG0q0TE64dekKjKeJJrP+6oXvvRO5c4tA13M0qCGb0Qno
	EoP+YMlBMHtDh+0E/49ze7sl7DRD0cQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124--608y8EfOve1MXm-dvjtww-1; Thu, 28 Sep 2023 18:21:31 -0400
X-MC-Unique: -608y8EfOve1MXm-dvjtww-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3510e81c6a5so160576495ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 15:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939691; x=1696544491;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/l7DOL4i9eWpBdCSwTRJyugH/jLo/b6g4jXHDN7U+14=;
        b=FePtSJqZSYph4n+ohGV9SInrzofugLZCoGwQCYubiaGWgjQq+uYwLVdZKDn7OiiQWG
         IrNCrl7PLLqhxIFK4yJGlSBZO2zC92UeFX/tmSfBJyy/+C9yflZIHU4AN8g1eXMRuo7R
         89L6DClTru2Un1Z4iWqg5ElNs9VGYuPrc0s+sTHupKs3l4q6l7x7FNJbf3f3e5wx9I8Z
         ImhtcrllS4yLxYsWeBQS7EvuYqAgIviwMQBb8h+DDxj7KTWTyaprLjQ1EcRTAoZ+w+i9
         we0vYzalVLudFfVsqP+8VuBT+d2Ze9uW046T9w73YQKi5xncQOzojDLE28MEu6LvwosY
         bskw==
X-Gm-Message-State: AOJu0YyPUd6rtnmaKbv2e9hXV2FnjqxKw0SyaeVy0/IuIsbLiV52Obga
	nSTcgdm7VLDLJ3NAgfmu/ezB0y3p29ru7WvRk4R/VaJYx6j8PXbrrL88BBQ9Zv+NXYO3yRuewWS
	ldOY3l7p5fi1rNiIEZbSOT4FkCg==
X-Received: by 2002:a05:6e02:1809:b0:34f:ed76:7db8 with SMTP id a9-20020a056e02180900b0034fed767db8mr3391369ilv.26.1695939690785;
        Thu, 28 Sep 2023 15:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOH5tZZiZuKh+d30ZefE58SY4OZ2k4eRgPtsp2uogyFxnPRFAQcoCds5f0KJfUDnAzkmiCTw==
X-Received: by 2002:a05:6e02:1809:b0:34f:ed76:7db8 with SMTP id a9-20020a056e02180900b0034fed767db8mr3391301ilv.26.1695939690276;
        Thu, 28 Sep 2023 15:21:30 -0700 (PDT)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id t23-20020a02c497000000b0042b10d42c90sm4610172jam.113.2023.09.28.15.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:21:28 -0700 (PDT)
Date: Thu, 28 Sep 2023 16:21:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 04/26] vfio: Add struct to hold KVM assets and dedup
 group vs. iommufd code
Message-ID: <20230928162108.3fdd73bf.alex.williamson@redhat.com>
In-Reply-To: <20230916003118.2540661-5-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-5-seanjc@google.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: x86@kernel.org, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley 
 <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Sep 2023 17:30:56 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Add a struct to hold the KVM assets need to manage and pass along KVM
> references to VFIO devices.  Providing a common struct deduplicates the
> group vs. iommufd code, and will make it easier to rework the attachment
> logic so that VFIO doesn't have to do a symbol lookup to retrieve the
> get/put helpers from KVM.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/device_cdev.c |  9 +-------
>  drivers/vfio/group.c       | 18 ++--------------
>  drivers/vfio/vfio.h        | 22 +++++++++----------
>  drivers/vfio/vfio_main.c   | 43 +++++++++++++++++++++++++++-----------
>  4 files changed, 45 insertions(+), 47 deletions(-)


Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

 
> diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> index e75da0a70d1f..e484d6d6400a 100644
> --- a/drivers/vfio/device_cdev.c
> +++ b/drivers/vfio/device_cdev.c
> @@ -46,13 +46,6 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
>  	return ret;
>  }
>  
> -static void vfio_df_get_kvm_safe(struct vfio_device_file *df)
> -{
> -	spin_lock(&df->kvm_ref_lock);
> -	vfio_device_get_kvm_safe(df->device, df->kvm);
> -	spin_unlock(&df->kvm_ref_lock);
> -}
> -
>  long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
>  				struct vfio_device_bind_iommufd __user *arg)
>  {
> @@ -99,7 +92,7 @@ long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
>  	 * a reference.  This reference is held until device closed.
>  	 * Save the pointer in the device for use by drivers.
>  	 */
> -	vfio_df_get_kvm_safe(df);
> +	vfio_device_get_kvm_safe(df->device, &df->kvm_ref);
>  
>  	ret = vfio_df_open(df);
>  	if (ret)
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 610a429c6191..756e47ff4cf0 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -157,13 +157,6 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
>  	return ret;
>  }
>  
> -static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
> -{
> -	spin_lock(&device->group->kvm_ref_lock);
> -	vfio_device_get_kvm_safe(device, device->group->kvm);
> -	spin_unlock(&device->group->kvm_ref_lock);
> -}
> -
>  static int vfio_df_group_open(struct vfio_device_file *df)
>  {
>  	struct vfio_device *device = df->device;
> @@ -184,7 +177,7 @@ static int vfio_df_group_open(struct vfio_device_file *df)
>  	 * the pointer in the device for use by drivers.
>  	 */
>  	if (device->open_count == 0)
> -		vfio_device_group_get_kvm_safe(device);
> +		vfio_device_get_kvm_safe(device, &device->group->kvm_ref);
>  
>  	df->iommufd = device->group->iommufd;
>  	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
> @@ -560,7 +553,7 @@ static struct vfio_group *vfio_group_alloc(struct iommu_group *iommu_group,
>  
>  	refcount_set(&group->drivers, 1);
>  	mutex_init(&group->group_lock);
> -	spin_lock_init(&group->kvm_ref_lock);
> +	spin_lock_init(&group->kvm_ref.lock);
>  	INIT_LIST_HEAD(&group->device_list);
>  	mutex_init(&group->device_lock);
>  	group->iommu_group = iommu_group;
> @@ -884,13 +877,6 @@ bool vfio_group_enforced_coherent(struct vfio_group *group)
>  	return ret;
>  }
>  
> -void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
> -{
> -	spin_lock(&group->kvm_ref_lock);
> -	group->kvm = kvm;
> -	spin_unlock(&group->kvm_ref_lock);
> -}
> -
>  /**
>   * vfio_file_has_dev - True if the VFIO file is a handle for device
>   * @file: VFIO file to check
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index c26d1ad68105..a1f741365075 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -12,18 +12,23 @@
>  #include <linux/module.h>
>  #include <linux/vfio.h>
>  
> +struct kvm;
>  struct iommufd_ctx;
>  struct iommu_group;
>  struct vfio_container;
>  
> +struct vfio_kvm_reference {
> +	struct kvm			*kvm;
> +	spinlock_t			lock;
> +};
> +
>  struct vfio_device_file {
>  	struct vfio_device *device;
>  	struct vfio_group *group;
>  
>  	u8 access_granted;
>  	u32 devid; /* only valid when iommufd is valid */
> -	spinlock_t kvm_ref_lock; /* protect kvm field */
> -	struct kvm *kvm;
> +	struct vfio_kvm_reference kvm_ref;
>  	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
>  };
>  
> @@ -88,11 +93,10 @@ struct vfio_group {
>  #endif
>  	enum vfio_group_type		type;
>  	struct mutex			group_lock;
> -	struct kvm			*kvm;
> +	struct vfio_kvm_reference	kvm_ref;
>  	struct file			*opened_file;
>  	struct blocking_notifier_head	notifier;
>  	struct iommufd_ctx		*iommufd;
> -	spinlock_t			kvm_ref_lock;
>  	unsigned int			cdev_device_open_cnt;
>  };
>  
> @@ -108,7 +112,6 @@ void vfio_device_group_unuse_iommu(struct vfio_device *device);
>  void vfio_df_group_close(struct vfio_device_file *df);
>  struct vfio_group *vfio_group_from_file(struct file *file);
>  bool vfio_group_enforced_coherent(struct vfio_group *group);
> -void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm);
>  bool vfio_device_has_container(struct vfio_device *device);
>  int __init vfio_group_init(void);
>  void vfio_group_cleanup(void);
> @@ -171,10 +174,6 @@ static inline bool vfio_group_enforced_coherent(struct vfio_group *group)
>  	return true;
>  }
>  
> -static inline void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
> -{
> -}
> -
>  static inline bool vfio_device_has_container(struct vfio_device *device)
>  {
>  	return false;
> @@ -435,11 +434,12 @@ static inline void vfio_virqfd_exit(void)
>  #endif
>  
>  #if IS_ENABLED(CONFIG_KVM)
> -void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
> +void vfio_device_get_kvm_safe(struct vfio_device *device,
> +			      struct vfio_kvm_reference *ref);
>  void vfio_device_put_kvm(struct vfio_device *device);
>  #else
>  static inline void vfio_device_get_kvm_safe(struct vfio_device *device,
> -					    struct kvm *kvm)
> +					    struct vfio_kvm_reference *ref)
>  {
>  }
>  
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 124cc88966a7..e77e8c6aae2f 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -397,7 +397,7 @@ vfio_allocate_device_file(struct vfio_device *device)
>  		return ERR_PTR(-ENOMEM);
>  
>  	df->device = device;
> -	spin_lock_init(&df->kvm_ref_lock);
> +	spin_lock_init(&df->kvm_ref.lock);
>  
>  	return df;
>  }
> @@ -1303,7 +1303,8 @@ bool vfio_file_enforced_coherent(struct file *file)
>  EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
>  
>  #if IS_ENABLED(CONFIG_KVM)
> -void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
> +void vfio_device_get_kvm_safe(struct vfio_device *device,
> +			      struct vfio_kvm_reference *ref)
>  {
>  	void (*pfn)(struct kvm *kvm);
>  	bool (*fn)(struct kvm *kvm);
> @@ -1311,28 +1312,33 @@ void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
>  
>  	lockdep_assert_held(&device->dev_set->lock);
>  
> -	if (!kvm)
> -		return;
> +	spin_lock(&ref->lock);
> +
> +	if (!ref->kvm)
> +		goto out;
>  
>  	pfn = symbol_get(kvm_put_kvm);
>  	if (WARN_ON(!pfn))
> -		return;
> +		goto out;
>  
>  	fn = symbol_get(kvm_get_kvm_safe);
>  	if (WARN_ON(!fn)) {
>  		symbol_put(kvm_put_kvm);
> -		return;
> +		goto out;
>  	}
>  
> -	ret = fn(kvm);
> +	ret = fn(ref->kvm);
>  	symbol_put(kvm_get_kvm_safe);
>  	if (!ret) {
>  		symbol_put(kvm_put_kvm);
> -		return;
> +		goto out;
>  	}
>  
>  	device->put_kvm = pfn;
> -	device->kvm = kvm;
> +	device->kvm = ref->kvm;
> +
> +out:
> +	spin_unlock(&ref->lock);
>  }
>  
>  void vfio_device_put_kvm(struct vfio_device *device)
> @@ -1353,6 +1359,21 @@ void vfio_device_put_kvm(struct vfio_device *device)
>  	device->kvm = NULL;
>  }
>  
> +static void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
> +				struct kvm *kvm)
> +{
> +	spin_lock(&ref->lock);
> +	ref->kvm = kvm;
> +	spin_unlock(&ref->lock);
> +}
> +
> +static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
> +{
> +#if IS_ENABLED(CONFIG_VFIO_GROUP)
> +	vfio_device_set_kvm(&group->kvm_ref, kvm);
> +#endif
> +}
> +
>  static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
>  {
>  	struct vfio_device_file *df = file->private_data;
> @@ -1362,9 +1383,7 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
>  	 * be propagated to vfio_device::kvm when the file is bound to
>  	 * iommufd successfully in the vfio device cdev path.
>  	 */
> -	spin_lock(&df->kvm_ref_lock);
> -	df->kvm = kvm;
> -	spin_unlock(&df->kvm_ref_lock);
> +	vfio_device_set_kvm(&df->kvm_ref, kvm);
>  }
>  
>  /**

