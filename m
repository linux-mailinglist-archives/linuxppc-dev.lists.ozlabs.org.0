Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9385F047
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 04:59:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXNesxzG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgKCM04kYz3dng
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 14:59:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXNesxzG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgKBc6XCLz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 14:58:48 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TgKBc607hz4wcr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 14:58:48 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TgKBc5fBcz4wcv; Thu, 22 Feb 2024 14:58:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXNesxzG;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TgKBc03W8z4wcr
	for <linuxppc-dev@ozlabs.org>; Thu, 22 Feb 2024 14:58:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708574325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2J33YZDn+KfsFi/tJqolkhzsiyyHCYRoprSVrNW8oos=;
	b=IXNesxzGuEx6lIkAgR31lQDQIzY1iMR8owemvfsNqjwQC60mhGT6y28wMzRnwHl4KxrBFn
	wvrOEHfmR4RGwJbNwcke/ClhkfBKRE63YnqHVK28I2AwlU14zUwVsE2FqdzJjUdPnlRgEZ
	enJG4nyA4aQjINR4YrO+Chu4Phf0vl8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-lDnyfuSXMfyEvG3a9BZUgg-1; Wed,
 21 Feb 2024 22:58:42 -0500
X-MC-Unique: lDnyfuSXMfyEvG3a9BZUgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 012F53810B0B;
	Thu, 22 Feb 2024 03:58:41 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61E7F40C94A8;
	Thu, 22 Feb 2024 03:58:38 +0000 (UTC)
Date: Thu, 22 Feb 2024 11:58:35 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v16 2/5] crash: add a new kexec flag for hotplug support
Message-ID: <ZdbGa/KR5n/wwb8t@MiWiFi-R3L-srv>
References: <20240217081452.164571-1-sourabhjain@linux.ibm.com>
 <20240217081452.164571-3-sourabhjain@linux.ibm.com>
 <8af4b0ec-9e0c-4023-ab66-98bb8e9f914d@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <8af4b0ec-9e0c-4023-ab66-98bb8e9f914d@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

On 02/22/24 at 09:01am, Sourabh Jain wrote:
> Hello Baoquan,
> 
> There are a lot of code movements introduced by your patch series, 'Split
> crash out from kexec and clean up related config items.'
> 
> https://lore.kernel.org/all/20240221125752.36fbfe9c307496313198b60f@linux-foundation.org/
> 
> Do you want me to rebase this patch series on top of the above patch series?

Yes, appreciate that, that would be very helpful. Rebasing this to
latest next/master. And I saw Hari's patch sereis, basically it's fine
to me. It will be great if this patch can sit on that patchset.

Thanks
Baoquan

