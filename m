Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA5790AB4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Sep 2023 05:37:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bT4aIbls;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bT4aIbls;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rdcsr4bgQz3c5L
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Sep 2023 13:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bT4aIbls;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bT4aIbls;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rdcrv3BmKz2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Sep 2023 13:37:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693712218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKtB7jxT4Cb7Dh6mDUeRnvr1QZkonAikTMNrLOlN9ng=;
	b=bT4aIblsPocoiC0BNgfTqZpHACU5/bEkYdTaFnyemD7FGu1bcIZtz/jYX21SRXOybrTlFT
	+juGmuWT+2t+JmzEmMwziJy3DWGD3Hyg6QY1iXa+1wVpFEAAsxstsuHZB1geKmlbA+xRby
	yvM5h26/qWtGoPlDjYWn/B5NwFg0awk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693712218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKtB7jxT4Cb7Dh6mDUeRnvr1QZkonAikTMNrLOlN9ng=;
	b=bT4aIblsPocoiC0BNgfTqZpHACU5/bEkYdTaFnyemD7FGu1bcIZtz/jYX21SRXOybrTlFT
	+juGmuWT+2t+JmzEmMwziJy3DWGD3Hyg6QY1iXa+1wVpFEAAsxstsuHZB1geKmlbA+xRby
	yvM5h26/qWtGoPlDjYWn/B5NwFg0awk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-2R5AotwnOH2WWaOhBKVgZA-1; Sat, 02 Sep 2023 23:36:54 -0400
X-MC-Unique: 2R5AotwnOH2WWaOhBKVgZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2BE610264C1;
	Sun,  3 Sep 2023 03:36:53 +0000 (UTC)
Received: from localhost (unknown [10.72.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F260D4781C;
	Sun,  3 Sep 2023 03:36:52 +0000 (UTC)
Date: Sun, 3 Sep 2023 11:36:49 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 1/2] vmcore: allow alternate dump capturing methods to
 export vmcore without is_kdump_kernel()
Message-ID: <ZPP/UeP1zUbGPzrt@MiWiFi-R3L-srv>
References: <20230901190438.375678-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901190438.375678-1-hbathini@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Hi Hari,

On 09/02/23 at 12:34am, Hari Bathini wrote:
> Currently, is_kdump_kernel() returns true when elfcorehdr_addr is set.
> While elfcorehdr_addr is set for kexec based kernel dump mechanism,
> alternate dump capturing methods like fadump [1] also set it to export
> the vmcore. is_kdump_kernel() is used to restrict resources in crash
> dump capture kernel but such restrictions may not be desirable for
> fadump. Allow is_kdump_kernel() to be defined differently for such
> scenarios. With this, is_kdump_kernel() could be false while vmcore
> is usable. So, introduce is_crashdump_kernel() to return true when
> elfcorehdr_addr is set and use it for vmcore related checks.

I got what is done in these two patches, but didn't get why they need be
done. vmcore_unusable()/is_vmcore_usable() are only unitilized in ia64.
Why do you care if it's is_crashdump_kernel() or is_kdump_kernel()?
If you want to override the generic is_kdump_kernel() with powerpc's own
is_kdump_kernel(), your below change is enough to allow you to do that.
I can't see why is_crashdump_kernel() is needed. Could you explain that
specifically?

#ifndef is_kdump_kernel
static inline bool is_kdump_kernel(void)
{
        return elfcorehdr_addr != ELFCORE_ADDR_MAX;
}
#endif

Thanks
Baoquan

> [1] https://docs.kernel.org/powerpc/firmware-assisted-dump.html
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  include/linux/crash_dump.h | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
> index 0f3a656293b0..1052a0faf0dd 100644
> --- a/include/linux/crash_dump.h
> +++ b/include/linux/crash_dump.h
> @@ -50,6 +50,7 @@ void vmcore_cleanup(void);
>  #define vmcore_elf64_check_arch(x) (elf_check_arch(x) || vmcore_elf_check_arch_cross(x))
>  #endif
>  
> +#ifndef is_kdump_kernel
>  /*
>   * is_kdump_kernel() checks whether this kernel is booting after a panic of
>   * previous kernel or not. This is determined by checking if previous kernel
> @@ -64,6 +65,19 @@ static inline bool is_kdump_kernel(void)
>  {
>  	return elfcorehdr_addr != ELFCORE_ADDR_MAX;
>  }
> +#endif
> +
> +/*
> + * Return true if this is a dump capture kernel, where vmcore needs to be
> + * exported, irrespective of the dump capture mechanism in use.
> + *
> + * Same as is_kdump_kernel() unless arch specific code defines is_kdump_kernel()
> + * differently while supporting other dump capturing mechanisms.
> + */
> +static inline bool is_crashdump_kernel(void)
> +{
> +	return elfcorehdr_addr != ELFCORE_ADDR_MAX;
> +}
>  
>  /* is_vmcore_usable() checks if the kernel is booting after a panic and
>   * the vmcore region is usable.
> @@ -75,7 +89,7 @@ static inline bool is_kdump_kernel(void)
>  
>  static inline int is_vmcore_usable(void)
>  {
> -	return is_kdump_kernel() && elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
> +	return is_crashdump_kernel() && elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
>  }
>  
>  /* vmcore_unusable() marks the vmcore as unusable,
> @@ -84,7 +98,7 @@ static inline int is_vmcore_usable(void)
>  
>  static inline void vmcore_unusable(void)
>  {
> -	if (is_kdump_kernel())
> +	if (is_crashdump_kernel())
>  		elfcorehdr_addr = ELFCORE_ADDR_ERR;
>  }
>  
> -- 
> 2.41.0
> 

