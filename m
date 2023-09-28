Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F737B2868
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 00:24:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hgUc8sqz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hgUc8sqz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxSgq0DbBz3cmZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 08:24:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hgUc8sqz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hgUc8sqz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxSd06kFdz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 08:21:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT9am+jLmHorOzbZRxZ3QKMwJmosafd47BiiQuOc1Lw=;
	b=hgUc8sqzTnH/mSPVzvy2P9DhDFskybZw1lsg/2CppeFl09UTTaihCUCRxhbXbblrHvT39s
	TQhsGaKcBU8HIMWzo62Pl/jeDqE2z7BVP2UU20AdFmc/C+aPuDJ49OhQ1W4/JY3ArTAWd3
	dhXsKeZ61tTjhbZ/DUQX0TWmwY3U4QI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT9am+jLmHorOzbZRxZ3QKMwJmosafd47BiiQuOc1Lw=;
	b=hgUc8sqzTnH/mSPVzvy2P9DhDFskybZw1lsg/2CppeFl09UTTaihCUCRxhbXbblrHvT39s
	TQhsGaKcBU8HIMWzo62Pl/jeDqE2z7BVP2UU20AdFmc/C+aPuDJ49OhQ1W4/JY3ArTAWd3
	dhXsKeZ61tTjhbZ/DUQX0TWmwY3U4QI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-sS8Wjcv4P-as-eChq3TWrA-1; Thu, 28 Sep 2023 18:21:37 -0400
X-MC-Unique: sS8Wjcv4P-as-eChq3TWrA-1
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-77e41268d40so1638350439f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 15:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939696; x=1696544496;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rT9am+jLmHorOzbZRxZ3QKMwJmosafd47BiiQuOc1Lw=;
        b=P5+cD2MBafVN7lGhIb5DDKi92kp7y6PDBHjdSl7FHIowSbnMiqv0oy7SVkynkT+u0P
         jNAOvQd3i1wiMGrxz0oyI9mZ+jOeOgR4J7auLxgEmjoDUEsW0Rvfe5kSo74ZnrS/8UyO
         XqwpznT9olT5BHM0nSR0JdgT4x47yYPD/62piVhrbflLkYf8Lr/xvMFYV2mmvoBAqIt6
         OmFRJFQEUwMB3+ECabrPgCvTQw7N9Dq8VPLVwM2DpJuNHxGyc/AGgbtUD79nWqt3fm9e
         bamSQS1Gm92eQ+eq4RaP7cjic1WmxSRwxExa5vzAIdT4o7ddf5c2Snnxd/PdlWzdXFha
         FWlQ==
X-Gm-Message-State: AOJu0Yxij0WK9wHBKQpSH+uWbFKnpa1sPsxpP0cvlVVp4EGUZMrSIRfc
	Tizl8YYEHCOyczaaPeRulQN/kbx3PuY+5g/2gtPhJqyyrOTjwpLEi6oaaWBXzRDmhYeLth0cazj
	4QvGT/xBkfyBXPDefcn9h0ymiwg==
X-Received: by 2002:a6b:a12:0:b0:792:792e:6619 with SMTP id z18-20020a6b0a12000000b00792792e6619mr2822996ioi.2.1695939696196;
        Thu, 28 Sep 2023 15:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvHyy/Hemz69W4ceT0BNd5Cdmv5i7C45WBCarFFElXolFsYoe8vV4yGo1CGx8WsH3XpWDdNw==
X-Received: by 2002:a6b:a12:0:b0:792:792e:6619 with SMTP id z18-20020a6b0a12000000b00792792e6619mr2822961ioi.2.1695939695939;
        Thu, 28 Sep 2023 15:21:35 -0700 (PDT)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id t23-20020a02c497000000b0042b10d42c90sm4610172jam.113.2023.09.28.15.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:21:34 -0700 (PDT)
Date: Thu, 28 Sep 2023 16:21:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 01/26] vfio: Wrap KVM helpers with CONFIG_KVM instead of
 CONFIG_HAVE_KVM
Message-ID: <20230928162103.433f03db.alex.williamson@redhat.com>
In-Reply-To: <20230916003118.2540661-2-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-2-seanjc@google.com>
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

On Fri, 15 Sep 2023 17:30:53 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Wrap the helpers for getting references to KVM instances with a check on
> CONFIG_KVM being enabled, not on CONFIG_HAVE_KVM being defined.  PPC does
> NOT select HAVE_KVM, despite obviously supporting KVM, and guarding code
> to get references to KVM based on whether or not the architecture supports
> KVM is nonsensical.
> 
> Drop the guard around linux/kvm_host.h entirely, conditionally including a
> generic headers is completely unnecessary.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      | 2 +-
>  drivers/vfio/vfio_main.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)


Reviewed-by: Alex Williamson <alex.williamson@redhat.com>


> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 307e3f29b527..c26d1ad68105 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -434,7 +434,7 @@ static inline void vfio_virqfd_exit(void)
>  }
>  #endif
>  
> -#ifdef CONFIG_HAVE_KVM
> +#if IS_ENABLED(CONFIG_KVM)
>  void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
>  void vfio_device_put_kvm(struct vfio_device *device);
>  #else
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 40732e8ed4c6..80e39f7a6d8f 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -16,9 +16,7 @@
>  #include <linux/fs.h>
>  #include <linux/idr.h>
>  #include <linux/iommu.h>
> -#ifdef CONFIG_HAVE_KVM
>  #include <linux/kvm_host.h>
> -#endif
>  #include <linux/list.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> @@ -383,7 +381,7 @@ void vfio_unregister_group_dev(struct vfio_device *device)
>  }
>  EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
>  
> -#ifdef CONFIG_HAVE_KVM
> +#if IS_ENABLED(CONFIG_KVM)
>  void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
>  {
>  	void (*pfn)(struct kvm *kvm);