> 
> On 17/02/24 13:44, Sourabh Jain wrote:
> > Commit a72bbec70da2 ("crash: hotplug support for kexec_load()")
> > introduced a new kexec flag, `KEXEC_UPDATE_ELFCOREHDR`. Kexec tool uses
> > this flag to indicate to the kernel that it is safe to modify the
> > elfcorehdr of the kdump image loaded using the kexec_load system call.
> > 
> > However, it is possible that architectures may need to update kexec
> > segments other then elfcorehdr. For example, FDT (Flatten Device Tree)
> > on PowerPC. Introducing a new kexec flag for every new kexec segment
> > may not be a good solution. Hence, a generic kexec flag bit,
> > `KEXEC_CRASH_HOTPLUG_SUPPORT`, is introduced to share the CPU/Memory
> > hotplug support intent between the kexec tool and the kernel for the
> > kexec_load system call.
> > 
> > Now, if the kexec tool sends KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag to
> > the kernel, it indicates to the kernel that all the required kexec
> > segment is skipped from SHA calculation and it is safe to update kdump
> > image loaded using the kexec_load syscall.
> > 
> > While loading the kdump image using the kexec_load syscall, the
> > @update_elfcorehdr member of struct kimage is set if the kexec tool
> > sends the KEXEC_UPDATE_ELFCOREHDR kexec flag. This member is later used
> > to determine whether it is safe to update elfcorehdr on hotplug events.
> > However, with the introduction of the KEXEC_CRASH_HOTPLUG_SUPPORT kexec
> > flag, the kexec tool could mark all the required kexec segments on an
> > architecture as safe to update. So rename the @update_elfcorehdr to
> > @hotplug_support. If @hotplug_support is set, the kernel can safely
> > update all the required kexec segments of the kdump image during
> > CPU/Memory hotplug events.
> > 
> > Introduce an architecture-specific function to process kexec flags for
> > determining hotplug support. Set the @hotplug_support member of struct
> > kimage for both kexec_load and kexec_file_load system calls. This
> > simplifies kernel checks to identify hotplug support for the currently
> > loaded kdump image by just examining the value of @hotplug_support.
> > 
> > Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> > Cc: Akhil Raj <lf32.dev@gmail.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> > Cc: Baoquan He <bhe@redhat.com>
> > Cc: Borislav Petkov (AMD) <bp@alien8.de>
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: Dave Young <dyoung@redhat.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Eric DeVolder <eric.devolder@oracle.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Hari Bathini <hbathini@linux.ibm.com>
> > Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
> > Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Mimi Zohar <zohar@linux.ibm.com>
> > Cc: Naveen N Rao <naveen@kernel.org>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: Vivek Goyal <vgoyal@redhat.com>
> > Cc: kexec@lists.infradead.org
> > Cc: x86@kernel.org
> > ---
> >   arch/x86/include/asm/kexec.h | 11 ++---------
> >   arch/x86/kernel/crash.c      | 28 +++++++++++++++++-----------
> >   drivers/base/cpu.c           |  2 +-
> >   drivers/base/memory.c        |  2 +-
> >   include/linux/kexec.h        | 27 +++++++++++++++++----------
> >   include/uapi/linux/kexec.h   |  1 +
> >   kernel/crash_core.c          | 11 ++++-------
> >   kernel/kexec.c               |  4 ++--
> >   kernel/kexec_file.c          |  5 +++++
> >   9 files changed, 50 insertions(+), 41 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> > index 9bb6607e864e..8be622e82ba8 100644
> > --- a/arch/x86/include/asm/kexec.h
> > +++ b/arch/x86/include/asm/kexec.h
> > @@ -211,15 +211,8 @@ extern void kdump_nmi_shootdown_cpus(void);
> >   void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
> >   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
> > -#ifdef CONFIG_HOTPLUG_CPU
> > -int arch_crash_hotplug_cpu_support(void);
> > -#define crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
> > -#endif
> > -
> > -#ifdef CONFIG_MEMORY_HOTPLUG
> > -int arch_crash_hotplug_memory_support(void);
> > -#define crash_hotplug_memory_support arch_crash_hotplug_memory_support
> > -#endif
> > +int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
> > +#define arch_crash_hotplug_support arch_crash_hotplug_support
> >   unsigned int arch_crash_get_elfcorehdr_size(void);
> >   #define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
> > diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> > index 44744e9c68ec..7072aaee2ea0 100644
> > --- a/arch/x86/kernel/crash.c
> > +++ b/arch/x86/kernel/crash.c
> > @@ -398,20 +398,26 @@ int crash_load_segments(struct kimage *image)
> >   #undef pr_fmt
> >   #define pr_fmt(fmt) "crash hp: " fmt
> > -/* These functions provide the value for the sysfs crash_hotplug nodes */
> > -#ifdef CONFIG_HOTPLUG_CPU
> > -int arch_crash_hotplug_cpu_support(void)
> > +int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
> >   {
> > -	return crash_check_update_elfcorehdr();
> > -}
> > -#endif
> > -#ifdef CONFIG_MEMORY_HOTPLUG
> > -int arch_crash_hotplug_memory_support(void)
> > -{
> > -	return crash_check_update_elfcorehdr();
> > -}
> > +#ifdef CONFIG_KEXEC_FILE
> > +	if (image->file_mode)
> > +		return 1;
> >   #endif
> > +	/*
> > +	 * Initially, crash hotplug support for kexec_load was added
> > +	 * with the KEXEC_UPDATE_ELFCOREHDR flag. Later, this
> > +	 * functionality was expanded to accommodate multiple kexec
> > +	 * segment updates, leading to the introduction of the
> > +	 * KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag bit. Consequently,
> > +	 * when the kexec tool sends either of these flags, it indicates
> > +	 * that the required kexec segment (elfcorehdr) is excluded from
> > +	 * the SHA calculation.
> > +	 */
> > +	return (kexec_flags & KEXEC_UPDATE_ELFCOREHDR ||
> > +		kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT);
> > +}
> >   unsigned int arch_crash_get_elfcorehdr_size(void)
> >   {
> > diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> > index 47de0f140ba6..24eb52607151 100644
> > --- a/drivers/base/cpu.c
> > +++ b/drivers/base/cpu.c
> > @@ -306,7 +306,7 @@ static ssize_t crash_hotplug_show(struct device *dev,
> >   				     struct device_attribute *attr,
> >   				     char *buf)
> >   {
> > -	return sysfs_emit(buf, "%d\n", crash_hotplug_cpu_support());
> > +	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
> >   }
> >   static DEVICE_ATTR_ADMIN_RO(crash_hotplug);
> >   #endif
> > diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> > index 14f964a7719b..b80be8193970 100644
> > --- a/drivers/base/memory.c
> > +++ b/drivers/base/memory.c
> > @@ -514,7 +514,7 @@ static DEVICE_ATTR_RW(auto_online_blocks);
> >   static ssize_t crash_hotplug_show(struct device *dev,
> >   				       struct device_attribute *attr, char *buf)
> >   {
> > -	return sysfs_emit(buf, "%d\n", crash_hotplug_memory_support());
> > +	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
> >   }
> >   static DEVICE_ATTR_RO(crash_hotplug);
> >   #endif
> > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> > index 802052d9c64b..175152b99cb7 100644
> > --- a/include/linux/kexec.h
> > +++ b/include/linux/kexec.h
> > @@ -317,8 +317,10 @@ struct kimage {
> >   	/* If set, we are using file mode kexec syscall */
> >   	unsigned int file_mode:1;
> >   #ifdef CONFIG_CRASH_HOTPLUG
> > -	/* If set, allow changes to elfcorehdr of kexec_load'd image */
> > -	unsigned int update_elfcorehdr:1;
> > +	/* If set, it is safe to update kexec segments that are
> > +	 * excluded from SHA calculation.
> > +	 */
> > +	unsigned int hotplug_support:1;
> >   #endif
> >   #ifdef ARCH_HAS_KIMAGE_ARCH
> > @@ -396,9 +398,10 @@ bool kexec_load_permitted(int kexec_image_type);
> >   /* List of defined/legal kexec flags */
> >   #ifndef CONFIG_KEXEC_JUMP
> > -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
> > +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_CRASH_HOTPLUG_SUPPORT)
> >   #else
> > -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
> > +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
> > +			KEXEC_CRASH_HOTPLUG_SUPPORT)
> >   #endif
> >   /* List of defined/legal kexec file flags */
> > @@ -486,14 +489,18 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
> >   static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
> >   #endif
> > -int crash_check_update_elfcorehdr(void);
> > +int crash_check_hotplug_support(void);
> > -#ifndef crash_hotplug_cpu_support
> > -static inline int crash_hotplug_cpu_support(void) { return 0; }
> > -#endif
> > +#ifndef arch_crash_hotplug_support
> > +static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
> > +{
> > -#ifndef crash_hotplug_memory_support
> > -static inline int crash_hotplug_memory_support(void) { return 0; }
> > +#ifdef CONFIG_KEXEC_FILE
> > +	if (image->file_mode)
> > +		return 1;
> > +#endif
> > +	return kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT;
> > +}
> >   #endif
> >   #ifndef crash_get_elfcorehdr_size
> > diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> > index c17bb096ea68..5ae1741ea8ea 100644
> > --- a/include/uapi/linux/kexec.h
> > +++ b/include/uapi/linux/kexec.h
> > @@ -13,6 +13,7 @@
> >   #define KEXEC_ON_CRASH		0x00000001
> >   #define KEXEC_PRESERVE_CONTEXT	0x00000002
> >   #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
> > +#define KEXEC_CRASH_HOTPLUG_SUPPORT 0x00000008
> >   #define KEXEC_ARCH_MASK		0xffff0000
> >   /*
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> > index b692ec5955de..3142884a5a5b 100644
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> > @@ -886,7 +886,7 @@ static DEFINE_MUTEX(__crash_hotplug_lock);
> >    * It reflects the kernel's ability/permission to update the crash
> >    * elfcorehdr directly.
> >    */
> > -int crash_check_update_elfcorehdr(void)
> > +int crash_check_hotplug_support(void)
> >   {
> >   	int rc = 0;
> > @@ -898,10 +898,7 @@ int crash_check_update_elfcorehdr(void)
> >   		return 0;
> >   	}
> >   	if (kexec_crash_image) {
> > -		if (kexec_crash_image->file_mode)
> > -			rc = 1;
> > -		else
> > -			rc = kexec_crash_image->update_elfcorehdr;
> > +		rc = kexec_crash_image->hotplug_support;
> >   	}
> >   	/* Release lock now that update complete */
> >   	kexec_unlock();
> > @@ -942,8 +939,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
> >   	image = kexec_crash_image;
> > -	/* Check that updating elfcorehdr is permitted */
> > -	if (!(image->file_mode || image->update_elfcorehdr))
> > +	/* Check that kexec segments update is permitted */
> > +	if (!image->hotplug_support)
> >   		goto out;
> >   	if (hp_action == KEXEC_CRASH_HP_ADD_CPU ||
> > diff --git a/kernel/kexec.c b/kernel/kexec.c
> > index 8f35a5a42af8..9dc5b7ed5b73 100644
> > --- a/kernel/kexec.c
> > +++ b/kernel/kexec.c
> > @@ -130,8 +130,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
> >   		image->preserve_context = 1;
> >   #ifdef CONFIG_CRASH_HOTPLUG
> > -	if (flags & KEXEC_UPDATE_ELFCOREHDR)
> > -		image->update_elfcorehdr = 1;
> > +	if ((flags & KEXEC_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> > +		image->hotplug_support = 1;
> >   #endif
> >   	ret = machine_kexec_prepare(image);
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> > index bef2f6f2571b..4dddf9264a69 100644
> > --- a/kernel/kexec_file.c
> > +++ b/kernel/kexec_file.c
> > @@ -373,6 +373,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
> >   	if (ret)
> >   		goto out;
> > +#ifdef CONFIG_CRASH_HOTPLUG
> > +	if ((flags & KEXEC_FILE_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> > +		image->hotplug_support = 1;
> > +#endif
> > +
> >   	ret = machine_kexec_prepare(image);
> >   	if (ret)
> >   		goto out;
> 

