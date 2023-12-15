Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECB813FC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 03:29:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OrtLybnX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrtTs6nnGz3dLR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 13:29:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OrtLybnX;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrtT21vxSz3cLk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 13:29:10 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SrtSx4xJcz4wdB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 13:29:05 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SrtSx4lTPz4wqN; Fri, 15 Dec 2023 13:29:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OrtLybnX;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SrtSx1Vhtz4wdB
	for <linuxppc-dev@ozlabs.org>; Fri, 15 Dec 2023 13:29:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702607341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xiQyckJTwnqYOVFcTln1GExvRHz6Chm9H/hFawrpLu4=;
	b=OrtLybnXIhogrjFcYFKOwQb3F1t9TkkM+cP7DFE6k5tB0eQIOWpn0e5ZDsOVzDUYFlgS9q
	q6t3eDe070er76ff352a5+9XbZCItYGKQdwgnITa6Pr32rpHa3lXjddAguPK0kBQRPuytH
	mIp2U5zVf8nDoFrKZ6GX/P3PJK2nOsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-_ekwzBs_NQC2U-Afnm6wqA-1; Thu, 14 Dec 2023 21:28:58 -0500
X-MC-Unique: _ekwzBs_NQC2U-Afnm6wqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DB13881B6B;
	Fri, 15 Dec 2023 02:28:57 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E298E2166B31;
	Fri, 15 Dec 2023 02:28:55 +0000 (UTC)
Date: Fri, 15 Dec 2023 10:28:53 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v14 3/6] crash: add a new kexec flag for FDT update
Message-ID: <ZXu55ZXVSMeQDE/e@MiWiFi-R3L-srv>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-4-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20231211083056.340404-4-sourabhjain@linux.ibm.com>
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

On 12/11/23 at 02:00pm, Sourabh Jain wrote:
> The commit a72bbec70da2 ("crash: hotplug support for kexec_load()")
> introduced a new kexec flag, `KEXEC_UPDATE_ELFCOREHDR`. Kexec tool uses
> this flag to indicate kernel that it is safe to modify the elfcorehdr
> of kdump image loaded using kexec_load system call.
> 
> Similarly, add a new kexec flag, `KEXEC_UPDATE_FDT`, for another kdump
> component named FDT (Flatten Device Tree). Architectures like PowerPC
> need to update FDT kdump image component on CPU hotplug events. Kexec
> tool passing `KEXEC_UPDATE_FDT` will be an indication to kernel that FDT
> segment is not part of SHA calculation hence it is safe to update it.
> 
> With the `KEXEC_UPDATE_ELFCOREHDR` and `KEXEC_UPDATE_FDT` kexec flags,
> crash hotplug support can be added to PowerPC for the kexec_load syscall
> while maintaining the backward compatibility with older kexec tools that
> do not have these newly introduced flags.
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
>  include/linux/kexec.h      | 6 ++++--
>  include/uapi/linux/kexec.h | 1 +
>  kernel/kexec.c             | 2 ++
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 0f6ea35879ee..bcedb7625b1f 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -319,6 +319,7 @@ struct kimage {
>  #ifdef CONFIG_CRASH_HOTPLUG
>  	/* If set, allow changes to elfcorehdr of kexec_load'd image */
>  	unsigned int update_elfcorehdr:1;
> +	unsigned int update_fdt:1;

Can we unify this to one flag, e.g hotplug_update?

With this, on x86_64, we will skip the sha calculation for elfcorehdr. 
On ppc, we will skip the sha calculation for elfcorehdr and fdt.

>  #endif
>  
>  #ifdef ARCH_HAS_KIMAGE_ARCH
> @@ -396,9 +397,10 @@ bool kexec_load_permitted(int kexec_image_type);
>  
>  /* List of defined/legal kexec flags */
>  #ifndef CONFIG_KEXEC_JUMP
> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_UPDATE_FDT)
>  #else
> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
> +			KEXEC_UPDATE_FDT)
>  #endif
>  
>  /* List of defined/legal kexec file flags */
> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> index 01766dd839b0..3d5b3d757bed 100644
> --- a/include/uapi/linux/kexec.h
> +++ b/include/uapi/linux/kexec.h
> @@ -13,6 +13,7 @@
>  #define KEXEC_ON_CRASH		0x00000001
>  #define KEXEC_PRESERVE_CONTEXT	0x00000002
>  #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
> +#define KEXEC_UPDATE_FDT	0x00000008
>  #define KEXEC_ARCH_MASK		0xffff0000
>  
>  /*
> diff --git a/kernel/kexec.c b/kernel/kexec.c
> index 8f35a5a42af8..97eb151cd931 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -132,6 +132,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>  #ifdef CONFIG_CRASH_HOTPLUG
>  	if (flags & KEXEC_UPDATE_ELFCOREHDR)
>  		image->update_elfcorehdr = 1;
> +	if (flags & KEXEC_UPDATE_FDT)
> +		image->update_fdt = 1;
>  #endif
>  
>  	ret = machine_kexec_prepare(image);
> -- 
> 2.41.0
> 

