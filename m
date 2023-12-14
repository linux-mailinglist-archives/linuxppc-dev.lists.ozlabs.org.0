Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9FB8132B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 15:14:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eQNLmfLt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrZ9L6JChz3cbL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 01:14:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eQNLmfLt;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrZ8W0gmwz30fF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 01:13:47 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SrZ8W06K9z4wby
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 01:13:47 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SrZ8W02Lpz4x1p; Fri, 15 Dec 2023 01:13:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eQNLmfLt;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SrZ8V3sDtz4wby
	for <linuxppc-dev@ozlabs.org>; Fri, 15 Dec 2023 01:13:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702563221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rWA4jrugxAphsdbeIh/acD095fJ5/82CDD3Wyi7fJAY=;
	b=eQNLmfLt7eR2ulX+ZMVxLzDKJB12X0FfnzG9FGoXhB0Gb+Q3Jee3aja4PR/dOxYJWz2Rc/
	v0hUEfDlxigWAhgtVRhoVKZ0CqZMyLcvdyirnrdC8ZHXnCuIlr3AKEQEXczrSdJ0PsY8s+
	bFwFL/r1YLdIAC0YWx+5CQXveLhqiUI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-sQoJWAN1MZCF3dhHJHsgwg-1; Thu, 14 Dec 2023 09:13:39 -0500
X-MC-Unique: sQoJWAN1MZCF3dhHJHsgwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D51E86EB22;
	Thu, 14 Dec 2023 14:13:37 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A46303C25;
	Thu, 14 Dec 2023 14:13:35 +0000 (UTC)
Date: Thu, 14 Dec 2023 22:13:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v14 2/6] crash: make CPU and Memory hotplug support
 reporting flexible
