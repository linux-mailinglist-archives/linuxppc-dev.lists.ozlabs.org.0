Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D697B286B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 00:25:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QK7ZB960;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QK7ZB960;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxSjj6H2Cz3ddQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 08:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QK7ZB960;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QK7ZB960;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxSd80QkDz3cRR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 08:21:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFHyzwss0VIynmY6kq9IQqsmynTMCUyfW9NTpB4UhBc=;
	b=QK7ZB960pny44wkGO8Lu6Oq6bVnkadUkpGA7OqKEsVFOeU3GgGs+WCnbHQx9xYyzPFd3bR
	9brUly6DnraN+NgW0CFFcCq12Ce4MFZ7sSl5Vx5BsuJSaOxnaUSVzdC1FLdip0mOWQSr0t
	IEolwhK1s2BWvRY13shPrWU+WDTpezY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFHyzwss0VIynmY6kq9IQqsmynTMCUyfW9NTpB4UhBc=;
	b=QK7ZB960pny44wkGO8Lu6Oq6bVnkadUkpGA7OqKEsVFOeU3GgGs+WCnbHQx9xYyzPFd3bR
	9brUly6DnraN+NgW0CFFcCq12Ce4MFZ7sSl5Vx5BsuJSaOxnaUSVzdC1FLdip0mOWQSr0t
	IEolwhK1s2BWvRY13shPrWU+WDTpezY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-wRmjdGeuOtGqfEoBBbB5ZA-1; Thu, 28 Sep 2023 18:21:41 -0400
X-MC-Unique: wRmjdGeuOtGqfEoBBbB5ZA-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-79524453b83so1690120139f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 15:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939701; x=1696544501;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFHyzwss0VIynmY6kq9IQqsmynTMCUyfW9NTpB4UhBc=;
        b=cQHUKIFP+54Ffy1Be6epbgPSjM+VgJD5LffzJwft8KrKCIjkVAtMJ6jPS0ITB19n+q
         DdtXUI+VYfoqi3a0CnxkAl51lQ6P6ewP3gQWDbpyyBuWaNT7YXMIa2mD2q9ypx1al1KP
         3DVS1QfSdCn5vqfe5/h45Ey3KX2UcI5eWXbUKqzeMKqPe9e9NvuiuiBrlDxamskWW7eK
         LcmHg38AYBeP4gWLRX0z5yunZOi1RWqcyih6qVrAtJIYBJVoYWTcSMfpx3J2JFscz+hz
         DHdTVzeXLj8ED45mbmVHkBQPXdiOTStg7D/bqQCY7AiOpZMqbeYnzGdE8lVy0zawlFS3
         hMrA==
X-Gm-Message-State: AOJu0YwYWE8QRgKf1SEf8+cgLwwU2Zohwg+N9WTs2lUdTF56zRlGFScC
	lKQJbhR2EofkS49yUCZxoO576On7vbbztvjtLg/A119jtpjXcOQzc2BziDDGcKYonOq5Phz4c6e
	4LYgCKJu1cORqf0XVfGAFoj7jeQ==
X-Received: by 2002:a5e:dc47:0:b0:79f:d671:c732 with SMTP id s7-20020a5edc47000000b0079fd671c732mr2854259iop.10.1695939700856;
        Thu, 28 Sep 2023 15:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiCbLuQ0Q0F99MyiikSRjNnpDxGqSEfKTVOj2RSJeVdREsU50q+AO2JmnXeHZUyrPp7Fb80Q==
X-Received: by 2002:a5e:dc47:0:b0:79f:d671:c732 with SMTP id s7-20020a5edc47000000b0079fd671c732mr2854217iop.10.1695939700529;
        Thu, 28 Sep 2023 15:21:40 -0700 (PDT)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id t23-20020a02c497000000b0042b10d42c90sm4610172jam.113.2023.09.28.15.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:21:39 -0700 (PDT)
