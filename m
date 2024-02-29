Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3FD86C075
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 06:57:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G9gP8Rg+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlgTq5Zx2z3vYs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 16:57:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G9gP8Rg+;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlgT25DR6z3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 16:56:22 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TlgT24yYhz4wc5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 16:56:22 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TlgT24v19z4wc7; Thu, 29 Feb 2024 16:56:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G9gP8Rg+;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TlgT16sHhz4wc5
	for <linuxppc-dev@ozlabs.org>; Thu, 29 Feb 2024 16:56:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709186179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PAIgBGO6G8y2Ki/n2ZSEuvfNZqACiPoGuCSfmEbEjqA=;
	b=G9gP8Rg+ihq00DTriZMiPT855ZWlRMIhG7Pkcj4K3QSADRAPIavPSLto+ywUdpCkxZk0Bp
	bIwbMttn9vLLSj/t9612U00Z7YGrpKwE8/hjmvV6avwt/VwBsvrvDyGFg4LY20v+a75eaR
	6fwXp6brxkmguoisCkAcalwvAeQTU1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-5G5crAYXNOeAzyl6MYGvlA-1; Thu, 29 Feb 2024 00:56:13 -0500
X-MC-Unique: 5G5crAYXNOeAzyl6MYGvlA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B9FA845E61;
	Thu, 29 Feb 2024 05:56:12 +0000 (UTC)
Received: from localhost (unknown [10.72.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 920F6492BC6;
	Thu, 29 Feb 2024 05:56:10 +0000 (UTC)
Date: Thu, 29 Feb 2024 13:56:07 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v17 2/6] crash: add a new kexec flag for hotplug support
Message-ID: <ZeAcd8xPHVyRODOV@MiWiFi-R3L-srv>
References: <20240226084118.16310-1-sourabhjain@linux.ibm.com>
 <20240226084118.16310-3-sourabhjain@linux.ibm.com>
 <40de57a1-0a09-4c6a-bf38-04ea5dc2d48b@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <40de57a1-0a09-4c6a-bf38-04ea5dc2d48b@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

On 02/29/24 at 10:35am, Sourabh Jain wrote:
> Hello Baoquan,
> 
> Do you have any comments or suggestions for this patch series, especially
> for this patch?

Have applied this series and reviewing, will ack or add comment if any
concern. Thanks.

> On 26/02/24 14:11, Sourabh Jain wrote:
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
> >   include/linux/crash_core.h   | 13 ++++++-------
> >   include/linux/kexec.h        | 11 +++++++----
> >   include/uapi/linux/kexec.h   |  1 +
> >   kernel/crash_core.c          | 11 ++++-------
> >   kernel/kexec.c               |  4 ++--
> >   kernel/kexec_file.c          |  5 +++++
> >   10 files changed, 46 insertions(+), 42 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> > index cb1320ebbc23..ae5482a2f0ca 100644
> > --- a/arch/x86/include/asm/kexec.h
> > +++ b/arch/x86/include/asm/kexec.h
> > @@ -210,15 +210,8 @@ extern void kdump_nmi_shootdown_cpus(void);
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
> > index 2a682fe86352..f06501445cd9 100644
> > --- a/arch/x86/kernel/crash.c
> > +++ b/arch/x86/kernel/crash.c
> > @@ -402,20 +402,26 @@ int crash_load_segments(struct kimage *image)
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
> > index 5ae1496ccc06..a23489b8c8f0 100644
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
> > index c0436f46cfb7..67858eeb92ed 100644
> > --- a/drivers/base/memory.c
> > +++ b/drivers/base/memory.c
> > @@ -535,7 +535,7 @@ static DEVICE_ATTR_RW(auto_online_blocks);
> >   static ssize_t crash_hotplug_show(struct device *dev,
> >   				       struct device_attribute *attr, char *buf)
> >   {
> > -	return sysfs_emit(buf, "%d\n", crash_hotplug_memory_support());
> > +	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
> >   }
> >   static DEVICE_ATTR_RO(crash_hotplug);
> >   #endif
> > diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> > index 647e928efee8..44305336314e 100644
> > --- a/include/linux/crash_core.h
> > +++ b/include/linux/crash_core.h
> > @@ -40,14 +40,13 @@ static inline void arch_kexec_unprotect_crashkres(void) { }
> >   static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
> >   #endif
> > -int crash_check_update_elfcorehdr(void);
> > +int crash_check_hotplug_support(void);
> > -#ifndef crash_hotplug_cpu_support
> > -static inline int crash_hotplug_cpu_support(void) { return 0; }
> > -#endif
> > -
> > -#ifndef crash_hotplug_memory_support
> > -static inline int crash_hotplug_memory_support(void) { return 0; }
> > +#ifndef arch_crash_hotplug_support
> > +static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
> > +{
> > +	return 0;
> > +}
> >   #endif
> >   #ifndef crash_get_elfcorehdr_size
> > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> > index 060835bb82d5..5b93a5767413 100644
> > --- a/include/linux/kexec.h
> > +++ b/include/linux/kexec.h
> > @@ -319,8 +319,10 @@ struct kimage {
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
> > @@ -391,9 +393,10 @@ bool kexec_load_permitted(int kexec_image_type);
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
> > index 70fa8111a9d6..630c4fd7ea39 100644
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> > @@ -496,7 +496,7 @@ static DEFINE_MUTEX(__crash_hotplug_lock);
> >    * It reflects the kernel's ability/permission to update the crash
> >    * elfcorehdr directly.
> >    */
> > -int crash_check_update_elfcorehdr(void)
> > +int crash_check_hotplug_support(void)
> >   {
> >   	int rc = 0;
> > @@ -508,10 +508,7 @@ int crash_check_update_elfcorehdr(void)
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
> > @@ -552,8 +549,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
> >   	image = kexec_crash_image;
> > -	/* Check that updating elfcorehdr is permitted */
> > -	if (!(image->file_mode || image->update_elfcorehdr))
> > +	/* Check that kexec segments update is permitted */
> > +	if (!image->hotplug_support)
> >   		goto out;
> >   	if (hp_action == KEXEC_CRASH_HP_ADD_CPU ||
> > diff --git a/kernel/kexec.c b/kernel/kexec.c
> > index bab542fc1463..a6b3f96bb50c 100644
> > --- a/kernel/kexec.c
> > +++ b/kernel/kexec.c
> > @@ -135,8 +135,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
> >   		image->preserve_context = 1;
> >   #ifdef CONFIG_CRASH_HOTPLUG
> > -	if (flags & KEXEC_UPDATE_ELFCOREHDR)
> > -		image->update_elfcorehdr = 1;
> > +	if ((flags & KEXEC_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> > +		image->hotplug_support = 1;
> >   #endif
> >   	ret = machine_kexec_prepare(image);
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> > index 2d1db05fbf04..3d64290d24c9 100644
> > --- a/kernel/kexec_file.c
> > +++ b/kernel/kexec_file.c
> > @@ -376,6 +376,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
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

