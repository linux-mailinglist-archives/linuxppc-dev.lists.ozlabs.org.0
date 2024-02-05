Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C708492AC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 04:11:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ftH8e7Wy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSrxW6yzXz3c3l
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 14:11:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ftH8e7Wy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSrwl6bT9z2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 14:10:31 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TSrwh1Q8Vz4wp3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 14:10:28 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TSrwh1DbFz4wxx; Mon,  5 Feb 2024 14:10:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ftH8e7Wy;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TSrwg4yxKz4wp3
	for <linuxppc-dev@ozlabs.org>; Mon,  5 Feb 2024 14:10:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707102623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qivc//1MsMgLC1+oQSLS/D2iPWYIjtk7dnlMmFMvk7w=;
	b=ftH8e7WyBYRXQ34wVg5KP3hioI+AIvd6szRuTARQB1fMCH9RtBJ6AvSi+HwP/FhdJoJ5Qx
	XlbEmgxdOlLnILt3Q7GNtVVM3WGGDz45sfsvVIEFarxaJYQrBrxPVuIEnW0H6N8SyKm8dQ
	ZMG14VZH4PMewkFJ1UxE2Kb9jfDiGL8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-EbFoXx9iN9esLaMZ7WX1uA-1; Sun, 04 Feb 2024 22:10:19 -0500
X-MC-Unique: EbFoXx9iN9esLaMZ7WX1uA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B078285A589;
	Mon,  5 Feb 2024 03:10:18 +0000 (UTC)
