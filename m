Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1079F9A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 06:42:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+5zUEQo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+5zUEQo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmPnq3Bjzz3cN2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 14:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+5zUEQo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+5zUEQo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmPmt3Ydfz3c1Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 14:42:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694666523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gXhGZ4r4I1glj6Lql+/mnOOXVMF05GnccbGV18evrsY=;
	b=K+5zUEQogYscLEUlPaKLVuZ4byc42JQmAb+6JA0bXdECdBgjE/KG7O3ac8Di6Iy93wTgTe
	sTJIXISHihBKJs/O4wgO9iA5U/ZPkA3FeUfEGpd61AJIJw/iANwgjs1RnLkSJFlLpAQ6Kz
	vN1MRgTVhm2zc5+SNkuEYGJrTXWaK/M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694666523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gXhGZ4r4I1glj6Lql+/mnOOXVMF05GnccbGV18evrsY=;
	b=K+5zUEQogYscLEUlPaKLVuZ4byc42JQmAb+6JA0bXdECdBgjE/KG7O3ac8Di6Iy93wTgTe
	sTJIXISHihBKJs/O4wgO9iA5U/ZPkA3FeUfEGpd61AJIJw/iANwgjs1RnLkSJFlLpAQ6Kz
	vN1MRgTVhm2zc5+SNkuEYGJrTXWaK/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-Y8Vp1GdGOnaFVVQXkIOowA-1; Thu, 14 Sep 2023 00:41:58 -0400
X-MC-Unique: Y8Vp1GdGOnaFVVQXkIOowA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 086B2101A529;
	Thu, 14 Sep 2023 04:41:58 +0000 (UTC)
Received: from localhost (unknown [10.72.112.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01CD92026D4B;
	Thu, 14 Sep 2023 04:41:56 +0000 (UTC)
Date: Thu, 14 Sep 2023 12:41:53 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] powerpc/fadump: make is_kdump_kernel() return
 false when fadump is active
Message-ID: <ZQKPEd09+XvnQ5RN@MiWiFi-R3L-srv>
References: <20230912082950.856977-1-hbathini@linux.ibm.com>
 <20230912082950.856977-2-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912082950.856977-2-hbathini@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/12/23 at 01:59pm, Hari Bathini wrote:
> Currently, is_kdump_kernel() returns true in crash dump capture kernel
> for both kdump and fadump crash dump capturing methods, as both these
> methods set elfcorehdr_addr. Some restrictions enforced for crash dump
> capture kernel, based on is_kdump_kernel(), are specifically meant for
> kdump case and not desirable for fadump - eg. IO queues restriction in
> device drivers. So, define is_kdump_kernel() to return false when f/w
> assisted dump is active.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kexec.h |  8 ++++++--
>  arch/powerpc/kernel/crash_dump.c | 12 ++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index a1ddba01e7d1..e1b43aa12175 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -99,10 +99,14 @@ void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_co
>  
>  void kexec_copy_flush(struct kimage *image);
>  
> -#if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
> +#if defined(CONFIG_CRASH_DUMP)
> +bool is_kdump_kernel(void);
> +#define is_kdump_kernel			is_kdump_kernel
> +#if defined(CONFIG_PPC_RTAS)
>  void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
>  #define crash_free_reserved_phys_range crash_free_reserved_phys_range
> -#endif
> +#endif /* CONFIG_PPC_RTAS */
> +#endif /* CONFIG_CRASH_DUMP */
>  
>  #ifdef CONFIG_KEXEC_FILE
>  extern const struct kexec_file_ops kexec_elf64_ops;
> diff --git a/arch/powerpc/kernel/crash_dump.c b/arch/powerpc/kernel/crash_dump.c
> index 9a3b85bfc83f..2086fa6cdc25 100644
> --- a/arch/powerpc/kernel/crash_dump.c
> +++ b/arch/powerpc/kernel/crash_dump.c
> @@ -19,6 +19,7 @@
>  #include <linux/uio.h>
>  #include <asm/rtas.h>
>  #include <asm/inst.h>
> +#include <asm/fadump.h>
>  
>  #ifdef DEBUG
>  #include <asm/udbg.h>
> @@ -92,6 +93,17 @@ ssize_t copy_oldmem_page(struct iov_iter *iter, unsigned long pfn,
>  	return csize;
>  }
>  
> +/*
> + * Return true only when kexec based kernel dump capturing method is used.
> + * This ensures all restritions applied for kdump case are not automatically
> + * applied for fadump case.
> + */
> +bool is_kdump_kernel(void)
> +{
> +	return !is_fadump_active() && elfcorehdr_addr != ELFCORE_ADDR_MAX;
> +}
> +EXPORT_SYMBOL_GPL(is_kdump_kernel);
> +
>  #ifdef CONFIG_PPC_RTAS
>  /*
>   * The crashkernel region will almost always overlap the RTAS region, so
> -- 
> 2.41.0
> 

