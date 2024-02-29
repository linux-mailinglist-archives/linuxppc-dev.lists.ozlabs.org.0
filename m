Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75486C280
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 08:29:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iu4esop8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TljXh2DG4z3vZQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 18:29:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iu4esop8;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TljWx53d3z3c4V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 18:29:01 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TljWs42HNz4wyh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 18:28:57 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TljWs3kdhz4wyj; Thu, 29 Feb 2024 18:28:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iu4esop8;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TljWs0Hrlz4wyh
	for <linuxppc-dev@ozlabs.org>; Thu, 29 Feb 2024 18:28:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709191734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WjeQ56VOGA1WFtppcigJ9UXKw4JH8chQbvOVc59Qmq8=;
	b=Iu4esop8cxdikkUKrxR7JVXwV1ggdPbmp4+3d/uw0PUtvEUeD9i0X4pqGMHWyuXBcF8LBV
	PULejgnUXIXk9QreBOSJ6Ngfgqur0nheVrW6vqWbyMcItDUVdy45ev5T9lvGsHGKbkFo6B
	qCUhhPgO+J6alfu3OXnUkyxDUFIPXes=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-IYV0fPyPMAusx3-Xnse5iw-1; Thu, 29 Feb 2024 02:28:48 -0500
X-MC-Unique: IYV0fPyPMAusx3-Xnse5iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C441784AC61;
	Thu, 29 Feb 2024 07:28:47 +0000 (UTC)
Received: from localhost (unknown [10.72.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C1740C6EBA;
	Thu, 29 Feb 2024 07:28:45 +0000 (UTC)
Date: Thu, 29 Feb 2024 15:28:42 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v17 2/6] crash: add a new kexec flag for hotplug support
Message-ID: <ZeAyKj5b2HN90ija@MiWiFi-R3L-srv>
References: <20240226084118.16310-1-sourabhjain@linux.ibm.com>
 <20240226084118.16310-3-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20240226084118.16310-3-sourabhjain@linux.ibm.com>
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

On 02/26/24 at 02:11pm, Sourabh Jain wrote:
......snip...
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 70fa8111a9d6..630c4fd7ea39 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -496,7 +496,7 @@ static DEFINE_MUTEX(__crash_hotplug_lock);
>   * It reflects the kernel's ability/permission to update the crash
>   * elfcorehdr directly.
     ~~~~~~~~~ this should be updated too.

>   */
> -int crash_check_update_elfcorehdr(void)
> +int crash_check_hotplug_support(void)
>  {
>  	int rc = 0;
>  
> @@ -508,10 +508,7 @@ int crash_check_update_elfcorehdr(void)
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
> @@ -552,8 +549,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
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
> index bab542fc1463..a6b3f96bb50c 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -135,8 +135,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
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
> index 2d1db05fbf04..3d64290d24c9 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -376,6 +376,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
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

Other than the tiny part, the overall looks good to me.

Acked-by: Baoquan He <bhe@redhat.com>