Received: from localhost (unknown [10.72.116.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 155841C060AF;
	Mon,  5 Feb 2024 03:10:17 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:10:13 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v15 2/5] crash: add a new kexec flag for hotplug support
Message-ID: <ZcBRle7szFrD3cW+@MiWiFi-R3L-srv>
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
 <20240111105138.251366-3-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20240111105138.251366-3-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

Hi Sourabh,

Thanks for the great work. There are some concerns, please see inline
comments.

On 01/11/24 at 04:21pm, Sourabh Jain wrote:
......
> Now, if the kexec tool sends KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag to
> the kernel, it indicates to the kernel that all the required kexec
> segment is skipped from SHA calculation and it is safe to update kdump
> image loaded using the kexec_load syscall.

So finally you add a new KEXEC_CRASH_HOTPLUG_SUPPORT flag, that's fine.

> 
...... 
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 9bb6607e864e..e791129fdf6c 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -211,6 +211,9 @@ extern void kdump_nmi_shootdown_cpus(void);
>  void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>  #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>  
> +int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
> +#define arch_crash_hotplug_support arch_crash_hotplug_support
> +
>  #ifdef CONFIG_HOTPLUG_CPU
>  int arch_crash_hotplug_cpu_support(void);
>  #define crash_hotplug_cpu_support arch_crash_hotplug_cpu_support

Then crash_hotplug_cpu_support is not needed any more on x86_64, and
crash_hotplug_memory_support(), if you remove their implementation in
arch/x86/kernel/crash.c, won't it cause building warning or error on x86?

> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index 44744e9c68ec..293b54bff706 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -398,20 +398,16 @@ int crash_load_segments(struct kimage *image)
>  #undef pr_fmt
>  #define pr_fmt(fmt) "crash hp: " fmt
>  
> -/* These functions provide the value for the sysfs crash_hotplug nodes */
> -#ifdef CONFIG_HOTPLUG_CPU
> -int arch_crash_hotplug_cpu_support(void)
> +int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
>  {
> -	return crash_check_update_elfcorehdr();
> -}
> -#endif
>  
> -#ifdef CONFIG_MEMORY_HOTPLUG
> -int arch_crash_hotplug_memory_support(void)
> -{
> -	return crash_check_update_elfcorehdr();
> -}
> +#ifdef CONFIG_KEXEC_FILE
> +	if (image->file_mode)
> +		return 1;
>  #endif
> +	return (kexec_flags & KEXEC_UPDATE_ELFCOREHDR ||
> +		kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT);

Do we need add some document to tell why there are two kexec flags on
x86_64, except of checking this patch log?

> +}
>  
>  unsigned int arch_crash_get_elfcorehdr_size(void)
>  {
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 548491de818e..2f411ddfbd8b 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -306,7 +306,7 @@ static ssize_t crash_hotplug_show(struct device *dev,
>  				     struct device_attribute *attr,
>  				     char *buf)
>  {
> -	return sysfs_emit(buf, "%d\n", crash_hotplug_cpu_support());
> +	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
>  }
>  static DEVICE_ATTR_ADMIN_RO(crash_hotplug);
>  #endif
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8a13babd826c..e70ab1d3428e 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -514,7 +514,7 @@ static DEVICE_ATTR_RW(auto_online_blocks);
>  static ssize_t crash_hotplug_show(struct device *dev,
>  				       struct device_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%d\n", crash_hotplug_memory_support());
> +	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
>  }
>  static DEVICE_ATTR_RO(crash_hotplug);
>  #endif
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 802052d9c64b..7880d74dc5c4 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -317,8 +317,8 @@ struct kimage {
>  	/* If set, we are using file mode kexec syscall */
>  	unsigned int file_mode:1;
>  #ifdef CONFIG_CRASH_HOTPLUG
> -	/* If set, allow changes to elfcorehdr of kexec_load'd image */
> -	unsigned int update_elfcorehdr:1;
> +	/* If set, allow changes to kexec segments of kexec_load'd image */

The code comment doesn't reflect the usage of the flag. You set it too
when it's kexec_file_load. Speaking of this, I do wonder why you need
set it too for kexec_file_load, and why we have
arch_crash_hotplug_support(), then crash_check_hotplug_support() both of
which have the same effect.

> +	unsigned int hotplug_support:1;
>  #endif
>  
>  #ifdef ARCH_HAS_KIMAGE_ARCH
> @@ -396,9 +396,10 @@ bool kexec_load_permitted(int kexec_image_type);
>  
>  /* List of defined/legal kexec flags */
>  #ifndef CONFIG_KEXEC_JUMP
> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_CRASH_HOTPLUG_SUPPORT)
>  #else
> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
> +			KEXEC_CRASH_HOTPLUG_SUPPORT)
>  #endif
>  
>  /* List of defined/legal kexec file flags */
> @@ -486,14 +487,18 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
>  static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>  #endif
>  
> -int crash_check_update_elfcorehdr(void);
> +int crash_check_hotplug_support(void);
>  
> -#ifndef crash_hotplug_cpu_support
> -static inline int crash_hotplug_cpu_support(void) { return 0; }
> -#endif
> +#ifndef arch_crash_hotplug_support
> +static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
> +{
>  
> -#ifndef crash_hotplug_memory_support
> -static inline int crash_hotplug_memory_support(void) { return 0; }
> +#ifdef CONFIG_KEXEC_FILE
> +	if (image->file_mode)
> +		return 1;
> +#endif
> +	return kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT;
> +}
>  #endif
>  
>  #ifndef crash_get_elfcorehdr_size
> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> index c17bb096ea68..5ae1741ea8ea 100644
> --- a/include/uapi/linux/kexec.h
> +++ b/include/uapi/linux/kexec.h
> @@ -13,6 +13,7 @@
>  #define KEXEC_ON_CRASH		0x00000001
>  #define KEXEC_PRESERVE_CONTEXT	0x00000002
>  #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
> +#define KEXEC_CRASH_HOTPLUG_SUPPORT 0x00000008
>  #define KEXEC_ARCH_MASK		0xffff0000
>  
>  /*
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index ab1c8e79759d..111548ad03e9 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -876,7 +876,7 @@ DEFINE_MUTEX(__crash_hotplug_lock);
>   * It reflects the kernel's ability/permission to update the crash
>   * elfcorehdr directly.
>   */
> -int crash_check_update_elfcorehdr(void)
> +int crash_check_hotplug_support(void)
>  {
>  	int rc = 0;
>  
> @@ -888,10 +888,7 @@ int crash_check_update_elfcorehdr(void)
>  		return 0;
>  	}
>  	if (kexec_crash_image) {
> -		if (kexec_crash_image->file_mode)
> -			rc = 1;
> -		else
> -			rc = kexec_crash_image->update_elfcorehdr;
> +		rc = kexec_crash_image->hotplug_support;
>  	}
>  	/* Release lock now that update complete */
>  	kexec_unlock();
> @@ -932,8 +929,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>  
>  	image = kexec_crash_image;
>  
> -	/* Check that updating elfcorehdr is permitted */
> -	if (!(image->file_mode || image->update_elfcorehdr))
> +	/* Check that kexec segments update is permitted */
> +	if (!image->hotplug_support)
>  		goto out;
>  
>  	if (hp_action == KEXEC_CRASH_HP_ADD_CPU ||
> diff --git a/kernel/kexec.c b/kernel/kexec.c
> index 8f35a5a42af8..9dc5b7ed5b73 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -130,8 +130,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>  		image->preserve_context = 1;
>  
>  #ifdef CONFIG_CRASH_HOTPLUG
> -	if (flags & KEXEC_UPDATE_ELFCOREHDR)
> -		image->update_elfcorehdr = 1;
> +	if ((flags & KEXEC_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> +		image->hotplug_support = 1;
>  #endif
>  
>  	ret = machine_kexec_prepare(image);
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index bef2f6f2571b..4dddf9264a69 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -373,6 +373,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
>  	if (ret)
>  		goto out;
>  
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	if ((flags & KEXEC_FILE_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> +		image->hotplug_support = 1;
> +#endif
> +
>  	ret = machine_kexec_prepare(image);
>  	if (ret)
>  		goto out;
> -- 
> 2.41.0
> 