Message-ID: <ZXsNjTT7Ax9blFIt@MiWiFi-R3L-srv>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-3-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20231211083056.340404-3-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/11/23 at 02:00pm, Sourabh Jain wrote:
> Architectures' specific functions `arch_crash_hotplug_cpu_support()` and
> `arch_crash_hotplug_memory_support()` advertise the kernel's capability
> to update the kdump image on CPU and Memory hotplug events to userspace
> via the sysfs interface. These architecture-specific functions need to
> access various attributes of the `kexec_crash_image` object to determine
> whether the kernel can update the kdump image and advertise this
> information to userspace accordingly.
> 
> As the architecture-specific code is not exposed to the APIs required to
> acquire the lock for accessing the `kexec_crash_image` object, it calls
> a generic function, `crash_check_update_elfcorehdr()`, to determine
> whether the kernel can update the kdump image or not.
> 
> The lack of access to the `kexec_crash_image` object in
> architecture-specific code restricts architectures from performing
> additional architecture-specific checks required to determine if the
> kdump image is updatable or not. For instance, on PowerPC, the kernel
> can update the kdump image only if both the elfcorehdr and FDT are
> marked as updatable for the `kexec_load` system call.
> 
> So define two generic functions, `crash_hotplug_cpu_support()` and
> `crash_hotplug_memory_support()`, which are called when userspace
> attempts to read the crash CPU and Memory hotplug support via the sysfs
> interface. These functions take the necessary locks needed to access the
> `kexec_crash_image` object and then forward it to the
> architecture-specific handler to do the rest.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Akhil Raj <lf32.dev@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Borislav Petkov (AMD) <bp@alien8.de>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mimi Zohar <zohar@linux.ibm.com>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Vivek Goyal <vgoyal@redhat.com>
> Cc: kexec@lists.infradead.org
> Cc: x86@kernel.org
> ---
>  arch/x86/include/asm/kexec.h |  8 ++++----
>  arch/x86/kernel/crash.c      | 20 +++++++++++++++-----
>  include/linux/kexec.h        | 13 +++++++------
>  kernel/crash_core.c          | 23 +++++++++++++++++------
>  4 files changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 9bb6607e864e..5c88d27b086d 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -212,13 +212,13 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>  #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> -int arch_crash_hotplug_cpu_support(void);
> -#define crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
> +int arch_crash_hotplug_cpu_support(struct kimage *image);
> +#define arch_crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
>  #endif
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
> -int arch_crash_hotplug_memory_support(void);
> -#define crash_hotplug_memory_support arch_crash_hotplug_memory_support
> +int arch_crash_hotplug_memory_support(struct kimage *image);
> +#define arch_crash_hotplug_memory_support arch_crash_hotplug_memory_support
>  #endif
>  
>  unsigned int arch_crash_get_elfcorehdr_size(void);
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index 0d7b2657beb6..ad5941665589 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -398,18 +398,28 @@ int crash_load_segments(struct kimage *image)
>  #undef pr_fmt
>  #define pr_fmt(fmt) "crash hp: " fmt
>  
> -/* These functions provide the value for the sysfs crash_hotplug nodes */
> +#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_MEMORY_HOTPLUG)
> +static int crash_hotplug_support(struct kimage *image)
> +{
> +	if (image->file_mode)
> +		return 1;
> +
> +	return image->update_elfcorehdr;
> +}
> +#endif
> +
>  #ifdef CONFIG_HOTPLUG_CPU
> -int arch_crash_hotplug_cpu_support(void)
> +/* These functions provide the value for the sysfs crash_hotplug nodes */
> +int arch_crash_hotplug_cpu_support(struct kimage *image)
>  {
> -	return crash_check_update_elfcorehdr();
> +	return crash_hotplug_support(image);
>  }
>  #endif
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
> -int arch_crash_hotplug_memory_support(void)
> +int arch_crash_hotplug_memory_support(struct kimage *image)
>  {
> -	return crash_check_update_elfcorehdr();
> +	return crash_hotplug_support(image);
>  }
>  #endif
>  
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index ee28c09a7fb0..0f6ea35879ee 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -486,16 +486,17 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
>  static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>  #endif
>  
> -int crash_check_update_elfcorehdr(void);
> -
> -#ifndef crash_hotplug_cpu_support
> -static inline int crash_hotplug_cpu_support(void) { return 0; }
> +#ifndef arch_crash_hotplug_cpu_support
> +static inline int arch_crash_hotplug_cpu_support(struct kimage *image) { return 0; }
>  #endif
>  
> -#ifndef crash_hotplug_memory_support
> -static inline int crash_hotplug_memory_support(void) { return 0; }
> +#ifndef arch_crash_hotplug_memory_support
> +static inline int arch_crash_hotplug_memory_support(struct kimage *image) { return 0; }
>  #endif
>  
> +extern int crash_hotplug_cpu_support(void);
> +extern int crash_hotplug_memory_support(void);
> +
>  #ifndef crash_get_elfcorehdr_size
>  static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>  #endif
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index b9190265fe52..b621f03c1104 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -892,12 +892,14 @@ DEFINE_MUTEX(__crash_hotplug_lock);
>  #define crash_hotplug_lock() mutex_lock(&__crash_hotplug_lock)
>  #define crash_hotplug_unlock() mutex_unlock(&__crash_hotplug_lock)
>  
> +#define CPU_HOTPLUG	0
> +#define MEM_HOTPLUG	1
>  /*
>   * This routine utilized when the crash_hotplug sysfs node is read.
>   * It reflects the kernel's ability/permission to update the crash
>   * elfcorehdr directly.
>   */
> -int crash_check_update_elfcorehdr(void)
> +static int crash_hotplug_support(int hotplug)

Is it possible that we rename this function to different name? e.g
crash_hotplug_check_support() or other name. We may easily mixing it up
with the one of ARCH version. personal opinion.

>  {
>  	int rc = 0;
>  
> @@ -909,18 +911,27 @@ int crash_check_update_elfcorehdr(void)
>  		return 0;
>  	}
>  	if (kexec_crash_image) {
> -		if (kexec_crash_image->file_mode)
> -			rc = 1;
> -		else
> -			rc = kexec_crash_image->update_elfcorehdr;
> +		if (hotplug == CPU_HOTPLUG)
> +			rc = arch_crash_hotplug_cpu_support(kexec_crash_image);
> +		else if (hotplug == MEM_HOTPLUG)
> +			rc = arch_crash_hotplug_memory_support(kexec_crash_image);
>  	}
>  	/* Release lock now that update complete */
>  	kexec_unlock();
>  	crash_hotplug_unlock();
> -
>  	return rc;
>  }
>  
> +int crash_hotplug_cpu_support(void)
> +{
> +	return crash_hotplug_support(CPU_HOTPLUG);
> +}
> +
> +int crash_hotplug_memory_support(void)
> +{
> +	return crash_hotplug_support(MEM_HOTPLUG);
> +}
> +
>  /*
>   * To accurately reflect hot un/plug changes of cpu and memory resources
>   * (including onling and offlining of those resources), the elfcorehdr
> -- 
> 2.41.0
> 

