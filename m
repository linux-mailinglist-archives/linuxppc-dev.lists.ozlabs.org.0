Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBA7B286D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 00:26:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ez/Uh1km;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ez/Uh1km;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxSkq6g5Rz3dM7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 08:26:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ez/Uh1km;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ez/Uh1km;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxSd92GQ8z3cVy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 08:21:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJlZv5KfytnzZmRqZMI7mLTWvvegYQeNtr0CrdJHxrc=;
	b=Ez/Uh1kmKg7MrjRNPCLulA36pOVjQ5gy+yOz1Jj2F1p7YDVNjgYUbnohzK5m8M6UMihyZI
	5Nir5HLf1gp7t9/HQZBBB6HClzl4nxU3aSfeXGRqbjnDrAU/ebPMJyYLmqfB83zPhdfkUg
	YN8894ftLye1JsVY6MxPTN61qhGbvyI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJlZv5KfytnzZmRqZMI7mLTWvvegYQeNtr0CrdJHxrc=;
	b=Ez/Uh1kmKg7MrjRNPCLulA36pOVjQ5gy+yOz1Jj2F1p7YDVNjgYUbnohzK5m8M6UMihyZI
	5Nir5HLf1gp7t9/HQZBBB6HClzl4nxU3aSfeXGRqbjnDrAU/ebPMJyYLmqfB83zPhdfkUg
	YN8894ftLye1JsVY6MxPTN61qhGbvyI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-UrSVPgWuOlqBXMpVCDukwg-1; Thu, 28 Sep 2023 18:21:45 -0400
X-MC-Unique: UrSVPgWuOlqBXMpVCDukwg-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-780addd7382so1693225439f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 15:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939704; x=1696544504;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJlZv5KfytnzZmRqZMI7mLTWvvegYQeNtr0CrdJHxrc=;
        b=QjATh0Rvd10k50Lals9BgzvWem5SAExqIeoqULUC9ObUbvn1rowMOOl4TN5JVlNH6a
         CHSiBXodbjtROke6B8Zt0lMKHFk4m4Ib2dxBsP+JLTjM2Pub4j9pqFABD+jY7Q76pELI
         XF08MaT6fMufRB6t60gXzGqRPmft7fkTod+WNTShBxSn0lXxRLnuH9L1y575ib1mPphD
         df2O71H9sJgQmbH7vuXWr3JcqH2CQvL8M+V5XbLHQ/Yg+TlNd+HE1RSKlW2lx7NOZVsW
         5WXct911w+/bZ+uWnPIofgwoFegsMfHI8HSbB/qnIgnvE7tT1J+jQc3TSPjTIMpHv1o4
         asAA==
X-Gm-Message-State: AOJu0YyfcwKxQYItvybDVgrAnM+rb2352Q+/6etwqbfqc60Lbg1gyM02
	vZG5uKZFMsecQPQLKUIe176yew5yadNI6YEfWNLKfUvJqvuRozB/INFKQxqltU6l8XFfS5bjS9c
	NJwaWic2ZW7oyqXeHRxaGSqG6HQ==
X-Received: by 2002:a5e:9e09:0:b0:795:8805:1378 with SMTP id i9-20020a5e9e09000000b0079588051378mr2451933ioq.9.1695939704273;
        Thu, 28 Sep 2023 15:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAEb9IDAtgYjj6uLy0BK3ZEot+uDPg45XlWdcKZXMCg89/F3JSTuwB2CMQYAcH0oVDsnNUFw==
X-Received: by 2002:a5e:9e09:0:b0:795:8805:1378 with SMTP id i9-20020a5e9e09000000b0079588051378mr2451906ioq.9.1695939703976;
        Thu, 28 Sep 2023 15:21:43 -0700 (PDT)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id t23-20020a02c497000000b0042b10d42c90sm4610172jam.113.2023.09.28.15.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:21:42 -0700 (PDT)
Date: Thu, 28 Sep 2023 16:21:05 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 02/26] vfio: Move KVM get/put helpers to colocate it
 with other KVM related code
