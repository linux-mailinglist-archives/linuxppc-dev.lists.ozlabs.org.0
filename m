Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FFD8492AD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 04:12:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aumSkNHI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSrzG5JK8z3cPR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 14:12:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aumSkNHI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSryS4lGVz2ykx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 14:12:00 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TSryS4Gg4z4wxZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 14:12:00 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TSryS48Mnz4wxx; Mon,  5 Feb 2024 14:12:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aumSkNHI;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TSryS0Mzcz4wxZ
	for <linuxppc-dev@ozlabs.org>; Mon,  5 Feb 2024 14:11:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707102716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPlQn8QRfP3g8CtVKZqx50P9JlBCXuNtPZrwY21Ifzk=;
	b=aumSkNHIa57yzK1sGlTse32mqWWCa5Fe1RJny1Cq7sP59HguSDJFVZ6K8ii0Gg23gaeV3S
	+oMvZaloj2SBu+9ddzWUBwEhZn0LHjGgP0eL46PkP3xA44ol0pHD7q0VxrI+BPAyqSSKAZ
	va+2C+SsGChSEVSITjhQiGxqMYB4hC4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-zIxkvvPQNnahi-68DSb0bg-1; Sun,
 04 Feb 2024 22:11:52 -0500
X-MC-Unique: zIxkvvPQNnahi-68DSb0bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC5C51C05AD1;
	Mon,  5 Feb 2024 03:11:49 +0000 (UTC)
Received: from localhost (unknown [10.72.116.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E17B32026D66;
	Mon,  5 Feb 2024 03:11:48 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:11:45 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v15 1/5] crash: forward memory_notify arg to arch crash
 hotplug handler
Message-ID: <ZcBR8Q+/WL3luZnP@MiWiFi-R3L-srv>
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
 <20240111105138.251366-2-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20240111105138.251366-2-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/11/24 at 04:21pm, Sourabh Jain wrote:
> In the event of memory hotplug or online/offline events, the crash
> memory hotplug notifier `crash_memhp_notifier()` receives a
> `memory_notify` object but doesn't forward that object to the
> generic and architecture-specific crash hotplug handler.
> 
> The `memory_notify` object contains the starting PFN (Page Frame Number)
> and the number of pages in the hot-removed memory. This information is
> necessary for architectures like PowerPC to update/recreate the kdump
> image, specifically `elfcorehdr`.
> 
> So update the function signature of `crash_handle_hotplug_event()` and
> `arch_crash_handle_hotplug_event()` to accept the `memory_notify` object
> as an argument from crash memory hotplug notifier.
> 
> Since no such object is available in the case of CPU hotplug event, the
> crash CPU hotplug notifier `crash_cpuhp_online()` passes NULL to the
> crash hotplug handler.
> 
......
> ---
>  arch/x86/include/asm/kexec.h |  2 +-
>  arch/x86/kernel/crash.c      |  3 ++-
>  include/linux/kexec.h        |  2 +-
>  kernel/crash_core.c          | 14 +++++++-------
>  4 files changed, 11 insertions(+), 10 deletions(-)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index c9f6a6c5de3c..9bb6607e864e 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -208,7 +208,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image);
>  extern void kdump_nmi_shootdown_cpus(void);
>  
>  #ifdef CONFIG_CRASH_HOTPLUG
> -void arch_crash_handle_hotplug_event(struct kimage *image);
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>  #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index b6b044356f1b..44744e9c68ec 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -428,10 +428,11 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
>  /**
>   * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
>   * @image: a pointer to kexec_crash_image
> + * @arg: struct memory_notify handler for memory hotplug case and NULL for CPU hotplug case.
>   *
>   * Prepare the new elfcorehdr and replace the existing elfcorehdr.
>   */
> -void arch_crash_handle_hotplug_event(struct kimage *image)
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  {
>  	void *elfbuf = NULL, *old_elfcorehdr;
>  	unsigned long nr_mem_ranges;
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 400cb6c02176..802052d9c64b 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -483,7 +483,7 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
>  #endif
>  
>  #ifndef arch_crash_handle_hotplug_event
> -static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
> +static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>  #endif
>  
>  int crash_check_update_elfcorehdr(void);
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index d48315667752..ab1c8e79759d 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -914,7 +914,7 @@ int crash_check_update_elfcorehdr(void)
>   * list of segments it checks (since the elfcorehdr changes and thus
>   * would require an update to purgatory itself to update the digest).
>   */
> -static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
> +static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>  {
>  	struct kimage *image;
>  
> @@ -976,7 +976,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>  	image->hp_action = hp_action;
>  
>  	/* Now invoke arch-specific update handler */
> -	arch_crash_handle_hotplug_event(image);
> +	arch_crash_handle_hotplug_event(image, arg);
>  
>  	/* No longer handling a hotplug event */
>  	image->hp_action = KEXEC_CRASH_HP_NONE;
> @@ -992,17 +992,17 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>  	crash_hotplug_unlock();
>  }
>  
> -static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *v)
> +static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *arg)
>  {
>  	switch (val) {
>  	case MEM_ONLINE:
>  		crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY,
> -			KEXEC_CRASH_HP_INVALID_CPU);
> +			KEXEC_CRASH_HP_INVALID_CPU, arg);
>  		break;
>  
>  	case MEM_OFFLINE:
>  		crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY,
> -			KEXEC_CRASH_HP_INVALID_CPU);
> +			KEXEC_CRASH_HP_INVALID_CPU, arg);
>  		break;
>  	}
>  	return NOTIFY_OK;
> @@ -1015,13 +1015,13 @@ static struct notifier_block crash_memhp_nb = {
>  
>  static int crash_cpuhp_online(unsigned int cpu)
>  {
> -	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu);
> +	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu, NULL);
>  	return 0;
>  }
>  
>  static int crash_cpuhp_offline(unsigned int cpu)
>  {
> -	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu);
> +	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu, NULL);
>  	return 0;
>  }
>  
> -- 
> 2.41.0
> 