Date: Thu, 28 Sep 2023 16:21:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
Message-ID: <20230928162109.42391b48.alex.williamson@redhat.com>
In-Reply-To: <20230916003118.2540661-6-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-6-seanjc@google.com>
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

On Fri, 15 Sep 2023 17:30:57 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> KVM and VFIO do symbol lookups increases the overall complexity and places
> an unnecessary dependency on KVM (from VFIO) without adding any value.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      |  2 ++
>  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
>  include/linux/vfio.h     |  4 ++-
>  virt/kvm/vfio.c          |  9 +++--
>  4 files changed, 47 insertions(+), 42 deletions(-)


Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

 
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index a1f741365075..eec51c7ee822 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -19,6 +19,8 @@ struct vfio_container;
>  
>  struct vfio_kvm_reference {
>  	struct kvm			*kvm;
> +	bool				(*get_kvm)(struct kvm *kvm);
> +	void				(*put_kvm)(struct kvm *kvm);
>  	spinlock_t			lock;
>  };
>  
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index e77e8c6aae2f..1f58ab6dbcd2 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -16,7 +16,6 @@
>  #include <linux/fs.h>
>  #include <linux/idr.h>
>  #include <linux/iommu.h>
> -#include <linux/kvm_host.h>
>  #include <linux/list.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> @@ -1306,38 +1305,22 @@ EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
>  void vfio_device_get_kvm_safe(struct vfio_device *device,
>  			      struct vfio_kvm_reference *ref)
>  {
> -	void (*pfn)(struct kvm *kvm);
> -	bool (*fn)(struct kvm *kvm);
> -	bool ret;
> -
>  	lockdep_assert_held(&device->dev_set->lock);
>  
> +	/*
> +	 * Note!  The "kvm" and "put_kvm" pointers *must* be transferred to the
> +	 * device so that the device can put its reference to KVM.  KVM can
> +	 * invoke vfio_device_set_kvm() to detach from VFIO, i.e. nullify all
> +	 * pointers in @ref, even if a device holds a reference to KVM!  That
> +	 * also means that detaching KVM from VFIO only prevents "new" devices
> +	 * from using KVM, it doesn't invalidate KVM references in existing
> +	 * devices.
> +	 */
>  	spin_lock(&ref->lock);
> -
> -	if (!ref->kvm)
> -		goto out;
> -
> -	pfn = symbol_get(kvm_put_kvm);
> -	if (WARN_ON(!pfn))
> -		goto out;
> -
> -	fn = symbol_get(kvm_get_kvm_safe);
> -	if (WARN_ON(!fn)) {
> -		symbol_put(kvm_put_kvm);
> -		goto out;
> +	if (ref->kvm && ref->get_kvm(ref->kvm)) {
> +		device->kvm = ref->kvm;
> +		device->put_kvm = ref->put_kvm;
>  	}
> -
> -	ret = fn(ref->kvm);
> -	symbol_put(kvm_get_kvm_safe);
> -	if (!ret) {
> -		symbol_put(kvm_put_kvm);
> -		goto out;
> -	}
> -
> -	device->put_kvm = pfn;
> -	device->kvm = ref->kvm;
> -
> -out:
>  	spin_unlock(&ref->lock);
>  }
>  
> @@ -1353,28 +1336,37 @@ void vfio_device_put_kvm(struct vfio_device *device)
>  
>  	device->put_kvm(device->kvm);
>  	device->put_kvm = NULL;
> -	symbol_put(kvm_put_kvm);
> -
>  clear:
>  	device->kvm = NULL;
>  }
>  
>  static void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
> -				struct kvm *kvm)
> +				struct kvm *kvm,
> +				bool (*get_kvm)(struct kvm *kvm),
> +				void (*put_kvm)(struct kvm *kvm))
>  {
> +	if (WARN_ON_ONCE(kvm && (!get_kvm || !put_kvm)))
> +		return;
> +
>  	spin_lock(&ref->lock);
>  	ref->kvm = kvm;
> +	ref->get_kvm = get_kvm;
> +	ref->put_kvm = put_kvm;
>  	spin_unlock(&ref->lock);
>  }
>  
> -static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
> +static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm,
> +			       bool (*get_kvm)(struct kvm *kvm),
> +			       void (*put_kvm)(struct kvm *kvm))
>  {
>  #if IS_ENABLED(CONFIG_VFIO_GROUP)
> -	vfio_device_set_kvm(&group->kvm_ref, kvm);
> +	vfio_device_set_kvm(&group->kvm_ref, kvm, get_kvm, put_kvm);
>  #endif
>  }
>  
> -static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
> +static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm,
> +				     bool (*get_kvm)(struct kvm *kvm),
> +				     void (*put_kvm)(struct kvm *kvm))
>  {
>  	struct vfio_device_file *df = file->private_data;
>  
> @@ -1383,27 +1375,31 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
>  	 * be propagated to vfio_device::kvm when the file is bound to
>  	 * iommufd successfully in the vfio device cdev path.
>  	 */
> -	vfio_device_set_kvm(&df->kvm_ref, kvm);
> +	vfio_device_set_kvm(&df->kvm_ref, kvm, get_kvm, put_kvm);
>  }
>  
>  /**
>   * vfio_file_set_kvm - Link a kvm with VFIO drivers
>   * @file: VFIO group file or VFIO device file
>   * @kvm: KVM to link
> + * @get_kvm: Callback to get a reference to @kvm
> + * @put_kvm: Callback to put a reference to @kvm
>   *
>   * When a VFIO device is first opened the KVM will be available in
>   * device->kvm if one was associated with the file.
>   */
> -void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
> +void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
> +		       bool (*get_kvm)(struct kvm *kvm),
> +		       void (*put_kvm)(struct kvm *kvm))
>  {
>  	struct vfio_group *group;
>  
>  	group = vfio_group_from_file(file);
>  	if (group)
> -		vfio_group_set_kvm(group, kvm);
> +		vfio_group_set_kvm(group, kvm, get_kvm, put_kvm);
>  
>  	if (vfio_device_from_file(file))
> -		vfio_device_file_set_kvm(file, kvm);
> +		vfio_device_file_set_kvm(file, kvm, get_kvm, put_kvm);
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
>  #endif
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e80955de266c..35e970e3d3fb 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -312,7 +312,9 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
>  bool vfio_file_is_valid(struct file *file);
>  bool vfio_file_enforced_coherent(struct file *file);
>  #if IS_ENABLED(CONFIG_KVM)
> -void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
> +void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
> +		       bool (*get_kvm)(struct kvm *kvm),
> +		       void (*put_kvm)(struct kvm *kvm));
>  #endif
>  
>  #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
> diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
> index ca24ce120906..f14fcbb34bc6 100644
> --- a/virt/kvm/vfio.c
> +++ b/virt/kvm/vfio.c
> @@ -37,13 +37,18 @@ struct kvm_vfio {
>  
>  static void kvm_vfio_file_set_kvm(struct file *file, struct kvm *kvm)
>  {
> -	void (*fn)(struct file *file, struct kvm *kvm);
> +	void (*fn)(struct file *file, struct kvm *kvm,
> +		   bool (*get_kvm)(struct kvm *kvm),
> +		   void (*put_kvm)(struct kvm *kvm));
>  
>  	fn = symbol_get(vfio_file_set_kvm);
>  	if (!fn)
>  		return;
>  
> -	fn(file, kvm);
> +	if (kvm)
> +		fn(file, kvm, kvm_get_kvm_safe, kvm_put_kvm);
> +	else
> +		fn(file, kvm, NULL, NULL);
>  
>  	symbol_put(vfio_file_set_kvm);
>  }