Message-ID: <20230928162105.2e347cd5.alex.williamson@redhat.com>
In-Reply-To: <20230916003118.2540661-3-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-3-seanjc@google.com>
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

On Fri, 15 Sep 2023 17:30:54 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Move the definitions of vfio_device_get_kvm_safe() and vfio_device_put_kvm()
> down in vfio_main.c to colocate them with other KVM-specific functions,
> e.g. to allow wrapping them all with a single CONFIG_KVM check.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio_main.c | 104 +++++++++++++++++++--------------------
>  1 file changed, 52 insertions(+), 52 deletions(-)


Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 80e39f7a6d8f..6368eed7b7b2 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -381,58 +381,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
>  }
>  EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
>  
> -#if IS_ENABLED(CONFIG_KVM)
> -void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
> -{
> -	void (*pfn)(struct kvm *kvm);
> -	bool (*fn)(struct kvm *kvm);
> -	bool ret;
> -
> -	lockdep_assert_held(&device->dev_set->lock);
> -
> -	if (!kvm)
> -		return;
> -
> -	pfn = symbol_get(kvm_put_kvm);
> -	if (WARN_ON(!pfn))
> -		return;
> -
> -	fn = symbol_get(kvm_get_kvm_safe);
> -	if (WARN_ON(!fn)) {
> -		symbol_put(kvm_put_kvm);
> -		return;
> -	}
> -
> -	ret = fn(kvm);
> -	symbol_put(kvm_get_kvm_safe);
> -	if (!ret) {
> -		symbol_put(kvm_put_kvm);
> -		return;
> -	}
> -
> -	device->put_kvm = pfn;
> -	device->kvm = kvm;
> -}
> -
> -void vfio_device_put_kvm(struct vfio_device *device)
> -{
> -	lockdep_assert_held(&device->dev_set->lock);
> -
> -	if (!device->kvm)
> -		return;
> -
> -	if (WARN_ON(!device->put_kvm))
> -		goto clear;
> -
> -	device->put_kvm(device->kvm);
> -	device->put_kvm = NULL;
> -	symbol_put(kvm_put_kvm);
> -
> -clear:
> -	device->kvm = NULL;
> -}
> -#endif
> -
>  /* true if the vfio_device has open_device() called but not close_device() */
>  static bool vfio_assert_device_open(struct vfio_device *device)
>  {
> @@ -1354,6 +1302,58 @@ bool vfio_file_enforced_coherent(struct file *file)
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
>  
> +#if IS_ENABLED(CONFIG_KVM)
> +void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
> +{
> +	void (*pfn)(struct kvm *kvm);
> +	bool (*fn)(struct kvm *kvm);
> +	bool ret;
> +
> +	lockdep_assert_held(&device->dev_set->lock);
> +
> +	if (!kvm)
> +		return;
> +
> +	pfn = symbol_get(kvm_put_kvm);
> +	if (WARN_ON(!pfn))
> +		return;
> +
> +	fn = symbol_get(kvm_get_kvm_safe);
> +	if (WARN_ON(!fn)) {
> +		symbol_put(kvm_put_kvm);
> +		return;
> +	}
> +
> +	ret = fn(kvm);
> +	symbol_put(kvm_get_kvm_safe);
> +	if (!ret) {
> +		symbol_put(kvm_put_kvm);
> +		return;
> +	}
> +
> +	device->put_kvm = pfn;
> +	device->kvm = kvm;
> +}
> +
> +void vfio_device_put_kvm(struct vfio_device *device)
> +{
> +	lockdep_assert_held(&device->dev_set->lock);
> +
> +	if (!device->kvm)
> +		return;
> +
> +	if (WARN_ON(!device->put_kvm))
> +		goto clear;
> +
> +	device->put_kvm(device->kvm);
> +	device->put_kvm = NULL;
> +	symbol_put(kvm_put_kvm);
> +
> +clear:
> +	device->kvm = NULL;
> +}
> +#endif
> +
>  static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
>  {
>  	struct vfio_device_file *df = file->private_data;

