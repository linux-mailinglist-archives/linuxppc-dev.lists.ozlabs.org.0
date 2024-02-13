Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089088527B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 04:22:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f6RLQHjJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYmpL4pz9z3dV3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 14:22:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f6RLQHjJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYmnZ4qC4z3bn0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 14:21:22 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TYmnX6MJmz4wxx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 14:21:20 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TYmnX63jJz4wyr; Tue, 13 Feb 2024 14:21:20 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f6RLQHjJ;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TYmnX2bwsz4wxx
	for <linuxppc-dev@ozlabs.org>; Tue, 13 Feb 2024 14:21:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707794475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FfgfhhR1Sp5K6tynZua/CXQcXYMTqRCAqc8M/+9/nR0=;
	b=f6RLQHjJsvI67U3DvMPhdkM5V+hWRPfhuBS/jlnMPoIh788Bza7JBvK5oyBhR0Qg6CZnLl
	zU1E3GGyNDCVVPptgBUp7EVaMmr+q/Aoc1O05suAS6rf4A4Az1jzhenDVRBJLo/BRXm2ax
	7cdP7Nu9zKBHbriX3Gpekhn3LQqZIcA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-ygDcdn5FO2eqML2zuzcgKw-1; Mon,
 12 Feb 2024 22:21:10 -0500
X-MC-Unique: ygDcdn5FO2eqML2zuzcgKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF97628237C0;
	Tue, 13 Feb 2024 03:21:08 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EBD92166B31;
	Tue, 13 Feb 2024 03:21:06 +0000 (UTC)
Date: Tue, 13 Feb 2024 11:21:02 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v15 2/5] crash: add a new kexec flag for hotplug support
Message-ID: <ZcrgHvTbDGbXc894@MiWiFi-R3L-srv>
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
 <20240111105138.251366-3-sourabhjain@linux.ibm.com>
 <ZcBRle7szFrD3cW+@MiWiFi-R3L-srv>
 <cc02538f-9460-4cbb-9ae4-194412b85e36@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <cc02538f-9460-4cbb-9ae4-194412b85e36@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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

On 02/12/24 at 07:27pm, Sourabh Jain wrote:
> Hello Baoquan,
> 
> On 05/02/24 08:40, Baoquan He wrote:
> > Hi Sourabh,
> > 
......
> > > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> > > index 802052d9c64b..7880d74dc5c4 100644
> > > --- a/include/linux/kexec.h
> > > +++ b/include/linux/kexec.h
> > > @@ -317,8 +317,8 @@ struct kimage {
> > >   	/* If set, we are using file mode kexec syscall */
> > >   	unsigned int file_mode:1;
> > >   #ifdef CONFIG_CRASH_HOTPLUG
> > > -	/* If set, allow changes to elfcorehdr of kexec_load'd image */
> > > -	unsigned int update_elfcorehdr:1;
> > > +	/* If set, allow changes to kexec segments of kexec_load'd image */
> > The code comment doesn't reflect the usage of the flag.
> I should have updated the comment to indicate that this flag is for both
> system calls.
> More comments below.
> 
> > You set it too
> > when it's kexec_file_load. Speaking of this, I do wonder why you need
> > set it too for kexec_file_load,
> If we do this one can just access image->hotplug_support to find hotplug
> support for currently loaded kdump image without bothering about which
> system call was used to load the kdump image.
> 
> > and why we have
> > arch_crash_hotplug_support(), then crash_check_hotplug_support() both of
> > which have the same effect.
> 
> arch_crash_hotplug_support(): This function processes the kexec flags and
> finds the
> hotplug support for the kdump image. Based on the return value of this
> function,
> the image->hotplug_support attribute is set.
> 
> Now, once the kdump image is loaded, we no longer have access to the kexec
> flags.
> Therefore, crash_check_hotplug_support simply returns the value of
> image->hotplug_support
> when user space accesses the following sysfs files:
> /sys/devices/system/[cpu|memory]/crash_hotplug.
> 
> To keep things simple, I have introduced two functions: One function
> processes the kexec flags
> and determines the hotplug support for the image being loaded. And other
> function simply
> accesses image->hotplug_support and advertises CPU/Memory hotplug support to
> userspace.

From the function name and their functionality, they seems to be
duplicated, even though it's different from the internal detail. This
could bring a little confusion to code understanding. It's fine, we can
refactor them if needed in the future. So let's keep it as the patch is.
Thanks.

> 
> > 
> > > +	unsigned int hotplug_support:1;
> > >   #endif
> > >   #ifdef ARCH_HAS_KIMAGE_ARCH
> > > @@ -396,9 +396,10 @@ bool kexec_load_permitted(int kexec_image_type);
> > >   /* List of defined/legal kexec flags */
> > >   #ifndef CONFIG_KEXEC_JUMP
> > > -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
> > > +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_CRASH_HOTPLUG_SUPPORT)
> > >   #else
> > > -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
> > > +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
> > > +			KEXEC_CRASH_HOTPLUG_SUPPORT)
> > >   #endif
> > >   /* List of defined/legal kexec file flags */
> > > @@ -486,14 +487,18 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
> > >   static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
> > >   #endif
> > > -int crash_check_update_elfcorehdr(void);
> > > +int crash_check_hotplug_support(void);
> > > -#ifndef crash_hotplug_cpu_support
> > > -static inline int crash_hotplug_cpu_support(void) { return 0; }
> > > -#endif
> > > +#ifndef arch_crash_hotplug_support
> > > +static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
> > > +{
> > > -#ifndef crash_hotplug_memory_support
> > > -static inline int crash_hotplug_memory_support(void) { return 0; }
> > > +#ifdef CONFIG_KEXEC_FILE
> > > +	if (image->file_mode)
> > > +		return 1;
> > > +#endif
> > > +	return kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT;
> > > +}
> > >   #endif
> > >   #ifndef crash_get_elfcorehdr_size
......

